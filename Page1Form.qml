import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0
Page {
    id:page1
    width: Singleton.dp(390)
    height: Singleton.dp(720)
    property string name: "Главная"
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }


    Item {
        width: parent.width
        height: parent.height
        anchors.top: parent.topЫ
    ListView {
        id: mainListView
        anchors.fill: parent
        delegate: todoDelegate
        model: thingsToDo

    }

    ListModel
    {
        id: thingsToDo
        ListElement { name: "Пробежка"; imageSource: "qrc:/Icons/run.png"}
        ListElement { name: "Саморазвитие"; imageSource: "qrc:/Icons/run.png"}
        ListElement { name: "Чтение"; imageSource: "qrc:/Icons/run.png"}
        ListElement { name: "Игры"; imageSource: "qrc:/Icons/run.png"}
    }
    Component{
        id: todoDelegate
        Item{
            id: wrapper
            width: mainListView.width
            height: 50
            Rectangle{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                color: Singleton.themeBackColor
                height: 50
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 50
                    text: name
                    color: Singleton.themeTextColor

                }
            }
            Rectangle {
                id: image
                width: 50
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 2
                color: Singleton.themeBackColor

                Image {
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  source: imageSource
                 }
              }
            }
        }
    }
    RoundButton {
        id: addButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: Singleton.dp(70)
        anchors.rightMargin: Singleton.dp(40)
        width: 60
        height: 60
        palette.button: Singleton.themeMainColor
        contentItem: Image {
            id: mask
            width: 100
            height: 100
            source: "qrc:/Icons/plus.png"
        }
        onClicked: {
            stackView.push("qrc:/AddingPage.qml")
            Singleton.mainObjectsVisibility = false

        }
    }


}
