//
//  ContentView.swift
//  Instafilter
//
//  Created by Ale Mohamad on 24/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var showingNoImageAlert = false
    @State private var showingSuccessAlert = false
    
    @State private var filterButtonText = "Change Filter"
    
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        let radius = Binding<Double>(
            get: {
                self.filterRadius
            },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
            }
        )
        
        let scale = Binding<Double>(
            get: {
                self.filterScale
            },
            set: {
                self.filterScale = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                VStack {
                    HStack {
                        Text("Intesity")
                        Slider(value: intensity)
                    }
                    
                    HStack {
                        Text("Radius")
                        Slider(value: radius)
                    }
                    
                    HStack {
                        Text("Scale")
                        Slider(value: scale)
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button(filterButtonText) {
                        self.showingFilterSheet = true
                    }
                    .alert(isPresented: $showingNoImageAlert) {
                        Alert(title: Text("No image!"), message: Text("You have to add a filter to generate an image in order to save it."), dismissButton: .default(Text("OK")))
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = self.processedImage else {
                            self.showingNoImageAlert = true
                            return
                        }
                        
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                            self.showingSuccessAlert = true
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops! \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                    .alert(isPresented: $showingSuccessAlert) {
                        Alert(title: Text("Saved image!"), message: Text("Your processed image is now saved in your Photo Library."), dismissButton: .default(Text("Great!")))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle(Text("Instafilter"))
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystalized")) { self.setFilter(CIFilter.crystallize(), "Crystalized") },
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges(), "Edges") },
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur(), "Gaussian Blur") },
                    .default(Text("Pixelate")) { self.setFilter(CIFilter.pixellate(), "Pixelate") },
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone(), "Sepia Tone") },
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask(), "Unsharp Mask") },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette(), "Vignette") },
                    .cancel()
                ])
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter, _ title: String) {
        currentFilter = filter
        filterButtonText = title
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
