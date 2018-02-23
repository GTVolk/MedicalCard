unit CardEditorUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, SystemUtils, ElemSelectorUI,
  CheckLst, SQLWork;

type
  TCardEditorForm = class(TForm)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Edit2: TEdit;
    ComboBox9: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    ComboBox10: TComboBox;
    ComboBox16: TComboBox;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Label28: TLabel;
    Edit6: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    GroupBox2: TGroupBox;
    ComplainsMemo: TMemo;
    AnamnesisMemo: TMemo;
    Label5: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Panel2: TPanel;
    NextPageBtn: TBitBtn;
    PrintBtn: TBitBtn;
    PrevPageBtn: TBitBtn;
    SaveBtn: TBitBtn;
    CancelBtn: TBitBtn;
    GroupBox3: TGroupBox;
    AddDataMemo: TMemo;
    DiagnosisMemo: TMemo;
    Label31: TLabel;
    Label32: TLabel;
    GroupBox4: TGroupBox;
    CheckListBox1: TCheckListBox;
    Label33: TLabel;
    CheckListBox2: TCheckListBox;
    Label34: TLabel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    procedure NextPageBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure PrevPageBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure CheckListBox2ClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    function AllComponentsLoaded : boolean;
    procedure GetHereWindow(ClientID : integer; CardNumber : integer = -1);
    procedure ResetForm;
    procedure LoadForm;
    procedure SaveForm;
    procedure SaveDiagnosticData;
  end;

var
  CardEditorForm : TCardEditorForm;
  CID, CrdNum    : integer;
  LastItemState  : TCheckBoxState;

implementation

{$R *.dfm}

procedure TCardEditorForm.GetHereWindow;
begin
  CID := ClientID;
  CrdNum := CardNumber;
  ResetForm;
  if (CrdNum <> -1) then LoadForm;
  ShowModal;
end;

function TCardEditorForm.AllComponentsLoaded;
var Msg : string;
begin
  Msg := '';
  if ComboBox1.ItemIndex < 0 then Msg := 'Не заполнено поле осмотр';
  if Edit1.Text = '' then Msg := 'Не заполнено поле номер карты';
  if DateTimePicker1.Date > Now then Msg := 'Нельзя устанавливать будущую дату';
  if ComboBox2.ItemIndex < 0 then Msg := 'Не заполнено поле кожные покровы';
  if ComboBox3.ItemIndex < 0 then Msg := 'Не заполнено поле лимфатические узлы';
  if ComboBox4.ItemIndex < 0 then Msg := 'Не заполнено поле суставы';
  if ComboBox5.ItemIndex < 0 then Msg := 'Не заполнено поле зев';
  if ComboBox6.ItemIndex < 0 then Msg := 'Не заполнено поле миндалины';
  if ComboBox7.ItemIndex < 0 then Msg := 'Не заполнено поле в легких';
  if ComboBox8.ItemIndex < 0 then Msg := 'Не заполнено поле хрипы';
  if ComboBox9.ItemIndex < 0 then Msg := 'Не заполнено поле тоны сердца';
  if ComboBox10.ItemIndex < 0 then Msg := 'Не заполнено поле пульс';
  if ComboBox11.ItemIndex < 0 then Msg := 'Не заполнено поле при пальпации боль';
  if ComboBox12.ItemIndex < 0 then Msg := 'Не заполнено поле язык';
  if ComboBox13.ItemIndex < 0 then Msg := 'Не заполнено поле живот';
  if ComboBox14.ItemIndex < 0 then Msg := 'Не заполнено поле печень';
  if ComboBox15.ItemIndex < 0 then Msg := 'Не заполнено поле стул';
  if ComboBox16.ItemIndex < 0 then Msg := 'Не заполнено поле мочеиспускание';
  if ComboBox17.ItemIndex < 0 then Msg := 'Не заполнено поле симптом пастернацкого';
  if ComboBox18.ItemIndex < 0 then Msg := 'Не заполнено поле отеки';
  if Edit3.Text = '' then Edit3.Text := '0';
  if Edit4.Text = '' then Edit4.Text := '0';
  if Edit5.Text = '' then Edit5.Text := '0';
  if Edit6.Text = '' then Edit6.Text := '0';
  if Msg <> '' then
  begin
    MakeErrorSound;
    ShowMessage(Msg);
    AllComponentsLoaded := False;
  end
  else AllComponentsLoaded := True;
end;

procedure TCardEditorForm.NextPageBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  Panel1.Visible := false;
  GroupBox1.Visible := false;
  GroupBox2.Visible := false;
  NextPageBtn.Enabled := false;
  PrevPageBtn.Enabled := true;
  GroupBox3.Visible := true;
  GroupBox4.Visible := true;
