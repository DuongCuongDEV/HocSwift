import UIKit



class Person{
    var id: String = ""
    var name: String = ""
    var gender: String = ""
    var phoneNumber: Int = 0
    
    
}

class Student: Person{
    var studyStatus: String = ""
    var majorID: String = ""
    var classroomID: String = ""
    var scores: [Score] = []
    
    func addScore(newScore: Score) -> Bool{
        var counter = 0
        for score in scores{
            if score.subjectID != newScore.subjectID{
                counter += 1
            }
        }
        if counter == scores.count && id == newScore.studentID{
            scores.append(newScore)
            print("ok")
            return true
        } else {
            print("khong dung sinh vien")
            return false
        }
    }
    
    func updateStudent(studentName: String, studentGender: String, studentPhone: Int, studentStatus: String, studentMajorID: String, studentClassID: String){
        if studentName != ""{
            name = "\(studentName)"
        }
        if studentGender != ""{
            gender = "\(studentGender)"
        }
        if studentPhone != 0{
            phoneNumber = studentPhone
        }
        if studentStatus != ""{
            studyStatus = "\(studentStatus)"
        }
        if studentMajorID != ""{
            majorID = "\(studentMajorID)"
        }
        if studentClassID != ""{
            classroomID = "\(studentClassID)"
        }
    }
}








class Ministry: Person{
    var Wage: Int = 0
    var teachers: [Teacher] = []
    var students: [Student] = []
    
    func addTeacher(newTeacher: Teacher)-> Bool {
        var counter = 0
        for teacher in teachers{
            if teacher.id != newTeacher.id{
                counter += 1
            }
        }
        if counter == teachers.count{
            teachers.append(newTeacher)
            return true
        } else {
            return false
        }
    }
    
    func remonveTeacher(currentTeacherID: String) -> Bool{
        for (index, teacher) in teachers.enumerated(){
            if teacher.id == currentTeacherID{
                teachers.remove(at: index)
                return true
            }
        }
        print("Khong tim thay de xoa")
        return false
    }
    
    
    
    func searchTeacher(teacherID: String, teacherName: String) {
        for teacher in teachers {
            if teacherID != "" && teacherName != "" {
                if teacher.id.lowercased() == teacherID.lowercased() && teacher.name.lowercased() == teacherName.lowercased() {
                    print("Teacher ID | Name | Gender | Phone | Department | Wage")
                    print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
                }
            } else {
                if teacher.id.lowercased() == teacherID.lowercased() || teacher.name.lowercased() == teacher.name.lowercased() {
                    print("Teacher ID | Name | Gender | Phone | Department | Wage")
                    print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
                }
            }
        }
    }
    
    func updateTeacher(teacherID: String, teacherName: String, teachergender: String, teacherPhone: Int, teacherDepartmentID: String, teacherWage: Int){
        for (index,teacher) in teachers.enumerated() {
            if teacher.id == teacherID {
                if teacherName != "" {
                    teachers[index].name = "\(teacherName)"
                }
                if teachergender != ""{
                    teachers[index].gender = "\(teachergender)"
                }
                if teacherPhone != 0{
                    teachers[index].phoneNumber = teacherPhone
                }
                if teacherDepartmentID != ""{
                    teachers[index].departmentID = "\(teacherDepartmentID)"
                }
                if teacherWage != 0{
                    teachers[index].Wage = teacherWage
                }
            }
        }
    }
    
    func displayTeachers() {
        print("Teacher ID | Name | Gender | Phone | Department | Wage")
        for teacher in teachers {
            print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
        }
    }
    
    
    
    func addStudent(newStudent: Student)-> Bool {
        var counter = 0
        for student in students{
            if student.id != newStudent.id{
                counter += 1
            }
        }
        if counter == students.count{
            students.append(newStudent)
            return true
        } else {
            print("Da ton tai")
            return false
        }
    }
    
    func remonveStudent(currentStudenID: String) -> Bool{
        for (index, student) in students.enumerated(){
            if student.id == currentStudenID{
                students.remove(at: index)
                return true
            }
        }
        print("Khong tim thay de xoa")
        return false
    }
    
