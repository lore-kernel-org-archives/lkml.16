Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3529136672
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013299; cv=none; b=UXmDtGmsDoACMzCEXyQzmyhKLKK1gAhaiDWCSPMzufWzgTOYwCFRWGZ14HdCeo1w4hzhF9bOC/IMp7h1+OQNpBnLdgJ9HNM8Uwej6dfrrMmMrSM7Mzwjp9fB/yIQZ3tQctkTHz8M/njNSrXUex76Z8uBS2cCKOtEwdtz9SlQmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013299; c=relaxed/simple;
	bh=KdvlFKaKpUbOgjgfq12DbyqDD7NKUbnxtBo+PSRfK/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nELluXhn/5B5xwhIJ2NX4Ql0teojGmY/O0Vs5TFq3beMmhG/kH2s9NGodRqhlUr+58Y81tkrCGeTdOYUzRDUK9+zWVDkg+88SFFj8zSXUDL1LoFITfZK4sqR6Ov7BIkFcaRSaIGs+xCxBkMGRj0SzpWgdjUzVl+uKbU9fZpWIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bT82W2xR3z29dl6;
	Fri, 27 Jun 2025 16:33:07 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E02911A0188;
	Fri, 27 Jun 2025 16:34:47 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 16:34:47 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 16:34:46 +0800
Message-ID: <a828323b-6981-4aea-bdfa-bb89dc113e1a@huawei.com>
Date: Fri, 27 Jun 2025 16:34:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 drm-dp 00/10] Fix hibmc driver bugs
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<shiyongbang@huawei.com>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20250620093104.2016196-1-shiyongbang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq100007.china.huawei.com (7.202.195.175)

Gracious ping for this bugfix series, it's been posted a week!

> From: Baihan Li <libaihan@huawei.com>
>
> There are some bugfix for hibmc-drm driver.
> ---
> ChangeLog:
> v1 -> v2:
>    - use the hibmc_ddc_del() in hibmc_connector_destroy(), suggested by Dmitry Baryshkov.
>    - fix the tag, suggested by Dmitry Baryshkov.
>    - don't use the flag, and use more checks in detect_ctx(), suggested by Dmitry Baryshkov.
>    - delete if (dev->registered), suggested by Dmitry Baryshkov.
>    - add explanations in commit, suggested by Dmitry Baryshkov.
>    - delete if (!dp->is_connected) in hibmc_dp_mode_valid(), suggested by Dmitry Baryshkov.
>    - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
>    - use crtc clone to let 2 connectors can display simultaneous
>    - separate the patch, suggested by Dmitry Baryshkov.
> ---
>
> Baihan Li (10):
>    drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init
>      failed
>    drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
>      irq
>    drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
>    drm/hisilicon/hibmc: fix the hibmc loaded failed bug
>    drm/hisilicon/hibmc: fix rare monitors cannot display problem
>    drm/hisilicon/hibmc: add dp mode valid check
>    drm/hisilicon/hibmc: fix dp and vga cannot show together
>    drm/hisilicon/hibmc: fix no showing when no connectors connected
>    drm/hisilicon/hibmc: fix no showing problem with loading hibmc
>      manually
>    drm/hisilicon/hibmc: adapting modification for the former commit
>
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 +-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 48 +++++++++----
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  8 +++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++---
>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 ----
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 70 +++++++++++++++++--
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 22 +++---
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  1 +
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  5 ++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 12 ++--
>   10 files changed, 163 insertions(+), 52 deletions(-)
>
