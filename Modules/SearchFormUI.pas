unit SearchFormUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MMSystem, SystemUtils, SQLWork;

type
  TSearchForm = class(TForm)
    BitBtn1: TBitBtn;
    FamEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    NamEdit: TEdit;
    Label3: TLabel;
    SurEdit: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetHereWindow(LB : TListBox);
  end;

var
  SearchForm: TSearchForm;
  TLB : TListBox;

implementation

{$R *.dfm}

// Процедура получения и открытия окна
procedure TSearchForm.GetHereWindow;
begin
  TLB := LB;
  Show;
end;

// Процедура вызова поиска клиента
procedure TSearchForm.BitBtn1Click(Sender: TObject);
begin
  MakeButtonSound;
  SearchClientsList(TLB,FamEdit.Text,NamEdit.Text,SurEdit.Text);
end;

end.
