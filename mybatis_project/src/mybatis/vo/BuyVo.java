package mybatis.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor

public class BuyVo {
    private final Integer buy_seq;          // 기본키
    private final String customer_id;
    private final String pcode;
    private final Integer quantity;
    private final Timestamp buy_date;       // timestamp로 년월일시분초 까지 조회 가능

@Override
public String toString() {
    return "\n" + buy_seq + " \t " + customer_id + "\t" + pcode + "\t" + quantity
        + "\t" + buy_date + "\n";

    }
}
