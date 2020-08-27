package code;

import javax.swing.*;
import java.awt.*;

public class DataSetGenMenu extends JPanel
{

    private final CowPatternGenerator listener;

    private String outputDir;
    private int dataSetSize;
    private float maxRotate;
    private float maxOffset;
    private float maxShear;

    private JTextField outputDirField;
    private JTextField dataSetSizeField;

    private JTextField maxRotateField;
    private JTextField maxScaleField;
    private JTextField maxShearField;

    public DataSetGenMenu(CowPatternGenerator listener)
    {
        this.listener = listener;

        this.setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));

        outputDir = "c:\\dev\\cow_id\\datasets";
        dataSetSize = 1;
        maxRotate = 0.0f;
        maxOffset = 0.0f;
        maxShear = 0.0f;

        initComponents();
    }

    private void initComponents()
    {
        JLabel outputDirLabel = new JLabel("Output Directory");
        outputDirField = new JTextField();
        outputDirField.setText(outputDir);
        outputDirField.setPreferredSize(new Dimension(150, 30));
        this.add(outputDirLabel);
        this.add(outputDirField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel dataSetSizeLabel = new JLabel("Data Set Size");
        dataSetSizeField = new JTextField();
        dataSetSizeField.setText("" + dataSetSize);
        dataSetSizeField.setPreferredSize(new Dimension(150, 30));
        this.add(dataSetSizeLabel);
        this.add(dataSetSizeField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel maxRotateLabel = new JLabel("Max Rotate");
        maxRotateField = new JTextField();
        maxRotateField.setText("" + maxRotate);
        maxRotateField.setPreferredSize(new Dimension(150, 30));
        this.add(maxRotateLabel);
        this.add(maxRotateField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel maxOffsetLabel = new JLabel("Max Offset(-/+)");
        maxScaleField = new JTextField();
        maxScaleField.setText("" + maxOffset);
        maxScaleField.setPreferredSize(new Dimension(150, 30));
        this.add(maxOffsetLabel);
        this.add(maxScaleField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JLabel maxShearLabel = new JLabel("Max Shear(-/+)");
        maxShearField = new JTextField();
        maxShearField.setText("" + maxShear);
        maxShearField.setPreferredSize(new Dimension(150, 30));
        this.add(maxShearLabel);
        this.add(maxShearField);

        this.add(Box.createRigidArea(new Dimension(0, 15)));

        JButton exportButton = new JButton("Export(-/+)");
        exportButton.addActionListener(e -> {
            updateValues();
            listener.export();
        });
        this.add(exportButton);
    }

    private void updateValues()
    {
        outputDir = outputDirField.getText();
        dataSetSize = Integer.parseInt(dataSetSizeField.getText());
        maxRotate = Float.parseFloat(maxRotateField.getText());
        maxOffset = Float.parseFloat(maxScaleField.getText());
        maxShear = Float.parseFloat(maxShearField.getText());
    }

    public String getOutputDir()
    {
        return outputDir;
    }

    public int getDataSetSize()
    {
        return dataSetSize;
    }

    public float getMaxRotate()
    {
        return maxRotate;
    }

    public float getMaxOffset()
    {
        return maxOffset;
    }

    public float getMaxShear()
    {
        return maxShear;
    }
}
