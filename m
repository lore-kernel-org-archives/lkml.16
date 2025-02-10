Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E325E47F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228746; cv=none; b=D5UDrswMCaDNG42oTZ17S318UyJNaShadxR0QvMgHRJhyWp8ilsZHkZTlgV0rctm6oY0WcaBgh4rZiNzYc2fOmbzmuQx6yVU9K/Vkk/EXG2Y54wI6WN7nZJyoTZQqCMYz3DkmFXaigwSAVT7ZMzLgy9JBmmZJSW/M2r5cG/Fu4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228746; c=relaxed/simple;
	bh=6FKNnv1UlunHEYx7mLMFNp9z4ArXL9NQF8vpKdralCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX3ZjiU6cjFYvZhkEbZi2/9HeFxte0bfOsxd908xVxqfxUdAi4ktecQUye9NRgxe737pn8no4X45ncMLyzKaUzYWvBYgWXpNnW3ZZGJIFH12TuddbtbAmjfQ4JalK4u2hTqG+mJ7TNPjH//sE6QB01saOx67bL9F/CV7v/AdfiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFhd0ukZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFhd0ukZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450abbdce0so1711245e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739228741; x=1739833541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcigvOsom8rW0TkFj/qoAV54vRWRNJIlkjwbdGodttY=;
        b=kFhd0ukZ9BGJMfD+Sx9c+gAT7Ae4sf7Og7RvdjevJzv9sYxsjjGWyWTLlCjufrVMIR
         ZWQyMOsTEBjgMQbBBwQthFK7mVMVbPzcQM6vhaLp1k+P93pvn4Ikm5qJeadgHGtN8FSR
         EmKsZq0Rnh4RWLt96bk7oVQ0XyL9AStV22shECeCkBzh0BsxTTvZvUwo7p4hHyu+VWRC
         2mDTAPZxVr5jE7ex0g8VuxS45W1d0IwxsOMyIXGd9Ry8U+vBzKoD0RAfEDbkfZ0nyRK4
         B2MGiIu2d5HkPebzW3EvUTi+bVpliie70h1HI9NrmHjxO3cxpbWzsf5hTcUEP57uaEAC
         4Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228741; x=1739833541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcigvOsom8rW0TkFj/qoAV54vRWRNJIlkjwbdGodttY=;
        b=aIxCH1mup5jsjcPZ2CSU/msNgHvkGgyPT9pxASegZLzCA/82ZSuqUg6xmyC5yTEj/4
         p5ueD9c/iMAl4uR5zkErc5nV4dnP9v4OWDePvwMJgKOHqdoEnzUIHicQbv4HCJQHN014
         55M3LsLD4HutPOdKuGN9iQOO7/j+EuvEEA+GboF1YNfWfcB206DagPywvpX2sPKPQ35u
         ldKksDjH1bKVRASHJPJUD3pNgd0srn/MLOVzGEbnkPPYnQsPZ6jpHH9HwOscFggjq/CV
         md5WG8aqwRvGlyBChaVlnADHZlpt44qwc1wTEHpYm9OLh6m9F0qPd8jy3kLmKwvHDcV5
         48Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUWiIrslidqXzbHMrbxyFY8JBM45MEN3kqHUNz32+dsSc/abDynEznkNaB7VpXTFTMV4qVKplBs2oKdUBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOj4wXO00kbIZc5UzY+8oqy48Y0BCv0hVEAtdBy0GUFABB45YK
	7+QfDtf8pi7cR0nx+rtXR+VVUfeN6fW/1dFKPviaQ0PwxSRudAVH0tciqJ6QSlw=
X-Gm-Gg: ASbGnctY6aUPX6L6uKsHC3ldqwb0Saw2v4sbPg2TuRUcEuShBWc/H8kSIEMYPNfbSEe
	M/Yspkzt/iPJwFfWV+0XWEuAWmVUnaFj/KCpH5UQ/9USSkTuo30GnZHwUbnhtfyTKMRw1WqulWq
	eKOM41LDNfYqnptiIL9QIQ0tgzg9nclKhPm51/iJ8d3BL1CrNRrKqDv+KoO/lRmWRDJ8ZlGrykQ
	nd2uOrparnPWfw+qyuurKe6H1j600/khj5C/BtRhMzkmDJ44SrQ5/1PgsdPXI04zrAY7hcn7nh5
	V4tBxfnCPwqVakW5muyHx3xYe0BTNOdJ+AmhEU+9qfx9C4FfuxdD4mxQAs08PsXBUgFC1EM=
