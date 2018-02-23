unit ElemAdderUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SystemUtils;

type
  TElemAddForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    AddBtn: TBitBtn;
    CnlBtn: TBitBtn;
    procedure AddBtnClick(Sender: TObject);
    procedure CnlBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetHereWindow(TableID : integer; ElemID : integer = -1);
    procedure ResetForm;
    procedure LoadForm;
    procedure SaveForm;
  end;

var
  ElemAddForm : TElemAddForm;
  TID, EID    : integer;

implementation

{$R *.dfm}
procedure TElemAddForm.GetHereWindow;
begin
  TID := TableID;
  EID := ElemID;
  ResetForm;
  if (EID <> -1) then LoadForm;
  ShowModal;
end;

procedure TElemAddForm.AddBtnClick(Sender: TObject);
begin
  MakeButtonSound;
//  if CheckElemAvailable(TID,Edit.Text) then
//  begin
    SaveForm;
    MakeNotifySound;
    ShowMessage('Изменения сохранены!');
    ElemAddForm.Close;
//  end
//  begin
//    MakeErrorSound;
//    ShowMessage('Такой элемент уже есть!')
//  end;
end;

procedure TElemAddForm.CnlBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  MakeNotifySound;
  case MessageBox(ElemAddForm.Handle, 'Вы действительно хотите закрыть это окно (все изменения будут утеряны)?','Внимание!',36) of
    6 : ElemAddForm.Close;
  end;
end;

procedure TElemAddForm.ResetForm;
begin
  Edit1.Text := '';
end;

procedure TElemAddForm.LoadForm;
begin
  //Edit1.Text := GetElemFromTable(TID,EID);
end;

procedure TElemAddForm.SaveForm;
begin
end;
 // if (EID <> -1) then
 //   SetTableData(TID,EID,Edit1.Text)
 // else
 //   AddNewTableData(TID,Edit1.Text);
end.
