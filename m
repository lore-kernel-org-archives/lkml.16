Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61263D544
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749381666; cv=none; b=qcFpS/EKbZ0JQQoqo0A/Lp9fb8j8Ei6NQ040TkcL50kmUzMiVNBBTWHhbXvdH6MhBaO0WQuje40nlcUI8zoNUFC/52P7I+croVyiDbDmhLDYKUbV+h3clGJ7pEVoMplJDoqIclR+EW5+PzIU1rfETTMJvbD2KbTtWV4IyteqRBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749381666; c=relaxed/simple;
	bh=QI2oQbJ2hqLaTLiVOF1d/Jx6nd7HGO7oQjBlgH8CcTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocjODQUFbk74owMymvsqi9/gxInyYoWDYNnH8OM3cWNNYEzwmqojjQcJskETBRnibNxp4ai3M68PK8HN9uubVrb12dBi8q0umK6kIvDgaaxMv0b8uw15ryfo40IVEHOM9W/a/4KNkGvK4JJ5p49+cfqdMz0JIEkqybjq9Aa8fXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCG56KV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCG56KV9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589e22W028029
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 11:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8oFvEUt9pCAclF9FHLBMxhOp
	lB/Y/ojl5ByGhYhgCKE=; b=FCG56KV91Q1dQdnsY38w/y9uIfxbh3FdDu2yDNgG
	tFCuFpRtHrQDBY+WvBU69AAkWd/Xs5eFjzfsKeAS9X+EwYzwSaKdfioB5zP+ekhu
	0QL2RLcaa5ga8CwFf7PkQnlnflR5NxvpCJERJ1axGP32SMWNSyE3H7+VYwx/N/qh
	7+WYi5BSwkCMh2k9DBPF/BdqPfuDYCANqbqRzz5WePP2tyTTqI1KKCIUhPTCC+E3
	aPokZRvrxTIdwEmhS2pLTdtVIcxnIL/tgIz2XCLbMisJnF5Lzj51FOLU+gOwleag
	h/YVd94837aU7rqePYFTpVHZESJN93aJhD72YDMHTxTFAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9js25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 11:20:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so659122185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 04:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749381654; x=1749986454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oFvEUt9pCAclF9FHLBMxhOplB/Y/ojl5ByGhYhgCKE=;
        b=nDopFYI22ToVPjhQ+vZVw3MldrU1wQCTmfg4vDYX1qrKoJe4U0OQFxtSrhu68RgJ0Z
         VFx9QowQkRCp1VAnPA+AHjYA46Gg7MEdZTrm/MvADE1ZDMZ63jAq1pWxS4C28v//COha
         5HDtw/KjU+btSmRtboPQSAtzn/Hg5W7oIHKCHtpLUhyeD9IN2BxLqjWeO7pr2uUQVsS0
         y2R31Ww9ZKJFygsq5Zo0Dj3WD8yVkTZa0euNXNWfR8wzbCcw7WmLoJX/tk/02tEq6LmY
         ZWimWUiEwnw7gqbin4sLEoM6f6RJMvPGZAIKmexSsf5dTQ81yKeOPuJKsmg+ESQGxHvK
         8oYA==
X-Forwarded-Encrypted: i=1; AJvYcCUHVNZ9EsdeATFYuEEXb05ioG28zjC0l11KAnZmZNg07LWlVQQhj1xgQ5BhGPU+geyv2UeCswEdUKLmD6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YysqVKRc9gqlOk9en3PbaL4LDyzimkJJZcDxGbuLsxryQs9HOn3
	Rk/HC58xxqNeLXkMZbDEb4ZCUzEAb/sdhFm+xqzLcb5/MyU09hY70U4Po/+My96UnWwlVUkwuPK
	fJnWq7pWBVqrgNqOvTwjoaoEOKEmxY04WW0CZA7GUmfYnZnezln92HteReFREKm1yaunUiQvknr
	s=
