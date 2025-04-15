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
