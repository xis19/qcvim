" VASP INCAR VIM highlight file
" Language:         VASP_INCAR
" Maintainer:       Xiaoge Su (magichp@gmail.com)
" Last Revision:    Wed Jul 04 01:03:17 PDT 2018
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

syntax match vaspIncarKeyword "\vEVENONLYGW"

syntax match vaspIncarKeyword "\vEVENONLY"

syntax match vaspIncarKeyword "\vEPSILON"

syntax match vaspIncarKeyword "\vFERWE"

syntax match vaspIncarKeyword "\vENCUTGWSOFT"

syntax match vaspIncarKeyword "\vFERDO"

syntax match vaspIncarKeyword "\vENINI"

syntax match vaspIncarKeyword "\vENCUTGW"

syntax match vaspIncarKeyword "\vEMIN"

syntax match vaspIncarKeyword "\vENCUTFOCK"

syntax match vaspIncarKeyword "\vENCUT"

syntax match vaspIncarKeyword "\vENAUG"

syntax match vaspIncarKeyword "\vEMAX"

syntax match vaspIncarKeyword "\vNKREDX"

syntax match vaspIncarKeyword "\vNKRED"

syntax match vaspIncarKeyword "\vNKREDY"

syntax match vaspIncarKeyword "\vNGZF"

syntax match vaspIncarKeyword "\vNGYROMAG"

syntax match vaspIncarKeyword "\vNGZ"

syntax match vaspIncarKeyword "\vNGYF"

syntax match vaspIncarKeyword "\vNGY"

syntax match vaspIncarKeyword "\vNELMDL"

syntax match vaspIncarKeyword "\vNGX"

syntax match vaspIncarKeyword "\vNGXF"

syntax match vaspIncarKeyword "\vNELM"

syntax match vaspIncarKeyword "\vNELMIN"

syntax match vaspIncarKeyword "\vNFREE"

syntax match vaspIncarKeyword "\vNELECT"

syntax match vaspIncarKeyword "\vNDAV"

syntax match vaspIncarKeyword "\vNEDOS"

syntax match vaspIncarKeyword "\vNBLOCK"

syntax match vaspIncarKeyword "\vNBLK"

syntax match vaspIncarKeyword "\vNBANDSGW"

syntax match vaspIncarKeyword "\vNBMOD"

syntax match vaspIncarKeyword "\vNCORE"

syntax match vaspIncarKeyword "\vNBANDSO"

syntax match vaspIncarKeyword "\vNBANDS"

syntax match vaspIncarKeyword "\vNBANDSV"

syntax match vaspIncarKeyword "\vMINROT"

syntax match vaspIncarKeyword "\vMIXPRE"

syntax match vaspIncarKeyword "\vMAXMIX"

syntax match vaspIncarKeyword "\vMAXMEM"

syntax match vaspIncarKeyword "\vMAGMOM"

syntax match vaspIncarKeyword "\vLWRITE_MMN_AMN"

syntax match vaspIncarKeyword "\vM_CONSTR"

syntax match vaspIncarKeyword "\vMETAGGA"

syntax match vaspIncarKeyword "\vNBSEEIG"

syntax match vaspIncarKeyword "\vLWAVE"

syntax match vaspIncarKeyword "\vLWANNIER90_RUN"

syntax match vaspIncarKeyword "\vLVTOT"

syntax match vaspIncarKeyword "\vLWANNIER90"

syntax match vaspIncarKeyword "\vLUSE_VDW"

syntax match vaspIncarKeyword "\vLVHAR"

syntax match vaspIncarKeyword "\vLSPECTRALGW"

syntax match vaspIncarKeyword "\vLVDWEXPANSION"

syntax match vaspIncarKeyword "\vLTHOMAS"

syntax match vaspIncarKeyword "\vLVDW_EWALD"

syntax match vaspIncarKeyword "\vLSPECTRAL"

syntax match vaspIncarKeyword "\vLSEPK"

syntax match vaspIncarKeyword "\vLSCSGRAD"

syntax match vaspIncarKeyword "\vLSEPB"

syntax match vaspIncarKeyword "\vLSCALAPACK"

syntax match vaspIncarKeyword "\vLSELFENERGY"

syntax match vaspIncarKeyword "\vLSCALU"

syntax match vaspIncarKeyword "\vLRPA"

syntax match vaspIncarKeyword "\vLSORBIT"

syntax match vaspIncarKeyword "\vLPARD"

syntax match vaspIncarKeyword "\vMDALGO"

syntax match vaspIncarKeyword "\vLPLANE"

syntax match vaspIncarKeyword "\vLORBMOM"

syntax match vaspIncarKeyword "\vLORBIT"

syntax match vaspIncarKeyword "\vLNONCOLLINEAR"

syntax match vaspIncarKeyword "\vLREAL"

syntax match vaspIncarKeyword "\vLNMR_SYM_RED"

syntax match vaspIncarKeyword "\vLOCPROJ"

syntax match vaspIncarKeyword "\vLMIXTAU"

