# Data Formats

RESIDENT uses capture-recapture encounter histories. In every format, `1` means detected and `0` means not detected. A zero does not prove absence.

## Program MARK-Style Table

```text
# dates: 2022-01-01 2022-01-08 2022-01-15
id encounter_history frequency
Dolphin_001 101 1
Dolphin_002 010 1
```

## SOCPROG / Long CSV

```csv
id,date
Dolphin_001,2022-01-01
Dolphin_002,2022-01-01
Dolphin_001,2022-01-08
```

## Wide CSV

```csv
id,2022-01-01,2022-01-08,2022-01-15
Dolphin_001,1,0,1
Dolphin_002,0,1,0
```

## Original MARK `.inp`

```text
/*Dolphin_001*/101 1;
/*Dolphin_002*/010 1;
```

If no date companion file is supplied, RESIDENT can analyze the detection history but treats dates as synthetic ordering placeholders.

## Excel

Excel import expects a worksheet that looks like either SOCPROG long format or wide CSV. Install `readxl` for best Excel support.
