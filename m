Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF9296171
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360372; cv=none; b=ByuoSZFeZaU3rhdO9pas9jWkyabm7p3eHk/iPtygSnPnjGNSSi8DGXLDGoyKdMM3zR/jvW0+GYpjAdlZkC8Jx3iX0+MmbaydRma3oAjQMM9tnhPGCECwdC/U5iDIGb34AXBITpzEvAK+Xdf5P0JvkYH0zzk5/D+WjUiYZzvFiPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360372; c=relaxed/simple;
	bh=9RZerGKG8SO4VX0D3J4UbqtxBn8WW5UyyhMDSi2tpkc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=F2WWaJ/auA2M7Esi4jPS+ajLguhveEYs2cIoGdZBcGuAO3+kWQRuV3EphN+ME0Kf1IFE+qxOI8B8dLp+lLdoJXXooBJyLRkxR8svhYGuvAH1WzKMPHTOqSWnz8ODRp3aZVPZxYvsOAN9nWTKYAd3QQA0BRod1PTxmASCSYcE8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwQuAU2L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwQuAU2L"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso18173945e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360369; x=1744965169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbVkeLK39LFwQz4RDz6whx6Ldo7wvDT7KsOAIVNVIN0=;
        b=BwQuAU2LFJdSLjxr+UKdEeeOSxh6Z1RlBlpGYZXB7vG+8Kw4LCAjRVg81/yuikhh4q
         4boXu/D6Z6/OZ205N6qAkxN/E6P82fAlHZAdoYn/BO1iBP+0poeIIO6z+Oj0oz5uxS2Z
         70t9KHkXfVhQK202iah+YRrZTXiDDr1UCGfzqhOXuiRgWq+hKjnlSQ6mZKwzISNrZ9lA
         pbrDfxLl8dH9b9remAe73nSxl3+kuT5HhPFCTcsZgiZ/WHNkv0HpgNKz+Thzda9kTywA
         e/iXCg4Dqmclxa8rp8MQTPQT4U5cNtqK7RKfoF5cqIkr6go5+DKNVh9etc0kC4oRmHAU
         jlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360369; x=1744965169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IbVkeLK39LFwQz4RDz6whx6Ldo7wvDT7KsOAIVNVIN0=;
        b=JQbQVWmFpoTLXRdZvXz0EgA6nFD1L6j7IfZHqX+WjqrkU34zIRULgUIzL4QOxLQgOG
         72ElS3ZXk8Lwpq6QqIxgckuwSuIjGYK3UOVBE7R10P6BwXFboEimsUxvm2Iqq4FqpIaS
         aXhIeMrU8cXXedIWKrLj0veWLkzkULyjCqBbSdkD6XdPhPF4glaj26z79+dPbeZVJsKf
         zEsOJatYkGrwnlibOnh6cn7D+VFV5EWMYQ+jALE1qxNi3skJZvkvy7OE55y+dIiR2UTH
         YEFE3hGbUjouMjno+C4x5bEkVK5ifHkVaoqAPU6b6RSDFWHNvJip/DX6mkc2bgYG3QOI
         62kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeQw1FRo/yDid2Q5SfE6jQ9wUY/v46QZlc+2Vao2mywqUc3BpMARL8JKz4q26wkk8tg/T7jqCTFMY/+qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAazjOEEMl1pRyr8RRZiuKj5j/rZFZQ/9zZDcQhlloQoB8ZX8k
	T1vop3jhTHdLJL2J1TMiKd15OnB43kI/z9C4Ar/Wagw5oZxk6cZIxkaH10O8Ruc=
X-Gm-Gg: ASbGncsx0h2iAXLDdvIOlSixqNvInKC7SeUxIDHiYUTdnk1HD/y8Vv5FxTmFRvciQxB
	jKM+G09pND8dCkVcF9wPxQJDFCOs47jTnYVGflX10jXNelCwzS0CfZJ+jmt61pImtpJ1o3mdg3b
	4eVKBSsGNKKyYVzWJndR6kJzvYVYUjsl77dI2ojF0Xzi7Ho2lrKvZUOeTt7n5aG/IGELBhNbaf8
	Wc/1E0+rPVbw28O91jzh7a/kJHPWFbAQH+EAKlIAnNEc97gn+X8jInLYzlTNvXRT2heu4yrhxYY
	PDSHls87+sIHzYG7M4AxJXtKZhATBbrzogsrH1/PFgIkm+febJyjnwsSrQ6LBUM3GTIcxMD1Dub
	m1JZJkjUqgmuDr+aFRQ==
X-Google-Smtp-Source: AGHT+IGH2fzidsFm+EDJBudyWzrKTJzkhwFaqOYPlAnwX3LCJSEq7mJu+xZyf3CKma7vYDj28bKAxQ==
X-Received: by 2002:a05:600c:5008:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43f3a9aa623mr13734005e9.23.1744360369350;
        Fri, 11 Apr 2025 01:32:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:49 -0700 (PDT)
Message-ID: <fc00e007-3248-4b4b-a6e0-2f362b0ae996@linaro.org>
Date: Fri, 11 Apr 2025 10:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 4/6] phy: amlogic: phy-meson-axg-mipi-dphy: Simplify
 error handling with dev_err_probe()
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
 <20250410133332.294556-5-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-5-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> index 08a86962d9492..c4a56b9d32897 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> @@ -377,13 +377,9 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_axg_mipi_dphy_ops);
> -	if (IS_ERR(phy)) {
> -		ret = PTR_ERR(phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to create PHY\n");
> -
> -		return ret;
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "failed to create PHY\n");
>   
>   	phy_set_drvdata(phy, priv);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
