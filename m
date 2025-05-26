Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B41DF99C
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245795; cv=none; b=gbADfZDSYU2SVwTxidZ9V+FX6WaWO+XU9q63dQzRNvQk+VX2TDNfj3T7dRrbZv/AP3ExFdL89jUFEaC10pTrV8MKHZilaUKtNDWromPBL6Xz7gXdrpQmd7pU/YWQvgjpw+sx2fECaVSBoNoqdmbbIXqsL9C9EcWcuntzNmKLeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245795; c=relaxed/simple;
	bh=r3tw+ci1cJWQMLJ1vCQPJY06Tj5BfzJgIqNFwcTNgYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=On0PzRsxEumYaa/b5+LpgutCJyUMerfM442r8I/SFhziAqPeLJ4ghQQHyXiEnJtgbynycyZTd/gBPufOz0VD9+G7e2KbHcqPcqoBUOBHLH1fKRKZ5qnZimpZglatDBsx8sJs+FvfC3lJqnjT35fqnnfty7AlZ2nJPfEL6MazOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLZ5Fe33; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLZ5Fe33"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso14783985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748245791; x=1748850591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOJrJ+WcHdALj8ZK6IlDndbV9NrPe74V0z2ftU80FfI=;
        b=tLZ5Fe33YakRn9EcbenC1hWV17KYJ3ZaUiozjJjuFgUv5yQHgJsKtXQbdKtVlgkCI5
         Rrh6c7AMJmonTOLsRx7/oeOnRDk3U+hCnqnTN0abf+F058dOc8rjsp3MY/WTnItCtNeA
         HY2mLU2/BthjgI8xrmY3A7iQNCw+JvCbR/+3g5Dfyhvczi1sMLKLFElWgOt6Pxw0JsVP
         9Yp+liNrWy40u7KG3Xw6a+kR7qZJVyCSjwC9xWKzkSo+k1tIjslhr+QnkAkHI27zOskN
         523cDvbNc8GMJWkSMDQGEyjydrbmjhD3bz67Gsy5H6YyhrDQ3q/+a+5JMbApD5XrgLno
         tEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245791; x=1748850591;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AOJrJ+WcHdALj8ZK6IlDndbV9NrPe74V0z2ftU80FfI=;
        b=IZ0qjizc7km4Erp3ng/YK8PP6Mvo7rrHMIJlmenpwWBi14/Kvqgp+PdteV5l1A01LW
         WVNnfh2BpSXxTunvrMTGcL3S5Xdgq0GuvzTJOU+t/Q/RG8RPSlaSJq0lr/6JlQBixM6l
         zUs+NY3piW8RqHgzc/chyo3EwxWLWDruvstM0QCyOzkSDeOFKksz0Jqv2x95lMbr8UOv
         eUAN1w3Y2MHstehp/Pc9K/m5A/oUIajrk6i5Y/zGrBQ/ucAn25/AFu5DVwYMtnO5QD6w
         J9yYt3EJ65wyxBqAtYslh7NxAFBggna5vNkMBBev2/rcO2r8w3jHKoME+XohQz6WgRRW
         R1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUcq2VQB+mlI3X8i7wyryum83NKZmkp0mMv8GB7/PvF77B6PN7u03PUVBxNlVevTwhIhIMNfCg2J5c6eIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVfci0TGGdf1c7o41ZgBS/VfYwYQIPK7temDBKXUKgbz4hO43
	HV4X2KLnO/11NTYEef/ONCttBFQD1Wa6WCeJUJS4yB0NHGOxeBJ/+d9ZZAD6bjOoABk=
X-Gm-Gg: ASbGnctaCpZK12mAi4TSx3fsDcbyBmypPL+vEaGSvmaoGfDd4/iGU+CWmxq0n18zptL
	3nUztJE+6WkC5zO/LXsSb8Awonj0yby467KlYxVJ/U3jDwezPkYBmo9/iQTtpUpBnNp3Hz07IdS
	1103vb7ArpCaEIxUn/Fp+SFeZJBkyFflSUHHYUBiikk3G3UUXCZ9O9eqezOV/kA/HUc+3nmZYmj
	aZeloz7NGcpFW4tVvXIXi7Nehos3VrUDh+aXk5pHQWM/5R3Ixzk7y0u0gv7DGYl0cLsZvoqabr2
	OR2tIi60ar6mdlxAxD91JgjuwTKRlZmcxlt8MQazYl/gVYMqEIgbYcE4m+zhytk1seVWo5rymZl
	WPRDadtjqG4WFs32+vI+HK1De6qRc
X-Google-Smtp-Source: AGHT+IE2QRNyeWAqbbRxvo9gVKikVL04vtydrrHrGM1Z/4U24oHBwqOt7h8xJ1Ql9nYZOS5KSXuQDQ==
X-Received: by 2002:a05:6000:26ce:b0:3a4:db49:94ad with SMTP id ffacd0b85a97d-3a4db4996bemr1006829f8f.13.1748245791552;
        Mon, 26 May 2025 00:49:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm234954645e9.14.2025.05.26.00.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:49:51 -0700 (PDT)
Message-ID: <6e2d7c7e-9464-4936-a738-5caf1a363125@linaro.org>
Date: Mon, 26 May 2025 09:49:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/7] phy: phy-snps-eusb2: rename phy_init() clock error
 label
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-4-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> Rename the clock error label which is now used to disable all clocks and
> not just the ref clock on phy_init() errors.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index a799c3d2bcfb..c8f14f8fb9ac 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -474,7 +474,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   	ret = reset_control_assert(phy->phy_reset);
>   	if (ret) {
>   		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ref_clk;
> +		goto disable_clks;
>   	}
>   
>   	usleep_range(100, 150);
> @@ -482,16 +482,16 @@ static int snps_eusb2_hsphy_init(struct phy *p)
>   	ret = reset_control_deassert(phy->phy_reset);
>   	if (ret) {
>   		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ref_clk;
> +		goto disable_clks;
>   	}
>   
>   	ret = phy->data->phy_init(p);
>   	if (ret)
> -		goto disable_ref_clk;
> +		goto disable_clks;
>   
>   	return 0;
>   
> -disable_ref_clk:
> +disable_clks:
>   	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
>   exit_repeater:
>   	phy_exit(phy->repeater);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
