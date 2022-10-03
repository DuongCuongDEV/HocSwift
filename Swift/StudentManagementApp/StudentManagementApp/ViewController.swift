//
//  ViewController.swift
//  StudentManagementApp
//
//  Created by blackhat on 06/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tblSearchResult: UITableView!
    @IBOutlet weak var lblSearchResult: UILabel!
    var students: [Student] = []
    var searchResults: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tblSearchResult.dataSource = self
        tblSearchResult.delegate = self
    }

    //MARK: Action search
    @IBAction func btnSearch(_ sender: UIButton) {
        if let keyword = txtSearch.text {
            searchResults = [] //Mỗi lần nhấn tìm kiếm mảng searchResults phải trả về rỗng trước không sẽ bị lưu lại kết quả cũ
            searchStudents(keyword: keyword.lowercased())
        } else {
            lblSearchResult.text = "Vui long nhap thong tin!"
        }
    }
    
    func searchStudents(keyword: String) {
        //Duyệt từng phần tử trong mảng students
        //Nếu phần tử đó có fullName tương tự từ khoá tìm kiếm hoặc id tương tự từ khoá tìm kiếm hoặc email...(vd: Nhập k-> Nguyen Kha Chuong)Thì append sinh viên đó vào mảng searchResults
        for currentStudent in students {
            if currentStudent.fullName.lowercased().contains(keyword) || currentStudent.id.lowercased().contains(keyword) || currentStudent.email.lowercased().contains(keyword) || currentStudent.phoneNumber.lowercased().contains(keyword) {
                searchResults.append(currentStudent)
            }
        }
        lblSearchResult.isHidden = false //Hiện
        lblSearchResult.text = "Tim duoc \(searchResults.count) sinh vien"
        tblSearchResult.reloadData() //Để cập nhật lại bảng
    }
    
    func initData() {
        let firstStudent = Student(id: "SV0001", fullName: "Nguyen Kha Chuong", email: "chuongnk@gmail.com", phoneNumber: "0374647306")
        let secondStudent = Student(id: "SV0002", fullName: "Nguyen Van Cuong", email: "cuongnv@gmail.com", phoneNumber: "0987654321")
        let thirdStudent = Student(id: "SV0003", fullName: "Tran Thi Thu Phuong", email: "phuongttt@gmail.com", phoneNumber: "0973456765")
        let fourthStudent = Student(id: "SV0004", fullName: "Le Van Anh", email: "chuongtrinh@gmail.com", phoneNumber: "0974622112")
        let fifthStudent = Student(id: "SV0005", fullName: "Nguyen Van Linh", email: "linhnv@gmail.com", phoneNumber: "0938421134")
        students.append(firstStudent)
        students.append(secondStudent)
        students.append(thirdStudent)
        students.append(fourthStudent)
        students.append(fifthStudent)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Nếu txtSearch rỗng thì trả về tất cả sinh viên
        if txtSearch.text!.isEmpty {
            lblSearchResult.isHidden = true //Ẩn
            return students.count
        }
        //Ngược lại chả về số phần tử trong mảng sinh viên đã tìm thấy
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSearchResult.dequeueReusableCell(withIdentifier: "cellStudentInfo")!
//        Tạo một biến gán bằng sinh viên ở vị trí đó trong mảng students
        var currentStudent = students[indexPath.row]
        //Nếu mảng searchresults có số phần tử lớn hơn 0 thì biến currentStudent bằng sinh viên ở vị trí đó trong mảng searchResults
        if searchResults.count > 0 {
          currentStudent = searchResults[indexPath.row]
        }
        let lblFullName = cell.viewWithTag(101) as! UILabel
        lblFullName.text = currentStudent.fullName
        let lblEmail = cell.viewWithTag(102) as! UILabel
        lblEmail.text = currentStudent.email
        let lblPhoneNumber = cell.viewWithTag(103) as! UILabel
        lblPhoneNumber.text = currentStudent.phoneNumber
        return cell
    }
    
}

struct Student {
    var id: String
    var fullName: String
    var email: String
    var phoneNumber: String
}


//Bài tập về nhà
//1. In đậm/đổi màu từ khoá trong kết quả tìm kiếm (attributed string) - rất nên làm được
//2. Gõ đến đâu tìm đến đấy (text field on change) - nên làm được
//3. Sắp xếp theo thứ tự (sort) - - bắt buộc phải làm được
//4. Gõ sai chính tả vẫn tìm được
//5. Tìm theo viết tắt - - bắt buộc phải làm được
//6. Tìm những kết quả liên quan
//7. Tìm nâng cao //nên làm được
//8. Lọc (Filter) kết quả tìm kiếm - bắt buộc phải làm được
//9. Lưu lịch sử keyword đã tìm - bắt buộc phải làm được
//10. Top từ khoá tìm kiếm - bắt buộc phải làm được
