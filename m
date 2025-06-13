Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B572580D1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805756; cv=none; b=Q906Aj31hEab4f0CjiL0ik4I3cRWRhPHbzXTpqvTjgciWF5kzzbS0x8/2rgF8hRPn1uR5W+cODU46A5vHC/PdM01Dw6P2MzdyO0XdyGGdeNgMF/Q+bY+JEDXbhhEHl2gwagaf+hAT65XuYVWK9f4aICh8V8RQqpcBPvrl+wbdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805756; c=relaxed/simple;
	bh=zTpSB35lCUrLO+Dj96pmKmnQxvXE7tUPyQHTh6DLhXc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O/WDbhCU5f9vwgPcm7mG1Ojnw4egyOcCJEOgJalgkV23JSxDeRaSxnPfWirSZjAfZc6DbnF+sWVmvOeM0RJRHIUGpTSBnu4956fA33l0nhgL6CAb3ibm5t20CuBHz0faXctQuYbrbbsL3fAA/XNvdmD2jfixBf4XBsqVQcpEzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GRvfkK/a; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GRvfkK/a"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450dd065828so15005925e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805752; x=1750410552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXQlUz8NH4RKs5YhzNOm8OertaH0oxCLEbwOpHRFPsA=;
        b=GRvfkK/aRCCKbr6uU/fqFgDQq0eU/wo7p3ScjXFK/cdo3FC88qgu44QKCPYT25NMum
         I7l+IyeL7qcC1Ux6aMQRZGwYCNFNE8lmjsNDQM2hOPL4IZZximIgmXE/tLvfjF/QsWDO
         0DE00lKF93xfsVO/7L6vMA8iXtjW6GFqWxPrFB3iDueQ3jJaMJ+VIXBAp60qaRClw+8X
         JlmdWzTTmtWHEnOT6f1KkuDN9g/8osajOm4Z3YFAmLw4s4/rupE6sGy+Fz4WwK/HXcez
         DK+ezl9RsAKJlMXSvS5bqa+qbVUn+owdOjraYZtwmH9prCuAli5MQxQSISVSwJidKzuP
         C0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805752; x=1750410552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CXQlUz8NH4RKs5YhzNOm8OertaH0oxCLEbwOpHRFPsA=;
        b=HvP4b+FuJoDYPgPebV/GDbBKdD1nW0G3GNg3anG8isxY2nZokhG6llx3RnfnCyKddS
         6LUQHFt9S+MSWqfQFznIh6TAumqKyFcayF5lfQ6RZOLNB7bNK1QGJ+AMeOcb0JoO/MxB
         OM4iC8Pr/EupLV0T6XaxTxKsjYOnexUB1EHeY1QclGuvW2GjT/ow/D32bDl/gbIelbw5
         zEmOrRRwD5MUaqRsV1W0/pKhd8jT/zqfOGqXrHjnZtAXomGgyBB1gNCtphrkc9ELP6Yf
         wwuXQhD1Wt8BWS9W9gbP5AtFnT/OyFqD3TU3rBWzio5NdZUyIbPQeVUGa5RgE1DCK5iX
         BniA==
X-Forwarded-Encrypted: i=1; AJvYcCWcpArV5RKKGRfTE7T/ab4YhcNStE8icxW8xcjMuK0d2B+svslyjSRqgkPxjTviTpOfrBGqfnoLwij6uzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKnlfffiG/Qm5+RvWB9CMGo+IOoqa3hN49Bjl9wLwxCpIZpCz
	Extz3ND4qtRfqfCpzQ+tAKTB9QVdbXM83KP2q+PARkL0qwDXAE2Kb7DSaAaXDA9jjIw=
X-Gm-Gg: ASbGncvVeSMD2S9LmclA2HwL/Q/dvVxWpuyMjWhAccpBZnSnCb6r/oSrT46lTw3SUZW
	0cr4uqvYEGE1JSG+vvXwgidCugz5pkdYx/RDsbwuEBIdZfkyBEhbF1FLM1KL43KBP8/Ejwqn1sW
	V6Y5KHEw8txCrj0o0YcF+j3xOHOswKJ7RI3YCFZ1f3XH5jBfUjSufQqElKxf3WEmKLTwbM5wR6X
	D70TsW6qSDlctQWIwwXx05DdoodjBxQtFpxkY0EGDREsKwO/yU3jdyyQdXK99C17cGFeFLNBaMM
	XXrNk4sExM7KmomVpiCzxnH+LaLAnUn3fP5yILfQBelQkDXCmJLiVx+4dUgwP32teEYmhaxeDQd
	2G0JYU32u8lTSqnXPQ4FheppfTG5LoihQxKZAO1U=
X-Google-Smtp-Source: AGHT+IHW3acdKxXcnJh3SLcMaiIZuM+wugqUJyJT7+OattxaekXRGEooYT12PSs+GLWZGdwtC7vsrA==
X-Received: by 2002:a05:600c:1c19:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4533499db1emr23920095e9.0.1749805752222;
        Fri, 13 Jun 2025 02:09:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm45570775e9.10.2025.06.13.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:09:11 -0700 (PDT)
Message-ID: <8e52fe1c-0c06-4e19-8552-ad3985ef8818@linaro.org>
Date: Fri, 13 Jun 2025 11:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
 <20250613055613.866909-3-pritam.sutar@samsung.com>
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
In-Reply-To: <20250613055613.866909-3-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

s/exyons5/exynos5/ in subject

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support only UTMI+ port for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> The combo phy support is out of scope of this commit.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0..15965b4c6f78 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,28 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> +	.init		= exynos850_usbdrd_phy_init,
> +	.exit		= exynos850_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynos850_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
>   	{
>   		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -2228,6 +2250,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usbdrd-phy",
> +		.data = &exynosautov920_usbdrd_phy
>   	},
>   	{ },
>   };

Looks fine, with the subject fix:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