X-Gm-Gg: ASbGnct2Vy/N+rZJVlplfH+hJbqJoZWqgW/Xv8AgGs1k0l1AWLaVdfzD7nquzXoeX5t
	8oWr/ANQzsobtRitJJnJVrtLgW7mVpOqSTX2mzLQv2tzgLA92AyhtZDH4Iwcr7HvPYqwQFCTK9J
	koCHkd0OcQogkkoO54Plflo7OK/Q5+pMq83JKpHbiBc56ml+HZlRZKZYNTJzdy/caN0ZirSiuJK
	k/yyxqzYSZvk+VG01ZyzPN0nPRj7atF1JLJO1PcI0p3MpX9grkxxbcyYItMcxir+taCsXaQsgzM
	tY/YJVKsdSgU9e8YLrX/uU+PLHFdmmtZqVmWAx62skPKpxYdamMvmeJqO9rEE5heUZ8Rbid81dJ
	EUH9q/ZYlZg==
X-Received: by 2002:a05:620a:8f11:b0:7d3:8b7a:39c2 with SMTP id af79cd13be357-7d38b7a3bbamr530977785a.36.1749381654387;
        Sun, 08 Jun 2025 04:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHosEFrECBCREkY0h79WlBPsbkCxSPoZo0G2OPcBYJqREo8FcqRYEdh3lwUe7fpNH+k7RQRtw==
X-Received: by 2002:a05:620a:8f11:b0:7d3:8b7a:39c2 with SMTP id af79cd13be357-7d38b7a3bbamr530973385a.36.1749381653877;
        Sun, 08 Jun 2025 04:20:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722445sm739022e87.130.2025.06.08.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:20:52 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:20:49 +0300
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
Subject: Re: [PATCH drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device
 resource leak when vdac init failed
Message-ID: <agw2afrxbbzhyvzmnitnubw7kcppp2u54j5gfe2zllph62xx5j@u4r4xgqcq2q2>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-2-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-2-shiyongbang@huawei.com>
X-Proofpoint-GUID: hEDhk5cKOC2FonOjyZwNWZni27KTS_7F
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68457217 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=cIPARiM9ZozVWMCBJCwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hEDhk5cKOC2FonOjyZwNWZni27KTS_7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA4OCBTYWx0ZWRfX2ubQNb939mO9
 knWd4o8lPAPg0cmKX0apNy5KCDBbDG5RD3CPWCl7UP+olv3Ki/GzdjUY93Sd/cK7Q64ZuWOQBR6
 +KNvHozINXeSrat4kgBgBISS/SAlMxYWrs7Y2VerSyDnmxK24fMjjLCmhXC5tp+HGnwtIMCewBW
 ArlKBamQifq7KenZDk2gQDH5Jt7Dy8O+iMpjHa8mRkDa9udG47whwFXbs5I0wiMESCz/wlDFD2V
 TiP4aX/0ux6J66LsriM+QJwU9TEXhgcmHMGQsAxx8FsEQ4XQ/uV/tWABgrKY9tsFhAcYPlxJMnq
 bbwKT9qxA63HdENMPIqklQwGlrIN09UldgSKtH6MxRD2jv433POMenWIb6FhJHotLz7eE5PHbND
 KzJ1ude4uqkDl0K1eOv03e5PSApvl9/x71F8qabDYApcTOzZDDlbXM86unPfaU+8OL9P/db5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080088

On Fri, May 30, 2025 at 05:54:23PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Currently the driver missed to clean the i2c adapter when vdac init failed.
> It may cause resource leak.
> 
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

No, the tag is incorrect. Offending code was added in a different commit.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 +
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 5 +++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 9 +++++++--
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 274feabe7df0..ca8502e2760c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -69,6 +69,7 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
>  int hibmc_vdac_init(struct hibmc_drm_private *priv);
>  
>  int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
> +void hibmc_ddc_del(struct hibmc_vdac *vdac);
>  
>  int hibmc_dp_init(struct hibmc_drm_private *priv);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> index 99b3b77b5445..44860011855e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> @@ -95,3 +95,8 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *vdac)
>  
>  	return i2c_bit_add_bus(&vdac->adapter);
>  }
> +
> +void hibmc_ddc_del(struct hibmc_vdac *vdac)
> +{
> +	i2c_del_adapter(&vdac->adapter);
> +}

Then hibmc_connector_destroy() also needs to use this helper.

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index e8a527ede854..36401b46034c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -110,7 +110,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
>  	if (ret) {
>  		drm_err(dev, "failed to init encoder: %d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
> @@ -121,7 +121,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  					  &vdac->adapter);
>  	if (ret) {
>  		drm_err(dev, "failed to init connector: %d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
> @@ -131,4 +131,9 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
> +
> +err:
> +	hibmc_ddc_del(vdac);
> +
> +	return ret;
>  }
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
