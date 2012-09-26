//
//  LoremIpsum.h
//
//  Created by dav on 12/24/10.
//  Modified by gopstr on 09/26/12.
//  Public domain where appropriate; free for everyone, for all usages, elsewhere.
//

#import <Foundation/Foundation.h>

@interface LoremIpsum : NSObject {
  NSArray* _words;
}

- (NSString*) words:(NSUInteger)count;
- (NSString*) title:(NSUInteger)count; //like -words: but first letter is capital
- (NSString*) sentences:(NSUInteger)count;

@end
