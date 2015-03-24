import QtQuick 2.2

Rectangle {
    width: 360
    height: 360

    Rectangle {
        id: btnStartPause
        width: 240
        height: 100
        color: "blue"
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: txtBtnStartPause
            text: "開始"
            font.pixelSize: 28
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (timer.running == false) {
                    timer.start()
                    txtBtnStartPause.text = "暫停"
                }
                else {
                    timer.stop()
                    txtBtnStartPause.text = "開始"
                }
            }
        }
    }

    Rectangle {
        id: btnReset
        width: 240
        height: 100
        color: "red"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: txtBtnReset
            text: "重置"
            font.pixelSize: 28
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                timer.stop()
                txtBtnStartPause.text = "開始"
                txtSecond.seconds = 0
            }
        }
    }

    Text {
        id: txtSecond
        anchors.centerIn: parent
        property int seconds: 0
        text: seconds + " 秒"
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: txtSecond.seconds += 1
    }

}

