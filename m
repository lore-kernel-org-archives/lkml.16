Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F541C69
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749386850; cv=none; b=UH8rbyiqUmUa0F0V1iX3S4YDqNi9vCUkUHy3wTRdTLnSXAHbr0RmUva0h6TV0gUzhZBj8G1gIDa86sZrJXkGu3nWJTnUP2FMTUFqHgzsLh7fi3MNHePSFHJPHRwindgCwrPqgfnfYtRNt0vw2AsDjCALNhQUccA9eQmaW5C8y0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749386850; c=relaxed/simple;
	bh=vr2tt3fvwnueNVkoxOJt7mJE0AhnT6E5hRpn26bovMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QavTGX9mLl3Fj4JMFmY1IqdmQoiJ8dzOr6XZQ5MXD+KNWS5T7w6IGIfB27tJP72hy6RlX8YC6iiFDVG9p2rw5s2kcPySnstzH3jXcKey7BQAEO1famQQQp+wgXSuJ1ya+z1h7Zy96cAnNjO46cUmA9UhYLd4u2GKKqaWhGAeSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx8hJnb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx8hJnb6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589RbI6007424
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 12:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtzvagP+ojVDO/HcnHcU2k2JnIiS/sqFpa0Po2l+OrI=; b=dx8hJnb67AaSVgNf
	ZNt6nfP82tP2sivY5qX0m4NL5zHC5zC8/esLnD4S1EHW/TdB2ztkOgZsXeOE14D5
	3/5/Papry/A69vfjE96VC1uRqqhqRn4DOibdHxQ96/MSur9QvEWGkBFTqbtV4E0h
	nmgCNE/NzKDDbawvw3sCsUQ1tBLaO7HwCue9AuEwN2h1JmHRVaIUAlf2PeXA7yaY
	+xdpTR1wxtzAnDtJHoI6vRM6KmpgHFs+Ktm1r63eZs/5BhgH/lQUQuZQI101bp7t
	6tE2lQczs9qyhTx7G2mlDE15vbIRG1mYyqcSiWbA7bJi6NEp8XsH+hkGoj+wxsH/
	/m+2NA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9jxy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:47:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2b0a75decso91071886d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 05:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749386847; x=1749991647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtzvagP+ojVDO/HcnHcU2k2JnIiS/sqFpa0Po2l+OrI=;
        b=QaxNLKB+MAepafRArhWXK87vkftb3uJ8itsEqu5rtUcwoYRin4W79M7c/bcVL6GgV/
         9++uX8YX5Z1IyeReSvajN1aqo6aF7LfmhBYDW/1UsSDBXyERxfs6qqFNEgOX4jbqJjPY
         u6RabXjtPdT+dZRMHyDpihzXwGXo20BpOwHO6TuyCalLTR13OHmtwOMW1g+zqXwKLWNv
         4Uneaf3ah+n25fMJd5ze5PBmmiLyHlPiA6mlqp9VyMusCHE84uTkBasCbCeRSJjO/JLf
         HujMRUoExb8C1rA99HJreZE6QNClW9D1RhyDz3/D88ysNqKkh2nmD+WGaKgaISpgAXE1
         QvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhL2G+1MIJzTjpicEW6UilrhruguXBII/I/npytfPHqhOozidcDMuyoh7oX3MM7ug/M6l/y1iwlkUGGwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NQeyd3lXheRnHdUeVXJsFyh1NwTRNYqGUlgAe1ON4hGfPd32
	gsapcmsj50XF/wKo7Zr31Q+1rL/Aq7nGereBjfWWiEp7cQvUcIDEajHPajqUmBxLThThgrKIUMY
	qSTmfcErWHB+omug5KOFn600ICpz8m5e7gdMCgeV8egmjWB9YYTd8yv7W8ybRazcDdDU=
X-Gm-Gg: ASbGncvx+Rz1/XTSHUG2ywzlFJIvnZxQlzSFjwXvlxhM58B+gZpviParbxrzaEWHp1v
	OohfvcehJaZo1zWUQLxFjDCgBg45f/l4K0aP4Qhr8wN3Z+ADRV1Zp4Bvz8G2/qqtUCqH5iG8iCf
	H44pvvdP6lc0PDXdv3qSyjpQAR2ZdxPLor8ufZ8g8/V6boXZN04LnhDvEyCgIo70LvT9/8CMkwF
	sOGAvnodlrAgydkMkqYuxVMuv9tIwEOTmu55gDahNWH+YwFywiIoyrgaT0M+4exZIbLv4e65cRK
	8rLFmuETkCsQOYscTHTl2Hf7BEFxemOovwXIKMyr8whOzXx5hiK8GbFkCM6WLmermfYXJnpqpPK
	CMbHt4cP40w==
