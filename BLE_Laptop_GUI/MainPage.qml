import QtQuick 2.15
import QtQuick.Controls 2.15

SplitView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    BluetoothScanner{
        SplitView.minimumWidth: 350
        implicitWidth: parent.width/2
        height: parent.height
    }
    Controls{
        SplitView.minimumWidth: 350
        implicitWidth: parent.width/2
        height: parent.height
    }
}
