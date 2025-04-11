Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B10189B84
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360389; cv=none; b=KAgyIECpZX6jxVEc62IYUkreAreH4MDMpwhAZobWC0E2JjbERac1i8JhVcQmFVVSjL9WhemlWJ/Omu0zL437JOivs/hv/0mP4dvGjfR9XulDQe1KJTSlkdA9myYPbUb8TOkq1bKPitajlelWyrswNkVXOBnIFZTV1RpROMMShjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360389; c=relaxed/simple;
	bh=HAyZGybeCz9h4PHTXPASf1dhJui7CR5lGJo26SGl6OY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=tTlr/xyduAEzOt5FV2CN8QZ9+0m5KLiX7FHe++AYCPlaCmED6VMs7M3AsYjRBMIaqzSGHsjX1KEW6Qq8A8iAKHjjx1nn+35nAy6nk0YfifigVXbY0VDjRjSdH7MEw8DUKBp588cawW5iv31bA0WZKP9tjVCgQcCEyA73ESoB+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPhmyjQl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPhmyjQl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f2f391864so915412f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360386; x=1744965186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK9rCz5R2JGRLR/abCueMGVjM/KpF6kJW3tcRtlcRvM=;
        b=RPhmyjQlEM7vEt3UFiTQeq9JUAnrUaUukHi29lorlFV/v5euOVMMFTtUPTjQMq4wzq
         1Q6cBdyPE++pORxWl0p4/uGo5HofL4Zc/ybhP3X5delV67sySCq0xftDHxgHByEL8FSF
         38fEC9E0suqJ/2DAx2J4gYYhr06JtSlTCK/GRQctKFNm+Z3YZWQTbdAPDFoixhfgX6QO
         pWdewkDqi8j+crVd9iYmo+4uM8USVWwkMtCCPSloQf8cH/CxnQbD73QiR0GeU67oYJhk
         At467oC1cEyOGKQKtrQj5N71f6pw0DKZrqrEkVIKpKnOORYfE6twpz0vuiZzRsJR01d9
         o2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360386; x=1744965186;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EK9rCz5R2JGRLR/abCueMGVjM/KpF6kJW3tcRtlcRvM=;
        b=phpH4yi/w3ktqXAJwi9PFA1QVEiO7fWxoSCyFIIKxh2GIOmB5FqVnwVbD685qkG4dR
         Y2x55CzJ6G8BLZUdjoSX2DwGQDnEejswJl83u/LhJQlvX7AY3E4XAxdC51V3RNu8ILkt
         gtRZVqUDsU/XNC70faWnZU6x4LQuZ+LXsxJR4QkDOc9nQd9m/YqpabYyCE9a7AdxIfPw
         bHcxMdQb+ozYWezY8/17zCXaQvWPQUYWc7ySP5YUcq7iPWPWt0lyKbL6PbRrdBxu9yYn
         3HTphp5WXDj7pWMj8kZN7AYqfMFLMipR4yy8YCEN4bG1hKkqwNyoY4rIUTXqHoKlFkVo
         l4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+C4cLkRPuh6srlZY7eesMXk7m/KOBT0AaMNta9p5UnmuPtWm7fXcP4T2zqpBXUKtBISOlisSez97GRT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0RBPNtHCS9c1cS7Xw+4pWpescOjtoRb8MWG+hKyqFs8Zulv+
	7inu4+0Z0Gp6DwyD5ehjqgjdcjzMIJv/aHX4ElSb2+Jnbll2K8ZH7Ndw4mcnWo0=
X-Gm-Gg: ASbGncubWrBuUMNVCBi5/JjoFclUoqtieKfWmaEQ8NFRLZNeeP196IkEd4RS55WhpDd
	s+LMMZln1ABheK9jnQg2R8OAGtt6dHFJW7VJwnDCQVSE6xbVaTchuplrWJVxkjwRRWPbtL9BPMH
	YM3p+Bhiq23QCpdVcU2e96hei6vgmcw5tEaQqNsxpX3exal62G300LeDZ2KtKEaGUry4aUsthGm
	fBW4WDLAV7mBfWCPAtrpzjNuDkxcgFnV/a1KtTD66urWUSE0Rpbdyw/pW0JlmMboaPcafrQUddu
	aojHiBr+Qt6Sctl1u/2Nw4TkunNRZyTjbFy/RqKusaX0T8QyhqSsu37c5csUVA0jF5lkV2B9P83
	95NGru22VcTuTdMd/8A==
X-Google-Smtp-Source: AGHT+IHlLQ8VnWkMNxW6NJ/2XfY1PSwDp+GZZTngXF4ukLUEAUWIscJaYqmOWxV7FEHDv1xafn6WCA==
X-Received: by 2002:a05:6000:144b:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39eaaed2b6fmr1302713f8f.53.1744360385924;
        Fri, 11 Apr 2025 01:33:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c074sm1290725f8f.28.2025.04.11.01.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:33:05 -0700 (PDT)
Message-ID: <8e8aff0f-36cf-42cf-88a4-a9e3a646b73b@linaro.org>
Date: Fri, 11 Apr 2025 10:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation
 order in axg-pcie probe
To: Anand Moon <linux.amoon@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
 <20250410133332.294556-7-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-7-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Reorder the PHY creation in the axg-pcie probe function to ensure all
> the resource is mapped before creating the PHY. This change addresses
> the issue where the PHY creation was attempted before
> mapping the necessary resources, potentially causing failures.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 54baf7b8930e1..14dee73f9cb57 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -136,11 +136,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	if (!priv)
>   		return -ENOMEM;
>   
> -	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
> -	if (IS_ERR(priv->phy))
> -		return dev_err_probe(dev, PTR_ERR(priv->phy),
> -				     "failed to create PHY\n");
> -
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
> @@ -158,6 +153,11 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->analog))
>   		return PTR_ERR(priv->analog);
>   
> +	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create PHY\n");
> +
>   	phy_set_drvdata(priv->phy, priv);
>   	dev_set_drvdata(dev, priv);
>   	pphy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
