unit MScanHelper2_Imp;

{$WARN SYMBOL_PLATFORM OFF}
{$POINTERMATH ON}

interface

uses
  // Delphi units
  Winapi.Windows, System.Variants, ComObj, ActiveX, MScanHelper2_TLB, StdVcl, SysUtils, Forms,
  // TCP/IP
  tcp_ip_client, System.Threading;

type
  TFrameData = packed array[0..0] of int16;
  TpFrameData = ^TFrameData;

  TAutomationHelper1 = class(TAutoObject, IAutomationHelper1)
  protected
    function GetPixel(frameData, row, col: OleVariant): OleVariant; stdcall;
    function Get_ImageHeight: LongWord; safecall;
    function Get_ImageWidth: LongWord; safecall;
    function InitStreamData: OleVariant; stdcall;
    function SendFrame(frameData: OleVariant): OleVariant; stdcall;
    procedure Set_ImageHeight(Value: LongWord); safecall;
    procedure Set_ImageWidth(Value: LongWord); safecall;
    procedure ReleaseFrame(frameData: OleVariant); safecall;
    function EndStreamData: OleVariant; stdcall;

  private
    m_ImageWidth:  LongWord;
    m_ImageHeight: LongWord;
    m_com: TForm1;
    m_client: ITask;
  end;


implementation

uses ComServ;

function TAutomationHelper1.EndStreamData: OleVariant;
begin
   m_com.IdTCPClient1.Disconnect;
   m_com.FreeMemoryStream;
   m_client.Cancel;

   Result := 1;
end;

function TAutomationHelper1.InitStreamData: OleVariant;
begin

  //programm does not close properly yet!!!

  m_client := TTask.Run(procedure
  begin
    Application.Initialize;
    Application.Title := 'Client';
    Application.CreateForm(TForm1, m_com);
    Application.Run;
  end);

  (*TTask.Run(procedure
  begin
    Application.Initialize;
    Application.Title := 'Client';
    Application.CreateForm(TForm1, m_com);
    Application.Run;
  end);*)

  Result := 1;
end;

function TAutomationHelper1.SendFrame(frameData: OleVariant): OleVariant;
var
  timeout: LongWord;
  pVarArray: TpFrameData;
begin

  //m_com.SendFrame_testData(20, 1);

  m_com.SendFrame(frameData, (m_ImageWidth*m_ImageHeight)*2);

  Result := 1;
end;

function TAutomationHelper1.GetPixel(frameData, row, col: OleVariant): OleVariant;
var
  x, y {, offsetInPixels}: integer;
  pDataArray: TpFrameData;
  pFramePixels, pPixel: ^Uint16;
  pVarArray: TpFrameData;
begin
  y := row;
  x := col;

  pVarArray := VarArrayLock(frameData);
  //pFramePixels := (^int16)(pVarArray);
  //offsetInPixels := y * m_ImageWidth + x;
  //pPixel := pVarArray + TpFrameData(offsetInPixels);
  //Result := pPixel^;
  Result := pVarArray[y * m_ImageWidth + x];
  VarArrayUnlock(frameData);
end;

function TAutomationHelper1.Get_ImageHeight: LongWord;
begin
  Result := m_ImageHeight;
end;

function TAutomationHelper1.Get_ImageWidth: LongWord;
begin
  Result := m_ImageWidth;
end;

procedure TAutomationHelper1.Set_ImageHeight(Value: LongWord);
begin
  m_ImageHeight := Value;
end;

procedure TAutomationHelper1.Set_ImageWidth(Value: LongWord);
begin
  m_ImageWidth := Value;
end;

procedure TAutomationHelper1.ReleaseFrame(frameData: OleVariant);
begin
  VarClear (frameData);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAutomationHelper1, Class_AutomationHelper1, ciMultiInstance, tmApartment);
end.
