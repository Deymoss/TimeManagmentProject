import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
Page {


StackView {
    id: stackView
    visible: true
}


    Pane {
        id: settingsPane
        height: parent.height/15
        width: parent.width
        background: Rectangle {
            height: parent.height
            width: parent.width
            color: "#CC0000"
            Button {
                id: backButton
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/10
                height: parent.height
                onClicked: stockView.pop()
                anchors.left: parent.left
                background: Rectangle {
                    height: parent.height
                    width: parent.width
                    color: "#CC0000"
                    Image {
                        source: "qrc:/Back.png"
                        anchors.centerIn: parent
                        height: parent.height/1.5
                        width: parent.width

                    }
                }
            }
        }


    }
}