syntax match vaspIncarKeyword "\vLMONO"

syntax match vaspIncarKeyword "\vLOPTICS"

syntax match vaspIncarKeyword "\vLNABLA"

syntax match vaspIncarKeyword "\vLMAXTAU"

syntax match vaspIncarKeyword "\vLPEAD"

syntax match vaspIncarKeyword "\vLMAXMIX"

syntax match vaspIncarKeyword "\vLLRAUG"

syntax match vaspIncarKeyword "\vLMAXPAW"

syntax match vaspIncarKeyword "\vLMAXFOCK"

syntax match vaspIncarKeyword "\vLKPROJ"

syntax match vaspIncarKeyword "\vLHARTREE"

syntax match vaspIncarKeyword "\vLFOCKAEDFT"

syntax match vaspIncarKeyword "\vLELF"

syntax match vaspIncarKeyword "\vLEFG"

syntax match vaspIncarKeyword "\vLHFCALC"

syntax match vaspIncarKeyword "\vLHYPERFINE"

syntax match vaspIncarKeyword "\vLDIPOL"

syntax match vaspIncarKeyword "\vLDIAG"

syntax match vaspIncarKeyword "\vLDAUU"

syntax match vaspIncarKeyword "\vLEPSILON"

syntax match vaspIncarKeyword "\vLDAUL"

syntax match vaspIncarKeyword "\vLDAU"

syntax match vaspIncarKeyword "\vLDAUPRINT"

syntax match vaspIncarKeyword "\vLDAUJ"

syntax match vaspIncarKeyword "\vLCORR"

syntax match vaspIncarKeyword "\vLCHIMAG"

syntax match vaspIncarKeyword "\vLCALCPOL"

syntax match vaspIncarKeyword "\vLBLUEOUT"

syntax match vaspIncarKeyword "\vLCHARG"

syntax match vaspIncarKeyword "\vLCALCEPS"

syntax match vaspIncarKeyword "\vLBONE"

syntax match vaspIncarKeyword "\vLATTICE_CONSTRAINTS"

syntax match vaspIncarKeyword "\vLASYNC"

syntax match vaspIncarKeyword "\vLDAUTYPE"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA"

syntax match vaspIncarKeyword "\vLADDER"

syntax match vaspIncarKeyword "\vLASPH"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA_L"

syntax match vaspIncarKeyword "\vLAMBDA"

syntax match vaspIncarKeyword "\vKPUSE"

syntax match vaspIncarKeyword "\vKPOINT_BSE"

syntax match vaspIncarKeyword "\vKPAR"

syntax match vaspIncarKeyword "\vKBLOCK"

syntax match vaspIncarKeyword "\vKGAMMA"

syntax match vaspIncarKeyword "\vKSPACING"

syntax match vaspIncarKeyword "\vIWAVPR"

syntax match vaspIncarKeyword "\vISYM"

syntax match vaspIncarKeyword "\vISTART"

syntax match vaspIncarKeyword "\vISPIN"

syntax match vaspIncarKeyword "\vLBERRY"

syntax match vaspIncarKeyword "\vISMEAR"

syntax match vaspIncarKeyword "\vIPEAD"

syntax match vaspIncarKeyword "\vIVDW"

syntax match vaspIncarKeyword "\vINIWAV"

syntax match vaspIncarKeyword "\vINCREM"

syntax match vaspIncarKeyword "\vIMAGES"

syntax match vaspIncarKeyword "\vISIF"

syntax match vaspIncarKeyword "\vIGPAR"

syntax match vaspIncarKeyword "\vIEPSILON"

syntax match vaspIncarKeyword "\vINIMIX"

syntax match vaspIncarKeyword "\vICHIBARE"

syntax match vaspIncarKeyword "\vIDIPOL"

syntax match vaspIncarKeyword "\vICORELEVEL"

syntax match vaspIncarKeyword "\vIBAND"

syntax match vaspIncarKeyword "\vICHARG"

syntax match vaspIncarKeyword "\vHITOLER"

syntax match vaspIncarKeyword "\vHILLS_H"

syntax match vaspIncarKeyword "\vHILLS_W"

syntax match vaspIncarKeyword "\vIMIX"

syntax match vaspIncarKeyword "\vHFSCREEN"

syntax match vaspIncarKeyword "\vHILLS_BIN"

syntax match vaspIncarKeyword "\vHFLMAX"

syntax match vaspIncarKeyword "\vEINT"

syntax match vaspIncarKeyword "\vGGA_COMPAT"

syntax match vaspIncarKeyword "\vIBRION"

syntax match vaspIncarKeyword "\vGGA"

syntax match vaspIncarKeyword "\vEFIELD"

syntax match vaspIncarKeyword "\vIALGO"

syntax match vaspIncarKeyword "\vI_CONSTRAINED_M"

syntax match vaspIncarKeyword "\vFINDIFF"

syntax match vaspIncarKeyword "\vEDIFF"

syntax match vaspIncarKeyword "\vEDIFFG"

