object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 189
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 48
    Height = 15
    Caption = 'Server IP:'
  end
  object Label4: TLabel
    Left = 32
    Top = 45
    Width = 25
    Height = 15
    Caption = 'Port:'
  end
  object Label6: TLabel
    Left = 32
    Top = 135
    Width = 76
    Height = 15
    Caption = 'data size send:'
  end
  object Label7: TLabel
    Left = 123
    Top = 135
    Width = 3
    Height = 15
  end
  object Label2: TLabel
    Left = 32
    Top = 156
    Width = 81
    Height = 15
    Caption = 'time data send:'
  end
  object Label3: TLabel
    Left = 123
    Top = 156
    Width = 3
    Height = 15
  end
  object Button2: TButton
    Left = 240
    Top = 8
    Width = 137
    Height = 41
    Caption = 'Connect'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 65
    Width = 137
    Height = 43
    Caption = 'Disconnect'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 86
    Top = 13
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 86
    Top = 42
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '40000'
  end
  object Button1: TButton
    Left = 240
    Top = 124
    Width = 137
    Height = 40
    Caption = 'Close Client'
    TabOrder = 4
    OnClick = Button1Click
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    Host = '172.25.105.108'
    Port = 55000
    ReadTimeout = -1
    Left = 184
    Top = 400
  end
end
