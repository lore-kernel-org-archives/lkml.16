Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739519AD90
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749386515; cv=none; b=RdZ6ixQINzs3lXe/MYZZBFHKEmKFoGyc4mEJLvIvvEa8dtqscONIzQc7vhgUsRRKW876UbTtljbmDgnD2PBU2jgl3Pi/4CseKR993KPixu3wwIEuZNa7T/VbYl7l42D97pG0ReJsrZ9lyFlWtbWa40UiK339T5Oh7jkCPHj5Qk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749386515; c=relaxed/simple;
	bh=NzRxviunWOEsbkReXk/r4BKdbF42crBE/KpxBADQliI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ab7DkV/mse+B7jY51wV3XnlxjF5ZS8olcguLh9ZTGj+NjHe6w0qaSywtGH8FZxYZ8Vda/rS1Rd80di37Nk7qdHIDjBco+zTxauDrZL0aZQDUShxObc3gYCp9oMqqWw7v806vAT42z37dcrUcFRQ+5eI3wPoPrYNqxt18i9OAfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxhBEZ1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxhBEZ1k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558CGNsN027328
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 12:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UojFT/XZ6ePN7/uDU9jLUIiF
	JtM7ROueqeCYkJKglhE=; b=pxhBEZ1kyw2vUQ2HuXlRVZ5Ktwt+ai+priEODoIp
	XpXxFtuwj5fwERvvmvlwK7oMfWoi2R0mGV7ZoRAuAfL3q2RSrVkUbMCOdMbsXNP8
	GJod2FEd7VTu1NfD5VtIoM8YCuTfs36OArv8kn71bJsITrb+4jIAph5WyKVHKCQ7
	3MkNQlA/X2BpWpOuhEkcKQThcJJpg+vEjHW+28yL/nil22+O8Qen7s2zNGqtChH5
	FJ9eWhe3XcGXQ4E1exuX+ZUHdOsAXTgKd4HzKwIAPWg/GbN7nmXPl8JVD1+lF3Rk
	d1Cv1nz/PhLBisIo5FqOK214Dh0+xNhzjAdwncrkj5xJ9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11twmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:41:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso650606385a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749386512; x=1749991312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UojFT/XZ6ePN7/uDU9jLUIiFJtM7ROueqeCYkJKglhE=;
        b=BFPEx6GsxPr5no4aCQY/LeChNKmGmlpXBHZoDW2R+4WGgk0RGBCbFYNUL4PWDN2cd2
         Q/KTZWGPHTG4o8D155D8X5LmzlKTzqCB7V4KdUnQ0+VdcepVBSOZukarqSzMjKReX3KZ
         ryaYe5IpH5tZEsBvzcKCnkTaO+2I0yohse1nMuDMG+GmPe2RJC7zRvpIhncX3g9JXOp9
         ZsfG/0qxd72L9FUBfVak8omTzXgGt9xn5wZkgkbBiL7d9OCol4B7eiVM9jrI/jcc+tzo
         ac3xcUAC6bhjUxWANE7CjFY4kMqzbVnK1gtV0q9HUWaKqCy2BhaCHqswFIF7ZFxMjHMw
         odmA==
X-Forwarded-Encrypted: i=1; AJvYcCVPVlHfJgS4zlJLv9tH+loVgKf9p6756vQ+UofyHtaO/RlEUeaF2yBrdKz8mWWywyKdhTey0h8i4ETxv5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KRY/n6B+wpfeMfmpVrt8hUNw4kXP2r8T1/8ypj96IJWyidTf
	7h61VHu5cpYcFx3HxXcWq2Ez192YjQpP286SxRl8SESdm0bn+mXiCQZHmolx2qiNjDoQpOzYSKu
	tOxajJLX5CBNnuRnMgJSumPkAHtaXJDzTlA3ZXA4JBKPskEi4Lr+RhuzsOotz7IVZflY=
