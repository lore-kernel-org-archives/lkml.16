Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463415665C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277662; cv=none; b=hUDi9uzTP6KpyYa4GdL1C56BL3z6FRFwJuvZBUA8TXpLc5SFlsEg9mjvzOeTRa3t5Z8myBdntssKalKwlMvzJB1A64nrT8fLjIrbhkglV92wCNxvkK51LPmH2esr5D/LWLAQaNAjUyLIc6VOu4EAIuiZTXh4ldPORbLwZspDcmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277662; c=relaxed/simple;
	bh=rxPG44k8aRLmT8mHnjz3Z+YzvtGAWD3cHO/oh8CPrpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rj1LQ8TzSar2JwKVWY6K3bdHi7JDmT69RTALdjB38u6v291djEl+gq6bJK6ggLBTNFtuI4mtV9QkTr3aRIX3kuMlaz6ZQ1d0vAtXUjpy+kItuFxNXIzEJOPBfgPE4YUpXmQRAJc71t55S/ZcVM3DE1X/hJU8tQks45CBOLapyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcKjTUkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcKjTUkp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75iQU008480
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZmRk/nIWOgv0WKjyd5+0U3H1
	c1b3isz3+5TZb7AFwxY=; b=RcKjTUkpV1+Ip9JsfFTGboUJwtRZeycIawtXHmg2
	g8qibswhWrLTQkohxCw4DCQFg/osbm9t3p5GmwYxRnvmdtI7c8SlwRvEbxrUqDDx
	2ZNYunEgJxMJogZ1cWL7aIm4OWS8e7y3Ne8FnROOHwoyUrhLNQh031T2+s5zDgNe
	y/KQ1JMzhrAC0Q2IIdYoH31lCuXka6rViGBDHt6LBbiaMUgV7geSdrKY+KVEM/Hd
	H7kDeSZMovTU6eO9I2PhcWCDC3dNt94/ya6yduAsxbnLQ2p9Sl/gEcoA7UHfU4MG
	e+KFcK0JDwCb7uFX5iEuB+iBCf8V5eGxvQ5y/WrG3u+gng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd06gec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:34:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so259066185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277658; x=1744882458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmRk/nIWOgv0WKjyd5+0U3H1c1b3isz3+5TZb7AFwxY=;
        b=NGSMNxpUccRiiO0Ulo1cFM7BxKgwfVOsy6k7ZzGElQvU4h4gUIz4U17Xg++XsoW1wg
         JYRIB7+xDaE4Cd2KCnioGO6Ob9xImTv6bZCq5CymHwXNYnLbsX+lxOSd61iI7DGWc3tK
         K+vdeqNPKLpButRIdEdGnjtMFE0HT40Q1eNWpQbNmUqDVxgM8uf9FmhnxHei4Cpf9xrI
         popX+7apMNXSgqDqyclwX9tJLxZRBzvEo/37T665nNhbel6vWcjZ+ySdzJFLzTBUQXHz
         MPOm2G8s2jajFCQtWmHSs1nTpygy4M23NLssQVX84wbAKM5InFR57PeDFh51E4uF24N5
         EqTw==
X-Forwarded-Encrypted: i=1; AJvYcCUksnRHFqgwdFCzAYP5qI/R4gkZSaT9yiDC6wwpGXlTevvtJIClyx8uzazFuXwGSZWJftUK8txOrhca5E8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6MgLDRkungRFEua6df62bw7ol4hcJiNs0HcYP6ykQA+5rrdt
	j1me8lG/vIsC6mYWiAc3Th8qRdoRp1PuZOhWR4l9hBdjqcmFDN0xBJPmpWWu1NlU+HpZG74NHvi
	5WG8PK5GIeRnU/g7c4wpqdl/g/NDBnWH+PLqIIg3TtckiPlHwOLkkwW5j2G22sVk=