end;

procedure TCardEditorForm.PrintBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  // TODO: Код печати мед карты
end;

procedure TCardEditorForm.PrevPageBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  GroupBox3.Visible := false;
  GroupBox4.Visible := false;
  Panel1.Visible := true;
  GroupBox1.Visible := true;
  GroupBox2.Visible := true;
  NextPageBtn.Enabled := true;
  PrevPageBtn.Enabled := false;
end;

procedure TCardEditorForm.BitBtn1Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(1);
  GetSkinData(ComboBox2);
  ComboBox2.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn2Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(2);
  GetLymphData(ComboBox3);
  ComboBox3.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn3Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(3);
  GetJointsData(ComboBox4);
  ComboBox4.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn4Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(4);
  GetPharynxData(ComboBox5);
  ComboBox5.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn5Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(5);
  GetTonsilsData(ComboBox6);
  ComboBox6.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn6Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(6);
  GetLightsData(ComboBox7);
  ComboBox7.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn7Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(7);
  GetWheezingsData(ComboBox8);
  ComboBox8.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn8Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(8);
  GetHTonesData(ComboBox9);
  ComboBox9.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn9Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(9);
  GetPulseData(ComboBox10);
  ComboBox10.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn10Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(10);
  GetStomBPData(ComboBox11);
  ComboBox11.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn11Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(11);
  GetTongueData(ComboBox12);
  ComboBox12.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn12Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(12);
  GetStomData(ComboBox13);
  ComboBox13.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn13Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(13);
  GetLiverData(ComboBox14);
  ComboBox14.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn14Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(14);
  GetPewData(ComboBox15);
  ComboBox15.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn15Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(15);
  GetUrinatData(ComboBox16);
  ComboBox16.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn16Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(16);
  GetPasterSData(ComboBox17);
  ComboBox17.ItemIndex := 0;
end;

procedure TCardEditorForm.BitBtn17Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(17);
  GetEdemaData(ComboBox18);
  ComboBox18.ItemIndex := 0;
end;

procedure TCardEditorForm.ResetForm;
begin
  ComboBox1.ItemIndex := GetInspectionValue(CID);
  Edit1.Text := GetNextCardNumber(CID);
  DateTimePicker1.Date := Now;
  ComplainsMemo.Text := '';
  AnamnesisMemo.Text := '';
  GetSkinData(ComboBox2);
  ComboBox2.ItemIndex := 0;
  GetLymphData(ComboBox3);
  ComboBox3.ItemIndex := 0;
  GetJointsData(ComboBox4);
  ComboBox4.ItemIndex := 0;
  GetPharynxData(ComboBox5);
  ComboBox5.ItemIndex := 0;
  GetTonsilsData(ComboBox6);
  ComboBox6.ItemIndex := 0;
  GetLightsData(ComboBox7);
  ComboBox7.ItemIndex := 0;
  GetWheezingsData(ComboBox8);
  ComboBox8.ItemIndex := 0;
  GetHTonesData(ComboBox9);
  ComboBox9.ItemIndex := 0;
  GetPulseData(ComboBox10);
  ComboBox10.ItemIndex := 0;
  GetStomBPData(ComboBox11);
  ComboBox11.ItemIndex := 0;
  GetTongueData(ComboBox12);
  ComboBox12.ItemIndex := 0;
  GetStomData(ComboBox13);
  ComboBox13.ItemIndex := 0;
  GetLiverData(ComboBox14);
  ComboBox14.ItemIndex := 0;
  GetPewData(ComboBox15);
  ComboBox15.ItemIndex := 0;
  GetUrinatData(ComboBox16);
  ComboBox16.ItemIndex := 0;
  GetPasterSData(ComboBox17);
  ComboBox17.ItemIndex := 0;
  GetEdemaData(ComboBox18);
  ComboBox18.ItemIndex := 0;
  Edit2.Text := '';
  Edit3.Text := '0'; Edit4.Text := '0';
  Edit5.Text := '0'; Edit6.Text := '0';
  AddDataMemo.Text := '';
  DiagnosisMemo.Text := '';
  CheckListBox1.ItemIndex := -1;
  CheckListBox2.ItemIndex := -1;
  CheckListBox1.Clear;
  CheckListBox2.Clear;
  LoadUpMethods(CID,CrdNum);
  LoadListDiagnostics(CID,CrdNum,CheckListBox1);
  GroupBox3.Visible := false;
  GroupBox4.Visible := false;
  Panel1.Visible := true;
  GroupBox1.Visible := true;
  GroupBox2.Visible := true;
  NextPageBtn.Enabled := true;
  PrevPageBtn.Enabled := false;
