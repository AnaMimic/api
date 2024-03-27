<?php

class DataModel {
    private $db;

    public function __construct(Database $db) {
        $this->db = $db;
    }

    public function quickSearch(string $genename){
        //Perform search by genename
        $sql = "SELECT g.geneid, g.name, g.description, g.chromosomal_location,  b.name AS breed_name, e.url FROM Genes g, GeneBreed  gb, Breeds b, ExternalSource e WHERE g.name = ? AND g.geneid = gb.geneID AND g.geneid = e.geneID AND gb.breedID= b.breedID";
        $sqlmut="SELECT mutationID, m.description, effect FROM Mutations m, Genes g WHERE g.name = ? AND g.geneid = m.geneID"; 
        $info= $this->db->query($sql, [$genename]);
        $muts= $this->db->query($sqlmut, [$genename]);

        $result_info = $info->fetch(PDO::FETCH_OBJ);
        $result_muts = $muts->fetchAll(PDO::FETCH_OBJ);

        $results= array(
            "info" => $result_info,
            "mutations" => $result_muts
        );
        return $results;
    }

    public function breedSearch(string $breed){
        $sql="SELECT description, origin FROM Breeds WHERE name= ? ";
        $sqlgenes="SELECT g.name, g.geneID FROM Genes g, GeneBreed  gb, Breeds b WHERE b.name= ? AND b.breedID= gb.breedID AND gb.geneID=g.geneID";

        $info= $this->db->query($sql, [$breed]);
        $genes= $this->db->query($sqlgenes, [$breed]);
        
        $result_info = $info->fetch(PDO::FETCH_OBJ);
        $result_genes = $genes->fetchAll(PDO::FETCH_OBJ);
        
        $results= array(
            "info" => $result_info,
            "genes" => $result_genes
        );
        return $results;
    }
    
    public function saveSearch($parameter, $user){
        $currentDate = date("Y-m-d H:i:s");
        $sql="INSERT INTO Search (search_date,searchparameters, userID) VALUES( ? , ?, ?)";
        $this->db->execute($sql, [$currentDate, $parameter, $user]);
    }

    public function lastSearch($user){
        $sql = "SELECT searchparameters FROM Search WHERE userID = ? ORDER BY search_date DESC LIMIT 1";
        $result = $this->db->query($sql, [$user]);
        return $result->fetch(PDO::FETCH_OBJ);
    }
}
?>
