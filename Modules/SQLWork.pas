unit SQLWork;

interface

uses Classes, StdCtrls, SysUtils, Dialogs, ComCtrls, Forms, MMSystem, SystemUtils, CheckLst,
     SQLite3, SQLiteTable3;

// Общие методы работы базы

function CreateTables : boolean;
function CreateConnection(FilePath : string): boolean;
function GetNTabIndex(N : integer; ErrorMessage : string) : integer;
function GetItemIndex(SQL, ErrorMessage : string) : integer;
function GetToEDInfo(SQL, ErrorMessage : string; ED : TEdit = nil) : string;
procedure CheckVersionAndUpdate;
procedure FreeAndDestroy();
procedure ProcessSQL(SQL, ErrorMessage : string);
procedure GetToLBInfo(SQL, ErrorMessage : string; LB : TListBox = nil);
procedure GetToLBInfoFNS(SQL, ErrorMessage : string; LB : TListBox = nil);
procedure GetToCBInfo(SQL, ErrorMessage : string; CB : TComboBox = nil);

//Методы для списка клиентов

function GetClientID(const n : integer): integer;
procedure GetClientsList(var LB : TListBox);
procedure SearchClientsList(var LB : TListBox; const Family, Name, Surname : string);
procedure DeleteClient(ClientID : integer);
procedure DeleteClientCards(ClientID : integer);
procedure DeleteClientDiagnostic(ClientID : integer);

//Методы для информации о клиенте

// Функции и процедуры получения записи клиента
function GetInsCompanyName(ClientID : integer; ED : TEdit = nil) : string;
function    GetInsPolicyNumber(ClientID : integer) : string;
function GetClientLoyalityCode(ClientID : integer) : string;
function        GetSNILSNumber(ClientID : integer) : string;
function GetClientFNS(ClientID : integer; ED1 : TEdit = nil; ED2 : TEdit = nil; ED3 : TEdit = nil) : string;
function GetClientSEX(ClientID : integer) : boolean;
function GetClientDOB(ClientID : integer; DT : TDateTimePicker = nil) : TDateTime;
function GetClientConstantAddress(ClientID : integer; ED : TEdit = nil) : string;
function     GetClientTempAddress(ClientID : integer; ED : TEdit = nil) : string;
function       GetClientTelephone(ClientID : integer; ED : TEdit = nil) : string;
procedure GetClientPassportData(ClientID : integer; ED1 : TEdit = nil; ED2 : TEdit = nil);
procedure GetAllMedCardsNumbers(ClientID : integer; CB : TComboBox = nil);

// Процедура добавления нового клиента
procedure AddNewClient(InsCompany, InsPolicyNumber, Loyality_Code, SNILS, Passport_Serial, Passport_Number, Family, Name, Surname, Sex, BirthDate, Address, TempAddress, Telephone : string);

// Процедуры изменения записи клиента
procedure SetInsCompanyName(ClientID : integer; InsCompany : string);
procedure SetInsPolicyNumber(ClientID : integer; InsPolicyNumber : string);
procedure SetClientLoyalityCode(ClientID : integer; Loyality_Code : string);
procedure SetSNILSNumber(ClientID : integer; SNILS : string);
procedure SetClientFNS(ClientID : integer; Family, Name, Surname : string);
procedure SetClientSEX(ClientID : integer; Sex : string);
procedure SetClientDOB(ClientID : integer; BirthDate : string);
procedure SetClientConstantAddress(ClientID : integer; Address : string);
procedure SetClientTempAddress(ClientID : integer; TempAddress : string);
procedure SetClientTelephone(ClientID : integer; Telephone : string);
procedure SetClientPassportData(ClientID : integer; Passport_Serial, Passport_Number : string);

// Методы для списка карт

function GetCardNumber(const n : integer): integer;
function GetCardID(ClientID, CrdNum : integer) : integer;
procedure GetListMedCards(var LB : TListBox; ClientID : integer);
procedure DeleteClMedCard(ClientID : integer; CardNumber : string);

// Методы для редактора карт

function GetInspectionValue(ClientID : integer) : integer;
function GetNextCardNumber(ClientID : integer) : string;
function GetClCardDate(ClientID, CrdNum : integer) : TDateTime;
function GetClCardComplains(ClientID, CrdNum : integer) : string;
function GetClCardAnamnesis(ClientID, CrdNum : integer) : string;
function       GetClCardPSJ(ClientID, CrdNum : integer) : string;
function       GetClCardADS(ClientID, CrdNum : integer) : string;
function       GetClCardADL(ClientID, CrdNum : integer) : string;
function       GetClCardPLS(ClientID, CrdNum : integer) : string;
function       GetClCardNOB(ClientID, CrdNum : integer) : string;
function   GetClCardAddData(ClientID, CrdNum : integer) : string;
function GetClCardDiagnosis(ClientID, CrdNum : integer) : string;
function  GetClCardInspection(ClientID, CrdNum : integer) : integer;
function      GetClCardSkinID(ClientID, CrdNum : integer) : integer;
function     GetClCardLymphID(ClientID, CrdNum : integer) : integer;
function    GetClCardJointsID(ClientID, CrdNum : integer) : integer;
function   GetClCardPharynxID(ClientID, CrdNum : integer) : integer;
function   GetClCardTonsilsID(ClientID, CrdNum : integer) : integer;
function    GetClCardLightsID(ClientID, CrdNum : integer) : integer;
function GetClCardWheezingsID(ClientID, CrdNum : integer) : integer;
function    GetClCardHTonesID(ClientID, CrdNum : integer) : integer;
function     GetClCardPulseID(ClientID, CrdNum : integer) : integer;
function    GetClCardStomBPID(ClientID, CrdNum : integer) : integer;
function    GetClCardTongueID(ClientID, CrdNum : integer) : integer;
function      GetClCardStomID(ClientID, CrdNum : integer) : integer;
function     GetClCardLiverID(ClientID, CrdNum : integer) : integer;
function       GetClCardPewID(ClientID, CrdNum : integer) : integer;
function    GetClCardUrinatID(ClientID, CrdNum : integer) : integer;
function   GetClCardPasterSID(ClientID, CrdNum : integer) : integer;
function     GetClCardEdemaID(ClientID, CrdNum : integer) : integer;

function CheckAvail(ClientID, CardNumber : integer) : boolean;
function ClCardNumberVaild(ClientID, CrdNum, NewCrdNum : integer) : boolean;
function GetDiagID(Name : string) : integer;
function GetDiagName(ID : integer) : string;
function GetMethodID(Name : string; DiagID : integer) : integer;
function GetMethodName(ID : integer) : string;

