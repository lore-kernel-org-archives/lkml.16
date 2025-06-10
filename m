Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784B2D3A9D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564654; cv=none; b=YycwdNYfZnoLbR8hyKpFEHp9jQdwPFaHxop3QXxm5hN979DjsmhZYnKrOcBKYFtBLkRVdaj5jrhy5MAHIjGsGkRLJ+/Hto71tdWch6bhpGYIlp3Bn/KZT8t6nk3RGLZ5/mCcTGs5/E/m7/vYUYCOzrkaUiqmqezPKkt5wgLcJFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564654; c=relaxed/simple;
	bh=dL+NAXdmEtaqnYTL9u3c/bcaID5JjMQc7h8b0o0L+C0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HUK9GsWGMgI9ypRLaJerdsBZ5aB9tZKaPoYvS1mcwNQeViwCzhbzzdPgF3idVneWbrBNtGBMmUVy52N04F49+uRvSqX39OzLGaEHtZz5+eRcP1GxXHOoGRCxYdBapfhQtUnGNxoHJtGeBOPtAo47sJ96Yv9QXH91e/ETJ2ptxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o72j2XEB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o72j2XEB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45310223677so19661835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564651; x=1750169451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xRZaCqfgFQZF5DtUD0UWiWLPdXpNsrUellAmF4l02M=;
        b=o72j2XEBctMdgnAdgo38vEEt2lUEtrzAWXFefDVv5CZoNPnyHE6IM73v9zDTmKPU9s
         +SsygzK22ZkC4+j9gwXf7Xgi1LLQSpzzE9Slk+fUYS4h59sb56a7sBKtiobKKh+dbvam
         jL+WjevEDlqZS2WgjG6jWE8U+GEwUtXJAoWOnOgvD20ZnBVqdf0Ve0LebeGGZKhMkxcs
         +6TZ4SowNwinJVftvcH3GuXgcUibhlp0lvX1jowIniVMGGAvIO3oiRFSYKxqZVM9snnJ
         Ev+lp/JmS9zwJFOPevYnIz3EKnmTBKpY9YxzMJsk6LKnSC3H+WOCfVO7TyuCbnCiI7WY
         Bdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564651; x=1750169451;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7xRZaCqfgFQZF5DtUD0UWiWLPdXpNsrUellAmF4l02M=;
        b=l0Pvs/D2LdGchY00zrWpF4U2CBA/Wc78TUt4U9T09+6jANCgXnel3k2xasnQbAAzVf
         /PZzVf/Pyl8UfTrMMoh7LXuzEFF+jmu/X4TR1ZbNwt1tFThcD5iBznnAB6EAgEnqiFX2
         5Ypm5od145Vdz5qioBBROZ3KNCtjAoKAx2IWbBz3lPvhXGFeA1Ey+O9nriLEvwotoa0L
         PnFtBOmM7WurZ00PtIcRUIqvgZ1cozKadvuDTD7rECaxe062ekINJ2S8GytN70qUeFjb
         BwViy4V9tFuul1EgXYVhJGNFvGSR/qdHh11EopbezdHKH+yeczLleirWrC8TexC63bVG
         fxVA==
X-Forwarded-Encrypted: i=1; AJvYcCX9yFEz5I6+Yuu/bZewChum+smoGprcucdpb8BFaLtg0F/OUbSCT5HYYu+sM3VSBOyOcDV03w5nlHt3T+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoBw/ght9NOsDcEemDVF/OWx7hVeE5EycPyMkfd5bIIbfjeHS
	w1hsDvZSEeZrol2lGcDqXRX6GQ3OSEMd40xOJKw+cIrS5MT07l7WeJHR6t/DxcwFtA8=
X-Gm-Gg: ASbGnctYfYfWq4dhPU9QNibyIeEIXVlvb8visr9lfn3id6wZjtTvCCC4cjxpmuoEX45
	SjISQ5OwF7QL/Lfy9/pvX6Qz+7bKIPs4IYNyIVQ9d5uCg9Kqso0s1NWBgQnMQRwDRrRaQyjLAdG
	gZj/atd9cE9z6fhfIyyarPckVfKq8JbS1HPuEdfpfti5RjNg3BKlISxGQRF0nFQpNrDotBWL4Ei
	oW6+uuwyDnA13EVWDjPM6YH883objhumWvpodRp33xaOLtQ5k1kDrTK6KItCYVGjaMfKBPEM1+U
	Q7wxY2exSAVdjbPFRxcf8DQ8t0CDHIRIhV+qIEoQruQA230PSPMaGnbZf3VZnbk+i3SyDRxX4ES
	9cH6fgNS2T1BaErGUFebZvkWJe8kTq+x8Y3oK
X-Google-Smtp-Source: AGHT+IH6nxPw4SGNIKULUDGmYJNLzg0CR+d3wDgQkU66TIShv8ZdQB2lSNRbrUl7wqsrLTx0uzCF8Q==
X-Received: by 2002:a05:600c:c4b7:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-452013841d8mr197717025e9.10.1749564650836;
        Tue, 10 Jun 2025 07:10:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531febf905sm14161215e9.0.2025.06.10.07.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:10:50 -0700 (PDT)
Message-ID: <3d576c19-6f68-4f04-b89a-e269c438b339@linaro.org>
Date: Tue, 10 Jun 2025 16:10:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 14/17] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-14-ee633e3ddbff@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250610-b4-sm8750-display-v6-14-ee633e3ddbff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Notable changes in v6:
> Correct fg_alpha shift on new DPU, pointed out by Abel Vesas.

