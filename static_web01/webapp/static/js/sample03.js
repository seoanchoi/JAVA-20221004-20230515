/* DOM */
/* DOM 객체를 선택하는 방법

id 속성의 값을 사용하여 엘리먼트 선택    -> document.getElementById          //(s가 안붙음 1개만)
name 속성의 값을 사용하여 엘리먼트 선택  -> document.getElementsByName       //(s가 붙음 0개 이상)
태그명을 사용하여 엘리먼트 선택          -> document.getElementsByTagName    //(s가 붙음 0개 이상)
class 속성의 값을 사용하여 엘리먼트 선택 -> document.getElementsByClassName  //(s가 붙음 0개 이상)

CSS의 선택자를 활용하여 엘리먼트 선택         -> document.querySelector
CSS의 선택자를 활용하여 여러개의 엘리먼트 선택 -> document.querySelectorAll

*/

function changeUpper() {
    var listItems = document.querySelectorAll(".menu-item");
    // var listItems = document.getElementsByClassName("menu-item");

    for(let item of listItems) {
        item.innerText = item.innerText.toUpperCase();
    }
}