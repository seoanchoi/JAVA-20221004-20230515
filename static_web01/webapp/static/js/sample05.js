/* 
    document.getElementsByTagName 등과 같은 메서드를 사용하여 특정한 하나의 엘리먼트를 선택해
    부모, 형제 관계에 해당하는 엘리먼트에 접근하는 방법

    자식에게 접근
        .getElementsByTagName 과 같은 메서드를 다시 사용하여 접근
        .firstElementChild / .lastElementChild 속성을 사용하여 접근

    부모에게 접근
        .parentElement 속성을 사용하여 접근

    형제 관계 접근
        .previousElementSibling / .nextElementSibling 속성을 사용하여 접근 
*/

function counting(element) {
    /* 조회수에 해당하는 값을 tr 태그 영역을 클릭할 때마다 +1 하도록 합니다. */
    var cnt = Number(element.lasteElementCHild.innerText);
    element.lasteElementCHild.innerText = cnt +1;
}


