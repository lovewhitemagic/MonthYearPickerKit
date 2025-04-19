import SwiftUI
import MonthYearPickerKit

struct MonthYearPickerDemo: View {
    @State private var selectedYear: Int = Calendar.current.component(.year, from: Date())
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date())

    var body: some View {
        VStack(spacing: 20) {
            MonthYearPicker(
                yearRange: 2020...2030,
                onChange: { year, month in
                    selectedYear = year
                    selectedMonth = month
                }
            )
            
            Text("Selected: \(selectedYear)年 \(selectedMonth)月")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    MonthYearPickerDemo()
}
