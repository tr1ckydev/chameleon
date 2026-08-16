# Chameleon Comptime API

The comptime API is the simplest way to implement colors in your app console output.

The styles are applied to the text during comptime hence they are inlined with the text in the final executable and has absolutely zero runtime overhead.

```zig
const Chameleon = @import("chameleon");

pub fn main(init: std.process.Init) !void {
	comptime var c = Chameleon.initComptime();
	try c.green().bold().printOut(init.io, "Hello, world!", .{});
}
```

# Chameleon Runtime API

The runtime API is the recommended way to implement colors in your app, if deploying to end users.

The biggest advantage of using the runtime API over the comptime one is that, it supports `NO_COLOR` environment variable standard which if present, dynamically prevents colors from being added to the output.

- ### `initRuntime`

The disadvantage to _this_ runtime initialization method is that it is fallible due to the creation of an environment map, **there are two other method which provide infallibility**.

```zig
const std = @import("std");
const Chameleon = @import("chameleon");

pub fn main(init: std.process.Init) !void {
  var c = try Chameleon.initRuntime(.{ .allocator = std.heap.your_allocator });
  defer c.deinit();
  // `config.detect_no_color` is respected, `initRuntime` will only create an environment map if you enable detection.
  try c.green().bold().printOut(init.io, "Hello, world!", .{});
}
```

- ### `initRuntimeNoDetect`

Implement your own `NO_COLOR` detection and use `initRuntimeNoDetect`, which will not check the `NO_COLOR` environment variable.

```zig
const std = @import("std");
const Chameleon = @import("chameleon");

pub fn main(init: std.process.Init) !void {
  var c = Chameleon.initRuntimeNoDetect(.{ .allocator = std.heap.your_allocator });
  defer c.deinit();
  c.no_color = true; // `config.detect_no_color` is ignored, implement your detection here.
  try c.green().bold().printOut(init.io, "Hello, world!", .{});
}
```

- ### `initRuntimeFromEnviron`

Provide `initRuntimeFromEnviron` with an environment map, such as the one from `std.process.Init` (`init.environ_map`).

```zig
const std = @import("std");
const Chameleon = @import("chameleon");

pub fn main(init: std.process.Init) !void {
  var c = Chameleon.initRuntimeFromEnviron(.{ .allocator = std.heap.your_allocator }, init.environ_map);
  defer c.deinit();
  // `config.detect_no_color` is respected, and reads the `NO_COLOR` variable from `init.environ_map`.
  try c.green().bold().printOut(init.io, "Hello, world!", .{});
}
```

# Styles API

Apart from the initialization syntax, the colors and style syntax are almost similar in both the APIs.

- ### `fmt`

  Returns the stylized text which can be then printed to the console.

  ```zig
  // Comptime API
  std.debug.print("Hello, {s}", .{
  	c.bold().red().fmt("world!"),
  });

  // Runtime API
  std.debug.print("Hello, {s}", .{
  	try c.bold().red().fmt("world!", .{}),
  });
  ```

- ### `printOut`

  Print out the stylized text directly to the standard output.

  ```zig
  try c.green().bold().printOut(io, "Hello, world!", .{});
  ```

- ### `printErr`

  Print out the stylized text directly to the standard error.

  ```zig
  try c.green().bold().printErr(io, "Error!", .{});
  ```

- ### `reset`...`overline` (Modifiers)

  These modify the text style in which they are displayed like bold, italics etc.

  ```zig
  try c.bold().italic().printOut(io, "Bold italic!", .{});
  ```

- ### `black`...`white` (Foreground colors)

  These modify the foreground color of the text.

  ```zig
  try c.green().printOut(io, "Green color!", .{});
  ```

- ### `blackBright`...`whiteBright` (Bright Foreground colors)

  These are brighter versions of the above colors.

  ```zig
  try c.greenBright().printOut(io, "Bright green color!", .{});
  ```

- ### `bgBlack`...`bgWhite` (Background colors)

  These modify the background color of the text.

  ```zig
  try c.bgGreen().printOut(io, "Green background color!", .{});
  ```

- ### `bgBlackBright`...`bgWhiteBright` (Bright Background colors)

  These are brighter versions of the above colors.

  ```zig
  try c.bgGreenBright().printOut(io, "Bright green background color!", .{});
  ```

- ### `rgb` (Custom foreground color)

  Set the text color to the specified rgb values.

  ```zig
  try c.rgb(123, 45, 67).printOut(io, "Reddish color!", .{});
  ```

- ### `bgRgb` (Custom background color)

  Set the background color to the specified rgb values.

  ```zig
  try c.bgRgb(123, 45, 67).printOut(io, "Reddish background color!", .{});
  ```

- ### `hex` (Custom foreground color)

  Set the text color to the specified hex color.

  Hex color codes can be provided with or without a `#` prefix and also as [hex triplets](https://en.wikipedia.org/wiki/Web_colors#Shorthand_hexadecimal_form).

  ```zig
  try c.hex("#FFAA00").printOut(io, "Orangish color!", .{});
  // Using hex triplet:
  // try c.hex("FA0").printOut(...)
  ```

- ### `bgHex` (Custom background color)

  Set the text color to the specified hex color.

  Hex color codes can be provided with or without a `#` prefix and also as [hex triplets](https://en.wikipedia.org/wiki/Web_colors#Shorthand_hexadecimal_form).

  ```zig
  try c.bgHex("#FFAA00").printOut(io, "Orangish background color!", .{});
  // Using hex triplet:
  // try c.bgHex("FA0").printOut(...)
  ```

- ### `createPreset`

  Create a new instance of Chameleon by saving the current styles as a preset, to be used for defining custom themes.

  ```zig
  // Comptime API
  comptime var panic = c.bold().redBright().createPreset();
  comptime var warning = c.hex("#FFA500").italic().createPreset();

  // Runtime API
  var panic = try c.bold().redBright().createPreset();
  var warning = try c.hex("#FFA500").italic().createPreset();

  try panic.printErr(io, "This is a panic!", .{});
  ...
  try warning.printOut(io, "This is a warning!", .{});
  ```

# HexColors

Struct containing all CSS [named color](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color) hex code presets.

This is useful if you are familiar with CSS colors and want to use them without looking up for the hex codes.

```zig
const Chameleon = @import("chameleon");
const Colors = Chameleon.HexColors;
...
try c.hex(Colors.BLUEVIOLET).printOut(io, "Blue violet color!", .{});
...
try c.bgHex(Colors.GOLDENROD).printOut(io, "Golden background color!", .{});
```
