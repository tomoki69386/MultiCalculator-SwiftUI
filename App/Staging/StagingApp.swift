//
//  StagingApp.swift
//  Staging
//
//  Created by 築山朋紀 on 2021/06/12.
//

import CalculatorFeature
import SwiftUI

@main
struct StagingApp: App {
  var body: some Scene {
    WindowGroup {
      CalculatorView(
        store: .init(
          initialState: .init(),
          reducer: calculatorReducer,
          environment: .init()
        )
      )
    }
  }
}