package naver.kiel0103.userboard.repository;

import naver.kiel0103.userboard.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {}
