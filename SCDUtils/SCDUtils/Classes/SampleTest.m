//
//  SampleTest.m
//

#import "TestBase.h"

@interface DiscoveryTests : TestBase

@end

@implementation DiscoveryTests {
    
    NSURL *_library;
}

-(BOOL)requireFilesystem {
    
    // Enable filesystem support. If enabled, a new temporary directory is
    // created prior and deleted after each individual test.
    return YES;
}

-(void)setUp {
    
    // This one is important! Call before your setup code.
    [super setUp];
    
    // Now, setup a filesystem structure for the tests...
    
    // Create some directories...
    _library = [self createDirectory:@"JDocLibrary"];
    NSURL *awmDocuments = [self createDirectory:@"AWM" insideDirectory:_library];
    NSURL *companyDocuments = [self createDirectory:@"Company" insideDirectory:_library];
    NSURL *flightDocuments = [self createDirectory:@"Flight" insideDirectory:_library];
    NSURL *operatorDocuments = [self createDirectory:@"Operator" insideDirectory:_library];

    // Copy some test resources...
    [self copyResource:@"eawm_general" toDirectory:awmDocuments];
    [self copyResource:@"jep-afom" toDirectory:operatorDocuments];
    
    // Create temporary files...
    [self createFile:@"test.txt" withContent:nil insideDirectory:companyDocuments];
}

- (void)test {
    
    // Test code
}

@end