syntax match vaspIncarKeyword "\vDIMER_DIST"

syntax match vaspIncarKeyword "\vEBREAK"

syntax match vaspIncarKeyword "\vDQ"

syntax match vaspIncarKeyword "\vEFIELD_PEAD"

syntax match vaspIncarKeyword "\vDIPOL"

syntax match vaspIncarKeyword "\vCMBJB"

syntax match vaspIncarKeyword "\vDEPER"

syntax match vaspIncarKeyword "\vCMBJA"

syntax match vaspIncarKeyword "\vCSHIFT"

syntax match vaspIncarKeyword "\vCLZ"

syntax match vaspIncarKeyword "\vCLNT"

syntax match vaspIncarKeyword "\vCMBJ"

syntax match vaspIncarKeyword "\vCLN"

syntax match vaspIncarKeyword "\vCLL"

syntax match vaspIncarKeyword "\vCH_SIGMA"

syntax match vaspIncarKeyword "\vDFT-D3"

syntax match vaspIncarKeyword "\vCH_LSPEC"

syntax match vaspIncarKeyword "\vBMIX_MAG"

syntax match vaspIncarKeyword "\vBMIX"

syntax match vaspIncarKeyword "\vAPACO"

syntax match vaspIncarKeyword "\vANTIRES"

syntax match vaspIncarKeyword "\vANDERSEN_PROB"

syntax match vaspIncarKeyword "\vAMIX"

syntax match vaspIncarKeyword "\vALGO"

syntax match vaspIncarKeyword "\vAMIX_MAG"

syntax match vaspIncarKeyword "\vAMIN"

syntax match vaspIncarKeyword "\vALDAC"

syntax match vaspIncarKeyword "\vAGGAX"

syntax match vaspIncarKeyword "\vAGGAC"

syntax match vaspIncarKeyword "\vAEXX"

syntax match vaspIncarKeyword "\vADDGRID"

syntax match vaspIncarKeyword "\vEPSILON"

syntax match vaspIncarKeyword "\vFERDO"

syntax match vaspIncarKeyword "\vEVENONLYGW"

syntax match vaspIncarKeyword "\vEVENONLY"

syntax match vaspIncarKeyword "\vENCUTGWSOFT"

syntax match vaspIncarKeyword "\vENINI"

syntax match vaspIncarKeyword "\vENCUTGW"

syntax match vaspIncarKeyword "\vENAUG"

syntax match vaspIncarKeyword "\vEMIN"

syntax match vaspIncarKeyword "\vENCUT"

syntax match vaspIncarKeyword "\vENCUTFOCK"

syntax match vaspIncarKeyword "\vEINT"

syntax match vaspIncarKeyword "\vEMAX"

syntax match vaspIncarKeyword "\vNKREDY"

syntax match vaspIncarKeyword "\vNKREDX"

syntax match vaspIncarKeyword "\vNGZF"

syntax match vaspIncarKeyword "\vNKRED"

syntax match vaspIncarKeyword "\vNGZ"

syntax match vaspIncarKeyword "\vNGYROMAG"

syntax match vaspIncarKeyword "\vNGYF"

syntax match vaspIncarKeyword "\vNGY"

syntax match vaspIncarKeyword "\vNGXF"

syntax match vaspIncarKeyword "\vNGX"

syntax match vaspIncarKeyword "\vNELMDL"

syntax match vaspIncarKeyword "\vNELM"

syntax match vaspIncarKeyword "\vNDAV"

syntax match vaspIncarKeyword "\vNELECT"

syntax match vaspIncarKeyword "\vNEDOS"

syntax match vaspIncarKeyword "\vNFREE"

syntax match vaspIncarKeyword "\vNBSEEIG"

syntax match vaspIncarKeyword "\vNELMIN"

syntax match vaspIncarKeyword "\vNCORE"

syntax match vaspIncarKeyword "\vNBMOD"

syntax match vaspIncarKeyword "\vNBLOCK"

syntax match vaspIncarKeyword "\vNBANDSV"

syntax match vaspIncarKeyword "\vNBANDSGW"

syntax match vaspIncarKeyword "\vNBLK"

syntax match vaspIncarKeyword "\vNBANDS"

syntax match vaspIncarKeyword "\vMINROT"

syntax match vaspIncarKeyword "\vMIXPRE"

syntax match vaspIncarKeyword "\vNBANDSO"

syntax match vaspIncarKeyword "\vMAXMIX"

syntax match vaspIncarKeyword "\vMETAGGA"

syntax match vaspIncarKeyword "\vMAXMEM"

syntax match vaspIncarKeyword "\vLWAVE"

syntax match vaspIncarKeyword "\vLWRITE_MMN_AMN"

syntax match vaspIncarKeyword "\vLWANNIER90_RUN"

syntax match vaspIncarKeyword "\vMAGMOM"

syntax match vaspIncarKeyword "\vM_CONSTR"

syntax match vaspIncarKeyword "\vLVTOT"

syntax match vaspIncarKeyword "\vLVHAR"

