

import IGListKit

final class CommentViewModel: ListDiffable {
    
    let comment_count: Int
    
    init(comment_count: Int) {
        self.comment_count = comment_count
    }
    
    // MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return "comment" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CommentViewModel else { return false }
        return comment_count == object.comment_count
    }
    
}