X-Gm-Gg: ASbGncuCWQXOO4xm6xYAqq+hwzeJWA4bEjcX58PqGw3otlSz97OCriro3Yksz5DrUvp
	Pb2jym05jL3McZifIHmShuItxtqIFd1n/7MVyJXOaB8QvAVGyetgOKlDvShzheWofVrYvbD9IzW
	9DBqhqXvWGlzdGzbHkMTA1hHahGPAdgSB7xGrD6bACZW9n739Uxlt97XTbuI27Y2oqqWhw1+m23
	fPZtXRbMGgnWVLngbt8lcQOk2vAS9OPMjj3t1/kRjgjbLGS2O7yGTnKnB/ckFlw2FzoYTXc/4tl
	cvuF7u3KAzlrUspWfJh9Pb64EKg9ww2weVA7gxsgoVNPP4zy2c+JKFdS4nqo078S53F99oFU/rQ
	=
X-Received: by 2002:a05:620a:2412:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d2298e8cf1mr1579436885a.44.1749386512065;
        Sun, 08 Jun 2025 05:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMYJMwPY3R512JnCgj+i/35562ih+F9VmoYd/f7IRCFB56s2bhVP12Z8GD9lWPFgq/5GMC6A==
X-Received: by 2002:a05:620a:2412:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d2298e8cf1mr1579433485a.44.1749386511651;
        Sun, 08 Jun 2025 05:41:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773105bsm752884e87.195.2025.06.08.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:41:49 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:41:47 +0300
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
Subject: Re: [PATCH drm-dp 07/10] drm/hisilicon/hibmc: add dp encoder modeset
Message-ID: <tnd4pt3htbouufhcjm6lvtnmc54hmlxjqdztetwam6mgf257ko@xc5ftua25ojc>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-8-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-8-shiyongbang@huawei.com>
X-Proofpoint-GUID: X8T3noq0WoFLqO95qOV1azzoYt1sHPY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5OSBTYWx0ZWRfX3ov/epBWWa+3
 We6R8Gp5+sXgAIEuFN4e0MnFJCpvjpY8K5kLcp1P1rOr34gKaxbZQMiRbYSHR58Udzw977yr4Kx
 CQmHDbwtU8d1nWtG32YCGBkuKVUKS6bYZnG4T/luwOHSXGk4seACIUseNxoH/K5M1+sCmpSin1c
 GJysFFFoTPmqHG4kX9keUv/yTJq1aogyZ29tyaaXpdpez43aZcug3lgRziJ/H/YSbB0/2ohhY4D
 HXSAXFQLN6vOkQhsQPibQyHLqkmSuG/a6WA/AMD5dyVPaGhoxMrNWmij8z5Vk5h/9CEFcX9BLwv
 Ho8d3xNQC42bn0UrMwVjt7tp+5pyMLPSLWQ4HnjC3Tq78Kkh4xJH5w6m1+jK04xfauOgUN0jvXx
 e4ATmYARIwTijYI5/Kozpyk516WC1MqqQRh68DpDjkeJXm7CvTP7yyvmW6ZaMOMI8vqDBa+Q
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68458510 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=68so5tFH4fhIJVB1-RUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X8T3noq0WoFLqO95qOV1azzoYt1sHPY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080099

On Fri, May 30, 2025 at 05:54:29PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add GPU display control enable in dp_mode_set(), which is already
> in vdac's mode_set, however, if vdac is not connected, GPU
> cannot work.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")

Typically, incorrect tag.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index e4b13f21ccb3..d9ae7567ebb7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_edid.h>
>  
>  #include "hibmc_drm_drv.h"
> +#include "hibmc_drm_regs.h"
>  #include "dp/dp_hw.h"
>  
>  #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> @@ -169,9 +170,26 @@ static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
>  	hibmc_dp_display_en(dp, false);
>  }
>  
> +static void hibmc_dp_encoder_mode_set(struct drm_encoder *encoder,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	u32 reg;
> +
> +	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
> +	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
> +	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
> +	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);

This is a c&p of the corresponding VDAC code. Please move it to a common
function instead.

BTW: what does it mean that the GPU cannot work? Do you mean that the
display hardware doesn't work or that the GL calls do not work?

> +}
> +
>  static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
>  	.atomic_enable = hibmc_dp_encoder_enable,
>  	.atomic_disable = hibmc_dp_encoder_disable,
> +	.atomic_mode_set = hibmc_dp_encoder_mode_set,
>  };
>  
>  irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
