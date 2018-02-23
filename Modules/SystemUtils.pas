unit SystemUtils;

interface

uses Windows, SysUtils, Forms, StdCtrls, Dialogs, MMSystem;

// ���������� ���������� ��������

type MSet = set of byte;

const DBFilePath       = 'Data\DB\Pharmacy.db';
const BackupExt        = '.bak';
const ButtonSound      = 'Data\Sounds\Button.wav';
const NotifySound      = 'Data\Sounds\Notify.wav';
const ErrorSound       = 'Data\Sounds\Error.wav';
const IconButOn        = 'Data\Icons\Led2On.bmp';
const IconButOff       = 'Data\Icons\Led2Off.bmp';
const SQLFilePath      = 'Data\BaseQuery.sql';
const OGRNIPPath       = 'Data\Constants\OGRNIP';
const CompNamePath     = 'Data\Constants\CompanyName';
const CompAddressPath  = 'Data\Constants\CompanyAddress';
const SeqEditName      = 'Edit';

// ����� �������

function GetFileString(FPath : string) : string;
function GetOGRNIP : string;
function GetCompanyName : string;
function GetCompanyAddress : string;
function GetControlNumber(S : string; MAX_LENGTH : integer) : integer;

// ����� ���������

procedure SetFileString(FPath, S : string);
procedure SetOGRNIP(S : string);
procedure SetCompanyName(S : string);
procedure SetCompanyAddress(S : string);

procedure MakeButtonSound;
procedure MakeNotifySound;
procedure MakeErrorSound;

procedure MakeBackup;
procedure RestoreBackup;

procedure CheckButtonsAvaliable(LB : TListBox; DB : TButton; SB : TButton);
procedure GetDigitalInput(var Key : Char);

function GetSeqControl(Number : integer) : string;
function CheckControlEdge(ControlName : string; EDGES : MSet) : boolean;
function GetPrevControl(ControlName : string; EDGES : MSet = []) : string;
function GetBreakedString(EDIT : TEdit; MAX_LENGTH : integer) : string;
procedure BreakStringToEdits(T : string; EDIT : TEdit; MAX_LENGTH : integer; var ManualEdit : boolean);
procedure ClearEdits(EDIT : TEdit; MAX_LENGTH : integer; var ManualEdit : boolean);

implementation

// ������� ��������� ������ ������������ ��������
// ���������� ����� ����� - ����� ��������
function GetControlNumber;
var ts : string;
begin
  ts := S;
  Delete(ts,1,MAX_LENGTH);
  GetControlNumber := StrToInt(ts);
end;

// ������� ��������� ������ �� �����
// ���������� ������ �� �����
function GetFileString;
var F      : TextFile;
    ts, rs : string;
begin
  if FileExists(OGRNIPPath) then
  begin
    try
      Assign(F,FPath);
      Reset(F);
      rs := '';
      While not EOF(F) do
      begin
        ts := '';
        ReadLn(F,ts);
        rs := rs + ts;
      end;
      GetFileString := rs;
      Close(F);
    except
      MakeErrorSound;
      ShowMessage('���� ���������! ����: ' + FPath);
    end;
  end
  else
  begin
    MakeErrorSound;
    ShowMessage('���� �� ������! ����: ' + FPath);
  end;
end;

// ��������� ������ ������ � ����
procedure SetFileString;
var F  : TextFile;
begin
  if FileExists(OGRNIPPath) then
  begin
    try
      Assign(F,FPath);
      Rewrite(F);
      WriteLn(F,S);
      Close(F);
    except
      MakeErrorSound;
      ShowMessage('�� ������� �������� � ����! ����: ' + FPath);
    end;
  end
  else
  begin
    MakeErrorSound;
    ShowMessage('���� �� ������! ����: ' + FPath);
  end;
end;

// ������� ��������� ������
// ���������� ������ � ������� ������
function GetOGRNIP;
begin
  GetOGRNIP := GetFileString(OGRNIPPath);
end;

// ������� ��������� �������� ��������
// ���������� ������ � ��������� ��������
function GetCompanyName;
begin
  GetCompanyName := GetFileString(CompNamePath);
end;

// ������� ��������� ������ ��������
// ���������� ������ � ������� ��������
function GetCompanyAddress;
begin
  GetCompanyAddress := GetFileString(CompAddressPath);
end;

// ��������� ������ ������
procedure SetOGRNIP;
begin
  SetFileString(OGRNIPPath,S);
end;

// ��������� ������ �������� ��������
procedure SetCompanyName;
begin
  SetFileString(CompNamePath,S);
end;

