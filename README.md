# JXBaseProject
基础工程

## pod init
- Masonry

## 删除相关storyBoard文件
### Main.storyBoard 
- 删除info.plist文件中 Main storyboard file base name项
- 在Appdelegate didFinishLaunchingWithOptions中添加
```
application.delegate.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
application.delegate.window.backgroundColor = [UIColor whiteColor];
[application.delegate.window makeKeyAndVisible];
```

### launch.stroyBoard

## 关联Prefix.pch文件和工程
- Build Setting 
- 搜索Prefix Header
- 把刚创建的PrefixHeader.pch文件拖拽进输入框
- 更改相对路径
```
/Users/xxx/Desktop/JXBaseProject/JXBaseProject/BaseClass/JX Support Files/Prefix.pch
改为
$(SRCROOT)//JXBaseProject/BaseClass/JX Support Files/Prefix.pch
```

## 添加JXBaseClass
