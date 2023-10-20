PROGRAM program0
  VAR
    I_Start AT %IX100.1 : BOOL;
    I_Stop AT %IX100.2 : BOOL;
  END_VAR
  VAR
    V_MixingProcess : BOOL;
    V_SplittingProcess : BOOL;
    V_Stop : BOOL;
  END_VAR
  VAR
    Conveyer_Flour AT %QX100.0 : BOOL;
    Conveyer_Yeast AT %QX100.1 : BOOL;
    Conveyer_SS AT %QX100.2 : BOOL;
    Conveyer_Additives AT %QX100.3 : BOOL;
    Conveyer_Oil AT %QX100.4 : BOOL;
    Conveyer_Water AT %QX100.5 : BOOL;
    SpawnA_1 AT %QX100.6 : BOOL;
    SpawnA_2 AT %QW100.1 : INT;
    SpawnA_3 AT %QW101.1 : INT;
    SpawnB_1 AT %QX102.4 : BOOL;
    SpawnB_2 AT %QW102.1 : INT;
    SpawnB_3 AT %QW103.1 : INT;
    FlourDiff AT %IX100.3 : BOOL;
    YeastDiff AT %IX100.4 : BOOL;
    MixingDiff AT %IX100.5 : BOOL;
    SSDiff AT %IX100.6 : BOOL;
    AdditivesDiff AT %IX100.7 : BOOL;
    DrymixingDiff AT %IX101.0 : BOOL;
    OilDiff AT %IX101.1 : BOOL;
    WaterDiff AT %IX101.2 : BOOL;
    WetmixingDiff AT %IX101.3 : BOOL;
    SplittingDiff AT %IX101.4 : BOOL;
    ProofingOvenDiff AT %IX101.5 : BOOL;
    BakingOvenDiff AT %IX101.6 : BOOL;
    EmergencyStop AT %IX101.7 : BOOL;
    FlourStop AT %QX100.7 : BOOL;
    YeastStop AT %QX101.0 : BOOL;
    MixingConveyor AT %QX101.1 : BOOL;
    SSStop AT %QX101.2 : BOOL;
    AdditivesStop AT %QX101.3 : BOOL;
    DrymixingConveyor AT %QX101.4 : BOOL;
    DrymixingStop AT %QX101.5 : BOOL;
    OilStop AT %QX101.6 : BOOL;
    WaterStop AT %QX101.7 : BOOL;
    WetMixingConveyor AT %QX102.0 : BOOL;
    WetMixingStop AT %QX102.1 : BOOL;
    SplittingConveyor AT %QX102.2 : BOOL;
    Split AT %QX102.3 : BOOL;
    ProofingOvenConveyor AT %QX102.5 : BOOL;
    ConnectorConveyor AT %QX102.6 : BOOL;
    BakingOvenConveyor AT %QX102.7 : BOOL;
    StopConveyor AT %QX103.0 : BOOL;
    Endmixing AT %QX103.1 : BOOL;
  END_VAR
  VAR
    RS1 : RS;
    RS2 : RS;
    RS3 : RS;
    RS4 : RS;
    RS5 : RS;
    RS6 : RS;
    RS7 : RS;
    RS8 : RS;
    RS9 : RS;
    TP0 : TP;
    TP1 : TP;
    TP2 : TP;
    TP3 : TP;
    TP4 : TP;
    TP5 : TP;
    TP6 : TP;
    TP7 : TP;
    TP8 : TP;
    TP9 : TP;
    TP10 : TP;
    TON0 : TON;
    RS10 : RS;
    RS11 : RS;
    RS12 : RS;
    TP11 : TP;
    TP12 : TP;
    TON1 : TON;
    RS0 : RS;
    RS13 : RS;
    TON2 : TON;
    NOT137_OUT : BOOL;
    NOT133_OUT : BOOL;
    NOT48_OUT : BOOL;
    NOT54_OUT : BOOL;
    NOT52_OUT : BOOL;
    NOT55_OUT : BOOL;
    NOT135_OUT : BOOL;
  END_VAR

  SpawnA_1 := V_MixingProcess;
  SpawnA_2 := 0000000000000000;
  SpawnB_1 := V_SplittingProcess;
  SpawnA_3 := 0000000000000001;
  SpawnB_3 := 0000000000000000;
  NOT137_OUT := NOT(I_Stop);
  RS1(S := I_Start, R1 := NOT137_OUT);
  V_MixingProcess := RS1.Q1;
  SpawnB_2 := 0000000000000001;
  RS2(S := I_Start, R1 := NOT137_OUT);
  Conveyer_Flour := RS2.Q1;
  NOT133_OUT := NOT(I_Stop);
  V_Stop := NOT133_OUT;
  RS3(S := I_Start, R1 := NOT137_OUT);
  Conveyer_Yeast := RS3.Q1;
  NOT48_OUT := NOT(EmergencyStop);
  V_Stop := NOT48_OUT;
  NOT54_OUT := NOT(I_Stop);
  RS11(S := I_Start, R1 := NOT54_OUT);
  ConnectorConveyor := RS11.Q1;
  NOT52_OUT := NOT(I_Stop);
  RS5(S := I_Start, R1 := NOT52_OUT);
  Conveyer_SS := RS5.Q1;
  RS10(S := I_Start, R1 := NOT54_OUT);
  StopConveyor := RS10.Q1;
  RS4(S := I_Start, R1 := NOT52_OUT);
  Conveyer_Additives := RS4.Q1;
  RS12(S := I_Start, R1 := NOT54_OUT);
  Endmixing := RS12.Q1;
  RS6(S := I_Start, R1 := NOT52_OUT);
  Conveyer_Oil := RS6.Q1;
  NOT55_OUT := NOT(I_Stop);
  RS8(S := I_Start, R1 := NOT55_OUT);
  Conveyer_Water := RS8.Q1;
  RS7(S := I_Start, R1 := NOT55_OUT);
  DrymixingConveyor := RS7.Q1;
  RS9(S := I_Start, R1 := NOT55_OUT);
  WetMixingConveyor := RS9.Q1;
  TP0(IN := FlourDiff, PT := T#12S);
  FlourStop := TP0.Q;
  TP1(IN := YeastDiff, PT := T#6S);
  YeastStop := TP1.Q;
  TP2(IN := MixingDiff, PT := T#15S);
  MixingConveyor := TP2.Q;
  TP3(IN := SSDiff, PT := T#8S);
  SSStop := TP3.Q;
  TP4(IN := AdditivesDiff, PT := T#6S);
  AdditivesStop := TP4.Q;
  TP5(IN := DrymixingDiff, PT := T#14S);
  DrymixingStop := TP5.Q;
  TP6(IN := OilDiff, PT := T#7S);
  OilStop := TP6.Q;
  TP7(IN := WaterDiff, PT := T#9S);
  WaterStop := TP7.Q;
  TP8(IN := WetmixingDiff, PT := T#45S);
  WetMixingStop := TP8.Q;
  TP9(IN := WetmixingDiff, PT := T#65S);
  SplittingConveyor := TP9.Q;
  TP10(IN := SplittingDiff, PT := T#5S);
  Split := TP10.Q;
  TON0(IN := TP10.Q, PT := T#2S);
  V_SplittingProcess := TON0.Q;
  NOT135_OUT := NOT(ProofingOvenDiff);
  TP11(IN := NOT135_OUT, PT := T#25S);
  ProofingOvenConveyor := TP11.Q;
  TP12(IN := BakingOvenDiff, PT := T#25S);
  BakingOvenConveyor := TP12.Q;
  RS0(S := BakingOvenDiff, R1 := V_Stop);
  TON1(IN := RS0.Q1, PT := T#30S);
  TON2(IN := TON1.Q, PT := T#5S);
  RS13(S := TON1.Q, R1 := TON2.Q);
  V_Stop := RS13.Q1;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
