Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931811F754E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205214; cv=none; b=IOFcMztta+5J/k/s2psRaT7Xi7byVWPA8UwksYIiwADG5fhnb/f5Mub3aBE3JUbmR+CGttB2y4WKlVfZxWu4YHwP1t4w44uise2bcGl/drCVE/NRbuH1ic8h4/PGQ9io+rCVac3jCq+f2E2LUiRb+Y+VYaKQTU/D0vObHPYoSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205214; c=relaxed/simple;
	bh=M4cA7qoAWIwFkEorxLiKvroGik7xFHdvUS3ek+k/ZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RM+CtPuqWJybV1mLIUQgx2lGRGNRx4Eu+ie/JyybrLUfhr37z2gKCwIc2OfQgTmvvCsSxgSRiSNDARIpPtBQuI3rzOsSM9w1ozn9z30mrC+mWpD1k8pc1f4jyZmx0XFOQW2u5XkNNfvaJr7+1kU7qyywjrBSXktqRxr4CJ4rZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jojD/fRa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jojD/fRa"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450cf3ef63so1109053e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739205210; x=1739810010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pe/8G8o+M5FZSgjrZo2plu0mkbz1sg3BqYR0IsKFs8E=;
        b=jojD/fRaBoJEwCAIi17FpyCXNMb+YdrZiop8a0L9D7wDb0hJ52jLNNe7DW9CQ9XEt9
         v0q+sLidTTgG3bv6+g4Uta7sQEYEFXqL4xNp9Q09vlEhYC/DKL9Bds22/R29FSZVXbj/
         Qi3iiFnNvkjjYCG3bf1dKPRX9cTBmv8hv2ICPbxCPcnIzewXJatw/OrCq8vhQ/Z/SfTh
         o9g3Mwd7WXMmkipl3C1VxNbnvxt6VqqH4jkTrdHqa53fhreSS5tIab7cymLRx/RQJImY
         kZ99ojbL2x23+z7KREJ+cu2COmsw7OsKN3idm8DZQW6NQyzs8zITGqXRzCmQxmCQMayg
         MYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205210; x=1739810010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe/8G8o+M5FZSgjrZo2plu0mkbz1sg3BqYR0IsKFs8E=;
        b=qMnJwDLE2+OoRSTs2VnSZMtV69Qqsn/OwPUvYW2lb3d3SmK4e+oUKcBP0f6KPNl1pt
         v0zASVDi4O3ty4sSZN/WNqu9fIrc7G2HbgqFFhkrK0oMOBy+GPaJBp1YvJVQLOEwvd8n
         k6Ly7lYMQ3qIseu1uS6zU7UKHKK78zMYSsw26g8b3cj1QLifudotR7X1rCtw9ALhHXhC
         gIktYirB+HQny3z0Nqd7Yo3w3O54NiGU1X/UsF2BL/T/UbwC059893cVNyex0Pc5hysp
         FOPXGG0Jkgj7pp8j3sJStWn5FxxS/g91PkFr9DjP7faas0McNhEcp4VZbGztcgzFCU+H
         mGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTDRkFVnDkZUPAiHuh+zgSEcvexEb3WOEYVPLzPEX9lMLEeZW3MK8/0SKOBi4l+v/ieOKW/GYtkysyy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2iTDqKVEO1VemSc9IV6Hjs+UroUjJr54uarcCjzhPnr1U5jU
	Mfos/a1HJGbNs+xsUKQbhnNMQMiK4UxOUtAH+4gPwQyH5SHvOg4eRJLnIhzRg/c=
X-Gm-Gg: ASbGncv8hVCCMoOIRZQUaOLImdEhXPdKW/gfz1sm1Nv/7Z7OyZXkKl1rTByWje2e+pF
	e8UNuU0dtzvxYZ9cYxuv1Z4dz78L1gZrf/WldTBk+5uAyHJVj4tuZD+on/Nr3Jvmm3ZctvLrbYZ
	BYwgNKAfKKdStPMTiIAakVjzNzBFAzTpmMdWkQt6j/4ejg2EXMgPdRCTPyHRb1g6EEDUcdGchE2
	faXv7aqolFgdPnbWSLIRVD+fOJJjpuHYqWKXKb/4UWhDkiq84cw6kTOkMuN1J5W9BCV4AePjVUo
	zvJRum1OAcccGmEYRtEL+QhhEiWeZ6Vxucb2N8bH1i78vpsk63l+JP40vHjlOJ0rx9ib5Sw=
X-Google-Smtp-Source: AGHT+IF05hjnakzwKRMNzAORQhT+bWDxrwRXpn3TfkAben5IGr+ferileSAupXWycBYUMqKX0KPRqA==
X-Received: by 2002:a05:6512:2254:b0:545:5de:f46e with SMTP id 2adb3069b0e04-54505def563mr2412041e87.39.1739205210432;
        Mon, 10 Feb 2025 08:33:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450654e778sm696499e87.60.2025.02.10.08.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:33:30 -0800 (PST)
Date: Mon, 10 Feb 2025 18:33:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
	chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
	shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 1/7] drm/hisilicon/hibmc: Add dp phy cfg to
 adjust serdes rate, voltage and pre-emphasis
Message-ID: <63t7lgayor3rpsdbeluwjt6ccohmsz4facj6illae6wn5nhbu4@kek3iggrioq4>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-2-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-2-shiyongbang@huawei.com>

