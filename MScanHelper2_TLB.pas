unit MScanHelper2_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 5/2/2023 8:33:09 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Users\sutter\Perforce\bruce-HNV2OA7\MOM\Code\Delphi 10\MScanHelper2\MScanHelper2 (1)
// LIBID: {16356350-8F4D-4B81-8B55-DAFEF8B65C8D}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MScanHelper2MajorVersion = 1;
  MScanHelper2MinorVersion = 0;

  LIBID_MScanHelper2: TGUID = '{16356350-8F4D-4B81-8B55-DAFEF8B65C8D}';

  IID_IAutomationHelper1: TGUID = '{0D605B1B-C025-451B-94D2-B369FDEE7195}';
  CLASS_AutomationHelper1: TGUID = '{9A385AC9-D580-4C37-9440-B67B581105A4}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IAutomationHelper1 = interface;
  IAutomationHelper1Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  AutomationHelper1 = IAutomationHelper1;


// *********************************************************************//
// Interface: IAutomationHelper1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0D605B1B-C025-451B-94D2-B369FDEE7195}
// *********************************************************************//
  IAutomationHelper1 = interface(IDispatch)
    ['{0D605B1B-C025-451B-94D2-B369FDEE7195}']
    function GetPixel(frameData: OleVariant; row: OleVariant; col: OleVariant): OleVariant; stdcall;
    function Get_ImageWidth: LongWord; safecall;
    procedure Set_ImageWidth(Value: LongWord); safecall;
    function Get_ImageHeight: LongWord; safecall;
    procedure Set_ImageHeight(Value: LongWord); safecall;
    procedure ReleaseFrame(frameData: OleVariant); safecall;
    property ImageWidth: LongWord read Get_ImageWidth write Set_ImageWidth;
    property ImageHeight: LongWord read Get_ImageHeight write Set_ImageHeight;
    function InitStreamData: OleVariant; stdcall;
    function SendFrame(frameData: OleVariant): OleVariant; stdcall;
    function EndStreamData: OleVariant; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IAutomationHelper1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0D605B1B-C025-451B-94D2-B369FDEE7195}
// *********************************************************************//
  IAutomationHelper1Disp = dispinterface
    ['{0D605B1B-C025-451B-94D2-B369FDEE7195}']
    function GetPixel(frameData: OleVariant; row: OleVariant; col: OleVariant): OleVariant; dispid 201;
    property ImageWidth: LongWord dispid 202;
    property ImageHeight: LongWord dispid 203;
    procedure ReleaseFrame(frameData: OleVariant); dispid 204;
    function InitStreamData: OleVariant; dispid 205;
    function SendFrame(frameData: OleVariant): OleVariant; dispid 206;
    function EndStreamData: OleVariant; dispid 207;
  end;

// *********************************************************************//
// The Class CoAutomationHelper1 provides a Create and CreateRemote method to
// create instances of the default interface IAutomationHelper1 exposed by
// the CoClass AutomationHelper1. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAutomationHelper1 = class
    class function Create: IAutomationHelper1;
    class function CreateRemote(const MachineName: string): IAutomationHelper1;
  end;

implementation

uses System.Win.ComObj;

class function CoAutomationHelper1.Create: IAutomationHelper1;
begin
  Result := CreateComObject(CLASS_AutomationHelper1) as IAutomationHelper1;
end;

class function CoAutomationHelper1.CreateRemote(const MachineName: string): IAutomationHelper1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AutomationHelper1) as IAutomationHelper1;
end;

end.