    func updateStudent(studentID: String, studentName: String, studentGender: String, studentPhone: Int, studentStatus: String, studentMajorID: String, studentClassID: String){
        for (index,student) in students.enumerated() {
            if student.id == studentID {
                if studentName != ""{
                    students[index].name = "\(studentName)"
                }
                if studentGender != ""{
                    students[index].gender = "\(studentGender)"
                }
                if studentStatus != ""{
                    students[index].studyStatus = "\(studentStatus)"
                }
                if studentClassID != ""{
                    students[index].classroomID = "\(studentClassID)"
                }
                if studentMajorID != ""{
                    students[index].majorID = "\(studentMajorID)"
                }
                if studentPhone != 0{
                    students[index].phoneNumber = (studentPhone)
                }
            }
        }
    }
    
    
    func searchStudents(studentID: String, studentName: String) {
        for (index,student) in students.enumerated() {
            
            if studentID != "" && studentName != "" {
                if student.id.lowercased() == studentID.lowercased() && student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    
                    print("Student id | Name | Gender | Phone number | Status | Major | Class | Score subject | Test Score")
                    print("\(student.id) | \(student.name) | \(student.gender) | \(student.phoneNumber) | \(student.studyStatus) | \(student.majorID) | \(student.classroomID) | \(student.scores[index].scoreSubject) | \(student.scores[index].testScore) | \(student.scores[index + 1].scoreSubject) | \(student.scores[index + 1].testScore) | \(average)")
                }
            } else {
                if student.id.lowercased() == studentID.lowercased() || student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    
                    print("Student id | Name | Gender | Phone number | Status | Major | Class | Score  subject | Test Score")
                    print("\(student.id) | \(student.name) | \(student.gender) | \(student.phoneNumber) | \(student.studyStatus) | \(student.majorID) | \(student.classroomID) | \(student.scores[index].scoreSubject) | \(student.scores[index].testScore) | \(student.scores[index + 1].scoreSubject) | \(student.scores[index + 1].testScore) | \(average)")
                }
            }
        }
    }
    
    func searchScore(studentID: String, studentName: String){
        for (index,student) in students.enumerated() {
            if studentID != "" && studentName != "" {
                if student.id.lowercased() == studentID.lowercased() && student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Score CSDL | Test CSDL | Score MMT | Test MMT | Average")
                    print("    \(student.scores[index].scoreSubject)    |    \(student.scores[index].testScore)    |    \(student.scores[index + 1].scoreSubject)    |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            } else {
                if student.id.lowercased() == studentID.lowercased() || student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Score CSDL | Test CSDL | Score MMT | Test MMT | Average")
                    print("    \(student.scores[index].scoreSubject)    |    \(student.scores[index].testScore)    |    \(student.scores[index + 1].scoreSubject)    |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            }
        }
    }
    
    func displayStudents(){
        print("Student id | Name | Gender | Phone number | Status | Major | Class ")
        for student in students {
            print("\(student.id) | \(student.name) | \(student.gender) | \(student.phoneNumber) | \(student.studyStatus) | \(student.majorID) | \(student.classroomID) ")
        }
    }
}


class Teacher: Person{
    var Wage: Int = 0
    var departmentID: String = ""
    
    func updateTeacher(teacherName: String, teachergender: String, teacherPhone: Int, teacherDepartmentID: String, teacherWage: Int){
        if teacherName != "" {
            name = "\(teacherName)"
        }
        if teachergender != ""{
            gender = "\(teachergender)"
        }
        if teacherPhone != 0{
            phoneNumber = teacherPhone
        }
        if teacherDepartmentID != ""{
            departmentID = "\(teacherDepartmentID)"
        }
        if teacherWage != 0{
            Wage = teacherWage
        }
    }
}

class Classroom{
    var id: String = ""
    var name: String = ""
    var teacherID: String = ""
    var students: [Student] = []
    
    func addStudent(newStudent: Student)-> Bool {
        var counter = 0
        for student in students{
            if student.id != newStudent.id{
                counter += 1
            }
        }
        if counter == students.count{
            students.append(newStudent)
            print("Thanh cong")
            return true
        } else {
            print("Da ton tai")
            return false
        }
    }
    
    func remonveStudent(currentStudenID: String) -> Bool{
        for (index, student) in students.enumerated(){
            if student.id == currentStudenID{
                students.remove(at: index)
                print("Xoa thanh cong")
                return true
            }
        }
        print("Khong tim thay de xoa")
        return false
    }
    
    func searchStudents(studentID: String, studentName: String) {
        
        for (index,student) in students.enumerated() {
            if studentID != "" && studentName != "" {
                if student.id.lowercased() == studentID.lowercased() && student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Student id |      Name       | Gender | Phone number |  Status  | Major | Class | CSDL | Test CSDL | MMT | Test MMT | Average")
                    print("\(student.id)       | \(student.name) |   \(student.gender)  |   \(student.phoneNumber)  | \(student.studyStatus) |  \(student.majorID)  |  \(student.classroomID) |  \(student.scores[index].scoreSubject) |    \(student.scores[index].testScore)    | \(student.scores[index + 1].scoreSubject) |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            } else {
                if student.id.lowercased() == studentID.lowercased() || student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Student id |      Name       | Gender | Phone number |  Status  | Major | Class | CSDL | Test CSDL | MMT | Test MMT | Average")
                    print("\(student.id)       | \(student.name) |   \(student.gender)  |   \(student.phoneNumber)  | \(student.studyStatus) |  \(student.majorID)  |  \(student.classroomID) |  \(student.scores[index].scoreSubject) |    \(student.scores[index].testScore)    | \(student.scores[index + 1].scoreSubject) |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            }
        }
    }
    
    func searchScore(studentID: String, studentName: String){
        for (index,student) in students.enumerated() {
            if studentID != "" && studentName != "" {
                if student.id.lowercased() == studentID.lowercased() && student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Score CSDL | Test CSDL | Score MMT | Test MMT | Average")
                    print("    \(student.scores[index].scoreSubject)    |    \(student.scores[index].testScore)    |    \(student.scores[index + 1].scoreSubject)    |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            } else {
                if student.id.lowercased() == studentID.lowercased() || student.name.lowercased() == studentName.lowercased() {
                    let averageSubject1 = ((student.scores[index].scoreSubject + student.scores[index].testScore)/2)
                    let averageSubject2 = ((student.scores[index + 1].scoreSubject + student.scores[index + 1].testScore)/2)
                    let average = (averageSubject1 + averageSubject2)/2
                    print("Score CSDL | Test CSDL | Score MMT | Test MMT | Average")
                    print("    \(student.scores[index].scoreSubject)    |    \(student.scores[index].testScore)    |    \(student.scores[index + 1].scoreSubject)    |    \(student.scores[index + 1].testScore)   |  \(average)")
                }
            }
        }
    }
    
    func displayStudents(){
        print("Student id | Name | Gender | Phone number | Status | Major ")
        for student in students {
            print("\(student.id) | \(student.name) | \(student.gender) | \(student.phoneNumber) | \(student.studyStatus) | \(student.majorID) ")
        }
    }
}





class Department {//khoa
    var id: String = ""
    var name: String = ""
    var teachers: [Teacher] = []
    var majors: [Major] = []
    
    //Them sua xoa giao vien
    func addTeacher(newTeacher: Teacher)-> Bool {
        var counter = 0
        for teacher in teachers{
            if teacher.id != newTeacher.id{
                counter += 1
            }
        }
        if counter == teachers.count{
            teachers.append(newTeacher)
            return true
        } else {
            return false
        }
    }
    
    func remonveTeacher(currentTeacherID: String) -> Bool{
        for (index, teacher) in teachers.enumerated(){
            if teacher.id == currentTeacherID{
                teachers.remove(at: index)
                return true
            }
        }
        print("Khong tim thay de xoa")
        return false
    }
    
    
    
    func searchTeacher(teacherID: String, teacherName: String) {
        for teacher in teachers {
            if teacherID != "" && teacherName != "" {
                if teacher.id.lowercased() == teacherID.lowercased() && teacher.name.lowercased() == teacherName.lowercased() {
                    print("Teacher ID | Name | Gender | Phone | Department | Wage")
                    print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
                }
            } else {
                if teacher.id.lowercased() == teacherID.lowercased() || teacher.name.lowercased() == teacher.name.lowercased() {
                    print("Teacher ID | Name | Gender | Phone | Department | Wage")
                    print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
                }
            }
        }
    }
    
    func updateTeacher(teacherID: String, teacherName: String, teachergender: String, teacherPhone: Int, teacherDepartmentID: String, teacherWage: Int){
        for (index,teacher) in teachers.enumerated() {
            if teacher.id == teacherID {
                if teacherName != "" {
                    teachers[index].name = "\(teacherName)"
                }
                if teachergender != ""{
                    teachers[index].gender = "\(teachergender)"
                }
                if teacherPhone != 0{
                    teachers[index].phoneNumber = teacherPhone
                }
                if teacherDepartmentID != ""{
                    teachers[index].departmentID = "\(teacherDepartmentID)"
                }
                if teacherWage != 0{
                    teachers[index].Wage = teacherWage
                }
            }
        }
    }
    
    func displayTeachers() {
        print("Teacher ID | Name | Gender | Phone | Department | Wage")
        for teacher in teachers {
            print("\(teacher.id) | \(teacher.name) | \(teacher.gender) | \(teacher.phoneNumber) | \(teacher.departmentID) | \(teacher.Wage)")
        }
    }
    
}

class Major { //Nganh
    var id: String = ""
    var name: String = ""
    var departmentID: String = ""
    var subjects: [Subject] = []
    
}

class Semester { //Ky
    var id: String = ""
    var majorID: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var fee: Int = 0
}

class Subject{ //Mon
    var id: String = ""
    var name: String = ""
    var majorID: String = ""
    var classes: [Classroom] = []
    
    func addClass(newClass: Classroom)-> Bool {
        var counter = 0
        for classroom in classes{
            if classroom.id != newClass.id{
                counter += 1
            }
        }
        if counter == classes.count{
            classes.append(newClass)
            print("Thanh cong")
            return true
        } else {
            print("Da ton tai")
            return false
        }
    }
    
    func removeClass(currentClassID: String) -> Bool{
        for (index, classroom) in classes.enumerated(){
            if classroom.id == currentClassID{
                classes.remove(at: index)
                print("Xoa thanh cong")
                return true
            }
        }
        print("Khong tim thay de xoa")
        return false
    }
}

class Score{ //Diem
    var studentID: String = ""
    var subjectID: String = ""
    var scoreSubject: Float = 0
    var testScore: Float = 0
}




//Tao cac doi tuong
//Sinh vien
var studentCuong = Student()
studentCuong.id = "SV01"
studentCuong.name = "Duong Van Cuong"
studentCuong.gender = "Nam"
studentCuong.phoneNumber = 0823059750
studentCuong.classroomID = "CL01"
studentCuong.majorID = "N01"
studentCuong.studyStatus = "Dang hoc"

var studentLinh = Student()
studentLinh.id = "SV02"
studentLinh.name = "Nguyen Thi Linh"
studentLinh.gender = "Nu"
studentLinh.phoneNumber = 08237256352
studentLinh.classroomID = "CL01"
studentLinh.majorID = "N01"
studentLinh.studyStatus = "Bao luu"

var studentDat = Student()
studentDat.id = "SV03"
studentDat.name = "Nguyen Van Dat"
studentDat.gender = "Nam"
studentDat.phoneNumber = 08276646552
studentDat.classroomID = "CL02"
studentDat.majorID = "N01"
studentDat.studyStatus = "Dang hoc"





//Lop
var classMBk17 = Classroom()
classMBk17.id = "CL01"
classMBk17.name = "Mobile k17"
classMBk17.teacherID = "GV01"
classMBk17.students = []

var classMBk18 = Classroom()
classMBk18.id = "CL02"
classMBk18.name = "Mobile k18"
classMBk18.teacherID = "GV02"
classMBk18.students = []

//Giao vu
var ministryChi = Ministry()
ministryChi.id = "GV01"
ministryChi.name = "Hoang Thi Quy"
ministryChi.gender = "Nu"
ministryChi.phoneNumber = 0937548847
ministryChi.Wage = 10000000
ministryChi.teachers = []
ministryChi.students = []


//Giao vien
var tearcherChuong = Teacher()
tearcherChuong.id = "GV01"
tearcherChuong.name = "Nguyen Kha Chuong"
tearcherChuong.gender = "Nam"
tearcherChuong.phoneNumber = 09374874847
tearcherChuong.departmentID = "KH01"
tearcherChuong.Wage = 1000000000

var tearcherKien = Teacher()
tearcherKien.id = "GV02"
tearcherKien.name = "Duong van kien"
tearcherKien.gender = "Nam"
tearcherKien.phoneNumber = 09347783784
tearcherKien.departmentID = "KH01"
tearcherKien.Wage = 150000000

//khoa
var departmentCNTT = Department()
departmentCNTT.id = "KH01"
departmentCNTT.name = "Cong nghe thong tin"
departmentCNTT.teachers = [tearcherChuong, tearcherKien]




//Mon
var subjectCSDL = Subject()
subjectCSDL.id = "M01"
subjectCSDL.name = "Co so du lieu"
subjectCSDL.majorID = "N01"

var subjectMangMayTinh = Subject()
subjectMangMayTinh.id = "M02"
subjectMangMayTinh.name = "Mang may tinh"
subjectMangMayTinh.majorID = "N01"

var subjectHTML = Subject()
subjectHTML.id = "M03"
subjectHTML.name = "Lap trinh web"
subjectHTML.majorID = "N02"

var subjectJava = Subject()
subjectJava.id = "M04"
subjectJava.name = "Lap trinh java"
subjectJava.majorID = "N02"

//Nganh
var majorPTPM = Major()
majorPTPM.id = "N01"
majorPTPM.name = "Phat trien phan mem"
majorPTPM.departmentID = "KH01"
majorPTPM.subjects = [subjectCSDL, subjectMangMayTinh]

var majorCNTT = Major()
majorCNTT.id = "N02"
majorCNTT.name = "Cong nghe thong tin"
majorCNTT.departmentID = "KH01"
majorCNTT.subjects = [subjectHTML, subjectJava]

//ky
var semesterSummer = Semester()
semesterSummer.id = "ky1"
semesterSummer.majorID = "N01"
semesterSummer.startDate = "07/08/2022"
semesterSummer.endDate = "09/11/2022"
semesterSummer.fee = 8200000

//Diem
var scoreCSDL = Score()
scoreCSDL.studentID = "SV01"
scoreCSDL.subjectID = "M01"
scoreCSDL.scoreSubject = 8
scoreCSDL.testScore = 7

var scoreMangMayTinh = Score()
scoreMangMayTinh.studentID = "SV01"
scoreMangMayTinh.subjectID = "M02"
scoreMangMayTinh.scoreSubject = 9
scoreMangMayTinh.testScore = 7






//Hanh vi
//giao vu
ministryChi.addTeacher(newTeacher: tearcherKien)
ministryChi.addTeacher(newTeacher: tearcherChuong)
ministryChi.addStudent(newStudent: studentCuong)
ministryChi.addStudent(newStudent: studentDat)
ministryChi.addStudent(newStudent: studentLinh)

//ministryChi.updateTeacher(teacherID: "GV02", teacherName: "", teachergender: "", teacherPhone: 03635353535, teacherDepartmentID: "K03", teacherWage: 555555555)
//ministryChi.displayTeachers()
//ministryChi.updateStudent(studentID: "SV01", studentName: "", studentGender: "", studentPhone: 0999999999, studentStatus: "", studentMajorID: "", studentClassID: "CL02")
//ministryChi.displayStudents()
//
studentCuong.addScore(newScore: scoreCSDL)
studentCuong.addScore(newScore: scoreMangMayTinh)
//sinh vien

//print(studentCuong.scores[0].testScore)
//studentCuong.addScore(newScore: scoreMangMayTinh)

//lop
classMBk17.addStudent(newStudent: studentCuong)
classMBk17.addStudent(newStudent: studentDat)
classMBk17.searchScore(studentID: "sv01", studentName: "duong van cuong")
classMBk17.displayStudents()
//classMBk17.addStudent(newStudent: studentLinh)
//classMBk18.addStudent(newStudent: studentDat)
//classMBk17.displayStudents()
