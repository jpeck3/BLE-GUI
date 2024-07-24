import QtQuick 2.15
import QtQuick.Controls 2.15

Popup{
    id: myPopup
    Rectangle{
        width: parent.width+30
        height: parent.height+30
        radius: 10
        anchors.centerIn: parent
        property string deviceName
        property string bleStatus
        property int index
        border.width: 0.5
        Rectangle{
            id: topRectangle
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width
            height: 30
            color: "#282828"
            radius: 10
        }
        Rectangle{
            id: bottomRectangle
            anchors.top:parent.top
            anchors.left: parent.left
            width: parent.width
            height: 10
            anchors.topMargin: 20
            color: "#282828"
        }
        RoundButton{
            width: 20
            height: 20
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 5
            anchors.rightMargin: 5
            background: Rectangle{
                color: "orangered"
                radius: 10
            }

            Text{
                color: "white"
                anchors.centerIn: parent
                text: "X"
            }
            onClicked: {
                myPopup.close();
            }
        }
        Text{
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 7
            text: deviceName
        }
        Text{
            anchors.left: parent.left
            anchors.top: bottomRectangle.bottom
            anchors.leftMargin: 5
            anchors.topMargin: 5
            id: nameText
            color: "#192bc2"
            text: "Device Name: "
        }
        Text{
            anchors.right: parent.right
            anchors.top: bottomRectangle.bottom
            anchors.rightMargin: 5
            anchors.topMargin: 5
            id: nameTextInfo
            color: "grey"
            font.italic: true
            text: deviceName
        }
        Text {
            anchors.left: parent.left
            anchors.top: nameText.bottom
            anchors.topMargin: 10
            anchors.leftMargin: 5
            id: conStatus
            color: "#192bc2"
            text: "BLE Address:"
        }
        Text{
            anchors.right: parent.right
            anchors.top: nameText.bottom
            anchors.rightMargin: 5
            anchors.topMargin: 5
            id: conStatusInfo
            color: "grey"
            font.italic: true
            text: bleStatus
        }
        Button{
            id: connectButton
            width: parent.width-10
            height: 50
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            Text{
                anchors.centerIn: parent
                text: "Connect"
            }
        }
    }
}
