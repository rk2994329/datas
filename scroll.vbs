Dim browserApp, browserWindow
Set browserApp = CreateObject("Shell.Application")
Set browserWindow = browserApp.Windows.Item(0)
browserWindow.Document.parentWindow.execScript "var scroll = setInterval(function(){ window.scrollBy(0,1); }, 100);", "JavaScript"
