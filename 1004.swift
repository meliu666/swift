import SwiftUI
import SwiftData

@main
struct KKKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}

@Model
class Friend {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newPhoneNumber = ""
    
    var body: some View {
        List {
            ForEach(friends) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.phoneNumber)
                }
            }
            .onDelete(perform: deleteFriend) // 滑动删除
        }
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 8) {
                HStack {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Phone Number", text: $newPhoneNumber)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button("Save") {
                    guard !newName.isEmpty, !newPhoneNumber.isEmpty else { return }
                    let newFriend = Friend(name: newName, phoneNumber: newPhoneNumber)
                    context.insert(newFriend)
                    newName = ""
                    newPhoneNumber = ""
                }
                .bold()
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(.thinMaterial)
        }
    }
    
    // 删除功能
    private func deleteFriend(at offsets: IndexSet) {
        for index in offsets {
            context.delete(friends[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}


好，我帮你逐行、逐关键字把这段 Swift + SwiftUI + SwiftData 代码的每个单词和符号都用中文解释清楚，方便你完全理解。

⸻

第一部分：导入模块

import SwiftUI
import SwiftData

	•	import → 导入（引入一个模块/库）
	•	SwiftUI → 苹果的声明式 UI 框架，用来写界面
	•	SwiftData → 苹果的持久化框架（类似 Core Data），用来存储和查询数据

⸻

第二部分：程序入口

@main
struct KKKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}

	•	@main → 程序入口标记，告诉 Swift 从这里启动
	•	struct → 结构体关键字
	•	KKKApp → 应用的名字（类型名）
	•	: → 表示继承/遵循协议，这里是遵循 App 协议
	•	App → SwiftUI 应用协议
	•	var → 变量声明
	•	body → SwiftUI 的必需属性，描述界面结构
	•	some Scene → 返回一个场景（Scene 是 SwiftUI 的界面容器）
	•	WindowGroup → 窗口组，iOS 中就是主界面窗口
	•	ContentView() → 创建一个 ContentView 视图
	•	.modelContainer(for: Friend.self) → 绑定 SwiftData 的数据容器，管理 Friend 模型的存储

⸻

第三部分：数据模型

@Model
class Friend {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

	•	@Model → SwiftData 的数据模型标记
	•	class → 类关键字
	•	Friend → 类名（好友）
	•	var name: String → name 是一个字符串变量
	•	var phoneNumber: String → phoneNumber 是一个字符串变量
	•	init(…) → 构造函数，初始化对象
	•	self.name = name → 把传进来的参数 name 赋值给对象的属性 name
	•	self.phoneNumber = phoneNumber → 同理，赋值电话号属性

⸻

第四部分：主界面

struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newPhoneNumber = ""

	•	struct ContentView → 定义一个结构体 ContentView
	•	: View → 遵循 SwiftUI 的 View 协议
	•	@Query → SwiftData 查询属性包装器，自动获取数据库数据
	•	private → 访问权限修饰符，仅本文件可用
	•	var friends: [Friend] → friends 是 Friend 数组
	•	@Environment(.modelContext) → 从环境中获取 SwiftData 的数据库上下文
	•	context → 数据库上下文对象，用来插入、删除数据
	•	@State → SwiftUI 状态变量，UI 会自动刷新
	•	newName = “” → 新名字的初始值为空字符串
	•	newPhoneNumber = “” → 新电话的初始值为空字符串

⸻

第五部分：列表显示

List {
    ForEach(friends) { friend in
        HStack {
            Text(friend.name)
            Spacer()
            Text(friend.phoneNumber)
        }
    }
    .onDelete(perform: deleteFriend) // 滑动删除
}

	•	List { … } → 列表视图
	•	ForEach(friends) → 遍历 friends 数组
	•	{ friend in … } → 闭包，friend 是当前循环元素
	•	HStack → 水平排列容器
	•	Text(friend.name) → 显示名字
	•	Spacer() → 占位空白，把后面的内容推到右边
	•	Text(friend.phoneNumber) → 显示电话号码
	•	.onDelete(perform: deleteFriend) → 滑动删除时执行 deleteFriend 方法

⸻

第六部分：底部输入区域

.safeAreaInset(edge: .bottom) {
    VStack(spacing: 8) {
        HStack {
            TextField("Name", text: $newName)
                .textFieldStyle(.roundedBorder)
            TextField("Phone Number", text: $newPhoneNumber)
                .textFieldStyle(.roundedBorder)
        }
        
        Button("Save") {
            guard !newName.isEmpty, !newPhoneNumber.isEmpty else { return }
            let newFriend = Friend(name: newName, phoneNumber: newPhoneNumber)
            context.insert(newFriend)
            newName = ""
            newPhoneNumber = ""
        }
        .bold()
        .buttonStyle(.borderedProminent)
    }
    .padding()
    .background(.thinMaterial)
}

	•	.safeAreaInset(edge: .bottom) → 在底部安全区域添加自定义内容
	•	VStack(spacing: 8) → 垂直排列，间距 8
	•	HStack → 水平排列
	•	TextField(“Name”, text: $newName) → 输入名字，绑定到 newName
	•	.textFieldStyle(.roundedBorder) → 圆角边框样式
	•	TextField(“Phone Number”, text: $newPhoneNumber) → 输入电话号
	•	Button(“Save”) { … } → 保存按钮
	•	guard !newName.isEmpty, !newPhoneNumber.isEmpty else { return } → 如果有空字段就不保存
	•	let newFriend = Friend(…) → 创建新好友对象
	•	context.insert(newFriend) → 插入到数据库
	•	newName = “” / newPhoneNumber = “” → 清空输入框
	•	.bold() → 按钮文字加粗
	•	.buttonStyle(.borderedProminent) → 蓝色主按钮样式
	•	.padding() → 内边距
	•	.background(.thinMaterial) → 半透明毛玻璃背景

⸻

第七部分：删除方法

private func deleteFriend(at offsets: IndexSet) {
    for index in offsets {
        context.delete(friends[index])
    }
}

	•	private func → 私有函数
	•	deleteFriend → 方法名
	•	(at offsets: IndexSet) → 参数 offsets 是被删除的行索引集合
	•	for index in offsets → 遍历所有删除的索引
	•	context.delete(friends[index]) → 删除对应的好友

⸻

第八部分：预览

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}

	•	#Preview → SwiftUI 预览标记
	•	ContentView() → 创建主界面
	•	.modelContainer(for: Friend.self, inMemory: true) → 用内存模式创建数据容器（不保存到磁盘，方便调试）

⸻
