-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Mai 2022 um 15:26
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `myprojects`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fach_learn`
--

CREATE TABLE `fach_learn` (
  `id` int(11) NOT NULL,
  `fach` varchar(255) DEFAULT NULL,
  `fach_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `fach_learn`
--

INSERT INTO `fach_learn` (`id`, `fach`, `fach_id`) VALUES
(1, 'wirtschaft', 1),
(3, 'Informatik', 1),
(4, 'Elektronik', 1),
(5, 'Software-Development', 1),
(16, 'wirtschaftslehre', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quest_learn`
--

CREATE TABLE `quest_learn` (
  `id` int(11) NOT NULL,
  `frage` text DEFAULT NULL,
  `antwort` text DEFAULT NULL,
  `quest_id` int(11) DEFAULT NULL,
  `fach_category` int(11) DEFAULT NULL,
  `thema_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `quest_learn`
--

INSERT INTO `quest_learn` (`id`, `frage`, `antwort`, `quest_id`, `fach_category`, `thema_category`) VALUES
(1, 'Schutzaufgaben', 'Unterstützung der Eingliederung schwerbehinderter Arbeitnehmer und sonstiger schutzbedürftiger Personen. Dürchsetzung von Maßnahmen für ältere Arbeitnehmer.Förderung der Integration ausländischer Arbeitnehmer.', 1, 1, 1),
(2, 'Gestaltungsaufgaben', 'Entgegennahme von Anregungen von Arbeitnehmern und Mitgliedern der JAV (Jugend- und Auszubildendenvertretung). Beantragung und Durchsetzung von Maßnahmen beim Arbeitgeber.', 1, 1, 1),
(3, 'Förderungsaufgaben', 'Dürchsetzung der tatsächlichen Gleichstellung von Männern und Frauen. Förderung der Vereinbarkeit von Familie und Erwerbstätigkeit.Vorbereitung und Dürchführung der Wahl der JAV (Jugend- und Auszubildendenvertretung).Förderung und Sicherung der Beschäftigung im Betrieb.', 1, 1, 1),
(4, 'Überwachungsaufgaben', 'Überwachung der Dürchführung der zugunsten der Arbeitnehmer geltenden Gesetze, Verordnungen, Unfallverhütungsvorschriften und Betriebsvereinbarungen.', 1, 1, 1),
(5, 'Freie Güter', 'Freie Güter sind im Überfluss vorhanden und kosten deshalb grundsätzlich kein Geld (z. B. Luft, Meersand).', 1, 1, 2),
(6, 'Konsumgüter', 'Finden in Haushalten Verwendung als Verbrauchsgüter (z.B. Milch) oder als Gebrauchsgüter (z.B. Waschmaschine)', 1, 1, 2),
(7, 'Produktionsgüter', 'Finden in Betrieben Verwendung als Verbrauchsgüter (z.B. Spanplatten) oder als Gebrauchsgüter (z.B. eine Bandsäge).', 1, 1, 2),
(8, 'Wirtschaftsgüter', 'Wirtschaftsgüter sind alle Güter die die materiellen Bedürfnisse der Menschen befriedigen und werden durch ihre Knappheit definiert. Daher müssen die Menschen mit diesen Gütern wirtschaften weil Sie nicht unbegrenzt verfügbar sind wie Sonne und Luft.', 1, 1, 2),
(9, 'Unterschied Produktionsgüter und Konsumgüter', 'Beide Güterarten können als Gebrauchs- und Verbrauchsgüter dienen wie z.B. eine Waschmaschine oder eine Bandsäge. Der wesentliche Unterschied besteht darin dass Konsumgüter in Haushalten Verwendung finden und Produktionsgüter in Betrieben.', 1, 1, 2),
(10, 'primärer Wirtschaftssektor', 'Der Primärsektor beinhaltet die Gewinnung von Rohstoffen, er ist der älteste Sektor und wird auch Urproduktion genannt. Zu ihm gehören die Landwirtschaft, die Forstwirtschaft sowie die Fischerei.', 1, 1, 3),
(11, 'sekundärer Wirtschaftssektor', 'Im sekundären Sektor werden die Rohstoffe des Primärsektor ver- bzw. bearbeitet. Die Weiterverarbeitung erfolgt durch die Industrie, das Handwerk, das Baugewerbe, die Energiewirtschaft und die Wasserversorgung.', 1, 1, 3),
(12, 'tertiärer Wirtschaftssektor', 'Der Tertiärsektor beschäftigt sich ausschließlich mit Dienstleistungen. Deswegen wird er auch der Dienstleistungssektor genannt. Dienstleistungsbranchen sind zum Beispiel Kliniken, Banken und der Tourismus', 1, 1, 3),
(13, 'Ausbildungsordnung', 'Beinhaltet die Bezeichnung des Ausbildungsberufes, der anerkannt wird. Legt die Ausbildungsdauer fest, die nicht mehr als drei und nicht weniger als zwei Jahre betragen soll. Beinhaltet den Ausbildungsrahmenplan, der dem Ausbilder sowie Auszubildenden als Vorgabe für den betrieblichen Ausbildungsplan dient. Beinhaltet den Rahmenlehrplan, der die angestrebten Kompetenzen sowie Unterrichtsinhalte für den berufsbezogenen Unterricht der Berufsschule beschreibt. Beinhaltet eine Prüfungsordnung, in der die Zulassung zur Prüfung und Gliederung der Prüfung sowie das Bewerten der Prüfungsleistungen geregelt sind.', 1, 1, 4),
(14, 'Jugendarbeitschutzgesetz', 'Alles Wichtige finden minderjährige Auszubildende im Jugendarbeitschutzgesetz. Man darf z.B. als Minderjähriger nicht so viel arbeiten wie Volljährige und man hat mehr Anspruch auf Urlaub. Erst wenn man volljährig ist, wird das BBiG (Berufsbildungsgesetz) relevant.', 1, 1, 4),
(15, 'Arbeitszeitgesetz', 'Für volljährige Auszubildende regelt das Arbeitszeitgesetz die Arbeitszeit.', 1, 1, 4),
(16, 'Berufsbildungsgesetz', 'Das BBiG gibt Regelungen für die duale Ausbildung vor.Hier sind die Pflichten von Auszubildenden und Ausbilder definiert, genauso wie die Grundlagen für den Ausbildungsvertrag z.B. im §11 BBiG die Vertragsniederschrift. Auch die Vergütung, Beginn und Beendigung eines Ausbildungsverhältnisses regelt das BBiG.', 1, 1, 4),
(17, 'Entgeltfortzahlungsgesetz', 'Es wird auch EntgFG genannt und regelt das Gehalt, wenn man krank ist. Es ist auch wichtig für die Auszubildenden, weil es auch vorschreibt wie und wann man während der Ausbildung sich im Krankheitsfall melden muss.', 1, 1, 4),
(18, 'Angebotsmenge und Preis', 'Die Angebotsmenge ist umso größer, je \'größer\' der Stückpreis ist. Die Anbieter wollen also zu möglichst \'hohen\' Preisen verkaufen.', 1, 1, 5),
(19, 'Nachfragemenge und Preis', 'Die Nachfragemenge ist umso größer, je \'kleiner\' der Stückpreis ist. Die Nachfrager wollen also zu möglichst \'kleinen\' Preisen kaufen.', 1, 1, 5),
(20, 'Der Preis im Verhältnis zu Angebots- und Nachfragemenge', 'Ist der Stückpreis niedrig, so ist die angebotene Menge \'niedrig\', die nachgefragte Menge hingegen hoch. Umgekehrt gilt: ist der Stückpreis hoch, so ist die angebotene Menge \'hoch\', die nachgefragte Menge \'niedrig\'.', 1, 1, 5),
(21, 'Verhältnis von Angebotsmenge, Nachfragemenge und Preis', 'Die angebotene Menge steht also in einem geraden \'proportionalen\' Verhältnis zum Preis. Die nachgefragte Menge in einem \'antiproportionalen\' Verhältnis zum Preis.', 1, 1, 5),
(22, 'Gleichgewichtspreis', 'Bei einem bestimmten Preis sind Angebots- und Nachfragemenge identisch. Bei diesem Preis sind Angebot und Nachfrage im Gleichgewicht; deshalb nennt man ihn den \'Gleichgewichtspreis\'.Kennzeichen dieses Preises: Die verkaufte Menge ist bei diesem Preis am \'höchsten\'. Es gibt weder einen Angebots- noch einen \'Nachfrageüberschuss\'.', 1, 1, 5),
(23, 'Die verkaufte Menge (Umsatz)', 'Sie verhält sich bei steigenden Preisen wie folgt: zuerst \'steigt\' sie bis zum Gleichgewichtspreis, danach \'sinkt\' sie.', 1, 1, 5),
(24, 'Beschreibung der Marktlage', 'Bei niedrigen Preisen ist die Angebotsmenge \'geringer\' als die Nachfragemenge, d.h. es besteht ein \'Nachfrageüberschuss\'. Bei relativ hohen Preisen ist die Angebotsmenge \'höher\' als die Nachfragemenge, d.h. es besteht ein \'Angebotsüberschuss ', 1, 1, 5),
(25, 'Produktionsfaktor Arbeit', 'Wird definiert als jede legale menschliche Tätigkeit, die auf die Erzielung von Einkommen gerichtet ist. Man unterscheidet zwischen der ausführend (exekutiven) und der leitenden (dispositiver) Arbeit.', 1, 1, 6),
(26, 'Ausführende Arbeit', 'Die ausführende Arbeit umfasst Tätigkeiten, die i.d.R. weisungsabhängig sind und der unmittelbaren Bewältigung der täglichen Routinearbeiten dienen. Zum Beispiel gehört zur ausführenden Arbeit eines Kellners das Tischdecken, die Beratung und Bedienung der Gäste, das Abräumen des Tisches usw.', 1, 1, 6),
(27, 'Leitende Arbeit', 'Die leitende Arbeit dient der Planung, Organisation und Kontrolle des Produktionsablaufes und wird von leitenden Angestellten oder Firmeninhabern geleistet. So gehört beispielsweise zur leitenden Arbeit eines Supermarktes das Einteilen des Personalbedarfs, evtl. die Einstellung und Kündigung von Verkaufskräften, usw.', 1, 1, 6),
(28, 'Produktionsfaktor Boden', 'Der Produktionsfaktor Boden lässt sich in drei Kategorien untergliedern: Anbauboden -Zur Erzeugung wird er in der Land-, Forst- und Fischereiwirtschaft genutzt. Abbauboden - Wenn unersetzbare Stoffe abgebaut oder gefördert werden (Erze, Öl...). Standortboden -dient als Standort für Unternehmen aus Industrie, Handwerk und Handel.', 1, 1, 6),
(29, 'Produktionsfaktor Kapital', 'Das ist der Einsatz von Werkzeugen, Maschinen und anderen Produktionsmitteln.', 1, 1, 6),
(30, 'Ökonomische Prinzip', 'Das ökonomische Prinzip geht von folgenden Annahme aus: Die menschlichen Bedürfnisse sind unbegrenzt. Gleichzeitig stehen Mittel und Güter nicht in so ausreichendem Maße zur Verfügung, dass damit alle Bedürfnisse befriedigt werden könnten. Diesen Zustand bezeichnet man auch als Knappheit.', 1, 1, 7),
(31, 'Knappheit', 'Die Knappheit der Güter führt dazu, dass Menschen wirtschaften müssen. Das bedeutet: Sie müssen planvoll vorgehen, um die zur Verfügung stehenden Mittel und Güter bestmöglich zu nutzen. Dabei werden zwei Vorgehensweisen unterschieden: das Maximalprinzip und das Minimalprinzip.', 1, 1, 7),
(32, 'Maximalprinzip', 'Wer nach dem Maximalprinzip handelt, der möchte mit gegebenen Mitteln einen größtmöglichen Erfolg erzielen. Beilspielsweise bemüht sich ein Unternehmen, mit einer gegebenen betrieblichen Ausstattung an Maschinen, Personal und Rohstoffen, eine möglichst große Produktionsmenge zu erhalten. Dieses Prinzip wird aus Haushaltsprinzip genannt.', 1, 1, 7),
(33, 'Minimalprinzip', 'Wer nach dem Minimalprinzip handelt, der möchte ein bestimmtes Ziel mit einem möglichst geringen Mitteleinsatz erreichen. Beispielsweise versucht ein Unternehmen, eine festgelegte Materialmenge zu möglichst geringen Kosten einzukaufen. Dieses Prinzip nennt man auch Sparprinzip.', 1, 1, 7),
(35, 'Was bedeutet der Begriff Infrastruktur-Modus?', 'Als Infrastruktur-Modus bezeichnet man den Netzwerkbetrieb eines Wireless LAN mithilfe eines Access Points. Dies kannein WLAN-Router, Switch oder ein reiner AP sein der alle WLAN-Clients zu einem drahtlosen Netzwerk zusammenfasst und damit sämtliche Netzwerkfunktionen zur Verfügung stellt.', 1, 3, 9),
(36, 'Erläutern Sie drei mögliche Gründe warum die Datentransferrate eines WLAN-Access-Point nicht den angegebenen Werten entsprechen kann.', 'Die Datentransferrate hängt zum einem von den Zugriffsverfahren ab wie alle Clients im WLAN-Netzwerk die Sendeberechtigungen aushandeln. Ein weiterer wichtiger Grund ist die Distanz zwischen Client und Access Point sowie Wände und Decken. Störungen von fremden Funksystemen können sich auch negativ auf die Modulation des Funksignals auswirken und somit sinkt auch die Datentransferrate.', 1, 3, 9),
(37, 'Erklären Sie die Funktionsweise von Power over Ethernet (PoE) im Mode A', 'Beim PoE im Mode A findet eine Phantom-Speisung auch Fernspeisung genannt statt. Das bedeutet dass Strom auf den Datenführenden Adernpaaren übertragen wird. Auf Pin 1 und 2 erhalten die Geräte Daten und durch Phantomspeisung übertragene positive Spannung. Die Übertragung von Daten und negativer Spannung findet auf den Pins 3 und 6 statt.', 1, 3, 9),
(38, 'Welche Aufgaben übernimmt der authenticator in einem WLAN-Netzwerk?', 'Der authenticator kann ein WLAN-Access-Point oder eine switch sein und agiert als eine Art Wächter wenn ein Client-Gerät eine Verbindung herstellen möchte. Der authenticator leitet die Anmeldeinformationen des Clients an den authentication server weiter, der dann über die Gültigkeit der aten entscheidet.', 1, 3, 9),
(39, 'Was versteht man unter einem WLAN Ad-hoc Netzwerk?', 'Im Ad-Hoc Modus wird kein AP benötigt. Zwei Endgeräte können eine Verbindung aufbauen und Daten austauschen. Bei der Einrichtung sind keine weiteren aktiven Elemente erforderlich. Die Hosts kommunizieren direkt über ihre WLAN-Adapter. Solange sich die Hosts gegenseitig in Reichweite befinden, ist eine Kommunikation zwischen den Hosts möglich.', 1, 3, 9),
(40, 'Was bedeutet Intra-cell Repeating?', 'Damit kann man einstellen ob die Kommunikation zwischen den per WLAN verbundenen Benutzern innerhalb einer Funkzelle erlaubt sein soll.', 1, 3, 9),
(41, 'Was bedeutet Walled Garden?', 'Es ist eine geschlossene Platform auf der Restriktionen vom Betreiber festgellegt sind, auf den der Benutzer nur zugelassene Anwendungen benutzen kann oder nur bestimmte Websites besuchen darf.', 1, 3, 9),
(42, 'Was ist unter credentials zu verstehen?', 'Unter credentials in einem WLAN-Netzwerk versteht man Benutzernamen, Passwörter oder digitale Zertifikate die zur Authentikation der Clients dienen.', 1, 3, 9),
(43, 'Erläutern Sie das Verfahren CSMA/CA.', 'CSMA/CA steht für Carrier Sense Multiple Access/Collision Avoidance. Bei dem Verfahren nimmt der zentrale AP Anfragen an und erteilt einem der Geräte den Zugriff auf den Übertragungskanal. Dieses Verfahren wird eingesetzt wenn ein Endgerät mit einem zentralen AP verbunden ist aber ein anderes Endgerät detektieren muss das auf der gegenüberliegenden Ende der maximalen Reichweite des AP befindet.', 1, 3, 9),
(44, 'Aus welchen Gründen wird CSMA/CD nicht verwendet?', 'Bei langen Leitungen, sehr vielen Stationen (wenn sie über 30 % der Bandbreite des Ethernetzes ausnutzen), vielen Repeatern (Signalaufbereiter und Verstärker) entstehen unterschiedliche Signallaufzeiten die zu häufigen Kollisionen der Funksignalen führen. Hier wird das CSMA/CD (Carrier Sense Multiple Access with Collision Detection) nicht verwendet.', 1, 3, 9),
(45, 'Was ist ein Netzwerk?', 'Das ist die Verbindung von mindestens zwei Computersystemen, entweder per Kabel oder drahtlos', 1, 3, 10),
(46, 'Was ist ein Protokoll?', 'In der Informatik und in der Telekommunikation ist ein Protokoll eine Menge von Regeln, die Syntax, Semantik und Synchronisation der Kommunikation bestimmt. Handelt es sich um die Kommunikation in einem Rechnernetz, so spricht man von einem Netzwerkprotokoll.', 1, 3, 10),
(47, 'Was ist ein Server?', 'Es gibt zwei unterschiedliche Arten von Server: Ein Hardware Server bezeichnet einen Computer der seine Resourcen über ein Netzwerk zur Verfügung stellt. Auf ihm laufen neben dem Betriebssystem ein oder mehrere softwarebasierte Server. Oftmals wird ein hardwarebasierter Server auch Host genannt. Softwarebasierte Server: Ein softwarebasierter Server ist ein Programm, das einen speziellen Dienst anbietet. Dieser Dienst wird von anderen Programmen -auch Clienst genannt- lokal oder über ein Netzwerk in Anspruch genommen.', 1, 3, 10),
(48, 'Was ist ein Client?', 'Bei einem CLient handelt es sich entweder um ein Computer bzw. Endgerät, das selbst Dienste von einem Server abruft. Oder es ist eine clientseitige Anwendung oder Clientprogramm, das auf dem Endgerät eines Netzwerks ausgeführt wird und mit einem Server (Zentralrechner) kommuniziert.', 1, 3, 10),
(49, 'Wofür steht die Abkürzung HTTP?', 'Http steht für Hypertext Transfer Protocol. Es ist ein zustandsloses Protokoll und dient der Übertragung von Daten auf der Anwendungsschicht über ein Rechnernetz.', 1, 3, 10),
(50, 'Wie heißt die oberste Ebene der Netzwerkkommunikation?', 'Sie heißt Anwendungsschicht und ist nach dem OSI-Referenzmodell die oberste Ebene der NEtzwerkkommunikation. Die Anwendungsschicht führt Dienste für die Anwendung aus, die vom Endbenutzer verwendet werden.', 1, 3, 10),
(51, 'Wie heißt die zweite Ebene der Netzwerkkommunikation?', 'Nach dem OSI-Referenzmodell ist das die Sicherungsschicht. Sie erstellt und adressiert Frames für die Host-zu-Host Übertragung in lokalen Netzwerken (LANs) mithilfe von Netzzugangsgeräten.', 1, 3, 10),
(52, 'Wofür steht SYN und SYNACK? Wozu wird es genutzt im TCP?', 'Es ist der Verbindungsaufbau in der TCP-Kommunikation. Der Verbindungsaufbau läuft nach dem Three-Way-Handshake ab. Zuerst schickt der Client an den Server einen Verbindungswunsch (SYN). Der Server bestätigt den Erhalt der Nachricht (ACK) und äußert ebenfalls seinen Verbindungswunsch (SYN). Danach erfolgt der Datenaustausch zwischen Client und Server.', 1, 3, 10),
(53, 'Was passiert wenn eine Datei zu groß ist um sie als Paket zu verschicken?', 'Die TCP-Software des Senders teilt die Daten auf mehrere Pakete auf, fügt einen TCP-Header zu jedem Paket hinzu und versendet die TCP-Segmente. Dieser Vorgang wird Segmentierung genannt. Die TCP-Segmente werden nacheinander abgeschickt.', 1, 3, 10),
(54, 'Wofür werden die Datenpakete nummeriert?', 'Bei der Versendung der TCP-Segmente bzw Datenpakete kommen diese beim Empfänger nicht notwendigerweise in derselben Reihenfolge an wie sie versendet wurden, da im Internet unter Umständen jedes TCP-Segment einen anderen Weg nimmt. Damit die TCP-Software beim Empfänger die Datenpakete wieder sortieren kann, ist jedes Segment nummeriert.', 1, 3, 10),
(55, 'Wofür steht UDP, wofür wird es genutzt und warum?', 'UDP ist ein minimales, verbindungsloses Netzwerkprotokoll, das zur Transportschicht gehört, nach dem OSI-Referenzmodell. UDP steht für User Datagram Protocol. UDP ermöglicht Anwendungen den Versand von Datagrammen. Das sind in sich geschlossene, unabhängige Dateneinheiten, die ohne weitere Verbindungssicherung zwischen zwei Endgeräten verschickt werden können. Dieses Verfahren ist konzeptionell sehr einfach und zeichnet sich vor allem durch seinen geringen Protokoll-Overhead aus, sprich nur die Empfänger- und Absenderadressen  sowie die Nutzdaten sind enthalten. UDP ist ein nicht-zuverlässiges, ungesichertes Übertragungsprotokoll das aber sehr schnell ist. UDP wird häufig bei Servern eingesetzt, die viele Clients bedienen, Multimediaanwendungen oder Mini- und Mikrocomputer.', 1, 3, 10),
(56, 'Wie heißt die dritte Schicht der Netzwerkkommunikation und wie heißt das genutzte Protokoll?', 'Die dritte Schicht der Netzwerkkommunikation heißt Vermittlungsschicht und nutzt das IP Protokoll (Internet Protocol) und adressiert Pakete zum Ende-zu-Ende-Transport in andere Netzwerke.', 1, 3, 10),
(57, 'Was ist eine IP und woraus besteht sie?', 'Das Internet Protokoll (IP) ist für die Weitervermittlung von Paketen und die Wegwahl (Routing) zuständig. Das Internetprotokoll existiert in der Version 4 oder 6 und besteht aus einem Netzanteil und einem Hostanteil. Der Netzanteil identifiziert ein Teilnetz, der Hostanteil identifiziert ein Gerät (Host) innerhalb eines Teilnetzes. Das IP ist nach dem OSI-Referenzmodell in der Vermittlungsschicht angesiedelt.', 1, 3, 10),
(58, 'Was bedeutet :: in der IP Adresse?', 'Die IPv6-Adressen verwenden 128 Bit zur Speicherung von Adressen und werden hexadezimal dargestellt. Um die Darstellung weiter zu vereinfachen, werden jeweils zwei Oktette der Adresse zusammengefasst und in Gruppen durch ein Doppelpunkt getrennt dargestellt. Zur weiteren Verkürzung können Nullen am Beginn eines Blocks weggelassen werden. Ein oder mehrereaufeinander folgende Blöcke, die nur aus Nullen bestehen, können durch :: ersetzt werden - jedoch höchstens einmal in der Adresse, so dass eindeutig auf acht Blöcke aufgefüllt werden kann.', 1, 3, 10),
(59, 'Was ist eine Subnetzmaske und was sagt sie aus?', 'Die Netzmaske oder Subnetzmaske ist eine Bitmaske die Bestandteil der IPv4 und IPv6 Netzwerkprotokolle ist. Sie gibt an welche Bit-Position innerhalb der IP-Adresse für die Adressierung des Netz- und Host-Anteils genutzt werden soll. Der Netzanteil einer IPv4 oder IPv6-Adresse kann mit einer Präfixlänge definiert werden. Das ist für die Adressierung des Netzanteils genutzte Bereich innerhalb der IP-Adresse. Daraus lässt sich auch errechnen wie groß der Geräteteil bzw Hostanteil der IP-Adresse ist. Da eine IPv4 Adresse immer eine 4 Oktetten lange Bitfolge und eine IPv6 eine 8 Oktetten lange Bitfolge besitzt. Die Präfixlänge in einer Netzmaske kann man auch als Größenangabe eines IP-Netzes verstehen, wobei größere Präfixlängen kleinere Netze bedeuten, da nicht so viele Bits für Geräteteile zur Verfügung stehen.', 1, 3, 10),
(60, 'Was ist IPv4 und welche Form hat es?', 'IPv4 (Internet Protocol Version 4) war die ersteVersion des Internet Protokolls und bildet eine wichtige technische Grundlage des Internets. Es benutzt32-Bit Adressen und kann in einem Rechnernetz etwas über 4Mrd und 200 Tausend Adressen vergeben. IPv4-Adressen werden üblicherweise dezimal in vier Blöcken geschrieben. Jedes Oktett repräsentiert 8 Bit. Eine Ipv4-Adresse besteht aus einem Netzanteil, das ein Teilnetz identifiziert und einem Hostanteil, das ein Gerät (Host) innerhalb eines Teilnetzes identifiziert deren genaue Aufteilung durch eine Subnetzmaske festgelegt wird.', 1, 3, 10),
(61, 'Wofür steht DNS und was beinhaltet sie?', 'DNS steht für Domain Name System und die Aufgabe dieses Systems ist die Beantwortung von Anfragen zur Namensauflösung in IP-basierten Netzwerken. Hauptsächlich wird das DNS zur Umsetzung von Domainnamen in IP-Adressen (forward lookup) benutzt.', 1, 3, 10),
(62, 'Was ist eine Link Local IMAC Adresse?', 'Eine Link Local Adresse ist eine Netzwerkadresse und wird für die lokale Kommunikation innerhalb des Netzwerksegments gebraucht. Die MAC-Adresse (Media-Access-Control-Adress, auch Media Access Code) ist die Nummer eines Gerätes auf einer Datenverbindung und dient als eindeutiger Indentifikator des Geräts in einem Rechnernetz.', 1, 3, 10),
(63, 'Wofür steht NDP und welche Übertragungsmöglichkeiten gibt es?', 'NDP steht für Neighbor Discovery Protocol und wird dafür benutzt IPv6-Adressen in Link-Layer-Adressen aufzulösen, damit der sendende Rechner weiß, wohin er sein Paket zu schicken hat. Diese Link-Layer-Adressen dienen der Host-zu-Host-Übertragung in lokalen Netzwerken. NDP ist zwischen der Sicherungsschicht und bedient sich bei der ÜBertragung eine Neighbor Cache in dem er die Ergebnisse der Link-Layer-Adressauflösungen zwischenspeichert.', 1, 3, 10),
(64, 'Wie heißt die vierte Kommunikationsschicht und wie heißt die genutzte Spezifikation?', 'Sie heißt Transportschicht und die genutzte Spezifikation sind das TCP und UDP Verfahren zur Netzwerkkommunikation.', 1, 3, 10),
(65, 'Was ist ein Switch und was ist der Unterschied zu einem Hub?', 'Switch bedeutet Schalter oder auch Verteiler genannt. Es sorgt innerhalb eines lokalen Netwerks dafür dass die Datenpakete bzw Frames an ihr Ziel kommen. Switches arbeiten nach dem OSI-Referenzmodell auf Ebene 2-4. Ein Hub dagegen arbeitet ausschließlich auf Ebene 1 des OSI-Modells. Wenn ein Datenpaket an einem der Ports vom Hub trifft, so leitet er das Paket an alle Teilnehmer in einem lokalen Netzwerk weiter. Ein Hub fungiert als gemeinsamer Verbindungspunkt für Geräte in einem Netzwerk und ist keine Weiche wie der Switch.', 1, 3, 10),
(66, 'Wie funktioniert die Broadcast-Topologie?', 'Broadcast bedeutet dass jeder Host seine Daten an alle anderen Hosts im Netzwerkmedium sendet ohne feste Reihenfolge. Jeder Empfänger eines Broadcasts entscheidet selbst, ober im Falle seiner Zuständigkeit die erhaltene Nachricht entweder verarbeitet oder stillschweigend verwirft.', 1, 3, 11),
(67, 'In welcher Technik wird die Broadcast-Topologie benutzt?', 'Es wird z.B. beim Rundfunk (UKW/DAB) oder Fernsehen (Satellit, Kabel, Funk) verwendet.', 1, 3, 11),
(68, 'Wie funktioniert die Token-Zugriff-Topologie?', 'Es wird eine Art elektronischer Gutschein (Token) nacheinander an jeden Host übertragen. Mit diesem Token erhält der Host die Genehmigung, Daten über das Netz zu senden. Wenn der Host keine Daten zu versenden hat, leitet er die Erlaubnis an den nächsten Host weiter und der Vorgang wiederholt sich.', 1, 3, 11),
(69, 'In welcher Technik wird die Token-Zugriff-Topologie benutzt?', 'Die Token-Zugriff-Topologie ist eine Datenübertragungsverfahren, das bei Token-Ring-Netzwerken angewendet wird.', 1, 3, 11),
(70, 'Welches Zugriffsverfahren nutz FDDI (Fiber Distributed Data Interface)?', 'Token-Zugriff-Verfahren', 1, 3, 11),
(71, 'Welches Zugriffsverfahren nutzt Token Ring?', 'Token-Zugriff-Verfahren', 1, 3, 11),
(72, 'Was ist die physikalische Topologie?', 'Die physikalische Topologie ist der eigentliche Verkabelungsplan der Medien.', 1, 3, 11),
(73, 'Was ist die logische Topologie?', 'Bei der logischen Topologie wird der Zugriff auf die Medien durch die Hosts definiert.', 1, 3, 11),
(74, 'Welche Aufgabe hat die logische Topologie?', 'Die logische Topologie eines Netzes bestimmt, wie die Hosts über das Medium kommunizieren.', 1, 3, 11),
(75, 'Welche zwei wesentliche Arten von logischen Toplogien werden unterschieden?', 'Broadcasttopologie und Zugriff-Token-Topologie', 1, 3, 11),
(76, 'Wie ist das UTP (Unshielded Twisted Pair) Kabel aufgebaut?', 'Es ist ein Kabel ohne Abschirmung (ungeschirmt), ausschließlich mit vier verdrillten Adernpaaren (Twisted Pair, TP).', 1, 4, 12),
(77, 'Warum ist das UTP-Kabel so aufgebaut?', 'Das UTP-Kabel zeichnet sich durch seine Flexibilität und geringen Kosten aus. Um dabei ein gewissen Schutz gegen Störanfälligkeit zu gewinnen sind die Adernpaare verdrillt und somit entsteht ein elektromagnetisches Feld das gleichzeitig jedes Störsignal von außerhalb löscht.', 1, 4, 12),
(78, 'Was sind EMI- und RFI- Signale?', 'EMI-Signale sind elektromagnetische Störungen. RFI-Signale sind Hochfrequenzstörungen.', 1, 4, 12),
(79, 'Wie ist das STP (Shielded Twisted Pair) Kabel aufgebaut?', 'Bei dem STP-Kabel handelt es sich um ein symmetrisches Kabel mit paarig verdrillten und geschirmten Adern. Die Standardausführung von STP-Kabeln sind zwei und vierpaarig. Als Gesamtschirmung des Adernbündels wird eine Geflechtschirmung verwendet. Als Schirmung der Adernpaare dient in aller Regel ein Folienschirm oder Drahtgeflecht oder beides.', 1, 4, 12),
(80, 'Warum ist das STP-Kabel so aufgebaut?', 'Die Abschirmung des Adernbündels und die Schirmung der Adernpaare selbst bietet einen noch besseren SChutz von Störungen als UTP-Kabel.', 1, 4, 12),
(81, 'Wie ist das Koaxial Netzwerkkabel aufgebaut?', 'Ein Koaxialkabel ist konzentrisch aufgebaut und hat keine verdrillten Adernpaare. Im Innern befindet sich eine einzelne starre Kupferader oder Litze. Dieser Innenleiter wird auch Seele genannt. Darüber kommt eine ISolation oder auch Dielektrikum genannt. Es ist eine schwach- oder nichtleitende Substanz die den Innenleiter vom Außenleiter trennt. Darüber befindet sich ein Schirmgeflecht als Außenleiter. Ein Außenschutzmantel schützt das Kabel vor äußeren Umwelteinflüssen.', 1, 4, 12),
(82, 'Wo wird UTP-Kabel eingesetzt?', 'UTP-Kabel sind wegen ihres geringen Außendurchmessers und der fehlenden Schirme einfach zu verarbeiten und zu installieren. Sie werden in lokalen Netzwerken bei hoher Packungsdichte gerne verbaut und sind preisgünstiger als STP-Kabel.', 1, 4, 12),
(83, 'Wo wird STP-Kabel eingesetzt?', 'STP-Kabel unterstützen höhere Übertragungsraten über größere Entfernungen. STP-Kabel werden häufig in firmeninternen Netzwerken verlegt und verbinden die Endgeräte als Ethernet-Kabel.', 1, 4, 12),
(84, 'Wo wird Koaxialkabel eingesetzt?', 'In der NEtzwerktechnik spielen Koaxialkabel keine große Rolle mehr. Bis in die 1990er Jahre wurden Koaxkabel auch für Ethernet Netzwerke verwendet. Koaxkabel werden noch zur Übertragung hochfrequenter unsymetrischer Signale eingesetzt wie bei Anbietern von Kabelfernsehen. Eine Sonderanwendung haben Koaxkabel in der Radartechnik.', 1, 4, 12),
(85, 'Warum ist eine Normung (zB TIA/EI568A/B) gut?', 'EIA/TIA-568A und EIA/TIA-568B sind Standards für die Kontaktierung von achtpoligen RJ-45 Steckern und Buchsen. Es dient auch zur Festlegung der Paarung und Farbe. Es kann passieren dass ein Adernpaar falsch verdrahtet wird wenn zB zwei Adern verschiedener Paare als ein Adernpaar verwendet werden, es entstehen dann Fehler im Computernetz. Das soll die Normung verhindern. Durch die Festlegung der Farbzuordnungen nach der Normung kann man die Zugehörigkeit der Kabel zu den RJ-45 Steckern oder Buchsen zurodnen.', 1, 4, 12),
(86, 'Was ist Informationssicherheit?', 'Es beschäftigt sich mit dem Schutz von Informationen. Die Aufgaben der Informationssicherheit ist es die Aufrechterhaltung der Vertraulichkeit, Integrität und Verfügbarkeit.', 1, 5, 13),
(87, 'Was ist Vertraulichkeit?', 'Bei der Vertraulichkeit geht es darum, die Informationen bzw Daten vor unzulässigem Lesezugriff zu schützen.', 1, 5, 13),
(88, 'Was ist Integrität?', 'Die Integrität der Informationen bzw Daten meint ihre Unversertheit. Es gilt die Daten vor böswilliger oder versehentlicher Veränderung oder Löschung zu schützen.', 1, 5, 13),
(89, 'Was ist Verfügbarkeit?', 'Informationen bzw Daten sind verfügbar, wenn sie für den dafür vorgesehenen Personenkreis gelesen und geschrieben werden können.', 1, 5, 13),
(90, 'Was ist der Unterschied zwischen Datenschutz und Datensicherheit?', 'Beim Datenschutz geht es um den Schutz personenbezogener Daten und unter welchen Vorraussetzungen personenbezogene Daten erhoben, verarbeitet oder genutzt werden dürfen. Die Datensicherheit befasst sich mit dem generellen Schutz von Daten. Darunter fallen nicht nur personenbezogene Daten sondern auch sämtliche Daten eines Unternehmens. Bei der Datensicherheit geht es auch nicht darum ob Daten verarbeitet oder erhoben werden dürfen wie beim Datenschutz sondern welche Schutzmaßnahmen für die Sicherheit der Daten ergriffen werden müssen.', 1, 5, 13),
(91, 'Was ist das IT-Grundschutzkompendium?', 'Es bietet eine Möglichkeit Informationssicherheit mithilfe eines standardisierten Vorgehens umzusetzen. Bausteine spielen im Kompendium eine wesentliche Rolle. Es wird zwischen Prozessbausteinen und Systembausteinen unterschieden. Die beiden Bausteingruppen werden in weitere Schichten unterteilt.', 1, 5, 13),
(92, 'Was ist der Erlaubnisvorbehalt?', 'Die Verarbeitung von personenbezogenen Daten ist grundsätzlich verboten. Es existieren aber Ausnahmen von diesem Grundsatz. Sofern: Es eine Belehrung stattfand, die Daten bereits öffentlich zugänglich sind oder die Daten gemäß einer gesetzlichen Ermächtigung erhoben werden.', 1, 5, 13),
(93, 'Was ist die Zweckbindung?', 'Die Verarbeitung von personenbezogenen Daten ist grundsätzlich nur zu dem Zweck zulässig, zu dem diese auch erhoben wurden.', 1, 5, 13),
(94, 'Was ist die Datenminimierung?', 'Der Umfang der Daten muss dem Zweck angemessen und erbeblich sowie auf das für die Zwecke der Verarbeitung notwendige Maß beschränkt sein (Verbot unnötiger Vorratsdatenhaltung oder Vermeidung des Personenbezugs).', 1, 5, 13),
(95, 'Was ist die Richtigkeit?', 'Die Daten müssen sachlich richtig und erforderlichenfalls auf dem neuesten Stand sein.', 1, 5, 13),
(96, 'Was ist die Speicherbegrenzung?', 'Die Daten müssen in einer Form gespeichert werden, die die Identifizierung der betroffenen Personen nur so lange ermöglicht, wie es für die Zwecke, für die sie verarbeitet werden, erforderlich ist.', 1, 5, 13),
(97, 'Was ist die Integrität und Vertraulichkeit in Bezug auf die Datenschutzrechtlichen Prinzipien?', ' Die Daten müsse in einer Weise verarbeitet werden, die eine angemessene Sicherheit der personenbezogenen Daten gewährleistet.', 1, 5, 13),
(98, 'Was ist die Rechenschaftspflicht?', 'Der Verantwortliche ist für die Einhaltung der Grundsätze verantwortlich und muss dessen Einhaltung nachweisen können.', 1, 5, 13),
(101, 'Warum haben wir so viel Wirtschaft in der Schule?', 'Weil die Politiker nicht mehr auf ihr Leben klar kommen und Panik schieben anstatt Wert zu schaffen, kacken sie sich mit ihrer Wirtschaft ein.', 1, 1, 1),
(107, 'Was ist ein Markt?', 'Ein Markt kann jeder Ort sein, an dem Angebot und Nachfrage zusammentreffen.', 1, 16, 20),
(108, 'Nach welchen Kriterien wird ein Markt differenziert?', 'Nach der Art der gehandelten Güter zB in Konsumgüter-, Investitionsgüter und Faktormärkte. Nach der Zahl der Marktteilnehmer zB in Monopol, Oligopol, Polypol. Nach geografischen Gesichtspunkten in lokale, regionale, nationale und internationale Märkte. Nach dem potenziellen Wachstum in expandierende, stagnierende und schrumpfende Märkte.', 1, 16, 20),
(109, 'Was ist das Marktpotenzial?', 'Das Marktpotenzial bezeichnet die maximale Aufnahmefähigkeit eines Marktes für ein bestimmtes Produkt oder eine Dienstleistung.', 1, 16, 20),
(110, 'Was ist das Absatzpotential?', 'Damit ist der maximal mögliche Absatz eines Unternehmens im Markt gemeint, also der Anteil am Marktpotenzial, den das Unternehmen erreichen könnte.', 1, 16, 20),
(111, 'Was ist das Marktvolumen?', 'Das Marktvolumen bezeichnet die auf einem Markt realisierte Absatzmenge eines Produkts oder einer Dienstleistung innerhalb eines bestimmten Zeitraums.', 1, 16, 20),
(112, 'Was ist die Marktsätigung?', 'Damit ist der Grad der Sättigung des Marktpotenzials durch das Marktvolumen gemeint.', 1, 16, 20),
(113, 'Was ist der Marktanteil?', 'Der Marktanteil bezeichnet den prozentualen Anteil, den der Absatz eines Unternehmens am Marktvolumen hat.', 1, 16, 20),
(114, 'Was ist die Marktposition?', 'Das ist der Marktanteil eines Unternehmens im Vergleich zu den anderen Wettbewerbern. Der Marktanteil aller Wettbewerber in einem Markt addiert sich immer zu 100%. Die Ausweitung des Marktanteils eines Unternehmens geht daher zwangsläufig zulassten des Marktanteils eines anderen Unternehmens.', 1, 16, 20),
(115, 'Was ist die Marktforschung?', 'Damit werden alle Aktivitäten bezeichnet, die der systematischen Sammlung und Auswertung von Informationen für Marketingentscheidungen dienen.', 1, 16, 22),
(116, 'Was ist die Hauptaufgabe der Marktforschung?', 'Die Hauptaufgabe der Marktforschung ist es, Entscheidungen im Unternehmen zu unterstützen. Die Marktforschung kann dabei unterschiedliche Ziele verfolgen.', 1, 16, 22),
(117, 'Was macht die Marktanalyse?', 'Ermittelt die relevanten Informationen einmalig zu einem bestimmten Zeitpunkt. Sie dient vorrangig einem aktuellen Marktüberblick.', 1, 16, 22),
(118, 'Was ist die Marktbeobachtung?', 'Betrachtet die relevanten Informationen über einen längeren Zeitraum. Sie dient daher insbesondere der Beobachtung von Marktveränderungen.', 1, 16, 22),
(119, 'Was ist die Marktprognose?', 'Werden gleichzeitig eine Marktanalyse und eine Marktbeobachtung durchgeführt, ist das zusammenfassende Ziel die Marktprognose. Dabei wird analysiert, wie sich die Marktsituation zukünftig vermutlich entwickeln wird.', 1, 16, 22),
(120, 'Welche Arten lassen sich bei der Marktforschung unterscheiden?', 'Die Marktanalyse und die Marktbeobachtung', 1, 16, 22),
(121, 'Was ist die Markterkundung?', 'Hier handelt es sich um ein weitgehend unsystematisches und nur gelegentliches Sammeln von Marktinformationen, zB durch Kundengespräche oder Messebesuche.', 1, 16, 22),
(122, 'Was ist die Primärforschung?', 'Im Rahmen der Marktforschung wird die Gewinnung von eigenen, originären Daten als Primärforschung (\'Field Research\') bezeichnet. Es nutzt dabei drei unterschiedliche Methoden: Befragung, Beobachtung, Experiment/Test.', 1, 16, 22);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `thema_learn`
--

CREATE TABLE `thema_learn` (
  `id` int(11) NOT NULL,
  `thema` varchar(255) DEFAULT NULL,
  `thema_id` int(11) DEFAULT NULL,
  `thema_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `thema_learn`
--

INSERT INTO `thema_learn` (`id`, `thema`, `thema_id`, `thema_category`) VALUES
(1, 'aufgabenbr', 1, 1),
(2, 'güterarten', 1, 1),
(3, 'wirtschaftsstufen', 1, 1),
(4, 'ausbgesetze', 1, 1),
(5, 'marktpreis', 1, 1),
(6, 'produktionsfaktoren', 1, 1),
(7, 'ökoprinzip', 1, 1),
(9, 'Wireless LAN', 1, 3),
(10, 'Netzwerkprotokolle', 1, 3),
(11, 'Strukturierte Verkabelung', 1, 3),
(12, 'Kabel', 1, 4),
(13, 'Schutzbedarfanalyse', 1, 5),
(19, 'aufgabenbr', 1, 1),
(20, 'Marktgrößen', 1, 16),
(22, 'Marktforschung', 1, 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_learn`
--

CREATE TABLE `user_learn` (
  `id` int(11) NOT NULL,
  `benutzername` varchar(255) NOT NULL,
  `passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user_learn`
--

INSERT INTO `user_learn` (`id`, `benutzername`, `passwort`) VALUES
(1, 'jugin', 'balthazarkraft90');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `fach_learn`
--
ALTER TABLE `fach_learn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fach_id`) USING BTREE;

--
-- Indizes für die Tabelle `quest_learn`
--
ALTER TABLE `quest_learn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quest` (`quest_id`),
  ADD KEY `fk_fachcategory` (`fach_category`),
  ADD KEY `fk_themacategory` (`thema_category`);

--
-- Indizes für die Tabelle `thema_learn`
--
ALTER TABLE `thema_learn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`thema_id`),
  ADD KEY `fk_fach` (`thema_category`) USING BTREE;

--
-- Indizes für die Tabelle `user_learn`
--
ALTER TABLE `user_learn`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `benutzername` (`benutzername`),
  ADD UNIQUE KEY `passwort` (`passwort`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `fach_learn`
--
ALTER TABLE `fach_learn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `quest_learn`
--
ALTER TABLE `quest_learn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT für Tabelle `thema_learn`
--
ALTER TABLE `thema_learn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `user_learn`
--
ALTER TABLE `user_learn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `fach_learn`
--
ALTER TABLE `fach_learn`
  ADD CONSTRAINT `fk_fach` FOREIGN KEY (`fach_id`) REFERENCES `user_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `quest_learn`
--
ALTER TABLE `quest_learn`
  ADD CONSTRAINT `fk_fachcategory` FOREIGN KEY (`fach_category`) REFERENCES `fach_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_quest` FOREIGN KEY (`quest_id`) REFERENCES `user_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_themacategory` FOREIGN KEY (`thema_category`) REFERENCES `thema_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `thema_learn`
--
ALTER TABLE `thema_learn`
  ADD CONSTRAINT `fk_thema` FOREIGN KEY (`thema_category`) REFERENCES `fach_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`thema_id`) REFERENCES `user_learn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
