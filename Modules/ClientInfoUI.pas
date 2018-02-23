unit ClientInfoUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, SystemUtils, SQLWork, CardSelectorUI;

type
  TClInfoForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit16: TEdit;
    Label12: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Label13: TLabel;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Label14: TLabel;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit64: TEdit;
    Label17: TLabel;
    Edit65: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Edit66: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Edit67: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Edit68: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MaleBtn: TSpeedButton;
    FemBtn: TSpeedButton;
    Label27: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label28: TLabel;
    Label29: TLabel;
    Edit69: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Edit70: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Edit71: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    ComboBox1: TComboBox;
    AllMedCardsBtn: TBitBtn;
    CancelBtn: TBitBtn;
    SaveBtn: TBitBtn;
    PrintBtn: TBitBtn;
    OGRNIPSetBtn: TBitBtn;
    CAddrSaveBtn: TBitBtn;
    CNameSaveBtn: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    Label5: TLabel;
    procedure FemBtnClick(Sender: TObject);
    procedure MaleBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure AllMedCardsBtnClick(Sender: TObject);
    procedure OGRNIPSetBtnClick(Sender: TObject);
    procedure CNameSaveBtnClick(Sender: TObject);
    procedure CAddrSaveBtnClick(Sender: TObject);
    procedure Edit71KeyPress(Sender: TObject; var Key: Char);
    procedure EditsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    function AllComponentsLoaded : boolean;
    procedure ResetForm;
    procedure LoadForm;
    procedure SaveForm;
    procedure GetHereWindow(ClientID : integer = -1);
  end;

var
  ClInfoForm: TClInfoForm;

implementation

uses ClientSelectorUI;

{$R *.dfm}
// Первый параметр - определяющий критическую секцию доступа обработчика ввода в TEdit
// Второй параметр - константа пола клиента
// Третий параметр - ID обрабатываемого клиента
var ManualEdit : boolean;
    CID, ClSEX : integer;

// Процедура получения и открытия окна
// Комментарий: Если ClientID будет равен -1 то создается чистая форма
// Если это будет конкретное число то такой клиент будет найден в базе
// Затем вся его информация загружена на форму
procedure TClInfoForm.GetHereWindow;
begin
  ResetForm;
  CID := ClientID;
  if (CID <> -1) then LoadForm;
  ShowModal;
end;

function TClInfoForm.AllComponentsLoaded;
var Msg : string;
begin
  Msg := '';
  if Edit66.Text = '' then Msg := 'Не заполнено поле фамилия';
  if Edit67.Text = '' then Msg := 'Не заполнено поле имя';
  if Edit68.Text = '' then Msg := 'Не заполнено поле отчество';
  if DateTimePicker1.Date > Now then Msg := 'Нельзя устанавливать будущую дату';
  if Msg <> '' then
  begin
    MakeErrorSound;
    ShowMessage(Msg);
    AllComponentsLoaded := False;
  end
  else AllComponentsLoaded := True;
end;

// Процедура переключения с мужского на женский
procedure TClInfoForm.FemBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  FemBtn.Glyph.LoadFromFile(IconButOn);
  MaleBtn.Glyph.LoadFromFile(IconButOff);
  ClSEX := 1;
end;

// Процедура переключения с женского на мужской
procedure TClInfoForm.MaleBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  MaleBtn.Glyph.LoadFromFile(IconButOn);
  FemBtn.Glyph.LoadFromFile(IconButOff);
  ClSEX := 0;
end;

// Процедура сохранения состояния
procedure TClInfoForm.SaveBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  if AllComponentsLoaded then
  begin
    SaveForm;
    MakeNotifySound;
    ShowMessage('Изменения сохранены!');
    ClInfoForm.Close;
  end;
end;

// Процедура печати документов
procedure TClInfoForm.PrintBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  // TODO : Печать документов
end;

// Процедура отмены сохранения и закрытия окна
procedure TClInfoForm.CancelBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  MakeNotifySound;
  case MessageBox(ClInfoForm.Handle, 'Вы действительно хотите закрыть это окно (все изменения будут утеряны)?','Внимание!',36) of
    6 : ClInfoForm.Close;
  end;
end;

// Процедура открытия формы со списком мед-карт
procedure TClInfoForm.AllMedCardsBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  CardSelForm.GetHereWindow(CID);
  ComboBox1.Clear;
  if (CID <> -1) then GetAllMedCardsNumbers(CID, ComboBox1);
end;

// Процедура сохранения изменений ОГРНИП
procedure TClInfoForm.OGRNIPSetBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  SetOGRNIP(GetBreakedString(Edit1,15));
  MakeNotifySound;
  ShowMessage('ОГРНИП успешно установлен!');
end;

