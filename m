Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076E21323C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728375; cv=none; b=oXCu14NSK4zkBye0wVqPK7a1tjme+g1yQQV8u3sERohrF/ALI8ByMXfr44ijLALZ5r2RFrb6wIgbML2HoIR1cCYaQro9I4k8NpLimj4jcPy/FI/Y1eLv/HZO8GhDS6ZTgomD3RAGy8g5WuXdRkWaNqoxLQsAeyAxE6HklFsTfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728375; c=relaxed/simple;
	bh=qpuDQxaClm3z8be941HXqyX9wybTje6vApNBaYOJC6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JRr5qJ8Vki0npKhAO4pGyhMRsfYkt8cHW5Oagn/fgpk5myHz+E46KHRikPkRJ2wbuhQhZ3C6lz3UxNvEMmfu/WK3bhpfggRFf0Byh2gry1ROjyJV+ffclw6toFyp8+JCe4vK7nhSM0t8oEdGhMcG9kCyhL17bTvQ8duBY/mDWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=El0bxGAf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="El0bxGAf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36ab95a13so1445250f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728371; x=1748333171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
        b=El0bxGAf2vmOasbVy2CUfYg//mQ6QR8f/A6J+fuTXLocnOTtmoaHlM+tPtIwRLMiyo
         qerVm1zXcZMbsUvMbs9qZVxltQO0IRMIW2bvR0AsRPd3mJf1mx7/J2Elqn9nMmbm5JeB
         2Y4Q4jt5yTn50rAlNeJd7Q3edwl7lUjgWG7PyjSIE3bYBSnL4i+bkWa38rqyQ1UaSCpl
         r4MvgLvdTCXHmE1KWHsS8AvamgtN1wVQLpoWjyv+3m8ZI25SouKjoBCVF5Mz9VrwKj85
         Z67d4EhNAYOCl3xGmfkSBNK7n5nV91hIwb3x+VqyTqjNDrjJwbaheIOae01YJdqBReCI
         4yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728371; x=1748333171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
        b=siN0B2HTjE/hpeUgQOFxRO3Z9o69d7k2cLSOXX028yYbAyyNtjllvvIcsZH1tfl6Yv
         Q3oDAONYCwOVWoJ+i7fQT7HrOrVQdc6EiByIUV2Uko3djjGrn+p8x6srl9bEq0wYehvU
         4YZT7QHYmsuj4VjcFkZGU5OwYumL8+3oI88eNRg2gzOLVaHIo5rRWTNJFj6romlPzigv
         VrGA5zKrw4W9vo/Etw0piDssDWEtRa8FwBBQmBa3Fczx5hlycqSsGLGgCl3U9D8CnPK3
         Fgr0f+G85etLEpLYqj94J7bc0w6vbRCCB9WDSwyKKCOmqBDX4/lrgKJypFur3kG63dkp
         jg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK7ZnVIdjyyP5l5Fc0LMOCRaD5YHyuMq/vyLr84UWRzo7MzxmahqmnzDZUifVKvkwEPzDTnciEah77Vcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziw3FQQSwzvzkn610j/60LrKbj20P0qJB9qJwyUlc1IgN5GQaO
	n5dFFbT69J4U8FaKN+PJFbWxtxrowTkGBcnbl0h8kUCDnU79oZ6sJ/CPXcWpPK5oye8=
X-Gm-Gg: ASbGncu3dCHdJH+EjQXo1OeT/TZXM8WvyjsQdmUGl0HWMEpPvuZHMa5LtLCxMbXicLW
	Zibno++G28AIpe9Yh/8GIZz2bJCzXyoYBatL345mjECiONcmsmHoBUeqnwL/nSux8nKanN2R77I
	o/YBPNYyyJQrLiI73ILn9uWY+JdYHbSicVTLiPFb8/Zby2xCjwzZZyLPBocushZ1exzzD+QIOEp
	lwSp/yEDHFQ0p3M7/VUx0jDuc0q3tIe8QuyBbSTa6LChBuYCD/aMdVfmlhuEidX9HYJXT8iz8QT
	FefCB8hkLkvRDcrze4FxyqPOYLdki5nxe22QI7LIzaPtlrmQ7njfrbsNhgRpb4l1IEjTvSgNZOC
	0nu6yCVvr78YB//b6P9K05LUxqxlp
X-Google-Smtp-Source: AGHT+IFU/KqkjaZqWA96xVqbCJbAg44BaTwi9c9qATMvcmY51YXkMbr1hDQrWO7pjZhFY+VTnRD6RQ==
X-Received: by 2002:a05:6000:4284:b0:3a3:5da4:d80b with SMTP id ffacd0b85a97d-3a3601db731mr12950882f8f.49.1747728370901;
        Tue, 20 May 2025 01:06:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm20643995e9.18.2025.05.20.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:06:10 -0700 (PDT)
Message-ID: <193195a8-1e84-4ec6-aa3e-a02d00bd142c@linaro.org>
Date: Tue, 20 May 2025 10:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_dspp_ops() function, it makes it easier to handle
> different conditions involving DSPP configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>   	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
>   }
>   
> -static void _setup_dspp_ops(struct dpu_hw_dspp *c,
> -		unsigned long features)
> -{
> -	if (test_bit(DPU_DSPP_PCC, &features))
> -		c->ops.setup_pcc = dpu_setup_dspp_pcc;
> -}
> -
>   /**
>    * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
>    * should be called once before accessing every DSPP.
> @@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	_setup_dspp_ops(c, c->cap->features);
> +	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> +		c->ops.setup_pcc = dpu_setup_dspp_pcc;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
