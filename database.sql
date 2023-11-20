-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: std-mysql
-- Время создания: Ноя 20 2023 г., 13:19
-- Версия сервера: 5.7.26-0ubuntu0.16.04.1
-- Версия PHP: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `std_2324_exam2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('ee53de27a485');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `year` varchar(4) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `volume` int(11) NOT NULL,
  `cover_id` varchar(100) DEFAULT NULL,
  `rating_sum` int(11) NOT NULL,
  `rating_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `name`, `description`, `year`, `publisher`, `author`, `volume`, `cover_id`, `rating_sum`, `rating_num`) VALUES
(328, 'Board society', '**Lorem ipsum dolor sit amet, consectetur adipiscing elit.** Sed feugiat mi vel risus semper rutrum. Nunc gravida, est vel gravida ornare, quam tellus luctus magna, vel lacinia velit lorem at nunc. Vestibulum eu mattis leo. Phasellus consectetur lectus id tristique malesuada. Fusce bibendum, lectus vel varius viverra, quam nulla tincidunt dolor, ac dapibus tellus sem in tellus. Sed porta et tortor in iaculis. Cras lobortis elit eget arcu lacinia, eget commodo nibh bibendum. ', '2019', 'Бобик', 'Рыба Фугу', 456, 'c40a69a2-e0b6-4611-9b8b-98d94e952664', 1, 1),
(329, 'Top material music', '*Nulla id lorem a enim luctus vulputate. Vestibulum blandit augue vitae leo elementum, a imperdiet massa egestas. Aenean gravida purus vel molestie ultricies. Sed eu vestibulum sapien, a bibendum diam. Mauris elit diam, gravida et accumsan ut, malesuada sit amet est. Maecenas condimentum justo at enim faucibus, a rhoncus libero sodales. Nam placerat, dolor in elementum posuere, turpis felis bibendum urna, vitae bibendum quam nisi eu nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. *', '2022', 'Мурик', 'Вячеслав Кит', 765, '54e3873e-91db-46d6-bea2-9f55d25f1b3f', 5, 1),
(330, 'Consectetur pharetra', '* In a facilisis metus. Sed lacinia neque sed lacus bibendum, ut ultrices massa placerat. Fusce sed efficitur purus, sit amet finibus turpis. Integer commodo fringilla lorem eget venenatis. Praesent eget mauris quis augue ultrices dapibus sit amet in odio.\n* Nam pretium ligula id odio bibendum bibendum. Duis tristique enim tellus, sit amet vehicula ante egestas vel. Donec bibendum accumsan velit, quis volutpat eros lacinia ac. Quisque venenatis sodales ex a iaculis. Duis diam massa, rutrum eu finibus ac, auctor sed velit. Morbi ultricies, magna quis rhoncus sodales, lacus elit ullamcorper ipsum, eu auctor tellus enim at diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam non arcu dui. Morbi laoreet eleifend ligula, vel feugiat nulla aliquet non. Sed accumsan tellus vel sem eleifend, eu dictum leo iaculis. ', '2023', 'Чижик', 'Никита Кирилов', 234, 'b5c2698c-0102-49ea-b4a5-5cca2c4d5b20', 8, 2),
(331, 'Африка для детей', '&gt; Ut sit amet sapien at elit consectetur pharetra. Duis maximus ut ex vitae auctor. Nunc luctus commodo tellus sed condimentum. Sed pharetra, eros id egestas tempus, orci neque laoreet est, non mollis nisl tortor non magna. Maecenas ornare leo ut leo aliquam eleifend. Sed vel facilisis mi. Nulla congue magna nec tortor ultrices, quis tincidunt dolor sagittis. Curabitur ac tortor mi. Donec accumsan risus sed est luctus euismod. Sed vitae consectetur mauris. Aenean bibendum, ligula in scelerisque cursus, sapien libero accumsan sapien, ut accumsan nibh magna vestibulum erat.', '2020', 'Слоник', 'Филипп Краммер', 890, '4935b399-b929-46d6-8527-3f4b4cd048ad', 4, 1),
(332, 'Программирование на пальцах', 'Mauris et tristique lorem, eget luctus ante. Sed a facilisis velit. Phasellus a malesuada dolor. Duis consequat enim vel accumsan malesuada. In eget justo ex. Sed imperdiet ligula quis mauris mattis accumsan. Sed non interdum magna. Praesent nec eleifend libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce euismod nulla ipsum, non tincidunt felis ullamcorper ut. In vel sem non turpis imperdiet dignissim. [Sed et augue vel enim feugiat fermentum vitae id massa.](https://giphy.com/gifs/glitter-etepvqBtmHTeo) Proin elementum libero leo, eu faucibus tortor rutrum sit amet. Aenean eleifend efficitur lacus, at porttitor ex bibendum sit amet. Morbi hendrerit viverra enim. \n\n&lt;div class=\"modal-header\"&gt;\n							&lt;h5 class=\"modal-title\" id=\"staticBackdropLabel{{ book.id }}\"&gt;Удаление книги&lt;/h5&gt;\n							&lt;button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"&gt;&lt;/button&gt;\n						&lt;/div&gt;\n						&lt;div class=\"modal-body\"&gt;\n							&lt;p&gt;Вы уверены, что хотите удалить книгу &lt;span id=\"bookName{{ book.id }}\"&gt;\"{{ book.name\n									}}\"&lt;/span&gt;?&lt;/p&gt;\n							&lt;form id=\"deleteBookForm{{ book.id }}\" class=\"d-none\"\n								action=\"{{ url_for(\'books.delete_book\', book_id=book.id) }}\" method=\"POST\"&gt;\n								&lt;input type=\"submit\" id=\"deleteUserButton{{ book.id }}\"&gt;\n							&lt;/form&gt;\n						&lt;/div&gt;\n						&lt;div class=\"modal-footer\"&gt;\n							&lt;button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\"&gt;Отмена&lt;/button&gt;\n							&lt;label for=\"deleteUserButton{{ book.id }}\" class=\"btn btn-danger\"&gt;Удалить&lt;/label&gt;\n						&lt;/div&gt;', '2017', 'Красный октябрь', 'Николай Петров', 1465, 'e698e645-4384-4838-aada-ac979a5b8a8e', 5, 1),
(333, 'Пирожки и котики', 'Fusce condimentum, augue ac commodo bibendum, nisi enim convallis lorem, sit amet bibendum nulla mi eget purus. Suspendisse potenti. Nulla laoreet posuere magna, eu dictum dui euismod quis. Nam ac est pretium, facilisis nisi et, fringilla ex. Fusce vulputate mauris nisl, quis tempus velit lobortis ac. Maecenas varius ipsum eu nisi ullamcorper pretium. Sed consequat auctor lorem, ac venenatis nibh aliquam vitae. Curabitur varius, mi et lacinia commodo, ipsum urna vestibulum sapien, eu elementum massa felis id sapien. Nam vitae tellus non magna volutpat rhoncus. Donec mattis enim erat, vitae posuere leo tristique vel. \n\n1. Aliquam vel gravida nisi. Maecenas nec ante purus. Suspendisse tempor iaculis orci, non posuere dolor cursus quis. In luctus ac lacus feugiat egestas.\n2. Praesent posuere malesuada purus, in dapibus lorem bibendum id. Nam pharetra felis non interdum varius.\n3. Vestibulum fermentum, augue vel consequat pellentesque, lorem lectus blandit velit, vel porta ipsum nisl vitae velit.\n4. Duis ullamcorper volutpat tortor, id auctor libero. Ut eu turpis nec eros laoreet egestas consectetur vel velit.', '2014', 'Рококо ', 'Александр Басков', 653, '149bfb3a-1680-4ef0-ab58-f237a79f8c00', 1, 1),
(334, 'Цели и методы', '**Lorem ipsum dolor sit amet, consectetur adipiscing elit.**  \n* Mauris facilisis velit non ex tempor, a pulvinar sapien pretium.  \n* Sed eget iaculis sapien. Proin vel nulla libero.  \n* Nulla euismod, tortor vitae tristique malesuada, odio quam vehicula ipsum, nec lacinia sem lectus et purus.  \n* Fusce et ante non libero facilisis tincidunt non ut massa.  \n* Duis sagittis mollis risus, quis bibendum tellus consequat et.  \n* Aliquam erat volutpat. Nulla pretium id ipsum et rhoncus.  \n* Suspendisse ut turpis nec eros tincidunt consequat.  \n* Nunc laoreet sagittis dolor at pretium.  ', '2016', 'Спуффик', 'Фрэнк Лафли ', 623, '9c4551ac-5844-4d26-9af6-5d730187ad8d', 4, 2),
(335, 'Розовая мечта', '* Sed ornare euismod mauris, quis facilisis lorem porta eu. Sed lacinia tristique ex, at condimentum risus semper quis. Vivamus ac nulla eget nulla rhoncus dignissim. Cras vel augue odio. Duis auctor pellentesque ligula a faucibus. Sed egestas tincidunt efficitur. \n* Mauris et tristique lorem, eget luctus ante. Sed a facilisis velit. Phasellus a malesuada dolor. Duis consequat enim vel accumsan malesuada. In eget justo ex. Sed imperdiet ligula quis mauris mattis accumsan.', '2021', 'Фрэк', 'Эмилия Берг', 762, '043eb006-5c36-438a-8656-c5e8bc9d5155', 5, 1),
(336, 'Лолита', 'Phasellus a malesuada dolor. Duis consequat enim vel accumsan malesuada. In eget justo ex. Sed imperdiet ligula quis mauris mattis accumsan. Sed non interdum magna. Praesent nec eleifend libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce euismod nulla ipsum, non tincidunt felis ullamcorper ut. In vel sem non turpis imperdiet dignissim. Maecenas varius ipsum eu nisi ullamcorper pretium. Sed consequat auctor lorem, ac venenatis nibh aliquam vitae. Curabitur varius, mi et lacinia commodo, ipsum urna vestibulum sapien, eu elementum massa felis id sapien. Nam vitae tellus non magna volutpat rhoncus. Donec mattis enim erat, vitae posuere leo tristique vel. Proin vel nulla libero. Nulla euismod, tortor vitae tristique malesuada, odio quam vehicula ipsum, nec lacinia sem lectus et purus. Fusce et ante non libero facilisis tincidunt non ut massa. Duis sagittis mollis risus, quis bibendum tellus consequat et. Aliquam erat volutpat. Nulla pretium id ipsum et rhoncus. Suspendisse ut turpis nec eros tincidunt consequat. Nunc laoreet sagittis dolor at pretium. Vivamus elementum dolor dui, eget molestie velit faucibus a.  \n**Duis eu leo convallis, posuere leo et, sodales lectus.**', '2013', 'Мечта', 'Алексей Ярмак', 872, 'd3e9580c-d2d3-42fb-b34b-5da1ac4c7e09', 8, 2),
(337, 'Пеллентийский обитатель', 'Мы знаем, что такое скорбь, сидим вместе, создаем нашу элиту. Сиди смирно и читай лекции о достоинстве ЕС. Будь таким же разумным. Крас ауктор, масса участников в конечном итоге, ipsum urna ultricies elit, в ullamcorper risus lorem сидит аметист разумный. Сед фрингилла семпер тортор, сиди амет элейфенд ниси элементум ас. Донец ас ми ми. Morbi feugiat corper ipsum, не межзубная связка, например. Пройди курс, пройди курс до начала фрингильи. Высокая эффективность в августе, высокая эффективность в мае, а также бледность сем лацинии.\n\n&gt; Пеллентийский обитатель морби тристик сенектус, нетус и малесуада прославляется как турпис эгестас. Аликвам хусто Маурис, содалес и лорем вел, тристик меж разумных. Этиам темпус тристик пурус, молестиам квам кондимент ут. Крас-ный междумирный квам. Презент ут лорем кондиментум, рутрум элит сит амет, бландит лорем. Аликвам сед велит вести себя соответственно. Sed bibendum risus dui, в iaculis orci tincidunt id. Sed finibus venenatis nisl, в вульпутате nisl egestas sed.\n', '2020', 'Вариус', 'Николай Абрамов', 1245, 'aeb315c9-e896-45cd-abcc-13a1816ecbfe', 0, 0),
(338, 'Duis consequat enim vel', 'Morbi feugiat lacinia mi, quis maximus lectus. Не стоит сидеть сложа руки, пока не наступит подходящий момент, облегчающий жизнь. Сделай ронкус пурус пурус, сядь на элементум урны или стань куратором, например, аликвам лект, согласно великому изречению. Сед лаореет консектетур ми в Лацинии. Донец элейфенд молести Морис, временная биография мужчины. Будь то ЕС или мод Морис, это облегчит доступ к портам ЕС. Съешьте lacinia tristique ex, в качестве приправы к рису, только что приготовленному.  \n*Да здравствует нулла, пусть будет нулла ронкус достойный. Красовался в августе один раз. Это ауктор пеллентесковой связки, а не фаусибус. Сед эгестас тинцидунт эффективен.*\n\nМорис и тристик лорем, например, были известны раньше. Создать благоприятный климат. Фазеллус - это мужская печаль. Это следствие того, что эним вель накапливает малесуаду. В eget justo ex. Сэд властен над лигулой, которая принадлежит Маурису Маттису Аккумсану. Sed non interdum magna. Это необходимо для того, чтобы освободить либеро. Пеллентийский обитатель морби тристик сенектус, нетус и малесуада прославляется как турпис эгестас. Все, что касается ЕС, является нулевой суммой, не имеющей отношения к фелису улламкорперу. В самом деле, не турпис обладает достоинством. Сед и август были хорошими днями для ферментации жизненной силы и массы. Проин элементум либеро Лео, главный судья ЕС рутрум сит амет. Энейский элейфенд, эффект лакуса, в портрете бывшего бибендума сидит амет. Морби хендрерит виверра эним.', '2023', 'Фенкис', 'Мирон Шагуян', 709, 'eeec90dc-580a-467a-b3da-2859d7666135', 4, 1),
(339, 'Политической культуры', 'В частности, глубокий уровень погружения создаёт необходимость включения в производственный план целого ряда внеочередных мероприятий с учётом комплекса своевременного выполнения сверхзадачи. Кстати, независимые государства формируют глобальную экономическую сеть и при этом — смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Равным образом, высокое качество позиционных исследований однозначно определяет каждого участника **как способного принимать собственные решения** касаемо новых предложений. В рамках спецификации современных стандартов, сделанные на базе интернет-аналитики выводы призывают нас к новым свершениям, которые, в свою очередь, должны быть в равной степени предоставлены сами себе. Приятно, граждане, наблюдать, как элементы политического процесса, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут объявлены нарушающими общечеловеческие нормы этики и морали.', '2022', 'Феникс', 'Василий Арутюнян', 534, '2061480d-6399-4a9f-ba03-bc932e544fe5', 3, 1),
(340, 'Невероятные приключения Джо', 'Ясность нашей позиции очевидна: понимание сути ресурсосберегающих технологий является качественно *новой ступенью существующих финансовых и административных условий*. Также как существующая теория требует анализа поставленных обществом задач.  \n  \nВ целом, конечно, сложившаяся структура организации способствует повышению качества анализа существующих паттернов поведения. Банальные, но неопровержимые выводы, а также многие известные личности ассоциативно распределены по отраслям.  \n  \nЯвляясь всего лишь частью общей картины, явные признаки победы институционализации являются только методом политического участия и превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. Есть над чем задуматься: диаграммы связей, вне зависимости от их уровня, должны быть рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок. В целом, конечно, курс на социально-ориентированный национальный проект создаёт предпосылки для экспериментов, поражающих по своей масштабности и грандиозности. Также как постоянный количественный рост и сфера нашей активности способствует повышению качества модели **развития.**  ', '2018', 'Фундук', 'Михаил Архипов', 1564, 'b1629a5b-2222-4775-89ed-895f332af10c', 5, 1),
(341, 'Гамлет', 'А ещё акционеры крупнейших компаний разоблачены. Как принято считать, непосредственные участники технического прогресса смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Таким образом, социально-экономическое развитие предопределяет высокую востребованность позиций, занимаемых участниками в отношении поставленных задач. Являясь всего лишь частью общей картины, многие известные личности неоднозначны и будут разоблачены. Противоположная точка зрения подразумевает, что реплицированные с зарубежных источников, современные исследования указаны как претенденты на роль ключевых факторов. В рамках спецификации современных стандартов, независимые государства формируют глобальную экономическую сеть и при этом — превращены в посмешище, хотя само их существование приносит несомненную пользу обществу.\n\n*Есть над чем задуматься: диаграммы связей разоблачены. В частности, постоянный количественный рост и сфера нашей активности требует анализа благоприятных перспектив.*', '2023', 'Акт', 'Вильям Шекспир', 1896, 'ca21131d-54cf-4cdb-920c-7cf978bedd60', 4, 1),
(342, 'Lord of the Flies', '**Равным образом, экономическая повестка сегодняшнего дня влечет за собой процесс внедрения и модернизации направлений прогрессивного развития. Современные технологии достигли такого уровня, что постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании переосмысления внешнеэкономических политик. С другой стороны, семантический разбор внешних противодействий обеспечивает широкому кругу (специалистов) участие в формировании экспериментов, поражающих по своей масштабности и грандиозности!**\n\nДля современного мира глубокий уровень погружения обеспечивает актуальность инновационных методов управления процессами. Но граница обучения кадров способствует подготовке и реализации дальнейших направлений развития. Ясность нашей позиции очевидна: синтетическое тестирование играет важную роль в формировании поставленных обществом задач. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: разбавленное изрядной долей эмпатии, рациональное мышление требует определения и уточнения распределения внутренних резервов и ресурсов. Прежде всего, граница обучения кадров позволяет выполнить важные задания по разработке системы обучения кадров, соответствующей насущным потребностям. Внезапно, активно развивающиеся страны третьего мира в равной степени предоставлены сами себе.', '1999', 'Издательство Грю', 'Вильям Голонг', 1563, '2ccd5908-cb76-4ca7-a2cc-0e623d2d70b1', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `books_genres`
--

CREATE TABLE `books_genres` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books_genres`
--

INSERT INTO `books_genres` (`book_id`, `genre_id`) VALUES
(331, 1),
(340, 1),
(332, 2),
(334, 2),
(337, 2),
(341, 2),
(342, 2),
(329, 3),
(330, 3),
(335, 3),
(336, 3),
(340, 3),
(342, 3),
(330, 4),
(333, 4),
(334, 4),
(337, 4),
(338, 4),
(328, 5),
(331, 5),
(336, 5),
(339, 5),
(340, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(2, 'Детектив'),
(4, 'Классика'),
(5, 'Приключения'),
(3, 'Роман'),
(1, 'Фантастика');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `file_name`, `mime_type`, `md5_hash`) VALUES
('043eb006-5c36-438a-8656-c5e8bc9d5155', '23177ed9ca9388c3b0b51181a0f5b61f--poster-graphic-design-print-design.jpg', 'image/jpeg', 'f8c11e27fbb309897681784bd0255b36'),
('149bfb3a-1680-4ef0-ab58-f237a79f8c00', 'Book_cover_template_design.jpg', 'image/jpeg', 'cabb8366c4aa83833df135118274e5aa'),
('2061480d-6399-4a9f-ba03-bc932e544fe5', '8d5dbb820b6d145cb72fc1bf27c11278.jpg', 'image/jpeg', '7e479629eade92b749e90a42f7f231ad'),
('2ccd5908-cb76-4ca7-a2cc-0e623d2d70b1', '954f8d9292741.560cc07e53ccf.jpg', 'image/jpeg', '0e73e9ca10c18e794e676210ba85ecb8'),
('40f9f86f-7581-4612-9eb7-afe0bd89d336', '1644827508_14-krot-info-p-nezhnie-foni-16.png', 'image/png', '05c312a28eb0030f273939d6481a9234'),
('4935b399-b929-46d6-8527-3f4b4cd048ad', 'World_wildlife_book_cover_3.jpg', 'image/jpeg', 'bdeceda3f63dc36ad9d856daf95f8e5c'),
('54e3873e-91db-46d6-bea2-9f55d25f1b3f', '5151818.jpg', 'image/jpeg', '1ef3f08a4ff99d9316634abd3190afce'),
('9c4551ac-5844-4d26-9af6-5d730187ad8d', '7492664.jpg', 'image/jpeg', '8f4b2bb38ed7f287dad2b7f617c78265'),
('aeb315c9-e896-45cd-abcc-13a1816ecbfe', 'Free-Open-Hardcover-Book-Mockup-PSD-File.jpg', 'image/jpeg', '682b55bc18579bb56384b1b8bbd014d3'),
('b1629a5b-2222-4775-89ed-895f332af10c', '7570881794e9f5ebc2e06a6604663481--book-cover-design-book-series-design.jpg', 'image/jpeg', '663487d8e0150ad956460b82b0c64918'),
('b5c2698c-0102-49ea-b4a5-5cca2c4d5b20', 'Blue_wavy_book_cover.jpg', 'image/jpeg', '08d7537d8fea0eb0915870c64147e3c7'),
('c40a69a2-e0b6-4611-9b8b-98d94e952664', '4743236.jpg', 'image/jpeg', '6d0589f9a38f62ae755d9328cb006bb7'),
('ca21131d-54cf-4cdb-920c-7cf978bedd60', '54223b722ae8d196a2818d1962531985.jpg', 'image/jpeg', 'd48d435c22a474b760149e4d550657e3'),
('d3e9580c-d2d3-42fb-b34b-5da1ac4c7e09', 'Fourteen-Books-to-Love5.jpg', 'image/jpeg', 'abd64ea8636d9ae01124dd0cf20c0ead'),
('e698e645-4384-4838-aada-ac979a5b8a8e', 'Modern_Vector_abstract_book_cover_template_with_teared_paper_02.jpg', 'image/jpeg', '35126e11b593ed9306d3fc8d270a3495'),
('ebf70fca-bfd0-4989-9a6c-18007a6d741d', '6a62cd6746c803f5f2d6983b657b2c77.jpg', 'image/jpeg', '9390b7093301c669c3ce5cc8090488ab'),
('eeec90dc-580a-467a-b3da-2859d7666135', 'qwerty.jpg', 'image/jpeg', '3ec9c15126bc24acdcbc70da24763b50');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `book_id`, `user_id`, `rating`, `text`, `date_created`, `status_id`) VALUES
(39, 330, 3, 3, '<p>Лишь действия представителей оппозиции являются только методом политического участия и объективно рассмотрены соответствующими инстанциями! Предварительные выводы неутешительны: граница обучения кадров в значительной степени обусловливает важность кластеризации усилий. Сложно сказать, почему акционеры крупнейших компаний рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок. Каждый из нас понимает очевидную вещь: экономическая повестка сегодняшнего дня однозначно фиксирует необходимость как самодостаточных, так и внешне зависимых концептуальных решений! Безусловно, <strong>убеждённость некоторых оппонентов требует анализа</strong> как самодостаточных, так и внешне зависимых концептуальных решений.</p>', '2023-06-26 04:34:47', 2),
(40, 329, 3, 5, 'Приятно, граждане, наблюдать, как непосредственные участники технического прогресса и по сей день остаются уделом либералов, которые жаждут быть функционально разнесены на независимые элементы. Задача организации, в особенности же семантический разбор внешних противодействий предоставляет широкие возможности для дальнейших направлений развития. Господа, реализация намеченных плановых заданий в значительной степени обусловливает важность первоочередных требований. Прежде всего, разбавленное изрядной долей эмпатии, рациональное мышление в значительной степени обусловливает важность новых предложений. Каждый из нас понимает очевидную вещь: базовый вектор развития создаёт предпосылки для соответствующих условий активизации.', '2023-06-26 05:27:31', 1),
(41, 338, 3, 4, '<p>Также как укрепление и развитие внутренней структуры создаёт предпосылки для поэтапного и последовательного развития общества. Значимость этих проблем настолько очевидна, что реализация намеченных плановых заданий является качественно новой ступенью новых предложений. Противоположная точка зрения подразумевает, что действия представителей оппозиции могут быть призваны к ответу. Имеется спорная точка зрения, гласящая примерно следующее: ключевые особенности структуры проекта и по сей день остаются уделом либералов, которые жаждут быть описаны максимально подробно. Прежде всего, дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании поэтапного и последовательного развития общества.</p>', '2023-06-26 05:54:08', 2),
(42, 339, 3, 3, '<ul>\n<li>Как принято считать, непосредственные участники технического прогресса лишь добавляют фракционных разногласий и описаны максимально подробно. Задача организации, в особенности же сплочённость команды профессионалов создаёт необходимость включения в производственный план целого ряда внеочередных мероприятий с учётом комплекса стандартных подходов. Каждый из нас понимает очевидную вещь: высокотехнологичная концепция общественного уклада позволяет выполнить важные задания по разработке новых предложений.</li>\n<li>И нет сомнений, что стремящиеся вытеснить традиционное производство, нанотехнологии лишь добавляют фракционных разногласий и объявлены нарушающими общечеловеческие нормы этики и морали. А ещё элементы политического процесса набирают популярность среди определенных слоев населения, а значит, должны быть превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. В частности, курс на социально-ориентированный национальный проект говорит о возможностях соответствующих условий активизации.</li>\n</ul>', '2023-06-26 05:56:26', 2),
(43, 335, 3, 5, '1. Равным образом, укрепление и развитие внутренней структуры предполагает независимые способы реализации переосмысления внешнеэкономических политик. Приятно, граждане, наблюдать, как независимые государства могут быть призваны к ответу. Приятно, граждане, наблюдать, как сделанные на базе интернет-аналитики выводы формируют глобальную экономическую сеть и при этом — обнародованы.\n2. Следует отметить, что высокотехнологичная концепция общественного уклада создаёт предпосылки для укрепления моральных ценностей.\n3. Ясность нашей позиции очевидна: базовый вектор развития предопределяет высокую востребованность соответствующих условий активизации.\n4. Приятно, граждане, наблюдать, как сторонники тоталитаризма в науке представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть ограничены исключительно образом мышления.', '2023-06-26 05:57:04', 1),
(44, 331, 3, 4, '<p>Но <strong>внедрение современных методик однозначно фиксирует необходимость приоретизации разума над эмоциями.</strong> Но многие известные личности своевременно верифицированы. Банальные, но неопровержимые выводы, а также предприниматели в сети интернет ограничены исключительно образом мышления. Разнообразный и богатый опыт говорит нам, что выбранный нами инновационный путь не даёт нам иного выбора, кроме определения укрепления моральных ценностей. Предварительные выводы неутешительны: базовый вектор развития позволяет оценить значение анализа существующих паттернов поведения. Повседневная практика показывает, что семантический разбор внешних противодействий, в своём классическом представлении, допускает внедрение вывода текущих активов.</p>', '2023-06-26 05:57:34', 3),
(45, 328, 3, 1, '&gt; Предварительные выводы неутешительны: экономическая повестка сегодняшнего дня позволяет оценить значение благоприятных перспектив. Задача организации, в особенности же высокое качество позиционных исследований представляет собой интересный эксперимент проверки дальнейших направлений развития! Являясь всего лишь частью общей картины, базовые сценарии поведения пользователей могут быть представлены в исключительно положительном свете. Учитывая ключевые сценарии поведения, реализация намеченных плановых заданий обеспечивает актуальность прогресса профессионального сообщества. Как уже неоднократно упомянуто, акционеры крупнейших компаний, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут ассоциативно распределены по отраслям. Каждый из нас понимает очевидную вещь: начало повседневной работы по формированию позиции говорит о возможностях как самодостаточных, так и внешне зависимых концептуальных решений. А ещё некоторые особенности внутренней политики представлены в исключительно положительном свете.', '2023-06-26 05:58:06', 1),
(46, 332, 3, 5, '<p>Безусловно, повышение уровня гражданского сознания представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. В своём стремлении повысить качество жизни, они забывают, что убеждённость некоторых оппонентов обеспечивает актуальность позиций, занимаемых участниками в отношении поставленных задач. Задача организации, в особенности же экономическая повестка сегодняшнего дня не оставляет шанса для как самодостаточных, так и внешне зависимых концептуальных решений. Следует отметить, что высокотехнологичная концепция общественного уклада не оставляет шанса для инновационных методов управления процессами. Для современного мира повышение уровня гражданского сознания в значительной степени обусловливает важность направлений прогрессивного развития. В своём стремлении повысить качество жизни, они забывают, что существующая теория требует от нас анализа кластеризации усилий. Сложно сказать, почему стремящиеся вытеснить традиционное производство, нанотехнологии призывают нас к новым свершениям, которые, в свою очередь, должны быть описаны максимально подробно.</p>', '2023-06-26 05:58:52', 2),
(48, 336, 3, 4, '<p>Для современного мира современная методология разработки обеспечивает широкому кругу (специалистов) участие в формировании инновационных методов управления процессами. Но интерактивные прототипы и по сей день остаются уделом либералов, которые жаждут быть преданы социально-демократической анафеме. Каждый из нас понимает очевидную вещь: перспективное планирование играет определяющее значение для новых принципов формирования материально-технической и кадровой базы. Но сложившаяся структура организации играет определяющее значение для новых предложений.  </p>\n<pre><code>&lt;a href=\"{{ url_for(\'books.show_book\', book_id=book.id) }}\"&gt;Просмотр&lt;/a&gt;\n        {# endif #}\n        {%if current_user.is_authenticated and current_user.can(\'edit_book\', user) %}\n        &lt;a href=\"{{ url_for(\'books.edit_book\', book_id=book.id) }}\"&gt;Редактирование&lt;/a&gt;\n        {% endif %}\n        {% if current_user.is_authenticated and current_user.can(\'delete_book\', user) %}\n        &amp;lt;button class=\"btn btn-danger\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteBook{{ book.id }}\"&amp;gt;\n            Удалить&amp;lt;/button&amp;gt;\n</code></pre>', '2023-06-26 06:03:49', 2),
(49, 333, 3, 1, '<p><em>Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции говорит о возможностях прогресса профессионального сообщества. Мы вынуждены отталкиваться от того, что современная методология разработки говорит о возможностях благоприятных перспектив. А ещё активно развивающиеся страны третьего мира, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут объединены в целые кластеры себе подобных. Банальные, но неопровержимые выводы, а также предприниматели в сети интернет объективно рассмотрены соответствующими инстанциями.</em></p>', '2023-06-26 06:05:28', 2),
(51, 334, 3, 1, '<p><strong>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</strong></p>', '2023-06-26 06:11:23', 2),
(53, 340, 3, 5, 'Ясность нашей позиции очевидна: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Принимая во внимание показатели успешности, сплочённость команды профессионалов, в своём классическом представлении, допускает внедрение первоочередных требований! Мы вынуждены отталкиваться от того, что повышение уровня гражданского сознания, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для направлений прогрессивного развития. Ясность нашей позиции очевидна: постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнить важные задания по разработке дальнейших направлений развития. Также как перспективное планирование, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для стандартных подходов. Мы вынуждены отталкиваться от того, что постоянное информационно-пропагандистское обеспечение нашей деятельности требует анализа поэтапного и последовательного развития общества.\n\nБезусловно, постоянный количественный рост и сфера нашей активности представляет собой интересный эксперимент проверки направлений прогрессивного развития. Наше дело не так однозначно, как может показаться: курс на социально-ориентированный национальный проект, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для позиций, занимаемых участниками в отношении поставленных задач. Для современного мира перспективное планирование играет важную роль в формировании системы обучения кадров, соответствующей насущным потребностям.', '2023-06-26 13:30:43', 1),
(54, 330, 1, 5, '5', '2023-11-20 15:29:25', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `review_statuses`
--

CREATE TABLE `review_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `review_statuses`
--

INSERT INTO `review_statuses` (`id`, `name`) VALUES
(1, 'На рассмотрении'),
(2, 'Одобрено'),
(3, 'Отклонено');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `desc`) VALUES
(1, 'Администратор', 'Суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг.'),
(2, 'Модератор', 'Может редактировать данные книг.'),
(3, 'Пользователь', 'Может оставлять рецензии.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password_hash`, `last_name`, `first_name`, `middle_name`, `role_id`) VALUES
(1, 'user1', 'pbkdf2:sha256:260000$y8ZYQdNf7LvytLpG$6ecde87639ebde2cc41ac30367a423d731c7f5b0f42929826b2a8b3a78ff4666', 'Кучер', 'Илья', 'Олегович', 1),
(2, 'user2', 'pbkdf2:sha256:260000$DOXukXajO7oNGzEg$ed506ea567b33fbb9ada11db56e954d132449f2882e9f9e34d1297aeacc13332', 'Поздеева', 'Полина', 'Андреевна', 2),
(3, 'user3', 'pbkdf2:sha256:260000$LgtTT7Mrl74gVLlX$47afdcf236d55519519a9eafb9ffb7f1c33ec04212b02aa81279793e1df3f8ac', 'Колесник', 'Никита', 'Сергеевич', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_books_cover_id_images` (`cover_id`);

--
-- Индексы таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD PRIMARY KEY (`book_id`,`genre_id`),
  ADD KEY `fk_books_genres_genre_id_genres` (`genre_id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_genres_name` (`name`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_images_md5_hash` (`md5_hash`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reviews_book_id_books` (`book_id`),
  ADD KEY `fk_reviews_user_id_users` (`user_id`),
  ADD KEY `fk_reviews_status_id_review_statuses` (`status_id`);

--
-- Индексы таблицы `review_statuses`
--
ALTER TABLE `review_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_review_statuses_name` (`name`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_roles_name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_login` (`login`),
  ADD KEY `fk_users_role_id_roles` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `review_statuses`
--
ALTER TABLE `review_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_cover_id_images` FOREIGN KEY (`cover_id`) REFERENCES `images` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `fk_books_genres_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_books_genres_genre_id_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reviews_status_id_review_statuses` FOREIGN KEY (`status_id`) REFERENCES `review_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reviews_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
