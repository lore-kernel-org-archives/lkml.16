Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69062949F4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152620; cv=none; b=j7EIXIsiZtac3EGqRazq+NLwWToCy0IDM10Gc2jm1+LnAK70o7xxSAal9XBqfEHqX5daswhVQaVIBsjRLw7BN42BWozSwM851tXfSBCX8xMun0lObe752+Ehm+F2TloGP4GZuAfEAJlukT6y0HpxXRiFsDZgv4FcjEt173ArxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152620; c=relaxed/simple;
	bh=zaZ2O9bOumy6WLgWO1r6sqT4gqzW11xkJSkkFy5zOvc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rBghSkraYsvqiO4dNdSMJC66FZjSWxm3IQzMvlwNVBWnuE4OWx7hbkio/Aj2XJcuKSI/ja1YpUhfq3Rbbb8tmDAeXTFJvqyx0qOS6guh+PmDR/j4lwN90kLMpNpVdWKqdAQg/NX6z60vvbhhZvCAkFLZI+HdaY5TEnrIDuDPspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zybM47Jk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zybM47Jk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d3f72391so62284285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152617; x=1750757417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl41cDxLf5qSZURNGABwnShoulmiUtSz5ST04bw9Wkg=;
        b=zybM47JkwvYMsbbGVEAyPzZoz6r/+bQOtozXo0sx4YGHQWcvS/qdjB88jHLlLoEk6x
         DV/45Y/RN8tNuMW5Boij2Mw47l+Y/AGdCpYfCdjfs1q7YUGmcSAMWEFyfef42q+PKe2R
         1uHlYeFfgNtlLSXyjMRb3bJBdpivmRJALHN9OMbdA8MiQExaxjNtt1VIQpuWMw7DTHu5
         hHd/qbKhyxRqp+XUeFmvWfz0Q6wQQtcUf6aXO8QwLsMqT84d8nfH7dBGSEkkqS/jgv3c
         AHuS3vrI5dZTlSNRTd2FM4EC0ppaSZkzrdWfuEH1uRtVDTHYAc2eMI1OrVcr8f7G9PX4
         k7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152617; x=1750757417;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xl41cDxLf5qSZURNGABwnShoulmiUtSz5ST04bw9Wkg=;
        b=rFI2m6iGN6C4bv3/2kxyHYeDE8PSdpQ5FlqF79/ZTS9iBjCeV+KQ1MN2jRINqpO258
         6HD+EJ3u1FIXyUGL7uyuhoupNlo+RBXdgtAKucBmr+ZIUcxj42PHii+HLhaW1NLBzf5V
         LONTxEw9qGCkCaIUaRSxJzkt4qmpojDnl8PF1/Ond6t0xTUi/j9KILLegXUgwnOXl1aK
         43ZV07gVXepIG5Q3BxdvRb8p+FjS9GNcAHQofBaWZ+wVczEhkEkNA/q7971Xgy61pNnb
         lsYsvzYSQLR744eEXZnxYpxGVJKIlaYsmyKvzHwBb7+Ym1mGDCHggIKCMon9sL5ugKCc
         cHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK2+yGcqszm2Y62cyU8qObfBvU2P866fhMy4ZfGwrjs1f+sCIW7H7V7T+Bh+NQIgIQhKKX9H2fxz7TBsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDT4J33JbxIdPW+MT9IpBcMfEd2lRBms1GyKqWAsnBUiYMpHB
	/J5yGGSEfyDQzYWvjmO8jewfYjQ/btoxBqhQLtaTJk0S+vlmI59kD/gBNe4+sfWA5wg=
X-Gm-Gg: ASbGncsXN0QyeU8M8buMLqxXfjtwzpAdTCKOgRrQ0Nox0K4/Hw6mnQSGFRUVF/uVMGJ
	9/+zVHtA7Iaja6hz4KjsypnyK+YjVKqJMbr+xqdjAX/NZFO73cXNbjSm4hYFsIJIcEJ9nlmJBqa
	5vhtr457vboaYLHUXaPr/4VefN/rUgWReMsczhdkbC0xT/DDVAY+bTCrLdkSlKOKbHRy4eJ5Lf3
	NHEMgWwfx+Y8u9w3tRPVi11CJKK/x6A4QjjtkiVEj00yt+MVGSCXUwM4udswdLVKg40vboGa2jm
	VWN8ER1DhBRy1AAhOlJ5vPolcU+meSUFjpkW1NeYp2QaSNc4i8v1u+Of+YmMNPQCIhSQ9nWBpxP
	q3GnI/3Lq96SYowEhQCeHwbGqs8gf+1WzX0Zhqaw=
X-Google-Smtp-Source: AGHT+IH90fM/Hl2qQnPaSI6dqHDTANiZZutrp7G9byHerpIanfYAuG3VuGrXV1ZLniUQsldJImLpAQ==
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-4533cac9179mr105111595e9.23.1750152616870;
        Tue, 17 Jun 2025 02:30:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm13662038f8f.14.2025.06.17.02.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:30:11 -0700 (PDT)
Message-ID: <9c512a8d-a39e-4b3a-b617-80b2dc7d14b3@linaro.org>
Date: Tue, 17 Jun 2025 11:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-inno-csidphy: allow
 writes to grf register 0
To: michael.riesch@collabora.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-3-84eb3b2a736c@collabora.com>
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
In-Reply-To: <20250616-rk3588-csi-dphy-v1-3-84eb3b2a736c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The driver for the Rockchip MIPI CSI-2 DPHY uses GRF register offset
> value 0 to sort out undefined registers. However, the RK3588 CSIDPHY GRF
> this offset is perfectly fine (in fact, register 0 is the only one in
> this register y
> file).
> Introduce a boolean variable to indicate valid registers and allow writes
> to register 0.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 2ab99e1d47eb..75533d071025 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -87,10 +87,11 @@ struct dphy_reg {
>   	u32 offset;
>   	u32 mask;
>   	u32 shift;
> +	u8 valid;
>   };
>   
>   #define PHY_REG(_offset, _width, _shift) \
> -	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
> +	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, .valid = 1, }
>   
>   static const struct dphy_reg rk1808_grf_dphy_regs[] = {
>   	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 0),
> @@ -145,7 +146,7 @@ static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
>   	const struct dphy_drv_data *drv_data = priv->drv_data;
>   	const struct dphy_reg *reg = &drv_data->grf_regs[index];
>   
> -	if (reg->offset)
> +	if (reg->valid)
>   		regmap_write(priv->grf, reg->offset,
>   			     HIWORD_UPDATE(value, reg->mask, reg->shift));
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
