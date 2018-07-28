//
//  ViewController.m
//  socket
//
//  Created by Patrick Laplante on 7/24/18.
//  Copyright © 2018 Patrick Laplante. All rights reserved.
//

#import "ViewController.h"
// #import <VPSocketIO/VPSocketIO.h>
@import SocketIO;

@interface ViewController ()

@end

@implementation ViewController

// VPSocketIOClient* sock;
SocketManager* manager;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.text.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.

//    NSURL* url = [[NSURL alloc] initWithString:@"http://localhost:8080"];
//    sock = [[VPSocketIOClient alloc] init:url withConfig:@{@"log": @YES}];
//    [sock on:@"connect" callback:^(NSArray *array, VPSocketAckEmitter *emitter) {
//        NSLog(@"socket connected");
//    }];
    
    
    NSURL* url = [[NSURL alloc] initWithString:@"http://192.168.29.129:8080"];
    manager = [[SocketManager alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
    SocketIOClient* socket = manager.defaultSocket;
    
    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSLog(@"socket connected");
    }];
    
//    [socket on:@"currentAmount" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        double cur = [[data objectAtIndex:0] floatValue];
//
//        [[socket emitWithAck:@"canUpdate" with:@[@(cur)]] timingOutAfter:0 callback:^(NSArray* data) {
//            [socket emit:@"update" with:@[@{@"amount": @(cur + 2.50)}]];
//        }];
//
//        [ack with:@[@"Got your currentAmount, ", @"dude"]];
//    }];
    
    [socket on:@"message" callback:^(NSArray* data, SocketAckEmitter* ack) {
        NSString * cur = [data objectAtIndex:0];
        NSLog(cur);
        [self.text setText:cur];
    }];


    [socket connect];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView {
    SocketIOClient* socket = manager.defaultSocket;
    [socket emit:@"message" with:@[@{@"text": [self.text text]}]];
}

@end


