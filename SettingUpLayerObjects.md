## Setting Up Layer Objects

## 为图层提供内容

有三种方式为Layer 提供显示内容:
* 直接为 layer的 contents 属性设置一个 CGimage 对象。(这种方式适用于layer 的内容不会或者很少改变的情况)
* 为layer 分配一个delegate对象，让delegate绘制layer的内容。(此技术最适合可能周期性更改并可由外部对象（如视图）提供的图层内容。)
* 自定义一个layer 子类，重写子类提供的绘制方法。(这种方式适用于你需要自定义一个layer或者你需要改变layer的基本绘制行为。)


#### 1、使用图片作为layer 的显示内容

#### 2、使用delegate为layer提供显示内容

#### 3、通过子类提供图层内容


