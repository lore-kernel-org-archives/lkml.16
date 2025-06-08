Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCEF20AF87
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387253; cv=none; b=sq475azkLpNFs+5RfqiCwlBQMLt1c9xljeKjxAegh5AEACEI/OI727rGRN1ylWnCTdLLVMK+xCehq55DkDiJxjkETptSx/nsmTgc9Je6DjIVW/b6c8pLjDbpEIUwz+LixRckNIKk83c7Hnv8ixgVeISkbeN+lWhnABEus6MWkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387253; c=relaxed/simple;
	bh=XJ0Qjtm15h2QRxa8IF9EIGz0mkftaKIDBGrYF3w5GlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCYK5pCXnqExyv1nKdIoZo7fr48xSNO8znjnN/sBkfswTTsURPbSrQGM03cdSEkXvYeNpvEqHo3GhWlFwILX//DlW/zNPVeu9jJoJc4YgdZvil8CrqroKMxXLGKzn091aU4lCa39QJo7bH4CUDh+rIvI8iL0YRZr3IJKCmK48oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+JJ+Zso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+JJ+Zso"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Bmn6Z013265
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 12:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uk66EcMqOcniRlqMz93nVMxX
	OXKxc66pHl1w0CSMStI=; b=R+JJ+ZsosTZ2afGWcO3uUfrAxLNybX0NwR5X3MaS
	jV08N2aN7kHCKQ31ym94XM+Sf7D+i7/HV5OeyH4daI8A0RPk/kwK4xkIjLA6fBJj
	kxCdHp8HWtod8UcqbCJXCNV6ZiGVMvG2zR431Sm+mmizgm0sDihohxo6tvqpmPbd
	OpZk+LvMW+/xLIIQ5DkVpd9csFcSvYtkGeiE8WogoCMW/f61wYu0OREyPz+9AwCg
	0++21a9u2Jc3fp9fKsmXixMsrm+IFwtOTXbB0cHr8lJD55gFLgn2Oey1AQsBC2br
	3m/bfbNhDjHNDTDdKoUP/WpRFGnLz0hMleWeUsQQP+XGgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j2up9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:54:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so1107292485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 05:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749387249; x=1749992049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk66EcMqOcniRlqMz93nVMxXOXKxc66pHl1w0CSMStI=;
        b=Oq40geEBOLantdCIiR5F75tGzOEQONleK6xtKI0gNdwh164sX0ukp8gx/N47UYtu1H
         MKbd0fd654ZnyqQsFv8vVipQ769pK/C37j24fYR93F9qSGZ09aGomhaliXFzLuFzvx5F
         +75N3AfTB0dhfbg6Mtp6A8r2B1ueUoiQItdjQgROrEfyWMK/+MhqUMgKAjRsEKUxqj7u
         osfASJvfPe5A2je1kR8fAsc4COS771HwCNJ0/GgLupu8nv93q1RlZtAZulxIaVupjWzz
         YOu+Agbyk3RDvgqt+EWkEvFVydQB/dewIZ4t/B8xi6SR0hNlfiAtWAHgcRbAUl/5B7Zo
         9oHg==
X-Forwarded-Encrypted: i=1; AJvYcCXEnmJik1YRoM0c8tbFGw/06HHxK3aCeAMgdVm6eTi6H2KHCcM1LKC6zneGMfePJbTSU9qyxfm85TWg02E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsMXNLXF958SKB/IHM2BWDfPj1IDjMrucoxovC//zFxQwJ75j
	S1xXutjcPl4mOOyTD8vnynZ1J7ryIu9GzQ1BwpqyJRYSYK31uZ6PLsRlDzWje3hf1PVZL3wTEBh
	2HwLTra79tfHizg5sqCtAYSgC5/QRsb65wF+5jLR6RutfqMqvWX0jEEVIVAJm2N8Ia4I=
X-Gm-Gg: ASbGnctZVU/ePxl7+gsblMf1B76TwnFwg8LFtb8zrwPQFGCXrb2J2Lhb4BnSVCBZN6h
	M8VKuTU3LaYTWW/pOpIAepxjl/nf640LQdxArXgF4g0e32YLDSLI9aeSxE4cB3PNTz1cm+/smar
	L1FT4d8SVyFtnITkvxmgnxJ8F8bCE4phLXUAqYRQZpECR9e7DNYwlB1bpLjTFLzCekWad/NuXp6
	GPboeThvo14mQhtKdxTf3sXjljpCtqbh2SbFNjPYNKklDIPbd//NcrjQTAsQ5jH0jfcf41dd/R+
	6XKS/epGxL6EWXtWeljIc9DLhKCnBcBWTcVfxgABiMZmy4vwls8G5qt3OKLuXX/2oKBBSDVJPxj
	svnUDcAojPg==
X-Received: by 2002:a05:620a:3946:b0:7d3:8ec6:e059 with SMTP id af79cd13be357-7d38ec6e14emr416233985a.3.1749387249711;
        Sun, 08 Jun 2025 05:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyBsU/HMmzxV6s0ub4aI5Io68R14o1IAEtcKgz+pJpWDjuh+2APzvgWqbFMOTBt12Q08VIA==
X-Received: by 2002:a05:620a:3946:b0:7d3:8ec6:e059 with SMTP id af79cd13be357-7d38ec6e14emr416230685a.3.1749387249384;
        Sun, 08 Jun 2025 05:54:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d049asm753487e87.12.2025.06.08.05.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:54:07 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:54:05 +0300
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
Subject: Re: [PATCH drm-dp 10/10] drm/hisilicon/hibmc: fix no showing problem
 with loading hibmc manually
Message-ID: <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-11-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-11-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfX6pGK8PnXWT8Q
 R5lFSR9/F8ccg8hSre2fznMCIknsh3lfdCodzk6+Bpz9j1OOuzs4YlC3zhTFLQHa0pICiIX2g96
 gK/AnBNfKCf9QMBhs2XTp8nuj8OqOzGFDWBP5lmkx3uAIQ6SGvHRkkqRqvX4smMyLo6UTzqZSrW
 GT2QsukjZPYMgdqB2cUdQtZrlbXQMTtWBNXOU9sKU81Euv/3y4/vb2Fzl2IUuICY+lfi1BjzePR
 aafa3q2OlqImG45gK2LSPdimdeXe9N1VRMh3fI4k5tmkVMFCiV0BQ9xeY10wdN2od3NCRCQEuFo
 G7G9PGLre4HyCe3x9MZ0+rITjzfsHkqY/Sh70tjhNweAuqxudoT/hNy1fIPyjx2k3L26wFFz53x
 CCuWTn48XpAQT66K1ui7lEHAMrRWs9aTRmwTWu/ANab205qU7OJ5/XVXLmvPCoLLvtIsd0FI
X-Proofpoint-GUID: TwJ6auDRDwUjEAm39ex-909PbQBnxS9A
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=684587f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=ETqUBGNnfF6ie6NgWnwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TwJ6auDRDwUjEAm39ex-909PbQBnxS9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080102

On Fri, May 30, 2025 at 05:54:32PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When using command rmmod and insmod, there is no showing in second time
> insmoding. Because DP controller won't send HPD signals, if connection
> doesn't change or controller isn't reset. So add reset before unreset
> in hibmc_dp_hw_init().
> 
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

Technically... yes and no. The function was written this way in that
commit, however HPD signals were not handled until the latter commit.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 4f93d60b932b..e1b9589ce639 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -172,13 +172,15 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> -	/* hdcp data */
> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>  	/* rst */
> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	/* hdcp data */
> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);

There are two independent changes here. Split them into two commits.

>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
