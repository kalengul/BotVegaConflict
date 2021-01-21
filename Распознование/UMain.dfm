object Form1: TForm1
  Left = 302
  Top = 43
  Width = 944
  Height = 677
  Caption = '325 670'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Sg1: TStringGrid
    Left = 8
    Top = 8
    Width = 905
    Height = 369
    ColCount = 56
    DefaultColWidth = 15
    DefaultRowHeight = 15
    RowCount = 22
    TabOrder = 0
    OnSelectCell = Sg1SelectCell
    ColWidths = (
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15
      15)
  end
  object btn1: TBitBtn
    Left = 8
    Top = 448
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object Lb1: TListBox
    Left = 136
    Top = 456
    Width = 169
    Height = 169
    ItemHeight = 13
    Items.Strings = (
      '1')
    Sorted = True
    TabOrder = 2
  end
  object Clb1: TCheckListBox
    Left = 312
    Top = 384
    Width = 145
    Height = 241
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnClick = Clb1Click
  end
  object btn2: TBitBtn
    Left = 8
    Top = 488
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 4
    OnClick = btn2Click
  end
  object Bt1: TButton
    Left = 8
    Top = 528
    Width = 75
    Height = 25
    Caption = 'Bt1'
    TabOrder = 5
    OnClick = Bt1Click
  end
  object Bt2: TButton
    Left = 472
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Bt2'
    TabOrder = 6
    OnClick = Bt2Click
  end
  object Memo1: TMemo
    Left = 560
    Top = 384
    Width = 273
    Height = 241
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object Bt3: TButton
    Left = 472
    Top = 416
    Width = 73
    Height = 25
    Caption = 'Bt3'
    TabOrder = 8
    OnClick = Bt3Click
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmr1Timer
    Left = 312
    Top = 56
  end
end
