library(ggplot2)
n = c(1,2,3,4)
drug = c("d","r","c","h")
gen = c("Atg5+/+", "Atg5+/+", "Atg5+/+", "Atg5+/+")
p62 = c(0.250825785, 0.010364006, 0.288600764, 0.536395966)
sd = c(0.080666914, 0.001916934, 0.067757025, 0.116650394)

ann_text <- data.frame(n = 1,
                       drug = factor("r",levels = c("d","r","c","h")),p62 = 0.10, lab = "·")
ann_text1 <- data.frame(n = 1,
                        drug = factor("h",levels = c("d","r","c","h")),p62 = 0.75, lab = "·")


df = data.frame(n, drug, gen, p62, sd)
df$baf <- as.factor(df$gen)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$gen, levels = c(0,1), labels=c("+/+", "-/-"))
ggplot(df, aes(x=drug, y=p62, fill = drug)) + facet_wrap(~gen) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge(.9)) +
  geom_errorbar(aes(ymin=p62-sd, ymax=p62+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("p62/actin")+xlab("treatment")+ theme(legend.position = "none")+geom_text(data = ann_text,label = "**", size = 14)+geom_text(data = ann_text1,label = "·", size = 14)
library(ggplot2)
n = c(1,2,3,4)
drug = c("d","r","c","h")
gen = c("Atg5-/-", "Atg5-/-", "Atg5-/-", "Atg5-/-")
p62 = c(0.093335346, 0.152131529, 0.47042179, 0.544361273)
sd = c(0.048641558, 0.063196933, 0.09785322, 0.099987254)

ann_text3 <- data.frame(n = 1,
                       drug = factor("c",levels = c("d","r","c","h")),p62 = 0.63, lab = "·")
ann_text4 <- data.frame(n = 1,
                        drug = factor("h",levels = c("d","r","c","h")),p62 = 0.63, lab = "·")


df = data.frame(n, drug, gen, p62, sd)
df$baf <- as.factor(df$gen)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$gen, levels = c(0,1), labels=c("+/+", "-/-"))
ggplot(df, aes(x=drug, y=p62, fill = drug)) + facet_wrap(~gen) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge(.9)) +
  geom_errorbar(aes(ymin=p62-sd, ymax=p62+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("p62/actin")+xlab("treatment")+ theme(legend.position = "none")+geom_text(data = ann_text3,label = "**", size = 14)+geom_text(data = ann_text4,label = "**", size = 14)


