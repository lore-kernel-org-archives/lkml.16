Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E40291C0C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153001; cv=none; b=qGkrZ0t1qVlX+oriHuddzFpjhWU7R/4G+lIHwncc+JadPN4Ipa6AJey/o0l7TY77igzs/CEW+cGZXs8LJQ5bSPo5+vHXY8MJdw152Vh0eYNnb/ob/dF8Qzbwd10IDZt1SFROtwqLFqQTMbPUsamHvB/AFy0aqHpKMi+tmtE29hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153001; c=relaxed/simple;
	bh=f2Q7Fc3WPwKLvWSKaPzzCkAM6dgtzTHH4wb7BKeAzV0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hhgofOym9J5MpPMR/2SQ9NZZVKevwdkcpBBoSydGPZKHVNABGrzPJOy5VkArqqjkh8L7h2XxmlTxFOx/LB9lc6IPy3j3o2LDLChBON+9SNxPL/3u24J5t/tlt6iK22BSY7PSDc2GFZ38NPdgVywrYXj+Z3ghlJZqTmJDSB5XtuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WX8GvGuI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WX8GvGuI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d7b50815so45957385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152997; x=1750757797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nCKA2NBdzp2xLG4y6buu2qcE4WyaNmgLnyxQpYpCxU=;
        b=WX8GvGuITtcg4CdiAgbClVTYKMfHyzZP3owcounvz/6yB5hIo4hk/Mg4Pfr+H6Lp7y
         0DuFx2rKuaoe61KewaZnocrtx3NmwoilCLkg5I6nuJ/uk3jdelRaifTirlIZLfdrhEI5
         e6g4TglmIvMFnQiad5jSafplyBvm8T3B5bmnZre5v11Ary94MzJDPv0hgURyWEmCz/32
         kevEwOVRYnqmCFBsFRGc4J5qYEYJ4pSGm3YpCMJT9kjbRkziXF+fA7haY0LyqPO7sz1D
         DUCINZi09qdI2vru4OxGeql/OhXin67u4+Lmfi5YfjtGVPvIVDYTehwmUaXagBFTCWpF
         G+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152997; x=1750757797;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8nCKA2NBdzp2xLG4y6buu2qcE4WyaNmgLnyxQpYpCxU=;
        b=QhgKJazR2xTIlPxaNuzZ56fHWlUN3sFAPe0giahDnVR1UqyvO89LcYJTXO6QncVAck
         FZ+NVcFuaPHvjKRuPpQYfqmJX18VJQwngr9rmT/MGUlMsBieb2RxrhUxXRig7IBNS7vq
         nhel9u+nuEP95xqNJWkt10Khdx5KqnSl+PWVzTR/ZBApOzF+bYWSLckohsHyvNslp1My
         tFfsbqyaipj1oQbpJMNISQsylhu3SU1CyAAIUICz3GOo6xUhINA/M6nme5N1VAoc1lCs
         eYUlYeYZy16zumZ4lWsumWroaG5YEjpmqJ8DQYab+pu71FWgxeRYNbNO9BVgebYfrv7K
         eYMA==
X-Forwarded-Encrypted: i=1; AJvYcCXtUdAdN5QuZSyK+wbE3/dybS1OyFuYsBq3Tu+uzGhz6IUhvgIZ3yqlFYEhQsTUmqD83ccLAPH7lJLbAv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/cmOdkXUBzrjVO2+Lf58ts4QY2Iva7p6Hk/am0z0xcdAScMS
	8f3jcRVuQKtHII0FkqlwXtrxL2WnVsm3x3ynCe9cqMbCyHaTAnBuCe7awx+IgM3CrGs=
X-Gm-Gg: ASbGncvg5TxFssRENE7JSVsdF19cQr2Ij1M3RCqfRgRMIygfIH6FIbBe8CkuzhUOnKD
	nyyS4taQE86f8EXu9DGIIrAMxltbHlI0krfV/8nl83eZxH2DTvSYZb5guxvJSm4hED4rHoeeUFD
	rnITgvYoV4NtZimCHAJCpDkoZvxVmeUvq5tqfbuyWsD4lT2SD2y9Zu6x6hUspEyP7hs1YCH4DoE
	zsOaG8/nT/Trf53zMg44N0q25q/BnTZRQMvo5cD9Noo+UHAPefRgumtgAJNlTQ7XwcZ/Kq3ZJp8
	+6IrcGooPfp6XWnwJ5UDylV2geWKFo2MLVJBzXPMWl5X8thk8iMltT2jfPxs5wTTDOh4707RhR6
	6A0ylzM2U5GzHpltZFGiABgdUT0tIOZoVs/VeJyY=
X-Google-Smtp-Source: AGHT+IFPR+wvTS8UzP7Kb30Ior0wbTC/3kLZgaa4u2lkQwq07xOKfLNrmGgBLem/dzm7DJB8DUeBJQ==
X-Received: by 2002:a05:600c:3545:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-4533cb4c99amr107660035e9.27.1750152997407;
        Tue, 17 Jun 2025 02:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4c969sm13226726f8f.85.2025.06.17.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:36:36 -0700 (PDT)
Message-ID: <ac629489-5086-4cf9-80ed-f5e56b132cf4@linaro.org>
Date: Tue, 17 Jun 2025 11:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3588 variant
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
 <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
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
In-Reply-To: <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3588 MIPI CSI-2 DPHY can be supported using the existing
> phy-rockchip-inno-csidphy driver, the notable differences being
>   - the control bits in the GRF
>   - the additional reset line
> Add support for this variant.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 75533d071025..0840be668bfd 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -30,6 +30,8 @@
>   #define RK3568_GRF_VI_CON0		0x0340
>   #define RK3568_GRF_VI_CON1		0x0344
>   
> +#define RK3588_CSIDPHY_GRF_CON0		0x0000
> +
>   /* PHY */
>   #define CSIDPHY_CTRL_LANE_ENABLE		0x00
>   #define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
> @@ -115,6 +117,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
>   	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
>   };
>   
> +static const struct dphy_reg rk3588_grf_dphy_regs[] = {
> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 1, 8),
> +};
> +
>   struct hsfreq_range {
>   	u32 range_h;
>   	u8 cfg_bit;
> @@ -373,6 +381,15 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
>   	.grf_regs = rk3568_grf_dphy_regs,
>   };
>   
> +static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
> +	.pwrctl_offset = -1,
> +	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3588_grf_dphy_regs,
> +};
> +
>   static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>   	{
>   		.compatible = "rockchip,px30-csi-dphy",
> @@ -394,6 +411,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>   		.compatible = "rockchip,rk3568-csi-dphy",
>   		.data = &rk3568_mipidphy_drv_data,
>   	},
> +	{
> +		.compatible = "rockchip,rk3588-csi-dphy",
> +		.data = &rk3588_mipidphy_drv_data,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);
> @@ -435,7 +456,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->pclk);
>   	}
>   
> -	priv->rst = devm_reset_control_get(dev, "apb");
> +	priv->rst = devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);

It would be preferable to have the names of the resets lines and use devm_reset_control_bulk_get_exclusive(),
and probably add the reset names to dphy_drv_data

Neil

>   	if (IS_ERR(priv->rst)) {
>   		dev_err(dev, "failed to get system reset control\n");
>   		return PTR_ERR(priv->rst);
> 

