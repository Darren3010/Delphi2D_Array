unit Reports_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, JPEG, ExtCtrls;

type
  TForm1 = class(TForm)
    RedOutput: TRichEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Display;
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SumRows;
    procedure SumColumns;
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var

  sArrDepartments: Array [1 .. 8] of String = (
    'Shoes',
    'Computers',
    'Cellphones',
    'Peripherals',
    'Jackets',
    'Books',
    'Handbags',
    'Add-ons'
  );

  rArrSales: array [1 .. 8, 1 .. 6] of Real = ((935.89, 965.99, 4056.77,
      5023.89, 3802.66, 1146.98), (2667.78, 2491.78, 1989.65, 2647.88,
      1601.56, 1921.99), (6702.45, 4271.56, 3424.45, 3924.55, 3085.45,
      3359.77), (6662.34, 6658.45, 8075.43, 2360.66, 2635.44, 7365.69),
    (16405.33, 9741.37, 13381.56, 18969.76, 8604.55, 20207.56),
    (10515.29, 7582.66, 9856.56, 7537.68, 9115.67, 8401.55),
    (7590.99, 9212.65, 9070.98, 6439.99, 7984.88, 8767.45),
    (9220.65, 8097.99, 10067.44, 9960.87, 10109.56, 6571.66));

  rArrSumCol: Array [1 .. 6] of Real;
  rArrSumRow: Array [1 .. 8] of Real;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RedOutput.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  RedOutput.Paragraph.TabCount := 6;
  RedOutput.Paragraph.Tab[0] := 50;
  RedOutput.Paragraph.Tab[1] := 125;
  RedOutput.Paragraph.Tab[2] := 200;
  RedOutput.Paragraph.Tab[3] := 275;
  RedOutput.Paragraph.Tab[4] := 350;
  RedOutput.Paragraph.Tab[5] := 425;
  Display;
end;

procedure TForm1.Button5Click(Sender: TObject);
VAR
  Col, Row1, Row2: Integer;
  Temp: Real;
begin
  Row1 := StrToInt(InputBox('Rows', 'Enter the row you would like to swap',
      ''));
  Row2 := StrToInt(InputBox('Rows', 'Enter the row you would like to swap',
      ''));
  for Col := 1 to 6 do
  begin
    Temp := rArrSales[Row1, Col];
    rArrSales[Row1, Col] := rArrSales[Row2, Col];
    rArrSales[Row2, Col] := Temp;
  end; // Row End
  Display;
end;

procedure TForm1.Button6Click(Sender: TObject);
VAR
  Row, Column1, Column2: Integer;
  Temp: Real;
begin
  Column1 := StrToInt(InputBox('Columns',
      'Enter the column you would like to swap', ''));
  Column2 := StrToInt(InputBox('Columns',
      'Enter the column you would like to swap', ''));
  for Row := 1 to 8 do
  begin
    Temp := rArrSales[Row, Column1];
    rArrSales[Row, Column1] := rArrSales[Row, Column2];
    rArrSales[Row, Column2] := Temp;
  end; // Row End
  Display;
end;

procedure TForm1.Button7Click(Sender: TObject);
VAR
  Row, Col, RowUnder, ColUnder: Integer;
  Sum, Ave: Real;
