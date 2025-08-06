package mybatis.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@RequiredArgsConstructor
@ToString

public class BuyVo {
    private final String customer_id;
    private final String pcode;
    private final int quantity;
    private final Date buy_date;

}
