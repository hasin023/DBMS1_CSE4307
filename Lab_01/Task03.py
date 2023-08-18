def QueryStudentInfo(studentInfoFile, gradesFile):
    studentID = input("Enter student ID: ")
    ShowName(studentID, studentInfoFile)
    ShowGrades(studentID, gradesFile)


def ShowName(studentID, File):
    studentInfo = open(File, "r")
    studentFound = False
    studentName = ""

    for line in studentInfo:
        if line.startswith(studentID):
            studentFound = True
            studentName = line.split(";")[1]
            break
        else:
            studentFound = False
    studentInfo.close()

    if studentFound:
        print(studentName)
    else:
        print("Student not found")


def ShowGrades(studentID, File):
    grades = open(File, "r")
    studentGrades = []
    lowestGrade = 0.0
    lowSemester = ""

    for line in grades:
        if line.startswith(studentID):
            studentGrades.append(line.split(";")[1])

    if studentGrades != []:
        for grade in studentGrades:
            lowestGrade = float(min(studentGrades))
        print("Grades: ", studentGrades)
        print("Lowest grade: ", lowestGrade)

    else:
        print("Student not found")

    grades.seek(0)
    for line in grades:
        stuID = line.split(";")[0]
        grade = float(line.split(";")[1])

        if stuID == studentID and grade == lowestGrade:
            lowSemester = line.split(";")[2]
            break

    if lowSemester != None:
        print("Semester with lowest grade: ", lowSemester)
    else:
        print("Student not found")

    grades.close()


if __name__ == "__main__":

    QueryStudentInfo("studentInfo.txt", "grades.txt")
