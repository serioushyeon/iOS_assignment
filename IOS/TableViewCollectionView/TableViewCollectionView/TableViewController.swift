//
//  ViewController.swift
//  TableViewCollectionView
//
//  Created by jin on 5/22/24.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let cities: [City] = TableViewCollectionView.load("cityData.json")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityTableView.dataSource = self
        cityTableView.delegate = self
        
        cityTableView.selectRow(at: IndexPath(row: 9, section: 0), animated: true, scrollPosition: .top)
        descriptionLabel.text = cities[9].description
    }
}
extension TableViewController: UITableViewDataSource{
    // 이 함수는 Option이다. 구현하지 않으면 섹션이 1이다.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1의 섹션만 한다.
    }
    // 각 섹션에 대하여 몇개의 행을 가진것인가. 섹션이 하나이므로 한번만 호출된다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count // 도시의 갯수를 리턴
    }
    // 각 섹션의 row에 해당하는 UITableViewCell를 만들어 달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()// contentView와 [accessaryType or accessoryView]로 구성
        // 표시한 UIView들을 생성한다.
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.text = cities[indexPath.row].name + "\nin " + cities[indexPath.row].country
        let imageView = UIImageView(image: cities[indexPath.row].uiImage(size: CGSize(width: 200, height: 150)))
        var outer = UIStackView(arrangedSubviews: [imageView, nameLabel])
        outer.spacing = 10
        cell.contentView.addSubview(outer)
        outer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outer.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            outer.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            outer.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            outer.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 2),
        ])
        return cell
    }
}
extension TableViewController: UITableViewDelegate{
    // 특정 row를 클릭하면 이 함수가 호출된다
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 도시의 내용이 출력되도록 한다
        descriptionLabel.text = cities[indexPath.row].description
    }
}
