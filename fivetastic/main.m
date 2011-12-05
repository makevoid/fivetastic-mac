//
//  main.m
//  fivetastic
//
//  Created by Francesco Canessa on 05/12/11.
//  Copyright (c) 2011 makevoid. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
  return macruby_main("rb_main.rb", argc, argv);
}
