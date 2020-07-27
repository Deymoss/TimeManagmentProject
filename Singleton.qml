pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.14

Item {
    property string themeMainColor: "#CC0000"
    property string themeSubColor: "#850000"
    property bool mainObjectsVisibility: true
    property string topBarText: "Главная"

    property int dpi: Screen.pixelDensity * 25.4

    function dp(x){
        if(dpi < 120) {
            return x;
        } else {
            return x*(dpi/160);
        }
    }
}
