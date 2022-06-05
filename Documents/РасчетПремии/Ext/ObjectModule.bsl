﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	// регистр ЗаработнаяПлата
	Движения.ЗаработнаяПлата.Записывать = Истина;
	Движение = Движения.ЗаработнаяПлата.Добавить();
	Движение.Сторно = Ложь;
	Движение.ВидРасчета = ВидРасчета;
	Движение.ПериодДействияНачало = НачалоМесяца(Дата);
	Движение.ПериодДействияКонец = КонецМесяца(Дата);
	Движение.ПериодРегистрации = Дата;
	Движение.БазовыйПериодНачало = БазовыйПериодНачало;
	Движение.БазовыйПериодКонец = КонецДня(БазовыйПериодОкончание);
	Движение.Сотрудник = Сотрудник;
	Движение.РасчетныеДанные = Процент;    
	
	Движения.Записать();

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЗаработнаяПлатаБазаЗаработнаяПлата.СуммаБаза КАК СуммаБаза,
		|	ЗаработнаяПлатаБазаЗаработнаяПлата.РасчетныеДанные КАК РасчетныеДанные
		|ИЗ
		|	РегистрРасчета.ЗаработнаяПлата.БазаЗаработнаяПлата(&Измерения, &Измерения, , Регистратор = &Ссылка) КАК ЗаработнаяПлатаБазаЗаработнаяПлата";
	
	Измерения = Новый Массив; 
	Измерения.Добавить("Сотрудник");
	
	Запрос.УстановитьПараметр("Измерения", Измерения);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	Если Не РезультатЗапроса.Пустой() Тогда
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		ВыборкаДетальныеЗаписи.Следующий();
		Премия = ВыборкаДетальныеЗаписи.СуммаБаза * ВыборкаДетальныеЗаписи.РасчетныеДанные / 100;
		Движение.Сумма = Премия;
		Движения.ЗаработнаяПлата.Записать(); 
		
		Движения.ДолгиПоЗаработнойПлате.Записывать = Истина;
		Движение = Движения.ДолгиПоЗаработнойПлате.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Сотрудник = Сотрудник;
		Движение.Сумма = Премия;

	КонецЕсли;
		
	
	КонецПроцедуры
