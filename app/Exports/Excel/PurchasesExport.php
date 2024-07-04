<?php

namespace App\Exports\Excel;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
// use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class PurchasesExport implements FromCollection, WithHeadings, WithColumnWidths, WithEvents
{
	use Exportable;

	private $purchases;

	public function __construct($purchases)
    {
        $this->purchases = $purchases;
    }

    public function collection()
    {
        return collect($this->purchases);
    }

    public function headings(): array
    {
        return [
            'ESPECIFICACION',
            'FECHA',
            'NIT',
            'NOMBRE O RAZÓN SOCIAL',
            'Nº DE LA FACTURA',
            'Nº DE DUI',
            'Nº DE AUTORIZACION',
            'IMPORTE TOTAL',
            'IMPORTE NO SUJETO A CREDITO FISCAL',
            'SUBTOTAL',
            'DESCUENTOS BONIFICACIONES Y REBAJAS',
            'IMPORTE BASE PARA CREDITO FISCAL',
            'CREDITO FISCAL',
            'CODIGO DE CONTROL',
            'TIPO DE COMPRA',
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 11,
            'B' => 11,
            'C' => 15,  
            'D' => 20,
            'E' => 15,
            'F' => 12,
            'G' => 15,
            'H' => 15,
            'I' => 25,
            'J' => 15,
            'K' => 20,
            'L' => 25,
            'M' => 17,
            'N' => 15,
            'O' => 15,
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
