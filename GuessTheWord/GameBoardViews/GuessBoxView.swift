/// Copyright (c) 2022 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct GuessBoxView: View {
  var letter: GuessedLetter
  var size: Double
  var index: Int
  var body: some View {
    Text(letter.letter)
      .rotation3DEffect(
        .degrees(letter.status == .unknown ? 0 : -180),
        axis: (x: 0.0, y: 1.0, z: 0.0)
      )
      .font(.title)
      .foregroundColor(Color(UIColor.systemBackground))
      .frame(width: size, height: size)
      .background(letter.statusColor)
      .cornerRadius(size / 5.0)
      
      .rotation3DEffect(
      
        .degrees(letter.status == .unknown ? 0 : 180),
        axis: (x: 0.0, y: 1.0, z: 0.0)
      )
      
      .animation(
        .linear(duration: 1.0).delay(0.1 * Double(index)),
        value: letter.status
      )
  }
}

struct GuessBoxView_Previews: PreviewProvider {
  static var previews: some View {
    let guess = GuessedLetter(letter: "S", status: .inPosition)
    GuessBoxView(letter: guess, size: 50, index: 1)
  }
}
