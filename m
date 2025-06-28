Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CE155CB3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130544; cv=none; b=jYEcIzv9LjfuwYkytRYeIZQous/hCJjwQgYk+Yrs0Q1qSrNcEyCNS+IlkjdMPL4T8O67Dn4vDdxjaM1xx7LGD4wGSt4LgL05iCYZHWkpdsMLbgcxaY2MgpS7iT71AFod1e22dwO4A1HX/ORjfpq881RxEpbyCdwJ3WguIzCt6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130544; c=relaxed/simple;
	bh=AUECy7DcguSZS3hyJIyo1WMowW/q/vB8KApb0sOc0nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e57uuI5TUp5L/IuNxQ/SStaA7f/mshySSZnWUscPp4O/+a4lNzBWGFw9hxHAEYTpm6ChC64kzeedCPfO0OEIZBI+1wIvxDwUaGOgJ7V0xZP/P3r1VRhI1OAb60XYX//+OcQSxpFbZStAHGknhlPs+4f4SYx1gPSlYopzmzAW34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9tfWfl9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9tfWfl9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S5hUhX032289
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gdjl5vNLCCbwSx5ZLm6cDeOg
	F/cKFeAqNrRnmk0EQTM=; b=o9tfWfl9tiMmry4+V3cOA7ckXvKfAkvG3qMWfWM4
	ssRkqeqv6lEqu0D7ZLk7MMNIACQiY9iifmaz2ZCOkUHrZBsj1b+IYnfi00/4xZ8t
	cCVjSH+k3tJ9i0noUDlM8iLJyyg7abNnBh6Bxc+L1DvhGpr2ci7Y+ugE0bzNpfPI
	X59W3Zrq3ENAbp4bYhLyqeBZPZ7ZZNSg8O5KUxfEC5v2f8ZVgGN3F0ShRs3YQeOE
	tXApBlMrohniMr1m/flVhMucjtXAkcC5TrarSJOy3qVSWR97whKEKnNWlDMK64/Y
	4UeA6ouSwyfujSkrSwD1cY57HY2V15zVjHAJ1duEtG89VA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k141b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3d3f64739so222956485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130540; x=1751735340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdjl5vNLCCbwSx5ZLm6cDeOgF/cKFeAqNrRnmk0EQTM=;
        b=bfNNF1yZ5U0RXq6gqJZYGU9fhd3NAFQdleIIVKoDM4dsrtj7K/D12YZgo0HhbXxfoD
         9dQYcBWVc1KzpZlDl9zm0EHeILbEySZ+8MgYVHHdZ71oIqTzbkrHLMWu+UhZxVKWSH0x
         F/pgL8z+t2gnINkfTNAO+IErSgFuCpGZLAxRCU1C5lwyzLkChfqD4p9pyOJHsftNl0wV
         0OYX/JousgsGXphi8fG2r/ucFa5XYBywV22hXF/Di3XDymmH2E1Yyqtu/VMT5cXka1Jv
         rdLr8/jwgIcYb5sVJiMWm4lOORpmATBd7YjTS2O8ej8NolcLQ+bamhc/2iErhNkRsFZG
         lM4g==
X-Forwarded-Encrypted: i=1; AJvYcCV7E7d11l2NJomstMCZVrgYTKj44klCMWxHoC4kwZdMGGYQ4Ig6BT+yxepaudu88mgEnT9ZEtUvypfDp5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiewDndwzI6pkbuPBEKp9Jp7lsmpYQzNGX3+CguF9sfnPbJWSo
	czeOgOWVYZG5f7jFNwazAHSdKgoEoPDfRZlrPY28kOIMtpa69aou17RssnaXIaCed+O3j0kY31g
	TcVdeoHhTBM2vvsTw/rq/QniwfgK5LXFZaf7i2hUvxKku8FbgDNnBZt66ENv8Ut1vzzk=
