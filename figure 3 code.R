#Te cuento: primero cargo este paquete para gráficos que es de lo más cómodo:
install.packages("ggplot2")
library(ggplot2)

#cargo los datos...
data <- read.csv("Validation.txt", header=T, sep="\t")

#lo que tú tenías es un poco como esto:
ggplot(
  subset(data, drug=="celecoxib"| drug=="mastinib" | drug== "leflunomide"))+
  geom_point(aes(x=conc, y=count, color=drug))+
  scale_y_continuous(trans="log10")+
  scale_x_continuous(trans="log10")

#...pero entiendo que lo que pides es más bien representar las medias:
#Para eso, primero calculo las medias de count por cada nivel de droga, expt y concentración:
means<-aggregate(count~conc*drug*expt, 
                 subset(data, drug=="celecoxib"| drug=="mastinib" | drug== "leflunomide"), 
                 mean)

#y saco el gráfico con ellas:
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
  scale_x_continuous(trans="log10", name="concentration")+
  geom_hline(yintercept=400, linetype="dashed", size=1.5, color="grey70")+
  scale_color_manual(values=c("steelblue", "forestgreen", "tomato3"))+
  theme_bw()


