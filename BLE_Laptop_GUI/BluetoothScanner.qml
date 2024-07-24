import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: bluetoothScanner
    property int currentItem: 0;
    MoreInfoPopup{
        id: myDrawer
        width: parent.width/2
        height: parent.height/8
        anchors.centerIn: parent;
        property string deviceName//Ask Adinor About
        property string bleStatus
        property int index
    }

    Rectangle{
        anchors.fill: parent
        ListModel{
            id: bluetoothListModel
            ListElement {
                name: "My Device 1"
                status: "BLE Status"
                color: "light grey"
            }
            ListElement {
                name: "My Device 2"
                status: "BLE Status"
                color: "white"
            }
            ListElement {
                name: "My Device 3"
                status: "BLE Status"
                color: "white"
            }
            ListElement {
                name: "My Device 4"
                status: "BLE Status"
                color: "white"
            }
            ListElement {
                name: "My Device 5"
                status: "BLE Status"
                color: "white"
            }
            ListElement {
                name: "My Device 6"
                status: "BLE Status"
                color: "white"
            }
            ListElement {
                name: "My Device 7"
                status: "BLE Status"
                color: "white"
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
                        mainWindow.logText = ""

                        bluetoothListModel.clear();
                        let currentIndex = 0;

                        function appendWithRandomDelay() {
                            let randomTime = Math.random() * 3000;

                            timer.interval = randomTime;
                            timer.repeat = false;
                            timer.triggered.connect(function() {
                                if(currentIndex===0){
                                    bluetoothListModel.append({ name: "My Device " + (currentIndex + 1), status: "BLE Status", color: "light grey" });
                                    mainWindow.controlTitleText = bluetoothListModel.get(0).name
                                    currentItem = 0
                                }
                                else{
                                    bluetoothListModel.append({ name: "My Device " + (currentIndex + 1), status: "BLE Status", color: "white" });
                                }

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
                if(name !== mainWindow.controlTitleText){
                    bluetoothListModel.set(currentItem, {color: "white"})
                    currentItem = index
                    model.color = "light grey"
                    mainWindow.controlTitleText = name
                    mainWindow.logText = ""
                }
            }

            Rectangle{
                id: itemRect
                anchors.fill: parent
                color: model.color
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
                    model.color = "light grey"
                }else if (index !== currentItem){
                    model.color = "white"
                }
            }

        }
    }

}
