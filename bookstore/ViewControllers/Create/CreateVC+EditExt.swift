//
//  CreateVC + Edit Ext.swift
//  bookstore
//
//  Created by Mohamad Shahrul  on 01/06/1403 AP.
//

import UIKit

extension CreateVC {

    func setupEditInitialStates(){
        bookNameTextField.text = oldBook?.bookName
        bookAuthorTextField.text = oldBook?.bookAuthor
        bookNotesTextField.text = oldBook?.bookNotes
        bookNameTextField.textColor = UIColor.lightGray
        bookAuthorTextField.textColor = UIColor.lightGray
        bookNotesTextField.textColor = UIColor.lightGray
        bookNameTextField.isEnabled = false
        bookAuthorTextField.isEnabled = false
        bookNotesTextField.isEditable = false
        userSelectedImage = bookImageView.image
        bookImageView.isHidden = true
        bookImageLoadingOverlay.isHidden = false
        
        if let imageUrl = oldBook?.bookImageUrl {
            loadImage(from: URL(string :imageUrl)!, into: bookImageView)
        }
        
        createButtonView.setTitle("Edit", for: .normal)
        chooseImageButton.isHidden = true
    }
    
    @objc func setupBeforeUpdateDatabase() {
        if createButtonView.title(for: .normal) == "Edit"  {
            createButtonView.setTitle("Done", for: .normal)
            chooseImageButton.isHidden = false
            bookNameTextField.isEnabled = true
            bookAuthorTextField.isEnabled = true
            bookNotesTextField.isEditable = true
            bookNameTextField.textColor = invertedColor(of: UIColor.systemBackground)
            bookAuthorTextField.textColor = invertedColor(of: UIColor.systemBackground)
            bookNotesTextField.textColor = invertedColor(of: UIColor.systemBackground)
            
        } else {  //when the user click on the done button
            Task{
                blurLoadingEffect?.show()
                await BookDataProcesses()
            }
        }
    }
    
    func invertedColor(of color: UIColor) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        // Get the RGB components of the color
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        // Invert the RGB components
        let invertedRed = 1.0 - red
        let invertedGreen = 1.0 - green
        let invertedBlue = 1.0 - blue

        // Create and return the new inverted color
        return UIColor(red: invertedRed, green: invertedGreen, blue: invertedBlue, alpha: alpha)
    }
}
