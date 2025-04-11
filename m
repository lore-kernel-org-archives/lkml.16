Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31A3FC7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744336708; cv=none; b=YIkmTnOEgCnLLd5YJA6T9e134UaGbrkzwB8EHwMBzhUaBFEFJMY5alSWy7clYi+o8IZ7tthSWbKQgBY15iXzB/wfE+ZcCPem0Aiqf0CLNJojCMXrArztVoC1umqaPY3SZ6z3BwOOV4BJ/hWPoShFgpTACS9JCrk0JkDkaekpj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744336708; c=relaxed/simple;
	bh=/yNlZxFmBIUVxwqLPWf/sm8KHxLprNEp4EjE0VfwWsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i3AMA/uRBsBi+pRJBpuxpmqXNlSUbfXdQ4NFfEVUcTZ6QmDqOwh6GDZoFJIQFvEpD6ym80pA7XRrizlByafRX0KpPLux5Q+RegJxWNyICZB685ekSzQAWWs1uTiEMlXiJQlg/CyKP4F2GHRQ0fm1nHBy2Qz5GDtvwQCO0EIWdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZYfph4Qwvz1jBZF;
	Fri, 11 Apr 2025 09:53:16 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id C331F1A0188;
	Fri, 11 Apr 2025 09:58:15 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Apr 2025 09:58:14 +0800
Message-ID: <d10f2456-23c8-4695-89bb-f587882368c8@huawei.com>
Date: Fri, 11 Apr 2025 09:58:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 drm-dp 0/9] Add HPD, getting EDID, colorbar features in
 DP function
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20250331074212.3370287-1-shiyongbang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)

Gracious ping for this series, it's been posted over 10 days.

Baihan,
Thanks.


> From: Baihan Li <libaihan@huawei.com>
>
> To support DP HPD, edid printing, and colorbar display features based on
> the Hisislcon DP devices.
> ---
> ChangeLog:
> v8 -> v9:
>    - modify the adaptation of hibmc_dp_link_reduce_rate().
>    - fix the leak problem in hibmc_dp_aux_init(), suggested by Jani Nikula.
>    v8: https://lore.kernel.org/all/20250320101455.2538835-1-shiyongbang@huawei.com/
> v7 -> v8:
>    - use drm_edid_read() in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
>    v7: https://lore.kernel.org/all/20250319032435.1119469-1-shiyongbang@huawei.com/
> v6 -> v7:
>    - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
>    v6: https://lore.kernel.org/all/20250310040138.2025715-1-shiyongbang@huawei.com/
> v5 -> v6:
>    - fix the DP_SERDES_VOL2_PRE0 value after electrical test.
>    - move the detect_ctx() to the patch 7/9.
>    - add detect_ctx with 200ms delay, suggested by Dmitry Baryshkov.
>    v5: https://lore.kernel.org/all/20250307101640.4003229-1-shiyongbang@huawei.com/
> v4 -> v5:
>    - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
>    - fix the format of block comments, suggested by Dmitry Baryshkov.
>    - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
>    - separate the vga part commit, suggested by Dmitry Baryshkov.
>    - remove pci_disable_msi() in hibmc_unload()
>    v4: https://lore.kernel.org/all/20250305112647.2344438-1-shiyongbang@huawei.com/
> v3 -> v4:
>    - fix the serdes cfg in hibmc_dp_serdes_set_tx_cfg(), suggested by Dmitry Baryshkov.
>    - move the dp serdes registers to dp_reg.h, suggested by Dmitry Baryshkov.
>    - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
>    - fix the comment log to imperative sentence, suggested by Dmitry Baryshkov.
>    - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
>    - add link reset of rates and lanes in pre link training process, suggested by Dmitry Baryshkov.
>    - add vdac detect and connected/disconnected status to enable HPD process, suggested by Dmitry Baryshkov.
>    - remove a drm_client, suggested by Dmitry Baryshkov.
>    - fix build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/
>    v3: https://lore.kernel.org/all/20250222025102.1519798-1-shiyongbang@huawei.com/
> v2 -> v3:
>    - restructuring the header p_reg.h, suggested by Dmitry Baryshkov.
>    - add commit log about dp serdes, suggested by Dmitry Baryshkov.
>    - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
>    - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
>    - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
>    - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
>    - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>    - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
>    - split the patch into two parts, suggested by Dmitry Baryshkov.
>    - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
>    - rewrite the commit log, suggested by Dmitry Baryshkov.
>    - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
>    - change binary format to integer format, suggested by Dmitry Baryshkov.
>    - remove mdelay(100) hpd function in ISR, suggested by Dmitry Baryshkov.
>    - remove enble_display in ISR, suggested by Dmitry Baryshkov.
>    - change drm_kms_helper_connector_hotplug_event() to
>      drm_connector_helper_hpd_irq_event(), suggested by Dmitry Baryshkov.
>    - move macros to dp_reg.h, suggested by Dmitry Baryshkov.
>    - remove struct irqs, suggested by Dmitry Baryshkov.
>    - split this patch into two parts, suggested by Dmitry Baryshkov.
>    v2: https://lore.kernel.org/all/20250210144959.100551-1-shiyongbang@huawei.com/
> v1 -> v2:
>    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>    - changing all names of dp phy to dp serdes.
>    - deleting type conversion, suggested by Dmitry Baryshkov.
>    - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
>    - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
>    - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
>    - using debugfs_init() callback, suggested by Dmitry Baryshkov.
>    - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
>    - optimizing the description in commit message, suggested by Dmitry Baryshkov.
>    - add mdelay(100) comments, suggested by Dmitry Baryshkov.
>    - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
>    v1: https://lore.kernel.org/all/20250127032024.1542219-1-shiyongbang@huawei.com/
> ---
> Baihan Li (9):
>    drm/hisilicon/hibmc: Restructuring the header dp_reg.h
>    drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage
>      and pre-emphasis
>    drm/hisilicon/hibmc: Add dp serdes cfg in dp process
>    drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
>    drm/hisilicon/hibmc: Getting connector info and EDID by using AUX
>      channel
>    drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
>    drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
>    drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
>    drm/hisilicon/hibmc: Add vga connector detect functions
>
>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  10 +-
>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  91 +++++++++++-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  36 +++++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  90 +++++++++---
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 130 +++++++++++++-----
>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  71 ++++++++++
>   .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  74 +++++++++-
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  87 +++++++++---
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  12 ++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   3 +
>   14 files changed, 636 insertions(+), 93 deletions(-)
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>
