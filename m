Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB9422CBFC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562210; cv=none; b=KbEiC+GQEsOXVcvYE3W8YYtOK/Kf8K2CXhVWLQ3MaK4cRcERtov0sultns6rP5ilUEyH1yqtrBFYsSA2DvewWgewhDJ21gHFhvksK/sWlBrREOLCNXvBObOHVyMlj7VLWcCWUNa3jP4qp5Bq5woisj0dsw3dRvWjzFV3pz/ArvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562210; c=relaxed/simple;
	bh=j3cHNJDdLYIf4zIb7mK5CcsMMbztVc6QFi2O63UkmYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=STPArnIITPwJUmiXaRzuq4ql/5W3V5H6WLjT1WWggYiDpreiob0UsnWpvmEMPBVSy6oVdDa2CJ8wtNQS+S2f+TP0RExiHrEPPa9pq6LMAXNxdkRVsOHwPzTIQfMBksdCvf66qqzNcAwMzDrKLFEFtPdcUVmtUVHA1XjeBEh2tKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bGqLb38lMz2Cdhr;
	Tue, 10 Jun 2025 21:26:15 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 508101A016C;
	Tue, 10 Jun 2025 21:30:06 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:30:06 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:30:05 +0800
Message-ID: <2a1b81d3-ec5f-4cbb-9660-899648ab4538@huawei.com>
Date: Tue, 10 Jun 2025 21:30:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 07/10] drm/hisilicon/hibmc: add dp encoder modeset
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
 <20250530095432.1206966-8-shiyongbang@huawei.com>
 <tnd4pt3htbouufhcjm6lvtnmc54hmlxjqdztetwam6mgf257ko@xc5ftua25ojc>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <tnd4pt3htbouufhcjm6lvtnmc54hmlxjqdztetwam6mgf257ko@xc5ftua25ojc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100007.china.huawei.com (7.202.195.175)


> On Fri, May 30, 2025 at 05:54:29PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Add GPU display control enable in dp_mode_set(), which is already
>> in vdac's mode_set, however, if vdac is not connected, GPU
>> cannot work.
>>
>> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Typically, incorrect tag.
>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> index e4b13f21ccb3..d9ae7567ebb7 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_edid.h>
>>   
>>   #include "hibmc_drm_drv.h"
>> +#include "hibmc_drm_regs.h"
>>   #include "dp/dp_hw.h"
>>   
>>   #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>> @@ -169,9 +170,26 @@ static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
>>   	hibmc_dp_display_en(dp, false);
>>   }
>>   
>> +static void hibmc_dp_encoder_mode_set(struct drm_encoder *encoder,
>> +				      struct drm_crtc_state *crtc_state,
>> +				      struct drm_connector_state *conn_state)
>> +{
>> +	struct drm_device *dev = encoder->dev;
>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>> +	u32 reg;
>> +
>> +	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
>> +	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
>> +	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
>> +	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
>> +	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
>> +	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
> This is a c&p of the corresponding VDAC code. Please move it to a common
> function instead.
>
> BTW: what does it mean that the GPU cannot work? Do you mean that the
> display hardware doesn't work or that the GL calls do not work?

Okay, I will delete it here.

It's about hardware, which may cause no signal.


>> +}
>> +
>>   static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
>>   	.atomic_enable = hibmc_dp_encoder_enable,
>>   	.atomic_disable = hibmc_dp_encoder_disable,
>> +	.atomic_mode_set = hibmc_dp_encoder_mode_set,
>>   };
>>   
>>   irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>> -- 
>> 2.33.0
>>
