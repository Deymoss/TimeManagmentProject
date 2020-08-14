pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.14

Item {

    property string themeMainColor: "#CC0000"// classic #3f83b0 dark #212121 and #000000
    property string themeSubColor: "#850000"
    property string themeBackColor: "#F3CEDF"
    property string themeTextColor: "#000000"
    property bool mainObjectsVisibility: true
    property string topBarText: "Главная"
    property int themeChecked: 0

    property int dpi: Screen.pixelDensity * 25.4

    function dp(x){
        if(dpi < 120) {
            return x;
        } else {
            return x*(dpi/160);
        }
    }

}
