$browser = New-Object -ComObject "InternetExplorer.Application"
$browser.Visible = $true
$browser.Navigate("about:blank")
$browser.Document.parentWindow.execScript("function scrollPage() { window.scrollBy(0, 100); if ((window.innerHeight + window.scrollY) < document.body.offsetHeight) { setTimeout(scrollPage, 200); } } scrollPage();", "JavaScript")
