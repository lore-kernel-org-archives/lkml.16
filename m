Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D4246BA5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562286; cv=none; b=RItEKzI11to607+XaIHb/QIIq06VM+Nk5veu5iSrxaIgm4PfSfTrklF97b/J3W4dBLCH83QUpvZUzGwS6Tt7dji6bZgbcoad4eFpdUYRH3Hf5vBAcb5cBHNmWaXXzXW02jXRc/oypbG1YkvZzGu8rekgYVL8x578QcQfIkBd38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562286; c=relaxed/simple;
	bh=qFvpusciHV6ssC2TVhMqgzq4xI0yHrMKxrffSwaf+YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c9Aq6h6qY5iuzTbD26KfRycu+gOeI5Ou8Dk9WWOJNztHHFvdOIYT6YG+8CKPoqJCZoR8S8x/4m4tzfe0M/Ix/Itxx+C+3NxhswTowuSpVPpln1oc8+kBIApHmXaTQJV2U5ORlGMB0gPKHX+mY79RIdXF2KKXlxPoUlOtN+dHI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bGqQz0PH6z1fy9r;
	Tue, 10 Jun 2025 21:30:03 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id ED4191400DC;
	Tue, 10 Jun 2025 21:31:21 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:31:21 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:31:20 +0800
Message-ID: <3fc17e98-5934-45c8-ba84-815a25a434cc@huawei.com>
Date: Tue, 10 Jun 2025 21:31:17 +0800
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
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

Okay, I can use GDM to set which connectors to use, or config Xorg conf file.
But I have an another problem, I think our driver only support one of them displaying, can we realize
the clone displaying at the same time? To make DP and VGA shows up simultaneous when DP is plugged in,
If the system started with VGA connected.

Thanks,
Baihan.


>> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
