package com.laoxu.game.common;

import javax.management.ImmutableDescriptor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TestLambda {
    public static void main(String[] args) {
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> map1 = new HashMap<>();
        map1.put("source",1);
        map1.put("entityId","aaa");
        Map<String,Object> map2 = new HashMap<>();
        map2.put("source",1);
        map2.put("entityId","bbb");
        Map<String,Object> map3 = new HashMap<>();
        map3.put("source",2);
        map3.put("entityId","bbb");
        list.add(map1);
        list.add(map2);
        list.add(map3);

        List<Map<String, Object>> result = list.stream().filter(map -> "1".equals(String.valueOf(map.get("source")))).collect(Collectors.toList());
        System.out.println(result.toString());
    }
}
