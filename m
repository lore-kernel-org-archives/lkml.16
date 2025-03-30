Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7D14B08A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743356960; cv=none; b=O+ezB9tD6S6m7K6Vwcilr867AWuG9mYf5iREkcHuxK+VZgt+XOhKyt6ZS6KNC6O3E7G4IzBjxc9kxtgwJBHAjHypTIBBPKuiVFyfxYLhCDsPtKTCIpeq4FS9Bd1wh0eRlFjRuSOXRg60DdTFcHq+O7FL0TwXjwmAtLwYWG9qb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743356960; c=relaxed/simple;
	bh=nFXQPyiGKmgREmQXiXXzw7wP6+BrTH4Tl8Jg9L6mMpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUpdEyOFjrVPAumK226B066N9Fy/SRB3O48EFnI2D+FQFk7ysmtGpMJDCIzBMTi2lWppOcqxid7CYrVVUYOEzrk0lewUiBKhAS2Vkk29yfuPKPU4HJ/Urem+pneE1ruQFk1tW6ulrsCqU67gVYquiMMkl/AfNGzPxwQ0448gN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXY44235; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXY44235"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UE0hbm007114
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a6c8O64kMkPK5grfJVnb+sUd
	ExGl9BPB8K69PHPnsYA=; b=YXY44235edBcqRe+WQ0DQa+T+m88HKtWSRTv5M/A
	HhfnHyC/umGU0dp3lQygH9dXd16ttULMCLMTAH05jZlV+FeX5jyTXK7MaNJw8hIe
	GMiTTjy6gaoGqs4A5fowbAQwZEIoQfcq7W/4Ou7MHB3owkgCZ7Z7VmTRYnq8bS34
	3fv7+9cIro44yYd3O9UX0MzDbvtwOGpPGfNXm6VzRrOZ8HqUJMjZ4ESR1Lcg/UJP
	JKRK/E54WT/2u8p17EaCR4VV/5d6RYyEkcHC9YrYXneSg0w/H+xzREUaGZhrhuXu
	AMin4kRQB6GR1Dlhabk8XqNR94Xx9nSmnwpd7VvaJqKGCA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvanc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:49:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91d8a7183so71787806d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743356956; x=1743961756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6c8O64kMkPK5grfJVnb+sUdExGl9BPB8K69PHPnsYA=;
        b=dpnEG6Dq+eCKRCrAvSe5/jaqX/Fknfj/fRxhMHzrvCbZWlK/e/Ay2N0dlrdmHa019e
         nQTPwNST1X1ERi7l7xbFUsziEhQKfYq6AU1qsI/HrekaQw0pi2743kQaPdXnpwM0cuDv
         ML3EFUi2ytryKKJ3Gw4xWZVzyXt4EndoKKYUUDY4T0Ijx6zEIh3PJXY/iG2i8krUeBAo
         Gh+exwkD0FEyiqgMLOD/hZ6Cz/NVYkL8bv0m06U+SFlSKkh0ukDmhM2fl/3Si/oToqO7
         ZEL5Qqs17S0uDPTG9V+osqBMT2Iq0ANbtsSXw9YnQnYk+N8S9l/M1XjyxSmQMGFz6/YJ
         jEIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJamswKDECkP6DP+PKAIryfqxFSYm4tTTio+nGMLsZCxL6cs3z3BbCG459FtFbcKxVLB7ZsnpHXF0BPrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UtRWYoelUmxk4uSBjqVr9RG2QnrL9VJJBe6yORmUow3wtiNz
	txKPC14TwjK6NhjggIp0W6C6lyhUgieg6wVwsOOAK3+1UIrAXRiAj1Mbrbr33yJjyPzY/3MDVjb
	3Nm4NZk0DS8BPkuETNkph8yZaUv9BFvYo910IAp374U2l7C/zXA8UjDGKYZHHO9o=
X-Gm-Gg: ASbGncsPXAg+tjk6UVNSbv4YVSpvp7HckHK2ONQtjUlLQh8KXx/+3A1t4cSrymRtxzM
	e00PvKC7h7kZFKoaVk0m2jY3H9CGuge6bME4Qe61hqX4m5xnWs1/iVCx9zT4sQbG7F1Bc2KjYO6
	ByDjO3a4ela92fHH4LO0tAxUS9J8gIxbo8SX+JjQI3Av27vFfNAbNO+9FKq3vdh8uF1SnFp6jUC
	/KjrixQ8k2FLrPVnW5sN8cPcSeGaGHnSYkAWxs4RP3iIaIrk2iWxIoNxswZZoFViMIagRya9B/G
	ZesILEL8p0vI8Q/Dh+VPhYmdn/zlZuZxn4ZaDKqvz1kgYcK9zWtWRxOekndGq0EFso5EzHbqsif
	amEo=
X-Received: by 2002:ad4:5c41:0:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6eed663fc22mr145390756d6.7.1743356956572;
        Sun, 30 Mar 2025 10:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlFUimnqvaMI/KBKLcwVGgh9bJ2ue2vODFiTU6iF6C9DgBHuqfEpaKoh3wsMU2In1hVIkPw==
X-Received: by 2002:ad4:5c41:0:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6eed663fc22mr145390096d6.7.1743356955961;
        Sun, 30 Mar 2025 10:49:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59686sm11889761fa.97.2025.03.30.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:49:13 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:49:11 +0300
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
Subject: Re: [PATCH v8 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
Message-ID: <7giy3wpm4xyth6ol7wvfg5r446lmmdftw656vwdhbyzs6xrewh@25etguysdhqh>
References: <20250320101455.2538835-1-shiyongbang@huawei.com>
 <20250320101455.2538835-6-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320101455.2538835-6-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67e9841d cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=i0EeH86SAAAA:8 a=KKAkSRfTAAAA:8 a=zjCg_pdqLbO7AXn0O-4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mBMRF3WoGWyuDMgloYx9ZozDXYjkYPPb
X-Proofpoint-GUID: mBMRF3WoGWyuDMgloYx9ZozDXYjkYPPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300124

On Thu, Mar 20, 2025 at 06:14:51PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add registering drm_aux and use it to get connector edid with drm
> functions. Add ddc channel in connector initialization to put drm_aux
> in drm_connector.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> ChangeLog:
> v7 -> v8:
>   - use drm_edid_read() in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
> v6 -> v7:
>   - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
> v5 -> v6:
>   - move the detect_ctx() to the patch 7/9.
> v2 -> v3:
>   - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  3 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 31 ++++++++++++++++---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
>  3 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> index ded9e7ce887a..e0bb9b14d9d8 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> @@ -161,7 +161,8 @@ void hibmc_dp_aux_init(struct hibmc_dp *dp)
>  				 HIBMC_DP_MIN_PULSE_NUM);
>  
>  	dp->aux.transfer = hibmc_dp_aux_xfer;
> -	dp->aux.is_remote = 0;
> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");

As being discussed in the feedback for v7, this is a memory leak. Can
you simply assign the string here?

> +	dp->aux.drm_dev = dp->drm_dev;
>  	drm_dp_aux_init(&dp->aux);
>  	dp->dp_dev->aux = &dp->aux;
>  }

-- 
With best wishes
Dmitry
