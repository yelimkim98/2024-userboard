package naver.kiel0103.userboard.controller;

import lombok.RequiredArgsConstructor;
import naver.kiel0103.userboard.controller.dto.UserDto;
import naver.kiel0103.userboard.entity.User;
import naver.kiel0103.userboard.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/api/v1/user")
    public ResponseEntity<Long> create(
            @RequestBody UserDto userDto
    ) {
        Long savedId = userService.save(User.builder()
                .name(userDto.getName())
                .build());

        return ResponseEntity.status(HttpStatus.CREATED.value())
                .body(savedId);
    }

    @GetMapping("/api/v1/users")
    public ResponseEntity<List<User>> getAll() {
        return ResponseEntity.ok(userService.getAll());
    }
}