syntax match vaspIncarKeyword "\vLWANNIER90"

syntax match vaspIncarKeyword "\vLVDWEXPANSION"

syntax match vaspIncarKeyword "\vLUSE_VDW"

syntax match vaspIncarKeyword "\vMDALGO"

syntax match vaspIncarKeyword "\vLSPECTRALGW"

syntax match vaspIncarKeyword "\vLVDW_EWALD"

syntax match vaspIncarKeyword "\vLSPECTRAL"

syntax match vaspIncarKeyword "\vLSEPK"

syntax match vaspIncarKeyword "\vLTHOMAS"

syntax match vaspIncarKeyword "\vLSELFENERGY"

syntax match vaspIncarKeyword "\vLSEPB"

syntax match vaspIncarKeyword "\vLSCSGRAD"

syntax match vaspIncarKeyword "\vLSCALU"

syntax match vaspIncarKeyword "\vLSCALAPACK"

syntax match vaspIncarKeyword "\vLPLANE"

syntax match vaspIncarKeyword "\vLPARD"

syntax match vaspIncarKeyword "\vLRPA"

syntax match vaspIncarKeyword "\vLSORBIT"

syntax match vaspIncarKeyword "\vLORBIT"

syntax match vaspIncarKeyword "\vLREAL"

syntax match vaspIncarKeyword "\vLNONCOLLINEAR"

syntax match vaspIncarKeyword "\vLOCPROJ"

syntax match vaspIncarKeyword "\vLPEAD"

syntax match vaspIncarKeyword "\vLNMR_SYM_RED"

syntax match vaspIncarKeyword "\vLOPTICS"

syntax match vaspIncarKeyword "\vLORBMOM"

syntax match vaspIncarKeyword "\vLMIXTAU"

syntax match vaspIncarKeyword "\vLMONO"

syntax match vaspIncarKeyword "\vLMAXPAW"

syntax match vaspIncarKeyword "\vLNABLA"

syntax match vaspIncarKeyword "\vLLRAUG"

syntax match vaspIncarKeyword "\vLMAXMIX"

syntax match vaspIncarKeyword "\vLMAXTAU"

syntax match vaspIncarKeyword "\vLKPROJ"

syntax match vaspIncarKeyword "\vLHFCALC"

syntax match vaspIncarKeyword "\vLHARTREE"

syntax match vaspIncarKeyword "\vLHYPERFINE"

syntax match vaspIncarKeyword "\vLFOCKAEDFT"

syntax match vaspIncarKeyword "\vLMAXFOCK"

syntax match vaspIncarKeyword "\vLELF"

syntax match vaspIncarKeyword "\vLEFG"

syntax match vaspIncarKeyword "\vLDAUPRINT"

syntax match vaspIncarKeyword "\vLDAUU"

syntax match vaspIncarKeyword "\vLDAUL"

syntax match vaspIncarKeyword "\vLDAUJ"

syntax match vaspIncarKeyword "\vLDIPOL"

syntax match vaspIncarKeyword "\vLDAU"

syntax match vaspIncarKeyword "\vLDIAG"

syntax match vaspIncarKeyword "\vLCHARG"

syntax match vaspIncarKeyword "\vLEPSILON"

syntax match vaspIncarKeyword "\vLCORR"

syntax match vaspIncarKeyword "\vLCHIMAG"

syntax match vaspIncarKeyword "\vLCALCPOL"

syntax match vaspIncarKeyword "\vLCALCEPS"

syntax match vaspIncarKeyword "\vLBLUEOUT"

syntax match vaspIncarKeyword "\vLATTICE_CONSTRAINTS"

syntax match vaspIncarKeyword "\vLBONE"

syntax match vaspIncarKeyword "\vLASYNC"

syntax match vaspIncarKeyword "\vLDAUTYPE"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA_L"

syntax match vaspIncarKeyword "\vLAMBDA"

syntax match vaspIncarKeyword "\vLASPH"

syntax match vaspIncarKeyword "\vLADDER"

syntax match vaspIncarKeyword "\vKPOINT_BSE"

syntax match vaspIncarKeyword "\vKPUSE"

syntax match vaspIncarKeyword "\vKGAMMA"

syntax match vaspIncarKeyword "\vIWAVPR"

syntax match vaspIncarKeyword "\vKPAR"

syntax match vaspIncarKeyword "\vKBLOCK"

syntax match vaspIncarKeyword "\vKSPACING"

syntax match vaspIncarKeyword "\vIVDW"

syntax match vaspIncarKeyword "\vISTART"

syntax match vaspIncarKeyword "\vLBERRY"

syntax match vaspIncarKeyword "\vISIF"

syntax match vaspIncarKeyword "\vISMEAR"

syntax match vaspIncarKeyword "\vISPIN"

syntax match vaspIncarKeyword "\vIPEAD"

syntax match vaspIncarKeyword "\vISYM"

syntax match vaspIncarKeyword "\vINIWAV"

syntax match vaspIncarKeyword "\vINCREM"

