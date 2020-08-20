import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0
Page {
    property string name: "Добавить занятие"
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    Label {
        id: nameLabel
        anchors.left: parent.left
        anchors.top: parent.top
        text: "Название занятия:"
        anchors.leftMargin: Singleton.dp(20)
        font.pixelSize: 20

    }
    TextField {
        id: nameField
        placeholderText: "Введите название занятия..."
        anchors.top: nameLabel.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 20
        height: Singleton.dp(50)
        background: Rectangle {
            anchors.fill: parent
            radius: 25
        }
    }
    Label {
        id: timeStartLabel
        anchors.left: parent.left
        anchors.top: nameField.bottom
        text: "Время от:"
        anchors.leftMargin: Singleton.dp(20)
        font.pixelSize: 20
        anchors.topMargin: Singleton.dp(20)

    }
    TextField {
        id: timeStartField
        placeholderText: "Время начала..."
        anchors.top: timeStartLabel.bottom
        anchors.left: parent.left
        width: parent.width/2 - 50
        height: Singleton.dp(50)
        background: Rectangle {
            anchors.fill: parent
            radius: 25
        }
        anchors.leftMargin: Singleton.dp(15)
    }

}
