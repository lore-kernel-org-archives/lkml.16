Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6140242D73
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949368; cv=none; b=HpGdpzQ07d+NkZiWXTbkWiK0An+cWe6PWKfWe3BT8Yu23GRfQS50DsEdpoXqirDPgMyPWMOnlJdZ/I6HGnaH9Tnw9syYFuHAxGmHwnskRbVkfmNgcPBogt+Uz/fJVgHoyHtYxr2z3lDcaer1O7CwAurA9SN7uB1aaYj8mA6OfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949368; c=relaxed/simple;
	bh=YxF426ki5r01JQo3a4BoiGerwrXUKzdq62aGjvZ3ZkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt314whZA9908r2ZB5gLkX1Q02gdI0IMentpcFkd+00jEX1NpdTqDbV3SPsvrzTCpm0xrAiajwxfNz8nJqi071WjQEjPrLXnYhInqTksebFe9l+33arxlStTGGQ96BjZeP8tDrfZgv7AFOU3I38Lqme8H6Wo3iCLsMKD2M0p48w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5V4SqfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5V4SqfO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53THt80a007452
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rS5vG6Ykrsa1zW3Ud275kbku
	3FMpDAYZKUwwcOX3+Qs=; b=L5V4SqfOxfRjSoAvXu9F1fb31nUL+7WBBsoqfm4M
	kgMQEPVuITFrCsaw2zQr7bHSp9yDuYHcomGlM8QnvflKiaMDHByIcosrIPf3z3m0
	ebdc3GhH4IeGPQrYBWLYcyHUAu6OXNlCx1a2RYF7/k3qHKAxXviOoCUgQyhjggno
	CJzXKHZzjKCS2O4Gc/Fn0SkE2CnfMn3PWOafOZAGNm+YPwGxKY6T7Uv+w3dCQVpm
	IFLGJeQBDQEio4voMOuUPJEz0qafkQ6uw7ypTXJ5I6fzkog9NagaPJnMz61dA7cO
	BzZ+o6XudIN7hJgKbz5G6ExpnN0UI3B6uLOkeAJ8Xk3a5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9dg01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:56:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95556f824so640004385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949362; x=1746554162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS5vG6Ykrsa1zW3Ud275kbku3FMpDAYZKUwwcOX3+Qs=;
        b=mhZfzundQaUUy+X/4O/oNWNUUD+7AqFz3H9NpHKkGHSbUzW10io1p8q4L9xtmdYOWj
         t/An0hj134fSxi0isyjPkz313Zkelg+xk1DSBgy1PBxJuQWb70OXbelkXDXedFOQFIqj
         tIAt5Gd2DlT8HREiDEkzeR6SgZB/id8CwLWg1A1KWiR1GeyfeULNR84+jmyrIP34SVa7
         dBj+1xhUd+ZmY5rZSjXa8pTUINPhVDOA7sQ/3bdcEX4XpHEV33BFsrcgQ7zl7M6q3oTO
         jDvDv5sLqyyi7NL6MoeDNElSnpTCNZ6aZ4pbqxAhhUPAfF6//r0WiJmCEVIS/KIzuKeh
         RX3g==
X-Forwarded-Encrypted: i=1; AJvYcCWVAICI/Ep4BiHSBD4Fdys6HyFm41Jys1Ic6b7hsYxQSVTi3qfMBz1C4PXmF+P+U/SwKzvK9U65ZAcn/gA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcu85lRVhz86i+KjndOAGdZGG4ciLovoJ4AQ2ocmU/LVlgVkPF
	/HbMzQL8Iofs0Jc8QxaMc8Ddt2/dr0hDDgad2VvsM67OzW/3TunzmrjwBd9eH69DpTiA+QmsFFV
	Pudwj3qY/uxqsQfqoA2qh6uULIKG4jzedTfNsOW4bSedNMasjRsRt7s7Hz/231CE=
X-Gm-Gg: ASbGncveciJvdoNtPqUI09fETosuwMkcJ9XfdIgk7hm3nsNGtavO0bPvkrXfky6Viry
	MFCieuus7YrrK7bZ0cEBDih+T0IloNPC96SmvgrbvGsMmbKvmM1dBOGUl4Xw3C9s6ak5GhAvy3P
	jBM8KWrK/C0ghRCDP6U6GOqVoLjRXC34N/FCIqjE6pQClP+qpDFxUE3nY89LZuiNCAXvBVVS8dV
	QXhJL95ooq0TV9eRo1sHORuii0ZimUoHs13seUvjxPNQZjXDvl348xR7ylQSFYGQhNU18sOKv4A
	hudLwDhs2H/y7oim0p4YoyzqYfXVHRg0DuVDNs0UhRlUPgGQEo6gCB576wjwV2OlvaILvNlrI2Q
	=
