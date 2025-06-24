Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A42522A7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750089; cv=none; b=nc89zdO1rS6ydtoWdnSATHV0rmRqEkxRifjIVTq443X017G9ORTsbrWE8/Cq1k10+sHtkc5M0C9reehFWtZrLaYwODZZUEi2Ogw4Esi3MxjThxoced/V+M3FmCU0z214GDeSPlWuDBJtfUUtPein6w9x9K6y3vVe2cGLg9N+gGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750089; c=relaxed/simple;
	bh=eGI/2RJcl3HWt8QpFl6AlxB+0kL0VYThRxtUaOMY8vU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DMfI36AQQvoQpdJl2oBV7GDxga3RoTJuA8Rbb10c8V0vcUPLQGYk0m+R0Zg9XRZsrGUi/VmeWiZqdmMfAZgghoWA3VCaQESLVRQMxhsaLfFvJAoMmEispVd2SNQHJorc2KM303kT8eTwpQXhVTesO4UYiHqPOYWqhAdOMg1w6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mcySBAT5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mcySBAT5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a522224582so45241f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750750085; x=1751354885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ+Ey73e1w44lbC3w0VcbTTtAhvrBPf9nerbBI+C4fk=;
        b=mcySBAT5Jrw+78HmwWHDOF/IXEpAz+NQ56jTpvQP18h8QQhdtLhD1Igd2o8yHZuX3j
         ge2CYgARu7m6CAm+RWXE/gcvf2Yl5v9+FzJxGBILmJFxL8vkAS7FRtPyQ9Zh0UgEDn8f
         NDXo34iGPvgqZgKMWnoQ0sSQRBepEpZNV/SdtQEdCjcnKVQtiro02pomra7w0RB5etfW
         ucDNrQoTvLCYgDY3xqk20q84njEVz72N2Pf30Q3NgfjhkxaexaT50q57SbQGFD9tDVNo
         u2D+sp4YdqMzip2UxjWu5nH7ztBXW/bOFiIXltGluB7Y7ekjNJaet4C9qJl2pdLCYpkS
         FgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750085; x=1751354885;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZ+Ey73e1w44lbC3w0VcbTTtAhvrBPf9nerbBI+C4fk=;
        b=cLqMpEqaJmtCIz+LM/T4dgvQvhqL5g5xyKUFpeYDbD/Zvcmz/bmWh4MjcasTD2C2UF
         /0qpQyAJrJbOrcjHRQKbSua4l5AwuDK4QVXAKKh4mJMYnAry09iJ2hRlH3Wjb7vLXf5u
         GmMJoGohOWQe+xLPg33LGoKl9eIvf5fOwUlAhDJ1A4RlIYMKYDT5rgw1idADmzA7FNZ3
         5GuseqT9PmV5/FNMnGinsI1Gq9P5pkhc+Y+WlWXD5HZmrAZ0VWWRjfK+ehn5mWFWYTn9
         7rFqjFHeGvm2JhvM7Hmbgwvf7VBkzKUuznnTJqy1cIIBhyi9+mia1rYjHqhVyfGR52d8
         Dpow==
X-Forwarded-Encrypted: i=1; AJvYcCU2MNLK8c4m3XVs6M7koGV7lnCQ7BcmvJ+YFApCGI01uSLPKFY/u+nCR0I4JDstgYnrtT8YRFW3FcIUafE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMXdCViO4hA9e41PQseWef+PFyaRK8/ViQYbUhOQ3aBZb7hR3
	nR7XUFPkHrzhEZCOd1tiMcAzgdy18OXML1/Vr5fYISm3oGM7+FQXOKy7ce88JLDxXqU=
X-Gm-Gg: ASbGnctZqf6qhfEdpVVdjQlvcxZ3P8lP/+nUMGlirU+1nOEuI1O8DYPvDU6kH+w44IW
	AxY0y8WqsCYUbfoit3nYDKEejigDF+bwcuv40Uc7DbxVuHmpWHEWIBUAEp4nCzeJpWD7oSNPMmm
	dFlhFeXg5xh6iSSsXvbMogoDig282GS+8hl1DnFCnp88fR56b8Xck+2+HYb2MLR5AOw+wsigaWX
	vlqpZiArsa1c1RYEa45IIjOJqrua6cTf3aiYLuIxECNs9HDOjOUOourrp/K2aNy5FvZNXD+BKf6
	u0JBqG2tJYpEJhR43p7E3YMi7XXALoHmr9vCMpLtaARswN0rJsTJTooxF1uJ8cZc1/tq4J/nGsx
	JVZnPS9ylwdX8AXj8wPArPhfSoLNewei15/AwaHE=
