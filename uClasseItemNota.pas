unit uClasseItemNota;

interface



type
  INota = interface;

  // Interface de representação item da nota
  IItem = interface
    ['{CEAECB45-1321-4EFE-B555-AA14782B93F0}']
    function DescricaoDoItem: String;
  end;


  /// Interface que representa a nota
  INota = interface
  ['{AEECAF14-3B80-4290-AC5A-86BEC245F014}']
    function Item: IItem;
    function NumeroNota: Integer;
  end;

  TItem = class(TInterfacedObject, IItem)
  private
    FDecricaoDoItem: String;
//    [weak]    // Decomentar para testar
    FParent: INota;
  public
    function DescricaoDoItem: String;
    class function New(Parent : INota): IItem;
    constructor Create(Parent : INota);
  end;


  TNota = class(TInterfacedObject, INota)
  private
    FNumeroNota: Integer;
    FVariavelNaoDestroy: IItem;
  public
    function Item: IItem;
    class function New: INota;
    constructor Create;
    function NumeroNota: Integer;
  end;

implementation

uses
  System.SysUtils;

{ TNota }

constructor TNota.Create;
begin
  {
    Nota esta criando o IItem e recebendo por parametro
    INota (Self)
  }
  FVariavelNaoDestroy := TItem.New(self);
  FNumeroNota         := 1;
end;

class function TNota.New: INota;
begin
  Result := Create;
end;

function TNota.Item: IItem;
begin
  Result := FVariavelNaoDestroy;
end;

function TNota.NumeroNota: Integer;
begin
  Result := FNumeroNota;
end;

{ TItem }

constructor TItem.Create(Parent : INota);
begin
  FParent := Parent;
  FDecricaoDoItem := 'Tomate vermelho';
end;

class function TItem.new(Parent : INota): IItem;
begin
  result := Create(Parent);
end;

function TItem.DescricaoDoItem: String;
begin
  Result := Format('Item: %s, da nota %d', [
              FDecricaoDoItem, FParent.NumeroNota
            ]);
end;


end.