
import IGListKit

final class CaptionViewModel: ListDiffable {
    
    let username: String
    let text: String
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "caption" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CaptionViewModel else { return false }
        return username == object.username
            && text == object.text
    }
}
