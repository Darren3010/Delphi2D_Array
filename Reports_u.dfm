object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Overperforming Arrays & Swapping'
  ClientHeight = 282
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsbold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 512
    Top = 184
    Width = 168
    Height = 98
  end
  object RedOutput: TRichEdit
    Left = 0
    Top = 0
    Width = 680
    Height = 185
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RedOutput')
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 191
    Width = 513
    Height = 91
    Align = alCustom
    Caption = 'Array Manipulation'
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 55
      Width = 75
      Height = 25
      Caption = 'Display'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 97
      Top = 24
      Width = 106
      Height = 25
      Caption = 'Swap Rows'
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 97
      Top = 55
      Width = 106
      Height = 25
      Caption = 'Swap Columns'
      TabOrder = 3
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 209
      Top = 24
      Width = 179
      Height = 25
      Caption = 'Overperforming Reports'
      TabOrder = 4
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 209
      Top = 55
      Width = 179
      Height = 25
      Caption = 'Highest or Lowest Report'
      TabOrder = 5
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 394
      Top = 24
      Width = 103
      Height = 25
      Caption = 'Sum and Avg'
      TabOrder = 6
      OnClick = Button9Click
    end
    object BitBtn1: TBitBtn
      Left = 394
      Top = 55
      Width = 103
      Height = 25
      DoubleBuffered = True
      Kind = bkClose
      ParentDoubleBuffered = False
      TabOrder = 7
    end
  end
end
