import QtQuick 2.2
import QtQuick.Controls 2.15

Item {
    anchors.fill: mainFrame
    Rectangle{
        anchors.fill: parent
        color: "white"
    }
    BusyIndicator {
        anchors.centerIn: parent
    }
}
