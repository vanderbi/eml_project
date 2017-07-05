attributes_data <- read.table(file = "C:\\Users\\Kristin Vanderbilt\\Desktop\\dataset_eml\\dataset_attributes.txt",
                              header = TRUE,
                              sep = "\t",
                              as.is = TRUE)

attributes_data

file.path <- "C:\\Users\\Kristin Vanderbilt\\Desktop\\dataset_eml\\dataset_factors.txt"
factors_data <- read.table(file = file.path,
                           header = TRUE,
                           sep = "\t",
                           as.is = TRUE)

factors_data

physical_element <- set_physical(objectName = "demo_data.csv",
                                 numHeaderLines = "1",
                                 recordDelimiter = "\\r\\n",
                                 attributeOrientation = "column",
                                 fieldDelimiter = ",",
                                 size = "293348",
                                 sizeUnit = "byte")

physical_element

dataTable_element <- new("dataTable",
                         entityName = "demo_data.csv",
                         entityDescription = "Data table for make EML with R demonstration.",
                         physical = physical_element,
                         attributeList = attributes_element,
                         numberOfRecords = "2192")

dataTable_element

coverage_element <- set_coverage(beginDate = "2010-01-01",
                                 endDate = "2016-01-01",
                                 geographicDescription = "Some where in a geographic location far far away.",
                                 westBoundingCoordinate = -121.9,
                                 eastBoundingCoordinate = -121.3,
                                 northBoundingCoordinate = 38.5,
                                 southBoundingCoordinate = 37.7)

coverage_element

methods_element <- set_methods(methods_file = "C:\\Users\\Colin\\Desktop\\dataset_eml\\dataset_methods.txt")

methods_element

abstract_element <- as(
  set_TextType(file = "C:\\Users\\Colin\\Desktop\\dataset_eml\\dataset_abstract.txt"),
  "abstract")


abstract_element

keywords_element <- c(new("keywordSet",
                          keywordThesaurus = "LTER controlled vocabulary",
                          keyword = c("river",
                                      "freshwater",
                                      "aquatic ecosystems",
                                      "brackish water",
                                      "estuarine",
                                      "delta")),
                      new("keywordSet",
                          keywordThesaurus = "LTER core area",
                          keyword = c("disturbance")))

keywords_element 

dataset_element <- new("dataset",
                       title = "Mississippi River floods",
                       abstract = abstract_element,
                       methods = methods_element,
                       keywordSet = keywords_element,
                       coverage = coverage_element,
                       dataTable = dataTable_element)

dataset_element

eml <- new("eml",
           schemaLocation = "eml://ecoinformatics.org/eml-2.1.1  http://nis.lternet.edu/schemas/EML/eml-2.1.1/eml.xsd",
           packageId = "edi.91.1",
           system = "edi",
           dataset = dataset_element)

eml 

creator_element <- new("creator",
                       individualName = new("individualName",
                                            givenName = "Colin",
                                            surName = "Smith"),
                       organizationName = "Environmental Data Initiative",
                       positionName = "Information Manager",
                       electronicMailAddress = "colin.smith@wisc.edu")    

contact_element <- new("contact",
                       individualName = new("individualName",
                                            givenName = "Colin",
                                            surName = "Smith"),
                       organizationName = "Environmental Data Initiative",
                       positionName = "Information Manager",
                       electronicMailAddress = "colin.smith@wisc.edu")

dataset_element <- new("dataset",
                       title = "Mississippi River floods: Return of the DENITRIFICATION!",
                       creator = creator_element,
                       contact = contact_element,
                       abstract = abstract_element,
                       methods = methods_element,
                       keywordSet = keywords_element,
                       coverage = coverage_element,
                       dataTable = dataTable_element)

eml <- new("eml",
           schemaLocation = "eml://ecoinformatics.org/eml-2.1.1  http://nis.lternet.edu/schemas/EML/eml-2.1.1/eml.xsd",
           packageId = "edi.91.1",
           system = "edi",
           dataset = dataset_element)

eml_validate(eml)

write_eml(eml,
          "C:\\Users\\Kristin Vanderbilt\\Desktop\\dataset_eml\\dataset_eml.xml")

