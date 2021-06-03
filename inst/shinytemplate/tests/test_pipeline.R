#### Pipeline ###

pkgload::load_all()

conn <- dbConnect(odbc(), "RInformXL", uid = "analyzer", pwd = "analyzer")

dbDisconnect(conn)
