import UIKit

struct Queue<T> {
  
    var elements: [T] = []
    
    subscript(index: Int) -> T? {
        get {
            return elements.indices.contains(index) ? self.elements[index] : nil
        }
        set(newValue) {
            elements.indices.contains(index) ? self.elements[index] = newValue! : nil
            }
    }

  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
    func filter(_ isIncluded: (T) -> Bool) -> [T]{
        var tmpArray = [T]()
        
        for element in elements{
            if isIncluded(element) {
                tmpArray.append(element)
            }
        }
        return  tmpArray
    }
    
    func map<U>(_ transform: (T) -> U) ->[U]{
        
        var transformedArray = [U]()
        var transformedElement: U
        
        for element in elements{
            transformedElement = transform(element)
            transformedArray.append(transformedElement)
        }
        
        return  transformedArray
    }
}

//Проверка

var intQueue = Queue<Int>()

intQueue.enqueue(1)
intQueue.enqueue(3)
intQueue.enqueue(3)

intQueue[2] = 5

print(intQueue[2] ?? "Выбран несуществующий индекс")

print(intQueue.map{String($0)})


var stringQueue = Queue<String>()

stringQueue.enqueue("Hello")
stringQueue.enqueue("String2")
stringQueue.enqueue("String3")

print(stringQueue.filter{$0.count > 5})
print(stringQueue.map{$0})
