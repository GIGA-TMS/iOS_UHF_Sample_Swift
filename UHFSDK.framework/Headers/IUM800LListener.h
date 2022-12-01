//
//  IUM800LListener.h
//  UHFSDK
//
//  Created by Gianni on 2019/3/21.
//  Copyright © 2019 Gianni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GNPTagInfo.h"
#import "GNPDecodedTagData.h"

#import "GNPSwAPICode.h"
#import "InetSocketAddress.h"
NS_ASSUME_NONNULL_BEGIN

@protocol IUM800LListener <NSObject>

@optional
-(void)UM800LdidGeneralSuccess:(SoftwareAPINameCode)apiCode;
-(void)UM800LdidGeneralERROR:(SoftwareAPINameCode)apiCode ErrMessage:(NSString*)strErrorMessage;
-(void)UM800LdidQueryFirmwareVersion:(NSString*)fwVer;
-(void)UM800LdidSelectActiveMode:(int)activeMode;
-(void)UM800LdidSelectActiveModeEventType:(int)eventType;
-(void)UM800LdidWriteSetting:(SoftwareAPINameCode)apiCode Addr:(short)settingAddr Value:(int)settingValue;
-(void)UM800LdidWriteSetting:(SoftwareAPINameCode)apiCode Addr:(int)settingAddr Values:(NSData*)settingValues;
-(void)UM800LdidReadSetting:(SoftwareAPINameCode)apiCode Addr:(int)settingAddr Value:(int)settingValue DataSet:(NSMutableSet *) dataSet;
-(void)UM800LdidReadSetting:(SoftwareAPINameCode)apiCode Addr:(int)settingAddr Values:(NSData*)settingValues;
-(void)UM800LdidDeviceControl:(int)ctrlCode Value:(int)ctrlValue;

-(void)UM800LdidReadMemBank:(NSData*)readData;

-(void)UM800LonEvent43TagCountChanged;
-(void)UM800LonEvent44InputGPIOStateChanged;
-(void)UM800LonEvent49TagPresented:(GNPTagInfo*)taginfo;
-(void)UM800LonEvent52TagRemoved:(GNPTagInfo*)taginfo;
-(void)UM800LonEvent53SensorStateChanged;
-(void)UM800LonEvent62NewTagEx:(GNPDecodedTagData*)taginfo;

-(void)UM800LdidGetWiFiMacAddress:(NSString*)wifiMacAddress;
-(void)UM800LdidGetRemoteHost:(int) connectTimeout InetSocketAddress:(InetSocketAddress *) inetSocketAddress;
-(void)UM800LdidGetTagProtectionAccessPassword:(NSString *) accessPassword;
-(void)UM800LdidGetDeviceControl:(SoftwareAPINameCode)apiCode Data:(NSData *) data;

-(void)UM800LdidReadTagEx:(NSData*)readData;

-(void)UM800LdidGetIpAddress:(NSString*)ipAddress;
-(void)UM800LdidGetBleMacAddress:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
