![alt text](https://github.com/SwiftFoxx/code-images-ext-usage/blob/68fa954b1ba473a532f69c1fb97f5d3d45778ccf/PNG/ds_header.png "Header")

# DeclarativeSwift

[![DeclarativeSwift](https://github.com/SwiftFoxx/DeclarativeSwift/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/SwiftFoxx/DeclarativeSwift/actions/workflows/CI.yml)

## Overview

Enjoy writing Swift code by shortening the hassel to call the same property again and again.

This library helps writing UI codes with much simplicity.


## Description

The idea od **DeclarativeSwift** is driven from the syntax of SwiftUI. The Framework makes UI codes easy and clean. But in Swift, the developers would have to write tedious and repetitive lines code. That's why I decided to make swift easier and more fun.

> Note: This library is still in development mode. You're invited to fork and create pull requests. Credits will be given appropriately.

| Line | Swift        | Line | DeclarativeSwift |
|:--:|:-------------|:--:|:----------------|
|1|let myView = UIView(frame: viewFrame) |1| let myView = UIView(frame: viewFrame)|
|2|myView.layer.cornerRadius = 12 || .roundingCorners(by: 12)|
|3|myView.layer.shadowColor = .black || .addingShadow(color: .black)|

## Installation
### Package
From Xcode go to *File > Swift Packages > Add Package*; for Xcode 13+, *File > Add Packages*. Copy the repo URL and paste it in the search box. Set the version to **next mejor from 1.0.1**

### CocoaPods
Add this to the Podfile:
```Ruby
pod 'DeclarativeSwift'
```
Then run this in the Terminal
```Ruby
pod install
```
