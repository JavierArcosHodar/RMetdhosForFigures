
install.packages("ggplot2")
library(ggplot2)
n = c(1,2,3,4,5,6,7,8)
drug = c("d","r","c","h")
baf = c(0, 0, 0, 0, 1, 1, 1, 1)
lc3 = c(0.149745, 0.055112, 0.15426, 0.329218, 0.845289, 0.42205, 0.44194, 0.433253)
sd = c(0.025942, 0.017586, 0.037735, 0.101983, 0.151344, 0.141565, 0.072249, 0.0601169)

df = data.frame(n, drug, baf, lc3, sd)
df$baf <- as.factor(df$baf)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$baf, levels = c(0,1), labels=c("No Baf", "Baf"))

ann_text <- data.frame(n = 1,
                       drug = factor("c",levels = c("d","r","c","h")),
                       baf = factor("Baf",levels = c("No Baf","Baf")), lc3 = 0.55, lab = "·")

ann_text1 <- data.frame(n = 1,
                       drug = factor("r",levels = c("d","r","c","h")),
                       baf = factor("No Baf",levels = c("No Baf","Baf")), lc3 = 0.20, lab = "·")

ann_text2 <- data.frame(n = 1,
                        drug = factor("h",levels = c("d","r","c","h")),
                        baf = factor("Baf",levels = c("No Baf","Baf")), lc3 = 0.53, lab = "·")

ggplot(df, aes(x=drug, y=lc3, fill = drug)) + facet_wrap(~baf) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge(.9)) +
  geom_errorbar(aes(ymin=lc3-sd, ymax=lc3+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("lc3/actin")+xlab("treatment")+ theme(legend.position = "none")+geom_text(data = ann_text,label = "·", size = 18)+geom_text(data = ann_text1,label = "·", size = 18)+geom_text(data = ann_text2,label = "·", size = 18)