syntax match vaspIncarKeyword "\vIMAGES"

syntax match vaspIncarKeyword "\vINIMIX"

syntax match vaspIncarKeyword "\vIEPSILON"

syntax match vaspIncarKeyword "\vIGPAR"

syntax match vaspIncarKeyword "\vIDIPOL"

syntax match vaspIncarKeyword "\vICHIBARE"

syntax match vaspIncarKeyword "\vICORELEVEL"

syntax match vaspIncarKeyword "\vICHARG"

syntax match vaspIncarKeyword "\vIBAND"

syntax match vaspIncarKeyword "\vIMIX"

syntax match vaspIncarKeyword "\vHITOLER"

syntax match vaspIncarKeyword "\vHILLS_H"

syntax match vaspIncarKeyword "\vHILLS_W"

syntax match vaspIncarKeyword "\vHILLS_BIN"

syntax match vaspIncarKeyword "\vHFLMAX"

syntax match vaspIncarKeyword "\vIBRION"

syntax match vaspIncarKeyword "\vHFSCREEN"

syntax match vaspIncarKeyword "\vI_CONSTRAINED_M"

syntax match vaspIncarKeyword "\vIALGO"

syntax match vaspIncarKeyword "\vGGA_COMPAT"

syntax match vaspIncarKeyword "\vFINDIFF"

syntax match vaspIncarKeyword "\vGGA"

syntax match vaspIncarKeyword "\vEFIELD"

syntax match vaspIncarKeyword "\vEDIFFG"

syntax match vaspIncarKeyword "\vFERWE"

syntax match vaspIncarKeyword "\vDQ"

syntax match vaspIncarKeyword "\vEDIFF"

syntax match vaspIncarKeyword "\vEBREAK"

syntax match vaspIncarKeyword "\vEFIELD_PEAD"

syntax match vaspIncarKeyword "\vDIMER_DIST"

syntax match vaspIncarKeyword "\vDIPOL"

syntax match vaspIncarKeyword "\vDEPER"

syntax match vaspIncarKeyword "\vCSHIFT"

syntax match vaspIncarKeyword "\vCMBJB"

syntax match vaspIncarKeyword "\vCMBJA"

syntax match vaspIncarKeyword "\vDFT-D3"

syntax match vaspIncarKeyword "\vCLZ"

syntax match vaspIncarKeyword "\vCLN"

syntax match vaspIncarKeyword "\vCLNT"

syntax match vaspIncarKeyword "\vCLL"

syntax match vaspIncarKeyword "\vCH_SIGMA"

syntax match vaspIncarKeyword "\vCMBJ"

syntax match vaspIncarKeyword "\vCH_LSPEC"

syntax match vaspIncarKeyword "\vBMIX_MAG"

syntax match vaspIncarKeyword "\vAPACO"

syntax match vaspIncarKeyword "\vBMIX"

syntax match vaspIncarKeyword "\vANTIRES"

syntax match vaspIncarKeyword "\vANDERSEN_PROB"

syntax match vaspIncarKeyword "\vAMIX_MAG"

syntax match vaspIncarKeyword "\vAMIX"

syntax match vaspIncarKeyword "\vAMIN"

syntax match vaspIncarKeyword "\vALGO"

syntax match vaspIncarKeyword "\vALDAC"

syntax match vaspIncarKeyword "\vAGGAX"

syntax match vaspIncarKeyword "\vAGGAC"

syntax match vaspIncarKeyword "\vADDGRID"

syntax match vaspIncarKeyword "\vAEXX"

syntax match vaspIncarKeyword "\vENINI"

syntax match vaspIncarKeyword "\vENCUTGWSOFT"

syntax match vaspIncarKeyword "\vFERWE"

syntax match vaspIncarKeyword "\vEPSILON"

syntax match vaspIncarKeyword "\vFERDO"

syntax match vaspIncarKeyword "\vEVENONLYGW"

syntax match vaspIncarKeyword "\vEVENONLY"

syntax match vaspIncarKeyword "\vENCUTFOCK"

syntax match vaspIncarKeyword "\vENCUTGW"

syntax match vaspIncarKeyword "\vENCUT"

syntax match vaspIncarKeyword "\vENAUG"

syntax match vaspIncarKeyword "\vEMIN"

syntax match vaspIncarKeyword "\vEMAX"

syntax match vaspIncarKeyword "\vWEIMIN"

syntax match vaspIncarKeyword "\vZVAL"

syntax match vaspIncarKeyword "\vVOSKOWN"

syntax match vaspIncarKeyword "\vWC"

syntax match vaspIncarKeyword "\vVDW_SR"

syntax match vaspIncarKeyword "\vVDW_S8"

syntax match vaspIncarKeyword "\vVDW_S6"

syntax match vaspIncarKeyword "\vVDW_RADIUS"

syntax match vaspIncarKeyword "\vVDW_D"

syntax match vaspIncarKeyword "\vVDW_CNRADIUS"

syntax match vaspIncarKeyword "\vVDW_A2"