X-Received: by 2002:a05:620a:17a2:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7cabddd8535mr597329085a.58.1745949362467;
        Tue, 29 Apr 2025 10:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRha005ciPmWQvQ7hrDFPUg9VvCfnjF+1wobmE3CtP2HMJ9VopYx0EY6VOvVx1uhZKTX5kvQ==
X-Received: by 2002:a05:620a:17a2:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7cabddd8535mr597325085a.58.1745949362083;
        Tue, 29 Apr 2025 10:56:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccab19bsm1948330e87.207.2025.04.29.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:56:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <k4le6lz2bwdxqc3jw4ctndybkongynexr6j7p7afc2h5mzktxm@ov26hfmi3puj>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=681112b5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=p-WgCerdHsfys2ORyzkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ae32rx-34EFEptjvj7kVcYEV19QYolxJ
X-Proofpoint-GUID: Ae32rx-34EFEptjvj7kVcYEV19QYolxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEzMiBTYWx0ZWRfX0v7VBEvkYwqA 4ioOVkym9vGvZ9W7yJSadP63QX1zKscprAgPq5eRIgagtESBiG0IrSDlJtTVVig0x55ZbgQhAfZ kOhfn15Vb9h3/oWVxA9c2bG0jB3Ct2phvSrfRKLhgpwFdNJP0zYZTuf9CaYRJjunpC4zwT6z9EK
 IOxPgzporbIDRGi2B9yFpYYn3GpKBnsn2pViv7UFuz3wMTtfGzY10tKtpEJJwVBfRDDV0kdW+VJ kI9tkWlgROht4J4c5FvuVGSBeqvignGHFhDRcrFz2+fj0MeSAkdsTfqMlg9Joyu2JSAAUeapJ4E JTqAKZOsn9IW5yi8gizwCrpCRcM0YTsZw3oE3NxsMRYXv/bc+J1JG25Lsb2aiLsMTO/ekOUxjGv
 8LSQEcdspxjUdWuUSubbfkkVzcuhNQFk2Mw5MlQH/hkJWAuyWs1BjeuXIC3QcT7gTXGou3o3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290132

On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>  	DPU_PERF_MODE_MAX
>  };
>  
> +/**
> + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
> + *   the perf clock factor.
> + * @crtc_clk_rate - Unadjusted crtc clock rate
> + * @perf_cfg: performance configuration
> + */
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg)
> +{
> +	u32 clk_factor;
> +
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
> +	if (clk_factor) {
> +		crtc_clk_rate *= clk_factor;
> +		do_div(crtc_clk_rate, 100);
> +	}
> +
> +	return crtc_clk_rate;
> +}
> +
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>   * @perf_cfg: performance configuration
> @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  	struct dpu_plane_state *pstate;
>  	struct drm_display_mode *mode;
>  	u64 crtc_clk;
> -	u32 clk_factor;
>  
>  	mode = &state->adjusted_mode;
>  
> @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  		crtc_clk = max(pstate->plane_clk, crtc_clk);
>  	}
>  
> -	clk_factor = perf_cfg->clk_inefficiency_factor;
> -	if (clk_factor) {
> -		crtc_clk *= clk_factor;
> -		do_div(crtc_clk, 100);
> -	}
> -
> -	return crtc_clk;
> +	return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
>  }
>  
>  static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>  	u64 fix_core_ab_vote;
>  };
>  
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg);
> +
>  int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  						const struct drm_display_mode *mode)
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	u64 adjusted_mode_clk;
>  
>  	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>  	 * split the large layer into 2 LMs, filter out such modes
> @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	if (!dpu_kms->catalog->caps->has_3d_merge &&
>  	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>  		return MODE_BAD_HVALUE;
> +
> +	adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> +							    dpu_kms->perf.perf_cfg);
> +
> +	/*
> +	 * The given mode, adjusted for the perf clock factor, should not exceed
> +	 * the max core clock rate
> +	 */
> +	if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> +		return MODE_CLOCK_HIGH;

This breaks arm32 builds:

ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!

Please replace division with multiplication.

> +
>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> change-id: 20241212-filter-mode-clock-8cb2e769f05b
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry
