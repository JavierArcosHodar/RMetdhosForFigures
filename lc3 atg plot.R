library(ggplot2)
n = c(1,2,3,4)
drug = c("d","r","c","h")
gen = c("Atg5+/+", "Atg5+/+", "Atg5+/+", "Atg5+/+")
lc3 = c(4.354685328, 1.764120757, 0.431615964, 0.432211812)
sd = c(2.51363297, 1.555924431, 0.184113637, 0.073399947)

ann_text <- data.frame(n = 1,
                       drug = factor("c",levels = c("d","r","c","h")),lc3 = 0.55, lab = "·")
ann_text1 <- data.frame(n = 1,
                       drug = factor("h",levels = c("d","r","c","h")),lc3 = 0.55, lab = "·")


df = data.frame(n, drug, gen, lc3, sd)
df$baf <- as.factor(df$gen)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$gen, levels = c(0,1), labels=c("+/+", "-/-"))
ggplot(df, aes(x=drug, y=lc3, fill = drug)) + facet_wrap(~gen) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge(.9)) +
  geom_errorbar(aes(ymin=lc3-sd, ymax=lc3+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("lc3/actin")+xlab("treatment")+ theme(legend.position = "none")+geom_text(data = ann_text,label = "**", size = 14)+geom_text(data = ann_text1,label = "**", size = 14)