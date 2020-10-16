import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0
Page {
    property string name: "Добавить занятие"
    property string nameFieldd: ""
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    signal throwData(var obj)

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
            border.color: Singleton.themeMainColor
            border.width: 1
            radius: 10
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
            border.color: Singleton.themeMainColor
            border.width: 1
            radius: 10
        }
        anchors.leftMargin: Singleton.dp(15)
    }
    Label {
        id: timeEndLabel
        anchors.right: parent.right
        anchors.top: nameField.bottom
        anchors.left: timeEndField.left
        text: "До:"
        anchors.leftMargin: Singleton.dp(20)
        font.pixelSize: 20
        anchors.topMargin: Singleton.dp(20)
    }
    TextField {
        id: timeEndField
        placeholderText: "Время конца..."
        anchors.top: timeEndLabel.bottom
        anchors.right: parent.right
        width: parent.width/2 - 50
        height: Singleton.dp(50)
        background: Rectangle {
            anchors.fill: parent
            border.color: Singleton.themeMainColor
            border.width: 1
            radius: 10
        }
        anchors.rightMargin: Singleton.dp(15)
    }
    Label {
        id: commentLabel
        anchors.left: parent.left
        anchors.top: timeStartField.bottom
        text: "Комментарий:"
        anchors.leftMargin: Singleton.dp(20)
        font.pixelSize: 20
        anchors.topMargin: Singleton.dp(20)
    }
    TextArea {
        id: commentArea
        placeholderText: "Введите комментарий..."
        anchors.top: commentLabel.bottom
        anchors.left: parent.left
        width: parent.width
        wrapMode: TextArea.Wrap
        anchors.horizontalCenter: parent.horizontalCenter
        height: Singleton.dp(200)
        background: Rectangle {
            anchors.fill: parent
            border.color: Singleton.themeMainColor
            border.width: 1
            radius: 10
        }
        anchors.rightMargin: Singleton.dp(15)
    }
    Button {
        id: okButton
        anchors { bottom: parent.bottom; right: parent.right; bottomMargin: Singleton.dp(40); rightMargin: Singleton.dp(40)}
        width: Singleton.dp(120)
        height: Singleton.dp(50)
        text: "Создать"
        font.pixelSize: 20
        background: Rectangle {
            anchors.fill: parent
            color: Singleton.themeBackColor

        }
        onClicked: {
            var obj = {
                "nameof":nameField.text,
                "timeStart":timeStartField.text,
                "timeEnd":timeEndField.text,
                "comment":commentArea.text,
                "imageSource": "qrc:/Icons/run.png" // иначе ругается в page1form.qml
            }
            throwData(obj)
        }
    }
}
