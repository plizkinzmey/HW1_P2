//
//  ViewController.swift
//  HW1_P2
//
//  Created by Aleksandr Babkin on 06.06.2022.
//

import UIKit

//6. Создайте протоколы для:
//
//     a) Игры в шахматы против компьютера:

// 1) протокол-делегат с функцией, через которую шахматный движок будет сообщать о ходе компьютера (с какой на какую клетку)

protocol ComputerMoveDelegate {
    func computerMadeMove (oldPosition: String, newPosition: String)
}

//2) протокол для шахматного движка, в который передаётся ход фигуры игрока (с какой на какую клетку); Double-свойство, возвращающее текущую оценку позиции (без возможности изменения этого свойства) и свойство делегата.

protocol PersonMadeMove {
    var oldPosition: String {get set}
    var newPosition: String {get set}
    var evalPos: Double {get}
    var delegate: ComputerMoveDelegate? {get set}
}

//  b) Компьютерной игры: один протокол для всех, кто может летать (Flyable), второй — для тех, кого можно отрисовывать в приложении (Drawable). Напишите класс, который реализует эти два протокола.

protocol Flyable {
    func fly()
}

protocol Drawable {
    func draw()
}

class FlyDraw: Flyable, Drawable {
    func fly() {
        print("I can fly")
    }
    
    func draw() {
        print("I can draw")
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let rect = CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size)
        print(rect.height)
        print(rect.width)
        print(rect.center(x: rect.width, y: rect.height))
        print(rect.square(a: rect.width, b: rect.height))
        print(7.bound(minVal: 10, maxVal: 21))
        print(7.bound(minVal: 3, maxVal: 6))
        print(7.bound(minVal: 3, maxVal: 10))
        let array = [1,2,10]
        print(array.sum())
        
        
    }


}

//7. Создайте расширение с функцией для:

extension CGRect {
    //     a) CGRect, которая возвращает CGPoint с центром этого CGRect’а.
    
    func center(x: Double, y: Double) -> CGPoint {
        CGPoint(x: x/2, y: y/2)
    }
    //     b) CGRect, которая возвращает площадь этого CGRect’а.
    
    func square (a: Double, b: Double) -> Double {
        return a*b
    }
}

extension UIView {
    //     c) UIView, которое анимированно её скрывает (делает alpha = 0).
    
    func hideUIView() {
        UIView.animate(withDuration: 0.3, delay: 0.1, animations: {
            self.alpha = 0
        })
    }
}

extension Comparable {
    //     d) Протокола Comparable, который на вход получает ещё два параметра того же типа: первый  ограничивает минимальное значение, второй —  максимальное, — и возвращает текущее значение, ограниченное этими двумя параметрами. Пример использования:
    //
    //7.bound(minValue: 10, maxValue: 21) → 10
    //
    //7.bound(minValue: 3, maxValue: 6) → 6
    //
    //7.bound(minValue: 3, maxValue: 10) → 7
    
    func bound (minVal: Self, maxVal: Self) -> Int {
        if(self < minVal) {
            return minVal as! Int
        }
        if(self > maxVal) {
            return maxVal as! Int
        }
        if(self > minVal && self < maxVal) {
            return self as! Int
        }
        return 0
    }
}

extension Array {
    //     e) Array, который содержит элементы типа Int: функцию для подсчёта суммы всех элементов.
    
    func sum() -> Int {
        var sum = 0
        for element in self {
            sum += element.self as! Int
        }
        return sum
    }
}

