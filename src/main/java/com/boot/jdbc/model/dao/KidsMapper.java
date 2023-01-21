package com.boot.jdbc.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.boot.jdbc.model.dto.KidFileDto;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.StickerDto;

@Mapper
public interface KidsMapper {
	
	//Select : 프로필 사진 뿌려줄때 file_type=1 로 가져오고 , 산타메일은 file_type=2
	
	
	@Insert("INSERT INTO KIDS_SETTING(KIDS_POINT, KIDS_NICKNAME, KIDS_THUMBNAIL, KIDS_LETTER_IMG, USER_ID) VALUES (0,#{kids_nickname},#{kids_thumbnail},#{kids_letter_img},#{user_id})")
	@Options(useGeneratedKeys = true, keyProperty = "kids_no")
	int add(KidsDto dto);
	
	
	//프로필계정사진 (file_typed = 1)
	@Insert("INSERT INTO KIDS_FILE(FILE_PATH, FILE_ONAME, FILE_NAME ,KIDS_NO, FILE_TYPE) VALUES(#{file_path},#{file_oname},#{file_name},#{kids_no},1)")
	@Options(useGeneratedKeys = true, keyProperty = "file_id")
	int addFile(KidFileDto file);

	@Select("SELECT * FROM KIDS_SETTING")
	List<KidsDto> allKids();
	
	@Select("SELECT * FROM STICKER")
	List<StickerDto> sticker();


}