Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A52260588
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130286; cv=none; b=SsAxFGp8Axua1GhwFs01+O8olfx+h7T1UbZ9ulJL1Fqqtbi8BsoSELnSxh1M+qVmZQBlXA+1qgwNOfYLSflO5hsnE4ObeSaLStS/KScxdDJeltxeIEI86tq4xShuxYKMBuwCYfpKWv4UwPbUGCHvcwX1oa4xCU3WYwJYMU1w+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130286; c=relaxed/simple;
	bh=chI40e8sHcEaL3oLKjRSsGkVSFDdLfkZLcTKwpo08YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA5My2Q1PuoeG8qSUzlQecekcdxnqXd7vyGLeOXSNhwElKaIy5D7i2vw08dTNQCA639gr5JTsdGscVgh7np9QW/KpxTajIQjNlLihbFH2LUDs0p+5P+DdJCo6aEQbitgB2mc8V63V0FbOgJsev7yjj4jQBkd4+shtsNV1/EicUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ym4P6UIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ym4P6UIk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBVCa6019635
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y+P/+AAUedmGIy1SjFHzmVH+
	8sT2rDLwSYIo3Op0q/I=; b=Ym4P6UIkpmbLHBX8iq7w/CvNvpmpXHDsdmp8luJa
	g6lXoB6EASRaSzMwDWHss129PgEnSBUSwihy5BSAjKQb3RSKnEpccXhXKvLDjThZ
	DfJmhlm98D0kiDvdvpuodma3pXKp1TAoKhHw98qzfnr/RBWKeK7KZYx3NnwLAbuo
	Nw6sdob0XRx5v/dZ6R1Lk1kbQ0kvKTMd3NIhL/vjgd6cfGaC0IasCrsmi+HSnYs8
	eCTpJwBv6ZxNIZF/IFtnZic0UVCy2bjpfexbQbKAtiZp+ygUEC6uwIlYk2y/ccQi
	2ISlpkN68TSCu3C6wrE2WtBffStLC48CQUHectfpm07j3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvh0e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:04:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38f565974so726933485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130282; x=1751735082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+P/+AAUedmGIy1SjFHzmVH+8sT2rDLwSYIo3Op0q/I=;
        b=ssfZTuV2Jn+ngDJDAvLLGGpZ8iT2w5W7D2y0+kBzkiQk8vQo2RDKsWa92jUc1k/PjJ
         MYzdSYqbturTJy+mM0aBzFirXA3DN2K5Lors8MUANU/WwqLlO/n7A3DM6L6DzNnR2BJn
         WpDXKRnYLC8Wd+vNOveLlgZK9Kpdbl15jtV3r1UV/vBlb4WUwZdjXpIbKimuu2Cuk8wK
         bkimwk+bIrkH8J1xTIxGr0c9VEIwM/j+t+kr2hOMRZQ0537pPG38/QyXebnu6TJVMPjE
         OyhqYHj8CYDW1V/FLoDn2jc4OLXGMYLzaTo15gAiEO2I8qad9/G2yt8If0PDZ+hBsGsO
         yxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2DfCjnS1PTbkETsHNqcDNnxXUnXZ0X1cjdQvB/m5l+IQ0xJoBOJAGR+tC7NIOEsgDclGRT2OOMJxOrk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyaZpWH49WnsOEuNgUuNNXpOFhWSFt+D2ooOTWLnVa1tL7V4K
	x+HKmlJ6DHmyl6svPZ4LXbTcWyRS0JETF93t6vpxMVtgdDo7yBD9MO6bJJ0d0WA4av6KMfZCIDS
	kjZ7TuArtaiqw5iNRzPrS/xNNmarL6u3aY1KOQW+cN0lGNEfXlcSb84AYGRRJRCb42Vw=
X-Gm-Gg: ASbGncuDtBenra7qrmUcQ75fqBR55Hh6FrFElRITdVrBJ5gvzYuyBHmvWfRwq66ZN2T
	uG2uZ1GlgAThxLNUvqsm+gUeDrIkd9GNhYY17vg3cSRzJA2Rz6btT1zFIBl1gl5VRhn98MGvT0i
	5Chj9fFXlG5k7onPAuexx0itOFmc3+2dU3OJDp5G1zUex4yZWiIQw0O34MdF7h8bIct2AXfEysk
	DXJwOB22AeYM3OdRv9kz/WRTXC21PlFKDsygUlvMylpswJRd6tS4LX29IaxghB84FXjP5l168Jk
	GiuUC23dRakGD7abTtEmJY/P7BA8sp39vAyC6xYs2D8JpBW54s9SLYko3q6n6NSrRyRRG3i7ojh
	TP/z2BimgVb8gJ1F/FKZ5WfAXI3Ribw4LpuY=
X-Received: by 2002:a05:620a:a012:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d43bbf2c61mr1408976885a.21.1751130282264;
        Sat, 28 Jun 2025 10:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM0b1H8XT8JuGjUEDa1qJz8tTa7OLmfjHHbL2N7ZLuNpxRojSNa8erMnxhcxOfcw6QxGHBwA==
X-Received: by 2002:a05:620a:a012:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d43bbf2c61mr1408973285a.21.1751130281800;
        Sat, 28 Jun 2025 10:04:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2eec862sm8230631fa.85.2025.06.28.10.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:04:40 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:04:39 +0300
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
Subject: Re: [PATCH v2 drm-dp 06/10] drm/hisilicon/hibmc: add dp mode valid
 check