syntax match vaspIncarKeyword "\vVDW_R0"

syntax match vaspIncarKeyword "\vVDW_A1"

syntax match vaspIncarKeyword "\vVALUE_MIN"

syntax match vaspIncarKeyword "\vVDW_C6"

syntax match vaspIncarKeyword "\vVALUE_MAX"

syntax match vaspIncarKeyword "\vTSUBSYS"

syntax match vaspIncarKeyword "\vTIME"

syntax match vaspIncarKeyword "\vTEEND"

syntax match vaspIncarKeyword "\vTEBEG"

syntax match vaspIncarKeyword "\vSYSTEM"

syntax match vaspIncarKeyword "\vSTEP_MAX"

syntax match vaspIncarKeyword "\vSTEP_SIZE"

syntax match vaspIncarKeyword "\vSPRING"

syntax match vaspIncarKeyword "\vSMEARINGS"

syntax match vaspIncarKeyword "\vSMASS"

syntax match vaspIncarKeyword "\vSYMPREC"

syntax match vaspIncarKeyword "\vSIGMA"

syntax match vaspIncarKeyword "\vSHAKETOL"

syntax match vaspIncarKeyword "\vSCSRAD"

syntax match vaspIncarKeyword "\vRWIGS"

syntax match vaspIncarKeyword "\vSHAKEMAXITER"

syntax match vaspIncarKeyword "\vRANDOM_SEED"

syntax match vaspIncarKeyword "\vSelf-consistent screening in Tkatchenko-Scheffler method"

syntax match vaspIncarKeyword "\vROPT"

syntax match vaspIncarKeyword "\vQUAD_EFG"

syntax match vaspIncarKeyword "\vQMAXFOCKAE"

syntax match vaspIncarKeyword "\vPSUBSYS"

syntax match vaspIncarKeyword "\vSAXIS"

syntax match vaspIncarKeyword "\vPTHRESHOLD"

syntax match vaspIncarKeyword "\vPSTRESS"

syntax match vaspIncarKeyword "\vPROUTINE"

syntax match vaspIncarKeyword "\vPRECFOCK"

syntax match vaspIncarKeyword "\vPOMASS"

syntax match vaspIncarKeyword "\vPOTIM"

syntax match vaspIncarKeyword "\vPLEVEL"

syntax match vaspIncarKeyword "\vPMASS"

syntax match vaspIncarKeyword "\vPREC"

syntax match vaspIncarKeyword "\vPARAM2"

syntax match vaspIncarKeyword "\vOFIELD_Q6_NEAR"

syntax match vaspIncarKeyword "\vPARAM1"

syntax match vaspIncarKeyword "\vOMEGATL"

syntax match vaspIncarKeyword "\vOMEGAMAX"

syntax match vaspIncarKeyword "\vOMEGAMIN"

syntax match vaspIncarKeyword "\vOFIELD_KAPPA"

syntax match vaspIncarKeyword "\vOFIELD_Q6_FAR"

syntax match vaspIncarKeyword "\vOFIELD_A"

syntax match vaspIncarKeyword "\vNTAUPAR"

syntax match vaspIncarKeyword "\vNUPDOWN"

syntax match vaspIncarKeyword "\vNWRITE"

syntax match vaspIncarKeyword "\vODDONLY"

syntax match vaspIncarKeyword "\vNSW"

syntax match vaspIncarKeyword "\vODDONLYGW"

syntax match vaspIncarKeyword "\vNSUBSYS"

syntax match vaspIncarKeyword "\vNPPSTR"

syntax match vaspIncarKeyword "\vNSIM"

syntax match vaspIncarKeyword "\vNPAR"

syntax match vaspIncarKeyword "\vNPACO"

syntax match vaspIncarKeyword "\vNOMEGAPAR"

syntax match vaspIncarKeyword "\vNOMEGAR"

syntax match vaspIncarKeyword "\vNLSPLINE"

syntax match vaspIncarKeyword "\vNOMEGA"

syntax match vaspIncarKeyword "\vNKREDZ"

syntax match vaspIncarKeyword "\vNKREDX"

syntax match vaspIncarKeyword "\vNKRED"

syntax match vaspIncarKeyword "\vNGZF"

syntax match vaspIncarKeyword "\vNGYROMAG"

syntax match vaspIncarKeyword "\vNGZ"

syntax match vaspIncarKeyword "\vNKREDY"

syntax match vaspIncarKeyword "\vNGYF"

syntax match vaspIncarKeyword "\vNGY"

syntax match vaspIncarKeyword "\vNELMIN"

syntax match vaspIncarKeyword "\vNGX"

syntax match vaspIncarKeyword "\vNFREE"

syntax match vaspIncarKeyword "\vNGXF"

syntax match vaspIncarKeyword "\vNELMDL"

syntax match vaspIncarKeyword "\vNEDOS"

syntax match vaspIncarKeyword "\vNELECT"

syntax match vaspIncarKeyword "\vNDAV"

