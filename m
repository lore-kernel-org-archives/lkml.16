Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AFA155CB3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130586; cv=none; b=pESJ4j5Rj/ycsMt6VNqk8jh/jBwp4++pqEISmqq3vxrrHco4aOboCpVqpgozJyxIfJYIQnCJ7IKyrarhMS1L+wHa0T1nEv5xvG/lWl1uy9XekFZci11ZG4BpNTfbdQpw6GqvL6FI63ydQesu7T4bWundDgb2/jVekpI7UC/+5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130586; c=relaxed/simple;
	bh=e4ZHTGgKY9jfJmBoclKRaoO7RAnQ8xyz+o1R9k6+Ilk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qouRfgXfqZAbsyJY34t+on2+/3UHDhsFSZydWw3N3eaz5iQ/m1a2PtOt1TAz/r1DKTn5tpl2oA99Wlalb1nPsuTyl7Zjtyu7MUszfYmxqo0Pxlvl1KTwFI/TjBdN6KpFDp5Hl1OJPyLRbIBx24R4hECy2uJkLUjyIT5+p9mlrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6bHiIgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6bHiIgq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SDV99B006383
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6US+EJaR8yR+YkzfpeYsyra0
	rE84+WUQ0+NCcDsAi9Q=; b=O6bHiIgq2fwr3Elfs+3TwT90SWjnN59HwVAPbFBA
	8z7Nvp58lYcuU+Qb0aenfz/ZGcEhdALZoGif3UbEfG2CNTob8jmLEAEy7tRQa5vn
	lC0DScXfGYuogj9rufVIGjCg90djUN9/l46tynNTvVtKpZyrTECSuDcS0wsowtbk
	FsftsNySl+LGATaYDzLxbKCt6Dy+K6O1gw4qrKD56yFEvABZD9RgfaoQShRW4w08
	xjnKptla2+za7wlX5bZP+YOKstTll/tz0LdHLOnowzKMs3KW7SsOvPPjUv9EnAOC
	nQNnn7SRdljlJ6wnxr/CvGS2rSYVlrfAPVBqF6hVjpAQVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvh0m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:09:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44d773e23so223887485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130583; x=1751735383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6US+EJaR8yR+YkzfpeYsyra0rE84+WUQ0+NCcDsAi9Q=;
        b=B2ka1z/RaYPiqxdAiy+06y9H+cP6xtsfiT5tDmqvp6z+zhl5mFWZLbiGpGN8Y2F8k2
         ifqkBw4cva1NUi5WS2JDvk7Cl7ks+d4xuy5fBMgXqSQ1sbMu9nPDFQsktNHU5lzzP9oJ
         uDTnvdEnVgbs1oNBbUILdA0h8P7qDDrwodqocoFBvM7JNBULobAGgHVRVUL9vWRjR6OW
         CsKvCDEsCtuVh/VpqRvY6eV1HyZHdYPCrqpjdwSdUXa/gbrP1W+c5ub4Q0lJlwI0x/tN
         /cNOZ++KF36R6gXEaBZhH87snJ0yE5gzbwNRMQUDCmdb4XiFGbVHgjoN/81ft7CATyqQ
         VOHw==
X-Forwarded-Encrypted: i=1; AJvYcCXZivmP+UKav2r6bY8gviGe7Tyo33gnPRlfcwkhlEjUr/ZRotKpZz+1vsb71BmpMlYcS5k/mQRn0T7Xkkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJoSxJ3UfkU/UnYMKMdShsPaBTqF7CZ3oi1wDOrvpuLxuS1C0
	8/+Ef8u8UATd5ovqGXZnqzhqoLLAleWEGRztb+ngzy7oVRY5nea/0Kqy/EjfRTtd/Sdefq/yvgW
	F3uBv1LAbWV7fkkq3gmwz4j2dIpuGRJ590+lruigpmxy6wVkMmUI1ZbNHb0fA3omas/U=
