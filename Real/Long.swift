import Foundation

public extension Array where Element == Int32
{
    mutating func addLeadingZeros(toWidth: Int)
    {
        let difference: Int = toWidth - count
        
        reverse()
        for _ in 0..<difference
        {
            append(0)
        }
        reverse()
    }
    
    mutating func removeLeadingZeros()
    {
        while (self[0] == 0) && (count > 1)
        {
            removeFirst()
        }
    }
}

public class Long
{
    private var _integer: [Int32]
    private var _isNegative: Bool
    
    public init()
    {
        _integer = [Int32]()
        _integer.append(0)
        _isNegative = false
    }
    
    public init(_ val: Int)
    {
        _integer = [Int32]()
        let str = String(val)
        
        if str[str.startIndex] == "-"
        {
            _isNegative = true
            var i = str.index(str.startIndex, offsetBy: 1)
            while i < str.endIndex
            {
                _integer.append(Int32(String(str[i]))!)
                i = str.index(after: i)
            }
        }
        else
        {
            _isNegative = false
            var i = str.startIndex
            while i < str.endIndex
            {
                _integer.append(Int32(String(str[i]))!)
                i = str.index(after: i)
            }
        }
    }
    
    public init(_ val: Double)
    {
        _integer = [Int32]()
        let str = String(Int(val))
        
        if str[str.startIndex] == "-"
        {
            _isNegative = true
            var i = str.startIndex
            while i < str.endIndex
            {
                _integer.append(Int32(String(str[i]))!)
                i = str.index(after: i)
            }
        }
        else
        {
            _isNegative = false
            var i = str.startIndex
            while i < str.endIndex
            {
                _integer.append(Int32(String(str[i]))!)
                i = str.index(after: i)
            }
        }
    }
    
    public init(_ val: String)
    {
        _integer = [Int32]()
        
        _isNegative = false
        var i = val.startIndex
        while i < val.endIndex
        {
            switch val[i]
            {
            case "-":
                if i == val.startIndex
                {
                    _isNegative = true
                }
                else
                {
                    print("invalid character")
                    exit(-1)
                }
            case ".":
                break
            case ",":
                continue
            case "0":
                _integer.append(Int32(String(val[i]))!)
            case "1":
                _integer.append(Int32(String(val[i]))!)
            case "2":
                _integer.append(Int32(String(val[i]))!)
            case "3":
                _integer.append(Int32(String(val[i]))!)
            case "4":
                _integer.append(Int32(String(val[i]))!)
            case "5":
                _integer.append(Int32(String(val[i]))!)
            case "6":
                _integer.append(Int32(String(val[i]))!)
            case "7":
                _integer.append(Int32(String(val[i]))!)
            case "8":
                _integer.append(Int32(String(val[i]))!)
            case "9":
                _integer.append(Int32(String(val[i]))!)
            default:
                print("invalid character")
                exit(-1)
            }
            i = val.index(after: i)
        }
    }
    
    public func append(_ val: Int32)
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
                    var current: Int32 = 0
                    var a: Int32 = lhs[j]
                    var b: Int32 = rhs[i]
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
                    var current: Int32 = 0
                    var a: Int32 = rhs[j]
                    var b: Int32 = lhs[i]
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
                    var current: Int32 = 0
                    var a: Int32 = lhs[j]
                    var b: Int32 = rhs[i]
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
    
    public subscript(_ val: Int) -> Int32
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
    
    public func pow(base: Long, exponent: UInt) -> Long
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
        
        if _isNegative
        {
            ret += "-"
        }
        
        for i in 0..<_integer.count
        {
            ret += String(_integer[i])
        }
        return ret
    }
}
