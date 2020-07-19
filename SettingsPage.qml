import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
Page {



    Pane {
        id: settingsPane
        height: showBar.height
        width: parent.width
        Text {
            text: qsTr("Настройки")
            color: "white"
            anchors.centerIn: parent
        }
        background: Rectangle {
            height: parent.height
            width: parent.width
            color: "#CC0000"
            Button {
                id: backButton
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/10
                height: parent.height
                onClicked: {
                    stackView.pop()
                    showBar = true
                }
                anchors.left: parent.left
                background: Rectangle {
                    height: parent.height
                    width: parent.width
                    color: backButton.pressed ? "#850000" : "#CC0000"
                    Image {
                        source: "qrc:/Back.png"
                        anchors.centerIn: parent
                        height: parent.height/1.5
                        width: parent.width/1.5

                    }
                }
            }
        }


    }
}