syntax match vaspIncarKeyword "\vNELM"

syntax match vaspIncarKeyword "\vNBSEEIG"

syntax match vaspIncarKeyword "\vNBLOCK"

syntax match vaspIncarKeyword "\vNCORE"

syntax match vaspIncarKeyword "\vNBMOD"

syntax match vaspIncarKeyword "\vNBLK"

syntax match vaspIncarKeyword "\vNBANDS"

syntax match vaspIncarKeyword "\vNBANDSO"

syntax match vaspIncarKeyword "\vNBANDSGW"

syntax match vaspIncarKeyword "\vMINROT"

syntax match vaspIncarKeyword "\vNBANDSV"

syntax match vaspIncarKeyword "\vMIXPRE"

syntax match vaspIncarKeyword "\vMETAGGA"

syntax match vaspIncarKeyword "\vMAXMIX"

syntax match vaspIncarKeyword "\vLWAVE"

syntax match vaspIncarKeyword "\vM_CONSTR"

syntax match vaspIncarKeyword "\vMAXMEM"

syntax match vaspIncarKeyword "\vMAGMOM"

syntax match vaspIncarKeyword "\vLWANNIER90"

syntax match vaspIncarKeyword "\vLWANNIER90_RUN"

syntax match vaspIncarKeyword "\vLVHAR"

syntax match vaspIncarKeyword "\vLVDW_EWALD"

syntax match vaspIncarKeyword "\vLVTOT"

syntax match vaspIncarKeyword "\vLVDWEXPANSION"

syntax match vaspIncarKeyword "\vLWRITE_MMN_AMN"

syntax match vaspIncarKeyword "\vLUSE_VDW"

syntax match vaspIncarKeyword "\vLSPECTRALGW"

syntax match vaspIncarKeyword "\vLTHOMAS"

syntax match vaspIncarKeyword "\vLSPECTRAL"

syntax match vaspIncarKeyword "\vLSEPK"

syntax match vaspIncarKeyword "\vLSCSGRAD"

syntax match vaspIncarKeyword "\vLSEPB"

syntax match vaspIncarKeyword "\vLSELFENERGY"

syntax match vaspIncarKeyword "\vLRPA"

syntax match vaspIncarKeyword "\vLSCALAPACK"

syntax match vaspIncarKeyword "\vLSCALU"

syntax match vaspIncarKeyword "\vLPLANE"

syntax match vaspIncarKeyword "\vLREAL"

syntax match vaspIncarKeyword "\vLPARD"

syntax match vaspIncarKeyword "\vLORBMOM"

syntax match vaspIncarKeyword "\vLORBIT"

syntax match vaspIncarKeyword "\vLSORBIT"

syntax match vaspIncarKeyword "\vLNMR_SYM_RED"

syntax match vaspIncarKeyword "\vLOCPROJ"

syntax match vaspIncarKeyword "\vLNONCOLLINEAR"

syntax match vaspIncarKeyword "\vLPEAD"

syntax match vaspIncarKeyword "\vLMONO"

syntax match vaspIncarKeyword "\vLOPTICS"

syntax match vaspIncarKeyword "\vLMIXTAU"

syntax match vaspIncarKeyword "\vMDALGO"

syntax match vaspIncarKeyword "\vLMAXPAW"

syntax match vaspIncarKeyword "\vLMAXMIX"

syntax match vaspIncarKeyword "\vLMAXTAU"

syntax match vaspIncarKeyword "\vLNABLA"

syntax match vaspIncarKeyword "\vLLRAUG"

syntax match vaspIncarKeyword "\vLHFCALC"

syntax match vaspIncarKeyword "\vLHYPERFINE"

syntax match vaspIncarKeyword "\vLKPROJ"

syntax match vaspIncarKeyword "\vLFOCKAEDFT"

syntax match vaspIncarKeyword "\vLMAXFOCK"

syntax match vaspIncarKeyword "\vLELF"

syntax match vaspIncarKeyword "\vLHARTREE"

syntax match vaspIncarKeyword "\vLEFG"

syntax match vaspIncarKeyword "\vLDIAG"

syntax match vaspIncarKeyword "\vLDAUU"

syntax match vaspIncarKeyword "\vLDIPOL"

syntax match vaspIncarKeyword "\vLEPSILON"

syntax match vaspIncarKeyword "\vLDAUJ"

syntax match vaspIncarKeyword "\vLDAUPRINT"

syntax match vaspIncarKeyword "\vLDAUL"

syntax match vaspIncarKeyword "\vLDAU"

syntax match vaspIncarKeyword "\vLCORR"

syntax match vaspIncarKeyword "\vLCALCPOL"

syntax match vaspIncarKeyword "\vLCHIMAG"

syntax match vaspIncarKeyword "\vLBLUEOUT"

syntax match vaspIncarKeyword "\vLBONE"

syntax match vaspIncarKeyword "\vLATTICE_CONSTRAINTS"

syntax match vaspIncarKeyword "\vLCHARG"

syntax match vaspIncarKeyword "\vLCALCEPS"

