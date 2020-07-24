document.addEventListener("contextmenu", handleContextMenu, false);
function handleContextMenu(event) {
    var selectedText = "";
    if (window.getSelection) {
        selectedText = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        selectedText = document.selection.createRange().text;
    }
    safari.extension.setContextMenuEventUserInfo(event,
        { "selectedText": selectedText });
}
