import SwiftUI

public struct MonthYearPicker: View {
    @State private var year: Int
    @State private var month: Int
    public var yearRange: ClosedRange<Int>
    @State private var isPresented = false
    public var onChange: ((Int, Int) -> Void)? = nil

    public init(
        yearRange: ClosedRange<Int> = 2000...2100,
        onChange: ((Int, Int) -> Void)? = nil
    ) {
        let now = Date()
        self._year = State(initialValue: Calendar.current.component(.year, from: now))
        self._month = State(initialValue: Calendar.current.component(.month, from: now))
        self.yearRange = yearRange
        self.onChange = onChange
    }

    public var body: some View {
        Button {
            isPresented = true
        } label: {
            Text(String(format: "%d年 %d月", year, month))
                .font(.title3)
                .fontWeight(.medium)
        }
        .sheet(isPresented: $isPresented) {
            YearMonthPickerSheet(
                currentYear: year,
                currentMonth: month,
                yearRange: yearRange,
                onConfirm: { newYear, newMonth in
                    year = newYear
                    month = newMonth
                    isPresented = false
                },
                onChange: { newYear, newMonth in
                    year = newYear
                    month = newMonth
                    onChange?(newYear, newMonth)
                }
            )
        }
    }
}
