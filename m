Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4619F41C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481981; cv=none; b=DXNTTsPY4WhspEF5TpYY8++cBWNbSA9/dtdQtzT+U4mhMl2+8cxefg+ngzPPbcBzVoVs1PtfSnXLR7Ie8Vml7PnpMp4tZ79n33dDgcqwBLJZcJ2NwtvFEXIzKfvj+9S8y+IA+4evLh6HiT+I16quD+otzXTKj6jjIM9/SAd6ueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481981; c=relaxed/simple;
	bh=qNArU2Vc44maup3ccsJRzzB+PISgJBFgqC9aDifnE40=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iChHlVwkbqUOhDlyutnpXpGnss56zjlP8j3uRIlRrOJ9ZadMk+4IuIQaIQohYgh46MP4MCr1yU5DqTIC42ETWUfhko8u2FDRHe7mziF/TuY8aKXmsUG4arY1D88MQL737+Eun2F3uhNb88bOqIUidzUKvj34WCA4IS/s3R5MHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bGFLZ5ks4z1d1Ny;
	Mon,  9 Jun 2025 22:54:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D501A180B43;
	Mon,  9 Jun 2025 22:56:14 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:56:14 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:56:13 +0800
Message-ID: <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
Date: Mon, 9 Jun 2025 22:56:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
	<chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
 <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> DP Link training successful at 8.1Gbps with some monitors' max link rate
>> are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
>> from devices' capabilities.
> I've hard time understanding this message.

Sorry for misunderstanding. The problem is that dp link training success at 8.1Gbps, however,

the sink 's maximum supported rate is less than 8.1G.


>> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> No, the tag is incorrect. Mentioned commit is not related.

Ok.


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>>   4 files changed, 27 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> index 676059d4c1e6..8191233aa965 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>>   
>>   	return 0;
>>   }
>> -
>> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
>> -{
>> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
>> -
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> Where did these two writes go?

It's the same as the cfg in hibmc_dp_serdes_set_tx_cfg(), and this function will be called certainly.


>> -
>> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
>> -}
>> -- 
>> 2.33.0
>>
