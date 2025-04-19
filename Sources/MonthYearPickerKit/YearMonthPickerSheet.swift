import SwiftUI

struct YearMonthPickerSheet: View {
    let currentYear: Int
    let currentMonth: Int
    let yearRange: ClosedRange<Int>
    let onConfirm: (_ year: Int, _ month: Int) -> Void
    let onChange: (_ year: Int, _ month: Int) -> Void

    @State private var tempYear: Int
    @State private var tempMonth: Int

    private let months = Array(1...12)

    init(
        currentYear: Int,
        currentMonth: Int,
        yearRange: ClosedRange<Int> = 2000...2100,
        onConfirm: @escaping (_ year: Int, _ month: Int) -> Void,
        onChange: @escaping (_ year: Int, _ month: Int) -> Void
    ) {
        self.currentYear = currentYear
        self.currentMonth = currentMonth
        self.yearRange = yearRange
        self.onConfirm = onConfirm
        self.onChange = onChange
        _tempYear = State(initialValue: currentYear)
        _tempMonth = State(initialValue: currentMonth)
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("选择年月")
                    .font(.headline)
                    .padding(.leading, 8)

                Spacer()

                Button(action: {
                    onConfirm(tempYear, tempMonth)
                }) {
                    Text("保存")
                        .labelStyle(.titleAndIcon)
                }
            }
            .padding(.top, 16)
            .padding(.horizontal)

            HStack(spacing: 16) {
                Picker("", selection: Binding(
                    get: { tempYear },
                    set: { newValue in
                        tempYear = newValue
                        onChange(newValue, tempMonth)
                    }
                )) {
                    ForEach(yearRange, id: \.self) { year in
                        Text(String(format: "%d", year)).tag(year)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 140)

                Picker("", selection: Binding(
                    get: { tempMonth },
                    set: { newValue in
                        tempMonth = newValue
                        onChange(tempYear, newValue)
                    }
                )) {
                    ForEach(months, id: \.self) { month in
                        Text(String(format: "%02d", month)).tag(month)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 140)
            }
            .frame(height: 180)
        }
        .presentationDetents([.height(250)])
        .presentationCornerRadius(30)
    }
}
