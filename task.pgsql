--Создaть индекс в таблице курсов

CREATE INDEX index_course_name ON courses(course_name);


-- Сгрупировать студентов по курсам и кол-во студентов

SELECT courses.course_name, count(courses_students.student_id) as student_count
FROM courses_students
JOIN courses ON courses_students.course_id = courses.id
GROUP BY courses.course_name;   

-- Сгруппировать преподавателей по количеству курсов

SELECT teachers.first_name, teachers.last_name, count(courses.id) as course_count
FROM teachers
LEFT JOIN courses ON teachers.id = courses.teacher_id
GROUP BY teachers.first_name, teachers.last_name;

-- Вытащить один курс со всеми студентами

SELECT courses.course_name, students.first_name, students.last_name
FROM courses_students
JOIN courses ON courses_students.course_id = courses.id
JOIN students ON courses_students.student_id = students.id
WHERE courses.id = 1;


-- Преподаватель с его курсами
SELECT teachers.first_name, teachers.last_name, courses.course_name
FROM teachers 
LEFT JOIN courses ON teachers.id = courses.teacher_id
WHERE teachers.id = 3;