On Mon, Feb 10, 2025 at 10:49:53PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> This serdes is inited and configured for dp, and integrating them into dp
> init and dp link training process.
> For rate changing, we can change from 1.62-8.2Gpbs by cfg reg.
> For voltage and pre-emphasis levels changing, we can cfg different
> serdes ffe value.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>   - changing all names of dp phy to dp serdes.

Nit: subject still mentions phy.

Nit #2: The s/phy/serdes/ doesn't change the fact that you are still
doing PHY-like programming. As such, please mention in the commit
message that using PHY subsystem is impossible for you.

> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  4 +
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 74 +++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    | 36 +++++++++
>  5 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 95a4ed599d98..43de077d6769 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index 2c52a4476c4d..e7746bc4b592 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -38,6 +38,7 @@ struct hibmc_dp_dev {
>  	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
>  	struct hibmc_dp_link link;
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	void __iomem *serdes_base;
>  };
>  
>  #define dp_field_modify(reg_value, mask, val)				\
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index a8d543881c09..39fd3687efca 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -7,6 +7,7 @@
>  #include "dp_comm.h"
>  #include "dp_reg.h"
>  #include "dp_hw.h"
> +#include "dp_serdes.h"
>  
>  static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
>  {
> @@ -165,6 +166,9 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  
>  	hibmc_dp_aux_init(dp_dev);
>  
> +	if (hibmc_dp_serdes_init(dp_dev))
> +		return -EAGAIN;

Can you simply propagate the return value here?

> +
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> new file mode 100644
> index 000000000000..66586db2268a
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/delay.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include "dp_comm.h"
> +#include "dp_config.h"
> +#include "dp_reg.h"
> +#include "dp_serdes.h"
> +
> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX])
> +{
> +	u32 serdes_tx_cfg[4][4] = { {DP_SERDES_VOL0_PRE0, DP_SERDES_VOL0_PRE1,

static const

> +				     DP_SERDES_VOL0_PRE2, DP_SERDES_VOL0_PRE3},
> +				    {DP_SERDES_VOL1_PRE0, DP_SERDES_VOL1_PRE1,
> +				     DP_SERDES_VOL1_PRE2}, {DP_SERDES_VOL2_PRE0,
> +				     DP_SERDES_VOL2_PRE1}, {DP_SERDES_VOL3_PRE0}};
> +	int cfg[2];
> +	int i;
> +
> +	for (i = 0; i < HIBMC_DP_LANE_NUM_MAX; i++) {
> +		cfg[i] = serdes_tx_cfg[(train_set[i] & 0x3)]
> +			 [(train_set[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT & 0x3)];
> +		if (!cfg[i]) {
> +			cfg[i] = DP_SERDES_VOL3_PRE0;
> +			drm_warn(dp->dev, "dp serdes cfg beyonds the allowable range\n");

Is it something that you should be mitigating? Can you return -EINVAL
instead?

> +		}
> +
> +		/* lane1 offset is 4 */
> +		writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, cfg[i]),
> +		       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET + i * 4);
> +	}
> +
> +	usleep_range(300, 500);
> +
> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
> +		drm_err(dp->dev, "dp serdes cfg failed\n");

drm_dbg?

> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> +
> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
> +{
> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE0_RATE_OFFSET);
> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE1_RATE_OFFSET);
> +
> +	usleep_range(300, 500);
> +
> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
> +		drm_err(dp->dev, "dp serdes rate switching failed\n");
> +		return -EAGAIN;
> +	}
> +
> +	if (rate < DP_SERDES_BW_8_1)
> +		drm_warn(dp->dev, "reducing serdes rate to :%d\n",
> +			 rate ? rate * HIBMC_DP_LINK_RATE_CAL * 10 : 162);

drm_dbg

> +
> +	return 0;
> +}
> +
> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> +{
> +	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> +
> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> +	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> +	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> +
> +	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> new file mode 100644
> index 000000000000..57f7f054f2b7
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2025 Hisilicon Limited. */
> +
> +#ifndef DP_SERDES_H
> +#define DP_SERDES_H
> +
> +#define HIBMC_DP_HOST_OFFSET		0x10000
> +#define HIBMC_DP_LANE0_RATE_OFFSET	0x4
> +#define HIBMC_DP_LANE1_RATE_OFFSET	0xc
> +#define HIBMC_DP_LANE_STATUS_OFFSET	0x10
> +#define HIBMC_DP_PMA_LANE0_OFFSET	0x18
> +#define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
> +#define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
> +
> +#define DP_SERDES_VOL0_PRE0		0x280
> +#define DP_SERDES_VOL0_PRE1		0x2300
> +#define DP_SERDES_VOL0_PRE2		0x53c0
> +#define DP_SERDES_VOL0_PRE3		0x8400
> +#define DP_SERDES_VOL1_PRE0		0x380
> +#define DP_SERDES_VOL1_PRE1		0x3440
> +#define DP_SERDES_VOL1_PRE2		0x6480
> +#define DP_SERDES_VOL2_PRE0		0x500
> +#define DP_SERDES_VOL2_PRE1		0x4500
> +#define DP_SERDES_VOL3_PRE0		0x600

These need some explanation.

> +#define DP_SERDES_BW_8_1		0x3
> +#define DP_SERDES_BW_5_4		0x2
> +#define DP_SERDES_BW_2_7		0x1
> +#define DP_SERDES_BW_1_62		0x0
> +
> +#define DP_SERDES_DONE			0x3
> +
> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
> +
> +#endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
