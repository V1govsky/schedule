CREATE TABLE Teachers(
	Teacher_ID INT Primary Key,
	Surname TEXT Not null,
	Forename TEXT Not null,
	Patronymic TEXT
);
CREATE TABLE Users(
	User_ID INT Primary Key,
	User_Name TEXT Not null,
	User_Password TEXT Not null,
	User_Role TEXT Not null
);
CREATE TABLE Lessons(
	Lesson_ID INT Primary Key,
	Lesson_Name TEXT Not null,
	Lesson_Type TEXT Not null,
	Group_Number INT Not null unique,
	Classroom INT Not null
);
CREATE TABLE Pairs(
	Pair_ID INT Primary Key,
	Pair_Number INT Not null,
	Pair_Start TIMESTAMP Not null,
	Pair_End TIMESTAMP Not null,
	CHECK (Pair_End = Pair_Start + INTERVAL '1 hour 35 minutes')
);
CREATE TABLE Schedules(
	Schedule_ID INT Primary Key,
	Teacher_ID INT,
	Lesson_ID INT,
	Pair_ID INT,
	User_ID INT,
	Week_Number INT Not null,
	Day_Of_Week INT Not null,
	CONSTRAINT fk_Teacher
		FOREIGN KEY (Teacher_ID)
		REFERENCES Teachers(Teacher_ID),
	CONSTRAINT fk_Pair
		FOREIGN KEY (Pair_ID)
		REFERENCES Pairs(Pair_ID),
	CONSTRAINT fk_User
		FOREIGN KEY (User_ID)
		REFERENCES Users(User_ID),
	CONSTRAINT fk_Lesson
		FOREIGN KEY (Lesson_ID)
		REFERENCES Lessons(Lesson_ID)
);
INSERT INTO Teachers (Teacher_ID, Surname, Forename, Patronymic)
VALUES
    (1, 'Иванов', 'Иван', 'Иванович'),
    (2, 'Петрова', 'Мария', 'Сергеевна'),
    (3, 'Сидоров', 'Алексей', 'Дмитриевич'),
    (4, 'Кузнецова', 'Елена', 'Владимировна'),
    (5, 'Смирнов', 'Дмитрий', 'Алексеевич');

-- Заполнение таблицы Users (Пользователи)
INSERT INTO Users (User_ID, User_Name, User_Password, User_Role)
VALUES
    (1, 'admin', 'admin123', 'Администратор'),
    (2, 'teacher1', 'teacherpass1', 'Преподаватель'),
    (3, 'teacher2', 'teacherpass2', 'Преподаватель'),
    (4, 'student1', 'studentpass1', 'Студент'),
    (5, 'student2', 'studentpass2', 'Студент');

-- Заполнение таблицы Lessons (Предметы)
INSERT INTO Lessons (Lesson_ID, Lesson_Name, Lesson_Type, Group_Number, Classroom)
VALUES
    (1, 'Математика', 'Лекция', 101, 201),
    (2, 'Физика', 'Практика', 102, 202),
    (3, 'Программирование', 'Лабораторная', 103, 203),
    (4, 'Базы данных', 'Лекция', 104, 204),
    (5, 'Английский язык', 'Семинар', 105, 205);

-- Заполнение таблицы Pairs (Пары)
INSERT INTO Pairs (Pair_ID, Pair_Number, Pair_Start, Pair_End)
VALUES
    (1, 1, '2024-01-15 08:00:00', '2024-01-15 09:35:00'),
    (2, 2, '2024-01-15 09:50:00', '2024-01-15 11:25:00'),
    (3, 3, '2024-01-15 11:40:00', '2024-01-15 13:15:00'),
    (4, 4, '2024-01-15 13:30:00', '2024-01-15 15:05:00'),
    (5, 5, '2024-01-15 15:20:00', '2024-01-15 16:55:00');

-- Заполнение таблицы Schedules (Расписание)
INSERT INTO Schedules (Schedule_ID, Teacher_ID, Lesson_ID, Pair_ID, User_ID, Week_Number, Day_Of_Week)
VALUES
    (1, 1, 1, 1, 2, 1, 1),  -- Понедельник, 1-я неделя
    (2, 2, 2, 2, 3, 1, 1),
    (3, 3, 3, 3, 2, 1, 2),  -- Вторник, 1-я неделя
    (4, 4, 4, 4, 3, 1, 3),  -- Среда, 1-я неделя
    (5, 5, 5, 5, 2, 1, 4);  -- Четверг, 1-я неделя