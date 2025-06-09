Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8368F40
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480361; cv=none; b=qQDvR/9o06yR0jQs7MCdhTeW0iNhIHojxLC3k0eENqk1FM/fEluPOcpP6reXNPfJZ4HwCUzm4Ex3PJTU9T3GRlayz52CpJcg1pPES7xRFvzvw9K5eJxYTVO85fQefcPir3Z+ri1aaKqJHQ7XgOCg0MJZiIBFLdxPgW1GdZcVDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480361; c=relaxed/simple;
	bh=JHjsVSu3ZmRRUI6I/f4vr4hoRAE0xILYOda6A1PiHPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qw3y5eXW4DGFVJ6ZqAo7FM2Q8cJEC+aHkFkMA4DhlYegdDxRPPQNdQLp26FvFxKFrtBTAdWr6NXASQZX7BWi+jI3VwcmDDiwGKqg1swgrcnh42fwslT5pMCXpItZEt3GXw/PeCKuAGHPgHpb0DMqXCA6mETOc4MQ+Cxb/bgO9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bGF7M5D9Kz1fy5m;
	Mon,  9 Jun 2025 22:44:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CD76140155;
	Mon,  9 Jun 2025 22:45:49 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:45:49 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:45:48 +0800
Message-ID: <d457dfc4-9331-4b01-89fa-8bdd1d051ff6@huawei.com>
Date: Mon, 9 Jun 2025 22:45:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device
 resource leak when vdac init failed
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
	<chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-2-shiyongbang@huawei.com>
 <agw2afrxbbzhyvzmnitnubw7kcppp2u54j5gfe2zllph62xx5j@u4r4xgqcq2q2>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <agw2afrxbbzhyvzmnitnubw7kcppp2u54j5gfe2zllph62xx5j@u4r4xgqcq2q2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:23PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Currently the driver missed to clean the i2c adapter when vdac init failed.
>> It may cause resource leak.
>>
>> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")
> No, the tag is incorrect. Offending code was added in a different commit.
>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 +
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 5 +++++
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 9 +++++++--
>>   3 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> index 274feabe7df0..ca8502e2760c 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> @@ -69,6 +69,7 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
>>   int hibmc_vdac_init(struct hibmc_drm_private *priv);
>>   
>>   int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
>> +void hibmc_ddc_del(struct hibmc_vdac *vdac);
>>   
>>   int hibmc_dp_init(struct hibmc_drm_private *priv);
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
>> index 99b3b77b5445..44860011855e 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
>> @@ -95,3 +95,8 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *vdac)
>>   
>>   	return i2c_bit_add_bus(&vdac->adapter);
>>   }
>> +
>> +void hibmc_ddc_del(struct hibmc_vdac *vdac)
>> +{
>> +	i2c_del_adapter(&vdac->adapter);
>> +}
> Then hibmc_connector_destroy() also needs to use this helper.
>
Thanks for correcting, I'll fix them.
Baihan.


>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index e8a527ede854..36401b46034c 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -110,7 +110,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>   	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
>>   	if (ret) {
>>   		drm_err(dev, "failed to init encoder: %d\n", ret);
>> -		return ret;
>> +		goto err;
>>   	}
>>   
>>   	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
>> @@ -121,7 +121,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>   					  &vdac->adapter);
>>   	if (ret) {
>>   		drm_err(dev, "failed to init connector: %d\n", ret);
>> -		return ret;
>> +		goto err;
>>   	}
>>   
>>   	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
>> @@ -131,4 +131,9 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>   	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>>   
>>   	return 0;
>> +
>> +err:
>> +	hibmc_ddc_del(vdac);
>> +
>> +	return ret;
>>   }
>> -- 
>> 2.33.0
>>
