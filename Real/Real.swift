import Foundation

public class Real
{
    private var _num: Long
    private var _decimalPointIndex: Int
    
    public init()
    {
        _num = Long()
        _num.append(0)
        _num.append(0)
        _decimalPointIndex = 1
    }
    
    public init(_ val: Int)
    {
        _num = Long(val)
        _num.append(0)
        _decimalPointIndex = String(val).count
    }
    
    public init(_ val: Double)
    {
        _num = Long(val)
        _decimalPointIndex = _num.count
        let str = String(val)
        var i = str.index(str.startIndex, offsetBy: _decimalPointIndex+1)
        while i < str.endIndex
        {
            _num.append(Int32(String(str[i]))!)
            i = str.index(after: i)
        }
    }
    
    public init(_ val: String)
    {
        _num = Long(val)
        _decimalPointIndex = _num.count
        var i = val.index(val.startIndex, offsetBy: _decimalPointIndex+1)
        while i < val.endIndex
        {
            switch val[i]
            {
            case "-":
                print("invalid character")
                exit(-1)
            case ".":
                print("invalid character")
                exit(-1)
            case ",":
                continue
            case "0":
                _num.append(Int32(String(val[i]))!)
            case "1":
                _num.append(Int32(String(val[i]))!)
            case "2":
                _num.append(Int32(String(val[i]))!)
            case "3":
                _num.append(Int32(String(val[i]))!)
            case "4":
                _num.append(Int32(String(val[i]))!)
            case "5":
                _num.append(Int32(String(val[i]))!)
            case "6":
                _num.append(Int32(String(val[i]))!)
            case "7":
                _num.append(Int32(String(val[i]))!)
            case "8":
                _num.append(Int32(String(val[i]))!)
            case "9":
                _num.append(Int32(String(val[i]))!)
            default:
                print("invalid character")
                exit(-1)
            }
            i = val.index(after: i)
        }
    }
    
    public subscript(_ val: Int) -> Int32
    {
        return _num[val]    
    }
    
    public var toString: String
    {
        var ret = String()
        for i in 0..<_num.count
        {
            switch i
            {
            case _decimalPointIndex:
                ret += "."
                fallthrough
            default:
                ret += String(_num[i])
            }
        }
        return ret
    }
}
