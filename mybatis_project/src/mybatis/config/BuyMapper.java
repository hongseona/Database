package mybatis.config;

import java.util.List;
import java.util.Map;

import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public interface BuyMapper {
  List<BuyVo> selectByCustomer(String customer_id);

  List<BuyVo> selectByPcode(String pcode);

  List<BuyVo> selectByYear(String year);

  int selectSumByPcode(String pcode);


  // join
  List<CustomerBuyVo> selectSaleBuyCustomer(String customer_id);

  // count 집계 함수
  Map<String, Integer> selectCountByYear(String year);

  List<Map<String, Object>> selectAllCountYear();
}