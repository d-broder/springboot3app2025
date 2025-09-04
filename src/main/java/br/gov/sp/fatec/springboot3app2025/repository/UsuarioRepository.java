package br.gov.sp.fatec.springboot3app2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import br.gov.sp.fatec.springboot3app2025.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
