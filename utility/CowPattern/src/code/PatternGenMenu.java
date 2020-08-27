package code;

import code.fastnoise.FastNoise;

import javax.swing.*;
import java.awt.*;

public class PatternGenMenu extends JPanel
{

    private final CowPatternGenerator listener;

    private int imageWidth;
    private int imageHeight;
    private int seed;
    private float frequency;
    private float binaryThreshold;
    private FastNoise.NoiseType noiseType;

    private JTextField widthField;
    private JTextField heightField;
    private JTextField seedField;
    private JTextField frequencyField;
    private JTextField binaryThresholdField;

    private JComboBox<FastNoise.NoiseType> noiseTypePicker;

    public PatternGenMenu(CowPatternGenerator listener)
    {
        this.listener = listener;

        this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

        imageWidth = 512;
        imageHeight = 512;
        seed = 1337;
        frequency = 0.01f;
        binaryThreshold = 0.4f;
        noiseType = FastNoise.NoiseType.Perlin;

        initComponents();
    }

    private void initComponents()
    {
        JLabel widthLabel = new JLabel("Width");
        widthField = new JTextField();
        widthField.setText("" + imageWidth);
        widthField.setPreferredSize(new Dimension(150, 30));
        this.add(widthLabel);
        this.add(widthField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel heightLabel = new JLabel("Height");
        heightField = new JTextField();
        heightField.setText("" + imageHeight);
        heightField.setPreferredSize(new Dimension(150, 30));
        this.add(heightLabel);
        this.add(heightField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel noiseTypePickerLabel = new JLabel("Binary Threshold");
        noiseTypePicker = new JComboBox<>(FastNoise.NoiseType.values());
        noiseTypePicker.setAlignmentX(Component.LEFT_ALIGNMENT);
        noiseTypePicker.setSelectedItem(noiseType);
        this.add(noiseTypePickerLabel);
        this.add(noiseTypePicker);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel seedLabel = new JLabel("Seed");
        seedField = new JTextField();
        seedField.setText("" + seed);
        seedField.setPreferredSize(new Dimension(150, 30));
        this.add(seedLabel);
        this.add(seedField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel frequencyLabel = new JLabel("Frequency");
        frequencyField = new JTextField();
        frequencyField.setText("" + frequency);
        frequencyField.setPreferredSize(new Dimension(150, 30));
        this.add(frequencyLabel);
        this.add(frequencyField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel binaryThresholdLabel = new JLabel("Binary Threshold");
        binaryThresholdField = new JTextField();
        binaryThresholdField.setText("" + binaryThreshold);
        binaryThresholdField.setPreferredSize(new Dimension(150, 30));
        this.add(binaryThresholdLabel);
        this.add(binaryThresholdField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JButton redrawButton = new JButton("Redraw");
        redrawButton.addActionListener(e -> {
            updateValues();
            listener.update();
        });
        this.add(redrawButton);
    }

    private void updateValues()
    {
        imageWidth = Integer.parseInt(widthField.getText());
        imageHeight = Integer.parseInt(heightField.getText());
        seed = Integer.parseInt(seedField.getText());
        frequency = Float.parseFloat(frequencyField.getText());
        binaryThreshold = Float.parseFloat(binaryThresholdField.getText());

        noiseType = (FastNoise.NoiseType) noiseTypePicker.getSelectedItem();
    }

    public int getImageWidth()
    {
        return imageWidth;
    }

    public int getImageHeight()
    {
        return imageHeight;
    }

    public int getSeed()
    {
        return seed;
    }

    public float getFrequency()
    {
        return frequency;
    }

    public float getBinaryThreshold()
    {
        return binaryThreshold;
    }

    public FastNoise.NoiseType getNoiseType()
    {
        return noiseType;
    }

}
