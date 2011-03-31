//
//  GasosaViewController.h
//  Gasosa
//
//  Created by Dener Wilian Pereira do Carmo on 28/03/11.
//  Copyright 2011 Agence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

#define kGasolineComponent 0
#define kEthanolComponent 1


@interface GasosaViewController : UIViewController {
  IBOutlet UIPickerView *mpicker;
  NSMutableArray *ethanolValues;
  NSMutableArray *gasolineValues;
}

@property(nonatomic,retain) NSMutableArray *ethanolValues;
@property(nonatomic,retain) NSMutableArray *gasolineValues;

-(IBAction)calculate:(id)sender;
-(NSMutableArray*)getArrayOfValues;

@end

