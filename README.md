# mscan_tcp_ip_client

author: David Burkhardt, CIN, AG Arrenberg, Tuebingen University

date: 2023/05/22

## general
Small client application in pascal for implementing a TCP/IP connection on a MScan computer and sending current frames to a remote server. 
The client is called via a MScan VB script as a Microsoft Automation Server in the MScan Development IDE.

## add DLL to  windows registry
Before running the client, the DLLs need to be added to the Windows Registry:
- run a administrator-level command prompt
- switch to the directory containing the the binary files (.dll)
- enter the command <code>regsvr32 MScanHelper2.dll</code>
