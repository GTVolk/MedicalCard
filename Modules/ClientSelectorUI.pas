unit ClientSelectorUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, Buttons, SystemUtils, SQLWork,
  SearchFormUI, ClientInfoUI;

type
  TClSelForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ListBox1: TListBox;
    NewBtn: TBitBtn;
    DelBtn: TBitBtn;
    SelBtn: TBitBtn;
    Panel1: TPanel;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure SelBtnClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClSelForm: TClSelForm;

implementation

{$R *.dfm}
// ��������� ���������� ��� �������� �����
// �����������: ��� �������� ������� ����������� � ����
// ���� ��� �������� ��������� ������ ��������
// � ������ ������ ���������� ��������� ��������� �����
procedure TClSelForm.FormCreate(Sender: TObject);
begin
  if not CreateConnection(DBFilePath) then
  begin
    if FileExists(DBFilePath + BackupExt) then
    begin
      MakeNotifySound;
      case MessageBox(ClSelForm.Handle,'������������ ���� �� ��������� �����?','��������!',36) of
          6 : begin
                RestoreBackup;
                FormCreate(Sender);
                exit;
              end;
      end;
    end;
    Application.Terminate;
  end
  else GetClientsList(ListBox1);
end;

// ��������� ���������� ��� ����������� �����
// �����������: ��� ����������� ����� ����������� ������� ������ � ����
procedure TClSelForm.FormDestroy(Sender: TObject);
begin
  FreeAndDestroy();
end;

// ��������� ���������� ������ ��������
procedure TClSelForm.N4Click(Sender: TObject);
begin
  GetClientsList(ListBox1);
end;

// ��������� ������ ����� ������ �������
procedure TClSelForm.N5Click(Sender: TObject);
begin
  SearchForm.GetHereWindow(ListBox1);
end;

// ��������� ���������� ������ � �������, ������ ����� ������
procedure TClSelForm.NewBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  ClInfoForm.GetHereWindow();
  GetClientsList(ListBox1);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

// ��������� ������ ���� ������� �� ����
procedure TClSelForm.N2Click(Sender: TObject);
begin
  MakeNotifySound;
  ShowMessage('������!');
  //TODO: ������ � �������
end;

// ��������� �������� ������ �������, �� ����� �������
procedure TClSelForm.DelBtnClick(Sender: TObject);
var client : string;
begin
  MakeButtonSound;
  client := '�� ������������� ������ ������� ������� ' + ListBox1.Items[ListBox1.ItemIndex] +  '?';
  MakeNotifySound;
  case MessageBox(ClSelForm.Handle, PAnsiChar(client),'��������!',36) of
    6 : begin
          DeleteClient(GetClientID(ListBox1.ItemIndex));
          GetClientsList(listBox1);
          CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
        end;
  end;
end;

// ��������� ������ � ��������� �������, ������ ����� ���������
procedure TClSelForm.SelBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  ClInfoForm.GetHereWindow(GetClientID(ListBox1.ItemIndex));
  GetClientsList(ListBox1);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

// ��������� �������� ��������� ����� ����
procedure TClSelForm.N7Click(Sender: TObject);
begin
  if FileExists(DBFilePath + BackupExt) then
  begin
    MakeNotifySound;
    case MessageBox(ClSelForm.Handle, '������� ������������ ��������� �����?','��������!',36) of
      6 : MakeBackup;
    end;
  end
  else MakeBackup;
end;

// ��������� �������������� ��������� ����� ����
procedure TClSelForm.N8Click(Sender: TObject);
begin
  if not FileExists(DBFilePath + BackupExt) then
  begin
    MakeErrorSound;
    ShowMessage('��������� ����� �� �������!');
  end
  else
    if FileExists(DBFilePath) then
    begin
      MakeNotifySound;
      case MessageBox(ClSelForm.Handle, '�� ������������� ������ ������������ ������� ���� ��������� ������?','��������!',36) of
        6 : begin
              RestoreBackup;
              GetClientsList(ListBox1);
            end;
      end;
    end;
end;

// ��������� ������ �� ��������� ��� ������� � ����
procedure TClSelForm.N10Click(Sender: TObject);
begin
  ClSelForm.Close;
end;

// ��������� ���������� ��� ������ � ������
procedure TClSelForm.ListBox1Click(Sender: TObject);
begin
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

end.
