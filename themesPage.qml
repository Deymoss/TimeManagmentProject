import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0

Page {
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    ButtonGroup {
        id: buttonGroup
    }
    ListView {
        id: themesListview
        anchors.fill: parent


        model: ListModel {
            id:listmdl
            ListElement { title: "Классическая"; mainColor: "#CC0000"; subColor: "#850000"; backColor: "#F3CEDF"; cnt: 0 }
            ListElement { title: "Тёмная"; mainColor: "#212121"; subColor: "#000000"; backColor: "#555252";cnt: 1 }
            ListElement { title: "Светлая"; mainColor: "#3F83B0"; subColor: "#275471"; backColor: "#F3CEDF";cnt: 2 }
        }

        delegate: RadioDelegate {
            id: dlgt
            width: parent.width
            text: model.title
            checked: index === Singleton.themeChecked
            ButtonGroup.group: buttonGroup
            onClicked: {
                Singleton.themeMainColor = model.mainColor
                Singleton.themeSubColor = model.subColor
                Singleton.themeBackColor = model.backColor
                Singleton.themeChecked = model.cnt

            }
        }
    }
}
