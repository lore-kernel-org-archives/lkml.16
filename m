Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0D25D1F5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725756; cv=none; b=LHeA89RNibfLF25d//Uby6Av3wPXIBMrC/+uLSTuVBYv2uxEgNnZo/Ybo36/NmUYtYJo5VWWrcIZesztXY4hbOTkHNQsF3AaRfPtwrSJHK9xKQr25jlcj/qy/xEAgPTlZTWEDX/SUvJgjmtubp4e916l7ZbIrvl2w1fWJspLG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725756; c=relaxed/simple;
	bh=IIE38YaG4Ab1JNe9rdPgPCbQIIlDP8KVl0xah+cLRiw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dv95nRn/fJhd3T+P5nMVCdR+3xRCXlz5OfgU/QpghgZMhENcktDsabRa3z83+mccJK8itVjE5qEvZy2znBcO7bSvytQPYxInCgQnBbXxMOukEeoaTENpz/CORWeOKufNy/QxSuUj97nb0PvsTvAPlf8/45pggdLeqJraLg8nzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMGJA71P; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMGJA71P"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so1341680f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747725752; x=1748330552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PraJM74r5citST/Q0Ihg9JGi75iqGhVSp5Hm6UV5dqE=;
        b=PMGJA71Px5iirQBTIQsBuV/PDXz215LDLV4VVO4u+XRxk7xzyIbxvO3L4Bq7wuHx6I
         fF0XRwFhCeki2ic3zQbujbIS3H3eY4Cufmc6C+0chi6jQJeFhsJwpzigRkZUS0WOiLGt
         vZPtCD8QNMuywoTRL9pmF6NPLynRXeV2caD18dorD6M5iSTmHFrAcU0IVvU8iv6N4Ld3
         hXB5zOtqwx8RGEA/itpKDx39j/3MnHnKSzXlKCFl33mB0iCJ+yQ9T9p3Oo2fFqTzVi5U
         5esD9IMDGMOoMxQh1tO6NNQT7FPI4HpTE1bJCo3LunKyKx1TRUQkM9qQDTXNzgFyBH04
         vohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725752; x=1748330552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PraJM74r5citST/Q0Ihg9JGi75iqGhVSp5Hm6UV5dqE=;
        b=tSsbVfk+RTTamW46AGgomndrMniD7Bztux7He+wFFyn44hXti0uzaBFDfsECXuQnZC
         2PDyCQ2Tk+Q5V+maLoUVBMbufI+v6z+aHvN/tMGEWtFdhXC7w3hhHwGAtjvRdQ4CzFjo
         1NyzffYjJaLZffVjYbe4mk1zMiLMhwURSHKhmDBlkbjpOnotxSP3E4jUbgusIF0C6SgI
         pstDbQTNpVtDwyFg0OWcOwu4EqC6MuZcObJ6d3UYHzPaALvQ50u6Z2JTS1yaafH0KhoB
         mWxVsp5TF9aN+IhTL/yJ4V5BZLS6n407sbs5OVK9dUbq5W5pw3iKiHOKFwPhpAOsp0FE
         r69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiGyOkFPB8ara5ZyyFrpBkxqXekBnpc3WwCDW3mFRpo6wV7M3Nhzq9eSmWAA7p3uDohBacDAOTuqVn9aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6q2FHnMWoTFfjfPAL0xTszZkExz+XXR2gXmasDGtgjV0LIhX
	wj6s4vI0vFWRIg+UJZv4T0Hc1VMgPwxEPsfOCg1rjARjQKNnbHv8kO+OK6S/Jp9HHoI=
X-Gm-Gg: ASbGnctnW4niKwTuuadyQzp0ylOMhxyHffx3SDeR0Jsm6F798cg201Frc6KAruWVw5M
	EYjn60WKAG4DPmOzET97libYKjgI75H6qD43dbhfZyxvgZIwooPzblqaWAdQ2LigQo7/sLKqd3I
	fBXewMmkGKPokig3uQitH2GNBN28qsZDoaGqEdyNlFVPlgU+erQBWH6EnXBdMbnaYnqJicNLnaX
	/rtRg6/YtIbQ4xsKjps10VUdzrQbMomyD6rx5qgL5dxb8b9w+0veOrRyMRwsSbumTHvz2vuzlUt
	qV4JYWpcbJ3tPl3YZHRdHqsNNMi/qITyYNI0ogDVNTcXI6FxJU9R5GD7Q//OS4nbKXNlwjuXDg1
	4Rq5HKEdeELwd0H3O/67HEUCtkMveGZ5cHRjStDo=
