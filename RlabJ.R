
library(ggplot2)
library(reshape2)
args <- commandArgs(trailingOnly = TRUE)
#pritrailingOnlynt(args)
# =TRUE means that only your arguments are returned, check:
# print(commandArgs(trailingOnly=FALSE))


#print("Enter day or date => Days_Available : Friday Saturday Sunday Monday || Dates_Available : 3rd Aug  4th Aug 5th Aug 6th Aug\n")
#event = readline()
event = args[1]
if (event == "Friday" || event == "3rd Aug") {
  
  filepath = "AUG3.csv"
  
}  
if(event == "Saturday"|| event == "4th Aug"){
  
  filepath = "AUG4.csv"
  
} 
if(event == "Sunday" || event == "5th Aug" ){
  
  filepath = "AUG5.csv"
  
} 
if(event == "Monday" || event ==  "6th Aug"){
  
  filepath = "AUG6.csv"
  
}

data <- read.csv(file=filepath, header =T, sep =",")
ggplot(data)
time <- data[,1]
high <- data[,2]
low <- data[,3]
weather <- data[,4] 


#values unclasified

#plot1 = ggplot(data = data ,aes( y = LO,HI , x = Time))+geom_point()

#values classified on colour which is inturn classified by the WEATHERS
#plot2 = ggplot(data = data ,aes( y = LO,HI , x = Time , color = WEATHER))+geom_point()

#values classifies based on different shapes which in turn are based on different weathers
#plot3 = ggplot(data = data ,aes( y = LO,HI , x = Time , shape = WEATHER))+geom_point()

# based on obsv both the colour aesthetic was easier to inference but hell yeah we can use both
plot4 = ggplot(data = data , aes( y = LO , x = Time , color = WEATHER, shape = WEATHER))+geom_point()+labs(title="LOW Temp Vs Timeline", subtitle="From Weather dataset", y="LOW TEMP", x="TIMELINE in (0:00)HRS", caption="Lets Code R! Aditya NIkki VIbhor Palod Kunnu ROcks!")
ggsave( filename = "low.png" , plot =  plot4 , path = "C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J\\static" )



plot5 = ggplot(data = data , aes( y = HI , x = Time , color = WEATHER, shape = WEATHER))+geom_point()+labs(title="HIGH Temp Vs Timeline", subtitle="From Weather dataset", y="HIGH TEMP", x="TIMELINE in (0:00)HRS", caption="Lets Code R!")
ggsave( filename = "high.png" , plot = plot5 ,  path = "C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J\\static")

# reshaping the data for plotting two variables together vs one single variable
new_data <- melt(data, id.vars = "Time")
#ggplot(data = new_data , aes( y = value , x = Time))+geom_point()+labs(title="HIGH & LOW Temp Vs Timeline", subtitle="From Weather dataset", y="HIGH & LOW TEMP", x="TIMELINE in (0:00)HRS", caption="Lets Code R!")

plot6 = ggplot(new_data)+ geom_point(aes(y=value,x=Time,color=variable))+ labs(title = "This is the complete presentation of the dataset" , subtitle = "Kunnu Rocks !!!")
ggsave( filename = "cluster.png" , plot = plot6 ,  path = "C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J\\static")


#otal = plot_grid(plot4,plot5,plot6 , labels = "AUTO") 
#ggsave("combine.png" , plot = total  , path =  path = "C:\\Users\\Kunal K.S. Sahni\\Desktop\\RLAB-J")

#SATISTICAL ANYLISIS




