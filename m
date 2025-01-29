Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0811ABEC5
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738188464; cv=none; b=qkPpFp4mAkQStEazjD0NYg6fDxqOR0sRwWn7bewZYwy6r6M2nT2sQrDtI7IaoTRl+1khTsv2VzeV+HypjUL3FaE+QRnfyM5EWm0oxJeWhyWvS/PWpB3Af2AS4SuXmXk1h4lBjNYKXPr24Urp58C4ksGO70JbU/KCLQ3tq6vnFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738188464; c=relaxed/simple;
	bh=uMAKbdK5Bh8Mvvos2yvRjSV4FN+Z0yj4taHUvSjJBo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbkKBmNJBZAO3tXDPD6MmfwJIBWnMMUkf8UQjY5ne7C0MavefHfq3lJR0ueUJN0NK9ZOBfF/dZxbYz2/UlJqZFmu3P7vtzzPPGgh5qKg/6xf4dTDiT/6Zm3S1LAj5ImOMIGDl0oO7CKMRw++TwV0l595rVfkUZDx1T9Vjuc/Ooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8GZ9lXG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8GZ9lXG"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e47e93a3so125681e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738188460; x=1738793260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8b9LinkIXkdHYsmqasFCr8qLnSUCnJw2wVia4tFFuo=;
        b=w8GZ9lXGPGvJtCjo+zV6LPDOIVGktVl/GFBcJQai2PZdOoS9V1GZxPNybVV8G7cdLr
         oHe2AqehfrJTyEBNaSWuZH6dV+Q+7pZoB46jRPXh8hzN50fiEWNceRCjroDiRKvuesue
         tzWvYPIsEluDqN++ApwUn6f6tNmiH8cdCSPqsA63urDG/3sEWORuCC1S68KO1lpWtTDa
         HWNEf6h6srn6gZkOFahD2cjnYbHeT2FG1C3eqlvqyQoeo60HzGQueDkRNDtGrSzkCAwo
         nAGdIgXMw+Ztt5/Q7As7caXQe+W2YdfD5DVgu2vF+CfRA/1XKADHgC4US+PmyxFIabjf
         6m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738188460; x=1738793260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8b9LinkIXkdHYsmqasFCr8qLnSUCnJw2wVia4tFFuo=;
        b=dR/TsPJRAU4jkiA7kxhCjsQEHaoUpDJZ/QutLgCAR08SnIR+x8Xu0rrAyHwp8RHJwn
         DpAkRLiGt3p88WUI7SJ4cY4xWo5X1mppFRhv0VgqhDvZ/oAVa1rORy/8HbuP4Yl3qfEt
         4Ge2/efnFkXPE3QYxQ7X1DD1D0UlN400SQIn/LARJDZjUID0Uzsl0/qEIE31KOT2db56
         I6GNA2jmNG0Tms0iFogCJoNa1Dgp2/MHfbxC1v1qikzuFU5McUAwXvq+tpREEUb06YEZ
         iy3ic8aV0v0IaaYhf3r7sL1jk8EJBaEpPu8bGEFzcDGfqUrNbVcHur8PU6nKaOFsamJv
         wcLA==
X-Forwarded-Encrypted: i=1; AJvYcCWhITc2ATCNDbclVUV/USN8gHlIvu976n14ml9DXtzaGYOtNAggBJotNyzUeFjjL3cxhXA1wvzqv9SggL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YydHqqjq69qBToqi405yb0I6lFp/ElGWwQQyJ+Bl2nL2zm2pGq8
	NBS3r9y/4qQCh/AZb2MU6eHVgeFsv1j913Jgeb5cRGNnH/264bFebchq+9eWrH8=
X-Gm-Gg: ASbGncspHKlGYTV36wm5vy92vorioPlnIciq6z3GH/9UAh1WT986IdCE90BiwtbD8pd
	c4ZIVZg0UuKXrDMKC2ndBcwJI53vQTJO31ZrUEbi1EoDJ39kTM31hN6+ggU2gBTuJPOqZQtTWZM
	8Q5mjWpIEhQuzO0pkXS8RlN4qd9d3gdPk2UAVcT77D2kU3Ow+g1z+H2puJUfTFb7uYqqdljvwQU
	/6w52eOcXLiAAC9d7V1HO7FLqV0aGZrVXB+G9RTTdKM3fq2Bmq8HWPaq35jA9/UyPXLIg0mK9k+
	QM1FR1p3/BPdTDWNUYqOSEVYr9SNJOAppU0b9uzZk7Rn8EAtYZeoyUeDZAKVpFhMhhIapaU=
