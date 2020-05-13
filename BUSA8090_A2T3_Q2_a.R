install.packages("WDI")

library(WDI)
WDIsearch("CO2.*capita")

wdi_data <- WDI(indicator=c("EN.ATM.CO2E.PC"),start=2010,end=2010,extra=TRUE)

wdi_data = as_tibble(wdi_data)
glimpse(wdi_data)

wdi_data <- wdi_data %>%
  rename(Emit_CO2percap=EN.ATM.CO2E.PC)

glimpse(wdi_data)

write_csv(wdi_data,"wdi_CO2.csv")
wdi <- read_csv("wdi_CO2.csv")

summary(wdi$Emit_CO2percap)

install.packages("maps")
library(maps)

dat_map <- map_data("world")

install.packages("countrycode")
library(countrycode)

dat_map$ccode<- countrycode(dat_map$region,origin="country.name",destination="wb")
wdi$ccode <- countrycode(wdi$country,origin="country.name",destination="wb")

merged <- full_join(dat_map, wdi, by="ccode")
ggplot(merged,aes(x=long,y=lat,group=group,fill=Emit_CO2percap))+geom_polygon()















