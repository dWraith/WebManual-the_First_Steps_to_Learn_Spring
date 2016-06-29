function check() {
    var string = "<div style=\"" + document.getElementById("editor").value + "\">I'm inside the block. It's impossible!</div>";
    document.getElementById("innertext").innerHTML=string;
}