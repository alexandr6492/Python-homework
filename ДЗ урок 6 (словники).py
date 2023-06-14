# Task 1
def find_best_and_worst_students(grades):
    best_student = None
    worst_student = None
    highest_average = 0
    lowest_average = 100

    for student, student_grades in grades.items():
        average = sum(student_grades) / len(student_grades)

        if average > highest_average:
            highest_average = average
            best_student = student

        if average < lowest_average:
            lowest_average = average
            worst_student = student

    return best_student, worst_student



grades = {
    "Bob": [8, 10, 12],
    "Steve": [6, 11, 10],
    "Jack": [9, 9, 7],
    "Tom": [10, 8, 11]
}

best_student, worst_student = find_best_and_worst_students(grades)

print("the best student:", best_student)
print("the worst student:", worst_student)



# Task 2

students = {
    "Bob": ['Python', 'Java'],
    "Jack": ['FrontEnd'],
    "Tom": ['Fullstack'],
    "Steve": ['Python', 'FrontEnd'],
    "Bill": ['Java']
}


multi_group_students = [student for student, groups in students.items() if len(groups) >= 2]


non_frontend_students = [student for student, groups in students.items() if "FrontEnd" not in groups]


python_java_students = [student for student, groups in students.items() if "Python" in groups or "Java" in groups]

print("Students who study  in 2 or more groups:", multi_group_students)
print("Students who doesnt study FrontEnd:", non_frontend_students)
print("Students who study Python or Java:", python_java_students)


#Task 3

def convert_bra_size(international_size):
    sizes = {
        "XXS": "63-65",
        "XS": "66-69",
        "S": "70-74",
        "M": "75-78",
        "L": "79-83",
        "XL": "84-89",
        "XXL": "90-94",
        "XXXL": "95-97"
    }

    if international_size in sizes:
        return sizes[international_size]
    else:
        return "Unknown size"


international_size = "L"
converted_size = convert_bra_size(international_size)

print(f"international size: {international_size}")
print(f"converted size: {converted_size}")
