import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("WaterMotor v0.3")
    Rectangle{
        id: header;
        anchors.top: parent.top
        height: 10
        width: parent.width
        color: "blue"
        Text {
            id: text
            text: qsTr("Конфигурация   Вид  ?")
            color: black
        }
    }
    Rectangle{
        id: menu
        width: parent.width
        height: 40
        color: "gray"
        anchors.top: header.bottom
        Button{
            id: f
            height: 30
            width: 30
            Image {
                height: 30
                width: 30
                id: folder
                source: "folder.png"
            }
            onClicked: dataModel.append({})
        }
        Button{
            id:s
            height: 30
            width: 30
            anchors.left: f.right
            Image {
                height: 30
                width: 30
                id: save
                source: "save.png"
            }
            onClicked: dataModel.append({})
        }
        Button{
            id:p
            height: 30
            width: 50
            anchors.left:s.right
            Image {
                height: 30
                width: 50
                id: plus

                source: "plus minus.png"
            }
            onClicked: dataModel.append({})
        }
        Button{
            id:sett
            height: 30
            width: 30
            anchors.left:p.right
            Image {
                height: 30
                width: 30
                id: setting

                source: "settings.png"
            }
            onClicked: dataModel.append({})
        }
    }

    Rectangle{
        id: main_window
        width: parent.width - 150
        height: 430
        anchors.top: menu.bottom
        anchors.left: parent.left

        ListModel {
            id: dataModel

            ListElement {
                adress: "1"
                sost: "Недоступен"
                kalib_top: "0.00мм"
                kalib_bot: "0.00мм"
                polozh_izm: "0.00мм"

            }
            ListElement {
                adress: "2"
                sost: "Недоступен"
                kalib_top: "0.00мм"
                kalib_bot: "0.00мм"
                polozh_izm: "0.00мм"
            }
            ListElement {
                adress: "3"
                sost: "Недоступен"
                kalib_top: "0.00мм"
                kalib_bot: "0.00мм"
                polozh_izm: "0.00мм"
            }
            ListElement {
                adress: "4"
                sost: "Недоступен"
                kalib_top: "0.00мм"
                kalib_bot: "0.00мм"
                polozh_izm: "0.00мм"
            }
        }

        TableView {
            id: view
            width: parent.width
            anchors.margins: 10
            anchors.fill: parent
            model: dataModel
            clip: true

            TableViewColumn {
                width: 40
                title: "Адрес"
                role: "adress"
            }
            TableViewColumn {
                width: 40
                title: "Состояние"
                role: "sost"
            }
            TableViewColumn {
                width: 40
                title: "Текущее положение"
                role: "polozh"
            }
            TableViewColumn {
                width: 40
                title: "Калибровка верхняя"
                role: "kalib_top"
            }
            TableViewColumn {
                width: 40
                title: "Калибровка нижнее"
                role: "kalib_bot"
            }
            TableViewColumn {
                width: 40
                title: "Положение измерения"
                role: "polozh_izm"
            }
            TableViewColumn {
                width: 40
                title: "Верхний предел"
                role: "top_limit"
            }
            TableViewColumn {
                width: 40
                title: "Нижний предел"
                role: "bot_limit"
            }
            TableViewColumn {
                width: 40
                title: "Напряжение питания"
                role: "napryazh_pit"
            }
            TableViewColumn {
                width: 40
                title: "Скорость мм/сек"
                role: "speed"
            }
            TableViewColumn {
                width: 40
                title: "Шагов/мм"
                role: "shag"
            }
            TableViewColumn {
                width: 40
                title: "Режим микрошага"
                role: "microshag"
            }
            TableViewColumn {
                width: 40
                title: "Ток удержание"
                role: "tok_ud"
            }
            TableViewColumn {
                width: 40
                title: "Ток вращение"
                role: "tok_vrash"
            }
            TableViewColumn {
                width: 40
                title: "Режим спада тока"
                role: "spad"
            }
            TableViewColumn {
                width: 40
                title: "Положение,шаг"
                role: "polozh_shag"
            }
            itemDelegate: Item {
                Text {
                    anchors.centerIn: parent
                    renderType: Text.NativeRendering
                    text: styleData.value
                }
            }
        }
    }

    Rectangle{
        id: parametr
        width: 150
        height: 430
        anchors.right: parent.right
        anchors.top: menu.bottom

        Rectangle{
            id:connect
            anchors.top: parent.top
            height: 10
            width: parent.width
            anchors.left: parent.left
            Text {
                id: t
                text: qsTr("Подключение")
                color: "black"
            }
        }
        Text {
            id: port
            text: qsTr("Порт")
            anchors.top: connect.bottom
            anchors.left: parent.left
        }
        Button{
            id: but1
            anchors.right: parent.right
            anchors.top: connect.bottom
            text: "Авто"
            onClicked: dataModel.append({})
        }
        Rectangle{
            id: list
            width: parent.width
            height: parent.height - 30
            anchors.top: but1.bottom
            anchors.left: parent.left
            ListModel {
                id: dataModel1
                ListElement{
                    type: "Управление активным"
                    text: "Вверх до 0"
                }
                ListElement{
                    type: "Управление активным"
                    text: "Вверх"
                }
                ListElement{
                    type: "Управление активным"
                    text: "Стоп"
                }
                ListElement{
                    type: "Управление активным"
                    text: "Вниз"
                }
                ListElement{
                    type: "Управление активным"
                    text: "Вниз до 0"
                }
                ListElement{
                    type: "Общее управление"
                    text: "Вверх до 0"
                }
                ListElement{
                    type: "Общее управление"
                    text: "Вверх"
                }
                ListElement{
                    type: "Общее управление"
                    text: "Стоп"
                }
                ListElement{
                    type: "Общее управление"
                    text: "Вниз"
                }
                ListElement{
                    type: "Общее управление"
                    text: "Вниз до 0"
                }
                ListElement{
                    type: "Калибровка:"
                    text: "Верхнее"
                }
                ListElement{
                    type: "Калибровка:"
                    text: "Нижнее"
                }
                ListElement{
                    type: "Калибровка:"
                    text: "Измерение"
                }
            }

            ListView {
                id: view1

                anchors.margins: 10
                anchors.fill: parent
                spacing: 10
                model: dataModel1
                clip: true

                section.property: "type"
                section.delegate: Rectangle {
                    width: view1.width
                    height: 40
                    color: "lightgreen"
                    Text {
                        anchors.centerIn: parent
                        renderType: Text.NativeRendering
                        font.bold: true
                        text: section
                    }
                }

                delegate: Rectangle {
                    width: view1.width
                    height: 10
                    border {
                        color: "black"
                        width: 1
                    }

                    Text {
                        anchors.centerIn: parent
                        renderType: Text.NativeRendering
                        text: model.text
                    }
                }
            }
        }
    }
}
