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
        let size: Int = str.count
        for i in _decimalPointIndex+1..<size
        {
            _num.append(Int(str[i])!)
        }
    }
    
    public init(_ val: String)
    {
        var str = String()
        let size: Int = val.count
        for i in 0..<size
        {
            if val[i] == "."
            {
                break
            }
            str += val[i]
        }
        _decimalPointIndex = str.count
        _num = Long(str)
        for i in _decimalPointIndex+1..<size
        {
            _num.append(Int(val[i])!)
        }
    }
    
    public subscript(_ val: Int) -> Int
    {
        return _num[val]    
    }
    
    public var toString: String
    {
        var ret = String()
        let size: Int = _num.count
        for i in 0..<size
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
