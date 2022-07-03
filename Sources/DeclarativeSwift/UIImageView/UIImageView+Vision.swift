/**
 Copyright 2021 SwiftFoxx
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in the
 Software without restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import Vision

 /// Using the power of `Vision` to perform various operations on an image.
 /// This extension of `UIImageView` is dedicated only to advanced **ML functionalities**.

@available(iOS 15.0, *)
public extension UIImageView {
    /// Extracts the foreground and produces a mask image in only black and white.
    /// The mask has the foreground/subject in white and the background in black.
    /// Access `resultHandler` to get the mask image and use as required.
    /// - Parameter resultHandler: Closure type of `(Result<UIImage, Error>) -> Void`
    @discardableResult
    func extractingSubject(_ resultHandler: (Result<UIImage, Error>) -> Void) -> UIImageView {
        guard let image = self.image,
              let convertedCGImage = image.cgImage else {
            NSLog("Could not get \'CGImage\' from the source image")
            NSLog(#function)
            return self
        }
        let request = VNGeneratePersonSegmentationRequest()
        request.revision = VNGeneratePersonSegmentationRequestRevision1
        request.qualityLevel = .accurate
        request.outputPixelFormat = kCVPixelFormatType_OneComponent8
        let options: [VNImageOption : Any] = [:]
        let requestHandler = VNImageRequestHandler(cgImage: convertedCGImage, options: options)
        
        do {
            try requestHandler.perform([request])
        } catch {
            resultHandler(.failure(error))
        }
        
        guard let mask = request.results?.first else {
            let error = NSError(domain: "declarativeswift.error", code: NSCoderValueNotFoundError)
            resultHandler(.failure(error))
            return self
        }
        
        let maskBuffer = mask.pixelBuffer
        let resultCIImage = CIImage(cvPixelBuffer: maskBuffer)
        
        let context = CIContext()
        guard let resultCGImage = context.createCGImage(
            resultCIImage,
            from: CGRect(
                origin: .zero,
                size: CGSize(
                    width: CVPixelBufferGetWidth(maskBuffer),
                    height: CVPixelBufferGetHeight(maskBuffer)
                )
            )
        ) else {
            let error = NSError(domain: "declarativeswift.error", code: NSCoderValueNotFoundError)
            resultHandler(.failure(error))
            return self
        }
        
        let resultUIImage = UIImage(cgImage: resultCGImage, scale: image.scale, orientation: image.imageOrientation)
        resultHandler(.success(resultUIImage))
        return self
    }
}
