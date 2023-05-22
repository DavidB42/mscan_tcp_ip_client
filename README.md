# mscan_tcp_ip_client

author: David Burkhardt, CIN, AG Arrenberg, Tuebingen University

date: 2023/05/22

## TCP/IP Client - general
Small client application in pascal for implementing a TCP/IP connection on a MScan computer and sending current frames to a remote server. 
The client (MScanHelper2.dll) is called via a MScan VB script (vb.MSCRPT) as a Microsoft Automation Server in the MScan Scripting IDE.

## add DLL to  windows registry
Before running the client, the DLLs need to be added to the Windows Registry:
- run a administrator-level command prompt
- switch to the directory containing the the binary files (.dll)
- enter the command <code>regsvr32 MScanHelper2.dll</code>

## TCP/IP Server
Small python TCP/IP server for testing real-time frame reception from the MScan client.

## VB Scripts
- vb.MSCRPT: MScan script for calling the client during imaging
- mscan_test_script.vb: simple script for testing the client without MScan
