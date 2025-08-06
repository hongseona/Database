import mybatis.dao.MybatisProductDao;
import mybatis.vo.ProductVo;

public class App {
    public static void main(String[] args) throws Exception {
        MybatisProductDao dao = new MybatisProductDao();
        // int result = dao.insert(
        //     new CustomerVo("hongGS2", "홍길순2", "hgs2@a.com", 22, null));
        //     System.out.println("insert result: "+ result);

        //     System.out.println(dao.selectByPk("hongGS"));
        int result = dao.insert(
            new ProductVo("toothbrush", "A2","칫솔세트",20000));
            System.out.println("insert result:" + result);
    }
}
