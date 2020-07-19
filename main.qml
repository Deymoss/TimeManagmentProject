import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")
    property bool showBar: true

            //верхний тулбар - начало --------------------------------------------------------------------------------
                header: ToolBar {
                    visible: showBar
                    RowLayout {
                        anchors.fill: parent
                        Label {
                          text: "Главная"
                          color: "white"
                          elide: Label.ElideRight
                          horizontalAlignment: Qt.AlignHCenter
                          verticalAlignment: Qt.AlignVCenter
                          Layout.fillWidth: true

                    }

                        ToolButton {
                            action: optionsMenuAction
                            Menu {
                                id: optionsMenu
                                x: parent.width - width
                                transformOrigin: Menu.TopRight
                                Action {
                                    text: "Настройки"
                                    onTriggered: {
                                       stackView.push("qrc:/SettingsPage.qml")
                                       showBar = false
                                    }
                                }
                                Action {
                                    text: "О программе"
                                    onTriggered: aboutDialog.open()

                                }
                            }


                          Image {
                              source: "qrc:/threeDots.png"
                              width: 35
                              height: parent.height-10
                              anchors.verticalCenter: parent.verticalCenter
                              anchors.right: parent.right
                          }
                          onClicked: optionsMenu.open()

                          palette.button: "#CC0000"
                                   }
                }
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#CC0000"
                    }
                }
                Dialog {
                    id: aboutDialog
                    modal: true
                    focus: true
                    title: "Справка"
                    x: (screen.width - width) / 2
                    y: screen.height / 6
                    width: Math.min(screen.width, screen.height) / 3 * 2
                    contentHeight: aboutColumn.height

                    Column {
                        id: aboutColumn
                        spacing: 20

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
                    visible: showBar
                    width: parent.width
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#CC0000"
                    }
                    TabButton {
                        id: mainPageButton
//                        visible: showBar
//                        anchors.left: parent.left
//                        width: parent.width/2
//                        height: parent.height
                         background: Rectangle {
                             anchors.fill: parent
                             color: stackView.depth > 1? "#CC0000" : "#850000"
                          }
                         onClicked: stackView.depth > 1? stackView.pop() : ""
                        text: "Главная"
                    }
                    TabButton {
                        id: achievementsPageButton
                        text: "Достижения"
                        background: Rectangle {
                            anchors.fill: parent
                            color: stackView.depth > 1? "#850000" : "#CC0000"
                          }
                        onClicked: {
                            stackView.depth < 2 ? stackView.push("qrc:/Page2Form.qml") : ""
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
    SettingsPage {
        id: settings
        visible: true
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/Page1Form.qml"
}

}
