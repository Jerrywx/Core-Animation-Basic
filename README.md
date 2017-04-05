# Core-Animation-Basic

### About Core Animation


### 概述


#### 1、Core Animation 管理着App的内容

Core Animation 本身并不是一个绘制系统。它是用于在硬件中合成和操纵您的应用程序内容的基础设施。

#### 2、CALayer 触发动画
你使用Core Animation 创建的大多数动画需要修改 CALayer 的属性。像 view 一样 CALayer 有 bounds、position、opacity、transform 和其他许多可修改的属性。 

> Relevant Chapters: [Animating Layer Content](), [Advanced Animation Tricks](), [Layer Style Property Animations](), [Animatable Properties]()


#### 3、CALayer 的层次管理结构
CALayer 可以在视图层次结构中管理, 与其他 CALayer 创建父子关系。
> Relevant Chapters: [Building a Layer Hierarchy](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/BuildingaLayerHierarchy/BuildingaLayerHierarchy.html#//apple_ref/doc/uid/TP40004514-CH6-SW2)


#### 4、修改 CALayer 的默认行为

>Relevant Chapters: [Changing a Layer’s Default Behavior](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/ReactingtoLayerChanges/ReactingtoLayerChanges.html#//apple_ref/doc/uid/TP40004514-CH7-SW1)


