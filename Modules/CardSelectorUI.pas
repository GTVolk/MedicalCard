unit CardSelectorUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, SystemUtils, SQLWork, CardEditorUI;

type
  TCardSelForm = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    NewBtn: TBitBtn;
    DelBtn: TBitBtn;
    SelBtn: TBitBtn;
    procedure NewBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure SelBtnClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetHereWindow(ClientID : integer);
  end;

var
  CardSelForm : TCardSelForm;
  CID         : integer;

implementation

{$R *.dfm}

procedure TCardSelForm.GetHereWindow;
begin
  CID := ClientID;
  GetListMedCards(ListBox1,CID);
  ShowModal;
end;

procedure TCardSelForm.NewBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  CardEditorForm.GetHereWindow(CID);
  GetListMedCards(ListBox1,CID);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

procedure TCardSelForm.DelBtnClick(Sender: TObject);
var card : string;
begin
  MakeButtonSound;
  card := '¬ы действительно хотите удалить карту с номером ' + ListBox1.Items[ListBox1.ItemIndex] +  ' и все ее данные?';
  MakeNotifySound;
  case MessageBox(CardSelForm.Handle, PAnsiChar(card),'¬нимание!',36) of
    6 : begin
          DeleteClMedCard(CID,ListBox1.Items[ListBox1.ItemIndex]);
          GetListMedCards(ListBox1,CID);
          CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
        end;
  end;
end;

procedure TCardSelForm.SelBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  CardEditorForm.GetHereWindow(CID,GetCardNumber(ListBox1.ItemIndex));
  GetListMedCards(ListBox1,CID);
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

procedure TCardSelForm.ListBox1Click(Sender: TObject);
begin
  CheckButtonsAvaliable(ListBox1,DelBtn,SelBtn);
end;

end.
