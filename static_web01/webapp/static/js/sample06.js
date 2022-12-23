/* 
document.createElement("tagName"): 엘리먼트 객체 생성

부모 엘리먼트를 기준으로 자식 엘리먼트로 추가
    부모.prepend(추가할 엘리먼트): 첫번째 자식으로 추가
    부모.append(추가할 엘리먼트): 마지막 자식으로 추가

    형제 엘리먼트를 기준으로 같은 형제 엘리먼트로 추가
    형제.before(추가할 엘리먼트)  : 형제 앞에 추가 
    형제.after(추가할 엘리먼트)   : 형제 뒤에 추가

 */
/* function addItem() {
     목록을 추가하는 함수
    var item = element.previousElementSibling.value;

    var li = document.createElement("li");
    li.innerText = item;

    var list = document.getElementById("list");
    list.append(li);

    element.previousElementSibling.value = ""; 
} */

function addItem(form) {
    /* 목록을 추가하는 함수 */ //this.form
    var item = form.item.value;

    var li = document.createElement("li");
    li.innerText = item;

    var list = document.getElementById("list");
    
    if(form.loc.value === "first") {
        list.prepend(li);
    } else if(frameElement.loc.value === "last") {
        list.append(li);
    }

    form.item.value = ""; 
}

function addRow() {
    /* 
    테이블에 행을 추가하는 함수를 사용한 행에는 5열이 들어간다. 
    1. 사용자 입력으로 제목과 작성자를 받을 수 있으며
    2. 번호는 전체 행 수의 +1 이 설정되게 하고(tbody 행의 수만)
    3. 작성일은 new Date() 객체를 사용하여 현재 날짜를 구하며
    4. 조회수는 기본 0으로 설정한다.
    */
}

var element = document.getElementById("table")[0];

tbody 