#add links to image names
library(tidyverse)

imagelinks <- read_csv('imageslinks.csv', col_names = F)

imagelinksApplet <- imagelinks %>%
  mutate(X3 = paste0('\\r\\n\\r\\n![', X1, '](https://raw.githubusercontent.com/ChildMindInstitute/GraphoLearn_EMA_applet/master/images/', 
                     X1, '.png =150x150)'))

imagesTable <- imagelinks %>%
  mutate(Image = paste0('| <img src=\"images/', X1, '.png\" width=\"150\"><br>[source](', X2, ') ')
) %>%
  select(3)

imagesTableWide <- tibble(
  X1 = imagesTable$Image[1:12],
  X2 = imagesTable$Image[13:24],
  X3 = imagesTable$Image[25:36],
  X4 = imagesTable$Image[37:48],
  X5 = paste0(c(imagesTable$Image[49:59], " "), " |")
)


write_csv(imagelinksApplet, 'imagelinks_applet.csv')  
write_csv(imagesTableWide, 'imagelinks_table.csv') 
         