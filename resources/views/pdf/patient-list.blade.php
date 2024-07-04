<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Lista Pacientes</title>
  <style>
    .container {
      max-width: 100%;
      margin: auto;
      font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }

    .light-table {
      width: 100%;
      padding-top: 0;
      padding-bottom: 0;
      margin-bottom: 5px;
      text-align: left;
    }

    .leftdiv {
      float: left;
      position: relative;
      width: 33%;
    }

    .leftdiv p {
      display: block;
      width: 75%;
      /* margin: 0 auto !important; */
    }

    .leftdivcontainer {
      vertical-align: middle;
      width: 100%;
      text-align: center;
    }

    .clearfix:after {
      clear: both;
    }

    .clearfix:before,
    .clearfix:after {
      content: " ";
      display: table;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    table th,
    table td {
      border: 1px solid #C6C6C6;
      padding: 0.625em;
      text-align: center;
      font-weight: bold;
    }

    table tbody tr {
      border: 1px solid #ddd;
      font-size: 13px;
      background-color: #f2f4f8;
    }

    table thead th {
      padding-top: 6px;
      padding-bottom: 6px;
      background-color: #0B35AA;
      color: white;
      text-transform: uppercase;
      font-size: 0.85em;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="light-table">
      <div class="leftdivcontainer clearfix">
        <div class="leftdiv">
          <div style="text-align: left; width: 60%; padding: 10px;">
            <img src="{{url('/images/logo.png')}}" style="width:200px; height:50px;">
          </div>
        </div>
        <div class="leftdiv" style="margin-top: 0;">
          <div style="color: #000; font-size: 22px; font-weight: bold; text-decoration: underline;">LISTA GENERAL DE PACIENTES</div>
        </div>
        <div class="leftdiv">
          <div style="text-align: right;"><span style="font-weight: bold;">Fecha: </span>{{ date('d/m/Y') }}</div>
        </div>
      </div>
    </div>
    <table>
      <thead>
        <tr>
          <th width="50px">Nombres</th>
          <th width="50px">Apellidos</th>
          <th width="50px">F.Nacimiento</th>
          <th width="50px">Colegio</th>
          <th width="50px">Curso</th>
          <th width="50px">Teléfono</th>
          <th width="50px">Estado</th>
        </tr>
      </thead>
      <tbody>
        @foreach($patients as $patient)
          <tr style="page-break-inside: avoid;">
            <td class="text-content">{{ $patient['names'] }}</td>
            <td class="text-content">{{ $patient['surnames'] }}</td>
            <td class="text-content">{{ $patient['birthdate'] }}</td>
            <td class="text-content">{{ $patient['school'] }}</td>
            <td class="text-content">{{ $patient['course'] }}</td>
            <td class="text-content">{{ $patient['phone'] }}</td>
            <td class="text-content">{{ $patient['status'] }}</td>
          </tr>
        @endforeach
      </tbody>
    </table>
  </div>
</body>
</html>