// ��������� ������ ������ ��������
procedure SetCompanyAddress;
begin
  SetFileString(CompAddressPath,S);
end;

// ��������� ����� ������
procedure MakeButtonSound;
begin
  PlaySound(ButtonSound, 0, SND_ASYNC);
end;

// ��������� ����� �����������
procedure MakeNotifySound;
begin
  PlaySound(NotifySound, 0, SND_ASYNC);
end;

// ��������� ����� ������
procedure MakeErrorSound;
begin
  PlaySound(ErrorSound, 0, SND_ASYNC);
end;

procedure MakeBackup;
begin
  if FileExists(DBFilePath) then
  begin
    if FileExists(DBFilePath + BackupExt) then DeleteFile(DBFilePath + BackupExt);
    CopyFile(PAnsiChar(DBFilePath),PAnsiChar(DBFilePath + BackupExt),False);
    MakeNotifySound;
    ShowMessage('��������� ����� ������� �������!');
  end;
end;

procedure RestoreBackup;
begin
  if FileExists(DBFilePath + BackupExt) then
  begin
    if FileExists(DBFilePath) then DeleteFile(DBFilePath);
    CopyFile(PAnsiChar(DBFilePath + BackupExt),PAnsiChar(DBFilePath),False);
    MakeNotifySound;
    ShowMessage('��������� ����� ������� �������������!');
  end;
end;

function GetSeqControl;
begin
  GetSeqControl := SeqEditName + IntToStr(Number);
end;

// ��������� �������� �� ������ � ������� "�������" � "�������"
// �����������: ���� � ������ ������ ������ �� ������ ��������
// � ��������� ������ ��� �� ��������
procedure CheckButtonsAvaliable;
begin
  if (LB.ItemIndex >= 0) then
  begin
    DB.Enabled := true;
    SB.Enabled := true;
  end
  else
  begin
    DB.Enabled := false;
    SB.Enabled := false;
  end;
end;

procedure GetDigitalInput;
begin
  if not (Key in ['0'..'9',#8]) then Key := #0;
end;

function CheckControlEdge;
begin
  CheckControlEdge := (GetControlNumber(ControlName,length(SeqEditName)) in EDGES);
end;

// ������� ��������� ����������� ������������ ��������
// ���������� ������ � ��������� ����������� ��������
function GetPrevControl;
var ind   : integer;
begin
  if CheckControlEdge(ControlName,EDGES)
  then GetPrevControl := ControlName
  else
    begin
      ind := GetControlNumber(ControlName,length(SeqEditName));
      dec(ind);
      GetPrevControl := GetSeqControl(ind);
    end;
end;

// ��������� ��������� ������ �� ���������������� Edit'��
// �����������: ��������� ������ �����������
// � ������ Edit ���������� ���� ������
// � ��� ���� ���� �� ����� �������� ����� MAX_LENGTH, ���� �� ���������� ������
function GetBreakedString;
var i, si  : integer;
    tstr   : string;
begin
  i := 1;
  si := GetControlNumber(EDIT.Name,length(SeqEditName));
  tstr := '';
  while (i <= MAX_LENGTH) do
  begin
    tstr := tstr + ((EDIT.GetParentComponent as TForm).FindChildControl(GetSeqControl(si + (i-1))) as TEdit).Text;
    inc(i);
  end;
  GetBreakedString := tstr;
end;

// ��������� ��������� ������ �� ���������������� Edit'��
// �����������: ��������� ������ �����������
// � ������ Edit ���������� ���� ������
// � ��� ���� ���� �� ����� �������� ����� MAX_LENGTH, ���� �� ���������� ������
procedure BreakStringToEdits;
var i, si  : integer;
begin
  ManualEdit := False;
  i := 1;
  si := GetControlNumber(EDIT.Name,length(SeqEditName));
  while ((i <= MAX_LENGTH) and (i <= length(T))) do
  begin
    ((EDIT.GetParentComponent as TForm).FindChildControl(GetSeqControl(si + (i-1))) as TEdit).Text := T[i];
    inc(i);
  end;
  ManualEdit := True;
end;

// ��������� �������� ���������������� Edit'��
procedure ClearEdits;
var i, si  : integer;
begin
  ManualEdit := False;
  i := 1;
  si := GetControlNumber(EDIT.Name,length(SeqEditName));
  while (i <= MAX_LENGTH) do
  begin
    ((EDIT.GetParentComponent as TForm).FindChildControl(GetSeqControl(si + (i-1))) as TEdit).Text := '';
    inc(i);
  end;
  ManualEdit := True;
end;

end.
 