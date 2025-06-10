Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5527AC54
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564610; cv=none; b=ElEUsOoo8PIMWqfbaZCz9HTOFUlgpOy9fBacBkcw5Z4WnHVP/hzKmxeZta4EobvF2idAcZDoZg/pmpmLGzLTBJaITqmCYH4367WLEbk7EfB7sB4vzASUk3+pbppCRpEAvcSUN33JYEAm2+stRC3kIBELq9rdn1zXqualC3u9mYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564610; c=relaxed/simple;
	bh=PZXZV7FSHjLrW/Xjz4hHaW1Kus7p5ylj0H8R79ZSXO8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cYsH2chtpXOD1bQZ8pObGAut3vf9oWVCNnVEvkpPoGqxekm9vQsjXru5QVlcWUzNIBSda5hoAsesL5pKMfNZoJs5I4CSN90pvZuSE7FGS+I8Tc2AGmBMc0i1MFfB3zbUuSyslDIPm1erYOi1rEcQSypf0+v3XQGMWGrpY1d0JVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsEYR77C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsEYR77C"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so49173675e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564607; x=1750169407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
        b=VsEYR77Ck0TXnQEbP3tA1sFGImnHWzecqqlLr95YVslQ99hDOwRgyYplpG7kBDScle
         WDaUqf6iyW7g7xNg1ASrU3q2s7xw7vgAEy3oYNxxPPu4dUIYVjQGlFJwh1rpDTzx0Jt9
         4elTtB4/LJuSmFQCkWBPrt4O2BdAiRh4cwCmi4e9Ab4rooEDlKTsS1RgnlPi+kquib5o
         I5J5wjKXx9FgKQYQVemUD3yJdLgrLwjnoY9GzuO6A3DDons5kaVq6i39w11Lc2WKntM0
         ArEqhssOh0ZS1ua3EkRgMyCkthNxn+ztokG7nqCCTG49QdOL5Qi2urONCQNlwBhFq94V
         asWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564607; x=1750169407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
        b=Yywss1aGj6uHvP7MpF3x6AoB5ENoNjzXSZ6IQKkKu1UApfHmQAJnze8nyXpCkkSIQo
         x1ojwrtYBpH7HEvxw2uyLTuccp70rZegHZI/WiWpb3AvCXp8pzVmz2jWOqR5f2B+zdA1
         /oh2r2ZTkeK977sqOAtzMl+o+Jv8oAnTJBrRqLPkmMzwHY0ObeW+laNquMHa28yKId7i
         W6vuy6LBzZpt14oA8KluzUxY8Uh8kaj6jg4+ufKmnxlwILTED+Tccxtal3Dzp6vF5F/8
         2NrBF64QPYgXItYzIMIfcBoab/wqwuvzYL6ImlQxxy8Eq7w6JKYCFntWsDX0/ld+YwOI
         S4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3e4JmUANZ0+glcYdvbJuUh7tvmCc4siKyJbZvlftHaBNl4e3gTJ8caha33i9KJ7KvQy43CzVuJgsbHjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZOZlE1B3Vfld8h+DISK9j96K5pPw4M7EdXyqsThuqrNVcGO5b
	Xf0ZUFZoE0dvWILu7psamzy+u2VhnVrTtHRQmnhKO3EJqPyMgU4E3AsHYeVHZjiAKSc=
X-Gm-Gg: ASbGncu3mZglqkB1X4lJmpvYJRTyK3GJAIFsdQracO8NlPz5sSTJmP+oCjJYEwDpo4m
	frHBBs5q1hsJIYtn5pb4vRQ+0WY/lfgBktXJ5fNlMO+p+8y9UoM1l9DKXy4P56hlH4hN2lyazW1
	zrhrcPC3kLMNRAeQCYZ1cYTneLZr4wsUrse9vX97EuYaedzAok2tn6wSX+b0UVG1s3I+/LJ7dQg
	4lpJCXRL6XQe0nc4AQS59JsBlF0cZmP2JwEaAdBMlEZ8p96aRX8kMNbt4cquPtIPA/u0C8zLIQu
	RukGUnuWD2blzeEeMTmhOXf6VO7j1ODkb2Yh/N/jnNgRX1VL/RIBkcpcgtBGF98u0/pKPqu0M1g
	0akS/odKl2qKlM1Teximd5tGsbuBTxfEkZuQG
X-Google-Smtp-Source: AGHT+IEkqCEXSbEGN2qKWC1bgGuh0Dpru4IMLoe0WkTjzMUjiyMf9422e97D4rL4Jdk8panjohDk+w==
X-Received: by 2002:a05:600c:4ecf:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4520134088bmr172213265e9.4.1749564607020;
        Tue, 10 Jun 2025 07:10:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b3992sm12497663f8f.35.2025.06.10.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:10:06 -0700 (PDT)
Message-ID: <eb9bd4e4-3032-4f36-94e7-b89ff74bf327@linaro.org>
Date: Tue, 10 Jun 2025 16:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
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
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
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
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   		struct dpu_plane_state *pstate, const struct msm_format *format)
>   {
>   	struct dpu_hw_mixer *lm = mixer->hw_lm;
> -	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	u32 blend_op;
> +	u32 fg_alpha, bg_alpha;
>   
>   	fg_alpha = pstate->base.alpha >> 8;
>   	bg_alpha = 0xff - fg_alpha;
> @@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				       struct dpu_hw_stage_cfg *stage_cfg
>   				      )
>   {
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	enum dpu_sspp sspp_idx;
>   	struct drm_plane_state *state;
>   
> @@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_plane_state *pstate = NULL;
>   	const struct msm_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> -
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(active_fetch, SSPP_MAX);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
