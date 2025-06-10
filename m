Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC625B30D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564229; cv=none; b=vFtSwFrEpIXHamqfFQ8hswKZGErIGQ1BM1uCMc7ACIMx+HWSEjOkXu4yhjN1IrJweOurfBhtmqlbcKvv15oJAc5VfLOZNsHMNOUKvEmo7SzqVqCztEAnzOkWeXEkhsL5tuobVHneZ/WCTibqk4xNu49Bsk9T7PBJx1wYzMUseL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564229; c=relaxed/simple;
	bh=h+LW96f14ixS61diT9BSudHXaKfEdgV2QpPteKfPiZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H4ctcV8g2Vzay3c0blqc2+7kneBvabYFF8zTk4lxmXcnhddpQUhdicYmzhZNKouU7UUBz6gHo/0AdvNu9ITFBdHq+eEDk8CeWUcgaRK1gOwvMXUQRMMqv7Ro7EzwXZ7Zi4bxVBaxRaJ/aRKWZg1QvUt9SYKn45G6FfR/7INpBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bGrBj5WMhz2QTyF;
	Tue, 10 Jun 2025 22:04:29 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5672B1A016C;
	Tue, 10 Jun 2025 22:03:37 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 22:03:37 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 22:03:36 +0800
Message-ID: <fe70844f-ce96-43a1-a7ba-a99c785ad753@huawei.com>
Date: Tue, 10 Jun 2025 22:03:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 08/10] drm/hisilicon/hibmc: fix DP no showing after
 HPD with VGA connected
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
 <20250530095432.1206966-9-shiyongbang@huawei.com>
 <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:30PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> If the system started with VGA connected, the desktop like GDM cannot get
>> DP's CRTC when DP device is plugged in, because there is only one crtc
>> sharing use of VGA and DP. So change VGA to disconnected when DP is
>> connected.
> NAK. I think we discussed this when the previous patch was submitted.
>
> VGA and DP are independent. It should be user's choice whether to use
> VGA or DP if both are connected.

Acutally, although we are developing drm drivers, our requirements
and testing department's goal is to displaying desktop systems(like GDM), so we have to
solve different OS or display managers problems, and let the driver handle more situations.


>> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
