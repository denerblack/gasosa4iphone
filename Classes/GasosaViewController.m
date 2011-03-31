//
//  GasosaViewController.m
//  Gasosa
//
//  Created by Dener Wilian Pereira do Carmo on 28/03/11.
//  Copyright 2011 Agence. All rights reserved.
//

#import "GasosaViewController.h"

@implementation GasosaViewController

@synthesize ethanolValues,gasolineValues;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.ethanolValues = [self getArrayOfValues];
    [ethanolValues release];
    self.gasolineValues = [self getArrayOfValues];  
    [gasolineValues release];  
}

-(NSMutableArray*)getArrayOfValues {
  float numInit = 0.0;
  NSMutableArray *new = [[NSMutableArray alloc] init];
  NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
  formatter.positiveFormat = @"0.00";
  
  for ( int i = 100; i < 400; i ++) {
    numInit = i/100.0f; 
    [new addObject: [formatter stringFromNumber:[NSNumber numberWithFloat:numInit]]];
  }
  return new;
}

-(IBAction)calculate:(id)sender {
  NSInteger gasolineRow = [mpicker selectedRowInComponent:kGasolineComponent];
  NSInteger ethanolRow = [mpicker selectedRowInComponent:kEthanolComponent];
  NSString *gasolinePrice = [self.gasolineValues objectAtIndex:gasolineRow];
  NSString *ethanolPrice =  [self.ethanolValues objectAtIndex:ethanolRow];
  
  Calculator *calculator = [[Calculator alloc] init];
  Fuel fuel = [calculator calculate:[gasolinePrice doubleValue] : [ethanolPrice doubleValue]];
  NSString *fuelType;
  switch (fuel) {
    case GASOLINE:
      fuelType = @"Gasolina";
      break;
    case ETHANOL:
      fuelType = @"Etanol";
      break;
    default:
      break;
  }
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Vale a pena usar:" message:fuelType delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  
  [alert show];
  
  [alert release]; 
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
  [mpicker release];  
  [ethanolValues release];  
  [gasolineValues release];  
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {  
  return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {  
  if (component == kEthanolComponent)
    return [self.ethanolValues count];
  return [self.gasolineValues count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  
  if (component == kEthanolComponent)    
    return [self.ethanolValues objectAtIndex:row];
  return [self.gasolineValues objectAtIndex:row];  
}

@end
