import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Page {
    width: 390
    height: 720


    RoundButton {
        id: addButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.rightMargin: 40
        width: 60
        height: 60
        visible: true
        palette.button:"#CC0000"
        contentItem: Image {
            id: mask
            width: 100
            height: 100
            source: "qrc:/plus.png"
        }
    }
    Item {
        width: parent.width
        height: parent.height
        anchors.top: parent.top
    ListView {
        id: mainListView
        anchors.fill: parent
        delegate: todoDelegate
        model: thingsToDo
    }

    ListModel
    {
        id: thingsToDo
        ListElement { name: "Пробежка"; imageSource: "qrc:/run.png"}
        ListElement { name: "Саморазвитие"; imageSource: "qrc:/run.png"}
        ListElement { name: "Чтение"; imageSource: "qrc:/run.png"}
        ListElement { name: "Игры"; imageSource: "qrc:/run.png"}
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
                height: 50
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 50
                    text: name
                }
            }
            Rectangle {
                id: image
                width: 50
                height: 50
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 2
                Image {
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  source: imageSource
                 }
              }
            }
        }
    }
}
//    ListView{
//        id: mainList
//        anchors.bottom: pane.bottom
//        delegate: SwitchDelegate
//        {
//            width: screen.width
//            Text {
//                anchors.left: parent.left
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.leftMargin: 50
//                text: qsTr("Пробежка")
//            }
//            Image {
//                id: icon
//                source: "qrc:/run.png"
//                width: screen.width/10
//                height: parent.height
//            }
//        }
//    }
