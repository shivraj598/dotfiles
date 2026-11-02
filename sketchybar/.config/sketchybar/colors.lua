return {
  black = 0xff13101c,
  white = 0xffe6e0f5,
  red = 0xfff38ba8,
  green = 0xffa6e3a1,
  blue = 0xff9fa8fa,
  yellow = 0xfff5d99a,
  orange = 0xfff5a97f,
  magenta = 0xffe0a3f0,
  purple = 0xffc39bf7,
  purple_dim = 0xff4a3a75,
  purple_bg = 0xff4b3878,
  grey = 0xff8c80aa,
  transparent = 0x00000000,

  bar = {
    bg = 0x00000000,
    border = 0xff2a2142,
  },
  popup = {
    bg = 0xc0231a3a,
    border = 0xff8c80aa
  },
  bg1 = 0xff2e2547,
  bg2 = 0xff3e3260,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
