# Testing-Mock-Data

Mock-Daten für Datenbank- und Web-Projekte – damit HTL-Schülerinnen und -Schüler ihre Projekte nicht
mühsam von Hand befüllen müssen. Verfügbar in den Formaten **SQL**, **JSON** und **CSV**.

---

## Dateiübersicht

| Datei | Format | Inhalt |
|---|---|---|
| `sql/ecommerce_erp.sql` | SQL | Tabellen & ~100 Datensätze (E-Commerce/ERP) |
| `json/users.json` | JSON | 50 fiktive User-Objekte (User-Management) |
| `csv/sensor_data.csv` | CSV | 200 IoT-Sensor-Messwerte |

---

## SQL – `sql/ecommerce_erp.sql`

Das Skript erstellt vier Tabellen (`Users`, `Products`, `Orders`, `OrderDetails`) mit korrekten
Foreign-Key-Beziehungen und befüllt sie mit realistischen Testdaten.
Es ist sowohl mit **MSSQL (SQL Server)** als auch mit **PostgreSQL** kompatibel.

### Ausführen mit MSSQL (sqlcmd)

```
sqlcmd -S localhost -U sa -P <Passwort> -d <Datenbankname> -i sql/ecommerce_erp.sql
```

### Ausführen mit PostgreSQL (psql)

```
psql -h localhost -U postgres -d <Datenbankname> -f sql/ecommerce_erp.sql
```

### Ausführen in einem GUI-Tool

Öffne die Datei *sql/ecommerce_erp.sql* in **SQL Server Management Studio**, **Azure Data Studio**
oder **pgAdmin** und führe sie mit *F5* (bzw. *Execute*) aus.

---

## JSON – `json/users.json`

Die Datei enthält 50 User-Objekte mit den Feldern
`id`, `firstname`, `lastname`, `email`, `role` (*Admin* / *User*), `createdAt` und einem
verschachtelten `address`-Objekt.

### Einlesen in C#

```csharp
using System.IO;
using System.Text.Json;

string json = File.ReadAllText("json/users.json");
var users = JsonSerializer.Deserialize<List<User>>(json);
```

Definiere dazu eine passende Klasse `User` mit den entsprechenden Properties
(z. B. *public string Firstname { get; set; }*).

### Einlesen in Python

```python
import json

with open("json/users.json", encoding="utf-8") as f:
    users = json.load(f)

print(users[0]["firstname"])  # Lena
```

---

## CSV – `csv/sensor_data.csv`

Die Datei enthält 200 stündliche Messwerte von vier fiktiven Sensoren.
Spalten: `Timestamp`, `SensorID`, `Temperature`, `Humidity`.

### Einlesen in C# (CsvHelper)

```csharp
using System.Globalization;
using System.IO;
using CsvHelper;

using var reader = new StreamReader("csv/sensor_data.csv");
using var csv = new CsvReader(reader, CultureInfo.InvariantCulture);
var records = csv.GetRecords<SensorRecord>().ToList();
```

Installiere *CsvHelper* zuerst mit *dotnet add package CsvHelper*.

### Einlesen in Python (pandas)

```python
import pandas as pd

df = pd.read_csv("csv/sensor_data.csv")
print(df.head())
```

Installiere *pandas* zuerst mit *pip install pandas*.

---

## Lizenz

Alle Daten sind frei erfunden und dürfen für Lern- und Testzwecke uneingeschränkt verwendet werden.
