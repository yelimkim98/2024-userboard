package naver.kiel0103.userboard.repository;

import naver.kiel0103.userboard.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {}
