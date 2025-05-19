Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C51EF0BE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682823; cv=none; b=jRZ33SBTW3Vc6OQNvQCGOUGnSxZAiJpucysyTg49R8qiOD6jf7l1acA0rWIynMbi6G4mnSDqmZnTuXUFhXdmqNreivNAkOyOH6mbXu+PYmWXrLR1JLlPBrjj8conaYT39pVF37DGDT8/t6DXGJKHzVioFHrJVFBkDMVt5jqMGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682823; c=relaxed/simple;
	bh=dmrrPngU6uobTYXB6y8wdZR5oUPPLBBt9mE8U1oef0c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pgHFAvulIMPylq1WAJwooJFSPSgKHEHNV+JaqzsLP1rIcD4RQqd78FzceAIlYeF3iAXc8Ftt25xRxCXvHBfvAvk4/kRdsCzDoY6Lp8Jr9QZ7uM7cw8EgTB9FoBbYw7Xix/GxMWZPCLmOxK/3MqZbHiP9TfJ5HlU1sq4DFfvb8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cp/AQcqU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cp/AQcqU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36748920cso2289128f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747682819; x=1748287619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp6W268nOdiEFDLoi1ournCMxYWsL1COXVd/v2CLrPo=;
        b=Cp/AQcqUTjkk2gNfgUssT13rD1wa5bC2vFnfBk601vyjxObQXeM5yTYGCfgSqrN4zf
         j1lBKgw3j/Fhsz8IBvOaFUoG6FuG8bfvrt1+qhlVscT5bF4Bms9NDSP56PSa7fRx3lIl
         N3qhawUP8vcvmNtnnzpTg3HsnCAYNCTWdICOT2FuQwywWouvA5wjpQSob8E10F8l+8Rq
         HJp1qpARpgIKKdwJAgr+NnWQDOn+gt/A/CjOg31QAlRhll4Fpw8mmMqyyB8Q9NsUhdf5
         tf91F3SfrMrD7KzDGIiG9zgS7TWDPjgOZC84RSrd+EnShnZSptRaje0nqjTH+hzK1ass
         crjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682819; x=1748287619;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gp6W268nOdiEFDLoi1ournCMxYWsL1COXVd/v2CLrPo=;
        b=tZ5/l0nPxKKjKfgJGfRpFY3lA7m060ex/aBLWQsneGmpTX96NzkAF6heRRNtV7rMR6
         x6Sr2aDpSqMTu18Yl5Ba7FRlIgeqJtCubOThU0WdSkm7KpyEwKuDbTSeaIxQurLrvGcR
         Z37xEfsO6hbkqIGNlo3tYUIq6o9Ia+SIR1AL9Kv5679BLlx1HKqcuUcCr5pS+BpYxy5W
         1nadjwfUU8/FGLg0J9e6RWvfBWblUck7b/c7tGJHVvcimMVP1hawa7RqmUu1SI6hiEg7
         mTwDNUdmK8dVyG3WsC2roR759BRW7mG0eQYR8r0jwCz/6eTSH3bUEtpmB0kjYqpUbFSt
         097A==
X-Forwarded-Encrypted: i=1; AJvYcCVuNreDKzAQ9XblXvVGXrIEJ46YG19WrnhkFUxiooZME/ETX+iV06S79TKNOh/1UsoNlLl/w9RBPxB520o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9YtUEam6/17Z/gwTKxfui2T8RRkHQCl9iyC1JK4tC5ZJaH9h
	rCLXvmxhlxi57CdvyGqar6xtQalz8O5kmkpMgiu1TrATUkIYHs61VlT7H+HDAIcYeso=
X-Gm-Gg: ASbGncuRNxzV0MPSwCM/VNbIusNnp2nqZLsrt/FkqeMCEiyE5F8VJpaG+Wmq01ESPaX
	eL3ccH2oCFT/atqqC4+R9D4tDcMIiQv8CYVzG+Uhxfz+PAaR6p+D9EIfVhSwDfN4GNkvKnl09k/
	T4wGf/Wj/wKVqeOxB/7liM+cj+e2KQULlM9eLYTXkuVaqNiEVakL7tijawtYbbPJqi62oXhtR6J
	STtj04YNrZQUy2W+WFS0edRRdRf6dU9c9rm7we90+rjMUePRPAnBtjvt7HC8pmkbeVGwe9Ooa4A
	/aT11Vg16FM+lBceRJtQejTOR0nWifbKGj14DtjlUuWOyNBzTlgLmE63nxkxAbSqGG21hv36+98
	epM509yWXLNNPtOe/A3Op5I89OWtX