X-Google-Smtp-Source: AGHT+IG0LntEwTlFHFmNmL2P11XMbrWbJ4Hrr4lC9yhAzGFG33fGfZoe9KQDKcPk08xD6i9MHwDWGA==
X-Received: by 2002:a05:6000:40cb:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6d12e68ccmr12188188f8f.46.1750750085304;
        Tue, 24 Jun 2025 00:28:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6fea:600c:ca20:f54a? ([2a01:e0a:3d9:2080:6fea:600c:ca20:f54a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm126469055e9.25.2025.06.24.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:28:04 -0700 (PDT)
Message-ID: <7cba4f34-3ea7-4ddc-b2f6-f7d8f286472e@linaro.org>
Date: Tue, 24 Jun 2025 09:28:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/2] phy: mediatek: tphy: Cleanup and document slew
 calibration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
 <20250623120315.109881-3-angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <20250623120315.109881-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:03, AngeloGioacchino Del Regno wrote:
> While it's true that, generally, the T-PHY V3 does not support the
> slew calibration process, some minor versions of it actually do,
> moreover, some SoCs may not support this even though the version
> of the PHY IP does.
> 
> The reference clock and rate coefficient parameters are used only
> for slew calibration: move those to platform data, then document
> and change the checks in hs_slew_rate_calibrate() to perform the
> calibration only if:
>   - EYE value was not supplied (pre-calculated calibration); and
>   - Slew reference clock value is present (not zero); and
>   - Slew coefficient is present (not zero).
> 
> Moreover, change the probe function to always check if both the
> slew reference clock and coefficient properties are present and,
> if not, assign the value from platform data (which, as reminder,
> if not added means that it's zero!), instead of checking the PHY
> IP version.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/phy/mediatek/phy-mtk-tphy.c | 45 +++++++++++++++++------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 858824b4476e..e5ce1255d735 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -210,8 +210,6 @@
>   #define P2F_USB_FM_VALID	BIT(0)
>   #define P2F_RG_FRCK_EN		BIT(8)
>   
> -#define U3P_REF_CLK		26	/* MHZ */
> -#define U3P_SLEW_RATE_COEF	28
>   #define U3P_SR_COEF_DIVISOR	1000
>   #define U3P_FM_DET_CYCLE_CNT	1024
>   
> @@ -285,12 +283,16 @@ enum mtk_phy_version {
>    * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
>    *                            read from different nvmem (usually different eFuse array)
>    *                            that is pointed at in the device tree node for this PHY
> + * @slew_ref_clk_mhz:         Default reference clock (in MHz) for slew rate calibration
> + * @slew_rate_coefficient:    Coefficient for slew rate calibration
>    * @version:                  PHY IP Version
>    */
>   struct mtk_phy_pdata {
>   	bool avoid_rx_sen_degradation;
>   	bool sw_pll_48m_to_26m;
>   	bool sw_efuse_supported;
> +	u8 slew_ref_clock_mhz;
> +	u8 slew_rate_coefficient;
>   	enum mtk_phy_version version;
>   };
>   
> @@ -686,12 +688,14 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
>   	int fm_out;
>   	u32 tmp;
>   
> -	/* HW V3 doesn't support slew rate cal anymore */
> -	if (tphy->pdata->version == MTK_PHY_V3)
> -		return;
> -
> -	/* use force value */
> -	if (instance->eye_src)
> +	/*
> +	 * If a fixed HS slew rate (EYE) value was supplied, don't run the
> +	 * calibration sequence and prefer using that value instead; also,
> +	 * if there is no reference clock for slew calibration or there is
> +	 * no slew coefficient, this means that the slew rate calibration
> +	 * sequence is not supported.
> +	 */
> +	if (instance->eye_src || !tphy->src_ref_clk || !tphy->src_coef)
>   		return;
>   
>   	/* enable USB ring oscillator */
> @@ -1516,12 +1520,16 @@ static const struct phy_ops mtk_tphy_ops = {
>   
>   static const struct mtk_phy_pdata tphy_v1_pdata = {
>   	.avoid_rx_sen_degradation = false,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V1,
>   };
>   
>   static const struct mtk_phy_pdata tphy_v2_pdata = {
>   	.avoid_rx_sen_degradation = false,
>   	.sw_efuse_supported = true,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V2,
>   };
>   
> @@ -1532,6 +1540,8 @@ static const struct mtk_phy_pdata tphy_v3_pdata = {
>   
>   static const struct mtk_phy_pdata mt8173_pdata = {
>   	.avoid_rx_sen_degradation = true,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V1,
>   };
>   
> @@ -1561,7 +1571,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>   	struct resource *sif_res;
>   	struct mtk_tphy *tphy;
>   	struct resource res;
> -	int port;
> +	int port, ret;
>   
>   	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
>   	if (!tphy)
> @@ -1591,15 +1601,14 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	if (tphy->pdata->version < MTK_PHY_V3) {
> -		tphy->src_ref_clk = U3P_REF_CLK;
> -		tphy->src_coef = U3P_SLEW_RATE_COEF;
> -		/* update parameters of slew rate calibrate if exist */
> -		device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
> -					 &tphy->src_ref_clk);
> -		device_property_read_u32(dev, "mediatek,src-coef",
> -					 &tphy->src_coef);
> -	}
> +	/* Optional properties for slew calibration variation */
> +	ret = device_property_read_u32(dev, "mediatek,src-ref-clk-mhz", &tphy->src_ref_clk);
> +	if (ret)
> +		tphy->src_ref_clk = tphy->pdata->slew_ref_clock_mhz;
> +
> +	ret = device_property_read_u32(dev, "mediatek,src-coef", &tphy->src_coef);
> +	if (ret)
> +		tphy->src_coef = tphy->pdata->slew_rate_coefficient;
>   
>   	port = 0;
>   	for_each_child_of_node_scoped(np, child_np) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
