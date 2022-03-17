# author: Bartlomiej "furas" Burek (https://blog.furas.pl)
# date: 2022.03.11
# [r - Using RSelenium to webscrape multiple item locations on a map - Stack Overflow](https://stackoverflow.com/questions/71438109/using-rselenium-to-webscrape-multiple-item-locations-on-a-map/71440415#71440415)

> install.packages("rvest")     # %>%
> install.packages("httr")      # GET, POST
> install.packages("jsonlite")  # fromJSOn

> library(httr)
> library(jsonlite)

> URL = 'https://gis2.westberks.gov.uk/arcgis/rest/services/maps/Wbc_Highways/MapServer/11/query?f=json&returnGeometry=true&spatialRel=esriSpatialRelIntersects&geometry=%7B%22xmin%22%3A442520.89976831735%2C%22ymin%22%3A178788.66371417744%2C%22xmax%22%3A443314.65135582053%2C%22ymax%22%3A179582.41530168062%2C%22spatialReference%22%3A%7B%22wkid%22%3A27700%2C%22latestWkid%22%3A27700%7D%7D&geometryType=esriGeometryEnvelope&inSR=27700&outFields=OBJECTID%2CItem_Type%2CItem_Identity_Code%2CLocation_Description%2CAssigned_Street%2CLocality%2CTown%2CType%2CBracket_Type%2CLantern_Type%2CLamp_Type%2CBallast_Type%2CControl_Type%2CSign_Lantern_Type%2CSign_Bracket_Type%2CSign_Post_Type%2CBollard_Base_Type%2CBollard_Shell_Type%2CColumn_Manufacturer%2CMaterial_Type%2CLamp_Wattage%2CLantern_Manufacturer%2CNumber_of_Lamps%2CSwitching_Regime_Code%2CSwitching_Regime%2CLamp_Type2%2CEasting%2CNorthing&outSR=27700'

> data <- fromJSON(url)

> library(magrittr)  # to use `%>%
> data <- URL %>% fromJSON

> data$features$attributes$Locality

[1] "BRIGHTWALTON                                                                                        "
[2] "BRIGHTWALTON                                                                                        "
[3] "BRIGHTWALTON                                                                                        "

> data$features$attributes$Town

[1] "NEWBURY                                                                                             "
[2] "NEWBURY                                                                                             "
[3] "NEWBURY                                                                                             "

> data$features$attributes$Assigned_Street

[1] "SAXONS ACRE                                                                                         "
[2] "ASH CLOSE                                                                                           "
[3] "SAXONS ACRE                                                                                         "


> data$features$geometry

       x      y
1 442763 179193
2 442782 179248
3 442770 179214

> library(stringr)

> data$features$attributes$Locality %>% str_trim

[1] "BRIGHTWALTON" "BRIGHTWALTON" "BRIGHTWALTON"

# -----------------------------------------

> library(magrittr)  # to use `%>%
> library(httr)
> library(jsonlite)

> URL = 'https://gis2.westberks.gov.uk/arcgis/rest/services/maps/Wbc_Highways/MapServer/11/query'

> query = list(
    f = list('json'),
    geometry = list(
         '{"xmin":442520.89976831735,"ymin":178788.66371417744,"xmax":443314.65135582053,"ymax":179582.41530168062,"spatialReference":{"wkid":27700,"latestWkid":27700}}'
    ),
    geometryType = list('esriGeometryEnvelope'),
    inSR = list('27700'),
    outFields = list('OBJECTID,Item_Type,Item_Identity_Code,Location_Description,Assigned_Street,Locality,Town,Type,Bracket_Type,Lantern_Type,Lamp_Type,Ballast_Type,Control_Type,Sign_Lantern_Type,Sign_Bracket_Type,Sign_Post_Type,Bollard_Base_Type,Bollard_Shell_Type,Column_Manufacturer,Material_Type,Lamp_Wattage,Lantern_Manufacturer,Number_of_Lamps,Switching_Regime_Code,Switching_Regime,Lamp_Type2,Easting,Northing'),
    outSR = list('27700'),
    returnGeometry = list('true'),
    spatialRel = list('esriSpatialRelIntersects')
  )

> response <- GET(URL, query=query)
> data <- response %>% content %>% fromJSON

> data <- GET(URL, query=query) %>% content %>% fromJSON

for( item in data$features ){
   
   print('Locality:', item$attributes$Locality)
   print(item$attributes$Town)
   print(item$attributes$Assigned_Street)
   print(item$geometry)
   print('---')
}

