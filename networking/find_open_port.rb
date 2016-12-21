server = TCPServer.new('127.0.0.1', 0) #0 is special, it finds any open port
port = server.addr[1]   # get the port
server.close   #close the server, now we have an open port number

