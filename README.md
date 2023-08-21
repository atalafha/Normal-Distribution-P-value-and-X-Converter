# Normal-Distribution-P-value-and-X-Converter

This Shiny app provides a visual and interactive tool to convert between **X values** and **p-values** in a normal distribution. Users can input the parameters for a normal distribution (mean and standard deviation) and then either:

1. Input an X value to find the corresponding p-value.
2. Input a p-value to find the corresponding X value.

The output includes a visualization of the normal distribution with the relevant area under the curve shaded based on the X or p-value input.

## Features

- **Dynamic Visualization**: See the shaded area under the curve of the normal distribution in real-time as you adjust input values.
- **X to P-value Conversion**: Input X value, mean, and standard deviation to obtain the corresponding p-value.
- **P-value to X Conversion**: Input p-value, mean, and standard deviation to obtain the corresponding X value.

## Prerequisites

You need to have `shiny` and `ggplot2` packages installed in R. You can install them using:

```R
install.packages("shiny")
install.packages("ggplot2")
```

## How to Run

- Clone this repository or download the app.R file.
- Open the file in RStudio.
- Run the entire script.
- The Shiny app will open in a new window, or you can open it in a browser.
