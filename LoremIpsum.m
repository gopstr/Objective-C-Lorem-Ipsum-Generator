//
//  LoremIpsum.m
//
//  Created by dav on 12/24/10.
//  Modified by gopstr on 09/26/12.
//  Public domain where appropriate; free for everyone, for all usages, elsewhere.
//

#import "LoremIpsum.h"

@interface LoremIpsum ()
- (NSString*) randomWord;
- (NSString*) capitalizeFirstLetterIn:(NSString*)text;
@end

@implementation LoremIpsum

- (id) init {
  if ((self = [super init]))  {
      NSString *wordsList = @"a ac accumsan ad adipiscing aenean aliquam aliquet amet ante aptent arcu at auctor augue bibendum blandit class commodo condimentum congue consectetuer consequat conubia convallis cras cubilia cum curabitur curae; cursus dapibus diam dictum dictumst dignissim dis dolor donec dui duis egestas eget eleifend elementum elit enim erat eros est et etiam eu facilisis fames faucibus felis fermentum feugiat fusce gravida habitant habitasse hac hendrerit hymenaeos iaculis id imperdiet in inceptos integer interdum ipsum justo lacinia lacus laoreet lectus leo libero ligula litora lobortis lorem luctus magna magnis malesuada massa mattis mauris metus mi molestie mollis montes morbi mus nam nascetur natoque nec neque netus nibh nisi nisl non nonummy nostra nulla nullam nunc odio orci ornare parturient pede pellentesque penatibus per pharetra phasellus placerat platea porta porttitor posuere potenti praesent pretium primis proin pulvinar purus quam quis quisque rhoncus ridiculus risus rutrum sagittis sapien scelerisque sed sem semper senectus sit sociis sociosqu sodales sollicitudin suscipit suspendisse taciti tellus tempor tempus tincidunt torquent tortor tristique turpis ullamcorper ultrices ultricies urna ut varius vehicula vel velit venenatis vestibulum vitae vivamus viverra volutpat vulputate";
      
      _words = [wordsList componentsSeparatedByString:@" "];
  }
  return self;
}

- (void) dealloc {
}

#pragma mark -

- (NSString*) randomWord {
  int randomIndex = random() % [_words count];
  return [_words objectAtIndex:randomIndex];
}

- (NSString*) capitalizeFirstLetterIn:(NSString*)text {
    NSMutableString *_text = [text mutableCopy];
    NSString *firstChar = [_text substringWithRange:NSMakeRange(0, 1)];
    firstChar = [firstChar uppercaseString];
    [_text replaceCharactersInRange:NSMakeRange(0, 1) withString:firstChar];

    return _text;
}

#pragma mark -

- (NSString*) words:(NSUInteger)count {
  if (count == 0) return @"";
  
  NSString* collectedWords = [self randomWord];
  for (NSUInteger i = 0; i < count; i++) {
    collectedWords = [collectedWords stringByAppendingString:@" "];
    collectedWords = [collectedWords stringByAppendingString:[self randomWord]];
  }
  
  return collectedWords;
}

- (NSString*) sentences:(NSUInteger)count {
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < count; i++) {
        long numberOfWords = random() % 10 + 10; //range from 10-20 words

        NSString *sentence = [self capitalizeFirstLetterIn:[self words:numberOfWords]];
        [result appendString:sentence];
        
        if (i + 1 == count) { //last sentence
            [result appendString:@"."];
        } else {            
            [result appendString:@". "];
        }
    }
    return  result;
}

@end
