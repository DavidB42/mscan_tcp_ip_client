library MScanHelper2;

uses
  ComServ,
  MScanHelper2_TLB in 'MScanHelper2_TLB.pas',
  MScanHelper2_Imp in 'MScanHelper2_Imp.pas' {AutomationHelper1: CoClass},
  tcp_ip_client in 'tcp_ip_client.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}  //include resource file

begin
end.
