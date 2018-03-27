//항목, 계정 선택
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    if(val == '1'){	//지출
        addOption('식비', targetE);
        addOption('교통비', targetE);
        addOption('통신비', targetE);
        addOption('생활용품비', targetE);
        addOption('문화생활비', targetE);
        addOption('건강의료', targetE);
        addOption('미용의류', targetE);
    }
    else if(val == '2'){ //수입
        addOption('급여', targetE);
        addOption('이자수익', targetE);
        addOption('기타', targetE);
    }
}

function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}