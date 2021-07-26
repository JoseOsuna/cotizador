document.getElementById("content-index-captura").style.height = (screen.height - 144) + "px";


var closeMsg = document.getElementById("closeMsg");
closeMsg.addEventListener('click', function (e) {
    e.preventDefault();
    document.getElementById("msgdiv").style.display = "none";
});


var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})