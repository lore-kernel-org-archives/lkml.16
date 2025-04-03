Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621278F39;
	Thu,  3 Apr 2025 01:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643287; cv=none; b=TYc1HMDjG1WmTjLkvOLagEFCK5amVf7DUGxjt9ckdrrMlZCwWJnitHvJJDy8ZFIrz12O8E8MxMGcvMxJDeO6gK4TZ6bqsYZ3HTJYOPjynrO5ShGPU3tYVpcg4J8Oud9iVIaH2FjH1pfP+c1rdiv0Mwdye+MbUOUzzE4jS8MXTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643287; c=relaxed/simple;
	bh=tgs0e8XeIN7q0WyRcw+06bmb50vMDJ4P4L/t0bTxsUs=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DjygnorW/ts+TZ8WDjBOKEFlNkRYgiHly/5nEzL6AH6I4X7NTFtcfoJPLHkmLANmg1rtJZpyR3rNEmcTxL3T8Xctrx6sFmrsF+QJXuwvdmLejod/xlHxYMlTxqU864nSjE6NsXEEeLOWFTvolWGFsW+9c7WrwrL+MYGTInu7F0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZSkNy1VJMzvWs8;
	Thu,  3 Apr 2025 09:17:22 +0800 (CST)
Received: from kwepemk100013.china.huawei.com (unknown [7.202.194.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D0061800E4;
	Thu,  3 Apr 2025 09:21:22 +0800 (CST)
Received: from [10.67.120.192] (10.67.120.192) by
 kwepemk100013.china.huawei.com (7.202.194.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Apr 2025 09:21:21 +0800
Message-ID: <88dcf938-f43d-44f8-a943-ab84aa2edf2b@huawei.com>
Date: Thu, 3 Apr 2025 09:21:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <andrew+netdev@lunn.ch>,
	<shenjian15@huawei.com>, <wangpeiyang1@huawei.com>, <liuyonglong@huawei.com>,
	<chenhao418@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 3/3] net: hns3: store rx VLAN tag offload state for VF
To: Simon Horman <horms@kernel.org>
References: <20250402121001.663431-1-shaojijie@huawei.com>
 <20250402121001.663431-4-shaojijie@huawei.com>
 <20250402140155.GR214849@horms.kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20250402140155.GR214849@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk100013.china.huawei.com (7.202.194.61)


on 2025/4/2 22:01, Simon Horman wrote:
> On Wed, Apr 02, 2025 at 08:10:01PM +0800, Jijie Shao wrote:
>> From: Jian Shen <shenjian15@huawei.com>
>>
>> The VF driver missed to store the rx VLAN tag strip state when
>> user change the rx VLAN tag offload state. And it will default
>> to enable the rx vlan tag strip when re-init VF device after
>> reset. So if user disable rx VLAN tag offload, and trig reset,
>> then the HW will still strip the VLAN tag from packet nad fill
>> into RX BD, but the VF driver will ignore it for rx VLAN tag
>> offload disabled. It may cause the rx VLAN tag dropped.
>>
>> Fixes: b2641e2ad456 ("net: hns3: Add support of hardware rx-vlan-offload to HNS3 VF driver")
>> Signed-off-by: Jian Shen <shenjian15@huawei.com>
>> Signed-off-by: Jijie Shao <shaojijie@huawei.com>
> Overall this looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> ...
>
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
>> index cccef3228461..1e452b14b04e 100644
>> --- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
>> @@ -252,7 +252,8 @@ struct hclgevf_dev {
>>   	u16 *vector_status;
>>   	int *vector_irq;
>>   
>> -	bool gro_en;
>> +	u32 gro_en :1;
>> +	u32 rxvtag_strip_en :1;
> FWIIW, as there is space I would have used two bools here.

ok, I will change to bool in v2

Thanks,
Jijie Shao

>
>>   
>>   	unsigned long vlan_del_fail_bmap[BITS_TO_LONGS(VLAN_N_VID)];
>>   
>> -- 
>> 2.33.0
>>
