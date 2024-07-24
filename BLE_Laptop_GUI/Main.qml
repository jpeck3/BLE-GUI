import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    width: 1280
    height: 960
    visible: true
    minimumWidth: 700
    title: qsTr("Axis BLE Scanner")
    property string controlTitleText: "My Device 1"
    property string logText: ""
    StackView{
        id: mainFrame
        anchors.fill: parent
        initialItem: LoadPage{}
    }
    Component.onCompleted: {
        mainFrame.replace("MainPage.qml")
    }
}
