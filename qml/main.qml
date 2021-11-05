import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Keyboard Test App")

    QtObject {
        id: styles

        property int textPointSize: 12
        property color backgroundColor: "#e0ffe0"
        property color textEditBackgroundColor: "#ffffe0"
        property color textEditBorderColor: "#c0c0c0"
        property color activeTextEditBorderColor: "#808080"
        property color textInfoBackgroundColor: "#e0e0e0"
    }

    Page {
        anchors.fill: parent

        background: Rectangle {
            color: styles.backgroundColor
        }

        Flickable {
            id: flickable

            anchors.fill: parent
            anchors.margins: 10

            contentWidth: columnLayout.width
            contentHeight: columnLayout.height
            clip: true

            ColumnLayout {
                id: columnLayout

                width: flickable.width

                Text {
                    text: qsTr("TextInput1")
                    font.pointSize: styles.textPointSize
                }

                Frame {
                    Layout.fillWidth: true

                    background: Rectangle {
                        color: styles.textEditBackgroundColor
                        border.color: textInput1.activeFocus ? styles.activeTextEditBorderColor : styles.textEditBorderColor
                        border.width: textInput1.activeFocus ? 2 : 1
                    }

                    TextInput {
                        id: textInput1
                        width: parent.width
                        font.pointSize: styles.textPointSize
                        selectByMouse: true

                        onAccepted: {
                            // Qt.inputMethod.reset(); // WORKAROUND
                            textInput2.forceActiveFocus();
                        }
                    }
                }

                Text {
                    text: qsTr("TextInput2")
                    font.pointSize: styles.textPointSize
                }

                Frame {
                    Layout.fillWidth: true

                    background: Rectangle {
                        color: styles.textEditBackgroundColor
                        border.color: textInput2.activeFocus ? styles.activeTextEditBorderColor : styles.textEditBorderColor
                        border.width: textInput2.activeFocus ? 2 : 1
                    }

                    TextInput {
                        id: textInput2
                        width: parent.width
                        font.pointSize: styles.textPointSize
                        selectByMouse: true

                        onAccepted: {
                            // Qt.inputMethod.reset(); // WORKAROUND
                            textEdit.forceActiveFocus();
                        }
                    }
                }

                Text {
                    text: qsTr("ReadOnly TextEdit")
                    font.pointSize: styles.textPointSize
                }

                Frame {
                    Layout.fillWidth: true

                    background: Rectangle {
                        color: styles.textInfoBackgroundColor
                        border.color: textEdit.activeFocus ? styles.activeTextEditBorderColor : styles.textEditBorderColor
                        border.width: textEdit.activeFocus ? 2 : 1
                    }

                    TextEdit {
                        id: textEdit
                        width: parent.width
                        font.pointSize: styles.textPointSize
                        readOnly: true
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ornare erat augue, non congue purus tempor vitae. In quis venenatis dolor, a hendrerit purus. Maecenas suscipit dui nec ex tristique, vitae eleifend augue feugiat. Etiam finibus velit nec lorem eleifend, quis venenatis ipsum pulvinar. Mauris interdum fringilla tincidunt. In ultrices rutrum nisi, in aliquet nisl venenatis ut. Mauris tincidunt in libero ut sodales. Cras ante nulla, luctus ut fringilla vel, viverra et nibh. Etiam quis luctus lectus. Mauris aliquet semper sapien at venenatis. Cras ut velit dolor."
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        selectByMouse: true
                    }
                }

            }

        }

    }
}
