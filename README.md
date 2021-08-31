<img src="https://github.com/SwiftFoxx/code-images-ext-usage/blob/68fa954b1ba473a532f69c1fb97f5d3d45778ccf/PNG/ds_header.png">

# DeclarativeSwift

## Overview

Enjoy writing Swift code by shortening the hassel to call the same property again and again.

This library helps writing UI codes with much simplicity.


## Description
Swift:
let myView = UIView(frame: viewFrame)
myView.layer.cornerRadius = 12
myView.layer.shadowColor = .black

DeclarativeSwift:
let myView = UIView(frame: viewFrame)
.roundingCorners(by: 12)
.addingShadow(color: .black)