syntax match vaspIncarKeyword "\vLASYNC"

syntax match vaspIncarKeyword "\vLDAUTYPE"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA_L"

syntax match vaspIncarKeyword "\vLANGEVIN_GAMMA"

syntax match vaspIncarKeyword "\vLASPH"

syntax match vaspIncarKeyword "\vLAMBDA"

syntax match vaspIncarKeyword "\vKPUSE"

syntax match vaspIncarKeyword "\vKSPACING"

syntax match vaspIncarKeyword "\vKPAR"

syntax match vaspIncarKeyword "\vKPOINT_BSE"

syntax match vaspIncarKeyword "\vKGAMMA"

syntax match vaspIncarKeyword "\vLADDER"

syntax match vaspIncarKeyword "\vKBLOCK"

syntax match vaspIncarKeyword "\vIWAVPR"

syntax match vaspIncarKeyword "\vIVDW"

syntax match vaspIncarKeyword "\vISYM"

syntax match vaspIncarKeyword "\vLBERRY"

syntax match vaspIncarKeyword "\vISPIN"

syntax match vaspIncarKeyword "\vISTART"

syntax match vaspIncarKeyword "\vIPEAD"

syntax match vaspIncarKeyword "\vISIF"

syntax match vaspIncarKeyword "\vISMEAR"

syntax match vaspIncarKeyword "\vINIWAV"

syntax match vaspIncarKeyword "\vINCREM"

syntax match vaspIncarKeyword "\vINIMIX"

syntax match vaspIncarKeyword "\vIEPSILON"

syntax match vaspIncarKeyword "\vIGPAR"

syntax match vaspIncarKeyword "\vIDIPOL"

syntax match vaspIncarKeyword "\vIMAGES"

syntax match vaspIncarKeyword "\vICORELEVEL"

syntax match vaspIncarKeyword "\vICHIBARE"

syntax match vaspIncarKeyword "\vICHARG"

syntax match vaspIncarKeyword "\vIBAND"

syntax match vaspIncarKeyword "\vIMIX"

syntax match vaspIncarKeyword "\vHITOLER"

syntax match vaspIncarKeyword "\vHILLS_W"

syntax match vaspIncarKeyword "\vHILLS_H"

syntax match vaspIncarKeyword "\vIALGO"

syntax match vaspIncarKeyword "\vHILLS_BIN"

syntax match vaspIncarKeyword "\vI_CONSTRAINED_M"

syntax match vaspIncarKeyword "\vHFLMAX"

syntax match vaspIncarKeyword "\vHFSCREEN"

syntax match vaspIncarKeyword "\vIBRION"

syntax match vaspIncarKeyword "\vGGA_COMPAT"

syntax match vaspIncarKeyword "\vGGA"

syntax match vaspIncarKeyword "\vFINDIFF"

syntax match vaspIncarKeyword "\vEINT"

syntax match vaspIncarKeyword "\vEFIELD"

syntax match vaspIncarKeyword "\vEDIFF"

syntax match vaspIncarKeyword "\vEFIELD_PEAD"

syntax match vaspIncarKeyword "\vEDIFFG"

syntax match vaspIncarKeyword "\vEBREAK"

syntax match vaspIncarKeyword "\vDQ"

syntax match vaspIncarKeyword "\vDIMER_DIST"

syntax match vaspIncarKeyword "\vDIPOL"

syntax match vaspIncarKeyword "\vCMBJB"

syntax match vaspIncarKeyword "\vCSHIFT"

syntax match vaspIncarKeyword "\vCMBJA"

syntax match vaspIncarKeyword "\vDEPER"

syntax match vaspIncarKeyword "\vDFT-D3"

syntax match vaspIncarKeyword "\vCLNT"

syntax match vaspIncarKeyword "\vCMBJ"

syntax match vaspIncarKeyword "\vCLZ"

syntax match vaspIncarKeyword "\vCLL"

syntax match vaspIncarKeyword "\vCLN"

syntax match vaspIncarKeyword "\vCH_LSPEC"

syntax match vaspIncarKeyword "\vCH_SIGMA"

syntax match vaspIncarKeyword "\vBMIX_MAG"

syntax match vaspIncarKeyword "\vBMIX"

syntax match vaspIncarKeyword "\vANTIRES"

syntax match vaspIncarKeyword "\vAPACO"

syntax match vaspIncarKeyword "\vANDERSEN_PROB"

syntax match vaspIncarKeyword "\vAMIX"

syntax match vaspIncarKeyword "\vAMIX_MAG"

syntax match vaspIncarKeyword "\vALDAC"

syntax match vaspIncarKeyword "\vAMIN"

syntax match vaspIncarKeyword "\vALGO"

syntax match vaspIncarKeyword "\vAGGAX"

syntax match vaspIncarKeyword "\vAGGAC"

syntax match vaspIncarKeyword "\vAEXX"

syntax match vaspIncarKeyword "\vADDGRID"

highlight link vaspIncarKeyword Keyword
