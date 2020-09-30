//
//  OpenExternalPlugIn.h
//  OpenExternal
//
//  Created by denn nevera on 19/09/2020.
//  Copyright © 2020 Dehancer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FxPlug/FxPlugSDK.h>

@interface FxPlugHanging : NSObject <FxTileableEffect>
@property (assign) id<PROAPIAccessing> apiManager;
@end