X-Gm-Gg: ASbGncs9sH1eVvwA5N+XLgVOAVhCso192AHfXgFSDvmcS2KbONOKfyG5LTSoqesPSJs
	GZ3lozuwJrt/c+ibuwahRN1bmr/8wGvynJgXeWRERjRune3R5NcscNGgMcghTCaK+OC3SZm4bhj
	WY5Qni6sj2fB2dQ+8RvjqHVpLD3BAJmb8yLRWhhL4ksnAxv10yRD6PL4yDaufLUNxWvbXI1ryTQ
	WEIL78gJpFcebZaQxccWsLipbjtKacEMZAn3itGHPdkaIilO2qMZy14WjGd0lx4uWFebc4XgSG6
	/o8U6XN4YAvd12TYuMwCbgDsnATUIU6SiZV7bTV10wXkjJEbwe+r7EBifKMc8pA/8ErMyrZMR48
	=
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c7a764cb6bmr289362485a.4.1744277658362;
        Thu, 10 Apr 2025 02:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnypts5J1GX80RPlq5oY/cn8YDm3EQRJ2T3Q4Cv2aNajyp1qdx8pwYcaGhZwq9M4ps0t5HMw==
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c7a764cb6bmr289360385a.4.1744277658046;
        Thu, 10 Apr 2025 02:34:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2379ddsm91750e87.63.2025.04.10.02.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:34:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:34:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel: ilitek-ili9881c: Add support for two-lane
 configuration
Message-ID: <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
X-Proofpoint-ORIG-GUID: v7AxxgkmdyNJ9avCDSAy-Pw-faHWsvW3
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f7909b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=hu4IY1Pqr02MU7G1rJkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: v7AxxgkmdyNJ9avCDSAy-Pw-faHWsvW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100071

On Tue, Apr 08, 2025 at 05:27:01PM +0200, Kory Maincent wrote:
> Enable support for two-lane configuration which is done by setting the
> LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> 
> Use the dsi-lanes device tree parameter to configure the number of lanes.
> The default configuration remains set to four lanes.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 35 +++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..5c429715159755df2461063dad0971642e2b9041 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1263,6 +1263,21 @@ static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
>  	return 0;
>  }
>  
> +static int ili9881c_set_lanes_cfg(struct ili9881c *ctx)
> +{
> +	int ret;
> +
> +	if (ctx->dsi->lanes != 2)
> +		/* Nothing to do */
> +		return 0;
> +
> +	ret = ili9881c_switch_page(ctx, 1);
> +	if (ret)
> +		return ret;
> +
> +	return ili9881c_send_cmd_data(ctx, 0xB7, 0x3);
> +}
> +
>  static int ili9881c_prepare(struct drm_panel *panel)
>  {
>  	struct ili9881c *ctx = panel_to_ili9881c(panel);
> @@ -1295,6 +1310,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
>  			return ret;
>  	}
>  
> +	ret = ili9881c_set_lanes_cfg(ctx);
> +	if (ret)
> +		return ret;
> +
>  	ret = ili9881c_switch_page(ctx, 0);
>  	if (ret)
>  		return ret;
> @@ -1504,7 +1523,7 @@ static const struct drm_panel_funcs ili9881c_funcs = {
>  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct ili9881c *ctx;
> -	int ret;
> +	int ret, lanes;
>  
>  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -1545,11 +1564,23 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> +	ret = of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &lanes);

Use dsi->lanes instead.

> +	if (ret == -EINVAL) {
> +		lanes = 4;
> +	} else if (ret) {
> +		dev_err(&dsi->dev, "Failed to get dsi-lanes property (%d)\n",
> +			ret);
> +		return ret;
> +	} else if (lanes < 2 || 4 < lanes) {
> +		dev_err(&dsi->dev, "Wrong number of dsi-lanes (%d)\n", lanes);
> +		return -EINVAL;
> +	}
> +
>  	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = ctx->desc->mode_flags;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = 4;
> +	dsi->lanes = lanes;
>  
>  	return mipi_dsi_attach(dsi);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
