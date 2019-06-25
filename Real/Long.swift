import Foundation

public extension String
{
    subscript(_ val: Int) -> String
    {
        get
        {
            return String(self[self.index(self.startIndex, offsetBy: val)])
        }
        set
        {
            self = self[self.startIndex..<self.index(self.startIndex, offsetBy: val)] + newValue + self[self.index(self.startIndex, offsetBy: val+1)..<self.endIndex]
        }
    }
}

public extension Array where Element == Int
{
    mutating func addLeadingZeros(toWidth: Int)
    {
        let original: [Int] = self
        self = [Int]()
        let size: Int = original.count
        let difference: Int = toWidth - size
        for _ in 0..<difference
        {
            self.append(0)
        }
        for i in 0..<size
        {
            self.append(original[i])
        }
    }
    
    mutating func removeLeadingZeros()
    {
        while (self[0] == 0) && (self.count > 1)
        {
            self.removeFirst()
        }
    }
}

public class Long
{
    private var _integer: [Int]
    private var _isNegative: Bool
    
    public init()
    {
        _integer = [Int]()
        _integer.append(0)
        _isNegative = false
    }
    
    public init(_ val: Int)
    {
        _integer = [Int]()
        let str = String(val)
        let size: Int = str.count
        
        if str[0] == "-"
        {
            _isNegative = true
            for i in 1..<size
            {
                _integer.append(Int(str[i])!)
            }
        }
        else
        {
            _isNegative = false
            for i in 0..<size
            {
                _integer.append(Int(str[i])!)
            }
        }
    }
    
    public init(_ val: Double)
    {
        _integer = [Int]()
        let str = String(Int(val))
        let size: Int = str.count
        
        if str[0] == "-"
        {
            _isNegative = true
            for i in 1..<size
            {
                _integer.append(Int(str[i])!)
            }
        }
        else
        {
            _isNegative = false
            for i in 0..<size
            {
                _integer.append(Int(str[i])!)
            }
        }
    }
    
    public init(_ val: String)
    {
        _integer = [Int]()
        let size: Int = val.count
        
        if val[0] == "-"
        {
            _isNegative = true
            for i in 1..<size
            {
                _integer.append(Int(val[i])!)
            }
        }
        else
        {
            _isNegative = false
            for i in 0..<size
            {
                _integer.append(Int(val[i])!)
            }
        }
    }
    
    public func append(_ val: Int)
    {
        _integer.append(val)
    }
    
    public static func +(_ lhs: Long, _ rhs: Long) -> Long
    {
        if lhs._isNegative && rhs._isNegative
        {
            lhs._isNegative = false
            rhs._isNegative = false
            let result: Long = lhs + rhs
            result._isNegative = true
            lhs._isNegative = true
            rhs._isNegative = true
            return result
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            lhs._isNegative = false
            let result: Long = rhs - lhs
            lhs._isNegative = true
            return result
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            rhs._isNegative = false
            let result: Long = lhs - rhs
            rhs._isNegative = true
            return result
        }
        else
        {
            let result = Long()
            if lhs.count == rhs.count
            {
                let size: Int = lhs.count
                for i in stride(from: size-1, through: 0, by: -1)
                {
                    if lhs[i] + rhs[i] >= 10
                    {
                        if i == 0
                        {
                            result.append((lhs[i] + rhs[i]) % 10)
                            result.append((lhs[i] + rhs[i]) / 10)
                        }
                        else
                        {
                            result.append((lhs[i] + rhs[i]) % 10)
                            lhs[i-1] += ((lhs[i] + rhs[i]) / 10)
                        }
                    }
                    else
                    {
                        result.append(lhs[i] + rhs[i])
                    }
                }
            }
            else
            {
                if lhs.count > rhs.count
                {
                    let size: Int = lhs.count
                    rhs.addLeadingZeros(toWidth: size)
                    for i in stride(from: size-1, through: 0, by: -1)
                    {
                        if lhs[i] + rhs[i] >= 10
                        {
                            if i == 0
                            {
                                result.append((lhs[i] + rhs[i]) % 10)
                                result.append((lhs[i] + rhs[i]) / 10)
                            }
                            else
                            {
                                result.append((lhs[i] + rhs[i]) % 10)
                                lhs[i-1] += ((lhs[i] + rhs[i]) / 10)
                            }
                        }
                        else
                        {
                            result.append(lhs[i] + rhs[i])
                        }
                    }
                    rhs.removeLeadingZeros()
                }
                else
                {
                    let size: Int = rhs.count
                    lhs.addLeadingZeros(toWidth: size)
                    for i in stride(from: size-1, through: 0, by: -1)
                    {
                        if lhs[i] + rhs[i] >= 10
                        {
                            if i == 0
                            {
                                result.append((lhs[i] + rhs[i]) % 10)
                                result.append((lhs[i] + rhs[i]) / 10)
                            }
                            else
                            {
                                result.append((lhs[i] + rhs[i]) % 10)
                                lhs[i-1] += ((lhs[i] + rhs[i]) / 10)
                            }
                        }
                        else
                        {
                            result.append(lhs[i] + rhs[i])
                        }
                    }
                    lhs.removeLeadingZeros()
                }
            }
            
            result.reverse()
            result.removeLast()
            return result
        }
    }
    
    public static func +=(_ lhs: inout Long, _ rhs: Long)
    {
        lhs = lhs + rhs
    }
    
    public static func -(_ lhs: Long, _ rhs: Long) -> Long
    {
        if lhs._isNegative && rhs._isNegative
        {
            lhs._isNegative = false
            rhs._isNegative = false
            let result: Long = rhs - lhs
            lhs._isNegative = true
            rhs._isNegative = true
            return result
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            lhs._isNegative = false
            let result: Long = lhs + rhs
            result._isNegative = true
            lhs._isNegative = true
            return result
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            rhs._isNegative = false
            let result: Long = lhs + rhs
            rhs._isNegative = true
            return result
        }
        else
        {
            var result = Long()
            if lhs.count == rhs.count
            {
                let size: Int = lhs.count
                
                for i in 0..<size
                {
                    if rhs[i] > lhs[i]
                    {
                        result = rhs - lhs
                        result._isNegative = true
                        return result
                    }
                    else if lhs[i] > rhs[i]
                    {
                        break
                    }
                }
                
                for i in stride(from: size-1, through: 0, by: -1)
                {
                    if lhs[i] - rhs[i] < 0
                    {
                        result.append((lhs[i] + 10) - rhs[i])
                        lhs[i-1] = lhs[i-1] - 1
                    }
                    else
                    {
                        result.append(lhs[i] - rhs[i])
                    }
                }
            }
            else
            {
                if lhs.count > rhs.count
                {
                    let size: Int = lhs.count
                    rhs.addLeadingZeros(toWidth: size)
                    for i in stride(from: size-1, through: 0, by: -1)
                    {
                        if lhs[i] - rhs[i] < 0
                        {
                            result.append((lhs[i] + 10) - rhs[i])
                            lhs[i-1] = lhs[i-1] - 1
                        }
                        else
                        {
                            result.append(lhs[i] - rhs[i])
                        }
                    }
                    rhs.removeLeadingZeros()
                }
                else
                {
                    lhs.addLeadingZeros(toWidth: rhs.count)
                    result = rhs - lhs
                    result._isNegative = true
                    lhs.removeLeadingZeros()
                    return result
                }
            }
            
            result.reverse()
            result.removeLast()
            result.removeLeadingZeros()
            
            return result
        }
    }
    
    public static func -=(_ lhs: inout Long, _ rhs: Long)
    {
        lhs = lhs - rhs
    }
    
    public static prefix func -(_ original: Long) -> Long
    {
        let ret: Long = original
        
        if original._isNegative
        {
            ret._isNegative = false
        }
        else
        {
            ret._isNegative = true
        }
        
        return ret
    }
    
    public static func *(_ lhs: Long, _ rhs: Long) -> Long
    {
        if lhs == Long() || rhs == Long()
        {
            return Long()
        }
        
        var result = Long()
        var rowCount: Int = 0
        
        if lhs.count > rhs.count
        {
            for i in stride(from: rhs.count-1, through: 0, by: -1)
            {
                let row = Long()
                row.removeLast()
                
                for _ in 0..<rowCount
                {
                    row.append(0)
                }
                
                for j in stride(from: lhs.count-1, through: 0, by: -1)
                {
                    var current: Int = 0
                    var a: Int = lhs[j]
                    var b: Int = rhs[i]
                    while b != 0
                    {
                        if b % 2 != 0
                        {
                            current += a
                        }
                        a <<= 1
                        b >>= 1
                    }
                    row.append(current)
                }
                row.reverse()
                result += row
                rowCount += 1
            }
        }
        else if rhs.count > lhs.count
        {
            for i in stride(from: lhs.count-1, through: 0, by: -1)
            {
                let row = Long()
                row.removeLast()
                
                for _ in 0..<rowCount
                {
                    row.append(0)
                }
                
                for j in stride(from: rhs.count-1, through: 0, by: -1)
                {
                    var current: Int = 0
                    var a: Int = rhs[j]
                    var b: Int = lhs[i]
                    while b != 0
                    {
                        if b % 2 != 0
                        {
                            current += a
                        }
                        a <<= 1
                        b >>= 1
                    }
                    row.append(current)
                }
                row.reverse()
                result += row
                rowCount += 1
            }
        }
        else
        {
            for i in stride(from: rhs.count-1, through: 0, by: -1)
            {
                let row = Long()
                row.removeLast()
                
                for _ in 0..<rowCount
                {
                    row.append(0)
                }
                
                for j in stride(from: lhs.count-1, through: 0, by: -1)
                {
                    var current: Int = 0
                    var a: Int = lhs[j]
                    var b: Int = rhs[i]
                    while b != 0
                    {
                        if b % 2 != 0
                        {
                            current += a
                        }
                        a <<= 1
                        b >>= 1
                    }
                    row.append(current)
                }
                row.reverse()
                result += row
                rowCount += 1
            }
        }
        
        if (lhs._isNegative && rhs._isNegative) || (!lhs._isNegative && !rhs._isNegative)
        {
            result._isNegative = false
        }
        else
        {
            result._isNegative = true
        }
        
        return result
    }
    
    public static func *=(_ lhs: inout Long, _ rhs: Long)
    {
        lhs = lhs * rhs
    }
    
    public static func >(_ lhs: Long, _ rhs: Long) -> Bool
    {
        if lhs.count > rhs.count
        {
            return true
        }
        else if rhs.count > lhs.count
        {
            return false
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            return false
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            return true
        }
        else if lhs._isNegative && rhs._isNegative
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return false
                }
                else if rhs[i] > lhs[i]
                {
                    return true
                }
            }
            return false
        }
        else
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return true
                }
                else if rhs[i] > lhs[i]
                {
                    return false
                }
            }
            return false
        }
    }
    
    public static func >=(_ lhs: Long, _ rhs: Long) -> Bool
    {
        if lhs.count > rhs.count
        {
            return true
        }
        else if rhs.count > lhs.count
        {
            return false
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            return false
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            return true
        }
        else if lhs._isNegative && rhs._isNegative
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return false
                }
                else if rhs[i] > lhs[i]
                {
                    return true
                }
            }
            return true
        }
        else
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return true
                }
                else if rhs[i] > lhs[i]
                {
                    return false
                }
            }
            return true
        }
    }
    
    public static func <(_ lhs: Long, _ rhs: Long) -> Bool
    {
        if lhs.count > rhs.count
        {
            return false
        }
        else if rhs.count > lhs.count
        {
            return true
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            return true
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            return false
        }
        else if lhs._isNegative && rhs._isNegative
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return true
                }
                else if rhs[i] > lhs[i]
                {
                    return false
                }
            }
            return false
        }
        else
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return false
                }
                else if rhs[i] > lhs[i]
                {
                    return true
                }
            }
            return false
        }
    }
    
    public static func <=(_ lhs: Long, _ rhs: Long) -> Bool
    {
        if lhs.count > rhs.count
        {
            return false
        }
        else if rhs.count > lhs.count
        {
            return true
        }
        else if lhs._isNegative && !rhs._isNegative
        {
            return true
        }
        else if !lhs._isNegative && rhs._isNegative
        {
            return false
        }
        else if lhs._isNegative && rhs._isNegative
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return true
                }
                else if rhs[i] > lhs[i]
                {
                    return false
                }
            }
            return true
        }
        else
        {
            for i in 0..<lhs.count
            {
                if lhs[i] > rhs[i]
                {
                    return false
                }
                else if rhs[i] > lhs[i]
                {
                    return true
                }
            }
            return true
        }
    }
    
    public static func ==(_ lhs: Long, _ rhs: Long) -> Bool
    {
        return lhs.toString == rhs.toString
    }
    
    public subscript(_ val: Int) -> Int
    {
        get
        {
            return _integer[val]
        }
        set
        {
            _integer[val] = newValue
        }
    }
    
    public func addLeadingZeros(toWidth: Int)
    {
        _integer.addLeadingZeros(toWidth: toWidth)
    }
    
    public func removeLeadingZeros()
    {
        _integer.removeLeadingZeros()
    }
    
    public func maxBetween(firstNum: Long, secondNum: Long) -> Long
    {
        if firstNum == secondNum
        {
            return Long()
        }
        else if firstNum > secondNum
        {
            return firstNum
        }
        else
        {
            return secondNum
        }
    }
    
    public func pow(base: Long, exponent: Int) -> Long
    {
        if exponent == 0
        {
            return Long(1)
        }
        else
        {
            var ret = Long(base.toString)
            for _ in 1..<exponent
            {
                ret *= base
            }
            return ret
        }
    }
    
    public func factorial(of val: Long) -> Long
    {
        if val == Long()
        {
            return Long(1)
        }
        else
        {
            var result = Long(val.toString)
            var current = Long(result.toString) - Long(1)
            while current > Long()
            {
                result *= current
                current -= Long(1)
            }
            return result
        }
    }
    
    public func abs(of val: Long) -> Long
    {
        if !val._isNegative
        {
            return val
        }
        else
        {
            return -val
        }
    }
    
    public func reverse()
    {
        _integer.reverse()
    }
    
    public var count: Int
    {
        return _integer.count
    }
    
    public func removeLast()
    {
        _integer.removeLast()
    }
    
    public func removeFirst()
    {
        _integer.removeFirst()
    }
    
    public var toString: String
    {
        var ret = String()
        let size: Int = _integer.count
        
        if _isNegative
        {
            ret += "-"
        }
        
        for i in 0..<size
        {
            ret += String(_integer[i])
        }
        return ret
    }
}
