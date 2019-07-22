#First, we download ggplot2 for better braphs
install.packages("ggplot2")
library(ggplot2)

#File with Peter Bank's data is read
data <- read.csv("Validation.txt", header=T, sep="\t")

#Initially, a sample of the drugs was able to be read, but the graph was not what we desired
ggplot(
  subset(data, drug=="celecoxib"| drug=="mastinib" | drug== "leflunomide"))+
  geom_point(aes(x=conc, y=count, color=drug))+
  scale_y_continuous(trans="log10")+
  scale_x_continuous(trans="log10")

#After help from Fernando Blanco, appropiate code to estimate averages for a drug for a given concentration was achieve

means<-aggregate(count~conc*drug*expt, 
                 subset(data, drug=="celecoxib"| drug=="mastinib" | drug== "leflunomide"), 
                 mean)

#now ploted correctly
ggplot(means,aes(x=conc, y=count, color=drug, group=drug))+
  geom_point()+
  geom_line()+
  facet_wrap(~expt)+
  scale_y_continuous(trans="log10")+
  scale_x_continuous(trans="log10")


#Un poco más bonito:
ggplot(means,aes(x=conc, y=count, color=drug, group=drug))+
  geom_line(size=1.5)+
  geom_point(size=3, fill="white", stroke=2.5, shape=21)+
  facet_wrap(~expt)+
  scale_y_continuous(trans="log10", name="count")+
  scale_x_continuous(trans="log10", name="concentration µM")+
  geom_hline(yintercept=400, linetype="dashed", size=1.5, color="grey70")+
  scale_color_manual(values=c("steelblue", "forestgreen", "tomato3"))+
  theme_bw()


