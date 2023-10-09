import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
             anchors.centerIn: parent
             width: 200
             height: 200
             color: "green"
             radius: 5

             AnimatedImage {
                 id: img
                 anchors{
                 fill: parent
                 }
                 fillMode: Image.PreserveAspectCrop
                 source: "images/love.webp"

             }

             MouseArea {
                 id: mouseArea

                 anchors.fill: parent
                 enabled: true
                 hoverEnabled: true
                 visible: true
                 drag.target: dragHandler
             }

             Item {
                 width: 100
                 id: dragHandler
                 anchors.fill: parent
                 visible: mouseArea.drag.active
                 Drag.active: mouseArea.drag.active
                 Drag.dragType: Drag.Automatic
                 Drag.mimeData: {
                     "text/plain": "Copied text"
                 }

                 Drag.imageSource: img.source;
             }

    }
}