X-Received: by 2002:a05:6214:29ef:b0:6fa:fea5:4d7c with SMTP id 6a1803df08f44-6fb09057dbcmr130135366d6.40.1749386846894;
        Sun, 08 Jun 2025 05:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEki7LMROzmgW218EZLkb0KCWkTUAXONFilomWwrdXcxbx64sPstNyw31il0lfR0U8RVhedSw==
X-Received: by 2002:a05:6214:29ef:b0:6fa:fea5:4d7c with SMTP id 6a1803df08f44-6fb09057dbcmr130135006d6.40.1749386846493;
        Sun, 08 Jun 2025 05:47:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cab69esm7248801fa.52.2025.06.08.05.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:47:25 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:47:23 +0300
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
Subject: Re: [PATCH drm-dp 09/10] drm/hisilicon/hibmc: fix HPD no showing
 with VGA para of GRUB
Message-ID: <5nansqkys4d3wlsefql6itgnpdoxhgjo7kkmovpm3gfbphxcs6@4anxx7hzoimh>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-10-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530095432.1206966-10-shiyongbang@huawei.com>
X-Proofpoint-GUID: yq1BT_hECB_BNZjyix_RefshgHuLXisq
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6845865f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=fAYD1edJq5gPyj3QMjgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: yq1BT_hECB_BNZjyix_RefshgHuLXisq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMCBTYWx0ZWRfXw9zH/Fk7V8oF
 jo8PKSgOMU97KJ2TL5HkxfCO6mFq3Zt0Gx/4u6c1r8BWVp1vZmC2zVDiuV5KwHQuHcp6fwKQ0oj
 X4hfIwPgbvC6nCxUJadsSXQYAAbXcxENX0mdbofdAFeIXWAP4equ8sxHZy7aXe3BN2WETENzZIN
 OumGHWRQeoPHAWOEQpO2hla5jIA8snVC/DeuWR0fBAY5DFV9rWLSMEwpUbUZH03IwrSszuW5+OG
 u2ZWKwAnpLVLkCaohWcSCPXi1an6UE0HbPAHmRW9MbWtBS2DqaVL8ZzqTVO3MbJbus7MiEqU945
 JjK0JYsw44No/9xCXbmrTd2p4rMhBC36XnuUKhMz49qhSCuDgo3lXLyAdA3/hL5Sv4ii4yaaaW6
 H7rVSKLiUl+rdTrvN2DAm3ebDd/GQKKuuk5Dh/LTeUiJUUaIIzJJ/E/UWuO96deNOgul1UOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080100

On Fri, May 30, 2025 at 05:54:31PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> In early OS versions， there is a bug in hibmc-drm driver previously,

Which OS? What does that mean? Why do we need to workaround userspace
issues in the kernel?

> so some OS add a VGA parameter in GRUB(video=VGA-1:640x480-32@60me) to
> fix the bug, that will config a force VGA mode to drm driver. However, the
> HPD problem exists that mentioned in previous patch, so change VGA's status
> in force() to compatible with some older OS versions.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 73dd3d5fc26c..d609ccda2f2a 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -61,6 +61,19 @@ static int hibmc_vdac_detect(struct drm_connector *connector, struct drm_modeset
>  	return connector_status_connected;
>  }
>  
> +static void hibmc_vdac_force(struct drm_connector *connector)
> +{
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
> +	struct hibmc_dp *dp = &priv->dp;
> +
> +	if (dp->hpd_status) {
> +		connector->status = connector_status_disconnected;
> +		return;
> +	}
> +
> +	connector->status = connector_status_connected;

You are again trying to tie VGA and DP status, so NAK.

> +}
> +
>  static void hibmc_connector_destroy(struct drm_connector *connector)
>  {
>  	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
> @@ -81,6 +94,7 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.force = hibmc_vdac_force,
>  };
>  
>  static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
