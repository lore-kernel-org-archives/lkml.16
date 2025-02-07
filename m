Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A9233D90
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918629; cv=none; b=lCl6ojiBpXMlo78ubqheFiCd2rRwUDv1jnFWBpJjpzZ06P5GA7TQPr7nhXoZJaeB661zOjYFYJLjb3NeVcLmcUjNfGrJE7tv0llgUhJeMMOf0rU1ZF5Y7DJ6VTrw802pPVEHyBIT9oEbuWNCx/lnMKt/4+O6u2MQvoBCiTEA9xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918629; c=relaxed/simple;
	bh=MSy7wxDIY5tOmBerca1Muxh5iPDeSkNud0/pmiyIhqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EMRoxIjaqiS2sCC7BF1iw9nv+dicbl3k4i11kEOl9SjoXzSUfDfkiBGeoGcmuclXB6XdPGh6GqkjRflI36s5VIV1yaoM3ptW5dHRYznyRnYpjVIvQZ/Md/UgSh6HCzkC+9Xkv+mtl99XTVnuPpKCYrPo3RSyPjzbY55fA2cTG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Yq75k1MmVz1W5D8;
	Fri,  7 Feb 2025 16:52:42 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 9BB7A140257;
	Fri,  7 Feb 2025 16:57:02 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Feb 2025 16:57:02 +0800
Message-ID: <10e648ae-7e0b-4560-a73d-b728efbc9e15@huawei.com>
Date: Fri, 7 Feb 2025 16:57:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Gao Xiang <hsiangkao@linux.alibaba.com>, Hongzhen Luo
	<hongzhen@linux.alibaba.com>, <linux-erofs@lists.ozlabs.org>
CC: <linux-kernel@vger.kernel.org>
References: <20250207080829.2405528-1-hongzhen@linux.alibaba.com>
 <f4319592-df8f-4468-b8fb-7fcbc51804c6@linux.alibaba.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <f4319592-df8f-4468-b8fb-7fcbc51804c6@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/2/7 16:29, Gao Xiang wrote:
> 
> 
> On 2025/2/7 16:08, Hongzhen Luo wrote:
>> There's no need to enumerate each type.  No logic changes.
>>
>> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
>> ---
>> Changes since v1: Put the exception branch at the beginning.
>>
>> v1: 
>> https://lore.kernel.org/all/20250207064135.2249529-1-hongzhen@linux.alibaba.com/
>> ---
>>   fs/erofs/zmap.c | 65 +++++++++++++++++++++----------------------------
>>   1 file changed, 28 insertions(+), 37 deletions(-)
>>
>> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
>> index 689437e99a5a..f65c76991e02 100644
>> --- a/fs/erofs/zmap.c
>> +++ b/fs/erofs/zmap.c
>> @@ -265,23 +265,22 @@ static int z_erofs_extent_lookback(struct 
>> z_erofs_maprecorder *m,
>>           if (err)
>>               return err;
>> -        switch (m->type) {
>> -        case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
>> +        if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
>> +            erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
>> +                  m->type, lcn, vi->nid);
>> +            DBG_BUGON(1);
>> +            return -EOPNOTSUPP;
>> +        }
>> +
>> +        if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
>>               lookback_distance = m->delta[0];
>>               if (!lookback_distance)
>>                   goto err_bogus;
>>               continue;
>> -        case Z_EROFS_LCLUSTER_TYPE_PLAIN:
>> -        case Z_EROFS_LCLUSTER_TYPE_HEAD1:
>> -        case Z_EROFS_LCLUSTER_TYPE_HEAD2:
>> +        } else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {
> 
> 
> Just `} else {` here?
> 
>>               m->headtype = m->type;
>>               m->map->m_la = (lcn << lclusterbits) | m->clusterofs;
>>               return 0;
>> -        default:
>> -            erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
>> -                  m->type, lcn, vi->nid);
>> -            DBG_BUGON(1);
>> -            return -EOPNOTSUPP;
>>           }
>>       }
>>   err_bogus:
>> @@ -329,35 +328,31 @@ static int 
>> z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
>>       DBG_BUGON(lcn == initial_lcn &&
>>             m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD);
>> -    switch (m->type) {
>> -    case Z_EROFS_LCLUSTER_TYPE_PLAIN:
>> -    case Z_EROFS_LCLUSTER_TYPE_HEAD1:
>> -    case Z_EROFS_LCLUSTER_TYPE_HEAD2:
>> +    if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
>> +        erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", 
>> lcn, vi->nid);
>> +        DBG_BUGON(1);
>> +        return -EFSCORRUPTED;
>> +    }
> 
> No, I don't think it's equivalent, please use
> the previous version for this part instead.

I think this version doesn't consider the fallthrough case. May be just 
use the goto statement can keep equivalent.

Thanks,
Hongbo

> 
> Thanks,
> Gao Xiang
