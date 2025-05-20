Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203525D1F5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728305; cv=none; b=gePpA8HMnzUyRFAKiVlWp6ZfTq0qsJfN1YscBdtNgWlwunqS7qoVXUG4qgCmjGinDu+0GbDfVRN5qs6zS3ohDUqHZMBJLy0AVpSP+Ofs+qMTbntJ4pMYEJ1L3ChaSZKdTxM10NRjuYdvMikxIQaLNOVIaw9+EZKJUCadnkPEK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728305; c=relaxed/simple;
	bh=dVd66/LTvQ2RN45Jr2m5S/pHVpsDjYhPNQPEkpudd+4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ra4+rHvSzAiEPOZz6vepcxF3xCIwBG+YJ30H3cxv9orvl7y3m9IEzsdeNLLRbbah7kF4Xfz/eEfw+fmjXMPQAEbPPeMTgVpvKXeSbd5ZHWaGS4WakuULUOKQ3G2eXcQbFJ5G/0DZZuqqcltZyYqBbtQ1O2HrYl7Tslvml84HQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eJBoNza5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eJBoNza5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so64967335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728299; x=1748333099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTvudJvnhDEPuyFu1j/pIjb7A7vd2K7xc6jlT71fWUc=;
        b=eJBoNza5GBMuEknl8sGd4T+k+AGif5XIgyXeYosjyKZzs/1rA/zV8CestdM4a3rSJN
         zUl9864KjZgXt2zS2n6ECOFiVkvc/r9Yu+OUmEVfyHAwpFRyEF5iq6k4/NbxElctyzQl
         ph0NHIwFdYxSgMvoZtMdaXWjTyiVGEjQKg6ldp+u7yYdqEa1UPe9nQG6OQwKlbzznHao
         W07bJ/7vH3mDG5camfk1r/AO9QBjLCTWqcKX418mBy2KF7BNUe2JeD3sIAFhRNACLoZM
         1Wt5kkYRaILW95ubGJLfQyqvV0tnK1pEAdxxl+pqR/VvQXFj2aS6G4MtEwQsT72vIp/a
         FK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728299; x=1748333099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PTvudJvnhDEPuyFu1j/pIjb7A7vd2K7xc6jlT71fWUc=;
        b=vBzsVkOlTEKJqUuRc9cUPliZqdPnBuMWw1nopAWFEGd6Z/t/9aTbfEEnTssS5mLza6
         TZYfyxlfO22ScvJMtAQ9yGdO5H3mzx0ANxn1FvGwO1ydNdNjPNW9kHLmaH6zGJUE9RGV
         7RKvr7aNJ47Nl1+6PnA/HUr5ivqwAC+YAtUpc2VOQ/raLhtVObXy+RlsENPKDUoIJ4OU
         0QxtCFgOM7v6GxJubzGp1rDXD5FCYTMcMqeAuG2NaWMgH19eY6CpspZHrnMLk7jEaw/k
         rlzvxltP48HB61+6Mm/joEyv01JLJpK9CL+sETNBlAeS8RDciRr27h5FVtrtpxhKwtJ/
         l9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzJ5w5AFKtgVkXdoVNbUSoaedbuQLODfD/4tSEJ7HP0uRjDmsOd+ZDl4D0ZFWlF0mXlVYNkYIsNC3wu3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoiFpiDebYNaXglj7suBeDQRzETfr5tPxv3AFe+kEVxUTBgkU9
	pult4qp15R+Ll09lBSAR49+PnQomAI47Lur0kaZKWXnoN/+LeJu3afOKRhlHq9XLbVM=
X-Gm-Gg: ASbGnctU9LnxXtfS2vIrCPa8NXlRbKg/FkypjIKlrj43PYcOpsFfpcZuNQaItBsbiF2
	SUMFzZ09/cihvs800d/kiLJvJELr5DyjNB7ZqngnItzrHRtpsz7IJ2ISZ6p0Q0eJ7tABEV6YsVX
	WiQMFzDb4N8HhSL5Dldr2ZsoowqG7hq/aqYfrkiXJ3xp+Kak86+GthnN3svra5g8e8lkBM6BhZy
	Pkg9Wui1FHmVktTc6JEM1Ej5CMcLoJiRwy1I9Zzs7UoPbjQfCSKOMTwd7L7BVPsdftVh2bkdxtL
	UNLWEt+IwzcEf6Ylxutd8uNz9Pzx7h2fcPo8D1rikKGi5xrBNRYpAWgk4vYd3xhXD3S9+tH+33D
	Rvy2nNaYRVvQYjKtzZgRYK6W8d5VXnFxOYCf27cM=
X-Google-Smtp-Source: AGHT+IGUPKh2A40EZEfnAPoVQ3zMAxuIk1SlR6DLZKDJjOuSfQInyC6VjSaaWvvIanac18fckF6Umw==
X-Received: by 2002:a05:600c:34d4:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-442fd67200emr144060775e9.29.1747728299447;
        Tue, 20 May 2025 01:04:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362997dc8sm13872656f8f.46.2025.05.20.01.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:04:59 -0700 (PDT)
Message-ID: <b6ef6e15-cff4-40d2-a54d-55dd0218f966@linaro.org>
Date: Tue, 20 May 2025 10:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
>   4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -35,12 +35,12 @@
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
>   
>   #define VIG_SDM845_MASK_NO_SDMA \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
> +	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
>   
>   #define VIG_SDM845_MASK_SDMA \
>   	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
>   
> -#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
> +#define VIG_QCM2290_MASK (VIG_BASE_MASK)
>   
>   #define DMA_MSM8953_MASK \
>   	(BIT(DPU_SSPP_QOS))
> @@ -60,7 +60,7 @@
>   	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define DMA_SDM845_MASK_NO_SDMA \
> -	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
> +	(BIT(DPU_SSPP_QOS) | \
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>   	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -50,7 +50,6 @@ enum {
>    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
>    * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
>    * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
> - * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
>    * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
>    * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
>    * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
> @@ -68,7 +67,6 @@ enum {
>   	DPU_SSPP_CSC_10BIT,
>   	DPU_SSPP_CURSOR,
>   	DPU_SSPP_QOS,
> -	DPU_SSPP_QOS_8LVL,
>   	DPU_SSPP_EXCL_RECT,
>   	DPU_SSPP_SMART_DMA_V1,
>   	DPU_SSPP_SMART_DMA_V2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
>   		return;
>   
>   	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
> -			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
> +			      ctx->mdss_ver->core_major_ver >= 4,
>   			      cfg);
>   }
>   
> @@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
>   	hw_pipe->ubwc = mdss_data;
>   	hw_pipe->idx = cfg->id;
>   	hw_pipe->cap = cfg;
> +
> +	hw_pipe->mdss_ver = mdss_rev;
> +
>   	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
>   
>   	return hw_pipe;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -314,6 +314,8 @@ struct dpu_hw_sspp {
>   	enum dpu_sspp idx;
>   	const struct dpu_sspp_cfg *cap;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* Ops */
>   	struct dpu_hw_sspp_ops ops;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
