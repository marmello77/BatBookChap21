#Set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Remove previous objects
rm(list= ls())

#Load the packages
library("igraph")
library("ggplot2")
library("reshape2")



###### Draw Figure 21.1 #######

#Import the data
studies = read.delim("studies.txt", row.names=1)

#Plot the barplot
tiff(filename = "figure 21.1.tiff", res= 300, height = 3000, width = 5000)
par(mfrow = c(1,1), mar = c(6,7,1,1), xpd=TRUE)
counts <- table(studies$Phyllostomidae, studies$Links)
barplot(counts, main="",
        xlab="Topic",
        ylab = "Number of studies",
        col=gray.colors(length(rownames(counts))), 
        border = F, 
        beside=TRUE,
        las = 0,
        mgp = c(4,1,0),
        cex.lab=3,
        cex.axis=2, 
        cex.main=3, 
        cex.sub=3,
        cex.names=1.5)
legend(x = 1,
       y = 8, 
       title = "Phyllostomidae as a model?",
       cex = 1.5,
       bty="n",
       fill=gray.colors(length(rownames(counts))), 
       legend=rownames(counts))
par(mfrow = c(1,1))
dev.off()



##### Draw Figure 21.2 #####

#Use the same data as in Fig.21.1
head(studies, 3)

#Plot the histogram
tiff(filename = "figure 21.2.tiff", res= 300, height = 3000, width = 4000)
par(mfrow = c(1,1), mar = c(5,7,1,3))
hist(studies$Year,
     breaks=5,
     col = adjustcolor("grey", alpha.f = .5),
     border = F,
     xlab = "Year",
     ylab = "Number of studies",
     main = "",
     mgp = c(4,1,0),
     cex.lab=3,
     cex.axis=2, 
     cex.main=3, 
     cex.sub=3)
par(mfrow = c(1,1))
dev.off()



##### Draw Figure 21.3 #####

##Import data
softmat = as.matrix(read.delim("software.txt", row.names=1))

#Inspect  object
class(softmat)
softmat

#Create igraph object
softnet <- graph_from_incidence_matrix(softmat, weighted = NULL)

#Inspect object
class(softnet)
softnet
E(softnet)
V(softnet)

#Name the two sets of vertices: rows as software and the columns as references
V(softnet)$set = ifelse(V(softnet)$type == FALSE, "software", "reference")
V(softnet)$set

#Set layout 
lref <- layout.fruchterman.reingold(softnet)

#Set edge curvatures
curvesref = curve_multiple(softnet)

#Set edge mode and width
E(softnet)$arrow.mode = 0
E(softnet)$width = 1

#Set node shapes
V(softnet)$shape = V(softnet)$set
V(softnet)$shape = gsub("reference","circle",V(softnet)$shape)
V(softnet)$shape = gsub("software","square",V(softnet)$shape)

#Set node colors by taxon
V(softnet)$color = V(softnet)$set
V(softnet)$color = gsub("reference","grey10",V(softnet)$color)
V(softnet)$color = gsub("software","grey50",V(softnet)$color)

#Plot the graph
tiff(filename = "figure 21.3.tiff", res= 300, height = 3000, width = 3100)
par(mfrow = c(1,1))
plot(softnet, 
     vertex.color = V(softnet)$color, 
     vertex.frame.color = V(softnet)$color, 
     #vertex.shape = vertexshape, 
     vertex.size = 12,
     #vertex.size = V(softnet)$size,
     vertex.label = V(softnet)$name,
     vertex.label.color = "white",
     vertex.label.cex = .5,
     edge.color = adjustcolor("grey70", alpha.f = .5),
     #edge.color = "#FFFD00", 
     #edge.curved = curvesref,
     edge.curved = 0.2,
     edge.width = 7,
     #layout = layout_in_circle,
     layout = lref) 
legend(x = 0.7,y = -0.6, legend = c("References", "Software"), pch = c(19,15),  title="Legend", 
       text.col = "gray20", title.col = "black", box.lwd = 0,
       cex = 2, col=c("grey10", "grey50"))
par(mfrow = c(1,1))
dev.off()



##### Draw Figure 21.4 ######

##Import data
sarmentomat = as.matrix(read.delim("sarmento.txt", row.names=1))

#Inspect object
class(sarmentomat)
sarmentomat

#Create igraph object
sarmentonet <- graph_from_incidence_matrix(sarmentomat, directed = F, weighted = TRUE) 

#Inspect object
class(sarmentonet)
sarmentonet
E(sarmentonet)
V(sarmentonet)

#Specify which nodes represent which taxonomic group
V(sarmentonet)$set[1:12] = "Bats"
V(sarmentonet)$set[13:22] = "Birds"
V(sarmentonet)$set[23:89] = "Plants"

#Set layout
lsar <- layout_nicely(sarmentonet)

#Set edge curvatures
curvessar = curve_multiple(sarmentonet)

#Set edge mode and width
E(sarmentonet)$arrow.mode = 0
E(sarmentonet)$width = E(sarmentonet)$weight/5+1

#Calculate Louvain modularity (resolution = 1.0)
sarmentonet.lou = cluster_louvain(sarmentonet)

#Import "diamond" vertex shape
source("MyDiamond.R")

#Set vertex shapes
V(sarmentonet)$shape = V(sarmentonet)$set
V(sarmentonet)$shape = gsub("Bats","diamond",V(sarmentonet)$shape)
V(sarmentonet)$shape = gsub("Birds","square",V(sarmentonet)$shape)
V(sarmentonet)$shape = gsub("Plants","circle",V(sarmentonet)$shape)

##Set node and cloud colors by modularity
colrs <- gray.colors(length(sarmentonet.lou), start = 0.3, end = 0.6, gamma = 1.5, alpha = NULL)
V(sarmentonet)$color <- colrs[sarmentonet.lou$membership]
clouds = gray.colors(length(sarmentonet.lou), start = 0.7, end = 0.9, gamma = 1.5, alpha = 0.1)

#Plot the graph
tiff(filename= "figure 21.4.tiff", res= 300, height= 3000, width= 3100)
par(mfrow=c(1,1),mar=c(1,1,1,5))
plot(sarmentonet.lou,
     sarmentonet,
     col = V(sarmentonet)$color,
     mark.border="lightgrey", 
     mark.col=clouds,
     vertex.size=7.5,
     vertex.label=V(sarmentonet)$set,
     vertex.label.color="white",
     vertex.label.cex=.5,
     edge.color = adjustcolor("grey", alpha.f = .5),
     edge.curved=0.3,
     edge.width = 3,
     layout=lsar)
legend(x = 0.9,y = 1.0, legend = c("Bats", "Birds", "Plants"),
       pch = c(18,15,19),  title="Taxon",
       text.col = "gray20", title.col = "black",
       box.lwd = 0, cex = 2, col=c("grey", "grey", "grey"))
par(mfrow=c(1,1))
dev.off()