procedure      GetSkinData(CB : TComboBox);
procedure     GetLymphData(CB : TComboBox);
procedure    GetJointsData(CB : TComboBox);
procedure   GetPharynxData(CB : TComboBox);
procedure   GetTonsilsData(CB : TComboBox);
procedure    GetLightsData(CB : TComboBox);
procedure GetWheezingsData(CB : TComboBox);
procedure    GetHTonesData(CB : TComboBox);
procedure     GetPulseData(CB : TComboBox);
procedure    GetStomBPData(CB : TComboBox);
procedure    GetTongueData(CB : TComboBox);
procedure      GetStomData(CB : TComboBox);
procedure     GetLiverData(CB : TComboBox);
procedure       GetPewData(CB : TComboBox);
procedure    GetUrinatData(CB : TComboBox);
procedure   GetPasterSData(CB : TComboBox);
procedure     GetEdemaData(CB : TComboBox);
procedure LoadUpMethods(ClientID, CrdNum : integer);
procedure LoadListDiagnostics(ClientID, CrdNum : integer; CLB : TCheckListBox);
procedure LoadListDiagnosticMethods(ClientID, CrdNum : integer; CLB1, CLB2 : TCheckListBox);

procedure SetClCardNumber(ClientID, CrdNum, NewCrdNum : integer);
procedure SetClCardInspection(ClientID, CrdNum, CrdInd : integer);
procedure SetClCardDate(ClientID, CrdNum : integer; DateStr : string);
procedure SetClCardComplains(ClientID, CrdNum : integer; ST : string);
procedure SetClCardAnamnesis(ClientID, CrdNum : integer; ST : string);
procedure       SetClCardPSJ(ClientID, CrdNum : integer; ST : string);
procedure       SetClCardADS(ClientID, CrdNum : integer; ST : string);
procedure       SetClCardADL(ClientID, CrdNum : integer; ST : string);
procedure       SetClCardPLS(ClientID, CrdNum : integer; ST : string);
procedure       SetClCardNOB(ClientID, CrdNum : integer; ST : string);
procedure   SetClCardAddData(ClientID, CrdNum : integer; ST : string);
procedure SetClCardDiagnosis(ClientID, CrdNum : integer; ST : string);
procedure      SetClCardSkinID(ClientID, CrdNum, CrdInd : integer);
procedure     SetClCardLymphID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardJointsID(ClientID, CrdNum, CrdInd : integer);
procedure   SetClCardPharynxID(ClientID, CrdNum, CrdInd : integer);
procedure   SetClCardTonsilsID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardLightsID(ClientID, CrdNum, CrdInd : integer);
procedure SetClCardWheezingsID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardHTonesID(ClientID, CrdNum, CrdInd : integer);
procedure     SetClCardPulseID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardStomBPID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardTongueID(ClientID, CrdNum, CrdInd : integer);
procedure      SetClCardStomID(ClientID, CrdNum, CrdInd : integer);
procedure     SetClCardLiverID(ClientID, CrdNum, CrdInd : integer);
procedure       SetClCardPewID(ClientID, CrdNum, CrdInd : integer);
procedure    SetClCardUrinatID(ClientID, CrdNum, CrdInd : integer);
procedure   SetClCardPasterSID(ClientID, CrdNum, CrdInd : integer);
procedure     SetClCardEdemaID(ClientID, CrdNum, CrdInd : integer);
procedure SaveListDiagnostics(ClientID, CrdNum : integer; CLB1, CLB2 : TCheckListBox);

procedure AddNewCard(ClientID,CardNumber,Inspection : integer; InsDate,Complains,Anamnesis : string; SkinID, LymphID, JointID, PharynxID, TonsilID, LightID, WheezID, ToneID, PulseID, SBPID, TongueID, StomachID, LiverID, PewID, UriID, PasSymID, EdemID : integer; PerkSoundJam, ADS, ADL, PulseBPM, NumbOfBreaths, AddData, Diagnosis : string);

// Методы для списка элементов

function CheckTableDeleteAvailable(TableID : integer; Item : string) : boolean;
function GetTableItemIndex(TableID : integer; Item : string) : integer;
function GetTableDiagName(STR : string) : string;
function GetTableMethodName(STR : string) : string;
procedure GetTableData(LB : TListBox; TableID : integer);
procedure DeleteTabElem(TableID : integer; Item : string);

var  SQLDB : TSQLiteDatabase;
     SQLTAB : TSQLiteTable;
     TMList : TStringList;

implementation

// Функция создания таблиц
// Возвращает True если таблицы созданы успешно и Else в противном случае
// Комментарий: В случае если база не найдена, то создается новая и пустая
// Таблицы для нее создаем программно
function CreateTables;
var query : string;
    F     : TextFile;
begin
  try
    query := '';
    Assign(F, SQLFilePath);
    Reset(F);
    While (not EOF(F)) do
      begin
        ReadLn(F, query);
        SQLDB.ExecSQL(UTF8Encode(query));
      end;
    Close(F);
    CreateTables := True;
  except
    CreateTables := False;
  end;
end;

// Функция создания подключения к базе-данных
// Вохвращает True если подключение выполнено и база готова к работе
// Else в противном случае
// Комментарий: Если файл базы данных не найден или в исходной базе нет таблиц
// Предпринимается попытка создание пустой базы со всеми таблицами
function CreateConnection;
begin
  try
    SQLDB := TSQLiteDatabase.Create(FilePath);
    if not SQLDB.TableExists('Clients') then
       if not CreateTables() then
       begin
          MakeErrorSound;
          ShowMessage('При создании базы произошла ошибка.');
          CreateConnection := false;
          exit;
       end;
    TMList := TStringList.Create;
    CreateConnection := true;
  except
    MakeErrorSound;
    ShowMessage('При создании базы произошла ошибка.');
    FreeAndDestroy();
    CreateConnection := false;
  end;
end;

function GetNTabIndex;
begin
  GetNTabIndex := -1;
  try
    SQLTAB.MoveTo(n);
    GetNTabIndex := SQLTAB.FieldAsInteger(0);
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

function GetItemIndex;
begin
  GetItemIndex := -1;
  try
    SQLTAB := SQLDB.GetTable(SQL);
    GetItemIndex := SQLTAB.FieldAsInteger(0);
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

function GetToEDInfo;
begin
  GetToEDInfo := '';
  try
    SQLTAB := SQLDB.GetTable(SQL);
    if (ED <> nil) then ED.Text := UTF8Decode(SQLTAB.FieldAsString(0));
    GetToEDInfo := UTF8Decode(SQLTAB.FieldAsString(0));
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

procedure CheckVersionAndUpdate;
begin
  //Version 1.1.0.0
end;

// Процедура освобождения ресурсов
procedure FreeAndDestroy;
begin
  SQLDB.Free;
  SQLTAB.Free;
  TMList.Free;
end;

procedure ProcessSQL;
begin
  try
    SQLDB.ExecSQL(SQL);
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

procedure GetToLBInfo;
var i : integer;
begin
  try
    SQLTAB := SQLDB.GetTable(SQL);
    if (LB <> nil) then
    begin
      LB.Clear;
      for i := 0 to SQLTAB.Count - 1 do
      begin
        LB.Items.Add(UTF8Decode(SQLTAB.FieldAsString(0)));
        SQLTAB.Next;
      end;
    end;
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

