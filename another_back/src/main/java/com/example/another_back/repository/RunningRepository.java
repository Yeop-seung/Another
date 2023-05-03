package com.example.another_back.repository;

import com.example.another_back.entity.Running;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RunningRepository extends JpaRepository<Running, String> {
    @Query("select distinct r,fp from Running r left outer join fetch r.feedPic fp")
    List<Running> findRunningWithFeedPics();

    @Query("select distinct r,fp from Running r left outer join fetch r.feedPic fp where r.user.id = :userId")
    List<Running> findRunningByUserIdWithFeedPics(Long userId);

    List<Running> findByUserId(Long userId);

    List<Running> findByRunningDistanceBetweenAndRunningTimeBetweenAndUserIdNot(Float startDistance, Float endDistance, String startTime, String endTime, Long userId);
}
