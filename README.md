# MonthYearPickerKit
轻量级 SwiftUI 月份选择器组件包，适用于记账、报表、计划类应用中的年月筛选。

## ✨ 特性亮点

- 🧭 支持年/月切换，默认当前年月
- 🧩 可嵌入任何视图中使用，适配所有尺寸
- 🧑‍💻 简洁 API，适合 SwiftUI + MVVM 架构
- 🎯 支持外部传入 `DatePeriod`，封装良好，易于复用

## 🚀 使用方法
```swift
import SwiftUI
import MonthYearPickerKit

struct MonthYearPickerDemo: View {

    var body: some View {
        MonthYearPicker(
            yearRange: 2020...2030
        )
    }
}

#Preview {
    MonthYearPickerDemo()
}
```
