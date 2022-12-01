//
//  GNPSwAPICode.h
//  UHFSDK
//
//  Created by Gianni on 2019/11/25.
//  Copyright © 2019 Gianni. All rights reserved.
//

#ifndef GNPSwAPICode_h
#define GNPSwAPICode_h

typedef NS_ENUM(Byte, SoftwareAPINameCode){
    SW_CC_GetFirmwareVersion                         = 0x00,
    SW_CC_StartInventory                                   ,
    SW_CC_StartInventoryEx                                 ,
    SW_CC_StopInventory                                    ,
    SW_CC_WriteEPC                                         ,
    SW_CC_WriteTag                                         ,
    SW_CC_ReadEPC                                          ,
    SW_CC_ReadTag                                          ,
    SW_CC_LockTag                                          ,
    SW_CC_KillTag                                          ,
    SW_CC_ControlBuzzer                                    ,
    SW_CC_Extra3                                           ,
    SW_CC_Extra4                                           ,
    
    SW_EE_InitializeSettings                               ,
    SW_EE_SetBuzzerOperationMode                           ,
    SW_EE_SetRepeatTime                                    ,
    SW_EE_SetScanMode                                      ,
    SW_EE_SetTriggerType                                   ,
    SW_EE_SetQValue                                        ,
    SW_EE_SetSessionAndTarget                              ,
    SW_EE_SetRfPower                                       ,
    SW_EE_SetRfSensitivity                                 ,
    SW_EE_SetFrequencyList                                 ,
    SW_EE_SetTagPresentRepeatInterval                      ,
    SW_EE_SetTagRemoveThreshold                            ,
    SW_EE_SetInventoryRoundInterval                        ,
    SW_EE_SetSpecialSetting                                ,
    SW_EE_SetRxDecodeType                                  ,
    SW_EE_SetLinkFrequency                                 ,
    SW_EE_SetProfileID                                     ,
    SW_EE_SetDeviceID                                      ,

    SW_EE_GetBuzzerOperationMode                           ,
    SW_EE_GetRepeatTime                                    ,
    SW_EE_GetScanMode                                      ,
    SW_EE_GetTriggerType                                   ,
    SW_EE_GetQValue                                        ,
    SW_EE_GetSessionAndTarget                              ,
    SW_EE_GetRfPower                                       ,
    SW_EE_GetRfSensitivity                                 ,
    SW_EE_GetFrequencyList                                 ,
    SW_EE_GetTagPresentRepeatInterval                      ,
    SW_EE_GetTagRemoveThreshold                            ,
    SW_EE_GetInventoryRoundInterval                        ,
    SW_EE_GetSpecialSetting                                ,
    SW_EE_GetRxDecodeType                                  ,
    SW_EE_GetLinkFrequency                                 ,
    SW_EE_GetProfileID                                     ,
    SW_EE_GetDeviceID                                      ,

    SW_EE_DirectIO                                         ,
    
    SW_CC_TS100_getBleDeviceName                           ,
    SW_CC_TS100_setBleDeviceName                           ,
    SW_CC_TS100_getBleMacAddress                           ,
    SW_CC_TS100_getBleRomVersion                           ,
    SW_CC_TS100_startInventoryEx                           ,
    SW_EE_TS100_getInventoryActiveMode                     ,
    SW_EE_TS100_setInventoryActiveMode                     ,
    SW_EE_TS100_getBuzzerOperationMode                     ,
    SW_EE_TS100_setBuzzerOperationMode                     ,
    SW_EE_TS100_setFilter                                  ,
    SW_EE_TS100_getFilter                                  ,
    SW_EE_TS100_controlBuzzer                              ,
    SW_EE_TS100_getEventType                               ,
    SW_EE_TS100_setEventType                               ,
    SW_EE_TS100_setOutputInterfaces                        ,
    SW_EE_TS100_getOutputInterfaces                        ,
    SW_EE_TS100_getPostDataDelimiterAndMemoryBankSelection ,
    SW_EE_TS100_setPostDataDelimiterAndMemoryBankSelection ,
    SW_EE_TS100_getPostDataDelimiter                       ,
    SW_EE_TS100_setPostDataDelimiter                       ,
    SW_EE_TS100_getMemoryBankSelection                     ,
    SW_EE_TS100_setMemoryBankSelection                     ,
    SW_EE_TS100_setWifiSettings                            ,
    SW_EE_TS100_getWifiSettings                            ,
    SW_EE_TS100_setTagPresentedRepeatInterval              ,
    SW_EE_TS100_getTagPresentedRepeatInterval              ,
    SW_EE_TS100_getWiFiMacAddress                          ,
    SW_EE_TS100_setRemoteHost                              ,
    SW_EE_TS100_getRemoteHost                              ,
    SW_EE_TS100_writeTagEx                                 ,
    SW_EE_TS100_readTagEx                                  ,
    SW_EE_TS100_getTagMemroySelection                      ,
    SW_EE_TS100_setTagMemorySelection                      ,
    SW_EE_TS100_getBarcodeReadFormat                       ,
    SW_EE_TS100_setBarcodeReadFormat                       ,
    SW_EE_TS100_getFieldSeparator                          ,
    SW_EE_TS100_setFieldSeparator                          ,
    SW_EE_TS100_getPrefix                                  ,
    SW_EE_TS100_setPrefix                                  ,
    SW_EE_TS100_getSuffix                                  ,
    SW_EE_TS100_setSuffix                                  ,
    SW_EE_TS100_getDeactivateEpcPrefix                     ,
    SW_EE_TS100_setDeactivateEpcPrefix                     ,
    SW_EE_TS100_getReactivateEpcPrefix                     ,
    SW_EE_TS100_setReactivateEpcPrefix                     ,
    SW_EE_TS100_getTransformEpcState                       ,
    SW_EE_TS100_setTransformEpcState                       ,
    SW_EE_TS100_getTransformEpcPrefix                      ,
    SW_EE_TS100_setTransformEpcPrefix                      ,
    SW_EE_TS100_getEncodeType                              ,
    SW_EE_TS100_setEncodeType                              ,
    SW_EE_TS100_getTagProtection                           ,
    SW_EE_TS100_setTagProtection                           ,
    SW_EE_TS100_setTagProtectionAccessPassword             ,
    SW_EE_TS100_getTagProtectionAccessPassword             ,
    SW_EE_TS100_getUsbInterface                            ,
    SW_EE_TS100_setUsbInterface                            ,
    SW_EE_TS100_getOutputFormat                            ,
    SW_EE_TS100_setOutputFormat                            ,
    SW_EE_TS100_getEpcNormalize                            ,
    SW_EE_TS100_setEpcNormalize                            ,

    SW_EE_TS800_getIOState                                 ,
    SW_EE_TS800_setIOState                                 ,
    SW_EE_TS800_setOutputInterface                         ,
    SW_EE_TS800_getOutputInterface                         ,
    SW_EE_TS800_setCommandTriggerState                     ,
    SW_EE_TS800_getCommandTriggerState                     ,
    SW_EE_TS800_getIpAddress                               ,
    
    SW_CC_TS100_protectTagPrivacy                          ,
};



#endif /* GNPSwAPICode_h */
