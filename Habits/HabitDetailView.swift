import SwiftUI

struct HabitDetailView: View {
    @State private var updateHabit: Habit = Habit()
    @State private var isPresentingEditView = false
    
    @Binding var habit: Habit
    
    var body: some View {
        List {
            Section(header: Text("Overview")) {
                HStack {
                    Label("Score", systemImage: "gamecontroller")
                    Spacer()
                    Text("???")
                        .padding(4)
                        .cornerRadius(4)
                }
                .foregroundColor(habit.uiColor)
                HStack {
                    Label("Month", systemImage: "goforward.30")
                    Spacer()
                    Text("???")
                        .padding(4)
                        .cornerRadius(4)
                }
                .foregroundColor(habit.uiColor)
                HStack {
                    Label("Year", systemImage: "calendar")
                    Spacer()
                    Text("???")
                        .padding(4)
                        .cornerRadius(4)
                }
                .foregroundColor(habit.uiColor)
                HStack {
                    Label("Total", systemImage: "a.circle")
                    Spacer()
                    Text("???")
                        .padding(4)
                        .cornerRadius(4)
                }
                .foregroundColor(habit.uiColor)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("X")
                        .padding(4)
                        .cornerRadius(4)
                }
                .foregroundColor(.accentColor)
            }
            Section(header: Text("Score")) {
            }
            Section(header: Text("History")) {
            }
            Section(header: Text("Calendar")) {
            }
        }
        .navigationTitle(habit.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                updateHabit = habit
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                HabitEditView(habit: $updateHabit)
                    .navigationTitle(habit.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                habit.update(from: updateHabit)
                            }
                        }
                    }
            }
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitDetailView(habit: .constant(Habit.sampleData[0]))
        }
    }
}
