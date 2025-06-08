Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C02635
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749382643; cv=none; b=kl3amJjAHrmjw55d1UBZlYZUCwZBadid8f+BeP/+Q1OK3jmLhluUgMyITHWDJZXTT47IbUyWzrq5xblYgT9jW259TVUHx1wvZJ/QwiSCFHY69htwSkPbicCql37pJiRRFhQV/5K/LCsRMD5Xjz38XEZM+ZAmypzTfYLZzSJtZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749382643; c=relaxed/simple;
	bh=D5PVMFLlu24lENn8MgWaKmk+YY3NHPuBKADAev6RoPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt7/Bx7eG9auWozttLSC+ylDSRyIV8CEnmx4bv/XMVll+soLguusc5/79i4R9jhhbKE1txqyeSEsi/Mpb/0wRH145lVz3k76jm0ifolmCIEDtrPqbAU0Q4kEByrgArbr8kpdumBn9FoAUVYpxK15pbA7RUUx6hlpIfNfRizxIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVGkSVzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVGkSVzM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5588xAlC025767
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 11:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2XzvULEwIZqT6WbSLPw/hGHn
	Rhu/r9F1q68TDz91od0=; b=nVGkSVzMEP1BV1NPpXFEm//Y8xlsVTHbXklUQdsw
	hRYoGCCfXJUf085a+4LwnRpBw6Upzv/bYjxhzZJ4dDf7cgo+JpX8NpDgbHe7bW5y
	c+BhrJjVYCKdOjPNtxFtxi0hMcQWLaCw5QcEvI8oXd/8ulhoZUpiHdC+PBryLNTx
	g9IQmtJOdN8D+NwBBtyUK9hHvjgfeYrR7IVENdHr1HTQlnNMPXiou4ppMlzumYVc
	E9fSqoerTPIQRy69XVhp/5uKrGWcNUcG30eqDvolnNRZNx2wlCEB06NcwgUICHF8
	xPGusO5EHGrGm6WiUWgTk/MlYEvbylzRmbshseR110OMYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv2n9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 11:37:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so556571785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 04:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749382633; x=1749987433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XzvULEwIZqT6WbSLPw/hGHnRhu/r9F1q68TDz91od0=;
        b=iggtYLSsl/T41Wydo3PoCZI3YEpcHZCFe6FmyrLVpB+vIOv+8KbTvegf6y42wy50vB
         FyUJEa0IZ4Y9SCi0X+Lz+GAx5ZPBYrE/omijU2NJ6J/avDhJ8apDOnjpq2h7MHzzXUOL
         kfPdNKDa2CjUsVB3d6oqryD6fODiyddJde25AqFEOBtS++8aL8ceiSGEsRDo+oBHbs0L
         X1+45XuwccDbu4NYCD/LNGpJTc6wSDl1GBwTpuUzhL3ir4X8g8wwV0zA4lIoCMzYJbAw
         6BIrfDffNi1/aqOmB8ZL65+QdmgK16Qmi1y6kuCe4kq3d7gcPopzU1saIZM+LIrK8q5k
         zAIg==
X-Forwarded-Encrypted: i=1; AJvYcCVt5oaJzySddsBx1Ze65r5NursutiSLlY+bSOZUPVFhW1K3Rmov6nhT3kJ0d5ve7Osl48ykL6g/yQd14Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YziWE5j7mKYqTOkdvzZW40sS03VOUDB64pwj4X3hvzz1UkTRR9o
	qHII+Zh/O/5jjU5+mP1b0CJwhH5e4UCCyXFC2nyPcbwzebv8gQz0AgtBtrKuhZB2pJAdqM6UIu3
	fs06RaSCeuCHIX5K3OQd8p915zWjYxm8U0N0ek1Xd59v7GZUT+pwKf3d4W7MoYf449s4=
X-Gm-Gg: ASbGncvZFVQ4y4vXQx3dTquZPaSuSprmeF8nLsXZK5DPHmG+/c5XbeH+STBXTwL/lDA
	nxisCdLd3w5D19oBcF2jbLt9RaMLGjaFVbgIvU/EaOSBoqQKUvUeZFK0ZQZ7KX5UnlpB3X5+rWf
	RAs32MFflaLcYIJ2yquYGAk7vbqiS0SgWAZ3OeqdF33R2TkRvKhHf1qJSIx9UcWrT0ZS2wJ6uVg
	07g2hUybEkSHlEM80ck0NPY83DryA7kTZ79xjjwoKNsHB2GYOVDuelMJVbA1QU2jdeWsm07JH6Q
	++y7Rf9YiSz7ZrJKW3JxxEsA8FyZFThloVt6IdVlD0lNa6aOIhN+LQmyAnrBPDm6PwtrLeJWkmk
	=
