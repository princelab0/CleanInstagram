

import IGListKit

final class CarouselViewModel: ListDiffable {
    
    let urls: [String]
    
    init(urls: [String]) {
        self.urls = urls
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "carousel" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CarouselViewModel else { return false }
        return urls == object.urls
    }
    
}
