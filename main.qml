import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
             anchors.centerIn: parent
             width: 100
             height: 100
             color: "green"
             radius: 5
             visible: true

             Image {
                 property url thunmbnail:""
                 id: img
                 visible: true
                 asynchronous: true
                 anchors{
                 fill: parent
                 }
                 fillMode: Image.PreserveAspectCrop
                 source: "images/love.webp"
                 onStatusChanged: {
                     if(img.status == Image.Ready) {
                         grabToImage(function(result){
                                     img.thunmbnail = result.url
                         });
                     }
                 }

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

                 Drag.imageSource: img.thunmbnail;
             }

    }
}
