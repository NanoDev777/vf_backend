<?php

namespace App\Exports\Excel;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
// use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class PatientsExport implements FromCollection, WithHeadings, WithColumnWidths, WithEvents
{
	use Exportable;

	private $patients;

	public function __construct($patients)
    {
        $this->patients = $patients;
    }

    public function collection()
    {
        return collect($this->patients);
    }

    public function headings(): array
    {
        return [
            'NOMBRE(S)',
            'APELLIDOS',
            'F.NACIMIENTO',
            'COLEGIO',
            'CURSO',
            'TELÉFONO',
            'TUTOR',
            'ESTADO',
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 25,
            'B' => 30,
            'C' => 17,
            'D' => 30,
            'E' => 25,
            'F' => 15,
            'G' => 35,
            'H' => 15,
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $cellRange = 'A1:O1';
                $styleHeader = [
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => 'thin',
                            'color' => ['rgb' => '808080']
                        ],
                    ],
                    'font' => [
                        'size'      =>  11,
                        'bold'      =>  true
                    ],
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                        'color' => ['rgb' => 'e8e8e8']
                    ]
                ];
                $event->sheet->getStyle($cellRange)->applyFromArray($styleHeader)
                ->getAlignment()->setWrapText(true)
                ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER)
                ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
            },
        ];
    }
}
