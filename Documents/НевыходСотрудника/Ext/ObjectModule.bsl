﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ЗаработнаяПлата
	Движения.ЗаработнаяПлата.Записывать = Истина;
	Движение = Движения.ЗаработнаяПлата.Добавить();
	Движение.Сторно = Ложь;
	Движение.ВидРасчета = ПланыВидовРасчета.Начисления.Прогул;
	Движение.ПериодДействияНачало = ДатаНачала;
	Движение.ПериодДействияКонец = КонецДня(ДатаОкончания);
	Движение.ПериодРегистрации = Дата;
	Движение.Сотрудник = Сотрудник;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
