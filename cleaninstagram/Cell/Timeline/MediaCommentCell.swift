

import UIKit
import IGListKit
import ActiveLabel

protocol CommentCellDelegate: class {
    func didTapViewComments(cell: CommentCell)
}

final class CommentCell: UICollectionViewCell, ListBindable {
    
    weak var delegate: CommentCellDelegate?
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.textAlignment = .left
        label.sizeToFit()
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapComments = UITapGestureRecognizer(target: self, action: #selector(CommentCell.onComments))
        commentLabel.addGestureRecognizer(tapComments)
        contentView.addSubview(commentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        commentLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(4)
            make.left.equalTo(11)
        }
    }
    
    @objc func onComments() {
        delegate?.didTapViewComments(cell: self)
    }
    
    // MARK: ListBindable
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? CommentViewModel else { return }
        
        if viewModel.comment_count == 0 {
            commentLabel.text = ""
        } else if viewModel.comment_count == 1 {
            commentLabel.text = "View all 1 comment"
        } else {
            commentLabel.text = "View all " + String(viewModel.comment_count) + " comments"
        }
    }
    
}
