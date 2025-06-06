Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68599284671
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199169; cv=none; b=akXLqWFgiSTWRGd4tE10pojcjwd7jDNnlJP6ZfTz4N4cj36x1RxPaERsydgLe0pJgAX+PVGYTudqIOrWwC+tcHDUEbZiv5jwGf+Joc10UIIIa1Qup0Ob08CW1LIm0aEtWbZdyq/EW3G6UZhyqEMxRUf5NI8sLBhidnpQvtCSlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199169; c=relaxed/simple;
	bh=M/HN4ar7wZMBJP/PnDV3kWAxVeZqpHAPjoZZR93JTzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ENtiw0oVeygW9RhWN6lJoeQDcvopk5mPW/Ce3aO0W9Xbr1/Yt+2l3uB0WEuZJrtJ24ShXX+Z3zP8wTFNYviuScedg523NrnmRJGgio3bvF1RDiLpIPbLcXmHuAie+rO2S7mwm4qYrGdS9rJ/yJZCETVhz+gVn07CFM2NNtU09F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bDDlW5Wzgz1R86h;
	Fri,  6 Jun 2025 16:20:23 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DAD71A0191;
	Fri,  6 Jun 2025 16:22:43 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 16:22:39 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 16:22:38 +0800
Message-ID: <b6b30bdd-7562-4435-a267-2bdafb0dc359@huawei.com>
Date: Fri, 6 Jun 2025 16:20:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 04/10] drm/hisilicon/hibmc: fix the hibmc loaded
 failed bug
To: oushixiong <oushixiong1025@163.com>, <xinliang.liu@linaro.org>,
	<tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-5-shiyongbang@huawei.com>
 <b0587eda-df65-4abc-b2af-c5dcb717c8b6@163.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <b0587eda-df65-4abc-b2af-c5dcb717c8b6@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100007.china.huawei.com (7.202.195.175)

>
>> From: Baihan Li<libaihan@huawei.com>
>>
>> When hibmc loaded failed, the driver use hibmc_unload to free the
>> resource, but the mutexes in mode.config are not init, which will
>> access an NULL pointer.
>>
>> Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
>> Reported-by:oushixiong1025@163.com
>> Signed-off-by: Baihan Li<libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index 4cdcc34070ee..ac552c339671 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -319,13 +319,13 @@ static int hibmc_load(struct drm_device *dev)
>>   
>>   	ret = hibmc_hw_init(priv);
>>   	if (ret)
>> -		goto err;
>> +		return ret;
>>   
>>   	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
>>   				    pci_resource_len(pdev, 0));
>>   	if (ret) {
>>   		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
>> -		goto err;
>> +		return ret;
>
> The mutexes in mode.config are initialized when calling hibmc_kms_init(),
> if calling hibmc_kms_init() failed it also need to return.
>
> You may want to look at the following patch:
> LKML: oushixiong1025@163 ...: [PATCH] drm/hisilicon: Fix a NULL 
> pointer access when hibmc_load failed 
> <https://lkml.org/lkml/2025/5/20/331>
>
> Reported-by: Shixiong Ou <oushixiong@kylinos.cn>
>
> Thanks and Regards,
> Shixiong Ou.
>

Hi Shixiong,
Thanks for your advice!
Actually, even if the calling of drmm_mode_config_init() failed, these mutexes are still initialized,
and it's the same for hibmc_kms_init() failed, so we don't need to change its return.

Thanks,
Baihan Li

>>   	}
>>   
>>   	ret = hibmc_kms_init(priv);