X-Google-Smtp-Source: AGHT+IFhpLTWJlAxFBTqXrFKSfTKeSY8UrKx04WYGcxfsIkYdRJSck3G+a/yi6ikofc/3aO5z3egFA==
X-Received: by 2002:a05:6000:2dc7:b0:3a3:706f:f2be with SMTP id ffacd0b85a97d-3a3706ff4d1mr5197818f8f.46.1747725751681;
        Tue, 20 May 2025 00:22:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5aba3sm15088097f8f.40.2025.05.20.00.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:22:31 -0700 (PDT)
Message-ID: <74ef310c-e0c4-47bf-b880-fa1addfa298d@linaro.org>
Date: Tue, 20 May 2025 09:22:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
To: Yao Zi <ziyao@disroot.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-5-ziyao@disroot.org>
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
In-Reply-To: <20250519161612.14261-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:16, Yao Zi wrote:
> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> PCIe and USB3 mode. The control logic is similar to previous variants of
> naneng-combphy but the register layout is apperantly different from the
> RK3568 one.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
>   1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 1d1c7723584b..bf00a85a113b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -20,7 +20,46 @@
>   #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
>   #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
>   
> -/* COMBO PHY REG */
> +/* RK3528 COMBO PHY REG */
> +#define RK3528_PHYREG6				0x18
> +#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
> +#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> +#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> +#define RK3528_PHYREG6_SSC_UPWARD		0
> +#define RK3528_PHYREG6_SSC_DOWNWARD		1
> +
> +#define RK3528_PHYREG40				0x100
> +#define RK3528_PHYREG40_SSC_EN			BIT(20)
> +#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
> +#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> +
> +#define RK3528_PHYREG42				0x108
> +#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> +#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
> +#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> +
> +#define RK3528_PHYREG80				0x200
> +#define RK3528_PHYREG80_CTLE_EN			BIT(17)
> +
> +#define RK3528_PHYREG81				0x204
> +#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> +
> +#define RK3528_PHYREG83				0x20c
> +#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> +#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> +
> +#define RK3528_PHYREG86				0x218
> +#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> +
> +/* RK3568 COMBO PHY REG */
>   #define RK3568_PHYREG6				0x14
>   #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
>   #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
>   	return PTR_ERR_OR_ZERO(phy_provider);
>   }
>   
> +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
> +{
> +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> +	unsigned long rate;
> +	u32 val;
> +
> +	/* Set SSC downward spread spectrum */
> +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
> +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_PCIE:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
> +		break;
> +	case PHY_TYPE_USB3:
> +		/* Enable adaptive CTLE for USB3.0 Rx */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
> +					 RK3528_PHYREG80);
> +
> +		/* Set slow slew rate control for PI */
> +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
> +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
> +					 RK3528_PHYREG81);
> +
> +		/* Set CDR phase path with 2x gain */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
> +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
> +
> +		/* Set Rx squelch input filler bandwidth */
> +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
> +
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
> +		break;
> +	default:
> +		dev_err(priv->dev, "incompatible PHY type\n");
> +		return -EINVAL;
> +	}
> +
> +	rate = clk_get_rate(priv->refclk);
> +
> +	switch (rate) {
> +	case REF_CLOCK_24MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
> +		if (priv->type == PHY_TYPE_USB3) {
> +			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
> +			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
> +						 RK3528_PHYREG40);
> +		} else if (priv->type == PHY_TYPE_PCIE) {
> +			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
> +						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
> +		}
> +		break;
> +	case REF_CLOCK_100MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
> +		if (priv->type == PHY_TYPE_PCIE) {
> +			/* PLL KVCO tuning fine */
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +
> +			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
> +			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
> +		}
> +		break;
> +	default:
> +		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
> +
> +		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
> +			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
> +					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
> +					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
> +					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
> +					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
> +			rockchip_combphy_updatel(priv,
> +						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
> +						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
> +						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
> +						 RK3528_PHYREG42_PLL_KVCO_ADJ,
> +						 val, RK3528_PHYREG42);
> +
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +		}
> +	}
> +
> +	if (priv->type == PHY_TYPE_PCIE) {
> +		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> +						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
> +	/* pipe-phy-grf */
> +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
> +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
> +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
> +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
> +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
> +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
> +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
> +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
> +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
> +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
> +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
> +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
> +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
> +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
> +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
> +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
> +};
> +
> +static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
> +	.num_phys	= 1,
> +	.phy_ids	= {
> +		0xffdc0000,
> +	},
> +	.grfcfg		= &rk3528_combphy_grfcfgs,
> +	.combphy_cfg	= rk3528_combphy_cfg,
> +};
> +
>   static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
>   {
>   	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> @@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
>   };
>   
>   static const struct of_device_id rockchip_combphy_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3528-naneng-combphy",
> +		.data = &rk3528_combphy_cfgs,
> +	},
>   	{
>   		.compatible = "rockchip,rk3562-naneng-combphy",
>   		.data = &rk3562_combphy_cfgs,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