end;

procedure TCardEditorForm.LoadForm;
begin
  ComboBox1.ItemIndex := GetClCardInspection(CID,CrdNum);
  Edit1.Text := IntToStr(CrdNum);
  DateTimePicker1.Date := GetClCardDate(CID,CrdNum);
  ComplainsMemo.Text := GetClCardComplains(CID,CrdNum);
  AnamnesisMemo.Text := GetClCardAnamnesis(CID,CrdNum);
  ComboBox2.ItemIndex := GetClCardSkinID(CID,CrdNum) - 1;
  ComboBox3.ItemIndex := GetClCardLymphID(CID,CrdNum) - 1;
  ComboBox4.ItemIndex := GetClCardJointsID(CID,CrdNum) - 1;
  ComboBox5.ItemIndex := GetClCardPharynxID(CID,CrdNum) - 1;
  ComboBox6.ItemIndex := GetClCardTonsilsID(CID,CrdNum) - 1;
  ComboBox7.ItemIndex := GetClCardLightsID(CID,CrdNum) - 1;
  ComboBox8.ItemIndex := GetClCardWheezingsID(CID,CrdNum) - 1;
  ComboBox9.ItemIndex := GetClCardHTonesID(CID,CrdNum) - 1;
  ComboBox10.ItemIndex := GetClCardPulseID(CID,CrdNum) - 1;
  ComboBox11.ItemIndex := GetClCardStomBPID(CID,CrdNum) - 1;
  ComboBox12.ItemIndex := GetClCardTongueID(CID,CrdNum) - 1;
  ComboBox13.ItemIndex := GetClCardStomID(CID,CrdNum) - 1;
  ComboBox14.ItemIndex := GetClCardLiverID(CID,CrdNum) - 1;
  ComboBox15.ItemIndex := GetClCardPewID(CID,CrdNum) - 1;
  ComboBox16.ItemIndex := GetClCardUrinatID(CID,CrdNum) - 1;
  ComboBox17.ItemIndex := GetClCardPasterSID(CID,CrdNum) - 1;
  ComboBox18.ItemIndex := GetClCardEdemaID(CID,CrdNum) - 1;
  Edit2.Text := GetClCardPSJ(CID,CrdNum);
  Edit3.Text := GetClCardADS(CID,CrdNum);
  Edit4.Text := GetClCardADL(CID,CrdNum);
  Edit5.Text := GetClCardPLS(CID,CrdNum);
  Edit6.Text := GetClCardNOB(CID,CrdNum);
  AddDataMemo.Text := GetClCardAddData(CID,CrdNum);
  DiagnosisMemo.Text := GetClCardDiagnosis(CID,CrdNum);
end;

