def calculateAverageGpa(gradesFile):

    content = open(gradesFile, "r")
    lines = content.readlines()
    content.close()

    totalGpa = 0
    for line in lines:
        totalGpa += float(line.split(";")[1])
    average = "{:.2f}".format(totalGpa / len(lines))
    print("Average GPA is: ", average)


if __name__ == "__main__":
    calculateAverageGpa("grades.txt")
