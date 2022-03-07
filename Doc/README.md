## 效果

![[022-03-07_22818413922914113612.11.34.gif]]
## 目标
* 实现平滑圆角背景
* 给视图增加阴影
* 自定义ViewModifier+View extension让卡片样式可重用
* 实现压下缩小抬起恢复效果
## 代码
## 正文
### 实现今日推荐App布局
```swift
 VStack(alignment: .leading) {

	 Image("img_app_bg")
	
		 .resizable()
		
		 .aspectRatio(contentMode: .fill)
		
		 .frame(height: 200)
		
		 .clipped()
	
	 Text("Craft-文件及笔记编辑器")
	
		 .font(.title)
		
		 .fontWeight(.bold)
		
		 .foregroundColor(Color.primary)
		
		 .padding(.horizontal, 20)
	
	 Spacer().frame(height: 10)

	
	 Text("编辑文件和想法")
	
		 .font(.callout)
		
		 .foregroundColor(Color.secondary)
		
		 .padding(.horizontal, 20)
		
		 .padding(.bottom, 20)
 }
```
### 实现卡片效果
#### 实现圆角的四种方式
1. 用白色圆角图形作为背景
```Swift
.background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
```
2. 设置白色背景，剪切图形成圆角```
```swift
.background(Color.white)
.cornerRadius(20)
```
3. 使用蒙板实现圆角效果
```swift
.background(Color.white)
.mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
```
4. 设置白色背景，使用clipShape剪切图形成圆角
```Swift
.background(Color.white)
.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
```
##### 平滑圆角的奥秘
RoundedRectangle(cornerRadius: 20, style: **.continuous**)
使用continuous样式可以是的矩形圆角的过渡更加平滑让UI更有Apple的味道。
#### 实现阴影效果
```swift
.shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
```
#### 最终代码
```swift
VStack(alignment: .leading) {
	...
	...
}
.background(Color.white)
.mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
.shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
```
### 封装可重用样式
#### ViewModifier
```swift
struct CardStyle: ViewModifier {

	func body(content: Content) -> some View {
	
		content
			.background(Color.white)
			.mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
			.shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
	
	}

}
```
#### View extension
```swift
extension View {

	func cardStyle() -> some View {
	
		modifier(CardStyle())
	
	}

}
```

现在我们可以将之前设置卡片样式的代码调整为
```swift
VStack(alignment: .leading) {
	...
	...
}
.cardStyle()
```

### 给卡片增加压下变小抬起恢复效果
1. 增加缩放效果
```Swift
.scaleEffect(isPressed ? 0.9 : 1.0)
.animation(.spring(), value: isPressed ? 0.9 : 1.0)
```
2. 监听视图压下事件
恰好ButtonStyle中的Configuration中包含了isPressed的状态参数，我们将卡片视图用Button进行包裹最终代码如下:
```swift
struct CardButtonStyle: ButtonStyle {

	func makeBody(configuration: Self.Configuration) -> some View {

		configuration.label
			.cardStyle()
			.scaleEffect(configuration.isPressed ? 0.9 : 1.0)
			.animation(.spring(), value: configuration.isPressed ? 0.9 : 1.0)

	}
}


struct AppCardView: View {

	var body: some View {
	
		Button(action: {
			 print("on tapped!")
		}) {
			
			VStack(alignment: .leading) {
				...
				...
			}
		}
		.buttonStyle(CardButtonStyle())
	
	}

}
```

## 尾巴
1. 写UI代码需要了解一些设计的知识，比如蒙板效果、阴影效果各个属性的含义等这样才能写出高质量符合设计效果的UI。
2. 可复用的样式一定要抽象出来不要写重复代码这样既不优雅也不利于维护