X-Google-Smtp-Source: AGHT+IEz2OxB4TUiePtJ1S3U4He3bFr0A/Fzdl9S869pPSUEokoHeXsRBPUYhgU9CBgbG0huiL0xYg==
X-Received: by 2002:a05:6000:2903:b0:3a3:6f26:5816 with SMTP id ffacd0b85a97d-3a36f265984mr4117945f8f.36.1747682818790;
        Mon, 19 May 2025 12:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm13644737f8f.23.2025.05.19.12.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 12:26:58 -0700 (PDT)
Message-ID: <6ab77f26-873b-4599-805c-096b7a593785@linaro.org>
Date: Mon, 19 May 2025 21:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 03/30] drm/msm/dpu: inline _setup_ctl_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-3-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-3-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_ctl_ops() function, it makes it easier to handle
> different conditions involving CTL configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
>   1 file changed, 47 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 573e42b06ad068445b947c59955281ba6e238dad..d58a0f1e8edb524ff3f21ff8c96688dd2ae49541 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -737,56 +737,6 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
>   }
>   
> -static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
> -		unsigned long cap)
> -{
> -	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
> -		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> -		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> -		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> -		ops->update_pending_flush_intf =
> -			dpu_hw_ctl_update_pending_flush_intf_v1;
> -
> -		ops->update_pending_flush_periph =
> -			dpu_hw_ctl_update_pending_flush_periph_v1;
> -
> -		ops->update_pending_flush_merge_3d =
> -			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> -		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> -		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
> -		ops->update_pending_flush_dsc =
> -			dpu_hw_ctl_update_pending_flush_dsc_v1;
> -		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
> -	} else {
> -		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
> -		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> -		ops->update_pending_flush_intf =
> -			dpu_hw_ctl_update_pending_flush_intf;
> -		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
> -		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
> -	}
> -	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
> -	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
> -	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
> -	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
> -	ops->trigger_start = dpu_hw_ctl_trigger_start;
> -	ops->is_started = dpu_hw_ctl_is_started;
> -	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
> -	ops->reset = dpu_hw_ctl_reset_control;
> -	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
> -	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> -	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> -	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
> -	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> -		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
> -	else
> -		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> -
> -	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
> -		ops->set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
> -};
> -
>   /**
>    * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
>    * Should be called before accessing any ctl_path register.
> @@ -812,7 +762,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->hw.log_mask = DPU_DBG_MASK_CTL;
>   
>   	c->caps = cfg;
> -	_setup_ctl_ops(&c->ops, c->caps->features);
> +
> +	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> +		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> +		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> +		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> +		c->ops.update_pending_flush_intf =
> +			dpu_hw_ctl_update_pending_flush_intf_v1;
> +
> +		c->ops.update_pending_flush_periph =
> +			dpu_hw_ctl_update_pending_flush_periph_v1;
> +
> +		c->ops.update_pending_flush_merge_3d =
> +			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> +		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +		c->ops.update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
> +		c->ops.update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
> +		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
> +	} else {
> +		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
> +		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> +		c->ops.update_pending_flush_intf =
> +			dpu_hw_ctl_update_pending_flush_intf;
> +		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
> +		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
> +	}
> +	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
> +	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
> +	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
> +	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
> +	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
> +	c->ops.is_started = dpu_hw_ctl_is_started;
> +	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
> +	c->ops.reset = dpu_hw_ctl_reset_control;
> +	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
> +	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> +	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
> +	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
> +	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> +	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
> +	else
> +		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +
> +	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
> +		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
> +
>   	c->idx = cfg->id;
>   	c->mixer_count = mixer_count;
>   	c->mixer_hw_caps = mixer;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
