class ATypeInference

  @type: (obj) ->

    _type = (obj) ->

      if obj == undefined or obj == null
        return String obj

      classToType = {
        '[object Boolean]': 'boolean',
        '[object Number]': 'number',
        '[object String]': 'string',
        '[object Function]': 'function',
        '[object Array]': 'array',
        '[object Date]': 'date',
        '[object RegExp]': 'regexp',
        '[object Object]': 'object'
      }

      return classToType[Object.prototype.toString.call(obj)]

    type = _type obj

    if type isnt "string" then return type =

      type: type

      value: obj

    try

      value = JSON.parse("[#{obj}]").pop()

      return type =

        type: _type value

        value: value

    catch err

      try

        value = eval("[#{obj}]").pop()

        return type =

          type: _type value

          value: value

      catch err then return type =

        type: type

        value: obj

module.exports = ATypeInference
