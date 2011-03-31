//
//  Calculator.h
//  Gasosa
//
//  Created by Dener Wilian Pereira do Carmo on 18/03/11.
//  Copyright 2011 Agence. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
  GASOLINE,ETHANOL
  
}Fuel;
extern int const FACTOR;
@interface Calculator : NSObject {
  
}
-(Fuel)calculate:(double)gasolinePrice:(double)ethanolPrice;

@end
  