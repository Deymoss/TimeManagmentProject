import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Singleton 1.0
import Qt.labs.settings 1.1
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")
    background: Rectangle {
        anchors.fill: parent
        color: Singleton.themeBackColor
    }
    //верхний тулбар - начало --------------------------------------------------------------------------------
    header: ToolBar {
        id: toolBar
        height: Singleton.dp(60)
        RowLayout {
            anchors.fill: parent
            Label {
                id: toolBarLabel
                text: stackView.depth < 1 ? "Главная" : Singleton.topBarText
                color: "white"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true

            }

            ToolButton {
                id: toolMenuID
                action: optionsMenuAction
                visible: Singleton.mainObjectsVisibility

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight
                    Action {
                        text: "Настройки"
                        onTriggered: {
                            stackView.push("qrc:/SettingsPage.qml")
                            Singleton.topBarText = "Настройки"
                            Singleton.mainObjectsVisibility = false
                        }

                    }
                    Action {
                        text: "О программе"
                        onTriggered: aboutDialog.open()


                    }
                    background: Rectangle {
                        implicitWidth: Singleton.dp(200)
                        implicitHeight: Singleton.dp(60)
                        border.color: Singleton.themeSubColor
                        radius: 10
                    }
                }


                Image {
                    source: "qrc:/Icons/threeDots.png"
                    width: 35
                    height: parent.height-10
                    anchors { verticalCenter: parent.verticalCenter; right: parent.right;}
                }
                onClicked: optionsMenu.open()

                palette.button: Singleton.themeMainColor
            }
        }
        background: Rectangle {
            anchors.fill: parent
            color: Singleton.themeMainColor
        }
        Button {
            id: backButton
            visible: !Singleton.mainObjectsVisibility
            anchors { verticalCenter: parent.verticalCenter; left: parent.left; }
            width: parent.width/10
            height: parent.height
            onClicked: {
                stackView.pop()
                stackView.depth < 2 ? Singleton.mainObjectsVisibility = true : ""  //if bug appeared in future development, take a look to that.
            }

            background: Rectangle {
                height: parent.height
                width: parent.width
                color: backButton.pressed ? Singleton.themeSubColor : Singleton.themeMainColor
                Image {
                    source: "qrc:/Icons/Back.png"
                    anchors.centerIn: parent
                    height: Singleton.dp(20)
                    width: Singleton.dp(10)

                }
            }
        }
    }
    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        x: (screen.width - width) / 2
        y: screen.height / 6
        width: Math.min(screen.width, screen.height) / 3 * 2
        contentHeight: aboutColumn.height
        background: Rectangle {
            height: parent.height
            width: parent.width
            color: Singleton.themeBackColor
        }

        Column {
            id: aboutColumn
            spacing: Singleton.dp(20)
            Label {
                width: aboutDialog.availableWidth
                Text {
                    id:qwe
                    text:"                     Справка"
                    font.bold: true
                    font.pixelSize: 16
                }
                wrapMode: Label.Wrap

            }

            Label {
                width: aboutDialog.availableWidth
                text: "App created for selfDicscipline and SelfControl"
                wrapMode: Label.Wrap
                font.pixelSize: 16
            }

            Label {
                width: aboutDialog.availableWidth
                text: "Icons made by [icon king] from www.freeicons.io "
                wrapMode: Label.Wrap
                font.pixelSize: 16
            }
        }
    }


    //верхний тулбар - конец -----------------------------------------------------------------------------------
    //нижний таббар - начало -----------------------------------------------------------------------------------
    footer: TabBar {
        id: tabBar
        visible: Singleton.mainObjectsVisibility
        width: parent.width
        background: Rectangle {
            height: Singleton.dp(60)
            width: parent.width
            color: Singleton.themeMainColor
        }
        TabButton {
            id: mainPageButton
            background: Rectangle {
                width: parent.width
                height: parent.height
                color: stackView.depth > 1 ? Singleton.themeMainColor : Singleton.themeSubColor

            }
            onClicked: stackView.depth > 1 ? stackView.pop() : ""
            text: "Главная"
        }
        TabButton {
            id: achievementsPageButton
            text: "Достижения"
            background: Rectangle {
                width: parent.width
                height: parent.height
                color: stackView.depth > 1 ? Singleton.themeSubColor : Singleton.themeMainColor
            }
            onClicked: {
                stackView.depth < 2 ? stackView.push("qrc:/Page2Form.qml") : ""
                Singleton.topBarText = "Достижения"
            }
        }

        //нижний таббар - конец -----------------------------------------------------------------------------------
    }
    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenuAction.trigger()
    }
    Action {
        id: optionsMenuAction
        icon.name: "menu"
        onTriggered: optionsMenu.open()
    }
    Component {
        id: mainPg
        Page1Form {}
    }
    Component {
        id: addingPg
        AddingPage {
            onThrowData: {
                mainPg.thingsToDo.append({nameof: "objFields.nameFielddd"});
                console.log("qwe")
            }
        }
    }
    Component {
        id: settingsPg
        SettingsPage {}
    }
    Component {
        id: achivementPg
        SettingsPage {}
    }
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPg

        onCurrentItemChanged: {
            Singleton.topBarText = currentItem.name
        }

    }

}
