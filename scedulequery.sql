SELECT 
    CASE s.DayOfWeek 
        WHEN 1 THEN 'Понедельник'
        WHEN 2 THEN 'Вторник'
        WHEN 3 THEN 'Среда'
        WHEN 4 THEN 'Четверг'
        WHEN 5 THEN 'Пятница'
        WHEN 6 THEN 'Суббота'
        WHEN 7 THEN 'Воскресенье'
    END AS "День недели",
    p.PairNumber AS "Номер пары",
    p.PairStart AS "Начало",
    p.PairEnd AS "Конец",
    l.LessonName AS "Предмет",
    l.LessonType AS "Тип занятия",
    l.Classroom AS "Аудитория",
    CONCAT(t.Surname, ' ', t.Forename, ' ', COALESCE(t.Patronymic, '')) AS "Преподаватель",
    s.WeekNumber AS "Неделя"
FROM 
    Schedules s
JOIN 
    Pairs p ON s.Pair_ID = p.Pair_ID
JOIN 
    Lessons l ON s.Teacher_ID = l.Lessin_ID  
JOIN 
    Teachers t ON s.Teacher_ID = t.Teacher_ID
ORDER BY 
    s.WeekNumber, s.DayOfWeek, p.PairNumber;