procedure GetToLBInfoFNS;
var i : integer;
begin
  try
    SQLTAB := SQLDB.GetTable(SQL);
    if (LB <> nil) then
    begin
      LB.Clear;
      for i := 0 to SQLTAB.Count - 1 do
      begin
        LB.Items.Add(UTF8Decode(SQLTAB.FieldAsString(1)) + ' ' + UTF8Decode(SQLTAB.FieldAsString(2)) + ' ' + UTF8Decode(SQLTAB.FieldAsString(3)));
        SQLTAB.Next;
      end;
    end;
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

procedure GetToCBInfo;
var i : integer;
begin
  try
    SQLTAB := SQLDB.GetTable(SQL);
    if (CB <> nil) then
    begin
      CB.Clear;
      for i := 0 to SQLTAB.Count - 1 do
      begin
        CB.Items.Add(UTF8Decode(SQLTAB.FieldAsString(0)));
        SQLTAB.Next;
      end;
    end;
  except
    MakeErrorSound;
    ShowMessage(ErrorMessage);
  end;
end;

//*****************************************************************************
// Client Selector
//*****************************************************************************

// Функция получения ID клиента
function GetClientID;
begin
  GetClientID := GetNTabIndex(n,'Ошибка получения идентификатора клиента!');
end;

// Процедура получения списка клиентов
procedure GetClientsList;
begin
  GetToLBinfoFNS('Select Client_ID,Family,Name,Surname FROM Clients ORDER BY Family ASC','Ошибка получения списка клиентов!',LB);
end;

// Процедура поиска клиента
procedure SearchClientsList;
var query : string;
begin
  query := 'Select Client_ID,Family,Name,Surname FROM Clients ORDER BY Family ASC';
  if ((Family <> '') or (Name <> '') or (Surname <> '')) then
  begin
    query := 'Select Client_ID,Family,Name,Surname FROM Clients WHERE ';
    if (Family<>'') then query := query + 'Family = ("' + UTF8Encode(Family) + '")';
    if ((Family<>'') and (Name<>'')) then query := query + ' AND ';
    if (Name<>'') then query := query + 'Name = ("' + UTF8Encode(Name) + '")';
    if ((Name<>'') and (Surname<>'')) then query := query + ' AND '
    else if ((Family<>'') and (Surname<>'')) then query := query + ' AND ';
    if (Surname<>'') then query := query + 'Surname = ("' + UTF8Encode(Surname) + '")';
    query := query + 'ORDER BY Family ASC';
  end;
  GetToLBinfoFNS(query,'Ошибка получения списка клиентов!',LB);
end;

// Процедура удаления клиента из базы
// Комментарий: Сначала удаляем все зависимости клиента, т.е мед карты и диагностики
procedure DeleteClient;
begin
  DeleteClientCards(ClientID);
  DeleteClientDiagnostic(ClientID);
  ProcessSQL('DELETE FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка выполнения запроса на удаление клиента!');
end;

// Процедура удаления всех мед-карт клиента
procedure DeleteClientCards;
begin
  ProcessSQL('DELETE FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка выполнения запроса на удаление мед-карт!');
end;

// Процедура удаления всех диагностик клиента
procedure DeleteClientDiagnostic;
begin
  ProcessSQL('DELETE FROM DiagTable WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка выполнения запроса на удаление диагностик!');
end;

//****************************************************************************
// Client Info
//****************************************************************************

// Функция получения названия страховой компании
// Возвращает строку с названием страховой компании
function GetInsCompanyName;
begin
  GetInsCompanyName := GetToEDInfo('SELECT InsCompany FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения названия страховой компании!',ED);
end;

// Функция получения номера страхового полиса
// Возвращает строку с номером страхового полиса
function GetInsPolicyNumber;
begin
  GetInsPolicyNumber := GetToEDInfo('SELECT InsPolicyNumber FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения номера полиса!');
end;

// Функция получения кода льготы
// Возвращает строку с кодом льготы
function GetClientLoyalityCode;
begin
  GetClientLoyalityCode := GetToEDInfo('SELECT Loyality_Code FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения кода льготы!');
end;

// Функция получения СНИЛС
// Возвращает строку с номером СНИЛС
function GetSNILSNumber;
begin
  GetSNILSNumber := GetToEDInfo('SELECT SNILS FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения СНИЛС!')
end;

