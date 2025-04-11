Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66221296171
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360380; cv=none; b=ZYtJpxSEXK2gcYlsxsb1/G5bwbb2ceUGO+L+Fg+1hDbv1z2Ld4rKo0Qu/ZU8N2G6uFfuCkOLCDgdWVXb6tdgL/5wLaC1/XiWqXyO/BGiYxG3WDVkn2Q4qT9nOBW/ZhLA/zptVg50J9+Pcj7dsZH7vGHB0ZQnEhAbzqEHtgQ4lHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360380; c=relaxed/simple;
	bh=3LcopmI3mKFYwkhU4wqrjwgtrhm3kXCRyBZ2qL7V10E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=s4q+XlnJeri9ArqmcN9ANG7Zio0u6f1Tyd1421FdAdPpqAepW4iiokUO/1+4EHzIUT8l/zvg3z2onDyEUDCJv9DQRdEySOG3Lq4SSbSczjTOYRUhQON9UkynYARX6yP48mOOQsEDURKmJgGiqksn7mvuVCmK35HkwLWtSG+2Zyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aY2ZjH8f; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aY2ZjH8f"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc4577so920820f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360376; x=1744965176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSanJ7iQqFkDAT7N/R6RJIht4vmzcKXzsOruL2cJuA=;
        b=aY2ZjH8f1ozBUiQ/QXXMxDPD1ChAyQKMgrSLrFPaZvxf+xGQo8a8Lxd8jJnD5O3G9e
         eskLO/daE7CIoKMt5PKukN3SJ2WEpNyKbEG84KfdPqCK8maaY5Vo3YTIOdFQWrjwKuUK
         D7facXGuBbwqRv09p3WrEG9Hc4+mNvSorPnlMq+KSb2vA4DvE5nyhWZVZ3ysz5Zd+Vka
         L1Ye9vVhfBOHkphg2rvhiyUm+bcKLOguo0aV00FV7NZ+Dl86I1iJQLsJzQd3fe43SIyP
         EkhVW3U4XTw7LnrwFPKAf/377g1wTIvGVhJOcDVTPr6s9CnvH4SQVuRZeM8I2dvq+rOq
         3NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360376; x=1744965176;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kZSanJ7iQqFkDAT7N/R6RJIht4vmzcKXzsOruL2cJuA=;
        b=W/qCTmw1pBUQ4mIFdLktIwldygyk62ajx254HJJhdNrwG9S3qJxy5R7OZD9Z7WMBcX
         r7nn11+fpzKRJGIjwHTWCXC95y0FC4uJcd+1wLjTyu+GzJqNge2+0Y3phYBsCTeIveDB
         Fiq1Z6G6Ifa0+0Um4KQPzdIFGPEiEF9vaDesE9sbmfwu8CqI12pLb4XHjVGlJOPxL5dS
         1+7jNiNqJ4hKjvFuoTUFvJkBmasb0+SyIHxW8+v37WtqU3VEupYTS+zLrLZcgS2StT/P
         AbvGvvrSORrWym7s5UyqUvL1GQkt8inHrxeXEWEbb/BtAFHRB4RYys2/nYfHy4SK6lvs
         ilpg==
X-Forwarded-Encrypted: i=1; AJvYcCUCXWS24E/Z7lWniMPSQCPNTjJQFhCSWd4YCY0v2OhqhKxB51MpqkNmKYDysletdyGyht09MvGSqUkl/K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LuC6Zt8ALpZ83nhIB7F3431PzomSUk8KzbSgIJK6VPZab6do
	3FUp33sQR+fWjJ1kPzuiH8VGh0RrzqYBaoRaij0w2mWVdAwwh6gbATEkTLT+ig0=
X-Gm-Gg: ASbGnctb1P0CODl3JBRCR42yodMiVVNqLpOjJSl8dRe6n/xjH+nevPUd/jd3JRoVqjR
	oZrA9hyirjCoOW/QHKsXcFCvfyIDkUNjwGutKGESNS4djUedff2YgoDHEPnIMQQVMfhzA0GlOvV
	CVT6SWpRCQeiA07zfhtNj2bRKWBrR8mO3d5Xyz72SnmgrYHbeGrvErbhi3wqcT7RH2QSIKUHmyF
	+BVsdGgRCCSNXTFV/A0U/qlmsEEMd9qhQsdsBsucwqH3K20a5t1IEYVC31Dne/vvm3Cy5yFB/gS
	NVNZFGUUAppa/IRckfR6yGVTo69sbSUkx/BjMqtigyZh3J/Du6/rVWlUAPeS2vQ+WFTZ0FMVfXm
	z270VDg4WTfCwS8WJcg==
X-Google-Smtp-Source: AGHT+IESUznTZ2n4XVtcjPJCVmr0eQyeDF65o+HShMPgDvAAkIvnxepbxU/WEqcRhEcANAnPMJQR5Q==
X-Received: by 2002:a05:6000:2ca:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-39ea51eede3mr1406485f8f.12.1744360376608;
        Fri, 11 Apr 2025 01:32:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979835sm1328253f8f.57.2025.04.11.01.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:56 -0700 (PDT)
Message-ID: <808d2fb4-4511-448e-81e9-52319fdc8673@linaro.org>
Date: Fri, 11 Apr 2025 10:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error
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
 <20250410133332.294556-6-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-6-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 60be5cdc600b3..54baf7b8930e1 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -131,19 +131,15 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	struct phy_axg_pcie_priv *priv;
>   	struct device_node *np = dev->of_node;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   
>   	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
> -	if (IS_ERR(priv->phy)) {
> -		ret = PTR_ERR(priv->phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to create PHY\n");
> -		return ret;
> -	}
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create PHY\n");
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
