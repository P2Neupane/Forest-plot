library(ggplot2)

# Create the ggplot object
fp <- ggplot(data = N2O, aes(x = MES, y = factor(Factors, level = unique(Factors)), xmin = LCI, xmax = UCI)) +
  geom_point(size = 10, shape = 20) +
  scale_y_discrete(
    labels = c(
      expression('N'[2]),
      expression(N[2] * O / (N[2] * O + 'N'[2]))
    )
  ) +
  geom_errorbarh(height = 0, size = 2) +
  geom_vline(xintercept = 0, linetype = 2, size = 2) +
  theme_classic() +
  labs(
    x = "Change in %",
    y = "",
    title = "Forest Plot for N cycling genes"
  ) +
  theme(
    text = element_text(size = 30),
    axis.text = element_text(size = 30, color = "black"),
    axis.line.x.bottom = element_line(size = 2),
    axis.line.y = element_line(size = 2),
    panel.background = element_rect(colour = "black", linewidth = 2),
    axis.ticks = element_line(size = 2),
    axis.ticks.length = unit(0.07, "inches")
  ) +
  coord_cartesian(xlim = c(-50, 1800), ylim = c(1, 2)) +
  geom_text(aes(x = 1600, label = N), size = 10) +
  annotate("text", x = 1550, y = 2.5, label = "No. of observations", size = 10)

# Print the plot
print(fp)

# Save the plot as a JPEG file
ggsave("ratio.jpeg", width = 15.6, height = 9.44, dpi = 300)
