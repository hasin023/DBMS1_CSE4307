def INSERT_DATA(gradeInfoFile):
    studentID = str(input("Enter your Student ID: "))
    studentGPA = round(float(input("Enter GPA: ")), 2)
    semester = int(input("Enter Semester: "))

    isValid = Check_Data(studentID, studentGPA, semester)

    if isValid == False:
        print("Invalid Data")
        return
    else:
        toAppend = studentID + ";" + str(studentGPA) + ";" + str(semester)
        append_new_line(gradeInfoFile, toAppend)
        print("Data Inserted Successfully")


def append_new_line(fileName, textToAppend):
    with open(fileName, "a+") as file_object:
        file_object.seek(0)

        data = file_object.read(100)
        if len(data) > 0:
            file_object.write("\n")

        file_object.write(textToAppend)


def Check_Data(stuID, GPA, Sem):
    if GPA < 0 or GPA > 4:
        return False
    if Sem < 1 or Sem > 8:
        return False
    if len(stuID) < 2:
        return False

    return True


if __name__ == "__main__":
    INSERT_DATA("grades.txt")
