<%--
  Created by IntelliJ IDEA.
  User: BelkaPC
  Date: 24.08.2014
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


<table class="sort" align="center">
    <thead>
    <tr>
        <td title="Нажмите на заголовок, чтобы отсортировать колонку" class="">ID</td>
        <td title="Нажмите на заголовок, чтобы отсортировать колонку" class="curcol"><img src="/i/1.gif" alt="">Имя</td>
        <td title="Нажмите на заголовок, чтобы отсортировать колонку">Фамилия</td>
        <td title="Нажмите на заголовок, чтобы отсортировать колонку">Сайт</td>
        <td title="Нажмите на заголовок, чтобы отсортировать колонку">Переключалка стилей</td>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>123</td>
        <td>Пол</td>
        <td>Соуден</td>
        <td><a href="/out.php?http://idontsmoke.co.uk/">idontsmoke.co.uk</a></td>
        <td>Угу</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Джеффри</td>
        <td>Зельдман</td>
        <td><a href="/out.php?http://zeldman.com/">zeldman.com</a></td>
        <td>Угу</td>
    </tr>
    <tr>
        <td>33</td>
        <td>Ден</td>
        <td>Бенджамин</td>
        <td><a href="/out.php?http://hivelogic.com/">hivelogic.com</a></td>
        <td>Угу</td>
    </tr>
    <tr>
        <td>15</td>
        <td>Даниель</td>
        <td>Боган</td>
        <td><a href="/out.php?http://waferbaby.com/">waferbaby.com</a></td>
        <td>Не-а</td>
    </tr>
    <tr>
        <td>11</td>
        <td>Глен</td>
        <td>Мерфи</td>
        <td><a href="/out.php?http://glenmurphy.com/">glenmurphy.com</a></td>
        <td>Не-а</td>
    </tr>
    <tr>
        <td>1</td>
        <td>Александр</td>
        <td>Шуркаев</td>
        <td><a href="/">htmlcssjs.ru</a></td>
        <td>Не-а</td>
    </tr>
    <tr>
        <td>44</td>
        <td>Аарон</td>
        <td>Будман</td>
        <td><a href="/out.php?http://youngpup.net/">youngpup.net</a></td>
        <td>Не-а</td>
    </tr>
    </tbody>
</table>