X-Google-Smtp-Source: AGHT+IGU58t9XSUJxpA7hMdaRg2MqAeK33LGZgrgQVW4xaH8bZpNt4BF9puhCwLIYjLLNRPDcZjUUA==
X-Received: by 2002:a05:6512:1114:b0:541:d287:a53b with SMTP id 2adb3069b0e04-543e4beac2amr1757535e87.19.1738188460355;
        Wed, 29 Jan 2025 14:07:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379979sm2097867e87.179.2025.01.29.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:07:39 -0800 (PST)
Date: Thu, 30 Jan 2025 00:07:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Message-ID: <yxvmnrpa7r55n6l3jf5wpkikd5iqtwjm5n56mqnxw65nboi5js@svaj72pzsevn>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-6-6464ca5360df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-6-6464ca5360df@quicinc.com>

On Tue, Jan 28, 2025 at 07:20:38PM -0800, Jessica Zhang wrote:
> Currently, our hardware only supports a single output using CDM block at
> most. Because of this, we cannot support cases where both writeback and DP
> output request CDM simultaneously
> 
> To avoid this happening when CWB is enabled, change
> msm_display_topoloy.needs_cdm into a cdm_requested counter to track how
> many outputs are requesting CDM block. Return EINVAL if multiple outputs
> are trying to reserve CDM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v5:
> - Changed check to fail only if multiple outputs are requesting CDM
>   simultaneously
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bd6fef8eb8f267cde4ebe1155be39ce69e786967..99db194f5d095e83ac72f2830814e649a25918ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  		fb = conn_state->writeback_job->fb;
>  
>  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology->needs_cdm = true;
> +			topology->cdm_requested++;
>  	} else if (disp_info->intf_type == INTF_DP) {
>  		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology->needs_cdm = true;
> +			topology->cdm_requested++;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0fbb92021b184c4792ddfe059e98b3acf7bc7cc6..dca3107d1e8265a864ac62d6b845d6cb966965ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>  
>  static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id)
> +			       uint32_t crtc_id,
> +			       const struct msm_display_topology *top)

I think it's enough to pass num_cdm.

>  {
>  	/* try allocating only one CDM block */
>  	if (!rm->cdm_blk) {
> @@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  		return -EIO;
>  	}
>  
> +	if (top->cdm_requested > 1) {
> +		DPU_ERROR("More than 1 INTF requesting CDM\n");
> +		return -EINVAL;
> +	}
> +
>  	if (global_state->cdm_to_crtc_id) {
>  		DPU_ERROR("CDM_0 is already allocated\n");
>  		return -EIO;
> @@ -629,8 +635,8 @@ static int _dpu_rm_make_reservation(
>  	if (ret)
>  		return ret;
>  
> -	if (topology->needs_cdm) {
> -		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
> +	if (topology->cdm_requested > 0) {
> +		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id, topology);
>  		if (ret) {
>  			DPU_ERROR("unable to find CDM blk\n");
>  			return ret;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index b854e42d319d2c482e4e1732239754979f6950dd..7716c226cd7a270a1bac052dc085f5ed84cb9c26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -51,7 +51,8 @@ struct dpu_rm_sspp_requirements {
>   * @num_intf:     number of interfaces the panel is mounted on
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> - * @needs_cdm:    indicates whether cdm block is needed for this display topology
> + * @cdm_requested:    indicates how many outputs are requesting cdm block for
> + *                    this display topology
>   * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>   */
>  struct msm_display_topology {
> @@ -59,7 +60,7 @@ struct msm_display_topology {
>  	u32 num_intf;
>  	u32 num_dspp;
>  	u32 num_dsc;
> -	bool needs_cdm;
> +	int cdm_requested;

u32 num_cdm, please.

>  	bool cwb_enabled;
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
