//
//  ContentView.swift
//  Calculator
//
//  Created by Sahil on 22/01/23.
//

import SwiftUI
enum CalculatorModes{
    case notset
    case multiplication
    case addition
    case substraction
}
struct ContentView: View {
    @State var Current_Value = "0"
    @State var CurrentMode : CalculatorModes = .notset
    @State var lastButtonWasMode = false
    @State var savedNum = 0  // this will save the no that we type before mode
    @State var currentIntNum = 0
    var num: String = "1"
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                totalview(viewfinder: Current_Value)
                HStack {
                    buttons(value: "1",action: NumPress)
                    buttons(value: "2",action: NumPress)
                    buttons(value: "3",action: NumPress)
                    buttons(value: "+",color: .orange,action: ModePress,mode: .addition)
                }
                HStack {
                    buttons(value: "4",action: NumPress)
                    buttons(value: "5",action: NumPress)
                    buttons(value: "6",action: NumPress)
                    buttons(value: "-",color: .orange,action: ModePress,mode: .substraction)
                }
                HStack {
                    buttons(value: "7",action: NumPress)
                    buttons(value: "8",action: NumPress)
                    buttons(value: "9",action: NumPress)
                    buttons(value: "x",color: .orange,action: ModePress,mode: .multiplication)
                }
                HStack {
                    buttons(value: "0",align: .leading,width: 188,lead : 30,action: NumPress)
                    buttons(value: "C",color: .gray,action: ClearPress)
                    buttons(value: "=",color: .orange,action: EqualPress)
                }
            }
        }
        .ignoresSafeArea()
        }
        func NumPress(button : buttons) {
            if lastButtonWasMode{
                lastButtonWasMode = false
                currentIntNum = 0
            }
            if let parsedValue=Int("\(currentIntNum)"+button.value){
                 currentIntNum=parsedValue
                 updateText()
            }
            else
            {
                Current_Value="Error"
            }
        }
        func ModePress(button : buttons) {
            CurrentMode=button.mode
            lastButtonWasMode = true
        }
        func EqualPress(button : buttons) {
            if lastButtonWasMode == true || CurrentMode == .notset {
                return
            }
            
            if CurrentMode == .addition{
                savedNum+=currentIntNum
            } else if CurrentMode == .substraction{
                savedNum-=currentIntNum
            }else if CurrentMode == .multiplication{
                savedNum*=currentIntNum
            }
            currentIntNum = savedNum
            updateText()
            
        }
        func ClearPress(button : buttons) {
            currentIntNum = 0
            savedNum = 0
            CurrentMode = .notset
            updateText()
            lastButtonWasMode=false
        }
        func updateText(){
            if CurrentMode == .notset{
                savedNum = currentIntNum
            }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let num = NSNumber(value: currentIntNum)
            Current_Value = numberFormatter.string(from: num) ?? "Error"
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
