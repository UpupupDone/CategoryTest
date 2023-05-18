//
//  ViewController.m
//  Test
//
//  Created by ME7O on 5/17/23.
//

#import "ViewController.h"
#import "ObjcExecManager.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"loadLevelMap === %@", [[ObjcExecManager sharedManager] loadLevelMap]);
    
    
    Person *person = [Person new];
    [person desc];
    
    Student *stu = [Student new];
    [stu desc];
    
    [[ObjcExecManager sharedManager] execCategoryClass:@"Person+C.m" sel:@"desc"];
    [[ObjcExecManager sharedManager] execCategoryClass:@"Student+B.m" sel:@"desc"];
}

@end
