package com.example.another_back.dto;

import com.example.another_back.entity.Running;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.json.simple.JSONArray;

import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class FeedDetailResponseDto {
    private String runningId;
    private Long withRunCount;
    private String nickname;
    private String profilePic;
    private String runningTime;
    private Float runningDistance;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date createDate;
    private Integer userCalories;
    private String runningPic;
    private String userPace;
    private List<FeedPicResponseDto> feedPics;
    private JSONArray graph;

    @Builder
    public FeedDetailResponseDto(Running running) {
        this.runningId = running.getId();
        this.nickname = running.getUser().getNickname();
        this.profilePic = running.getUser().getProfilePic();
        this.runningTime = convertTime(Long.valueOf(running.getRunningTime()));
        this.runningDistance = running.getRunningDistance();
        this.createDate = running.getCreateDate();
        this.userCalories = running.getUserCalories();
        this.runningPic = running.getRunningPic();
        this.userPace = convertPace(Double.valueOf(running.getUserPace()));
        this.feedPics = running.getFeedPic().stream().map(FeedPicResponseDto::new).collect(Collectors.toList());
    }

    private String convertTime(Long time) {
        String hour = Long.toString(time / 3600);
        time %= 3600;
        String minute = Long.toString(time / 60);
        String second = Long.toString(time % 60);
        if (hour.length() == 1) hour = "0" + hour;
        if (minute.length() == 1) minute = "0" + minute;
        if (second.length() == 1) second = "0" + second;


        return hour + ":" + minute + ":" + second;
    }

    private String convertPace(Double pace) {
        String minute = Integer.toString(pace.intValue() / 60);
        String second = Integer.toString(pace.intValue() % 60);
        return minute+"'"+second+"''";
    }

}