// Функция получения фамилии, имени и отчества клиента
// Возвращает строку фамилией + _ + именем + _ + отчеством клиента
function GetClientFNS;
begin
  try
    SQLTAB := SQLDB.GetTable('SELECT Family,Name,Surname FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)));
    if (ED1 <> nil) then ED1.Text := UTF8Decode(SQLTAB.FieldAsString(0));
    if (ED2 <> nil) then ED2.Text := UTF8Decode(SQLTAB.FieldAsString(1));
    if (ED3 <> nil) then ED3.Text := UTF8Decode(SQLTAB.FieldAsString(2));
    GetClientFNS := UTF8Decode(SQLTAB.FieldAsString(0)) + ' ' + UTF8Decode(SQLTAB.FieldAsString(1)) + ' ' + UTF8Decode(SQLTAB.FieldAsString(2))
  except
    MakeErrorSound;
    ShowMessage('Ошибка получения фамилии, имени и отчества клиента!');
  end;
end;

// Функция получения пола клиента
// Возвращает True если пол Мужской и Else в ином случае
function GetClientSEX;
begin
  GetClientSex := True;
  try
    SQLTAB := SQLDB.GetTable('SELECT Sex FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)));
    if (SQLTAB.FieldAsInteger(0) = 0) then GetClientSEX := True else GetClientSEX := False;
  except
    MakeErrorSound;
    ShowMessage('Ошибка получения пола клиента!');
  end;
end;

// Функция получения даты рождения клиента
// Возвращает дату рождения
function GetClientDOB;
begin
  GetClientDOB := Now;
  try
    SQLTAB := SQLDB.GetTable('SELECT BirthDate FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)));
    if (DT <> nil) then DT.Date := StrToDateTime(UTF8Decode(SQLTAB.FieldAsString(0)));
    GetClientDOB := StrToDateTime(UTF8Decode(SQLTAB.FieldAsString(0)));
  except
    MakeErrorSound;
    ShowMessage('Ошибка получения даты рождения!');
  end;
end;

// Функция получения постоянного места жительства клиента
// Возвращает строку с адресом
function GetClientConstantAddress;
begin
  GetClientConstantAddress := GetToEDInfo('SELECT Address FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения постоянного адреса!',ED);
end;

// Функция получения временного места жительства клиента
// Возвращает строку с адресом
function GetClientTempAddress;
begin
  GetClientTempAddress := GetToEDInfo('SELECT TempAddress FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения временного адреса!',ED);
end;

// Функция получения телефона клиента
// Возвращает строку с телефоном клиента
function GetClientTelephone;
begin
  GetClientTelephone := GetToEDInfo('SELECT Telephone FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения телефона клиента!',ED);
end;

// Процедура получения данных паспорта клиента
procedure GetClientPassportData;
begin
  try
    SQLTAB := SQLDB.GetTable('SELECT Passport_Serial,Passport_Number FROM Clients WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)));
    ED1.Text := UTF8Decode(SQLTAB.FieldAsString(0));
    ED2.Text := UTF8Decode(SQLTAB.FieldAsString(1));
  except
    MakeErrorSound;
    ShowMessage('Ошибка получения данных паспорта!');
  end;
end;

// Процедура получения списка мед-карт
procedure GetAllMedCardsNumbers;
begin
  GetToCBInfo('SELECT CardNumber FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения списка номеров карт!',CB);
end;

// Процедура добавления нового клиента
procedure AddNewClient;
var query : string;
begin
  query := 'INSERT INTO Clients(Family,Name,Surname,Sex,BirthDate,Telephone,Address,TempAddress,InsCompany,InsPolicyNumber,SNILS,Loyality_Code,Passport_Serial,Passport_Number) VALUES (';
  query := query + '"' + UTF8Encode(Family) +'","';
  query := query + UTF8Encode(Name) + '","';
  query := query + UTF8Encode(Surname) + '",';
  query := query + UTF8Encode(Sex) + ',"';
  query := query + UTF8Encode(BirthDate) + '","';
  query := query + UTF8Encode(Telephone) + '","';
  query := query + UTF8Encode(Address) + '","';
  query := query + UTF8Encode(TempAddress) + '","';
  query := query + UTF8Encode(InsCompany) + '","';
  query := query + UTF8Encode(InsPolicyNumber) + '","';
  query := query + UTF8Encode(SNILS) + '","';
  query := query + UTF8Encode(Loyality_Code) + '","';
  query := query + UTF8Encode(Passport_Serial) + '","';
  query := query + UTF8Encode(Passport_Number) + '"';
  query := query + ')';
  ProcessSQL(query,'Не удалось добавить клиента в базу!');
end;

// Процедура обновления названия страховой компании
procedure SetInsCompanyName;
begin
  ProcessSQL('UPDATE Clients SET InsCompany = ("' + UTF8Encode(InsCompany) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления номера страхового полиса
procedure SetInsPolicyNumber;
begin
  ProcessSQL('UPDATE Clients SET InsPolicyNumber = ("' + UTF8Encode(InsPolicyNumber) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления кода льготы
procedure SetClientLoyalityCode;
begin
  ProcessSQL('UPDATE Clients SET Loyality_Code = ("' + UTF8Encode(Loyality_Code) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления СНИЛС
procedure SetSNILSNumber;
begin
  ProcessSQL('UPDATE Clients SET SNILS = ("' + UTF8Encode(SNILS) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления фамилии, имени и отчества
procedure SetClientFNS;
begin
  ProcessSQL('UPDATE Clients SET Family = ("' + UTF8Encode(Family) + '"),Name = ("' + UTF8Encode(Name) + '"),Surname = ("' + UTF8Encode(Surname) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления пола
procedure SetClientSEX;
begin
  ProcessSQL('UPDATE Clients SET Sex = ' + UTF8Encode(Sex) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления даты рождения
procedure SetClientDOB;
begin
  ProcessSQL('UPDATE Clients SET BirthDate = ("' + UTF8Encode(BirthDate) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

procedure SetClientConstantAddress;
begin
  ProcessSQL('UPDATE Clients SET Address = ("' + UTF8Encode(Address) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

procedure SetClientTempAddress;
begin
  ProcessSQL('UPDATE Clients SET TempAddress = ("' + UTF8Encode(TempAddress) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления телефона клиента
procedure SetClientTelephone;
begin
  ProcessSQL('UPDATE Clients SET Telephone = ("' + UTF8Encode(Telephone) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

// Процедура обновления данных паспорта клиента
procedure SetClientPassportData;
begin
  ProcessSQL('UPDATE Clients SET Passport_Serial = ("' + UTF8Encode(Passport_Serial) + '"),Passport_Number = ("' + UTF8Encode(Passport_Number) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка обновления названия страховой компании!');
end;

//*****************************************************************************
// Cards Selector
//*****************************************************************************

// Функция получения ID клиента
function GetCardNumber;
begin
  GetCardNumber := GetNTabIndex(n,'Ошибка получения номера карты!');
end;

function GetCardID;
begin
  GetCardID := GetItemIndex('SELECT Card_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения идентификатора мед-карты');
end;

// Процедура получения списка мед-карт
procedure GetListMedCards;
begin
  GetToLBInfo('Select CardNumber FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' ORDER BY CardNumber ASC','Ошибка получения списка мед-карт!',LB);
end;

procedure DeleteClMedCard;
begin
  ProcessSQL('DELETE FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(CardNumber),'Ошибка выполнения запроса на удаление мед-карты!');
end;

//*****************************************************************************
// Card Editor
//*****************************************************************************

function GetInspectionValue;
begin
  GetInspectionValue := 0;
  GetToLBInfo('SELECT CardNumber FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения номеров мед-карт');
  if (SQLTAB.Count > 0) then GetInspectionValue := 1;
end;

function GetNextCardNumber;
var ts : string;
begin

  ts := GetToEDInfo('SELECT MAX(CardNumber)+1 FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)),'Ошибка получения нового номера карты');
  if (ts <> '') then GetNextCardNumber := ts
  else GetNextCardNumber := '1';
end;

function GetClCardInspection;
begin
  GetClCardInspection := GetItemIndex('SELECT Inspection FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса обследования');
end;

function GetClCardDate;
begin
  GetClCardDate := StrToDate(GetToEDInfo('SELECT InsDate FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения даты обследования'));
end;

function GetClCardComplains;
begin
  GetClCardComplains := GetToEDInfo('SELECT Complains FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения жалоб');
end;

function GetClCardAnamnesis;
begin
  GetClCardAnamnesis := GetToEDInfo('SELECT Anamnesis FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения анамнезиса');
end;

function GetClCardSkinID;
begin
  GetClCardSkinID := GetItemIndex('SELECT Skin_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса кожных покровов');
end;

function GetClCardLymphID;
begin
  GetClCardLymphID := GetItemIndex('SELECT Lymph_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса лимфатических узлов');
end;

function GetClCardJointsID;
begin
  GetClCardJointsID := GetItemIndex('SELECT Joint_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса суставов');
end;

function GetClCardPharynxID;
begin
  GetClCardPharynxID := GetItemIndex('SELECT Pharynx_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса зева');
end;

function GetClCardTonsilsID;
begin
  GetClCardTonsilsID := GetItemIndex('SELECT Tonsil_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса миндалин');
end;

function GetClCardLightsID;
begin
  GetClCardLightsID := GetItemIndex('SELECT Light_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса дыхания в легких');
end;

function GetClCardWheezingsID;
begin
  GetClCardWheezingsID := GetItemIndex('SELECT Wheez_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса хрипов');
end;

function GetClCardHTonesID;
begin
  GetClCardHTonesID := GetItemIndex('SELECT Tone_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса тона сердца');
end;

function GetClCardPulseID;
begin
  GetClCardPulseID := GetItemIndex('SELECT Pulse_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса пульса');
end;

function GetClCardStomBPID;
begin
  GetClCardStomBPID := GetItemIndex('SELECT SBP_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса боли при пальпации');
end;

function GetClCardTongueID;
begin
  GetClCardTongueID := GetItemIndex('SELECT Tongue_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса языка');
end;

function GetClCardStomID;
begin
  GetClCardStomID := GetItemIndex('SELECT Stomach_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса живота');
end;

function GetClCardLiverID;
begin
  GetClCardLiverID := GetItemIndex('SELECT Liver_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса печени');
end;

function GetClCardPewID;
begin
  GetClCardPewID := GetItemIndex('SELECT Pew_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса стула');
end;

function GetClCardUrinatID;
begin
  GetClCardUrinatID := GetItemIndex('SELECT Uri_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса мочеиспускания');
end;

function GetClCardPasterSID;
begin
  GetClCardPasterSID := GetItemIndex('SELECT PasSym_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса симптома пастернацкого');
end;

function GetClCardEdemaID;
begin
  GetClCardEdemaID := GetItemIndex('SELECT Edem_ID FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения индекса отеков');
end;

function GetClCardPSJ;
begin
  GetClCardPSJ := GetToEDInfo('SELECT PerkSoundJam FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения притупления перкуторного звука');
end;

function GetClCardADS;
begin
  GetClCardADS := GetToEDInfo('SELECT AD_S FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения артериального давления сидя');
end;

function GetClCardADL;
begin
  GetClCardADL := GetToEDInfo('SELECT AD_L FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения артериального давления лежа');
end;

function GetClCardPLS;
begin
  GetClCardPLS := GetToEDInfo('SELECT PulseBPM FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения пульса');
end;

function GetClCardNOB;
begin
  GetClCardNOB := GetToEDInfo('SELECT NumbOfBreaths FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения количества дыханий в минуту');
end;

function GetClCardAddData;
begin
  GetClCardAddData := GetToEDInfo('SELECT AdditionalInspection FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения дополнительных данных');
end;

function GetClCardDiagnosis;
begin
  GetClCardDiagnosis := GetToEDInfo('SELECT Diagnosis FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения диагноза');
end;

function CheckAvail;
begin
  CheckAvail := False;
  GetToLBInfo('SELECT CardNumber FROM MedCards WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CardNumber)),'Ошибка получения номера карты');
  if (SQLTAB.Count = 0) then CheckAvail := True;
end;

function ClCardNumberVaild;
begin
  if (CrdNum <> -1) then
    if (CrdNum = NewCrdNum) then ClCardNumberVaild := True
    else ClCardNumberVaild := CheckAvail(ClientID,NewCrdNum)
  else
    if (NewCrdNum <= 0) then ClCardNumberVaild := False
    else ClCardNumberVaild := CheckAvail(ClientID,NewCrdNum);
end;

function GetDiagID;
begin
  GetDiagID := GetItemIndex('SELECT Diag_ID FROM Diagnostics WHERE DiagName = "' + UTF8Encode(Name) + '"','Ошибка получения индекса диагностики')
end;

function GetDiagName;
begin
  GetDiagName := GetToEDInfo('SELECT DiagName FROM Diagnostics WHERE Diag_ID = ' + UTF8Encode(IntToStr(ID)),'Ошибка получения индекса диагностики')
end;

function GetMethodID;
begin
  GetMethodID := GetItemIndex('SELECT Method_ID FROM DiagMethods WHERE MethodName = "' + UTF8Encode(Name) + '" AND Diag_ID = ' + UTF8Encode(IntToStr(DiagID)),'Ошибка получения индекса диагностики')
end;

function GetMethodName;
begin
  GetMethodName := GetToEDInfo('SELECT MethodName FROM DiagMethods WHERE Method_ID = ' + UTF8Encode(IntToStr(ID)),'Ошибка получения индекса диагностики')
end;

procedure GetSkinData;
begin
  GetToCBInfo('SELECT SkinName FROM SkinTable','Ошибка получения списка видов кожных покровов!',CB);
end;

procedure GetLymphData;
begin
  GetToCBInfo('SELECT LymphName FROM LymphNodesTable','Ошибка получения списка видов лимфатических узлов!',CB);
end;

procedure GetJointsData;
begin
  GetToCBInfo('SELECT JointName FROM JointsTable','Ошибка получения списка видов суставов!',CB);
end;

procedure GetPharynxData;
begin
  GetToCBInfo('SELECT PharynxName FROM PharynxTable','Ошибка получения списка видов зеваний!',CB);
end;

procedure GetTonsilsData;
begin
  GetToCBInfo('SELECT TonsilName FROM TonsilsTable','Ошибка получения списка видов миндалин!',CB);
end;

procedure GetLightsData;
begin
  GetToCBInfo('SELECT LightName FROM LightsTable','Ошибка получения списка видов дыхания в легких!',CB);
end;

procedure GetWheezingsData;
begin
  GetToCBInfo('SELECT WheezName FROM WheezingsTable','Ошибка получения списка видов хрипов!',CB);
end;

procedure GetHTonesData;
begin
  GetToCBInfo('SELECT ToneName FROM TonesTable','Ошибка получения списка видов тонов сердца!',CB);
end;

procedure GetPulseData;
begin
  GetToCBInfo('SELECT PulseName FROM PulseTable','Ошибка получения списка видов пульса!',CB);
end;

procedure GetStomBPData;
begin
  GetToCBInfo('SELECT SBPName FROM StomBPTable','Ошибка получения списка видов боли при пальпации!',CB);
end;

procedure GetTongueData;
begin
  GetToCBInfo('SELECT TongueName FROM TongueTable','Ошибка получения списка видов языка!',CB);
end;

procedure GetStomData;
begin
  GetToCBInfo('SELECT StomachName FROM StomachTable','Ошибка получения списка видов живота!',CB);
end;

procedure GetLiverData;
begin
  GetToCBInfo('SELECT LiverName FROM LiverTable','Ошибка получения списка видов печени!',CB);
end;

procedure GetPewData;
begin
  GetToCBInfo('SELECT PewName FROM PewTable','Ошибка получения списка видов стула!',CB);
end;

procedure GetUrinatData;
begin
  GetToCBInfo('SELECT UriName FROM UrinationTable','Ошибка получения списка видов мочеиспускания!',CB);
end;

procedure GetPasterSData;
begin
  GetToCBInfo('SELECT PasSymName FROM PastSymptomsTable','Ошибка получения списка симптомов пастернацкого!',CB);
end;

procedure GetEdemaData;
begin
  GetToCBInfo('SELECT EdemName FROM EdemaTable','Ошибка получения списка видов отеков!',CB);
end;

procedure LoadListDiagnostics;
var i : integer;
begin
  if (CrdNum <> -1) then
  begin
    GetToLBInfo('SELECT DiagName FROM Diagnostics','Ошибка получения списка диагностик',TListBox(CLB));
    GetToLBInfo('SELECT Diag_ID FROM DiagTable INNER JOIN DiagMethods ON DiagTable.Method_ID = DiagMethods.Method_ID INNER JOIN MedCards ON DiagTable.Card_ID = MedCards.Card_ID WHERE DiagTable.Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)) + ' GROUP BY Diag_ID','Ошибка получения номеров диагностик');
    for i := 0 to SQLTab.Count - 1 do
    begin
      CLB.Checked[SQLTAB.FieldAsInteger(0)-1] := True;
      SQLTAB.Next;
    end;
  end
  else
  begin
    GetToLBInfo('SELECT DiagName FROM Diagnostics','Ошибка получения диагностик',TListBox(CLB));
  end;
end;

procedure LoadUpMethods;
var i : integer;
begin
  TMList.Clear;
  if (CrdNum <> -1) then
  begin
    GetToLBInfo('SELECT MethodName, Diag_ID FROM DiagTable INNER JOIN DiagMethods ON DiagTable.Method_ID = DiagMethods.Method_ID INNER JOIN MedCards ON DiagTable.Card_ID = MedCards.Card_ID WHERE DiagTable.Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения названий методов диагностики');
    for i := 0 to SQLTAB.Count - 1 do
    begin
      TMlist.Add(UTF8Decode(SQLTAB.FieldAsString(0) + '=' + SQLTAB.FieldAsString(1)));
      SQLTAB.Next;
    end;
  end;
end;

procedure LoadListDiagnosticMethods;
var cnd : TCheckBoxState;
    i   : integer;
begin
  CLB2.Clear;
  if (CLB1.ItemIndex <> -1) then
  begin
    if (not CLB1.Checked[CLB1.ItemIndex]) then cnd := cbGrayed else cnd := cbUnchecked;
    GetToLBInfo('SELECT MethodName FROM DiagMethods WHERE Diag_ID = ' + UTF8Encode(IntToStr(CLB1.ItemIndex + 1)),'Ошибка получения списка методов диагностик',TListBox(CLB2));
    for i := 0 to CLB2.Count - 1 do
      CLB2.State[i] := cnd;
    if (cnd <> cbGrayed) then
      if (TMList.Count > 0) then
        for i := 0 to TMList.Count - 1 do
          if (CLB2.Items.IndexOf(TMList.Names[i]) <> -1) then
            CLB2.Checked[CLB2.Items.IndexOf(TMList.Names[i])] := True;
  end;
end;

procedure SetClCardNumber;
begin
  ProcessSQL('UPDATE MedCards SET CardNumber = ' + UTF8Encode(IntToStr(NewCrdNum)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardInspection;
begin
  ProcessSQL('UPDATE MedCards SET Inspection = ' + UTF8Encode(IntToStr(CrdInd)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardDate;
begin
  ProcessSQL('UPDATE MedCards SET InsDate = ("' + UTF8Encode(DateStr) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardComplains;
begin
  ProcessSQL('UPDATE MedCards SET Complains = ("' + UTF8Encode(ST) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardAnamnesis;
begin
  ProcessSQL('UPDATE MedCards SET Anamnesis = ("' + UTF8Encode(ST) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardSkinID;
begin
  ProcessSQL('UPDATE MedCards SET Skin_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardLymphID;
begin
  ProcessSQL('UPDATE MedCards SET Lymph_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardJointsID;
begin
  ProcessSQL('UPDATE MedCards SET Joint_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPharynxID;
begin
  ProcessSQL('UPDATE MedCards SET Pharynx_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardTonsilsID;
begin
  ProcessSQL('UPDATE MedCards SET Tonsil_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardLightsID;
begin
  ProcessSQL('UPDATE MedCards SET Light_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardWheezingsID;
begin
  ProcessSQL('UPDATE MedCards SET Wheez_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardHTonesID;
begin
  ProcessSQL('UPDATE MedCards SET Tone_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPulseID;
begin
  ProcessSQL('UPDATE MedCards SET Pulse_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardStomBPID;
begin
  ProcessSQL('UPDATE MedCards SET SBP_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardTongueID;
begin
  ProcessSQL('UPDATE MedCards SET Tongue_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardStomID;
begin
  ProcessSQL('UPDATE MedCards SET Stomach_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardLiverID;
begin
  ProcessSQL('UPDATE MedCards SET Liver_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPewID;
begin
  ProcessSQL('UPDATE MedCards SET Pew_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardUrinatID;
begin
  ProcessSQL('UPDATE MedCards SET Uri_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPasterSID;
begin
  ProcessSQL('UPDATE MedCards SET PasSym_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardEdemaID;
begin
  ProcessSQL('UPDATE MedCards SET Edem_ID = ' + UTF8Encode(IntToStr(CrdInd + 1)) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPSJ;
begin
  ProcessSQL('UPDATE MedCards SET PerkSoundJam = ("' + UTF8Encode(ST) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardADS;
begin
  ProcessSQL('UPDATE MedCards SET AD_S = ' + UTF8Encode(ST) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardADL;
begin
  ProcessSQL('UPDATE MedCards SET AD_L = ' + UTF8Encode(ST) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardPLS;
begin
  ProcessSQL('UPDATE MedCards SET PulseBPM = ' + UTF8Encode(ST) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardNOB;
begin
  ProcessSQL('UPDATE MedCards SET NumbOfBreaths = ' + UTF8Encode(ST) + ' WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardAddData;
begin
  ProcessSQL('UPDATE MedCards SET AdditionalInspection = ("' + UTF8Encode(ST) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure SetClCardDiagnosis;
begin
  ProcessSQL('UPDATE MedCards SET Diagnosis = ("' + UTF8Encode(ST) + '") WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка обновления номера карты');
end;

procedure AddNewCard;
var query : string;
begin
  query := 'INSERT INTO MedCards(CardNumber,Client_ID,Inspection,InsDate,Complains,Anamnesis,Skin_ID,Lymph_ID,Joint_ID,Pharynx_ID,Tonsil_ID,NumbOfBreaths,Light_ID,Wheez_ID,PerkSoundJam,Tone_ID,AD_S,';
  query := query + 'AD_L,PulseBPM,Pulse_ID,Tongue_ID,Stomach_ID,SBP_ID,Liver_ID,Pew_ID,Uri_ID,PasSym_ID,Edem_ID,AdditionalInspection,Diagnosis) VALUES (';
  query := query + UTF8Encode(IntToStr(CardNumber)) +',';
  query := query + UTF8Encode(IntToStr(ClientID)) +',';
  query := query + UTF8Encode(IntToStr(Inspection)) +',"';
  query := query + UTF8Encode(InsDate) +'","';
  query := query + UTF8Encode(Complains) + '","';
  query := query + UTF8Encode(Anamnesis) + '",';
  query := query + UTF8Encode(IntToStr(SkinID + 1)) +',';
  query := query + UTF8Encode(IntToStr(LymphID + 1)) +',';
  query := query + UTF8Encode(IntToStr(JointID + 1)) +',';
  query := query + UTF8Encode(IntToStr(PharynxID + 1)) +',';
  query := query + UTF8Encode(IntToStr(TonsilID + 1)) +',';
  query := query + UTF8Encode(NumbOfBreaths) +',';
  query := query + UTF8Encode(IntToStr(LightID + 1)) +',';
  query := query + UTF8Encode(IntToStr(WheezID + 1)) +',"';
  query := query + UTF8Encode(PerkSoundJam) +'",';
  query := query + UTF8Encode(IntToStr(ToneID + 1)) +',';
  query := query + UTF8Encode(ADS) +',';
  query := query + UTF8Encode(ADL) + ',';
  query := query + UTF8Encode(PulseBPM) + ',';
  query := query + UTF8Encode(IntToStr(PulseID + 1)) +',';
  query := query + UTF8Encode(IntToStr(TongueID + 1)) +',';
  query := query + UTF8Encode(IntToStr(StomachID + 1)) +',';
  query := query + UTF8Encode(IntToStr(SBPID + 1)) +',';
  query := query + UTF8Encode(IntToStr(LiverID + 1)) +',';
  query := query + UTF8Encode(IntToStr(PewID + 1)) +',';
  query := query + UTF8Encode(IntToStr(UriID + 1)) +',';
  query := query + UTF8Encode(IntToStr(PasSymID + 1)) +',';
  query := query + UTF8Encode(IntToStr(EdemID + 1)) +',"';
  query := query + UTF8Encode(AddData) + '","';
  query := query + UTF8Encode(Diagnosis) + '"';
  query := query + ')';
  ProcessSQL(query,'Не удалось добавить карту в базу!');
end;

procedure SaveListDiagnostics;
var i : integer;
begin
  for i := 0 to TMList.Count - 1 do
    if (CLB1.State[CLB1.Items.IndexOf(GetDiagName(StrToInt(TMList.ValueFromIndex[i])))] = cbUnchecked) then TMList.Delete(i);
  GetToLBInfo('SELECT DiagTable.Method_ID,DiagTable.Card_ID,MethodName FROM DiagTable INNER JOIN DiagMethods ON DiagTable.Method_ID = DiagMethods.Method_ID INNER JOIN MedCards ON DiagTable.Card_ID = MedCards.Card_ID WHERE DiagTable.Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)),'Ошибка получения методов диагностик');
  for i := 0 to SQLTAB.Count - 1 do
  begin
    if (TMList.IndexOfName(UTF8Decode(SQLTAB.FieldAsString(2))) = -1) then
    begin
      ProcessSQL('DELETE FROM DiagTable WHERE Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND Method_ID = ' + UTF8Encode(IntToStr(SQLTAB.FieldAsInteger(0))) + ' AND Card_ID = ' + UTF8Encode(IntToStr(SQLTAB.FieldAsInteger(1))),'Ошибка удаления диагностики');
    end;
    SQLTAB.Next;
  end;
  SQLTAB.MoveFirst;
  for i := 0 to TMList.Count - 1 do
  begin
    GetToLBInfo('SELECT MethodName FROM DiagTable INNER JOIN DiagMethods ON DiagTable.Method_ID = DiagMethods.Method_ID INNER JOIN MedCards ON DiagTable.Card_ID = MedCards.Card_ID WHERE DiagTable.Client_ID = ' + UTF8Encode(IntToStr(ClientID)) + ' AND CardNumber = ' + UTF8Encode(IntToStr(CrdNum)) + ' AND MethodName = "' + UTF8Encode(TMList.Names[i]) + '"','Ошибка получения метода диагностики');
    if (SQLTAB.Count = 0) then
      ProcessSQL('INSERT INTO DiagTable(Client_ID,Card_ID,Method_ID) VALUES(' + UTF8Encode(IntToStr(ClientID)) + ',' + UTF8Encode(IntToStr(GetCardID(ClientID, CrdNum))) + ',' + UTF8Encode(IntToStr(GetMethodID(TMList.Names[i],StrToInt(TMList.ValueFromIndex[i])))) + ')','Ошибка записи диагностики');
  end;
end;

//*****************************************************************************
// Elem selector
//*****************************************************************************

function CheckTableDeleteAvailable;
var ind, i : integer;
    str    : string;
    res    : boolean;
begin
  res := False;
  ind := GetTableItemIndex(TableID,Item);
  case TableID of
    1 : GetToLBInfo('SELECT Skin_ID FROM MedCards WHERE Skin_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    2 : GetToLBInfo('SELECT Lymph_ID FROM MedCards WHERE Lymph_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    3 : GetToLBInfo('SELECT Joint_ID FROM MedCards WHERE Joint_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    4 : GetToLBInfo('SELECT Pharynx_ID FROM MedCards WHERE Pharynx_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    5 : GetToLBInfo('SELECT Tonsil_ID FROM MedCards WHERE Tonsil_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    6 : GetToLBInfo('SELECT Light_ID FROM MedCards WHERE Light_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    7 : GetToLBInfo('SELECT Wheez_ID FROM MedCards WHERE Wheez_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    8 : GetToLBInfo('SELECT Tone_ID FROM MedCards WHERE Tone_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    9 : GetToLBInfo('SELECT Pulse_ID FROM MedCards WHERE Pulse_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    10 : GetToLBInfo('SELECT SBP_ID FROM MedCards WHERE SBP_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    11 : GetToLBInfo('SELECT Tongue_ID FROM MedCards WHERE Tongue_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    12 : GetToLBInfo('SELECT Stomach_ID FROM MedCards WHERE Stomach_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    13 : GetToLBInfo('SELECT Liver_ID FROM MedCards WHERE Liver_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    14 : GetToLBInfo('SELECT Pew_ID FROM MedCards WHERE Pew_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    15 : GetToLBInfo('SELECT Uri_ID FROM MedCards WHERE Uri_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    16 : GetToLBInfo('SELECT PasSym_ID FROM MedCards WHERE PasSym_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    17 : GetToLBInfo('SELECT Edem_ID FROM MedCards WHERE Edem_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    18 : GetToLBInfo('SELECT Diag_ID FROM DiagMethods WHERE Diag_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
    19 : GetToLBInfo('SELECT Method_ID FROM DiagTable WHERE Method_ID = ' + UTF8Encode(IntToStr(ind)),'Ошибка получения кожных покровов');
  end;
  if (SQLTAB.Count = 0) then res := True;
  if ((TableID = 18) and res) then
    for i := 0 to TMList.Count - 1 do
      res := res and (StrToInt(TMList.ValueFromIndex[i]) <> ind);
  if ((TableID = 19) and res) then
  begin
    str := GetMethodName(ind);
    for i := 0 to TMList.Count - 1 do
      res := res and (TMList.Names[i] <> str);
  end;
  CheckTableDeleteAvailable := res;
end;

function GetTableDiagName;
begin
  GetTableDiagName := Copy(STR, 0, Pos(': ',STR) - 1);
end;

function GetTableMethodName;
begin
  GetTableMethodName := Copy(STR, Pos(': ',STR) + 2, length(STR) - 1);
end;

function GetTableItemIndex;
begin
  GetTableItemIndex := -1;
  case TableID of
    1 : GetTableItemIndex := GetItemIndex('SELECT Skin_ID FROM SkinTable WHERE SkinName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    2 : GetTableItemIndex := GetItemIndex('SELECT Lymph_ID FROM LymphNodesTable WHERE LymphName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    3 : GetTableItemIndex := GetItemIndex('SELECT Joint_ID FROM JointsTable WHERE JointName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    4 : GetTableItemIndex := GetItemIndex('SELECT Pharynx_ID FROM PharynxTable WHERE PharynxName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    5 : GetTableItemIndex := GetItemIndex('SELECT Tonsil_ID FROM TonsilsTable WHERE TonsilName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    6 : GetTableItemIndex := GetItemIndex('SELECT Light_ID FROM LightsTable WHERE LightName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    7 : GetTableItemIndex := GetItemIndex('SELECT Wheez_ID FROM WheezingsTable WHERE WheezName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    8 : GetTableItemIndex := GetItemIndex('SELECT Tone_ID FROM TonesTable WHERE ToneName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    9 : GetTableItemIndex := GetItemIndex('SELECT Pulse_ID FROM PulseTable WHERE PulseName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    10 : GetTableItemIndex := GetItemIndex('SELECT SBP_ID FROM  StomBPTable WHERE SBPName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    11 : GetTableItemIndex := GetItemIndex('SELECT Tongue_ID FROM TongueTable WHERE TongueName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    12 : GetTableItemIndex := GetItemIndex('SELECT Stomach_ID FROM StomachTable WHERE StomachName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    13 : GetTableItemIndex := GetItemIndex('SELECT Liver_ID FROM LiverTable WHERE LiverName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    14 : GetTableItemIndex := GetItemIndex('SELECT Pew_ID FROM PewTable WHERE PewName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    15 : GetTableItemIndex := GetItemIndex('SELECT Uri_ID FROM UrinationTable WHERE UriName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    16 : GetTableItemIndex := GetItemIndex('SELECT PasSym_ID FROM PastSymptomsTable WHERE PasSymName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    17 : GetTableItemIndex := GetItemIndex('SELECT Edem_ID FROM EdemaTable WHERE EdemName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    18 : GetTableItemIndex := GetItemIndex('SELECT Diag_ID FROM Diagnostics WHERE DiagName = "' + UTF8Encode(Item) + '"','Ошибка получения кожных покровов');
    19 : GetTableItemIndex := GetItemIndex('SELECT Method_ID FROM DiagMethods INNER JOIN Diagnostics ON DiagMethods.Diag_ID = Diagnostics.Diag_ID WHERE MethodName = "' + UTF8Encode(GetTableMethodName(Item)) + '" AND DiagName = "' + UTF8Encode(GetTableDiagName(Item)) + '"','Ошибка получения кожных покровов');
  end;
end;

procedure GetTableData;
begin
  case TableID of
    1 : GetToLBInfo('SELECT SkinName FROM SkinTable','Ошибка получения кожных покровов',LB);
    2 : GetToLBInfo('SELECT LymphName FROM LymphNodesTable','Ошибка получения кожных покровов',LB);
    3 : GetToLBInfo('SELECT JointName FROM JointsTable','Ошибка получения кожных покровов',LB);
    4 : GetToLBInfo('SELECT PharynxName FROM PharynxTable','Ошибка получения кожных покровов',LB);
    5 : GetToLBInfo('SELECT TonsilName FROM TonsilsTable','Ошибка получения кожных покровов',LB);
    6 : GetToLBInfo('SELECT LightName FROM LightsTable','Ошибка получения кожных покровов',LB);
    7 : GetToLBInfo('SELECT WheezName FROM WheezingsTable','Ошибка получения кожных покровов',LB);
    8 : GetToLBInfo('SELECT ToneName FROM TonesTable','Ошибка получения кожных покровов',LB);
    9 : GetToLBInfo('SELECT PulseName FROM PulseTable','Ошибка получения кожных покровов',LB);
    10 : GetToLBInfo('SELECT SBPName FROM StomBPTable','Ошибка получения кожных покровов',LB);
    11 : GetToLBInfo('SELECT TongueName FROM TongueTable','Ошибка получения кожных покровов',LB);
    12 : GetToLBInfo('SELECT StomachName FROM StomachTable','Ошибка получения кожных покровов',LB);
    13 : GetToLBInfo('SELECT LiverName FROM LiverTable','Ошибка получения кожных покровов',LB);
    14 : GetToLBInfo('SELECT PewName FROM PewTable','Ошибка получения кожных покровов',LB);
    15 : GetToLBInfo('SELECT UriName FROM UrinationTable','Ошибка получения кожных покровов',LB);
    16 : GetToLBInfo('SELECT PasSymName FROM PastSymptomsTable','Ошибка получения кожных покровов',LB);
    17 : GetToLBInfo('SELECT EdemName FROM EdemaTable','Ошибка получения кожных покровов',LB);
    18 : GetToLBInfo('SELECT DiagName FROM Diagnostics','Ошибка получения кожных покровов',LB);
    19 : GetToLBInfo('SELECT DiagName || ": " || MethodName FROM DiagMethods INNER JOIN Diagnostics ON DiagMethods.Diag_ID = Diagnostics.Diag_ID','Ошибка получения методов диагностик',LB);
  end;
end;

procedure DeleteTabElem;
var ind : integer;
begin
  ind := GetTableItemIndex(TableID,Item);
  case TableID of
    1 : ProcessSQL('DELETE FROM SkinTable WHERE Skin_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    2 : ProcessSQL('DELETE FROM LymphNodesTable WHERE Lymph_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    3 : ProcessSQL('DELETE FROM JointsTable WHERE Joint_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    4 : ProcessSQL('DELETE FROM PharynxTable WHERE Pharynx_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    5 : ProcessSQL('DELETE FROM TonsilsTable WHERE Tonsil_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    6 : ProcessSQL('DELETE FROM LightsTable WHERE Light_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    7 : ProcessSQL('DELETE FROM WheezingsTable WHERE Wheez_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    8 : ProcessSQL('DELETE FROM TonesTable WHERE Tone_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    9 : ProcessSQL('DELETE FROM PulseTable WHERE Pulse_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    10 : ProcessSQL('DELETE FROM StomBPTable WHERE SBP_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    11 : ProcessSQL('DELETE FROM TongueTable WHERE Tongue_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    12 : ProcessSQL('DELETE FROM StomachTable WHERE Stomach_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    13 : ProcessSQL('DELETE FROM LiverTable WHERE Liver_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    14 : ProcessSQL('DELETE FROM PewTable WHERE Pew_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    15 : ProcessSQL('DELETE FROM UrinationTable WHERE Uri_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    16 : ProcessSQL('DELETE FROM PastSymptomsTable WHERE PasSym_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    17 : ProcessSQL('DELETE FROM EdemaTable WHERE Edem_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    18 : ProcessSQL('DELETE FROM Diagnostics WHERE Diag_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
    19 : ProcessSQL('DELETE FROM DiagMethods WHERE Method_ID = ' + UTF8Encode(IntToStr(ind)) ,'Ошибка удаления элемента коных покровов');
  end;
end;

end.
