import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    anchors.fill: mainWindow
    MoreInfoPopup{
        id: myDrawer
        width: parent.width/4
        height: parent.height/8
        anchors.centerIn: parent;
        property string deviceName//Ask Adinor About
        property string bleStatus
        property int index
    }
    function openPopup (name, info, index){
        myDrawer.deviceName = name;
        myDrawer.bleStatus = info;
        myDrawer.index = index;
        myDrawer.open();
    }

    Rectangle{
        anchors.fill: parent
        ListModel{
            id: bluetoothListModel
            ListElement {
                name: "My Device 1"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 2"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 3"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 4"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 5"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 6"
                property string status: "BLE Status"
            }
            ListElement {
                name: "My Device 7"
                property string status: "BLE Status"
            }
        }
    }
    ListView{
        id: bluetoothListView
        model: bluetoothListModel
        anchors.fill: parent
        header: Rectangle{
            z: 2
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 60
            color: "#192bc2"
            Item{
                width: 300
                height: parent.height
                anchors.centerIn: parent
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    color: "white"
                    font.pixelSize: 40
                    text: "AXIS DEVICES"
                }
                RoundButton {
                    id: reloadButton
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    width: 35
                    height: 35
                    background: Image{
                        source: "reload-icon.png"
                        width: reloadButton.width
                        height: reloadButton.height
                    }
                    Timer{
                        id: timer
                    }

                    onClicked: {
                        bluetoothListModel.clear();
                        let currentIndex = 0;

                        function appendWithRandomDelay() {
                            let randomTime = Math.random() * 3000;

                            timer.interval = randomTime;
                            timer.repeat = false;
                            timer.triggered.connect(function() {
                                bluetoothListModel.append({ name: "My Device " + (currentIndex + 1), status: "BLE Status" });

                                currentIndex++;
                                if (currentIndex < 8) {
                                    appendWithRandomDelay();
                                }
                            });

                            timer.start();
                        }

                        appendWithRandomDelay();
                    }
                }
            }
        }
        headerPositioning: ListView.OverlayHeader
        delegate:
            MouseArea{
            id: itemMouseArea
            width: parent.width
            height: 90


            onDoubleClicked: {
                mainWindow.controlTitleText = model.name
                openPopup(model.name, model.status, model.index)
            }

            Rectangle{
                id: itemRect
                anchors.fill: parent
                Label {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    id: myId
                    font.pixelSize: 32
                    color: "#192bc2"
                    text: model.name
                }
                Label{
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    color: "grey"
                    font.pixelSize: 25
                    text: "BLE Address: {" + model.status + "}"
                }
            }
            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 0.5
                color: "light grey"
            }
            hoverEnabled: true
            onHoveredChanged: {
                if(itemMouseArea.containsMouse){
                    itemRect.color = "light grey"
                }else{
                    itemRect.color = "white"
                }
            }
        }
    }

}
