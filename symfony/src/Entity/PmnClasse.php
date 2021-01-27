<?php

namespace App\Entity;

use App\Repository\PmnClasseRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PmnClasseRepository::class)
 */
class PmnClasse
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=0)
     */
    private $nombre_etud;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=0, nullable=true)
     */
    private $taille;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombreEtud(): ?string
    {
        return $this->nombre_etud;
    }

    public function setNombreEtud(string $nombre_etud): self
    {
        $this->nombre_etud = $nombre_etud;

        return $this;
    }

    public function getTaille(): ?string
    {
        return $this->taille;
    }

    public function setTaille(?string $taille): self
    {
        $this->taille = $taille;

        return $this;
    }
}
