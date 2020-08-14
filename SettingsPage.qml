import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0
Page {
     property string name: "Настройки"
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    ListView {
        id: listView
        focus: true
        currentIndex: -1
        anchors.fill: parent
        anchors.bottom: toolBar.bottom

        delegate: ItemDelegate {
            width: parent.width
            text: model.title
            onClicked: {
                stackView.push(model.source)
            }
        }
        model: ListModel {
            ListElement { title: "Тема оформления"; source: "qrc:/settings/themesPage.qml" }
        }
        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
