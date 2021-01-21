object FMain: TFMain
  Left = 104
  Top = 170
  Width = 1380
  Height = 326
  HorzScrollBar.Increment = 104
  VertScrollBar.Tracking = True
  Caption = #1040#1089#1089#1080#1089#1090#1077#1085#1090' VegaConflict v1.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Pn1: TPanel
    Left = 0
    Top = 0
    Width = 1364
    Height = 288
    Align = alClient
    TabOrder = 0
    object GbFleetSetting: TGroupBox
      Left = 1
      Top = 1
      Width = 1362
      Height = 272
      Align = alTop
      Caption = #1060#1072#1088#1084' '#1072#1089#1089#1080#1089#1090#1077#1085#1090
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
      object Label12: TLabel
        Left = 1136
        Top = 252
        Width = 125
        Height = 13
        Caption = #1042#1099#1082#1083#1102#1095#1077#1085#1080#1077' '#1072#1089#1089#1080#1089#1090#1077#1085#1090#1072
      end
      object Label13: TLabel
        Left = 1264
        Top = 238
        Width = 26
        Height = 13
        Caption = #1063#1072#1089#1099
      end
      object Label14: TLabel
        Left = 112
        Top = 240
        Width = 128
        Height = 13
        Caption = 'Esc - '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
      end
      object Label15: TLabel
        Left = 112
        Top = 256
        Width = 69
        Height = 13
        Caption = 'Pause - '#1055#1072#1091#1079#1072
      end
      object Label16: TLabel
        Left = 1312
        Top = 238
        Width = 40
        Height = 13
        Caption = #1052#1080#1085#1091#1090#1099
      end
      object btnSave: TSpeedButton
        Left = 8
        Top = 112
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
        OnClick = BtSaveClick
      end
      object btnLoad: TSpeedButton
        Left = 80
        Top = 112
        Width = 23
        Height = 22
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333330000003333333333333333330000003333333333333333330000003800
          000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
          000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
          B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
          FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
          0000330000033333333333000000333333333333333333000000333333333333
          333333000000333333333333333333000000}
        OnClick = BtLoadSettingFleetClick
      end
      object Label17: TLabel
        Left = 1032
        Top = 238
        Width = 26
        Height = 13
        Caption = #1063#1072#1089#1099
      end
      object Label18: TLabel
        Left = 904
        Top = 251
        Width = 117
        Height = 13
        Caption = #1042#1082#1083#1102#1095#1077#1085#1080#1077' '#1072#1089#1089#1080#1089#1090#1077#1085#1090#1072
      end
      object Label19: TLabel
        Left = 1080
        Top = 238
        Width = 40
        Height = 13
        Caption = #1052#1080#1085#1091#1090#1099
      end
      object GbAssistentFleet: TGroupBox
        Left = 112
        Top = 40
        Width = 89
        Height = 201
        Caption = #1059#1095#1072#1074#1089#1090#1074#1091#1102#1090
        Color = clSilver
        ParentColor = False
        TabOrder = 0
        object CbFleetInAssistents1: TCheckBox
          Left = 8
          Top = 16
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'1'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CbFleetInAssistents1Click
        end
        object CbFleetInAssistents2: TCheckBox
          Left = 8
          Top = 40
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'2'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = CbFleetInAssistents2Click
        end
        object CbFleetInAssistents3: TCheckBox
          Left = 8
          Top = 64
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'3'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CbFleetInAssistents3Click
        end
        object CbFleetInAssistents4: TCheckBox
          Left = 8
          Top = 88
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'4'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CbFleetInAssistents4Click
        end
        object CbFleetInAssistents5: TCheckBox
          Left = 8
          Top = 112
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'5'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = CbFleetInAssistents5Click
        end
        object CbFleetInAssistents6: TCheckBox
          Left = 8
          Top = 136
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'6'
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = CbFleetInAssistents6Click
        end
        object CbFleetInAssistents7: TCheckBox
          Left = 8
          Top = 160
          Width = 73
          Height = 17
          Caption = #1060#1083#1086#1090' '#8470'7'
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = CbFleetInAssistents7Click
        end
      end
      object GbGoHome: TGroupBox
        Left = 616
        Top = 8
        Width = 385
        Height = 233
        Caption = #1042#1077#1088#1085#1091#1090#1100' '#1092#1083#1086#1090#1099
        Color = clOlive
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object GbGoHomeAfterFight: TGroupBox
          Left = 2
          Top = 24
          Width = 87
          Height = 185
          Caption = #1055#1086#1089#1083#1077' '#1073#1086#1103
          TabOrder = 0
          object CbFleetGoHomeAfterFight1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
          end
          object CbFleetGoHomeAfterFight2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
          end
          object CbFleetGoHomeAfterFight3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
          end
          object CbFleetGoHomeAfterFight4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
          end
          object CbFleetGoHomeAfterFight5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
          end
          object CbFleetGoHomeAfterFight6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
          end
          object CbFleetGoHomeAfterFight7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
          end
        end
        object GbGoHomeAfterDamage: TGroupBox
          Left = 98
          Top = 24
          Width = 87
          Height = 185
          Caption = #1055#1086#1074#1088#1077#1078#1076#1077#1085
          TabOrder = 1
          object CbFleetGoHomeAfterDamage1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
          end
          object CbFleetGoHomeAfterDamage2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
          end
          object CbFleetGoHomeAfterDamage3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
          end
          object CbFleetGoHomeAfterDamage4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
          end
          object CbFleetGoHomeAfterDamage5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
          end
          object CbFleetGoHomeAfterDamage6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
          end
          object CbFleetGoHomeAfterDamage7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
          end
        end
        object GbGoHomeAfterVsek: TGroupBox
          Left = 194
          Top = 24
          Width = 87
          Height = 185
          Caption = #1042#1099#1083#1077#1090' Vsec'
          TabOrder = 2
          object CbFleetGoHomeAfterVsek1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
          end
          object CbFleetGoHomeAfterVsek2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
          end
          object CbFleetGoHomeAfterVsek3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
          end
          object CbFleetGoHomeAfterVsek4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
          end
          object CbFleetGoHomeAfterVsek5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
          end
          object CbFleetGoHomeAfterVsek6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
          end
          object CbFleetGoHomeAfterVsek7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
          end
        end
        object GbGoHomeInSektor: TGroupBox
          Left = 290
          Top = 24
          Width = 95
          Height = 185
          Caption = #1054#1089#1090#1072#1085'. '#1074' '#1089#1077#1082#1090#1086#1088
          TabOrder = 3
          object CbFleetGoHomeInSektor1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
          end
          object CbFleetGoHomeInSektor2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
          end
          object CbFleetGoHomeInSektor3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
          end
          object CbFleetGoHomeInSektor4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
          end
          object CbFleetGoHomeInSektor5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
          end
          object CbFleetGoHomeInSektor6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
          end
          object CbFleetGoHomeInSektor7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
          end
        end
      end
      object GbAttack: TGroupBox
        Left = 200
        Top = 8
        Width = 417
        Height = 233
        Caption = #1040#1090#1072#1082#1072
        Color = clRed
        ParentColor = False
        TabOrder = 2
        object Label1: TLabel
          Left = 192
          Top = 6
          Width = 92
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1092#1083#1086#1090#1072' '#1042#1077#1075#1080
        end
        object Label2: TLabel
          Left = 192
          Top = 19
          Width = 123
          Height = 13
          Caption = #1080#1079' '#1089#1087#1080#1089#1082#1072' "'#1054#1090#1084#1077#1095#1077#1085#1085#1099#1077'"'
        end
        object GbFleetGoAttack: TGroupBox
          Left = 101
          Top = 29
          Width = 86
          Height = 180
          Caption = #1040#1090#1072#1082#1091#1097#1080#1077
          TabOrder = 0
          object CbFleetInAttack1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
            OnClick = CbFleetInAttack1Click
          end
          object CbFleetInAttack2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
            OnClick = CbFleetInAttack2Click
          end
          object CbFleetInAttack3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
            OnClick = CbFleetInAttack3Click
          end
          object CbFleetInAttack4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
            OnClick = CbFleetInAttack4Click
          end
          object CbFleetInAttack5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
            OnClick = CbFleetInAttack5Click
          end
          object CbFleetInAttack6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
            OnClick = CbFleetInAttack6Click
          end
          object CbFleetInAttack7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
            OnClick = CbFleetInAttack7Click
          end
        end
        object SgNomFleetVegaAttack: TStringGrid
          Left = 192
          Top = 38
          Width = 137
          Height = 190
          ColCount = 10
          DefaultColWidth = 60
          DefaultRowHeight = 23
          FixedCols = 0
          RowCount = 7
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ScrollBars = ssHorizontal
          TabOrder = 1
        end
        object GbFleetGoAttackMet: TGroupBox
          Left = 5
          Top = 28
          Width = 92
          Height = 181
          Caption = #1051#1077#1090#1077#1090#1100' '#1085#1072' '#1084#1077#1090#1082#1080
          TabOrder = 2
          object CbFleetGoAttackMet1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
            OnClick = CbFleetGoAttackMet1Click
          end
          object CbFleetGoAttackMet2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
            OnClick = CbFleetGoAttackMet2Click
          end
          object CbFleetGoAttackMet3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
            OnClick = CbFleetGoAttackMet3Click
          end
          object CbFleetGoAttackMet4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
            OnClick = CbFleetGoAttackMet4Click
          end
          object CbFleetGoAttackMet5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
            OnClick = CbFleetGoAttackMet5Click
          end
          object CbFleetGoAttackMet6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
            OnClick = CbFleetGoAttackMet6Click
          end
          object CbFleetGoAttackMet7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
            OnClick = CbFleetGoAttackMet7Click
          end
        end
        object GbDelMet: TGroupBox
          Left = 333
          Top = 27
          Width = 84
          Height = 182
          Caption = #1059#1076#1072#1083'. '#1084#1077#1090#1082#1080
          TabOrder = 3
          object CbDelMet1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
            OnClick = CbFleetGoAttackMet1Click
          end
          object CbDelMet2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
            OnClick = CbFleetGoAttackMet2Click
          end
          object CbDelMet3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
            OnClick = CbFleetGoAttackMet3Click
          end
          object CbDelMet4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
            OnClick = CbFleetGoAttackMet4Click
          end
          object CbDelMet5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
            OnClick = CbFleetGoAttackMet5Click
          end
          object CbDelMet6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
            OnClick = CbFleetGoAttackMet6Click
          end
          object CbDelMet7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
            OnClick = CbFleetGoAttackMet7Click
          end
        end
      end
      object GbRepair: TGroupBox
        Left = 1144
        Top = 8
        Width = 217
        Height = 233
        Caption = #1056#1077#1084#1086#1085#1090
        Color = clGreen
        ParentColor = False
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 89
          Height = 13
          Caption = #1055#1086#1088#1103#1076#1086#1082' '#1088#1077#1084#1086#1085#1090#1072
        end
        object LbSetRepair: TListBox
          Left = 40
          Top = 32
          Width = 17
          Height = 97
          ItemHeight = 13
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          TabOrder = 0
        end
        object BtUpFleetInsetRepeir: TButton
          Left = 8
          Top = 136
          Width = 89
          Height = 25
          Caption = #1055#1086#1076#1085#1103#1090#1100' '#1092#1083#1086#1090
          TabOrder = 1
          OnClick = BtUpFleetInsetRepeirClick
        end
        object GbFastRepair: TGroupBox
          Left = 106
          Top = 16
          Width = 103
          Height = 185
          Caption = #1041#1099#1089#1090#1088#1099#1081' '#1088#1077#1084#1086#1085#1090
          TabOrder = 2
          object CbFleetFastRepair1: TCheckBox
            Left = 8
            Top = 16
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'1'
            TabOrder = 0
          end
          object CbFleetFastRepair2: TCheckBox
            Left = 8
            Top = 40
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'2'
            TabOrder = 1
          end
          object CbFleetFastRepair3: TCheckBox
            Left = 8
            Top = 64
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'3'
            TabOrder = 2
          end
          object CbFleetFastRepair4: TCheckBox
            Left = 8
            Top = 88
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'4'
            TabOrder = 3
          end
          object CbFleetFastRepair5: TCheckBox
            Left = 8
            Top = 112
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'5'
            TabOrder = 4
          end
          object CbFleetFastRepair6: TCheckBox
            Left = 8
            Top = 136
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'6'
            TabOrder = 5
          end
          object CbFleetFastRepair7: TCheckBox
            Left = 8
            Top = 160
            Width = 73
            Height = 17
            Caption = #1060#1083#1086#1090' '#8470'7'
            TabOrder = 6
          end
        end
      end
      object GbConvoy: TGroupBox
        Left = 1000
        Top = 8
        Width = 145
        Height = 233
        Caption = #1057#1086#1087#1088#1086#1074#1086#1078#1076#1077#1085#1080#1077
        Color = clTeal
        ParentColor = False
        TabOrder = 4
        object Label4: TLabel
          Left = 8
          Top = 40
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'1'
        end
        object Label5: TLabel
          Left = 8
          Top = 64
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'2'
        end
        object Label6: TLabel
          Left = 8
          Top = 88
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'3'
        end
        object Label7: TLabel
          Left = 8
          Top = 112
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'4'
        end
        object Label8: TLabel
          Left = 8
          Top = 136
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'5'
        end
        object Label9: TLabel
          Left = 8
          Top = 160
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'6'
        end
        object Label10: TLabel
          Left = 8
          Top = 184
          Width = 48
          Height = 13
          Caption = #1060#1083#1086#1090' '#8470'7'
        end
        object Label11: TLabel
          Left = 40
          Top = 16
          Width = 76
          Height = 13
          Caption = #1057#1086#1087#1088#1086#1074#1086#1078#1076#1072#1077#1090
        end
        object SeFleetConvoy1: TSpinEdit
          Left = 64
          Top = 35
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object SeFleetConvoy2: TSpinEdit
          Left = 64
          Top = 59
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object SeFleetConvoy3: TSpinEdit
          Left = 64
          Top = 83
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object SeFleetConvoy4: TSpinEdit
          Left = 64
          Top = 107
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object SeFleetConvoy5: TSpinEdit
          Left = 64
          Top = 131
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object SeFleetConvoy6: TSpinEdit
          Left = 64
          Top = 155
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object SeFleetConvoy7: TSpinEdit
          Left = 64
          Top = 179
          Width = 57
          Height = 22
          MaxValue = 7
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
      end
      object BtGo: TButton
        Left = 8
        Top = 56
        Width = 97
        Height = 49
        Caption = #1057#1090#1072#1088#1090
        TabOrder = 5
        OnClick = BtGoClick
      end
      object CbAttackBaseInevent: TCheckBox
        Left = 525
        Top = 251
        Width = 329
        Height = 17
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1072#1090#1072#1082#1072' '#1085#1072' '#1073#1072#1079#1091' '#1080' '#1077#1077' '#1088#1077#1084#1086#1085#1090' '#1074#1086' '#1074#1088#1077#1084#1103' '#1080#1074#1077#1085#1090#1072
        TabOrder = 6
      end
      object SeEndAssistentsHour: TSpinEdit
        Left = 1261
        Top = 250
        Width = 44
        Height = 22
        MaxValue = 25
        MinValue = 1
        TabOrder = 7
        Value = 25
      end
      object BtSysSetting: TButton
        Left = 8
        Top = 232
        Width = 97
        Height = 17
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BtSysSettingClick
      end
      object SeEndAssistentsMin: TSpinEdit
        Left = 1311
        Top = 250
        Width = 44
        Height = 22
        MaxValue = 60
        MinValue = 0
        TabOrder = 9
        Value = 0
      end
      object CbGoHmeFleetByExit: TCheckBox
        Left = 253
        Top = 251
        Width = 252
        Height = 17
        Caption = #1042#1086#1079#1074#1088#1072#1090' '#1092#1083#1086#1090#1086#1074' '#1087#1086' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1102' '#1040#1089#1089#1080#1089#1090#1077#1085#1090#1072
        TabOrder = 10
      end
      object BtTimers: TButton
        Left = 8
        Top = 200
        Width = 97
        Height = 25
        Caption = #1047#1072#1076#1077#1088#1078#1082#1080
        TabOrder = 11
        OnClick = BtTimersClick
      end
      object RgSelectTypeWindow: TRadioGroup
        Left = 8
        Top = 136
        Width = 97
        Height = 57
        Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
        ItemIndex = 0
        Items.Strings = (
          'Steam'
          'Mozilla')
        TabOrder = 12
      end
      object BtAutorizations: TButton
        Left = 8
        Top = 16
        Width = 185
        Height = 25
        Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
        TabOrder = 13
        OnClick = BtAutorizationsClick
      end
      object SeStartAssistentsHour: TSpinEdit
        Left = 1029
        Top = 250
        Width = 44
        Height = 22
        MaxValue = 25
        MinValue = 1
        TabOrder = 14
        Value = 25
      end
      object SeStartAssistentsMin: TSpinEdit
        Left = 1078
        Top = 250
        Width = 44
        Height = 22
        MaxValue = 60
        MinValue = 0
        TabOrder = 15
        Value = 0
      end
    end
  end
  object Od1: TOpenDialog
    Left = 201
    Top = 241
  end
  object Sd1: TSaveDialog
    Left = 121
    Top = 249
  end
end
