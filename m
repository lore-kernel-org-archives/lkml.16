Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003BC29A30A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562138; cv=none; b=kUzjZbiIxyNa/asxXVGDcf96Y7EbHtG+phFd7jw9imHSXut4bu5r1Qmc6fvJhGwsfuJ01OCQQ+RvUA7L1aEyHIcExzNmCSb8sa7eYau+tGXII1cCPVCRltf/MkCpIcmDNCVmUFlZSnr73GdmJ0a9uLXOtIZEs3wsDRE3Lro9OsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562138; c=relaxed/simple;
	bh=Lh2L3vIShi1maOWcubh6TPTHxkAO2QCIIdksxelNb6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AG0rmCHFEcEimPS/oz/L4cCuJZREHUAiu5VIssV5iHYoI6DRIgm3MLU67DPVqGlSfdEgXW7uuA3wVkePfOOeWVp941iGdlNZ9KH1a+YFYxyXY0dsp1ceB9FqqRDc30aE1W4flB2C+OktWdY3XkMu60I7iyx238yh5zVhYJyPHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bGqK51sSKz2Cf4M;
	Tue, 10 Jun 2025 21:24:57 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 26918140155;
	Tue, 10 Jun 2025 21:28:48 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:28:47 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:28:47 +0800
Message-ID: <37b5bf6a-d3d1-48b3-9052-0bdcf0803fe3@huawei.com>
Date: Tue, 10 Jun 2025 21:28:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq
 name variable is local
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
 <20250530095432.1206966-4-shiyongbang@huawei.com>
 <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
 <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
 <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On 09/06/2025 17:50, Yongbang Shi wrote:
>>
>>> On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
>>>> From: Baihan Li <libaihan@huawei.com>
>>>>
>>>> The local variable of irq name is passed to 
>>>> devm_request_threaded_irq(),
>>>> which will make request_irq failed. Using the global irq name instead
>>>> of it to fix.
>>> This doesn't explain, why does it fail and which IRQ name is actually
>>> expected.
>>
>> The local variable is passed in request_irq (), and there will be use 
>> after free problem.
>
> This needs to be explained (in details) in the commit message.

Okay.

>
>>
>>
>>>> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and 
>>>> requesting for HPD")
>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>> ---
>>>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/ 
>>>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> index 768b97f9e74a..4cdcc34070ee 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> @@ -32,7 +32,7 @@
>>>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>>> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { 
>>>> "vblank", "hpd" };
>>>> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc- 
>>>> vblank", "hibmc-hpd" };
>>> Please point to the corresponding IRQ names as currently implemented in
>>> the upstream kernel.
>>
>> Ok.
>
> I was thinking in terms of IRQ lookup. You can ignore this comment (it 
> makes me wonder, how did you understand it, if you responded with Ok).
>
I thought you were suggesting naming the irq referring to the previous name.


>>
>>
>>>>   static irqreturn_t hibmc_interrupt(int irq, void *arg)
>>>>   {
>
>
