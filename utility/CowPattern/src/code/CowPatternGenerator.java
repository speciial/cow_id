package code;

import code.fastnoise.FastNoise;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class CowPatternGenerator
{
    private final FastNoise noise;

    private final JFrame frame;

    private final JLabel displayImage;
    private BufferedImage displayPreview;
    private BufferedImage baseImage;

    private final PatternGenMenu patternGenMenu;
    private final DataSetGenMenu dataSetGenMenu;

    public CowPatternGenerator()
    {
        frame = new JFrame("Cow Pattern Generator");
        frame.setLayout(new FlowLayout());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        noise = new FastNoise();

        patternGenMenu = new PatternGenMenu(this);
        frame.add(patternGenMenu);

        displayPreview = createNoiseImage();

        displayImage = new JLabel(new ImageIcon(displayPreview));
        frame.add(displayImage);

        dataSetGenMenu = new DataSetGenMenu(this);
        frame.add(dataSetGenMenu);

        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }


    private BufferedImage createNoiseImage()
    {
        int baseImageWidth = patternGenMenu.getImageWidth() * 2;
        int baseImageHeight = patternGenMenu.getImageHeight() * 2;

        baseImage = new BufferedImage(baseImageWidth, baseImageHeight, BufferedImage.TYPE_INT_RGB);
        noise.SetSeed(patternGenMenu.getSeed());
        noise.SetFrequency(patternGenMenu.getFrequency());
        noise.SetNoiseType(patternGenMenu.getNoiseType());

        for (int y = 0; y < baseImageHeight; y++)
        {
            for (int x = 0; x < baseImageWidth; x++)
            {
                float noiseValue = (noise.GetNoise((float) x, (float) y) + 1) / 2;

                if (noiseValue > patternGenMenu.getBinaryThreshold())
                {
                    noiseValue = 1;
                } else
                {
                    noiseValue = 0;
                }

                int colorValue = new Color(noiseValue, noiseValue, noiseValue).getRGB();
                baseImage.setRGB(x, y, colorValue);
            }
        }

        int x = patternGenMenu.getImageWidth() / 2;
        int y = patternGenMenu.getImageHeight() / 2;
        return baseImage.getSubimage(x, y, patternGenMenu.getImageWidth(), patternGenMenu.getImageHeight());
    }

    public void update()
    {
        displayPreview = createNoiseImage();
        displayImage.setIcon(new ImageIcon(displayPreview));

        frame.repaint();
        frame.pack();
    }

    public void export()
    {
        BufferedImage[] images = new BufferedImage[dataSetGenMenu.getDataSetSize()];

        for (int index = 0; index < dataSetGenMenu.getDataSetSize(); index++)
        {
            // random rotate, random shear, random offset

            float randomNumber = (float) Math.random();

            float randomAngle = dataSetGenMenu.getMaxRotate() * randomNumber;
            float randomShear = dataSetGenMenu.getMaxShear() * randomNumber;
            int randomXOffset = (int) (dataSetGenMenu.getMaxOffset() * randomNumber);
            int randomYOffset = (int) (dataSetGenMenu.getMaxOffset() * randomNumber);

            AffineTransform transform = new AffineTransform();
            transform.rotate(Math.toRadians(randomAngle), (float) patternGenMenu.getImageWidth(), (float) patternGenMenu.getImageHeight());
            transform.shear(randomShear, randomShear);

            AffineTransformOp op = new AffineTransformOp(transform, AffineTransformOp.TYPE_BILINEAR);

            int x = patternGenMenu.getImageWidth() / 2;
            int y = patternGenMenu.getImageHeight() / 2;
            BufferedImage img = op.filter(baseImage, null);

            images[index] = img.getSubimage(x + randomXOffset, y + randomYOffset, patternGenMenu.getImageWidth(), patternGenMenu.getImageHeight());
        }

        new OutputPreview(this, images);
    }

    public void saveToDisk(BufferedImage[] images)
    {
        try
        {
            for (int index = 0; index < images.length; index++)
            {
                File outputFile = new File(dataSetGenMenu.getOutputDir() + "\\" + index + ".png");

                if (outputFile.getParentFile().mkdirs())
                {
                    System.out.println("Directory created");
                }

                if (outputFile.createNewFile())
                {
                    ImageIO.write(images[index], "png", outputFile);
                }
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    public static void main(String[] args)
    {
        new CowPatternGenerator();
    }

}
