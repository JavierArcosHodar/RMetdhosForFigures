library(ggplot2)
n = c(1,2,3,4)
drug = c("d","r","c","h")
gen = c("Cell death", "Cell death", "Cell death", "Cell death")
ccasp3 = c(1.489983861, 0.206591711, 1.039050921, 3.138323643)
sd = c(0.115452073, 0.073117483, 0.240291054, 0.363546006)

ann_text5 <- data.frame(n = 1,
                       drug = factor("r",levels = c("d","r","c","h")),ccasp3 = 1, lab = "·")
ann_text6 <- data.frame(n = 1,
                        drug = factor("h",levels = c("d","r","c","h")),ccasp3 = 3.65, lab = "·")



df = data.frame(n, drug, gen, ccasp3, sd)
df$baf <- as.factor(df$gen)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$gen, levels = c(0,1), labels=c("+/+", "-/-"))
ggplot(df, aes(x=drug, y=ccasp3, fill = drug)) + facet_wrap(~gen) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge(.9)) +
  geom_errorbar(aes(ymin=ccasp3-sd, ymax=ccasp3+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("ccasp3/actin")+xlab("treatment")+ theme(legend.position = "none")+geom_text(data = ann_text5,label = "**", size = 14)+geom_text(data = ann_text6,label = "·", size = 14)