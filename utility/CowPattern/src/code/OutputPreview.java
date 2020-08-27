package code;

import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;

public class OutputPreview extends JFrame
{
    private final CowPatternGenerator listener;

    private final BufferedImage[] images;

    private int currentImageIndex;

    private JLabel imageContainer;

    public OutputPreview(CowPatternGenerator listener, BufferedImage[] images)
    {
        this.listener = listener;
        this.images = images;

        currentImageIndex = 0;

        this.setLayout(new BorderLayout());
        this.setTitle("Preview");
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        initComponents();

        this.pack();
        this.setLocationRelativeTo(null);
        this.setVisible(true);
    }

    private void initComponents()
    {
        imageContainer = new JLabel(new ImageIcon(images[0]));
        this.add(imageContainer, BorderLayout.CENTER);

        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 30, 0));

        JButton prevImageButton = new JButton("Prev");
        prevImageButton.addActionListener(e -> {
            if(currentImageIndex > 0)
            {
                currentImageIndex--;
                changeImage(currentImageIndex);
            }
        });
        buttonPanel.add(prevImageButton);

        JButton nextImageButton = new JButton("Next");
        nextImageButton.addActionListener(e -> {
            if(currentImageIndex < (images.length - 1))
            {
                currentImageIndex++;
                changeImage(currentImageIndex);
            }
        });
        buttonPanel.add(nextImageButton);

        JButton exportDataSetButton = new JButton("Export");
        exportDataSetButton.addActionListener(e -> listener.saveToDisk(images));
        buttonPanel.add(exportDataSetButton);

        JButton cancelButton = new JButton("Cancel");
        cancelButton.addActionListener(e -> this.dispose());
        buttonPanel.add(cancelButton);

        this.add(buttonPanel, BorderLayout.PAGE_END);
    }

    private void changeImage(int imageIndex)
    {
        imageContainer.setIcon(new ImageIcon(images[imageIndex]));
    }

}
