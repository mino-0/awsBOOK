package com.book.aws.springboot.web.dto;

import com.book.aws.springboot.domain.posts.Posts;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class PostsListResponseDto {
    private Long id;
    private String title;
    private LocalDateTime modifiedDate;
    private String author;

    public PostsListResponseDto(Posts posts) {
        this.id= posts.getId();
        this.title = posts.getTitle();
        this.modifiedDate = posts.getModifiedDate();
        this.author = posts.getAuthor();
    }
}
