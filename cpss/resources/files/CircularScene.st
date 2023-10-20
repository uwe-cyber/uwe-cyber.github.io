PROGRAM conveyors
  VAR
    Start_Button AT %IX100.0 : BOOL;
    Stop_Button AT %IX100.1 : BOOL;
    TT1_Limit90Left AT %IX100.3 : BOOL;
    TT1_FrontLim AT %IX100.4 : BOOL;
    TT1_Limit0 AT %IX100.5 : BOOL;
    TT2_Limit90Lef AT %IX100.6 : BOOL;
    TT2_FrontLim AT %IX100.7 : BOOL;
    TT2_Limit0 AT %IX101.0 : BOOL;
    Run AT %QX107.0 : BOOL;
    Conveyor1 AT %QX100.0 : BOOL;
    Conveyor2 AT %QX100.1 : BOOL;
    Conveyor3 AT %QX100.2 : BOOL;
    Conveyor4 AT %QX100.3 : BOOL;
    Conveyor5 AT %QX100.4 : BOOL;
    Conveyor6 AT %QX100.5 : BOOL;
    CurvedConveryor1 AT %QX100.6 : BOOL;
    CurvedConveyor2 AT %QX100.7 : BOOL;
    TT1_Turn AT %QX101.0 : BOOL;
    TT1_RollForward AT %QX101.1 : BOOL;
    RS1 AT %QX101.2 : BOOL;
    TT2_Turn AT %QX101.3 : BOOL;
    TT2_RollForward AT %QX101.4 : BOOL;
    RS2 AT %QX101.5 : BOOL;
  END_VAR

  Run := Stop_Button AND (Run OR Start_Button);
  Conveyor1 := Run;
  Conveyor2 := Run;
  Conveyor3 := Run;
  Conveyor4 := Run;
  Conveyor5 := Run;
  Conveyor6 := Run;
  CurvedConveryor1 := Run;
  CurvedConveyor2 := Run;
  TT1_RollForward := NOT(TT1_FrontLim AND Run);
  RS1 := TT1_FrontLim AND Run;
  TT1_Turn := TT1_Limit0 AND RS1 AND Run;
  TT1_Turn := NOT(NOT(TT1_FrontLim) AND Run);
  RS1 := NOT(TT1_Limit0 AND NOT(TT1_FrontLim) AND Run);
  TT1_RollForward := TT1_Limit0 AND NOT(TT1_FrontLim) AND Run OR TT1_Limit90Left AND Run;
  TT2_RollForward := NOT(TT2_FrontLim AND Run);
  RS2 := TT2_FrontLim AND Run;
  TT2_Turn := TT2_Limit0 AND RS2 AND Run;
  TT2_Turn := NOT(NOT(TT2_FrontLim) AND Run);
  RS2 := NOT(TT2_Limit0 AND NOT(TT2_FrontLim) AND Run);
  TT2_RollForward := TT2_Limit0 AND NOT(TT2_FrontLim) AND Run OR TT2_Limit90Lef AND Run;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : conveyors;
  END_RESOURCE
END_CONFIGURATION
