Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FB2BEFF2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846152; cv=none; b=qsFO5HW1PAAypjCD0/zqOaRf0B9jb/1x2x4tWWucoDy5YmRz6Np2ZLgS2iuhEzYf+XHh+Lbur9iKryktD+jcZM89A2aTUs4lTL5lcrysz5sy7khD+OE6F9pcExgMqgDK429YP4IiKVJ8DIx9nTXv6wVkXxgdZuMdrMRKkPT6JSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846152; c=relaxed/simple;
	bh=+b9zYn+YDjgLsmryvBl9enpC15lgjBxwjtFuR9w5viU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=olcbUl9Ei2hs04RXJq3THBwu7Z5orXf2yt28hWt00Ml5NB3tyStS1lJ8/R/OapSIs8KC4z2Uv6XChIFStYPJav3eFuNctoNkAz5310uX+jkFMT/GuSFBF3HvGp2oMyXu+X1UKhUELldTZPiIEosZhkRamUh1QiAWQB8pVuOKfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X/LrXKFY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/LrXKFY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so57450405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846149; x=1751450949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qneQjY3X2Jd798VANcewut/m2Zfu0vnaEkQ6ercd+fI=;
        b=X/LrXKFYapYihJCfYS/pUegA8azbNHtvE24vseQoTN2LbL0J2G9yC8TX9CJoe7PB55
         9SD76BFXTlW7cyEMXf7ei6RcqKeAbZatDu84M5iZ7duKxx7yM1Mt+pCxlx+R498NQXyn
         nsaTb+ua3vudSIQa1Xr/1NSWoURaX8LzWxeB7l8pFE+TninSgUJJ2MDh8OX44EIIayLe
         REPpN2+K1fDDQkT9cbqsQshemvCNKYA2q4X0F3dc4elsGJ1PRCRTk26TAS0oBVUuIxsc
         OwUkSXb1h+qilj6vwhAcDhfsqFKLMPmUvNwSj8+etQH59/jHUEMMMEOrtsnPjS1hZjiB
         eAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846149; x=1751450949;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qneQjY3X2Jd798VANcewut/m2Zfu0vnaEkQ6ercd+fI=;
        b=ZVh3Ar4S3t9karO67y5WBhWPy4kf7hdIHmPnxC3yJFoSdUZiC4teHOEYI9g6WVCKxK
         m77N+mQw0RqGO0sFsqQWD1kqnyF1Y8kcM6XDG//xEANColvKMtmgdyh4RnudDiWJfeP1
         s9GwHIlQxQTydunXpHkdindIdDpSs3nJ2oj8K9Fwd1VC6AbvszaQqFR8ETPE9GQbilSj
         T5Bre/CG0HG+WKI5fLqh05yqq8vZ74QpqA6eEoHjmjdsVi3TO0t8Nkr+c1ClmMcjmTlp
         SFMn1BmMWbG7tOVS/5qkd7ZpCJkD6kMekNX/c+9xq2sKdwhiSG9niu9uJms9FuDLCzhM
         eo+w==
X-Forwarded-Encrypted: i=1; AJvYcCXH9gy654eSrJeoQMQMQFIj44QtrtY8eoJOf4XZo3QmecsqFy28ga39LERzjMGDlJWjGoWlxVNHJa/xdpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BTY3vt41jP/lQlXMhESOmsJtQ4NdJv3COpNEoOCRO2NLWDoy
	NcAynGRLD+NCaGY6WfcDIbwDwUEFRPgY5+DkzMwSRp7Nnw3u45NCu5lTbrG1Rn+DN0E=
X-Gm-Gg: ASbGncsYIGPHvYwKk+z6EHqbz585NVb+dcjO90SqS2DXbxAwaB7l5bLuKI4VqT4o9E2
	l3YKXbBQ8WR5lol8wjesAo6p5eoO1gIAFzcBKs+ovDifQXssdli4/3Xgn/wWA8oo5gkY/0c9NzX
	lxrHZWS1S2+eVWuRjIAq20D555/Dw9w+Ij/vBwKfh/4RG/cmS+DhpB36u4a2BZShPTwdeU2ctnv
	/MSb3FDSNpJmKa9/8aMSqVpX4CusDD6H4nyI/GoMf9KoMV8evcKMM43h3LLrZB7t1Xj0auhpQx4
	bQ3o8NXwAA0QZWDVi5AFQwsp5AOY4B8M1m/VBpx1jvUuATF41TE8stNSUGp5vbrQglzw0LUy2uT
	zVfzbKt22lZIWvpYclfRrvBBpyJ8hW2jZDm27
X-Google-Smtp-Source: AGHT+IHnmTs+UY1GFEyjpH83eIaDxqFLZZxp8pZ7AF1bA5Pj3W8QC4Vs1NPzVLgo390Ifg/6DfCTDQ==
X-Received: by 2002:a05:600c:34d5:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-45381aa54a4mr19922005e9.6.1750846148895;
        Wed, 25 Jun 2025 03:09:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c42e1sm14946555e9.37.2025.06.25.03.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:09:08 -0700 (PDT)
Message-ID: <052364dd-743f-471b-b420-c9cd6bbc207c@linaro.org>
Date: Wed, 25 Jun 2025 12:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
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
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:14, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 61594739e5b12706775622e1f76af6ad5d2d29bf..3d4cdc4c18becd8efd5015e698b836ad4d7cf18c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -82,6 +82,14 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
>   	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
>   };
>   
> +static const struct eusb2_repeater_cfg pmiv0104_eusb2_cfg = {
> +	/* No PMIC-specific init sequence, only board level tuning via DT */
> +	.init_tbl	= (struct eusb2_repeater_init_tbl_reg[]) {},
> +	.init_tbl_num	= 0,
> +	.vreg_list	= pm8550b_vreg_l,
> +	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
> +};
> +
>   static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
>   	.init_tbl	= smb2360_init_tbl,
>   	.init_tbl_num	= ARRAY_SIZE(smb2360_init_tbl),
> @@ -264,6 +272,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
>   		.compatible = "qcom,pm8550b-eusb2-repeater",
>   		.data = &pm8550b_eusb2_cfg,
>   	},
> +	{
> +		.compatible = "qcom,pmiv0104-eusb2-repeater",
> +		.data = &pmiv0104_eusb2_cfg,
> +	},
>   	{
>   		.compatible = "qcom,smb2360-eusb2-repeater",
>   		.data = &smb2360_eusb2_cfg,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
