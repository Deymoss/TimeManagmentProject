import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    property string name: "Достижения"
    width: 600
    height: 400
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
        color: Singleton.themeBackColor

    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
