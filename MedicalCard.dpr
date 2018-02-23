program MedicalCard;

uses
  Forms,
  ClientSelectorUI in 'Modules\ClientSelectorUI.pas' {ClSelForm},
  SQLWork in 'Modules\SQLWork.pas',
  SQLite3 in 'Modules\SQLite3.pas',
  SQLiteTable3 in 'Modules\SQLiteTable3.pas',
  SearchFormUI in 'Modules\SearchFormUI.pas' {SearchForm},
  ClientInfoUI in 'Modules\ClientInfoUI.pas' {ClInfoForm},
  CardSelectorUI in 'Modules\CardSelectorUI.pas' {CardSelForm},
  ElemSelectorUI in 'Modules\ElemSelectorUI.pas' {ElemSelForm},
  CardEditorUI in 'Modules\CardEditorUI.pas' {CardEditorForm},
  ElemAdderUI in 'Modules\ElemAdderUI.pas' {ElemAddForm},
  SystemUtils in 'Modules\SystemUtils.pas',
  DiagMethodElemAdderUI in 'Modules\DiagMethodElemAdderUI.pas' {DiagMethAddElemForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ёлекторнные мед-карты';
  Application.CreateForm(TClSelForm, ClSelForm);
  Application.CreateForm(TClInfoForm, ClInfoForm);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TCardSelForm, CardSelForm);
  Application.CreateForm(TElemSelForm, ElemSelForm);
  Application.CreateForm(TCardEditorForm, CardEditorForm);
  Application.CreateForm(TElemAddForm, ElemAddForm);
  Application.CreateForm(TDiagMethAddElemForm, DiagMethAddElemForm);
  Application.Run;
end.
