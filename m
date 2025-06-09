Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C11E505
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480664; cv=none; b=E72AqgDtUBwa6H0CZKoN6J/0r6bK+BGlqXpBt7ouz1WIvxmzT+TVEa9VGp4SFd3CcQixZ00EvmR78ICuZhxYNrUEf8S2bX/2iAtpIBCCn6FR5vG539Z4FyLY3ikl/RYAV7e7dkZcTBJ4Td++1XYZqvoD38R9jPDWEiPtvxbT1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480664; c=relaxed/simple;
	bh=7aNSrd82dZtg4nVjB5jpBz5pTojzJfN29tUQ7eWG2aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tNAhb6NTl5UZ1aCB9xxeuTEsTkUNTDAlNG30Mpqap9wx9hT0ZTDpBwz+w/XafqM0nWQ+KktGwNT+LTr8LuIzG1ZZeX767wKxZg2yCbdd/T28hoAx1K4UV4qs7ByyIjxpBlbtHhd73bIg6xbedL9qQS9r4+uUPsNWr1nSjsxo+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bGF9s56QKzRk6W;
	Mon,  9 Jun 2025 22:46:41 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 246681800B1;
	Mon,  9 Jun 2025 22:50:54 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:50:53 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:50:47 +0800
Message-ID: <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
Date: Mon, 9 Jun 2025 22:50:43 +0800
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
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> The local variable of irq name is passed to devm_request_threaded_irq(),
>> which will make request_irq failed. Using the global irq name instead
>> of it to fix.
> This doesn't explain, why does it fail and which IRQ name is actually
> expected.

The local variable is passed in request_irq (), and there will be use after free problem.


>> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index 768b97f9e74a..4cdcc34070ee 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -32,7 +32,7 @@
>>   
>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>   
>> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
>> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc-vblank", "hibmc-hpd" };
> Please point to the corresponding IRQ names as currently implemented in
> the upstream kernel.

Ok.


>>   
>>   static irqreturn_t hibmc_interrupt(int irq, void *arg)
>>   {
