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
    private let _factorialMap: [String : String] =
        ["0" : "1", "1" : "1", "2" : "2", "3" : "6", "4" : "24", "5" : "120", "6" : "720",
         "7" : "5040", "8" : "40320", "9" : "362880", "10" : "3628800", "11" : "39916800",
         "12" : "479001600", "13" : "6227020800", "14" : "87178291200", "15" : "1307674368000",
         "16" : "20922789888000", "17" : "355687428096000", "18" : "6402373705728000",
         "19" : "121645100408832000", "20" : "2432902008176640000", "21" : "51090942171709440000",
         "22" : "1124000727777607680000", "23" : "25852016738884976640000",
         "24" : "620448401733239439360000", "25" : "15511210043330985984000000",
         "26" : "403291461126605635584000000", "27" : "10888869450418352160768000000",
         "28" : "304888344611713860501504000000", "29" : "8841761993739701954543616000000",
         "30" : "265252859812191058636308480000000", "31" : "8222838654177922817725562880000000",
         "32" : "263130836933693530167218012160000000",
         "33" : "8683317618811886495518194401280000000",
         "34" : "295232799039604140847618609643520000000",
         "35" : "10333147966386144929666651337523200000000",
         "36" : "371993326789901217467999448150835200000000",
         "37" : "13763753091226345046315979581580902400000000",
         "38" : "523022617466601111760007224100074291200000000",
         "39" : "20397882081197443358640281739902897356800000000",
         "40" : "815915283247897734345611269596115894272000000000",
         "41" : "33452526613163807108170062053440751665152000000000",
         "42" : "1405006117752879898543142606244511569936384000000000",
         "43" : "60415263063373835637355132068513997507264512000000000",
         "44" : "2658271574788448768043625811014615890319638528000000000",
         "45" : "119622220865480194561963161495657715064383733760000000000"]
    
    public init()
    {
        _integer = [Int32]()
        _integer.append(0)
        _isNegative = false
    }
    
    public init(_ val: Any)
    {
        let input = String(describing: val)
        _integer = [Int32]()
        
        _isNegative = false
        var i = input.startIndex
        while i < input.endIndex
        {
            switch input[i]
            {
            case "-":
                if i == input.startIndex
                {
                    _isNegative = true
                }
                else
                {
                    print("invalid character")
                    exit(-1)
                }
            case ".":
                return
            case ",":
                continue
            case "0":
                _integer.append(Int32(String(input[i]))!)
            case "1":
                _integer.append(Int32(String(input[i]))!)
            case "2":
                _integer.append(Int32(String(input[i]))!)
            case "3":
                _integer.append(Int32(String(input[i]))!)
            case "4":
                _integer.append(Int32(String(input[i]))!)
            case "5":
                _integer.append(Int32(String(input[i]))!)
            case "6":
                _integer.append(Int32(String(input[i]))!)
            case "7":
                _integer.append(Int32(String(input[i]))!)
            case "8":
                _integer.append(Int32(String(input[i]))!)
            case "9":
                _integer.append(Int32(String(input[i]))!)
            default:
                print("invalid character")
                exit(-1)
            }
            i = input.index(after: i)
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
        if val._isNegative
        {
            print("invalid factorial")
            exit(-1)
        }
        
        if val <= Long(45)
        {
            return Long(_factorialMap[val.toString]!)
        }
        else
        {
            var result = Long(val.toString)
            var current = Long(result.toString) - Long(1)
            while current > Long(45)
            {
                result *= current
                current -= Long(1)
            }
            current = Long(_factorialMap[current.toString]!)
            result *= current
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
