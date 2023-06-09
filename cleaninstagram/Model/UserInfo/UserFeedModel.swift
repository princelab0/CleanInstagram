

import IGListKit

final class UserFeed: ListDiffable {
    
    let imageURL: URL
    let imageHeight: Int
    let imageWidth: Int
    let id: String
    let type: Int
    
    init(imageURL: URL, imageHeight: Int, imageWidth: Int, id: String, type: Int) {
        self.imageURL = imageURL
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.id = id
        self.type = type
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return (imageURL) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? UserFeed else { return false }
        return id == object.id
    }
}