X-Google-Smtp-Source: AGHT+IHRg+0Zf5ZCqEHB/UKL+jMQrzL4szRlq+eqUZM1LIEU2ZEwlyiJWsv4K7Wf57PiyQ+cyZgSZg==
X-Received: by 2002:a05:6512:4029:b0:545:aaf:13f5 with SMTP id 2adb3069b0e04-5451186f38dmr443679e87.37.1739228740990;
        Mon, 10 Feb 2025 15:05:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450d947959sm349039e87.6.2025.02.10.15.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:05:39 -0800 (PST)
Date: Tue, 11 Feb 2025 01:05:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
	chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
	shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 2/7] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <cqlf4jj5mtxig4pw7nn5wi34miisuh7veuv5i4lz2wrxafbdb7@h7glfdpl6tyf>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-3-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-3-shiyongbang@huawei.com>

On Mon, Feb 10, 2025 at 10:49:54PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add dp serdes cfg in link training process, and related adapting
> and modificating. We change some init values about training,

Imperative language, please. Use 'change', not 'we change'.

> because we want completely to negotiation process, so we start with
> the maximum rate and the electrical characteristic level is 0.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
>  5 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> index 74dd9956144e..c5feef8dc27d 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> @@ -15,5 +15,6 @@
>  #define HIBMC_DP_CLK_EN			0x7
>  #define HIBMC_DP_SYNC_EN_MASK		0x3
>  #define HIBMC_DP_LINK_RATE_CAL		27
> +#define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 39fd3687efca..ee1ff205ff56 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <drm/drm_managed.h>
>  #include "dp_config.h"
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> @@ -73,6 +74,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
>  				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
>  	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
>  				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
> +				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
> +				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
>  }
>  
>  static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
> @@ -170,7 +174,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  		return -EAGAIN;
>  
>  	dp_dev->link.cap.lanes = 0x2;
> -	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
> +	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
>  	/* hdcp data */
>  	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> index f6355c16cc0a..43a4b656493f 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_print.h>
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> +#include "dp_serdes.h"
>  
>  #define HIBMC_EQ_MAX_RETRY 5
>  
> @@ -108,7 +109,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
>  		return ret;
>  
>  	for (i = 0; i < dp->link.cap.lanes; i++)
> -		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> +		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> +
> +	ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +	if (ret)
> +		return ret;
>  
>  	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
>  	if (ret != dp->link.cap.lanes) {
> @@ -137,21 +142,28 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
>  	return false;
>  }
>  
> -static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
> +static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
>  {
> +	u8 rate = 0;
> +
>  	switch (dp->link.cap.link_rate) {
>  	case DP_LINK_BW_2_7:
>  		dp->link.cap.link_rate = DP_LINK_BW_1_62;
> -		return 0;
> +		rate = DP_SERDES_BW_1_62;
> +		break;
>  	case DP_LINK_BW_5_4:
>  		dp->link.cap.link_rate = DP_LINK_BW_2_7;
> -		return 0;
> +		rate = DP_SERDES_BW_2_7;
> +		break;
>  	case DP_LINK_BW_8_1:
>  		dp->link.cap.link_rate = DP_LINK_BW_5_4;
> -		return 0;
> +		rate = DP_SERDES_BW_5_4;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> +
> +	return hibmc_dp_serdes_rate_switch(rate, dp);

This looks like:

if (dp->link.cap.link_rate == DP_LINK_BW_1_62)
    return -EINVAL;

dp->link.cap.link_rate++;
return hibmc_dp_serdes_rate_switch(rate, dp);

>  }
>  
>  static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
> @@ -159,6 +171,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
>  	switch (dp->link.cap.lanes) {
>  	case 0x2:
>  		dp->link.cap.lanes--;
> +		drm_warn(dp->dev, "dp link training reduce to 1 lane\n");

drm_dbg

>  		break;
>  	case 0x1:
>  		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
> @@ -206,6 +219,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  		}
>  
>  		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
> +
> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +		if (ret)
> +			return ret;
> +
>  		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
>  					dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
> @@ -255,6 +273,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>  		}
>  
>  		hibmc_dp_link_get_adjust_train(dp, lane_status);
> +
> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +		if (ret)
> +			return ret;
> +
>  		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
>  					dp->link.train_set, dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index 4a515c726d52..f2fa9807d8ab 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -72,5 +72,6 @@
>  #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
>  #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>  #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
> +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)

Please consider restructuring the header so that it becomes more
obvious, which register are these masks for.

>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index e6de6d5edf6b..bade693d9730 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -28,9 +28,7 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>  
> -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
> -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
> +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c

Unnecessary whitespace change.

Why HIBMC_DP_HOST_SERDES_CTRL is not in the dp_reg.h?

>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	}
>  
>  	/* if DP existed, init DP */
> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> +	if (ret) {
>  		ret = hibmc_dp_init(priv);
>  		if (ret)
>  			drm_err(dev, "failed to init dp: %d\n", ret);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
