<?php
    function message($string)
    {
        $json = json_decode(file_get_contents(public_path() . '/message.json'));
        return $json->$string;
    }

    function fullTextWildcardsInitEnd($term)
    {
        // Símbolos reservados en MySQL Full-Text Search
        $reservedSymbols = ['-', '+', '<', '>', '@', '(', ')', '~'];
        $term = str_replace($reservedSymbols, '', $term);

        // Separar el término en palabras
        $words = explode(' ', $term);

        // Agregar prefijos y sufijos a cada palabra
        foreach ($words as $key => $word) {
            if (strlen($word) > 0) {
                $words[$key] = '+' . $word . '*';
            }
        }

        // Unir las palabras de nuevo en una cadena
        $searchTerm = implode(' ', $words);

        return $searchTerm;
    }
?>