Message-ID: <qrmfobeguesumq2jjajrqaoyiwatlaz4wcklalmmhjinoql3oe@ulcv7jmocsjo>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-7-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-7-shiyongbang@huawei.com>
X-Proofpoint-GUID: CPBFc_c692x_hK8W5ORRcSJ3iIYxLuTW
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686020ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=XpIS79cx_mmGRX-n0o8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CPBFc_c692x_hK8W5ORRcSJ3iIYxLuTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MSBTYWx0ZWRfXyxSJgmLAAx2g
 9+X+igf+u5d5EOoTuP2iYHoQeFOuy2eMV/0oTl0Kn/a1uPoi15yD0eSlmx9rDAOjWwCHcO0zCZE
 FN11GqTr6R5RuUWXG7aADuY+EKp1ttR1NSQGBCL6ONirOMvIDmIib671/x8t7cw+YRC/UJSZwJZ
 nFbSGz61Taigs2MDX23neIBc4fVM1yEE16o7IBnREfuWHAl6jkV4F7OYReKeta1fowEkrjsGfPy
 VMeN1k1b+6+LkcZsViOVeOxPggbQOnoA39gnJT38/BkvBQJvzDAXih2fCVcVl0dA3hFMH+PHpv7
 T+SLOxtBQLsyo12Y8vkCfmmyeTzNTLn5UO6stVvoQ4TXKJPyxGC9p++n1Z8bYwmGr92JABprry/
 uQfOHHBIQClejgRZtVEeRZqGdlmH0wUTwZs94eLFYlJyCg1bDBhj9QQT6nBY+ULNakvKQ7ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280141

On Fri, Jun 20, 2025 at 05:31:00PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, add mode check and BW check in mode_valid_ctx() to
> ensure DP's cfg is usable.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - delete if (!dp->is_connected) in hibmc_dp_mode_valid(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 51 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 98cc534ba794..5b1f943b601c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -273,6 +273,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
>  	dp->dp_dev->link.status.channel_equalized = false;
>  }
>  
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.link_rate;
> +}
> +
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
> +{
> +	return dp->dp_dev->link.cap.lanes;
> +}
> +
>  static const struct hibmc_dp_color_raw g_rgb_raw[] = {
>  	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>  	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 9b45e88e47e4..0059a2648a38 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -12,6 +12,10 @@
>  #include <drm/drm_print.h>
>  #include <drm/display/drm_dp_helper.h>
>  
> +/* 27 * 10000000 * 80% = 216000000 */
> +#define DP_MODE_VALI_CAL	216000000
> +#define BPP_24				24
> +
>  struct hibmc_dp_dev;
>  
>  enum hibmc_dp_cbar_pattern {
> @@ -62,5 +66,7 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
>  void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
>  void hibmc_dp_enable_int(struct hibmc_dp *dp);
>  void hibmc_dp_disable_int(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index c0de796225b7..40f95880b278 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -15,6 +15,28 @@
>  
>  #define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>  
> +struct hibmc_dp_disp_clk {
> +	u16 hdisplay;
> +	u16 vdisplay;
> +	u32 clock;
> +};
> +
> +static const struct hibmc_dp_disp_clk hibmc_dp_clk_table[] = {
> +	{640, 480, 25175}, /* 25175 khz */
> +	{800, 600, 40000}, /* 40000 khz */
> +	{1024, 768, 65000}, /* 65000 khz */
> +	{1152, 864, 80000}, /* 80000 khz */
> +	{1280, 768, 79500}, /* 79500 khz */
> +	{1280, 720, 74250}, /* 74250 khz */
> +	{1280, 960, 108000}, /* 108000 khz */
> +	{1280, 1024, 108000}, /* 108000 khz */
> +	{1440, 900, 106500}, /* 106500 khz */
> +	{1600, 900, 108000}, /* 108000 khz */
> +	{1600, 1200, 162000}, /* 162000 khz */
> +	{1920, 1080, 148500}, /* 148500 khz */
> +	{1920, 1200, 193250}, /* 193250 khz */
> +};
> +
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
>  	const struct drm_edid *drm_edid;
> @@ -49,9 +71,38 @@ static int hibmc_dp_detect(struct drm_connector *connector,
>  	return connector_status_disconnected;
>  }
>  
> +static int hibmc_dp_mode_valid(struct drm_connector *connector,
> +			       const struct drm_display_mode *mode,
> +			       struct drm_modeset_acquire_ctx *ctx,
> +			       enum drm_mode_status *status)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +	u64 cur_val, max_val;
> +
> +	/* check DP link BW */
> +	cur_val = (u64)mode->htotal * mode->vtotal * drm_mode_vrefresh(mode) * BPP_24;
> +	max_val = (u64)hibmc_dp_get_link_rate(dp) * DP_MODE_VALI_CAL * hibmc_dp_get_lanes(dp);
> +
> +	*status = cur_val > max_val ? MODE_CLOCK_HIGH : MODE_OK;
> +
> +	/* check the clock */

Why? Is it really fixed to the values in the table?

> +	for (size_t i = 0; i < ARRAY_SIZE(hibmc_dp_clk_table); i++) {
> +		if (hibmc_dp_clk_table[i].hdisplay == mode->hdisplay &&
> +		    hibmc_dp_clk_table[i].vdisplay == mode->vdisplay) {
> +			if (hibmc_dp_clk_table[i].clock != mode->clock) {
> +				*status = MODE_CLOCK_RANGE;
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = hibmc_dp_connector_get_modes,
>  	.detect_ctx = hibmc_dp_detect,
> +	.mode_valid_ctx = hibmc_dp_mode_valid,
>  };
>  
>  static int hibmc_dp_late_register(struct drm_connector *connector)
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
