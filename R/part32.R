data <-read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

dim(data)
rownames(data)
colnames(data)
str(data)

data_metadata <- data[,1:4]
data_metadata$Sum_ills <- rowSums(data[, -(1:4)])
data_metadata$Mean_ills <- apply(X = data[, -(1:4)], # Данные
                                     MARGIN = 1,            # Измерения
                                     FUN = mean)            # Функция
data_metadata$Std_ills <- apply(X = data[, -(1:4)], # Данные
                                    MARGIN = 1,            # Измерения
                                    FUN = sd)            # Функция
data_metadata$Country.Province <- paste(data_metadata$Country.Region, 
                                            data_metadata$Province.State,
                                            sep = ":")
data_metadata <- data_metadata[, c(8, 3:7)]
View(data_metadata)


data_t <- t(data)
data_t <- data_t[-c(1:4),]
colnames(data_t) <- data_metadata[,1]
rownames(data_t) <- format(as.Date(substring(rownames(data_t),2), "%m.%d.%y"),"%Y-%m-%d")
View(data_t)                                           

write.csv(data_metadata,"data_metadata.csv")