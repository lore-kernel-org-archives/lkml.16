Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265C28B3ED
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289308; cv=none; b=ZnCyn5MW/5hOMfZ2wtBT1URK+gx0P11DgS9kpZH7nzvcJs2wu6Wnz9syUwceNyiUw/KoVHIGW9XwALqrdXqDKCuE7PLOTg6qlQRwgK5PKoyrfZhycItZSVNerr7khO8as02qsXCV/sPPJ8RlOmIzh4HvJb+q2rS3iCFbcryy/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289308; c=relaxed/simple;
	bh=Uqr3YWdU3E8Wsegybq9yk4amCuftpic6b/mKpkgVMmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YT3dal+gToNbmebtIN20OMsePv375LJ65Ze8qTBSa8XJV3QG3ng1jCgyBuntIW8iUh55+pnYzIuYHbDXOsOZKFxy+s+KpwpVGDIeSpbxDiHUU4BTbDCTGySE9O5HAmYGTBcOy0VihOF4wMnrU4uKxacTdyum4J6NisIa+1LFyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bW63q2xGnz2CfZj;
	Mon, 30 Jun 2025 21:11:03 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 450DF1401E9;
	Mon, 30 Jun 2025 21:15:03 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 21:15:03 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 21:15:02 +0800
Message-ID: <15b82b51-4119-4cbc-94af-28cff068dc2f@huawei.com>
Date: Mon, 30 Jun 2025 21:15:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 drm-dp 07/10] drm/hisilicon/hibmc: fix dp and vga
 cannot show together
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
	<chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-8-shiyongbang@huawei.com>
 <7mgk3hueodkzodedjxpkzpf2b4x2n3fdqi42lmtsgozlaxv2tc@4cx7nb5pg7tb>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <7mgk3hueodkzodedjxpkzpf2b4x2n3fdqi42lmtsgozlaxv2tc@4cx7nb5pg7tb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, Jun 20, 2025 at 05:31:01PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> If VGA and DP connected together, there will be only one can get crtc.
>> Add encoder possible_clones to support two connectors enable.
>>
>> Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v1 -> v2:
>>    - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
>>    - use crtc clone to let 2 connectors can display simultaneous
> How does this help? I had an impression that your hw can actually
> display only either to DP or to VGA. Can it send the same (aka cloned)
> video stream to both connectors at the same time?

Right, we support it. We support using KVM remotely operated, and
local maintenance using DP at the same time. KVM and VGA are both
using VDAC connector in driver. Actually, there are three outputs showing
at the same time.

Thanks,
Baihan.


>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
