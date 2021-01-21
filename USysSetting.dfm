object FSysSetting: TFSysSetting
  Left = 41
  Top = 136
  Width = 1319
  Height = 386
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GbSysSetting: TGroupBox
    Left = 0
    Top = 0
    Width = 1303
    Height = 348
    Align = alClient
    Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 0
    object btnSave: TSpeedButton
      Left = 120
      Top = 72
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
      OnClick = btnSaveClick
    end
    object btnLoad: TSpeedButton
      Left = 168
      Top = 72
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
      OnClick = btnLoadClick
    end
    object LeX0: TLabeledEdit
      Left = 8
      Top = 32
      Width = 41
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1086#1087'. X0'
      TabOrder = 0
      Text = '9'
    end
    object LeY0: TLabeledEdit
      Left = 64
      Top = 32
      Width = 41
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1086#1087'. Y0'
      TabOrder = 1
      Text = '9'
    end
    object LeX1: TLabeledEdit
      Left = 8
      Top = 72
      Width = 41
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = #1059#1084'. X1'
      TabOrder = 2
      Text = '0'
    end
    object LeY1: TLabeledEdit
      Left = 64
      Top = 72
      Width = 41
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = #1059#1084'. Y1'
      TabOrder = 3
      Text = '0'
    end
    object LeY0Zag: TLabeledEdit
      Left = 120
      Top = 32
      Width = 73
      Height = 21
      EditLabel.Width = 68
      EditLabel.Height = 13
      EditLabel.Caption = 'Y0 '#1047#1072#1075#1086#1083#1086#1074#1082#1072
      TabOrder = 4
      Text = '20'
    end
    object Gb5: TGroupBox
      Left = 8
      Top = 96
      Width = 209
      Height = 217
      Caption = #1043#1088#1072#1085#1080#1094#1099' '#1086#1082#1085#1072' '#1092#1083#1086#1090#1086#1074
      TabOrder = 5
      object LeSmeshFleet1: TLabeledEdit
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 124
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1084#1077#1097'.  '#1074#1077#1088#1093' 1-'#1075#1086' ('#1086#1090' '#1062'.)'
        TabOrder = 0
        Text = '-220'
      end
      object LeSmeshLeftfleet: TLabeledEdit
        Left = 8
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 161
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1084#1077#1097'. '#1083#1077#1074#1086#1081' '#1075#1088#1072#1085#1080#1094#1099' ('#1086#1090' '#1082#1088#1072#1103')'
        TabOrder = 1
        Text = '-225'
      end
      object LeSmeshRightIconFleet: TLabeledEdit
        Left = 8
        Top = 112
        Width = 121
        Height = 21
        EditLabel.Width = 196
        EditLabel.Height = 13
        EditLabel.Caption = #1057#1084#1077#1097'. '#1087#1088#1072#1074#1086#1081' '#1075#1088#1072#1085'. '#1080#1082#1086#1085#1082#1080' ('#1086#1090' '#1083#1077#1074#1086#1081')'
        TabOrder = 2
        Text = '30'
      end
      object LeWeightElSheep: TLabeledEdit
        Left = 8
        Top = 152
        Width = 121
        Height = 21
        EditLabel.Width = 125
        EditLabel.Height = 13
        EditLabel.Caption = #1064#1080#1088#1080#1085#1072' '#1101#1083#1077#1084#1077#1085#1090#1072' '#1092#1083#1086#1090#1072
        TabOrder = 3
        Text = '43'
      end
      object LeWeightSostavFleet: TLabeledEdit
        Left = 8
        Top = 192
        Width = 121
        Height = 21
        EditLabel.Width = 118
        EditLabel.Height = 13
        EditLabel.Caption = #1064#1080#1088#1080#1085#1072' '#1089#1086#1089#1090#1072#1074#1072' '#1092#1083#1086#1090#1072
        TabOrder = 4
        Text = '138'
      end
    end
    object Gb6: TGroupBox
      Left = 224
      Top = 16
      Width = 337
      Height = 257
      Caption = #1057#1084#1077#1097#1077#1085#1080#1103' '#1076#1083#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1092#1083#1086#1090#1072
      TabOrder = 6
      object LeXOstanDvish: TLabeledEdit
        Left = 8
        Top = 32
        Width = 89
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1086#1089#1090'. '#1080#1083#1080' '#1076#1074#1080#1078'.'
        TabOrder = 0
        Text = '11'
      end
      object LeYOstanDvish: TLabeledEdit
        Left = 8
        Top = 72
        Width = 89
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1086#1089#1090'. '#1080#1083#1080' '#1076#1074#1080#1078'.'
        TabOrder = 1
        Text = '16'
      end
      object LeXDvish2: TLabeledEdit
        Left = 8
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1076#1074#1080#1078'. 2'
        TabOrder = 2
        Text = '8'
      end
      object LeYDvish2: TLabeledEdit
        Left = 8
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1076#1074#1080#1078'. 2'
        TabOrder = 3
        Text = '16'
      end
      object LeXBase: TLabeledEdit
        Left = 8
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1085#1072' '#1073#1072#1079#1077
        TabOrder = 4
        Text = '16'
      end
      object LeYBase: TLabeledEdit
        Left = 8
        Top = 232
        Width = 57
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1085#1072' '#1073#1072#1079#1077
        TabOrder = 5
        Text = '16'
      end
      object LeXRepair: TLabeledEdit
        Left = 112
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1085#1072' '#1088#1077#1084#1086#1085#1090#1077
        TabOrder = 6
        Text = '16'
      end
      object LeYRepair: TLabeledEdit
        Left = 112
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1085#1072' '#1088#1077#1084#1086#1085#1090#1077
        TabOrder = 7
        Text = '21'
      end
      object LeXFight: TLabeledEdit
        Left = 112
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1074' '#1073#1086#1102
        TabOrder = 8
        Text = '101'
      end
      object LeYFight: TLabeledEdit
        Left = 112
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1074' '#1073#1086#1102
        TabOrder = 9
        Text = '21'
      end
      object LeXConnect1: TLabeledEdit
        Left = 192
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1089#1086#1087#1088'.'
        TabOrder = 10
        Text = '20'
      end
      object LeXConnect2: TLabeledEdit
        Left = 192
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1089#1086#1087#1088'.2'
        TabOrder = 11
        Text = '22'
      end
      object LeYConnect1: TLabeledEdit
        Left = 192
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1089#1086#1087#1088'.'
        TabOrder = 12
        Text = '16'
      end
      object LeYConnect2: TLabeledEdit
        Left = 192
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1089#1086#1087#1088'.2'
        TabOrder = 13
        Text = '12'
      end
      object LeX1ConnectFly: TLabeledEdit
        Left = 256
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'X1 '#1089#1086#1087#1088'.'#1087#1086#1083#1077#1090
        TabOrder = 14
        Text = '3'
      end
      object LeX2ConnectFly: TLabeledEdit
        Left = 256
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'X2 '#1089#1086#1087#1088'.'#1087#1086#1083#1077#1090
        TabOrder = 15
        Text = '6'
      end
      object LeX3ConnectFly: TLabeledEdit
        Left = 256
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'X3 '#1089#1086#1087#1088'.'#1087#1086#1083#1077#1090
        TabOrder = 16
        Text = '25'
      end
      object LeY1ConnectFly: TLabeledEdit
        Left = 257
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'Y1 '#1089#1086#1087#1088'.'#1087#1086#1083#1077#1090
        TabOrder = 17
        Text = '32'
      end
      object LeY2ConnectFly: TLabeledEdit
        Left = 256
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'Y2 '#1089#1086#1087#1088'.'#1087#1086#1083#1077#1090
        TabOrder = 18
        Text = '36'
      end
    end
    object GbBtn: TGroupBox
      Left = 568
      Top = 16
      Width = 145
      Height = 257
      Caption = #1050#1085#1086#1087#1082#1080
      TabOrder = 7
      object LeXOk: TLabeledEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1054#1082'"'
        TabOrder = 0
        Text = '0'
      end
      object LeYOk: TLabeledEdit
        Left = 72
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1054#1082'"'
        TabOrder = 1
        Text = '80'
      end
      object LeXLeftBtn: TLabeledEdit
        Left = 8
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 132
        EditLabel.Height = 13
        EditLabel.Caption = #1051#1077#1074#1072#1103' '#1075#1088#1072#1085'. '#1082#1085#1086#1087#1086#1082' '#1074#1085#1080#1079#1091
        TabOrder = 2
        Text = '-190'
      end
      object LeopBtn: TLabeledEdit
        Left = 8
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 135
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1077#1088#1093#1085'. '#1075#1088#1072#1085'. '#1082#1085#1086#1087#1086#1082' '#1074#1085#1080#1079#1091
        TabOrder = 3
        Text = '-75'
      end
      object LeHeigthBtn: TLabeledEdit
        Left = 8
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 103
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1083#1080#1085#1072' '#1082#1085#1086#1087#1086#1082' '#1074#1085#1080#1079#1091
        TabOrder = 4
        Text = '95'
      end
      object LeXBaseBtn: TLabeledEdit
        Left = 8
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1041#1072#1079#1072'"'
        TabOrder = 5
        Text = '-155'
      end
      object LeYBaseBtn: TLabeledEdit
        Left = 72
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1041#1072#1079#1072'"'
        TabOrder = 6
        Text = '-75'
      end
      object LeXSpaceBtn: TLabeledEdit
        Left = 8
        Top = 232
        Width = 57
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1057#1077#1082#1090#1086#1088'"'
        TabOrder = 7
        Text = '-36'
      end
      object LeYSpaceBtn: TLabeledEdit
        Left = 72
        Top = 231
        Width = 57
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1057#1077#1082#1090#1086#1088'"'
        TabOrder = 8
        Text = '-74'
      end
    end
    object GbOtmetki: TGroupBox
      Left = 720
      Top = 16
      Width = 137
      Height = 145
      Caption = #1054#1090#1084#1077#1090#1082#1080
      TabOrder = 8
      object LeWeigthOtm: TLabeledEdit
        Left = 8
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = #1064#1080#1088#1080#1085#1072' '#1086#1090#1084#1077#1090#1086#1082
        TabOrder = 0
        Text = '54'
      end
      object LeXOtmBtn: TLabeledEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1086#1090#1084'."'
        TabOrder = 1
        Text = '-200'
      end
      object LeYOtmBtn: TLabeledEdit
        Left = 72
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1086#1090#1084'."'
        TabOrder = 2
        Text = '30'
      end
      object LeXOtmechennieBtn: TLabeledEdit
        Left = 8
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1054#1090#1084#1077#1095#1077#1085#1085#1099#1077
        TabOrder = 3
        Text = '-250'
      end
      object LeYOtmechennieBtn: TLabeledEdit
        Left = 88
        Top = 72
        Width = 41
        Height = 21
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.Caption = 'Y'
        TabOrder = 4
        Text = '0'
      end
    end
    object GbAttackOnBase: TGroupBox
      Left = 720
      Top = 176
      Width = 137
      Height = 97
      Caption = #1040#1090#1072#1082#1072' '#1085#1072' '#1073#1072#1079#1091
      TabOrder = 9
      object LeXDelAttackOnBase: TLabeledEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1059#1073#1088#1072#1090#1100'"'
        TabOrder = 0
        Text = '95'
      end
      object LeYDelAttackonBase: TLabeledEdit
        Left = 72
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1059#1073#1088#1072#1090#1100'"'
        TabOrder = 1
        Text = '115'
      end
      object LeXRepainAttackOnBase: TLabeledEdit
        Left = 7
        Top = 68
        Width = 57
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1056#1077#1084#1086#1085#1090'"'
        TabOrder = 2
        Text = '-92'
      end
      object LeYRepairAttackOnBase: TLabeledEdit
        Left = 71
        Top = 68
        Width = 57
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1056#1077#1084#1086#1085#1090'"'
        TabOrder = 3
        Text = '130'
      end
    end
    object GbRepair: TGroupBox
      Left = 864
      Top = 16
      Width = 425
      Height = 257
      Caption = #1056#1077#1084#1086#1085#1090
      TabOrder = 10
      object LeXYSheepRepair: TLabeledEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 127
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1083#1080#1085#1072' '#1080' '#1096#1080#1088#1080#1085#1072' '#1082#1086#1088#1072#1073#1083#1103
        TabOrder = 0
        Text = '125'
      end
      object LeRastSheeprepair: TLabeledEdit
        Left = 8
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 151
        EditLabel.Height = 13
        EditLabel.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1082#1086#1088#1072#1073#1083#1103#1084#1080
        TabOrder = 1
        Text = '10'
      end
      object LeXDelInFleet: TLabeledEdit
        Left = 8
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 108
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1059#1073#1088#1072#1090#1100'/'#1044#1086#1073#1072#1074#1080#1090#1100'"'
        TabOrder = 2
        Text = '300'
      end
      object LeYDelInFleet: TLabeledEdit
        Left = 128
        Top = 112
        Width = 57
        Height = 21
        EditLabel.Width = 108
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1059#1073#1088#1072#1090#1100'/'#1044#1086#1073#1072#1074#1080#1090#1100'"'
        TabOrder = 3
        Text = '375'
      end
      object LeXRepairBtn: TLabeledEdit
        Left = 8
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1056#1077#1084#1086#1085#1090'"'
        TabOrder = 4
        Text = '330'
      end
      object LeYRepairBtn: TLabeledEdit
        Left = 128
        Top = 152
        Width = 57
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1056#1077#1084#1086#1085#1090'"'
        TabOrder = 5
        Text = '-94'
      end
      object LeXFastRepairBtn: TLabeledEdit
        Left = 8
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 93
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1056#1077#1084#1086#1085#1090' '#1044#1040#1056#1054#1052'"'
        TabOrder = 6
        Text = '352'
      end
      object LeYFastRepairBtn: TLabeledEdit
        Left = 128
        Top = 192
        Width = 57
        Height = 21
        EditLabel.Width = 93
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1056#1077#1084#1086#1085#1090' '#1044#1040#1056#1054#1052'"'
        TabOrder = 7
        Text = '189'
      end
      object LeXSearchFastRepairBtn: TLabeledEdit
        Left = 8
        Top = 232
        Width = 57
        Height = 21
        EditLabel.Width = 86
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1087#1086#1080#1089#1082' "'#1044#1040#1056#1054#1052'"'
        TabOrder = 8
        Text = '352'
      end
      object LeYSearchFastRepairBtn: TLabeledEdit
        Left = 128
        Top = 228
        Width = 57
        Height = 21
        EditLabel.Width = 86
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1087#1086#1080#1089#1082' "'#1044#1040#1056#1054#1052'"'
        TabOrder = 9
        Text = '-37'
      end
      object LeXLastSheepBtn: TLabeledEdit
        Left = 248
        Top = 24
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'X "'#1055#1086#1089#1083#1077#1076#1085#1080#1077'"'
        TabOrder = 10
        Text = '-435'
      end
      object LeYLastSheepBtn: TLabeledEdit
        Left = 336
        Top = 24
        Width = 57
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'Y "'#1055#1086#1089#1083#1077#1076#1085#1080#1077'"'
        TabOrder = 11
        Text = '-265'
      end
      object LeYLastSheep: TLabeledEdit
        Left = 336
        Top = 64
        Width = 57
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1055#1086#1089#1083#1077#1076'. '#1082#1086#1088'.'
        TabOrder = 12
        Text = '-195'
      end
      object LeXLastSheep: TLabeledEdit
        Left = 248
        Top = 64
        Width = 57
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1055#1086#1089#1083#1077#1076'. '#1082#1086#1088'.'
        TabOrder = 13
        Text = '-435'
      end
      object LeXKrestBtn: TLabeledEdit
        Left = 248
        Top = 104
        Width = 57
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1050#1088#1077#1089#1090#1080#1082
        TabOrder = 14
        Text = '476'
      end
      object LeYKrestBtn: TLabeledEdit
        Left = 336
        Top = 104
        Width = 57
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1050#1088#1077#1089#1090#1080#1082
        TabOrder = 15
        Text = '-334'
      end
      object LeXSheepInVerf: TLabeledEdit
        Left = 248
        Top = 144
        Width = 57
        Height = 21
        EditLabel.Width = 96
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1050#1086#1088#1072#1073#1083#1103' '#1074' '#1074#1077#1088#1092#1080
        TabOrder = 16
        Text = '-4'
      end
      object LeYSheepInVerf: TLabeledEdit
        Left = 248
        Top = 184
        Width = 57
        Height = 21
        EditLabel.Width = 96
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1050#1086#1088#1072#1073#1083#1103' '#1074' '#1074#1077#1088#1092#1080
        TabOrder = 17
        Text = '-24'
      end
    end
    object BtGoSysSettinInStandartFile: TButton
      Left = 8
      Top = 320
      Width = 121
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100
      TabOrder = 11
      OnClick = BtGoSysSettinInStandartFileClick
    end
    object GbParLevelFleet: TGroupBox
      Left = 224
      Top = 280
      Width = 185
      Height = 57
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1092#1083#1086#1090#1072' '#1085#1072' '#1082#1085#1086#1087#1082#1072#1093' '#1074#1085#1080#1079#1091
      TabOrder = 12
      object LeYFirstNumberLevelBtn: TLabeledEdit
        Left = 88
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'Y '#1055#1077#1088#1074'. '#1094#1080#1092#1088#1072
        TabOrder = 0
        Text = '-151'
      end
      object LeXFirstNumberLevelBtn: TLabeledEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'X '#1055#1077#1088#1074'. '#1094#1080#1092#1088#1072
        TabOrder = 1
        Text = '175'
      end
    end
  end
end
