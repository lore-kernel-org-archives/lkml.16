Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF7246BCA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562012; cv=none; b=WalUkA2jdzRiNiUZvgqfgYoMAl/BPS5opAJxqZ/tAsZV+5wkOCaXhLI/0qtWgmeFSb5tlx6Ypb2er1/jEiJ2aygFH/txQTooyWqgQrH+CCm75rGLSDOBHwYQm0KVPzSFwLFpA+JYFmd/S/5XL4JrAJjXkW73oX1dUYNG/K805l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562012; c=relaxed/simple;
	bh=FVYhjR8Pvklr7iSaukZfLeLoDpt1FGE2rjshGF22cNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V646j6ZnoZOcchYfe4xbRrHh2hTV/ACYqdInp9JJQ26WFsNG/PmOClwOWO9KfQa+tZXdREj0zpvg44W3A9BzwHK8FEwCO0dmrDsBqfdHvau5b4aXteWC9znB2ZBddqkWgWmJij6zpeX5tfU7ZBfYdL5TYSxHxcdTrM0Ddu00Ayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bGqKp1LmYzVmdr;
	Tue, 10 Jun 2025 21:25:34 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0836A14034D;
	Tue, 10 Jun 2025 21:26:46 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:26:45 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:26:45 +0800
Message-ID: <5e27739f-2cb1-4010-88b9-8908404f60ae@huawei.com>
Date: Tue, 10 Jun 2025 21:26:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
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
 <20250530095432.1206966-3-shiyongbang@huawei.com>
 <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
 <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
 <a5658165-9e8a-49e6-b2ed-75b25c074b87@oss.qualcomm.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <a5658165-9e8a-49e6-b2ed-75b25c074b87@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100007.china.huawei.com (7.202.195.175)

>>
>>
>>>> +        if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
>>>> +            drm_dbg_dp(dev, "HPD OUT isr occur.");
>>>> +            hibmc_dp_reset_link(dp);
>>>> +            dp->hpd_status = 0;
>>>> +            if (dev->registered)
>>>> + drm_connector_helper_hpd_irq_event(&dp->connector);
>>>> +        } else {
>>>> +            drm_warn(dev, "HPD OUT occurs, irq status err: %u", 
>>>> dp- >irq_status);
>>> These should be ratelimited.
>>
>> Sorry, I didn't get it. Do you mean I need print the link rate here?
>>
>
> No, I was thinking about drm_err_ratelimited() in case something gets 
> stuck in the hw.
>
Okay, I will try to use it.


