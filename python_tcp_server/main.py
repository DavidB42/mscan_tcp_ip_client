import socket
import ctypes
import numpy as np
import datetime
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('TkAgg')

def readnbyte(sock, n):
    buff = bytearray(n)
    pos = 0
    while pos < n:
        cr = sock.recv_into(memoryview(buff)[pos:])
        if cr == 0:
            raise EOFError
        pos += cr
    return buff


#TCP_IP = '127.0.0.1'
#TCP_PORT = 40000

TCP_IP = '172.25.196.42'
TCP_PORT = 55000

print('Listening for client...')
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((TCP_IP, TCP_PORT))
server.listen(1)

# establish connection
clientSocket, addr = server.accept()
print("got a connection from %s" % str(addr))

array_list = []

ax = plt.subplot()
start_im = np.zeros((512, 512))
im = ax.imshow(start_im, cmap='gray')
plt.ion()

while True:
    # receive data stream. it won't accept data packet greater than 1024 bytes
    data_len = clientSocket.recv(8)
    data_len = int.from_bytes(data_len, byteorder='big')
    data = readnbyte(clientSocket, data_len)
    if not data:
        # if data is not received break
        break
    print("---------------------------------------------------")
    print("new message: " + str(datetime.datetime.now()))

    # decode bytes and convert to 2D-array
    bytes_decode = np.frombuffer(data, ctypes.c_uint16)
    array = np.reshape(bytes_decode, (-1, int(np.sqrt(len(bytes_decode)))))

    print("received " + str(len(data)) + " bytes")
    print("size of array: " + str(array.shape))
    print("max element: " + str(np.max(array)) + " | min element: " + str(np.min(array)))

    # save array
    #array_list.append(array)

    # plot received image
    #ax.imshow(array, cmap='gray')
    #plt.pause(0.2)

server.close()





