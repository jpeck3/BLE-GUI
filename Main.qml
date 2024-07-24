import QtQuick 2.2
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    width: 1280
    height: 960
    visible: true
    title: qsTr("Bluetooth Devices")
    property string controlTitleText: ""
    StackView {
        id: mainFrame
        anchors.fill: parent
        initialItem: LoadPage{}
    }
    Component.onCompleted: {
        mainFrame.replace("MainPage.qml")
    }
}
