unit tcp_ip_client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdStack,
  IdComponent, IdTCPConnection, IdTCPClient, IdGlobal;

type
  TFrameData = packed array[0..0] of int16;
  TpFrameData = ^TFrameData;

  TForm1 = class(TForm)
    IdTCPClient1: TIdTCPClient;
    Button2: TButton;
    Label1: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender:TObject);
    procedure SendFrame(frameData, size: OleVariant);
    procedure SendFrame_testData(frameData, size: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FreeMemoryStream;
    function DateTimeToStrUs(dt: TDatetime): string;
  private
    m_stream : TMemoryStream;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FreeMemoryStream;
begin
  m_stream.Clear;
  m_stream.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  host: string;
  port: int16;
begin

   //set host and port
   host := Edit1.Text;
   port := StrToInt(Edit2.Text);
   IdTCPClient1.Host := host;
   IdTCPClient1.Port := port;

   //IdTCPClient1.Host := '172.25.105.108';
   //IdTCPClient1.Port := 55000;

   //connect to server
   try
    IdTCPClient1.ConnectTimeout := 2000;
    IdTCPClient1.Connect;
   except
      on E: EIdSocketError do begin
        ShowMessage('Connection Unsuccessful: ' + E.Message);
      end;
   end;

   //deactivate edits
   Edit1.Enabled := False;
   Edit2.Enabled := False;
   Button2.Enabled := False;
   Button3.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  IdTCPClient1.Disconnect;

  //activate edits
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Button2.Enabled := True;
  Button3.Enabled := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if IdTCPClient1.Connected then IdTCPClient1.Disconnect;
  m_stream.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  //create objects
   IdTCPClient1 := TIdTCPClient.Create;
   m_stream := TMemoryStream.Create;


   //enable/disable elements
   Edit1.Enabled := True;
   Edit2.Enabled := true;
   Button2.Enabled := True;
   Button3.Enabled := False;
end;

procedure TForm1.SendFrame_testData(frameData, size: OleVariant);
var
  frameBuffer: TIdBytes;
  i, len: int16;
  test_data: packed array[0..9999] of int16;
  time: TDateTime;
begin

  //create test data
  for i := 0 to 9999  do test_data[i] := int16(Random(500));
  //old version
  //frameBuffer :=  RawToBytes(test_data, Length(test_data));
  //len := Length(frameBuffer);


  m_stream.Clear;

  m_stream.Write(test_data[0], Length(test_data)*2);
  m_stream.Position := 0;


  //send stream
  IdTCPClient1.Socket.LargeStream := True;

  if not IdTCPClient1.Connected then exit;
  try
    //send stream
    IdTCPClient1.Socket.Write(m_stream, m_stream.Size, True)
  except
    ShowMessage('Sending Steam was unsuccessful');
  end;

  //write data size and time send
  time := Now;
  Label7.Caption := IntToStr(m_stream.Size);
  Label3.Caption := DateTimeToStrUs(time);

  m_stream.Clear;

  //send data - old version
  //if not IdTCPClient1.Connected then exit;
  //IdTCPClient1.Socket.Write(byte(len));
  //IdTCPCLient1.Socket.Write(frameBuffer);
end;

procedure TForm1.SendFrame(frameData, size: OleVariant);
var
  frameBuffer: TIdBytes;
  pVarArray: TpFrameData;
  time: TDateTime;
begin

  m_stream.Clear;

  pVarArray := VarArrayLock(frameData);
  m_stream.Write(pVarArray[0], size);
  VarArrayUnlock(frameData);
  m_stream.Position := 0;


  //send stream
  // first 8 bytes are size of data package
  IdTCPClient1.Socket.LargeStream := True;
  if not IdTCPClient1.Connected then exit;
  try
    IdTCPClient1.Socket.Write(m_stream, m_stream.Size, True)
  except
    ShowMessage('Sending Steam was unsuccessful');
  end;

  //write data size and time send
  time := Now;
  Label7.Caption := IntToStr(m_stream.Size);
  Label3.Caption := DateTimeToStrUs(time);

  m_stream.Clear;


  //old version
  (*frameBuffer := RawToBytes(pVarArray, size);
  len := Length(frameBuffer);
  VarArrayUnlock(frameData);
  sl := TStringList.Create;
  for e in frameBuffer do sl.Add(IntToStr(e));
  Label7.Caption := IntToStr(Length(frameBuffer));
  if not IdTCPClient1.Connected then exit;
  IdTCPClient1.Socket.Write(byte(len));
  IdTCPCLient1.Socket.Write(frameBuffer);*)
end;

function TForm1.DateTimeToStrUs(dt: TDatetime): string;
var
    us: string;
begin
    //Spit out most of the result: '20160802 11:34:36.'
    Result := FormatDateTime('hh":"nn":"ss"."', dt);

    //extract the number of microseconds
    dt := Frac(dt); //fractional part of day
    dt := dt * 24*60*60; //number of seconds in that day
    us := IntToStr(Round(Frac(dt)*1000000));

    //Add the us integer to the end:
    // '20160801 11:34:36.' + '00' + '123456'
    Result := Result + StringOfChar('0', 6-Length(us)) + us;
end;

end.