procedure TCardEditorForm.SaveForm;
begin
  if (CrdNum <> -1) then
  begin
    SetClCardNumber(CID,CrdNum,StrToInt(Edit1.Text));
    CrdNum := StrToInt(Edit1.Text);
    SetClCardInspection(CID,CrdNum,ComboBox1.ItemIndex);
    SetClCardDate(CID,CrdNum,DateToStr(DateTimePicker1.Date));
    SetClCardComplains(CID,CrdNum,ComplainsMemo.Text);
    SetClCardAnamnesis(CID,CrdNum,AnamnesisMemo.Text);
    SetClCardSkinID(CID,CrdNum,ComboBox2.ItemIndex);
    SetClCardLymphID(CID,CrdNum,ComboBox3.ItemIndex);
    SetClCardJointsID(CID,CrdNum,ComboBox4.ItemIndex);
    SetClCardPharynxID(CID,CrdNum,ComboBox5.ItemIndex);
    SetClCardTonsilsID(CID,CrdNum,ComboBox6.ItemIndex);
    SetClCardLightsID(CID,CrdNum,ComboBox7.ItemIndex);
    SetClCardWheezingsID(CID,CrdNum,ComboBox8.ItemIndex);
    SetClCardHTonesID(CID,CrdNum,ComboBox9.ItemIndex);
    SetClCardPulseID(CID,CrdNum,ComboBox10.ItemIndex);
    SetClCardStomBPID(CID,CrdNum,ComboBox11.ItemIndex);
    SetClCardTongueID(CID,CrdNum,ComboBox12.ItemIndex);
    SetClCardStomID(CID,CrdNum,ComboBox13.ItemIndex);
    SetClCardLiverID(CID,CrdNum,ComboBox14.ItemIndex);
    SetClCardPewID(CID,CrdNum,ComboBox15.ItemIndex);
    SetClCardUrinatID(CID,CrdNum,ComboBox16.ItemIndex);
    SetClCardPasterSID(CID,CrdNum,ComboBox17.ItemIndex);
    SetClCardEdemaID(CID,CrdNum,ComboBox18.ItemIndex);
    SetClCardPSJ(CID,CrdNum,Edit2.Text);
    SetClCardADS(CID,CrdNum,Edit3.Text);
    SetClCardADL(CID,CrdNum,Edit4.Text);
    SetClCardPLS(CID,CrdNum,Edit5.Text);
    SetClCardNOB(CID,CrdNum,Edit6.Text);
    SetClCardAddData(CID,CrdNum,AddDataMemo.Text);
    SetClCardDiagnosis(CID,CrdNum,DiagnosisMemo.Text);
    SaveDiagnosticData;
  end
  else
  begin
    CrdNum := StrToInt(Edit1.Text);
    AddNewCard(CID,CrdNum,ComboBox1.ItemIndex,DateToStr(DateTimePicker1.Date),ComplainsMemo.Text,AnamnesisMemo.Text,ComboBox2.ItemIndex,ComboBox3.ItemIndex,ComboBox4.ItemIndex,ComboBox5.ItemIndex,ComboBox6.ItemIndex,ComboBox7.ItemIndex,ComboBox8.ItemIndex,ComboBox9.ItemIndex,ComboBox10.ItemIndex,ComboBox11.ItemIndex,ComboBox12.ItemIndex,ComboBox13.ItemIndex,ComboBox14.ItemIndex,ComboBox15.ItemIndex,ComboBox16.ItemIndex,ComboBox17.ItemIndex,ComboBox18.ItemIndex,Edit2.Text,Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,AddDataMemo.Text,DiagnosisMemo.Text);
    SaveDiagnosticData;
  end;
end;

procedure TCardEditorForm.SaveBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  if AllComponentsLoaded then
    if (ClCardNumberVaild(CID,CrdNum,StrToInt(Edit1.Text))) then
    begin
      SaveForm;
      MakeNotifySound;
      ShowMessage('Изменения сохранены!');
      CardEditorForm.Close;
    end
    else
    begin
      MakeErrorSound;
      ShowMessage('Такой номер карты уже используется!')
    end;
end;

procedure TCardEditorForm.CancelBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  MakeNotifySound;
  case MessageBox(CardEditorForm.Handle, 'Вы действительно хотите закрыть это окно (все изменения будут утеряны)?','Внимание!',36) of
    6 : CardEditorForm.Close;
  end;
end;

procedure TCardEditorForm.SaveDiagnosticData;
begin
  SaveListDiagnostics(CID,CrdNum,CheckListBox1,CheckListBox2);
  // TODO : Сохранение методов диагностик
end;

procedure TCardEditorForm.CheckListBox1Click(Sender: TObject);
begin
  LoadListDiagnosticMethods(CID,CrdNum,CheckListBox1,CheckListBox2);
end;

procedure TCardEditorForm.BitBtn18Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(18);
  LoadListDiagnostics(CID,CrdNum,CheckListBox1);
end;

procedure TCardEditorForm.BitBtn19Click(Sender: TObject);
begin
  MakeButtonSound;
  ElemSelForm.GetHereWindow(19);
  CheckListBox2.Clear;
  LoadListDiagnosticMethods(CID,CrdNum,CheckListBox1,CheckListBox2);
end;

procedure TCardEditorForm.CheckListBox1ClickCheck(Sender: TObject);
begin
  LoadListDiagnosticMethods(CID,CrdNum,CheckListBox1,CheckListBox2);
end;

procedure TCardEditorForm.CheckListBox2ClickCheck(Sender: TObject);
begin
  if (not CheckListBox1.Checked[CheckListBox1.ItemIndex]) then CheckListBox2.State[CheckListBox2.ItemIndex] := cbGrayed
  else
    if (CheckListBox2.State[CheckListBox2.ItemIndex] = cbChecked) then
    begin
      if (TMList.IndexOfName(CheckListBox2.Items[CheckListBox2.ItemIndex]) = -1) then
        TMList.Add(CheckListBox2.Items[CheckListBox2.ItemIndex] + '=' + IntToStr(GetDiagID(CheckListBox1.Items[CheckListBox1.ItemIndex])));
    end
    else
      if (TMList.IndexOfName(CheckListBox2.Items[CheckListBox2.ItemIndex]) <> -1) then
        TMList.Delete(TMList.IndexOfName(CheckListBox2.Items[CheckListBox2.ItemIndex]));
end;

end.