-------------------------------------------------------- Vesa

Not sure this should be in the commit message.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Checkpatch: CHECK: Prefer kernel type 'u32' over 'uint32_t'
> 2. Fix for fg_alpha shift (Abel Vesa).
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 23 ++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>   2 files changed, 97 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 92f6c39eee3dc090bd957239e58793e5b0437548..5e986640c8ce5b49d0ce2f91cc47f677a2e3f061 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -320,14 +320,22 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>   }
>   
>   static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> -		struct dpu_plane_state *pstate, const struct msm_format *format)
> +				      struct dpu_plane_state *pstate,
> +				      const struct msm_format *format,
> +				      const struct dpu_mdss_version *mdss_ver)
>   {
>   	struct dpu_hw_mixer *lm = mixer->hw_lm;
>   	u32 blend_op;
> -	u32 fg_alpha, bg_alpha;
> +	u32 fg_alpha, bg_alpha, max_alpha;
>   
> -	fg_alpha = pstate->base.alpha >> 8;
> -	bg_alpha = 0xff - fg_alpha;
> +	if (mdss_ver->core_major_ver < 12) {
> +		max_alpha = 0xff;
> +		fg_alpha = pstate->base.alpha >> 8;
> +	} else {
> +		max_alpha = 0x3ff;
> +		fg_alpha = pstate->base.alpha >> 6;
> +	}
> +	bg_alpha = max_alpha - fg_alpha;
>   
>   	/* default to opaque blending */
>   	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> @@ -337,7 +345,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
>   		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>   			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>   			bg_alpha = fg_alpha;
>   			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
>   				    DPU_BLEND_BG_INV_MOD_ALPHA;
> @@ -348,7 +356,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   		/* coverage blending */
>   		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
>   			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>   			bg_alpha = fg_alpha;
>   			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
>   				    DPU_BLEND_FG_INV_MOD_ALPHA |
> @@ -481,7 +489,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   		/* blend config update */
>   		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> -			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> +			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
> +						  ctl->mdss_ver);
>   
>   			if (bg_alpha_enable && !format->alpha_enable)
>   				mixer[lm_idx].mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -19,12 +19,20 @@
>   
>   /* These register are offset to mixer base + stage base */
>   #define LM_BLEND0_OP                     0x00
> +
> +/* <v12 DPU with offset to mixer base + stage base */
>   #define LM_BLEND0_CONST_ALPHA            0x04
>   #define LM_FG_COLOR_FILL_COLOR_0         0x08
>   #define LM_FG_COLOR_FILL_COLOR_1         0x0C
>   #define LM_FG_COLOR_FILL_SIZE            0x10
>   #define LM_FG_COLOR_FILL_XY              0x14
>   
> +/* >= v12 DPU */
> +#define LM_BORDER_COLOR_0_V12            0x1c
> +#define LM_BORDER_COLOR_1_V12            0x20
> +
> +/* >= v12 DPU with offset to mixer base + stage base */
> +#define LM_BLEND0_CONST_ALPHA_V12        0x08
>   #define LM_BLEND0_FG_ALPHA               0x04
>   #define LM_BLEND0_BG_ALPHA               0x08
>   
> @@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>   	}
>   }
>   
> +static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
> +					     struct dpu_mdss_color *color,
> +					     u8 border_en)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +
> +	if (border_en) {
> +		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
> +			      (color->color_0 & 0x3ff) |
> +			      ((color->color_1 & 0x3ff) << 16));
> +		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
> +			      (color->color_2 & 0x3ff) |
> +			      ((color->color_3 & 0x3ff) << 16));
> +	}
> +}
> +
>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>   {
>   	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
> @@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
>   	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>   }
>   
> +static void
> +dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
> +						u32 stage, u32 fg_alpha,
> +						u32 bg_alpha, u32 blend_op)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int stage_off;
> +	u32 const_alpha;
> +
> +	if (stage == DPU_STAGE_BASE)
> +		return;
> +
> +	stage_off = _stage_offset(ctx, stage);
> +	if (WARN_ON(stage_off < 0))
> +		return;
> +
> +	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> +	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
> +	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> +}
> +
>   static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
>   	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
>   {
> @@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
>   	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
>   }
>   
> +static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
> +				       uint32_t mixer_op_mode)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int op_mode, stages, stage_off, i;
> +
> +	stages = ctx->cap->sblk->maxblendstages;
> +	if (stages <= 0)
> +		return;
> +
> +	for (i = DPU_STAGE_0; i <= stages; i++) {
> +		stage_off = _stage_offset(ctx, i);
> +		if (WARN_ON(stage_off < 0))
> +			return;
> +
> +		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
> +		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
> +		if (mixer_op_mode & BIT(i))
> +			op_mode |= BIT(30);
> +		else
> +			op_mode &= ~BIT(30);
> +
> +		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
> +	}
> +}
> +
>   /**
>    * dpu_hw_lm_init() - Initializes the mixer hw driver object.
>    * should be called once before accessing every mixer.
> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (mdss_ver->core_major_ver >= 4)
> +	if (mdss_ver->core_major_ver >= 12)
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
> +	else if (mdss_ver->core_major_ver >= 4)
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>   	else
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> -	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	if (mdss_ver->core_major_ver < 12) {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	} else {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
> +	}
>   	c->ops.setup_misr = dpu_hw_lm_setup_misr;
>   	c->ops.collect_misr = dpu_hw_lm_collect_misr;
>   
> 

