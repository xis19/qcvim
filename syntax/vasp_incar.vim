" VASP INCAR VIM highlight file
" Language:         VASP_INCAR
" Maintainer:       Xiaoge Su (magichp@gmail.com)
" Last Revision:    2020/05/03 23:07:01
" Version:          0.1

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

let b:current_syntax = "vasp_incar"

" Comments
syntax match vaspIncarComment /\v#.*$/
syntax match vaspIncarComment /\v!.*$/
highlight link vaspIncarComment Comment

" Operator
syntax match vaspIncarOperator "\v\="
syntax match vaspIncarOperator "\v\;"
highlight link vaspIncarOperator Operator

" Values
syntax match vaspIncarBooleanValue "\v\.TRUE\."
syntax match vaspIncarBooleanValue "\v\.FALSE\."
highlight link vaspIncarBooleanValue Boolean

syntax match vaspIncarNumericalValue /\v[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?/
highlight link vaspIncarNumericalValue Float

" Keywords

syntax match vaspIncarKeyword "\vbold"

syntax match vaspIncarKeyword "\vGGA_COMPAT"

syntax match vaspIncarKeyword "\vGGA"

syntax match vaspIncarKeyword "\vHILLS_W"

syntax match vaspIncarKeyword "\vHILLS_BIN"

syntax match vaspIncarKeyword "\vFINDIFF"

syntax match vaspIncarKeyword "\vFERDO"

syntax match vaspIncarKeyword "\vEVENONLYGW"

syntax match vaspIncarKeyword "\vEVENONLY"

syntax match vaspIncarKeyword "\vFERWE"

syntax match vaspIncarKeyword "\vHFSCREEN"

syntax match vaspIncarKeyword "\vHFLMAX"

syntax match vaspIncarKeyword "\vHFRCUT"

syntax match vaspIncarKeyword "\vHILLS_H"

syntax match vaspIncarKeyword "\vWEIMIN"

syntax match vaspIncarKeyword "\vESTOP"

syntax match vaspIncarKeyword "\vZVAL"

syntax match vaspIncarKeyword "\vVOSKOWN"

syntax match vaspIncarKeyword "\vVDW_S8"

syntax match vaspIncarKeyword "\vVDW_SR"

syntax match vaspIncarKeyword "\vWC"

syntax match vaspIncarKeyword "\vVDW_D"

syntax match vaspIncarKeyword "\vVDW_S6"

syntax match vaspIncarKeyword "\vVDW_R0"

syntax match vaspIncarKeyword "\vVDW_RADIUS"

syntax match vaspIncarKeyword "\vVDW_A2"

syntax match vaspIncarKeyword "\vVCAIMAGES"

syntax match vaspIncarKeyword "\vVCUTOFF"

syntax match vaspIncarKeyword "\vVCA"

syntax match vaspIncarKeyword "\vVDW_C6"

syntax match vaspIncarKeyword "\vVDW_A1"

syntax match vaspIncarKeyword "\vVDW_CNRADIUS"

syntax match vaspIncarKeyword "\vTIME"

syntax match vaspIncarKeyword "\vSYMPREC"

syntax match vaspIncarKeyword "\vSYSTEM"

syntax match vaspIncarKeyword "\vVALUE_MAX"

syntax match vaspIncarKeyword "\vTSUBSYS"

syntax match vaspIncarKeyword "\vTEEND"

syntax match vaspIncarKeyword "\vVALUE_MIN"

syntax match vaspIncarKeyword "\vTEBEG"

syntax match vaspIncarKeyword "\vSIGMA"

syntax match vaspIncarKeyword "\vSHAKEMAXITER"

syntax match vaspIncarKeyword "\vSPRING"

syntax match vaspIncarKeyword "\vSMEARINGS"

syntax match vaspIncarKeyword "\vSTEP_MAX"

syntax match vaspIncarKeyword "\vSTEP_SIZE"

syntax match vaspIncarKeyword "\vSHAKETOL"

syntax match vaspIncarKeyword "\vSMASS"

syntax match vaspIncarKeyword "\vROPT"

syntax match vaspIncarKeyword "\vSCSRAD"

syntax match vaspIncarKeyword "\vSCALEE"

syntax match vaspIncarKeyword "\vQUAD_EFG"

syntax match vaspIncarKeyword "\vRWIGS"

syntax match vaspIncarKeyword "\vSAXIS"

syntax match vaspIncarKeyword "\vQSPIRAL"

syntax match vaspIncarKeyword "\vRANDOM_SEED"

syntax match vaspIncarKeyword "\vPROUTINE"

syntax match vaspIncarKeyword "\vPTHRESHOLD"

syntax match vaspIncarKeyword "\vPREC"

syntax match vaspIncarKeyword "\vQMAXFOCKAE"

syntax match vaspIncarKeyword "\vPRECFOCK"

syntax match vaspIncarKeyword "\vPSUBSYS"

syntax match vaspIncarKeyword "\vPSTRESS"

syntax match vaspIncarKeyword "\vPHON_LMC"

syntax match vaspIncarKeyword "\vPHON_NTLIST"

syntax match vaspIncarKeyword "\vPHON_NSTRUCT"

syntax match vaspIncarKeyword "\vPOMASS"

syntax match vaspIncarKeyword "\vPHON_TLIST"

syntax match vaspIncarKeyword "\vPLEVEL"

syntax match vaspIncarKeyword "\vPMASS"

syntax match vaspIncarKeyword "\vPOTIM"

syntax match vaspIncarKeyword "\vPARAM1"

syntax match vaspIncarKeyword "\vPARAM2"

syntax match vaspIncarKeyword "\vPHON_LBOSE"

syntax match vaspIncarKeyword "\vOMEGAMIN"

syntax match vaspIncarKeyword "\vOMEGATL"

syntax match vaspIncarKeyword "\vOFIELD_Q6_NEAR"

syntax match vaspIncarKeyword "\vOMEGAMAX"

syntax match vaspIncarKeyword "\vOFIELD_KAPPA"

syntax match vaspIncarKeyword "\vOFIELD_Q6_FAR"

syntax match vaspIncarKeyword "\vOFIELD_A"

syntax match vaspIncarKeyword "\vODDONLYGW"

syntax match vaspIncarKeyword "\vODDONLY"

syntax match vaspIncarKeyword "\vNTAUPAR"

syntax match vaspIncarKeyword "\vNWRITE"

syntax match vaspIncarKeyword "\vNUPDOWN"

syntax match vaspIncarKeyword "\vNSW"

syntax match vaspIncarKeyword "\vNTARGET_STATES"

syntax match vaspIncarKeyword "\vNSTORB"

syntax match vaspIncarKeyword "\vNSUBSYS"

syntax match vaspIncarKeyword "\vNSIM"

syntax match vaspIncarKeyword "\vNPACO"

syntax match vaspIncarKeyword "\vNOMEGA"

syntax match vaspIncarKeyword "\vNOMEGAPAR"

syntax match vaspIncarKeyword "\vNPAR"

syntax match vaspIncarKeyword "\vNOMEGAR"

syntax match vaspIncarKeyword "\vNPPSTR"

syntax match vaspIncarKeyword "\vNGYROMAG"

syntax match vaspIncarKeyword "\vNLSPLINE"

syntax match vaspIncarKeyword "\vNKREDX"

syntax match vaspIncarKeyword "\vNKREDZ"

syntax match vaspIncarKeyword "\vNGZ"

syntax match vaspIncarKeyword "\vNGZF"

syntax match vaspIncarKeyword "\vNKREDY"

syntax match vaspIncarKeyword "\vNKRED"

syntax match vaspIncarKeyword "\vNGYF"

syntax match vaspIncarKeyword "\vNGY"

syntax match vaspIncarKeyword "\vNGXF"

syntax match vaspIncarKeyword "\vNGX"

syntax match vaspIncarKeyword "\vNFREE"

syntax match vaspIncarKeyword "\vNELMIN"

syntax match vaspIncarKeyword "\vNELMDL"

syntax match vaspIncarKeyword "\vNELM"

syntax match vaspIncarKeyword "\vNBMOD"

syntax match vaspIncarKeyword "\vNBSEEIG"

syntax match vaspIncarKeyword "\vNCORE_IN_IMAGE1"

syntax match vaspIncarKeyword "\vNCRPA_BANDS"

syntax match vaspIncarKeyword "\vNDAV"

syntax match vaspIncarKeyword "\vNCORE"

syntax match vaspIncarKeyword "\vNEDOS"

syntax match vaspIncarKeyword "\vNELECT"

syntax match vaspIncarKeyword "\vNBANDSV"

syntax match vaspIncarKeyword "\vNBANDS"

syntax match vaspIncarKeyword "\vNBLOCK"

syntax match vaspIncarKeyword "\vNBANDSO"

syntax match vaspIncarKeyword "\vML_FF_WTSIF"

syntax match vaspIncarKeyword "\vNBANDSGW"

syntax match vaspIncarKeyword "\vNBLK"

syntax match vaspIncarKeyword "\vML_FF_WTOTEN"

syntax match vaspIncarKeyword "\vML_FF_W1_MB"

syntax match vaspIncarKeyword "\vML_FF_SION2_MB"

syntax match vaspIncarKeyword "\vML_FF_SIGV0_MB"

syntax match vaspIncarKeyword "\vML_FF_W2_MB"

syntax match vaspIncarKeyword "\vML_FF_SION1_MB"

syntax match vaspIncarKeyword "\vML_FF_WTIFOR"

syntax match vaspIncarKeyword "\vML_FF_SIGW0_MB"

syntax match vaspIncarKeyword "\vML_FF_RCOUPLE_MB"

syntax match vaspIncarKeyword "\vML_FF_NR2_MB"

syntax match vaspIncarKeyword "\vML_FF_NWRITE"

syntax match vaspIncarKeyword "\vML_FF_NHYP1_MB"

syntax match vaspIncarKeyword "\vML_FF_RCUT1_MB"

syntax match vaspIncarKeyword "\vML_FF_NR1_MB"

syntax match vaspIncarKeyword "\vML_FF_NMDINT"

syntax match vaspIncarKeyword "\vML_FF_NHYP2_MB"

syntax match vaspIncarKeyword "\vML_FF_NDIM_SCALAPACK"

syntax match vaspIncarKeyword "\vML_FF_NATOM_COUPLED_MB"

syntax match vaspIncarKeyword "\vML_FF_MSPL2_MB"

syntax match vaspIncarKeyword "\vML_FF_MSPL1_MB"

syntax match vaspIncarKeyword "\vML_FF_MRB1_MB"

syntax match vaspIncarKeyword "\vML_FF_MCONF_NEW"

syntax match vaspIncarKeyword "\vML_FF_MHIS"

syntax match vaspIncarKeyword "\vML_FF_MRB2_MB"

syntax match vaspIncarKeyword "\vML_FF_MB_MB"

syntax match vaspIncarKeyword "\vML_FF_MCONF"

syntax match vaspIncarKeyword "\vML_FF_LNORM2_MB"

syntax match vaspIncarKeyword "\vML_FF_LNORM1_MB"

syntax match vaspIncarKeyword "\vML_FF_LMLFF"

syntax match vaspIncarKeyword "\vML_FF_LMAX2_MB"

syntax match vaspIncarKeyword "\vML_FF_LHEAT_MB"

syntax match vaspIncarKeyword "\vML_FF_LEATOM_MB"

syntax match vaspIncarKeyword "\vML_FF_LCRITERIA"

syntax match vaspIncarKeyword "\vML_FF_LCOUPLE_MB"

syntax match vaspIncarKeyword "\vML_FF_LCONF_DISCARD"

syntax match vaspIncarKeyword "\vML_FF_LBASIS_DISCARD"

syntax match vaspIncarKeyword "\vML_FF_LAFILT2_MB"

syntax match vaspIncarKeyword "\vML_FF_ISTART"

syntax match vaspIncarKeyword "\vML_FF_IWEIGHT"

syntax match vaspIncarKeyword "\vML_FF_ISOAP2_MB"

syntax match vaspIncarKeyword "\vML_FF_ISOAP1_MB"

syntax match vaspIncarKeyword "\vVOSKOWN"

syntax match vaspIncarKeyword "\vML_FF_ISCALE_TOTEN_MB"

syntax match vaspIncarKeyword "\vML_FF_ISAMPLE"

syntax match vaspIncarKeyword "\vML_FF_IREG_MB"

syntax match vaspIncarKeyword "\vML_FF_IBROAD1_MB"

syntax match vaspIncarKeyword "\vML_FF_ICUT1_MB"

syntax match vaspIncarKeyword "\vML_FF_IBROAD2_MB"

syntax match vaspIncarKeyword "\vML_FF_EATOM"

syntax match vaspIncarKeyword "\vML_FF_ICOUPLE_MB"

syntax match vaspIncarKeyword "\vML_FF_ICUT2_MB"

syntax match vaspIncarKeyword "\vML_FF_IERR"

syntax match vaspIncarKeyword "\vML_FF_IAFILT2_MB"

syntax match vaspIncarKeyword "\vML_FF_CTIFOR"

syntax match vaspIncarKeyword "\vML_FF_CDOUB"

syntax match vaspIncarKeyword "\vML_FF_CSIG"

syntax match vaspIncarKeyword "\vMINROT"

syntax match vaspIncarKeyword "\vML_FF_CSLOPE"

syntax match vaspIncarKeyword "\vML_FF_CSF"

syntax match vaspIncarKeyword "\vML_FF_AFILT2_MB"

syntax match vaspIncarKeyword "\vMIXPRE"

syntax match vaspIncarKeyword "\vMAXMIX"

syntax match vaspIncarKeyword "\vMAXMEM"

syntax match vaspIncarKeyword "\vMETAGGA"

syntax match vaspIncarKeyword "\vMDALGO"

syntax match vaspIncarKeyword "\vMAGMOM"

syntax match vaspIncarKeyword "\vM_CONSTR"

syntax match vaspIncarKeyword "\vLWRITE_WANPROJ"

syntax match vaspIncarKeyword "\vLZEROZ"

syntax match vaspIncarKeyword "\vLVHAR"

syntax match vaspIncarKeyword "\vLWAVE"

syntax match vaspIncarKeyword "\vLWANNIER90_RUN"

syntax match vaspIncarKeyword "\vLVTOT"

syntax match vaspIncarKeyword "\vLWRITE_UNK"

syntax match vaspIncarKeyword "\vLVDWEXPANSION"

syntax match vaspIncarKeyword "\vLWRITE_MMN_AMN"

syntax match vaspIncarKeyword "\vLWANNIER90"

syntax match vaspIncarKeyword "\vLSUBROT"

syntax match vaspIncarKeyword "\vLVDW_ONECELL"

syntax match vaspIncarKeyword "\vLTHOMAS"

syntax match vaspIncarKeyword "\vLVDW_EWALD"

syntax match vaspIncarKeyword "\vLUSE_VDW"

syntax match vaspIncarKeyword "\vLSPECTRAL"

syntax match vaspIncarKeyword "\vLSPIRAL"

syntax match vaspIncarKeyword "\vLSPECTRALGW"

syntax match vaspIncarKeyword "\vLSELFENERGY"

syntax match vaspIncarKeyword "\vLSCALAPACK"

syntax match vaspIncarKeyword "\vLSMP2LT"

syntax match vaspIncarKeyword "\vLSEPB"

syntax match vaspIncarKeyword "\vLSCSGRAD"

syntax match vaspIncarKeyword "\vLSCALU"

syntax match vaspIncarKeyword "\vLSEPK"

syntax match vaspIncarKeyword "\vLSORBIT"

syntax match vaspIncarKeyword "\vLPARD"

syntax match vaspIncarKeyword "\vLPLANE"

syntax match vaspIncarKeyword "\vLSCAAWARE"

syntax match vaspIncarKeyword "\vLRPA"

syntax match vaspIncarKeyword "\vLORBMOM"

syntax match vaspIncarKeyword "\vLORBIT"

syntax match vaspIncarKeyword "\vLREAL"

syntax match vaspIncarKeyword "\vLPEAD"

syntax match vaspIncarKeyword "\vLMONO"

syntax match vaspIncarKeyword "\vLOPTICS"

syntax match vaspIncarKeyword "\vLOCPROJ"

syntax match vaspIncarKeyword "\vLMP2LT"

syntax match vaspIncarKeyword "\vLNONCOLLINEAR"

syntax match vaspIncarKeyword "\vLNMR_SYM_RED"

syntax match vaspIncarKeyword "\vLNABLA"

syntax match vaspIncarKeyword "\vLMIXTAU"

syntax match vaspIncarKeyword "\vLMAXFOCK"

syntax match vaspIncarKeyword "\vLMAXPAW"

syntax match vaspIncarKeyword "\vLMAXMIX"

syntax match vaspIncarKeyword "\vLKPROJ"

syntax match vaspIncarKeyword "\vLMAXTAU"

syntax match vaspIncarKeyword "\vLHYPERFINE"

syntax match vaspIncarKeyword "\vLLRAUG"

syntax match vaspIncarKeyword "\vLHARTREE"

syntax match vaspIncarKeyword "\vLHFCALC"

syntax match vaspIncarKeyword "\vLFOCKAEDFT"

syntax match vaspIncarKeyword "\vLFOCKACE"

syntax match vaspIncarKeyword "\vLELF"

syntax match vaspIncarKeyword "\vLEFG"

syntax match vaspIncarKeyword "\vLDIPOL"

syntax match vaspIncarKeyword "\vLEPSILON"

syntax match vaspIncarKeyword "\vLDIAG"

syntax match vaspIncarKeyword "\vLDAUU"

syntax match vaspIncarKeyword "\vLDAUTYPE"

syntax match vaspIncarKeyword "\vLCORR"

syntax match vaspIncarKeyword "\vLDAU"

syntax match vaspIncarKeyword "\vLDAUJ"

syntax match vaspIncarKeyword "\vLDAUPRINT"

syntax match vaspIncarKeyword "\vLDAUL"

syntax match vaspIncarKeyword "\vLCHARG"

syntax match vaspIncarKeyword "\vLCHIMAG"

syntax match vaspIncarKeyword "\vLCALCPOL"

syntax match vaspIncarKeyword "\vLCALCEPS"

syntax match vaspIncarKeyword "\vLBLUEOUT"

syntax match vaspIncarKeyword "\vLBERRY"

syntax match vaspIncarKeyword "\vLBONE"

syntax match vaspIncarKeyword "\vLATTICE_CONSTRAINTS"

syntax match vaspIncarKeyword "\vLASPH"

syntax match vaspIncarKeyword "\vLASYNC"

syntax match vaspIncarKeyword "\vLAMBDA"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA_L"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA"

syntax match vaspIncarKeyword "\vKSPACING"

syntax match vaspIncarKeyword "\vLADDER"

syntax match vaspIncarKeyword "\vKPUSE"

syntax match vaspIncarKeyword "\vLAECHG"

syntax match vaspIncarKeyword "\vKPOINT_BSE"

syntax match vaspIncarKeyword "\vIWAVPR"

syntax match vaspIncarKeyword "\vKBLOCK"

syntax match vaspIncarKeyword "\vKGAMMA"

syntax match vaspIncarKeyword "\vIVDW"

syntax match vaspIncarKeyword "\vISPIN"

syntax match vaspIncarKeyword "\vKPAR"

syntax match vaspIncarKeyword "\vISYM"

syntax match vaspIncarKeyword "\vISTART"

syntax match vaspIncarKeyword "\vISIF"

syntax match vaspIncarKeyword "\vISMEAR"

syntax match vaspIncarKeyword "\vIPEAD"

syntax match vaspIncarKeyword "\vINIMIX"

syntax match vaspIncarKeyword "\vINIWAV"

syntax match vaspIncarKeyword "\vINCREM"

syntax match vaspIncarKeyword "\vIMAGES"

syntax match vaspIncarKeyword "\vIMIX"

syntax match vaspIncarKeyword "\vIDIPOL"

syntax match vaspIncarKeyword "\vICORELEVEL"

syntax match vaspIncarKeyword "\vIEPSILON"

syntax match vaspIncarKeyword "\vIGPAR"

syntax match vaspIncarKeyword "\vIBRION"

syntax match vaspIncarKeyword "\vIBAND"

syntax match vaspIncarKeyword "\vICHIBARE"

syntax match vaspIncarKeyword "\vICHARG"

syntax match vaspIncarKeyword "\vHITOLER"

syntax match vaspIncarKeyword "\vENCUTGWSOFT"

syntax match vaspIncarKeyword "\vENCUTGW"

syntax match vaspIncarKeyword "\vEPSILON"

syntax match vaspIncarKeyword "\vIALGO"

syntax match vaspIncarKeyword "\vI_CONSTRAINED_M"

syntax match vaspIncarKeyword "\vENINI"

syntax match vaspIncarKeyword "\vENCUTFOCK"

syntax match vaspIncarKeyword "\vEMIN"

syntax match vaspIncarKeyword "\vEMAX"

syntax match vaspIncarKeyword "\vEFIELD"

syntax match vaspIncarKeyword "\vENCUT"

syntax match vaspIncarKeyword "\vEINT"

syntax match vaspIncarKeyword "\vEFIELD_PEAD"

syntax match vaspIncarKeyword "\vENAUG"

syntax match vaspIncarKeyword "\vEDIFFG"

syntax match vaspIncarKeyword "\vEDIFF"

syntax match vaspIncarKeyword "\vDQ"

syntax match vaspIncarKeyword "\vEBREAK"

syntax match vaspIncarKeyword "\vCMBJB"

syntax match vaspIncarKeyword "\vDIPOL"

syntax match vaspIncarKeyword "\vCSHIFT"

syntax match vaspIncarKeyword "\vDIMER_DIST"

syntax match vaspIncarKeyword "\vDEPER"

syntax match vaspIncarKeyword "\vCLNT"

syntax match vaspIncarKeyword "\vCLL"

syntax match vaspIncarKeyword "\vCLN"

syntax match vaspIncarKeyword "\vCMBJA"

syntax match vaspIncarKeyword "\vCLZ"

syntax match vaspIncarKeyword "\vCH_SIGMA"

syntax match vaspIncarKeyword "\vCH_NEDOS"

syntax match vaspIncarKeyword "\vCMBJ"

syntax match vaspIncarKeyword "\vBMIX_MAG"

syntax match vaspIncarKeyword "\vAMIX"

syntax match vaspIncarKeyword "\vAPACO"

syntax match vaspIncarKeyword "\vBMIX"

syntax match vaspIncarKeyword "\vANTIRES"

syntax match vaspIncarKeyword "\vANDERSEN_PROB"

syntax match vaspIncarKeyword "\vAMIX_MAG"

syntax match vaspIncarKeyword "\vCH_LSPEC"

syntax match vaspIncarKeyword "\vAGGAC"

syntax match vaspIncarKeyword "\vALDAC"

syntax match vaspIncarKeyword "\vALGO"

syntax match vaspIncarKeyword "\vAMIN"

syntax match vaspIncarKeyword "\vADDGRID"

syntax match vaspIncarKeyword "\vAEXX"

syntax match vaspIncarKeyword "\vAGGAX"

highlight link vaspIncarKeyword Keyword