<script type="text/javascript">
    <!--
    /*
     originally written by paul sowden <paul@idontsmoke.co.uk> | http://idontsmoke.co.uk
     modified and localized by alexander shurkayev <alshur@ya.ru> | http://htmlcssjs.ru
     */

    var img_dir = "/i/"; // папка с картинками
    var sort_case_sensitive = false; // вид сортировки (регистрозависимый или нет)

    // ф-ция, определяющая алгоритм сортировки
    function _sort(a, b) {
        var a = a[0];
        var b = b[0];
        var _a = (a + '').replace(/,/, '.');
        var _b = (b + '').replace(/,/, '.');
        if (parseFloat(_a) && parseFloat(_b)) return sort_numbers(parseFloat(_a), parseFloat(_b));
        else if (!sort_case_sensitive) return sort_insensitive(a, b);
        else return sort_sensitive(a, b);
    }

    // ф-ция сортировки чисел
    function sort_numbers(a, b) {
        return a - b;
    }

    // ф-ция регистронезависимой сортировки
    function sort_insensitive(a, b) {
        var anew = a.toLowerCase();
        var bnew = b.toLowerCase();
        if (anew < bnew) return -1;
        if (anew > bnew) return 1;
        return 0;
    }

    // ф-ция регистрозависимой сортировки
    function sort_sensitive(a, b) {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    }

    // вспомогательная ф-ция, выдирающая из дочерних узлов весь текст
    function getConcatenedTextContent(node) {
        var _result = "";
        if (node == null) {
            return _result;
        }
        var childrens = node.childNodes;
        var i = 0;
        while (i < childrens.length) {
            var child = childrens.item(i);
            switch (child.nodeType) {
                case 1: // ELEMENT_NODE
                case 5: // ENTITY_REFERENCE_NODE
                    _result += getConcatenedTextContent(child);
                    break;
                case 3: // TEXT_NODE
                case 2: // ATTRIBUTE_NODE
                case 4: // CDATA_SECTION_NODE
                    _result += child.nodeValue;
                    break;
                case 6: // ENTITY_NODE
                case 7: // PROCESSING_INSTRUCTION_NODE
                case 8: // COMMENT_NODE
                case 9: // DOCUMENT_NODE
                case 10: // DOCUMENT_TYPE_NODE
                case 11: // DOCUMENT_FRAGMENT_NODE
                case 12: // NOTATION_NODE
                    // skip
                    break;
            }
            i++;
        }
        return _result;
    }

    // суть скрипта
    function sort(e) {
        var el = window.event ? window.event.srcElement : e.currentTarget;
        while (el.tagName.toLowerCase() != "td") el = el.parentNode;
        var a = new Array();
        var name = el.lastChild.nodeValue;
        var dad = el.parentNode;
        var table = dad.parentNode.parentNode;
        var up = table.up;
        var node, arrow, curcol;
        for (var i = 0; (node = dad.getElementsByTagName("td").item(i)); i++) {
            if (node.lastChild.nodeValue == name) {
                curcol = i;
                if (node.className == "curcol") {
                    arrow = node.firstChild;
                    table.up = Number(!up);
                } else {
                    node.className = "curcol";
                    arrow = node.insertBefore(document.createElement("img"), node.firstChild);
                    table.up = 0;
                }
                arrow.src = img_dir + table.up + ".gif";
                arrow.alt = "";
            } else {
                if (node.className == "curcol") {
                    node.className = "";
                    if (node.firstChild) node.removeChild(node.firstChild);
                }
            }
        }
        var tbody = table.getElementsByTagName("tbody").item(0);
        for (var i = 0; (node = tbody.getElementsByTagName("tr").item(i)); i++) {
            a[i] = new Array();
            a[i][0] = getConcatenedTextContent(node.getElementsByTagName("td").item(curcol));
            a[i][1] = getConcatenedTextContent(node.getElementsByTagName("td").item(1));
            a[i][2] = getConcatenedTextContent(node.getElementsByTagName("td").item(0));
            a[i][3] = node;
        }
        a.sort(_sort);
        if (table.up) a.reverse();
        for (var i = 0; i < a.length; i++) {
            tbody.appendChild(a[i][3]);
        }
    }

    // ф-ция инициализации всего процесса
    function init(e) {
        if (!document.getElementsByTagName) return;

        for (var j = 0; (thead = document.getElementsByTagName("thead").item(j)); j++) {
            var node;
            for (var i = 0; (node = thead.getElementsByTagName("td").item(i)); i++) {
                if (node.addEventListener) node.addEventListener("click", sort, false);
                else if (node.attachEvent) node.attachEvent("onclick", sort);
                node.title = "Нажмите на заголовок, чтобы отсортировать колонку";
            }
            thead.parentNode.up = 0;

            if (typeof(initial_sort_id) != "undefined") {
                td_for_event = thead.getElementsByTagName("td").item(initial_sort_id);
                if (document.createEvent) {
                    var evt = document.createEvent("MouseEvents");
                    evt.initMouseEvent("click", false, false, window, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, td_for_event);
                    td_for_event.dispatchEvent(evt);
                } else if (td_for_event.fireEvent) td_for_event.fireEvent("onclick");
                if (typeof(initial_sort_up) != "undefined" && initial_sort_up) {
                    if (td_for_event.dispatchEvent) td_for_event.dispatchEvent(evt);
                    else if (td_for_event.fireEvent) td_for_event.fireEvent("onclick");
                }
            }
        }
    }

    // запускаем ф-цию init() при возникновении события load
    var root = window.addEventListener || window.attachEvent ? window : document.addEventListener ? document : null;
    if (root) {
        if (root.addEventListener) root.addEventListener("load", init, false);
        else if (root.attachEvent) root.attachEvent("onload", init);
    }
    //-->
</script>


<iframe name="ifr-53f560f2b5e3e" onload="iframeResize(this)" frameborder="0"
        style="width: 100%; display: block; border: 1px solid black; box-sizing: border-box; height: 172px;"
        src="/files/tutorial/browser/events/grid-sort/index.html"></iframe>















































<script>
    // сортировка таблицы
    // использовать делегирование!
    // должно быть масштабируемо:
    // код работает без изменений при добавлении новых столбцов и строк

    var grid = document.getElementById('grid');

    grid.onclick = function(e) {
        var target = e && e.target || window.event.srcElement;

        if (target.tagName != 'TH') return;

        // Если TH -- сортируем
        sortGrid(target.cellIndex, target.getAttribute('data-type'));
    };

    function sortGrid(colNum, type) {
        var tbody = grid.getElementsByTagName('tbody')[0];

        // Составить массив из TR
        var rowsArray = [];
        for(var i = 0; i<tbody.children.length; i++) {
            rowsArray.push(tbody.children[i]);
        }


        // определить функцию сравнения, в зависимости от типа
        var compare;

        switch(type) {
            case 'number':
                compare = function(rowA, rowB) {
                    return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
                };
                break;
            case 'string':
                compare = function(rowA, rowB) {
                    return rowA.cells[colNum].innerHTML > rowB.cells[colNum].innerHTML ? 1 : -1;
                };
                break;
        }

        // сортировать
        rowsArray.sort(compare);

        // Убрать tbody из большого DOM документа для лучшей производительности
        grid.removeChild(tbody);


        // Убрать TR из TBODY.
        // Присваивание tbody.innerHTML = '' не работает в IE
        //
        // на самом деле без этих строк можно обойтись!
        // при добавлении appendChild все узлы будут сами перемещены на правильное место!
        while(tbody.firstChild) {
            tbody.removeChild(tbody.firstChild);
        }


        // добавить результат в нужном порядке в TBODY
        for(var i=0; i<rowsArray.length; i++) {
            tbody.appendChild(rowsArray[i]);
        }

        grid.appendChild(tbody);

    }

    // P.S. В IE7 cells, cellIndex не работают, если элемент вне документа

</script>



</body>
</html>