X-Gm-Gg: ASbGncsFZEDW7oCwauCgLt5wSEYHrrEIa6C1k8Ui2X60D8VQH+AHmiv8KwZoqsCCFLX
	JklUgJrBcaisxjMn4pvzHDsvFMm/S9FilzMSYUYvbABSAAHZw26fhGClY19cIhn9KcwhWWN28vE
	/05KYfG7KR2jNqelPgKn9EECZEdfNC8rnadELpPciqPuJD2iQt37uuRmGb/30nInrNGSi60CmLF
	bCpDGKVomWN9lEWWwidxn26rAQPEkjOp5kY7cwuC7lQ2uYdqOCqnYUirxG/74mRjdyZMDYiOP8i
	qbSZ9JmkJIKQMVHwOUyDjdC8j2JMdqKfmKIDM63ZxpnWiGnIOoSvou2g1mfUnasqfo0fzwTouhH
	zlg9te++9KPnYg/EG5LGDE7j1uTAwKN6j4Kw=
X-Received: by 2002:a05:620a:7002:b0:7d3:914b:abe8 with SMTP id af79cd13be357-7d44396981dmr1335221485a.36.1751130540432;
        Sat, 28 Jun 2025 10:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnD8yJ9nkkhciALYWFjgVZUgGFiR0ax/RX5IipaCBe3GQoqrbfWs1U67wZmEYzLBUk2EFPDw==
X-Received: by 2002:a05:620a:7002:b0:7d3:914b:abe8 with SMTP id af79cd13be357-7d44396981dmr1335215985a.36.1751130539978;
        Sat, 28 Jun 2025 10:08:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d7a54sm868102e87.201.2025.06.28.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:08:59 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:08:57 +0300
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
Subject: Re: [PATCH v2 drm-dp 09/10] drm/hisilicon/hibmc: fix no showing
 problem with loading hibmc manually
Message-ID: <xulg22zaxstsp6jyalonxapqpj3wj4raacnvsv5jpuaebxn4kk@ukmuxgw7ubpe>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-10-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-10-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686021ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=rqlEdgz-OenaAeYW8xcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfXx8BdHzODD1ko
 E9R4Mw3OG4OpejJTWanNz7QO2iEpz57Quo/dSPhY0aUPq0UAyz56ZDqgmAFXkGNX/aloyV3MKO4
 mQSZBy6w/AVY+Ok23f9c7vKkiDMrOdLM+NfHJ8085UPix21VBjrac/eQwO9JE58fQGzYgNpm7rv
 Ig+wn3mI4sI49EJG/HeOgxm4mak3vIkBl82+WWX5zr4oVaCZZzcNbJyKGDa34oeXpvd91ftH6D4
 IvHjY1wE2UiY4ZAdkUXA4BWS3c+/EQMuqEuOpjE2y7HDKNMirNvGn2lAOuB8iwNC5Ohb/+Zkadf
 Mv3c7yR3b7FtMyfa5tEFVafwDaZkUdWVPzSTe69T0zlL964ieaqDEbi84Pvnjrr4+luULImRprD
 MQjsxJMH5gAuE66Zh263dE7I1EUHsB9RsRRRlaHzVH3/7Ifuc3zFMeXAxatGlhbla48bgf5w
X-Proofpoint-ORIG-GUID: YHReqNgvcrRBR_-IZ7f6MjZ4ZSnejL3S
X-Proofpoint-GUID: YHReqNgvcrRBR_-IZ7f6MjZ4ZSnejL3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280143

On Fri, Jun 20, 2025 at 05:31:03PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When using command rmmod and insmod, there is no showing in second time
> insmoding. Because DP controller won't send HPD signals, if connection
> doesn't change or controller isn't reset. So add reset before unreset
> in hibmc_dp_hw_init().
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

So, which one had the issue?

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - fix the tag, suggested by Dmitry Baryshkov.
>   - separate the patch, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 5b1f943b601c..edb7539d830e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -178,6 +178,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>  	/* rst */
> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