// Процедура сброса всех показателей формы
procedure TClInfoForm.ResetForm;
var ts : string;
begin
  Memo1.Text := GetCompanyName;
  Memo2.Text := GetCompanyAddress;
  ClearEdits(Edit1,15,ManualEdit);
  ts := GetOGRNIP;
  BreakStringToEdits(ts, Edit1,15,ManualEdit);
  ComboBox1.Clear;
  Edit16.Text := ''; Edit64.Text := ''; Edit65.Text := '';
  Edit67.Text := ''; Edit68.Text := ''; Edit69.Text := '';
  Edit71.Text := ''; Edit70.Text := ''; Edit66.Text := '';
  ClearEdits(Edit17,24,ManualEdit);
  ClearEdits(Edit41,3,ManualEdit);
  ClearEdits(Edit44,20,ManualEdit);
  DateTimePicker1.Date := Now;
  MaleBtn.Click;
  AllMedCardsBtn.Enabled := false;
end;

// Процедура загрузки показателей формы
// Комментарий: Данные загружаются для клиента с идентификатором CID
procedure TClInfoForm.LoadForm;
var ts : string;
begin
  GetAllMedCardsNumbers(CID,ComboBox1);
  GetInsCompanyName(CID,Edit16);
  ts := GetInsPolicyNumber(CID);
  BreakStringToEdits(ts,Edit17,24,ManualEdit);
  ts := GetClientLoyalityCode(CID);
  BreakStringToEdits(ts,Edit41,3,ManualEdit);
  ts := GetSNILSNumber(CID);
  BreakStringToEdits(ts,Edit44,20,ManualEdit);
  GetClientPassportData(CID,Edit64,Edit65);
  GetClientFNS(CID,Edit66,Edit67,Edit68);
  if (GetClientSEX(CID)) then MaleBtn.Click else FemBtn.Click;
  GetClientDOB(CID,DateTimePicker1);
  GetClientConstantAddress(CID,Edit69);
  GetClientTempAddress(CID,Edit70);
  GetClientTelephone(CID,Edit71);
  AllMedCardsBtn.Enabled := true;
end;

// Процедура сохранения показателей формы
// Комментарий: Данные сохраняются для клиента с идентификатором CID
procedure TClInfoForm.SaveForm;
begin
  if (CID <> -1) then
  begin
    SetInsCompanyName(CID, Edit16.Text);
    SetInsPolicyNumber(CID, GetBreakedString(Edit17,24));
    SetClientLoyalityCode(CID, GetBreakedString(Edit41,3));
    SetSNILSNumber(CID, GetBreakedString(Edit44,20));
    SetClientPassportData(CID, Edit64.Text, Edit65.Text);
    SetClientFNS(CID, Edit66.Text, Edit67.Text, Edit68.Text);
    SetClientSEX(CID, IntToStr(ClSEX));
    SetClientDOB(CID, DateToStr(DateTimePicker1.Date));
    SetClientConstantAddress(CID, Edit69.Text);
    SetClientTempAddress(CID, Edit70.Text);
    SetClientTelephone(CID, Edit71.Text);
  end
  else
    AddNewClient(Edit16.Text,GetBreakedString(Edit17,24),GetBreakedString(Edit41,3),GetBreakedString(Edit44,20),Edit64.Text,Edit65.Text,Edit66.Text,Edit67.Text,Edit68.Text,IntToStr(ClSEX),DateToStr(DateTimePicker1.Date),Edit69.Text,Edit70.Text,Edit71.Text);
end;

// Процедура установки названия компании
procedure TClInfoForm.CNameSaveBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  SetCompanyName(Memo1.Text);
  MakeNotifySound;
  ShowMessage('Название компании успешно установлено!');
end;

// Процедура установки адреса компании
procedure TClInfoForm.CAddrSaveBtnClick(Sender: TObject);
begin
  MakeButtonSound;
  SetCompanyAddress(Memo2.Text);
  MakeNotifySound;
  ShowMessage('Адрес компании успешно установлен!');
end;

procedure TClInfoForm.Edit71KeyPress(Sender: TObject; var Key: Char);
begin
  GetDigitalInput(Key);
end;

// Процедура вызываемая при изменени текста поля
// Комментарий: Обработка изменения последовательных Edit'ов
// При вводе символа курсор перемещается на следующий элемент
// При удалении курсор перемещается на предыдущий до конца строки
procedure TClInfoForm.EditsKeyPress(Sender: TObject; var Key: Char);
var ctrl : TControl;
begin
  if ManualEdit then
    if (Key = #8) then
      begin
        ctrl := ClInfoForm.FindChildControl(GetPrevControl((Sender as TEdit).Name,[1,17,41,44]));
        if (ctrl <> nil) then
        begin
          (ctrl as TEdit).SetFocus;
          (ctrl as TEdit).SelStart := 1;
        end;
      end
    else
      if not CheckControlEdge((Sender as TEdit).Name,[15,40,43,63]) then Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