X-Received: by 2002:a05:620a:454e:b0:7d3:9108:2f55 with SMTP id af79cd13be357-7d3910831e4mr275252985a.50.1749382632818;
        Sun, 08 Jun 2025 04:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwLr0kqZ/s9Dd7WLfEY/47VaiSC3va5UAfPRrc1sQoQyVjYy/udgQ25TowUq/UHeft7uV0w==
X-Received: by 2002:a05:620a:454e:b0:7d3:9108:2f55 with SMTP id af79cd13be357-7d3910831e4mr275250185a.50.1749382632465;
        Sun, 08 Jun 2025 04:37:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731451sm741875e87.203.2025.06.08.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:37:10 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:37:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Message-ID: <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-3-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: OFo1swa80Ezylu44VRqiTL6YLpIRuxtx
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684575ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=2Qv6WW4UP-kDLlFIgDAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OFo1swa80Ezylu44VRqiTL6YLpIRuxtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5MCBTYWx0ZWRfX1++tpYoudNW5
 NjRpcXJ0JMyUpKyMxy+uml/IBMAMfjDlr+u1KiNkIu1r5IfWNwuQKNqMgxE/CK8sssnzlXrmVfs
 fs+QvbkUDUOcirfdHGwAJHSUQwUN8veC6C9WbyMEtzXJD08f++ihkr6CXh91Dt6kFtVhqcwsOtm
 +H2LxCjtURAy+YC24GlqP7Ud3y/G3gc07ScqL8byS9fho29U9/SkgIaoi8GhwHKcCFfIVuPMW8g
 VAnZldkMlMWBZiSfOTZ2ip+dFAsHctgjd6qPp5h4atXrNuigiruRYElljKOqe8Sjnr/ANufwAhg
 niy/xv5VIhxh5mla2FxoEvdJIP5vOZpqYJXZp/8nd1PXPwJ7QoD5fxYSPOeNw56typazzs66Di7
 N+Ux4jc70Q42V4j/jC2NRKJsdLiyn4eksygfrmWOqLWKoq5l2aKDm2x5u2UepOgBmFaeySIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080090

On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The debouncing when HPD pulled out still remains sometimes, 200ms still can
> not ensure helper_detect() is correct. So add a flag to hold the sink
> status, and changed detect_ctx() functions by using flag to check status.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
>  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 665f5b166dfb..68867475508c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -50,6 +50,7 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
> +	int hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index d06832e62e96..191fb434baa7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -13,7 +13,8 @@
>  #include "hibmc_drm_drv.h"
>  #include "dp/dp_hw.h"
>  
> -#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
>  
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
> @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	mdelay(200);
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>  
> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +	if (dp->hpd_status)
> +		return connector_status_connected;
> +	else
> +		return connector_status_disconnected;
>  }
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
>  	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	struct hibmc_dp *dp = &priv->dp;
>  	int idx;
>  
>  	if (!drm_dev_enter(dev, &idx))
>  		return -ENODEV;
>  
> -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> -		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> -		hibmc_dp_hpd_cfg(&priv->dp);
> +	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */

I think this way you'll ignore HPD short pulses. Could you possibly
clarify whether it is the case or not?

> +		if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
> +			drm_dbg_dp(dev, "HPD OUT isr occur.");
> +			hibmc_dp_reset_link(dp);
> +			dp->hpd_status = 0;
> +			if (dev->registered)
> +				drm_connector_helper_hpd_irq_event(&dp->connector);
> +		} else {
> +			drm_warn(dev, "HPD OUT occurs, irq status err: %u", dp->irq_status);

These should be ratelimited.

> +		}
>  	} else {
> -		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> -		hibmc_dp_reset_link(&priv->dp);
> +		if (dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_PLUG_INT) {
> +			drm_dbg_dp(&priv->dev, "HPD IN isr occur.");
> +			hibmc_dp_hpd_cfg(dp);
> +			dp->hpd_status = 1;
> +			if (dev->registered)
> +				drm_connector_helper_hpd_irq_event(&dp->connector);
> +		} else {
> +			drm_warn(dev, "HPD IN occurs, irq status err: %u", dp->irq_status);
> +		}
>  	}
>  
> -	if (dev->registered)
> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);

There is no need to, just call this function always at the end of the
ISR handler as it is done currently.

> -
>  	drm_dev_exit(idx);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
