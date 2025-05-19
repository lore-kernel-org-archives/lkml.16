Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB0210F4B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682803; cv=none; b=hmwspuzI9QsHerfaw6nZ+hQlmQOa8o4GOpOJkeOv3CscPSdveuXZqv5Juq+EyP1+d6iUG/O1IDr1jze4odhI9Ht/mNZ8G7ZP2KwQIEiloiRIW/U5jz2/69xVFymJfecZUBSISyTlgSmkTckklAoqLQGtAUvBAfhMQM4SU4eBh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682803; c=relaxed/simple;
	bh=8Iw1O9Lzo+YCCNRceQBU1yJJ/T5XGZoAN0e3s+PioYY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rDjmGjrV/YjlrrIi+3dquvsrngTy+rMAjF4r1/PNcLq/yDbNEqHWim8gMJP/Y6CIqJDdZ/vBJ+CfqULT1aP5Q3kNXZixzKoLYKeJY+azoD66zvdIdtdx/cOV4Q1BW0MxErHGPPMPYgMMU+8uAciGR76DKBi/c7WQUK7KXQU3pm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpPit5rX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpPit5rX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4201005f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747682798; x=1748287598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFXXvcbboaJbTNLJTmEOAzlPujyDrBlvP86g22hiZa0=;
        b=KpPit5rXLwgSIjPrfEBUN2nbT73yZLCvTglPAfcnytKjH8ToQdjzJ9CKkVvucLo0Bl
         WvW/tyTp+2N6gp9i4f7KiNP3v4yQkCIU0NASXKoKBK5C20dGN94jVYrPRQRpPwqS8+Dz
         31ZhVObz0XwEydYWhGmm80Z0Z5Y1R+0nqhxmImv6WyADUbUltKfuWH8Je36f430IR+98
         V4dTG4FXEBwH1TKEZcRnaHOHB9qCaw2jzGmTWyW6BYsLCMV3AXv1ij+AQPXq316XEvRI
         yJbJt/+z6v6Xhb70A33kXKcRj4OYXLL5w6etz84hhuf4dEqzB047EaW0PPwAeIqY/T7C
         Ctig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682798; x=1748287598;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFXXvcbboaJbTNLJTmEOAzlPujyDrBlvP86g22hiZa0=;
        b=AHPIFcyCiLk8TAd2auVBeIBJuosOTUzDo57eqjHmKgUWclqooF/bmxOMk5geIby11m
         CO7uCQYj51IBPWAIOsP0wn1PviWmy4fmvdoEyuoiipKUcRhLhAUjxV6TvY/0xWaIaEWD
         oT27YzGVrUnTQ03azDGvUxnUPvtEVGM3tWjyFXyS4XYr4Bnry42eD/JSOui0JTdP6O60
         6XUWkRWdLazh6lCH8a7OwzVUTHGJnqKLI+Qh6UzHdOyh5nR0FFJS8ZQ1yzwOVS2t1sQS
         k/JPXZHUefyqIi2V4LTOqD/TqtRtzB/OhIVfyBD8uPMCMAWmaXwohyQyd0aaxxg8mX3n
         dKOA==
X-Forwarded-Encrypted: i=1; AJvYcCX2yxa9woN/TW65cl2bSfeFhisobNCSBEnYrTrjgcwG4UdYW3utleOaEIP+SDn2Tvq/8L0G4vg/NPf2j+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ36NiuJ16tNhcJokJKeD/mXNnRqakle2pOEiO5gWI8qiexOGJ
	jULMV19S5rtXZMUJlp8gQEMFXtsFLnPU9MnQGFx0hi/Rluk1pHIPlf2Dn4KWvCAd89U=
X-Gm-Gg: ASbGncuB9Wd1pomOY0X0uzgE0mUAcFa8Ss8aPypakeJhhmxR2forSubppErQzNoqWr/
	TbNWnvCEgrf8LIUJKalSYzXkaOwcHc5wJeWd9PfwbF6OtYGTeY+1VRtvqbydtibIEJOHYj6oREn
	FJ42cWvynNPyM3zfDrY86TnwioYBZnAClyusX1beyITJRmsILh/ebww5fxxDUs0IfhcxWSiFp9c
	xkKRVxhm19+S/gRRB54fTi3SG3y6VqHuWc9L8euD+SxGIe4Lij82oaR5YiHTueTSmBH6EH5/KHh
	X5LLPyU4Ez5pwcaO0AXHnrZtLc5OQCAgTlU5c6Ol7QXGMmIEk0d1Gi6pQdzfK3z6bwXGFFYjCqf
	nTPbiedM1Ov/rEcUq4EIqSu8dNAYX
X-Google-Smtp-Source: AGHT+IGjldG+V2h53roi6wkz9WwaXLvsrszRGhagPmCy3Brgl9F4PMRvClIni1Lu01HQTQBEJ+avFw==
X-Received: by 2002:a05:6000:420c:b0:3a3:7709:3038 with SMTP id ffacd0b85a97d-3a3770931fdmr1873072f8f.38.1747682798298;
        Mon, 19 May 2025 12:26:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a360b0b766sm13490571f8f.56.2025.05.19.12.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 12:26:37 -0700 (PDT)
Message-ID: <98163164-9639-4b1c-9407-2f0845a4a111@linaro.org>
Date: Mon, 19 May 2025 21:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> As a preparation to further MDSS-revision cleanups stop passing MDSS
> revision to the setup_timing_gen() callback. Instead store a pointer to
> it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
> revision can chance between dpu_hw_intf_init() and
> dpu_encoder_phys_vid_setup_timing_engine().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> -			&timing_params, fmt,
> -			phys_enc->dpu_kms->catalog->mdss_ver);
> +			&timing_params, fmt);
>   	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -98,8 +98,7 @@
>   
>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   		const struct dpu_hw_intf_timing_params *p,
> -		const struct msm_format *fmt,
> -		const struct dpu_mdss_version *mdss_ver)
> +		const struct msm_format *fmt)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
>   	u32 hsync_period, vsync_period;
> @@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   
>   	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
>   	if (p->compression_en && !dp_intf &&
> -	    mdss_ver->core_major_ver >= 7)
> +	    intf->mdss_ver->core_major_ver >= 7)
>   		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
>   	hsync_data_start_x = hsync_start_x;
> @@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   
> +	c->mdss_ver = mdss_rev;
> +
>   	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
>   	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
>   	c->ops.get_status = dpu_hw_intf_get_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_timing_params *p,
> -			const struct msm_format *fmt,
> -			const struct dpu_mdss_version *mdss_ver);
> +			const struct msm_format *fmt);
>   
>   	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_prog_fetch *fetch);
> @@ -126,6 +125,8 @@ struct dpu_hw_intf {
>   	enum dpu_intf idx;
>   	const struct dpu_intf_cfg *cap;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* ops */
>   	struct dpu_hw_intf_ops ops;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
