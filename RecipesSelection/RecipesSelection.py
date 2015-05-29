# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import json
rcp = pd.read_csv('test-results_rcp.csv')
ingre = pd.read_csv('test-results_ingre.csv')

#cal list for json 3rd list - fixed one for all.
cal = ',"perspectives":[{"type":"perspective","name":"0-100大卡","group":"1"},{"type":"perspective","name":"100-200大卡","group":"1"},{"type":"perspective","name":"200-300大卡","group":"2"},{"type":"perspective","name":"300-400大卡","group":"2"},{"type":"perspective","name":"400-500大卡","group":"3"},{"type":"perspective","name":"500-600大卡","group":"3"},{"type":"perspective","name":"600-700大卡","count":"22","group":"4"},{"type":"perspective","name":"700-800大卡","group":"4"},{"type":"perspective","name":"800-900大卡","group":"5"},{"type":"perspective","name":"900-1000大卡","group":"5"},{"type":"perspective","name":"1000-1100大卡","group":"6"},{"type":"perspective","name":"1100-1200大卡","group":"6"},{"type":"perspective","name":"1200-1300大卡","group":"7"},{"type":"perspective","name":"1300-1400大卡","group":"7"},{"type":"perspective","name":"1400-1500大卡","group":"8"},{"type":"perspective","name":"1500-1600大卡","group":"8"},{"type":"perspective","name":"1600-1700大卡","group":"9"},{"type":"perspective","name":"1700-1800大卡","group":"9"},{"type":"perspective","name":"1800-1900大卡","group":"10"},{"type":"perspective","name":"1900-2000大卡","group":"10"}]}'

#ingre list for json 2nd list
IngreName = ingre.loc[:,['IngreName']].drop_duplicates()
IngreName.columns = ['name']
IngreName['type'] = ['theme']*len(IngreName)
IngreName = IngreName.loc[:,['type','name']]
#print IngreName

#concate 2 lists
theme = IngreName.to_json(path_or_buf=None, orient='records', date_format='epoch', double_precision=10, force_ascii=False, date_unit='ms', default_handler=None)

#global formal for 1st json list
rcp1 = pd.merge(rcp, ingre, on='RcpNo', how='right')
rcp1.to_csv('test-results_main.csv')
rcp2 = rcp.loc[:,['RcpName','RcpNo']].drop_duplicates()
rcp2.columns = ['name','slug']
rcp2['type']=['ditem']*len(rcp2)
rcp2['ditem']=np.arange(len(rcp2))+1
#print rcp1
#ingre+cal in each main json recipe list
rcpInfo = []
rcpInfo2 = []
unique = set()
with open('test-results_main.csv') as f:
    header_line = next(f)
    for line in f:
        RcpNo = line.strip().split(',')[1]
        RcpName = line.strip().split(',')[2]
        RcpTotalCalCat = line.strip().split(',')[3]
        IngreName = line.strip().split(',')[4]
        if RcpNo in unique: 
            rcpInfo.append(IngreName) 
        else:
            if rcpInfo:#if rcpInfo is not empty
                rcpInfo2.append(rcpInfo)
                rcpInfo = []
            unique.add(RcpNo)
            rcpInfo.append(RcpTotalCalCat)
            rcpInfo.append(IngreName)
    rcpInfo2.append(rcpInfo)
rcp2['links'] = pd.Series(rcpInfo2)
#print rcp2

#1st json list
ditms = rcp2.to_json(path_or_buf=None, orient='records', date_format='epoch', double_precision=10, force_ascii=False, date_unit='ms', default_handler=None)                                    

WTEjson = '{"ditems":'+ditms+',"themes":'+ theme + cal

metadatajson = open('metadata.json', 'w')
metadatajson.write(WTEjson)
metadatajson.close()