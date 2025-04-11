Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC99296152
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360366; cv=none; b=NzZV1Vd6OwdwS8hGYOfdgFTObh4WX3z2k0UzUTXxGvMMuk89ZAps8nMBDgNMPbtoK6or55I5TJ4uvZqpVCYh3PJQVElFPCSROkuXaKXy/NPTyS81KLo1iEFFMrCMZdnGIM6BSpkz7Dxv26xt02rp8TabXGv6rrjs920OK9/XsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360366; c=relaxed/simple;
	bh=cZNZnuOar+e9KFfW2OkBZ1oV/DKPYifb3BNK6w3UWk4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=CSGkz+0iPoCswdZGCbF8xWYRQJ3sFLzhJXfJCQdNlN5/SGmHc4nhHjKvIQQRyw0sx8RZBWXvc0T1pE2zJfUIapLdH9EhxFHXOWJtEzRZR++MWWqgas/OxUwy5TDKRmjNrgFKo6fn0f8eQ5bBJx/X3nzcCyn6L3Hk+k1l2I8HY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+KEaD7K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+KEaD7K"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso17742505e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360363; x=1744965163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqY4hSJTXleEE1pz/7Bi05zwmg/nHE6Bf0rPkLEdWGw=;
        b=D+KEaD7KIubMLgI8SB7allrx0N/SDkxMADPBCpihcaZkiTtlPJ1QX8HeAUL/L2O2d7
         NPiNFYtpBL9+0yZVx4YcUCjXgUiKVCHq934iwU4c1I0UtxWqqznqykNnO7xBDmtmPhHw
         ElVgHeWaULMDLFB9napGc5/ugAKoKj9/PuDEhbw0Hgn0hlmiKLw8VMu4utbaLrjP428h
         txI/NSgA3H5hXxg26VIC9vnulWX8Xr5G8wlGFqJxtr5R+rSZy5RieCHAZqHjjFZ1DOzm
         ud1WToNvuG99GgnrwTK8KybCFkKdwxs4zhwOuf3S9riBIaN8psryGLInDAr9ByoQ0LKI
         PYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360363; x=1744965163;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqY4hSJTXleEE1pz/7Bi05zwmg/nHE6Bf0rPkLEdWGw=;
        b=fwdOO48HDQauMmUPI/kyIFPXlMTCZI1a8aB2uNYJNNhRKLCnA17Y4Ja8GE7rh5mghq
         1gjNrH2z5y0eSS8H9AS0XNJP8RhaI5T9Qq5wWGcMRB3GI/4gs4TBg4czky5mmIMmjIzT
         p8tq0zuMEpWzAexlccR/1cCkG/Xu0FNyAOWdu49wvPqf2Q6zTyJsCvBrIxVvboPg2saP
         /iS66+LmbDUNsn/fiuONaaCeeyY9vFlbKVfMzoZnwcSGHLWukkN7O5DzEy6WFNKYYQpC
         vbcEDIt9WZL2kjwSMFAwNsscz1tCtZr99eagk54ndwRXW8gdnt4zIrUx3FybaasFL0/+
         KUHA==
X-Forwarded-Encrypted: i=1; AJvYcCW+sD3HRbjyw+Ji9vKDYuTlktojXgEkb2347Qt4sjgbXUKRX4HQT2AloHZ6c9zoqw4GdpNi3JRtuqgECN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgGa6bljXejYvp6aRNW/JEuIuUBXpDS29Ixs9TkoXQhrklJDER
	A29tlpeRx3v2TpKXQ/hd+abyf0UHymKJ3Oz8PuN0RJccSleLp0JLIWZjv5PMxsA=
X-Gm-Gg: ASbGnctVqSFXdqBHogro6kwlX7o/UWlFykvTlbLYWM6YHJwrY6dq+K/9NJmYkurCraO
	SluXmb75za0UFHOO1f8Y1ESAsDufg+29gwvS5AwPzKVpIENHtzkpD/9mLPQiC3q7r0pk5VvpY5b
	5qG/SUQt973RLb2qr5tklOikXRj/0sD5ZSKxqljSnvz4TxZSzZ9FjS/YOcO/9Wm34yRhKSm670V
	49k68fN64CixAYOuhcAbmsEZhcclpejiNQkfkRsnMXU93j/XS9Apj6DbQgD98HyIuQYjgvxyEZi
	WvUoU+7ZkectMSkhm36d0v3LIQQHw3ydPUjPG5tGp7gMZorIA5WBhclkv21CWsldOtyRmAZbCkS
	1R/JQ3H7eI2x0LOgvXQ==
X-Google-Smtp-Source: AGHT+IFbIZHLwiFcr56HmOrCgzLC1RMK5T2F6MjZ5bzHBQpsQ3xTezUFx3R0z93GsoU8XdzOaPimXQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43f3a9beb77mr15610705e9.27.1744360362941;
        Fri, 11 Apr 2025 01:32:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:42 -0700 (PDT)
Message-ID: <3b62ab93-a1f8-4bc7-99a9-45ef3d18c562@linaro.org>
Date: Fri, 11 Apr 2025 10:32:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog:
 Simplify error handling with dev_err_probe()
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
 <20250410133332.294556-4-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-4-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> index ae898f93f97b2..c0ba2852dbb8e 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> @@ -200,7 +200,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   	struct phy_axg_mipi_pcie_analog_priv *priv;
>   	struct device_node *np = dev->of_node, *parent_np;
>   	struct regmap *map;
> -	int ret;
>   
>   	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -219,12 +218,9 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   	priv->regmap = map;
>   
>   	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
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
>   	phy_set_drvdata(priv->phy, priv);
>   	dev_set_drvdata(dev, priv);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
