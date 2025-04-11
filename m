Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482427CB3D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360351; cv=none; b=hP7RzBabGw5F22LAYY5oB8E5gVrtSSFhiU4lIO/UYWE7ui13RHG+tByHMEMN8CjttIGy4jKWPb+3Z+QBOsx8lZHTyWhlVGNeJYK1mokpGyV6xSWwGPRYVqt5sPvoHvqfYSBRLeSQoOeNaBe6xXzEpX+/B9AsnpKMSfkvOfd/gGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360351; c=relaxed/simple;
	bh=uF6VHDzlQfCGzqEZMBBdQbz9TCGasOyK2Zk8DslzFMc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=uuGt1S3WM2pkIgIzmrdnOvjNxanQo11TN0xiOLKo+N+vbsef0b25qnnur33G1qrrKuZgNJyoJlQZPZqgvfr7co3ksC39sg9kYbeyR1hU875uuvyQ80wAcyHAcf1cH0ee3ebrK8QURb2WCare9QrOt8XCK7Pva76q8vJ9VPha2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y509yWuP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y509yWuP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1042582f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360348; x=1744965148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=y509yWuP2pdwdEBkjh4DFKryEjJ/DUMkVDOj1MAcFUZyVppC3O+6AjPBdAhsXEADGQ
         ub/apaETNzeRq+Vouney7auUTQD+M2tB1bZkmYcAyugK+xWY2U6wE7CVq8FMdOla090v
         Z2BlW8tOqtKDLqDswE4x8HvwOqxuz4ne2wWnYvhSGY1cwZXn5E2v0Du9rJnMPsvmlQtr
         OwnxucrDZhH/CbM5k8ccskaRv8ZuUD8BYg5/D7yiAa4zmeYO1MhVJnyjEvbUTXVtV9vA
         2NFEz59XU+JF02Vi+Y2wbnqeC8XmFY0jGEEQ2UvT8wuY8cTrsjEsLTgu+CG4wixkx8Kl
         slcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360348; x=1744965148;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=YrqtO2YKdwqPomGV7kEJ9St/OEbGOHRmaHl6ioJGPs5nV1YBHpK5+4UaYgLf1ngO1P
         kfqsJ06RIEesvMrSHnFqJb2rNWinCUPxhYbJE6Cp49jM2sczAubH3Tk7oA+xWOd76nWW
         WIPWEKafJrnTW91kt6jPLH7WY6lfJQxzqGymnR2dxMohWwcHEdGAA5+i0tdbiqyJwhBU
         cZDK8FDqoNXbUbSOhHA2QKYcbMMa4rTYxcKuQ+wapxUJkt5c9DB1uLO8rVzgzEnT6Z3V
         EXhcS8MHFs9cSmMmIzqW9bLOf3SuXgKbfm8jD8tW9IEs5L1uyazcdk4jp+x2p23xBOnI
         mNyg==
X-Forwarded-Encrypted: i=1; AJvYcCVomiag11M5ga32R/HwMpzqbY+Wh3iHi5ZzmRpFNWXxaO1TQrveoxt67Ue/fQbitK/ckIGh2Y/BfhDOxIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZbGbfUXr1ADu59p/3TYIchd4mzWklfl9W30aNKUCgVJhNYe+n
	CkC+NLEibPbzcUj7Rg3PDyo9kHBTHRoW3hbUMBHmkAzSyydEUWvYw/K/ZIk1/vA=
X-Gm-Gg: ASbGncuSifqQ8sQRfCMMNR0U7moSPlKgx2FxkdUrz/1tZwzfnokqEm9Fdw+wZ6MAkEN
	YJ9/wz2DEuDYj/WGKcBfBH6K0lSWrjdq14TIsLgZ8cVjoQVR2mzE9k9hQVVImWGSeSlXQnHMOdL
	U5rh4hUJOv9PFXGl8Sih4OQHRIZyhnpvpHiQ/WfZBpxqI8hdgORxE4knwmvaf9KBGV9bQ+XNTOK
	ZEkTDsbyaBa78ZEstEKRKfqbNWJ/c0B4J3ZKNMe1+T6nkdRR1tjeZeDUmTFinws+puT1ol9UxCB
	A5OwsAd0nK1V7acQ4uc0BjMqF93KY15blRoSSlW1JDhjO3G75Nxy4nVwbBUSWTe5hUz4I7Blhyn
	WoVajpB66/QgGZsAqNA==
X-Google-Smtp-Source: AGHT+IFy7DI7w+bf+TzbwYeaeMvt+UTEl9M52U5ZWizMhQesvmiV7Mq5Ube+HjPUMbBTeDkCz3uXvw==
X-Received: by 2002:a5d:648e:0:b0:39c:30d8:a67 with SMTP id ffacd0b85a97d-39eaaecd91emr1259666f8f.55.1744360347745;
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm75951255e9.28.2025.04.11.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Message-ID: <7f6910a0-c56c-4284-b928-eb7ae7fb7e92@linaro.org>
Date: Fri, 11 Apr 2025 10:32:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error
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
 <20250410133332.294556-2-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 14ea89927ab14..6b390304f723c 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -237,7 +237,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   	struct phy_meson_gxl_usb2_priv *priv;
>   	struct phy *phy;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -266,13 +265,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->reset);
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
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