X-Gm-Gg: ASbGnct4ph0PEY3fpRissvnK0C5XPxxYwavG4LJuG2OZkhcPFWwTVATEu8fG2Dg8uBW
	lQ431AYD8Us7W6u476dXU7fnDRxnXInmsaiWWIUFKD1naug6AzvaF4M8MoRJesDJGgj4h5hd7Uf
	zrEBZuak4Bu4rhf7MLHpP0nC4Eykhvq5MCRipb4QYOuHafMec6lUb09kw3YcAQNJnRSOTl7vBuR
	HckcWWdsIS/bNJf9BV6ps2Tr7GyUR0AsasajHxpiGoBgONnLZ88Gpfr8dYAhwMU8VwKoirPM2YC
	ihwhWsHqNSNBzlkoM6qNjjpiUwOGJk/VnVXKCp960GPlVAhDP6d+5pQNLqReDQLRvOIFrrsDq3i
	tNjklAnfFMV0SwJ058CmsHEZYG2nUUZuS97M=
X-Received: by 2002:a05:620a:44d0:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d4439695a5mr965188585a.34.1751130582843;
        Sat, 28 Jun 2025 10:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5kViBSwBV8r4Xa07AexwZGpZhjpX9kjjGS7O3ofngQegaDVum9jJcfIqiTO/qeUpNMAsb3g==
X-Received: by 2002:a05:620a:44d0:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d4439695a5mr965186085a.34.1751130582432;
        Sat, 28 Jun 2025 10:09:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f1c04sm849381e87.249.2025.06.28.10.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:09:41 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:09:39 +0300
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
Subject: Re: [PATCH v2 drm-dp 10/10] drm/hisilicon/hibmc: adapting
 modification for the former commit
Message-ID: <x2a43gcouchtsuvo4kzh2p4ywmm46pyfsqtt5vczabokcklkcr@rh4ceyhhfeis>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-11-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-11-shiyongbang@huawei.com>
X-Proofpoint-GUID: 8b8TpP3ibRztGklGMwOg7lP4HSxLeOIQ
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686021d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=ETqUBGNnfF6ie6NgWnwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8b8TpP3ibRztGklGMwOg7lP4HSxLeOIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfX4Fb5SHzCzbuC
 tOmaIFDoH5fA8mvduH8jXv4QoeT+rRh8f9lBszKqQnb9qjsP4gZazerkASJXq/7vsgjrXp96SGA
 Lqtyl9TPUhMsTg0QmQfwRqK5G552n5l4a1iSPUKVp38QEViXC6WY8cBRbxhuwmEUEdvUBNwAn9L
 oXuY9KtOdr3msmPMWpDHzQVcKL+hrcPxjL0dy0Q7iJ5Gkx65uwR0UH4bT2ZNRRg5/jbkEBP5UCl
 XaqVRusAHkll416nTXNornJKGvvtFPqEV4MSg/1Jk5awMva5yltXS3eWe9He9/yGprBqsFT3dMB
 aVoFC/jWXgcpS20bBCMmejKVRZKRDnQ+M1Azk7ZKBw07UwawSZBg5nQsWA+Xpn9brd7+IwqVZ44
 cqs54XId2H2b0aQMCuwkOT86FJKfGNYM27TaGvXDKBqpT2CbEN6zfIvbgT8EGCOeZZvc5vov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280143

On Fri, Jun 20, 2025 at 05:31:04PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add colorbar disable operation and move hdcp opreation behind the reset
> controller operation.

Two items => two commits
You missed the 'why' part of the commit message.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

Which one is wrong?

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - separate the patch, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index edb7539d830e..bb19636caf77 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -172,15 +172,17 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> -	/* hdcp data */
> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
> +	/* clr colorbar */
> +	writel(0, dp_dev->base + HIBMC_DP_COLOR_BAR_CTRL);
>  	/* rst */
>  	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	/* hdcp data */
> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
