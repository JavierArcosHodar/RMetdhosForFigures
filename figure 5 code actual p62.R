n = c(1,2,3,4,5,6,7,8)
drug = c("d","r","c","h")
baf = c(0, 0, 0, 0, 1, 1, 1, 1)
p62 = c(0.744778, 0.282568, 0.735037, 0.87751, 0.733767, 0.339253, 0.766476, 0.723389)
sd = c(0.132822, 0.0644, 0.089968, 0.166479, 0.120944, 0.116546, 0.14185, 0.208786)

df = data.frame(n, drug, baf, p62, sd)
df$baf <- as.factor(df$baf)
df$drug <- factor(df$drug, levels = c("d", "r", "c", "h"))
df$baf <- factor(df$baf, levels = c(0,1), labels=c("No Baf", "Baf"))

library(ggplot2)

ggplot(df, aes(x=drug, y=p62, fill = drug)) + facet_wrap(~baf) +
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=p62-sd, ymax=p62+sd), width=.2,
                position=position_dodge(.9)) +
  theme_bw(base_size = 30)+ylab("p62/actin")+xlab("treatment")+ theme(legend.position = "none")
