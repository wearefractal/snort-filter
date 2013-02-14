module.exports = main =
  reg: /alert([\s\S]+?)\(([\s\S]+?)\)/gm
  filter: (str, opt={}) ->
    matches = str.match main.reg
    return "" unless matches?
    out = ""
    for match in matches
      match = match.trim()
      match = match.replace /(\r\n|\n|\r)/gm, "" if opt.strip
      match = "|| #{match} ||" if opt.delimit
      out += "#{match}\r\n"
    return out