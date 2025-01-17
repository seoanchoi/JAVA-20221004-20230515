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
    } else if(form.loc.value === "last") {
        list.append(li);
    }

    form.item.value = ""; 
}

function addRow(form) {
    /* 
    테이블에 행을 추가하는 함수를 사용한 행에는 5열이 들어간다. 
    1. 사용자 입력으로 제목과 작성자를 받을 수 있으며
    2. 번호는 전체 행 수의 +1 이 설정되게 하고(tbody 행의 수만)
    3. 작성일은 new Date() 객체를 사용하여 현재 날짜를 구하며
    4. 조회수는 기본 0으로 설정한다.
    */

    var tbody = document.getElementById("table").lastElementChild;
    var now = new Date();

    var tr = createTableRow(5);
    tr.children[0].innerText = tbody.children.length + 1;
    tr.children[1].innerText = setAndClear(form.title);
    tr.children[2].innerText = setAndClear(form.writer);
    tr.children[3].innerText = [now.getFullYear(), (now.getMonth() + 1), now.getDate()].join("-");
    tr.children[4].innerText = 0;
    tbody.append(tr);
    }

    function setAndClear(inputElement) {
    var value = inputElement.value;
    inputElement.value = "";
    return value;
    }

    function createTableRow(columnCount) {
    var row = document.createElement("tr");
    for(let idx = 0; idx < columnCount; idx++) {
        let column = document.createElement("td");
        row.append(column);
    }
    return row;
    }

function validCheck() {
/* 
    1. 동일한 패스워드를 사용하는지 검사 후 동일하지 않은 값을 입력한 경우
    패스워드 확인 입력 양식 옆에 "다시 입력하시오." 라는 메시지가 나오도록 하세요.
    2. username 에서 6자리 이상의 아이디가 아닌 경우 아이디 입력 양식 옆에 
    "6자리 이상 입력하시오."라는 메시지가 나오도록 한다.    
*/
    var isValid = true;
    if(form.username.nextElementSibling !== null) {
        form.username.nextElementSibling.remove();
    }
    if(form.username.value.length < 6) {
        spanErrorMessage(form.username, "6자리 이상 입력하시오.");
        form.username.value = "";
        isValid = false;
    }
    if(form.passwordCheck.nextElementSibling !== null) {
        form.passwordCheck.nextElementSibling.remove();
    }
    if(form.password.value !== form.passwordCheckvalue) {
        spanErrorMessage(form.passwordCheck, "다시 입력하시오.");
        form.passwordCheck.value = "";
        isValid = false;
    }
    return isValid;
}

function spanErrorMessage(element, message) {
    let span = document.createElement("span");
    span.innerText = message;
    element.after(span);
    return span;
}





