import SwiftUI

struct MonthYearPicker_Previews: PreviewProvider {
    static var previews: some View {
        MonthYearPicker(yearRange: 2020...2030) { year, month in
            print("✅ \(year)-\(month)")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}




// Helper to support @Binding in preview
struct StatefulPreviewWrapper<T1, T2, Content: View>: View {
    @State private var value1: T1
    @State private var value2: T2
    var content: (_ binding1: Binding<T1>, _ binding2: Binding<T2>) -> Content

    init(
        _ initialValue: (T1, T2),
        content: @escaping (_ binding1: Binding<T1>, _ binding2: Binding<T2>) -> Content
    ) {
        self._value1 = State(initialValue: initialValue.0)
        self._value2 = State(initialValue: initialValue.1)
        self.content = content
    }

    var body: some View {
        content($value1, $value2)
    }
}
