var html, css, div;
window.onclick = function() {
    html = document.getElementsByTagName('textarea')[0];
    css = document.getElementsByTagName('textarea')[1];
    div = document.getElementById('resultpane_content');
}

function check() {
    div.value = css.value;
    div.innerHTML = "<style>" + css.value + "</style><div>" + html.value+"</div>";
}