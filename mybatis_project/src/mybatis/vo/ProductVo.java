package mybatis.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class ProductVo {
    private final String pcode;
    private final String category;
    private final String pname;
    private final int price;

}