begin
  RedOutput.Clear;
  RedOutput.Lines.Add('Overperforming departments per 6 month average');
  for Row := 1 to 8 do
  begin
    Sum := 0;
    for Col := 1 to 6 do
    begin
      Sum := Sum + rArrSales[Row][Col]
    end; // Col End
    rArrSumRow[Row] := Sum / 6;

  end; // Row End

  for RowUnder := 1 to 8 do
  begin
    RedOutput.Lines.Add(#13 + sArrDepartments[RowUnder] +
        ' 6 Month Average Sales: ' + FloatToStrF(rArrSumRow[RowUnder],
        ffcurrency, 7, 2) + #13);
    for ColUnder := 1 to 6 do
    begin
      if rArrSales[RowUnder][ColUnder] > rArrSumRow[RowUnder] then
      begin
        RedOutput.Lines.Add('Month: ' + IntToStr(ColUnder) + #9 + FloatToStrF
            (rArrSales[RowUnder][ColUnder], ffcurrency, 7, 2));
      end;

    end; // Colunder End
  end; // Rowunder End

end;

procedure TForm1.Button8Click(Sender: TObject);
VAR
  HighLow, Department: String;
  Row, Col: Integer;
  Number: Real;
begin
  HighLow := InputBox('Highest or Lowest',
    'Would you like to see the highest report or lowest', 'e.g Highest');
  if uppercase(HighLow) = 'HIGHEST' then
  begin
    Number := 0;
    for Row := 1 to 8 do
    begin
      for Col := 1 to 6 do
      begin
        if rArrSales[Row][Col] > Number then
        begin
          Number := rArrSales[Row][Col];
          Department := sArrDepartments[Row];
        end; // If End
      end; // Col End
    end; // Row End
    RedOutput.Lines.Add('The best selling department was ' + Department +
        ' with sale of ' + FloatToStrF(Number, ffcurrency, 7, 2));
  end
  // If Highest End
  else if uppercase(HighLow) = 'LOWEST' then
  begin
    Number := 100000;
    for Row := 1 to 8 do
    begin
      for Col := 1 to 6 do
      begin
        if rArrSales[Row][Col] < Number then
        begin
          Number := rArrSales[Row][Col];
          Department := sArrDepartments[Row];
        end; // If End
      end; // Col End
    end; // Row End
    RedOutput.Lines.Add('The worst selling department was ' + Department +
        ' with sale of ' + FloatToStrF(Number, ffcurrency, 7, 2));
  end; // If End
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  SumColumns;
  SumRows;
end;

procedure TForm1.Display;
VAR
  Display: String;
  Row, Col, Month, Count: Integer;
begin
  RedOutput.Clear;
  Count := 1;
  for Month := 1 to 6 do
  begin
    Display := Display + 'Month:' + IntToStr(Count) + #9;
    Inc(Count);
  end;
  RedOutput.Lines.Add(#9 + Display);
  for Row := 1 to 8 do
  begin
    Display := ' ';
    Display := sArrDepartments[Row];
    for Col := 1 to 6 do
    begin
      Display := Display + #9 + FloatToStrF(rArrSales[Row, Col], ffcurrency, 7,
        2);
    end; // Col End
    RedOutput.Lines.Add(Display);
  end; // Row End
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  GroupBox1.Font.Size := 10;
  GroupBox1.Font.Name := 'Century Gothic';
  RedOutput.Clear;
  RedOutput.ScrollBars := ssVertical;
  Image1.Picture.LoadFromFile('Wallpa.JPG');
  Image1.Stretch := True;
  Form1.Position := poDesktopCenter;
end;

procedure TForm1.SumColumns;
VAR
  Row, Col, Display: Integer;
  Sum, Avg: Real;
  Line: String;
begin
  for Col := 1 to 6 do
  begin
    Sum := 0;
    for Row := 1 to 8 do
    begin
      Sum := Sum + rArrSales[Row][Col];
    end;
    // Row End
    rArrSumCol[Col] := Sum;
  end; // Col End
  Avg := 0;
  RedOutput.Lines.Add(#13 + 'The sum for each column is:' + #13);
  Line := #9;
  for Display := 1 to 6 do
  begin
    Line := Line + FloatToStrF(rArrSumCol[Display], ffcurrency, 7, 2) + #9;
    Avg := Avg + (rArrSumCol[Display] / 6);
  end; // Display End
  RedOutput.Lines.Add(Line);
  RedOutput.Lines.Add(#13 +
      'The average sales based on columns over 6 months is:   ' + FloatToStrF
      (Avg, ffcurrency, 7, 2));
end;

procedure TForm1.SumRows;
VAR
  Line: String;
  Avg, Sum: Real;
  Row, Col, Display: Integer;
begin
  for Row := 1 to 8 do
  begin
    Sum := 0;
    for Col := 1 to 6 do
    begin
      Sum := Sum + rArrSales[Row][Col];
    end; // Col End
    rArrSumRow[Row] := Sum;
  end; // Row End
  Avg := 0;
  RedOutput.Lines.Add(#13 + 'The sum for each row is:' + #13);
  Line := #9;
  for Display := 1 to 8 do
  begin
    Line := Line + FloatToStrF(rArrSumRow[Display], ffcurrency, 7, 2) + #9;
    Avg := Avg + (rArrSumRow[Display] / 8);
  end; // Display End
  RedOutput.Lines.Add(Line);
  RedOutput.Lines.Add(#13 +
      'The average sales based on rows over the past 6 months is: ' +
      FloatToStrF(Avg, ffcurrency, 7, 2));

end;

end.
