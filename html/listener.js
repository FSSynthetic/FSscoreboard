$(function()
{
    window.addEventListener('message', function(event)
    {
        var item = event.data;
        var buf = $('#wrap');
        var jspCount = $('#jspCount');
        var jsServerName = $('#jsServerName');
        var jsicon = $('#jsicon');
        var jsLinkOne = $('#jsLinkOne');
        var jsLinkTwo = $('#jsLinkTwo');
        var jsMaxPlayers = $('#jsMaxPlayers');
        jspCount.text(item.pCount);
        jsServerName.text(item.ServerName);
        jsicon.attr("src", item.icon);
        jsLinkOne.text(item.LinkOne);
        jsLinkTwo.text(item.LinkTwo);
        jsMaxPlayers.text(item.MaxPlayers);
        if (item.meta && item.meta == 'close')
        {
            document.getElementById("ptbl").innerHTML = "";
            $('#wrap').hide();
            return;
        }
        buf.find('#ptbl').append(item.text);
        $('#wrap').show();
    }, false);
});