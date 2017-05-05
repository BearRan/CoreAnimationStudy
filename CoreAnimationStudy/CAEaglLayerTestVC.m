//
//  CAEaglLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/5.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CAEaglLayerTestVC.h"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

@interface CAEaglLayerTestVC ()

@property (strong, nonatomic) UIView *glView;
@property (strong, nonatomic) EAGLContext *glContext;
@property (strong, nonatomic) CAEAGLLayer *glLayer;
@property (assign, nonatomic) GLuint framebuffer;
@property (assign, nonatomic) GLuint colorRenderbuffer;
@property (assign, nonatomic) GLint framebufferWidth;
@property (assign, nonatomic) GLint framebufferHeight;
@property (assign, nonatomic) GLKBaseEffect *effect;

@end

@implementation CAEaglLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpBuffers
{
    //set up buffer
    glGenFramebuffers(1, &_framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
    
    //set up color render buffer
    glGenRenderbuffers(1, &_colorRenderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderbuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
                              GL_RENDERBUFFER, _colorRenderbuffer);
    [self.glContext renderbufferStorage:GL_RENDERBUFFER
                           fromDrawable:self.glLayer];
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH,
                                 &_framebufferWidth);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT,
                                 &_framebufferHeight);
    
    //check success
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        NSLog(@"Failed to make complete framebuffer object:%i",glCheckFramebufferStatus(GL_FRAMEBUFFER));
    }
}

@end
