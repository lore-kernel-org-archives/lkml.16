Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7A1212FB8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728315; cv=none; b=lbEpeghkV8RrBND+ncNZl6UAZPAjtyX4XEjs6uoGczNPHmnjEHF43k24aB73dO7gNIeyMGNIx2oID3BW/YrzakPk/fYXzgZ7V4wytkRIfX9R4Be3YjDfwanuuJxP6k/v651XQ2tDHbJDoh5026UFdwucpOub4sq0uiUl+l5uRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728315; c=relaxed/simple;
	bh=wWkafiNEWdpxukzyksw2hTHdNCcqHphqd37cyWmEwYA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=faAh8jFGp9pK9W9O+t664QggNIBBSmlJwOb6NvIscPCeJDRQcjT5h1L3BpUkJjZMd+Vj/LJ+Dli0uvREELLJEH5alwwlCbowri4VBXMJ95jd74KAsueCMxZQvJcSzbH7TakAKwZOzZ6RGfErbJs3lHqu/eQaBNGyyML9XWPcWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRLXQtoj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRLXQtoj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so37081365e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728312; x=1748333112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
        b=BRLXQtoj3XcKiP9Nu+QgLGK2NVz90m9JFCZyvTC29GhRcYHyEh+19gNaJUfRJHxntl
         KUm9tt33iomk1SkN5s3hyoUC0DRCiLUwWb3KYMo8rHxxhIstYX9vuy0dXi674Krcvyuv
         4HbpFucAJfDGuQkEn96gIQqvpZ8e6IbAPz1stqKtZk6RdDSPlL+MI494nqvGMlbDylFi
         5C41mgjndOnKBZpvZrQkJmUi3/kjp6yhk0EtIr0VFcb05E1SAWR3AbhEN+ZmIiP78WxZ
         p4wuks0QtZw1vTQoBO95seE+QFnwo/HYtQ9B0FLw/qNLZCgkIWEVMhpx+tyKOHEH7PF9
         N6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728312; x=1748333112;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
        b=FGRbZqTieAiDmsHXPejJ4YntQAKEAqKhzdxwSWxQEwdOEr1kpf+wB48Pfod7bEFVZO
         h0rHT7Rc+uK7VmCeXxkPLr4gCtyIU6qIYtO9ZpJlmruG6yBsk35Wfpb5uG1/DQJeEPG6
         Vn/rA4fL6KiVWpu/UMPweahmILkSYxFMv5JT7M/k9bGiPY0mcA9hCBD4wn1n8dj5v+FV
         jZbzSE+l5Vsxh3dHZoGVh+o9svBUsLUFBe7U3hRqsUTxF8pGlLhA8M1iP4qTbvVBnB9r
         gWLXClZdOfKtfiizi/M20Zoia3rsUyWXi+MkrvqI7y3qPzZI/5zzKyfIsr+78P0ImIiN
         7rfA==
X-Forwarded-Encrypted: i=1; AJvYcCWOtxUpgBWuX9Q3hBFTR6ud1RKyG3xFSAlZ4BgGotkBLwlcBVeqaC4mFLCX3U58B/1n5bGrK0gzLSNKV68=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9i6tZQR7kvZ7G4qvzbD0+MHRXv8H4Mr3y77rZGq7xyyZIJQUD
	Rl+rO3SX6AL6fdnFqCi47RRh8URZrMGU8YNkIgFpdlCKbFJJYfhA3D99ht9O62bIB5M=
X-Gm-Gg: ASbGnctLcRYCvGlfGSvZKKKhlNw0l2znkg47Jl9010A+m2K0GGaafXFGOTmoMfAP8Af
	3EybOGF/WndbIziLyNo6xJUB1pyWsYOXc7lYcu7P7wJniiv/vtS6OvCJFbQo/uIyMVnXvABtfwB
	+SanN/bPWoo+V1t1wmjuTIxM+A4LC4qE9cdA1y2m5MorpRaXXD4KL9Zv7Ou3Pan71Esx2wQbXzm
	ZqT8HqIIa0fiaioJx6bT+KHkGDuIejSPmVEaDaDoK3c4yRVKvENNBt8jCX52/jGVij+t3obMBTG
	a2I1PZ/qgfgsDyLK+li8eBaDn80ayedMuYa5xbK/CkSU1I5xyxFgvgD3hxVQkZ81VxP0RiLMC0P
	qlZTL2a0TWz6SzRMEh9cS3ID5zH8i
X-Google-Smtp-Source: AGHT+IGP1iT2KS7C1jAAS9avfiRYegZAXZJbq43ThFN2fqZehYB3eN8S1ivyCQg/LLIAvxsCPpLRRg==
X-Received: by 2002:a05:600c:3f06:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-442fd63c7aemr176158525e9.16.1747728311950;
        Tue, 20 May 2025 01:05:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88990sm15825687f8f.68.2025.05.20.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:05:11 -0700 (PDT)
Message-ID: <7142ab55-9173-431a-98fb-a78acf0e5ddb@linaro.org>
Date: Tue, 20 May 2025 10:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Drop unused MDP TOP features from the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -28,19 +28,6 @@
>   
>   #define MAX_XIN_COUNT 16
>   
> -/**
> - * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
> - * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
> - * @DPU_MDP_MAX            Maximum value
> -
> - */
> -enum {
> -	DPU_MDP_PANIC_PER_PIPE = 0x1,
> -	DPU_MDP_10BIT_SUPPORT,
> -	DPU_MDP_MAX
> -};
> -
>   /**
>    * SSPP sub-blocks/features
>    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
