import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    ListModel{
        id: myModel
    }

    anchors.fill: parent
    Rectangle{
        id: controlHeader
        width: parent.width
        height: 60
        color: "#192bc2"
        Label{
            font.pixelSize: 40
            color: "white"
            anchors.centerIn: parent
            text: mainWindow.controlTitleText
        }
        MouseArea{
            id: backButton
            height: parent.height
            width: parent.height
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            Rectangle{
                id: backButtonRect
                anchors.fill: parent
                color: "#192bc2"
                Label{
                    text: "<"
                    font.pixelSize: 40
                    font.family: "helvetica"
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                }
            }
            hoverEnabled: true
            onHoveredChanged: {
                if(backButton.containsMouse){
                    backButtonRect.color= "#394be2"
                }
                else{
                    backButtonRect.color = "#192bc2"
                }
            }

            onClicked: {
                mainFrame.replace("MainPage.qml")
            }
        }
    }
    Rectangle{
        id: controlsTextArea
        width: parent.width - 20
        height: parent.height - 375
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: controlHeader.bottom
        anchors.topMargin: 10
        border.width: 3
        border.color: "grey"
        Label{
            id: controlsText
            width: parent.width -10
            height: parent.height-10
            font.pixelSize: 20
            text: ""
            anchors.centerIn: parent
            maximumLineCount: height/23
        }
    }
    GridView{
        cellWidth: 170
        cellHeight: 75
        anchors.top: controlsTextArea.bottom
        anchors.topMargin: 75
        width: parent.width
        height: 150
        model: ListModel{
            id: buttonsModel
            ListElement{
                name: "Get Device Id"
                output: "DEVICEID#"

            }
            ListElement{
                name: "Reset Device"
                output: "RESET#"

            }
            ListElement{
                name: "SIM Test"
                output: "SIMTEST#"

            }
            ListElement{
                name: "FW Version"
                output: "FWVERSION#"

            }
            ListElement{
                name: "WiFi Scan"
                output: "WIFISCAN#"

            }
            ListElement{
                name: "Get Cell Status"
                output: "REGSTATUSCELL#"

            }
            ListElement{
                name: "Signal Quality"
                output: "CELLSIGNALQUALITY#"

            }
            ListElement{
                name: "Get Battery Voltage"
                output: "GETBATT#"

            }
            ListElement{
                name: "Read Temperature"
                output: "GETTEMP#"
            }
            ListElement{
                name: "Clear Log"
            }
        }
        delegate: Rectangle{
            width: 170
            height: 75
            MouseArea{
                id: controlButton
                width:150
                height: 50
                anchors.centerIn: parent
                Rectangle{
                    id: buttonRectangle
                    anchors.fill: parent
                    color: "#192bc2"
                    Label{
                        anchors.centerIn: parent
                        color: "White"
                        text: name
                    }
                }
                onClicked: {
                    if(name == "Clear Log"){
                        controlsText.text=""
                    }
                    else{
                        controlsText.text += "SENDING: BLEDATA+" + output + "\n"
                    }
                }
                hoverEnabled: true
                onHoveredChanged: {
                    if(controlButton.containsMouse){
                        buttonRectangle.color = "#394be2"
                    }else{
                        buttonRectangle.color = "#192bc2"
                    }
                }
            }
        }
    }
}
