//
//  Calculator.m
//  Gasosa
//
//  Created by Dener Wilian Pereira do Carmo on 18/03/11.
//  Copyright 2011 Agence. All rights reserved.
//

#import "Calculator.h"


int const FACTOR = 70;

@implementation Calculator
-(Fuel)calculate:(double)gasolinePrice:(double)ethanolPrice
{
  double finalValue = gasolinePrice / 100 * FACTOR;
  
  if (finalValue <= ethanolPrice) {
    return GASOLINE;
  } else {
    return ETHANOL;
  }      
}
@end
