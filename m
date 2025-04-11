Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3127E1CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360360; cv=none; b=NofWm40ASEEfVCJ0cMg2t4Bze7LW44zfcA5d0mQutX4lB1vjV+l0lFxfS2C+fUk1nrhHyl0w00dVBl9kndJXzQf2QwGk6V5THNllWiSvA9oG0WKRaXlTllWifta3GXlUzUrjgYOqMhwEVgpzWXfzVNPg7IYsxfd5IVcKdzWOSLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360360; c=relaxed/simple;
	bh=/aQutnXzQltZbQEMceCxNk9WziiwxNv1wjY53LqLHvs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=odsH+j+SzNunwSftm29IiR8ZTL9K4IT5dg/0I3Av0s4kCwEWsCKleqC0BroKuiz4PtObva9g34p9G70/T64ViC4+1KzXcvjB9Uaab5A7BDJT51mqBLNSdXTNAkRReyVu7B6gN9IhEaLa7sLDPBctVUlkUkJmK5p9bY0bzeDgvFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbG9NOeh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbG9NOeh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so13785985e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360357; x=1744965157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=YbG9NOeh3ebQNtrfEFCBzIhKYIP95Wh74v0nEbxzn8p/oL2P5Gw5a/iXHk3kU/MaJR
         Ra3PPrdO308Xbnk1yCwtlnPcTuBge0D2lw1NPRdWikdByTTqeiZfEfUzfGOQS7oXWaWO
         XucjMe86shug7rVS1e/kNdFT7YVxhQfLTT7iNw3q2ZC++3GS6sAk2RdIuwpNnXFR6cIf
         cNu90DRoUfIAXt6VOb8fn1rx0DVPp/6Hnxx5grzXj7cWUMOQG9eGEzvLcvDeNGQBCGA5
         0/LoVCyB7lf6LVdbBAlKXwwhrep/Xeg2iu6ZhdH38aCS8sQzts8C1WxRD4CK84XJXgV6
         RYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360357; x=1744965157;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=bD7HlVZ/O3cuPqa9jzjpzc20lyq77rN9ODdfxvS3lZrCVBKF2k6qZ/qAuAp0g808cE
         anQbpvFdERFdWDMYvU1SRl/n0poU6KrljiXfHzTcJPeJm52T011/JtDtp2neuM6BDxPq
         ZdhJiqG/2XqY2hADNSNcdj7eTh/P/Lyey/uBpYUPp4WeVOuJJqyEE91ijbQsZlsPHf7+
         j7cq4mAyf6FCffIUysRiZwhjXBj+dlqljEfpaE5oc+G7Z/vObrfjElhKkhNXhLbMsxta
         h02Mj1UUe5svzInpdmDPzVtXwyAdBppqvcRXkL5Lv0FbthrK/Ar495umXeJc7gcrjho3
         wKdg==
X-Forwarded-Encrypted: i=1; AJvYcCWzRHHAULPghsdQzFmOf7kLKIYMzGQDUW2ooVhdAEWexTOu/0v2w2WnrtK6Uk+fC4TxnMPSvruOz5uqS/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3AWPvPuhQHiX0sjL+N1E63Zvxyf8S/VpaOI0sz/pUQOu1aCFi
	/07JEmOW2k7uQiHZTsWBiG5q4P2vSIKF3aVdXiXMqbShqdiizZ6ujW7Cs4oCKmQ=
X-Gm-Gg: ASbGncvsq8gVyVPoRF8UiLRRqPD+CUEkOZq2QI25Gs9eAAQddlYmyxbsUwbh89Err0i
	Lq1r7iEMhkSCogTebdrB5oaqoxme+tPuc0oF3wtSVAPue35hUrl9K5IslGTADPwRXlaAGXwhr6b
	xVW47C0uy8q0y+ifKBix6s2+onMPFjpSdcTpXSS8joVICHk3+FGu13lr4+VqtgVS4eEzlYFY1qe
	Nlwu7uaWR4lKcN6bEVrIHmbA/Fp+yW4Znkaq/KPg9+jIrwbAdApAzI0PyJ35OjBi9g6CUr/ZzYm
	q6pr06rhuQ7DJHvJEAvI6/E+qkG3QupJYh2q3Sih0QXpn4z4F7qkX2dkp64mwQT3USHS6/ik4g4
	WMSOcRVz9Ujb+3k1P7g==
X-Google-Smtp-Source: AGHT+IFUbDwr+dUTvC67ZJxa+UMe9UcTiY3kMIzVR47Og8ohlxwGVWTRBoL9btY+9GZISqqXHtjb3w==
X-Received: by 2002:a05:6000:1a8a:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39eaaec7b91mr1244633f8f.42.1744360357266;
        Fri, 11 Apr 2025 01:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:36 -0700 (PDT)
Message-ID: <3d64a7ba-3bf1-4fa7-a1f1-b6fb2bfecfa7@linaro.org>
Date: Fri, 11 Apr 2025 10:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error
 handling with dev_err_probe()
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
 <20250410133332.294556-3-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 0e0b5c00b676f..66bf0b7ef8ed3 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -339,13 +339,9 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
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
>   	phy_set_bus_width(phy, 8);
>   	phy_set_drvdata(phy, priv);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
