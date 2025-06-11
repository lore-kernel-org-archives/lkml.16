Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031A283142
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646363; cv=none; b=A8oRWsuzyqio4KKyDckC48kN6rOqNotddFiQzg/jINa9UN9RXpMFO1u22nOs0wBCV5orL8BeqNNGVU9hMdVqEkYztdxtx31NynZwhsCaH1Gy0AnysfjPgZlG5YV8Pa/L33ECg0jDzAqxEGapOwr+ZO5j7F/vOGJ4Jonw/4LOjOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646363; c=relaxed/simple;
	bh=p8EprR3dFzs7gZuXiSfEzwqS/zZdqhzcIe+QokfK/ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gkIpFO336A8nDzGjLB1UMR7vULdKl/lW7Dj7xlfVZS/eNefb5+pMZvPLgPE2kGnp4IN0rgj44wchtU/O+xaN45Mm9fd+lIB0MiMO9DlR9AWFvkKPIp/GiYJfWuBuOFZ8huR0/k9ZI1uXtbtdPsoqvTDe/gDtnFfx06yovnmoLf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bHQSM0KvHzRk2j;
	Wed, 11 Jun 2025 20:48:19 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 549E11402ED;
	Wed, 11 Jun 2025 20:52:32 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:52:32 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:52:31 +0800
Message-ID: <426246e9-ccfe-40a7-81b6-a15ac1ee32e9@huawei.com>
Date: Wed, 11 Jun 2025 20:52:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 10/10] drm/hisilicon/hibmc: fix no showing problem
 with loading hibmc manually
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
 <20250530095432.1206966-11-shiyongbang@huawei.com>
 <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:32PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> When using command rmmod and insmod, there is no showing in second time
>> insmoding. Because DP controller won't send HPD signals, if connection
>> doesn't change or controller isn't reset. So add reset before unreset
>> in hibmc_dp_hw_init().
>>
>> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")
> Technically... yes and no. The function was written this way in that
> commit, however HPD signals were not handled until the latter commit.

Alright, can I put 2 commits here?


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 4f93d60b932b..e1b9589ce639 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -172,13 +172,15 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   	dp_dev->link.cap.lanes = 0x2;
>>   	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>>   
>> -	/* hdcp data */
>> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>>   	/* int init */
>>   	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>>   	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>>   	/* rst */
>> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>> +	usleep_range(30, 50);
>>   	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>> +	/* hdcp data */
>> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
> There are two independent changes here. Split them into two commits.

Okay!


>>   	/* clock enable */
>>   	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>>   
>> -- 
>> 2.33.0
>>
