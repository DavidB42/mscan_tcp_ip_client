# mscan_tcp_ip_client

author: David Burkhardt, CIN, AG Arrenberg, Tuebingen University

## general
Small client application in pascal for implementing a TCP/IP connection on a MScan computer and sending current frames to a remote server. 
The client is called via a MScan VB script as a Microsoft Automation Server. The .dll's need to be added to the Windows Registry.

## Add DLL to  windows registry
- run a administrator-level command prompt
- switch to the directory containing the the binary files (.dll)
- enter the command <code>regsvr32 MScanHelper2.dll</code>
