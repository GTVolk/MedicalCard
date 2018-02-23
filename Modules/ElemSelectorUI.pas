unit ElemSelectorUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, SystemUtils, SQLWork, ElemAdderUI;

type
  TElemSelForm = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    DelBtn: TBitBtn;
    NewBtn: TBitBtn;
    SelBtn: TBitBtn;
    procedure DelBtnClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure SelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetHereWindow(TableID : integer);
  end;

var
  ElemSelForm : TElemSelForm;
  TID         : integer;

implementation

{$R *.dfm}

procedure TElemSelForm.GetHereWindow;
begin
  TID := TableID;
  ListBox1.Clear;
  GetTableData(ListBox1,TID);
  ShowModal;
end;

procedure TElemSelForm.DelBtnClick(Sender: TObject);
var dta : string;
begin
  MakeButtonSound;
  dta := 'Вы действительно хотите удалить элемент ' + ListBox1.Items[ListBox1.ItemIndex] +  '?';
  MakeNotifySound;
  case MessageBox(ElemSelForm.Handle, PAnsiChar(dta),'Внимание!',36) of
    6 : begin
          if CheckTableDeleteAvailable(TID,ListBox1.Items[ListBox1.ItemIndex]) then
          begin
            DeleteTabElem(TID,ListBox1.Items[ListBox1.ItemIndex]);
            GetTableData(ListBox1,TID);
            CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
          end
          else
          begin
            MakeErrorSound;
            ShowMessage('Элемент используется! Удаление невозможно!');
          end;
        end;
  end;
end;

procedure TElemSelForm.NewBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  ElemAddForm.GetHereWindow(TID);
  GetTableData(ListBox1,TID);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

procedure TElemSelForm.SelBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  ElemAddForm.GetHereWindow(TID,ListBox1.ItemIndex);
  GetTableData(ListBox1,TID);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

procedure TElemSelForm.ListBox1Click(Sender: TObject);
begin
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

end.
