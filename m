Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319B25E814
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727771; cv=none; b=pOASrezPcOnu4Uzq5dSYEV6RqBzf9ekBFEM0IsH50pQc7YUKbGb1UlziS6V6p1XmEng/yLRsxlvsCAq9CZMcwc7Ps6CjnPTNkg6l/5TXx7VLE1XbDZj4qpa//IsfYVQLMIkt3QXS9a2c+Zcl5xuFHxLdCF4e+l+XR7TKNvFBzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727771; c=relaxed/simple;
	bh=694tGXNeN+BjLDOVyMSijRVIYZWMQslPcf4Lu2hZrhI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uLtBomdD5n79BuqfJ815+SHRLVK1iLM5B0FH+/+jhHhcJMy94g3Da8Z8HPDYPlMyo37Mj6Y3tNbgu+2G8SohKhlgWUMMd7CWnFz8M1e03/zA+MTTKENoJiiDd93CBwbA1eVGxpcah+2lQamcRrLCaOz1BO1uxlaCD8pSzY9j9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTNT8OjP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTNT8OjP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ede096d73so37354515e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727768; x=1748332568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F11bs03eZCLtBsVxVlw2EQffcaqCf7aP9O5RupB8kGc=;
        b=vTNT8OjPcs71KfSOZfYtzShdej+DdJZjsRQuuwsyg2QM15bLAhJnCqZr5y2i0/lc8c
         4beZYyAXA9x74XUkT37gI5DhZMBD6UtrWKowKAkLMKAvVzB7VnCUR4IeJ2Hgjb4VddPI
         0jh24x9uNGa9Pki8qH0HZUBw5M1WOVGw3UKlq4nnhBL3Dk1Z8Go9DMOEo4Ti3mKlavvC
         zlYqx3pvDOTCiUopFkpWcpgwtgKKknpOge3SebS3CmKdIsDluhYXbaWFY9mPyKrqrr0H
         UkcFUgvvM5PIb+Sf9/AVX10iYUQABs+B5tcqTf96DEafZhKTUbqblnVLCk4Lq9BpNosi
         XgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727768; x=1748332568;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F11bs03eZCLtBsVxVlw2EQffcaqCf7aP9O5RupB8kGc=;
        b=RiTlifxwE9KYfs5xkZ9GsF3PgjaTHeb5nhSpSBxnF8a5kcK0/XGnQoRhUNA0JdC+mT
         WV7D5faI5TBwIELZqTHxnPzzjAiTl6ANtfeyn7mUMqeyk7d5hnaYMzcPEkM1gC2V71zy
         QWPrA8FBarGNTn4mLjzcQGCwhn/WqUzRg8LH93tm10eTI+mFYJqfRzvHVdQBtzx1c9Ag
         s2cqBkyhtASBMEnOzw68y97zEa7HuYZgVak3dhkDRWrTKgipJ4pQajETlW4iYfw34/4Y
         NLk2uLUrcD6QGFX/CBIWMVizwNulOZ0gUjb1ageqayHNaghCaF5Nd+7mvBUpwce19Z3D
         6DRw==
X-Forwarded-Encrypted: i=1; AJvYcCXJuYVWfUT8GKpUx8WwE2D6QkWK5ICVv428Gj5g8pTGiGZirkxpOmxqh1MmyFiqWtESHO6OmXduVPGlziQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPOuO11hCGB6Lw6VrGNzaFik4tuasR4xRDOURbHm3v71QozVJ
	mxBeZ6zzHFdxZAYYnGpVlSIhilNb1U5VNLbHyrD+0xdRBCHLbZsykdXN1OduJMGi/L8=
X-Gm-Gg: ASbGncud8HXu7rKrIZRfdlpblQSpE6/T898Rcg0IjCEAF4e/Hp6TyHsh2iIjtuofRoS
	NX/MtpO9NrA0DV1Y24SvMCB78On5BKMV9TI3snzDQs9ZpMUIvEgRvhcf6BJ1gsxY8DYPVvLjhDF
	cs9KF6PsD1rHXEA2IgAfb41h9MBHFZ8fmqwF4pB9ZkptBroNJqF0lxeeEEWq7rMrMrLsH5CeQwH
	CXOXtkNGFVfsExOn0vHWe3P2wAJXLE3NByEjfvNwCUp4MaNG9m0yNVpXTJ1V7ymWaAJhjy66mzM
	8SZ1MUPvhLyeBS1Zp2w2D4GiUfAwUpGNqSJEJHyzBTv/czI5LnROqstLp+J09Yk5BXbapfmEWs3
	YEaEWNsk1CYIoNH14baNQawAdp5+4
X-Google-Smtp-Source: AGHT+IGD16JXLg6tO8XaFCwpYAuFj0ArHLRvtiPSi3zl6hlgfffjwHEQZ2/bzv2WW2NLnQP7OWGaPg==
X-Received: by 2002:a05:600c:45c3:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-442fd6656f8mr120452925e9.20.1747727768488;
        Tue, 20 May 2025 00:56:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm20944195e9.22.2025.05.20.00.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:56:08 -0700 (PDT)
Message-ID: <c6b82b68-5407-4961-8ce8-d257cebcb0b1@linaro.org>
Date: Tue, 20 May 2025 09:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_FETCH_ACTIVE) | \
> -	 BIT(DPU_CTL_VM_CFG) | \
> +	(BIT(DPU_CTL_VM_CFG) | \
>   	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>   
>   #define INTF_SC7180_MASK \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -132,14 +132,12 @@ enum {
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> - * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
>    * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
> -	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
>   	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	else
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
>   
> -	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
> +	if (mdss_ver->core_major_ver >= 7)
>   		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
>   
>   	c->idx = cfg->id;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
