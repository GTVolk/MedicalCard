unit DiagMethodElemAdderUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TDiagMethAddElemForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    CnlBtn: TBitBtn;
    AddBtn: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DiagMethAddElemForm: TDiagMethAddElemForm;

implementation

{$R *.dfm}

end.
