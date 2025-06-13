Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F02C15B7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806392; cv=none; b=rPopSOSJXDKlKxfQKnq0RVIiKT2wVzxDMVBlmVrmF6uWbVLCRrxcKdYsQHWHRoju9F//NX6ruEmKHe97n/Lg4K/zxsKlBlcAJoWIPVcRZloKBDbngaiQ8FiExdLLTx9DyrScB9HRhjZwBRQB1pDyyS88GbYD0ruA6t6tWBRKabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806392; c=relaxed/simple;
	bh=vA2zESw0UZVtSv/afmxb/qpu0fOOiy8mfjZOlskXQW4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jMTrJLv8wgCotBrNbfWh+eyx0JN7bGlN2y3iT6rOZGf9wdeDCkFD+wRLtu887r9HBG/gQjhQQK9XkVWyE3l6yCMxRlSsbu/jVoqbeTqBERTe7Au9UVdUnJu6IB1eoVrk7tosEttlJwU3hwEICz6VD8s855fjH5+M1CUghEAOWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=II8lr8ls; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="II8lr8ls"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f379662cso1670459f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806388; x=1750411188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qFn07GB/hGI+Ctu/nW6cDAKtjk0DCxKbD/zvlW1KZ4=;
        b=II8lr8lsIwDnWgSsns0npsr2rwHAJYZ81g/GsvkZrbuk1pAj6G/XC8A0Ao7a9MXdgL
         9zrEPuQ5JLobXmZogYL8LacA+6eXceu8lL+E+724aKaIZ8l050494Nu0qFmpWfqIPacf
         s2gg6JM2yX7oBITJ+rtNhDVs1jUdRc7PEbO09dwI1MolYjoOu7tMD+XVsv5bXN7bvBuB
         AeCCuZ8EsEZae8hrTj4nXNbV2hIMwBmu+FVGX7I5YyqVbxEcjRj+wzcHdaLbg6tK2k2L
         g8T1YA7CFCdWxjX7MjqkxAYZ9VJkSRZtWJXW01c0BKEAcj6F2QfNHKpRK5/jT6TRBb4o
         iWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806388; x=1750411188;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0qFn07GB/hGI+Ctu/nW6cDAKtjk0DCxKbD/zvlW1KZ4=;
        b=ZSIQaUOsQMt/gw4tRufbP8qKBm/3w87npmPnPYp0kTskjuy1YCCL9ZfR3zFkakPst/
         UpfibwA389kvw8AO2FXHMRzEb78yJiiG7tYvjYsO1p7imVgsbbZ392le3ewaEMbe9eMw
         o6NEDajw+2E83mxKIhkIsE2KO+ZZbR5x1JrIHxxV+rJKbgX56HSvvozYi66AmI8cw/gL
         Uz0knigSMSjpnii3y+XntP4nXuHhHM+r8Znee3Ub7wHKWrp6mmwvGGxCH0ycaHRMnuK4
         yHKSmZfjvuiGwtjnTlGMiAYMBY8OyuR2+gVpsLyYCIP0+j47COJKClpn+CUzvcCDfbkN
         Avug==
X-Forwarded-Encrypted: i=1; AJvYcCUJR+kIi8jhQvBYoxgP4WRtAtX5ZoFB9UsZhAx8UuyuqmG7G4LANMnDYIP2Mj/Y2buAQ+RrbmxKTbLhlGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYdJc/UHGP3+zkRKEjSrv48tSK2H1cPiJfoMWAAHrXObV6WF9
	SWA4VMf02mkvzhXLRj8Q76hpA/U+iqrVzKh7f/VjrwEa3Qf27b4HxQY5OOe+iRI1GT4OORPmy01
	YOmhVE30=
X-Gm-Gg: ASbGncspZvYauEhsSxe1MjW0avEbbYnuVAWgCO+SKytmuWqI9GvwECa3coypasDNoQo
	Z6sn12KpMbjTKUD9zV8fSJ4HyGK34IXaEEgy+cGCJowGvlsFYHKilmaAmylvJ5b5cmDP8t9KdT+
	UNIuBqWrlzBzUdefgRtI49cwN+30Hi/5E5nKZFBug3C33vEkOUUWC1vKPRgq1c251YuzVhxZ3j2
	btGn02+AHZgqanV4atTKhM/AftUBgt1eFR7PRJQC07bncECTvyqXCRlq/X74vcZm7B6ADzMzpOR
	Jd8Pc/akyNoQtkHaS3LfTox/9K9CLeElZlROD8F56KCcJoVrKiCk9OzU84HJpblG2V2MkCGUPU2
	sazqCkpCbvF2RrIWOHNDsm7g+N2Ho+sWULsqBcqM=
X-Google-Smtp-Source: AGHT+IH4oACk1bsfV6amSlitKrCgpQJnJ/K1MhkDAlenMtB1mkbBDDmt16i+/PumTX/+HB7PsCie1A==
X-Received: by 2002:a05:6000:2913:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3a5687709c5mr2132132f8f.49.1749806388333;
        Fri, 13 Jun 2025 02:19:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm1816612f8f.33.2025.06.13.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:19:47 -0700 (PDT)
Message-ID: <8c13ed70-6464-4b70-b45c-a336d5c6d4fa@linaro.org>
Date: Fri, 13 Jun 2025 11:19:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: cadence: Sierra: Add PCIe + USB PHY multilink
 configuration
To: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org,
 kishon@kernel.org, christophe.jaillet@wanadoo.fr, sjakhade@cadence.com,
 bwawrzyn@cisco.com, u.kleine-koenig@baylibre.com,
 krzysztof.kozlowski@linaro.org
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250610130133.2102196-1-s-vadapalli@ti.com>
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
In-Reply-To: <20250610130133.2102196-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 15:01, Siddharth Vadapalli wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add register sequences for PCIe + USB multilink configuration for
> Sierra PHY.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20250610.
> 
> Regards,
> Siddharth.
> 
>   drivers/phy/cadence/phy-cadence-sierra.c | 180 +++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
> index 45a5c00843bf..74613382ccb0 100644
> --- a/drivers/phy/cadence/phy-cadence-sierra.c
> +++ b/drivers/phy/cadence/phy-cadence-sierra.c
> @@ -58,8 +58,11 @@
>   #define SIERRA_CMN_PLLLC1_GEN_PREG			0xC2
>   #define SIERRA_CMN_PLLLC1_FBDIV_INT_PREG		0xC3
>   #define SIERRA_CMN_PLLLC1_DCOCAL_CTRL_PREG		0xC5
> +#define SIERRA_CMN_PLLLC1_MODE_PREG			0xC8
> +#define SIERRA_CMN_PLLLC1_LF_COEFF_MODE1_PREG		0xC9
>   #define SIERRA_CMN_PLLLC1_LF_COEFF_MODE0_PREG		0xCA
>   #define SIERRA_CMN_PLLLC1_CLK0_PREG			0xCE
> +#define SIERRA_CMN_PLLLC1_BWCAL_MODE1_PREG		0xCF
>   #define SIERRA_CMN_PLLLC1_BWCAL_MODE0_PREG		0xD0
>   #define SIERRA_CMN_PLLLC1_SS_TIME_STEPSIZE_MODE_PREG	0xE2
>   
> @@ -1541,6 +1544,137 @@ static void cdns_sierra_phy_remove(struct platform_device *pdev)
>   	cdns_sierra_clk_unregister(phy);
>   }
>   
> +/* USB refclk 100MHz, 20b, SuperSpeed opt2, ext ssc, PLL LC1, multilink */
> +static const struct cdns_reg_pairs usb_100_ext_ssc_plllc1_cmn_regs[] = {
> +	{0x002D, SIERRA_CMN_PLLLC1_FBDIV_INT_PREG},
> +	{0x2086, SIERRA_CMN_PLLLC1_LF_COEFF_MODE1_PREG},
> +	{0x2086, SIERRA_CMN_PLLLC1_LF_COEFF_MODE0_PREG},
> +	{0x1005, SIERRA_CMN_PLLLC1_CLK0_PREG},
> +	{0x0000, SIERRA_CMN_PLLLC1_BWCAL_MODE1_PREG},
> +	{0x0000, SIERRA_CMN_PLLLC1_BWCAL_MODE0_PREG},
> +	{0x0000, SIERRA_CMN_PLLLC1_SS_TIME_STEPSIZE_MODE_PREG}
> +};
> +
> +/* USB refclk 100MHz, 20b, SuperSpeed opt2, int ssc, PLL LC1, multilink */
> +static const struct cdns_reg_pairs usb_100_int_ssc_plllc1_cmn_regs[] = {
> +	{0x002D, SIERRA_CMN_PLLLC1_FBDIV_INT_PREG},
> +	{0x000E, SIERRA_CMN_PLLLC1_MODE_PREG},
> +	{0x1005, SIERRA_CMN_PLLLC1_CLK0_PREG}
> +};
> +
> +static const struct cdns_reg_pairs usb_100_ml_ln_regs[] = {
> +	{0xFE0A, SIERRA_DET_STANDEC_A_PREG},
> +	{0x000F, SIERRA_DET_STANDEC_B_PREG},
> +	{0x55A5, SIERRA_DET_STANDEC_C_PREG},
> +	{0x69AD, SIERRA_DET_STANDEC_D_PREG},
> +	{0x0241, SIERRA_DET_STANDEC_E_PREG},
> +	{0x0010, SIERRA_PSM_LANECAL_DLY_A1_RESETS_PREG},
> +	{0x0014, SIERRA_PSM_A0IN_TMR_PREG},
> +	{0x001D, SIERRA_PSM_A3IN_TMR_PREG},
> +	{0x0004, SIERRA_PSC_LN_A3_PREG},
> +	{0x0004, SIERRA_PSC_LN_IDLE_PREG},
> +	{0x001F, SIERRA_PSC_TX_A0_PREG},
> +	{0x0007, SIERRA_PSC_TX_A1_PREG},
> +	{0x0003, SIERRA_PSC_TX_A2_PREG},
> +	{0x0003, SIERRA_PSC_TX_A3_PREG},
> +	{0x0FFF, SIERRA_PSC_RX_A0_PREG},
> +	{0x0619, SIERRA_PSC_RX_A1_PREG},
> +	{0x0003, SIERRA_PSC_RX_A2_PREG},
> +	{0x0001, SIERRA_PSC_RX_A3_PREG},
> +	{0x0606, SIERRA_PLLCTRL_FBDIV_MODE01_PREG},
> +	{0x0001, SIERRA_PLLCTRL_SUBRATE_PREG},
> +	{0x0003, SIERRA_PLLCTRL_GEN_A_PREG},
> +	{0x0406, SIERRA_PLLCTRL_GEN_D_PREG},
> +	{0x5211, SIERRA_PLLCTRL_CPGAIN_MODE_PREG},
> +	{0x00CA, SIERRA_CLKPATH_BIASTRIM_PREG},
> +	{0x2512, SIERRA_DFE_BIASTRIM_PREG},
> +	{0x0000, SIERRA_DRVCTRL_ATTEN_PREG},
> +	{0x823E, SIERRA_CLKPATHCTRL_TMR_PREG},
> +	{0x078F, SIERRA_RX_CREQ_FLTR_A_MODE1_PREG},
> +	{0x078F, SIERRA_RX_CREQ_FLTR_A_MODE0_PREG},
> +	{0x7B3C, SIERRA_CREQ_CCLKDET_MODE01_PREG},
> +	{0x023F, SIERRA_RX_CTLE_MAINTENANCE_PREG},
> +	{0x3232, SIERRA_CREQ_FSMCLK_SEL_PREG},
> +	{0x0000, SIERRA_CREQ_EQ_CTRL_PREG},
> +	{0xCC44, SIERRA_CREQ_EQ_OPEN_EYE_THRESH_PREG},
> +	{0x8452, SIERRA_CTLELUT_CTRL_PREG},
> +	{0x4121, SIERRA_DFE_ECMP_RATESEL_PREG},
> +	{0x4121, SIERRA_DFE_SMP_RATESEL_PREG},
> +	{0x0002, SIERRA_DEQ_PHALIGN_CTRL},
> +	{0x3200, SIERRA_DEQ_CONCUR_CTRL1_PREG},
> +	{0x5064, SIERRA_DEQ_CONCUR_CTRL2_PREG},
> +	{0x0030, SIERRA_DEQ_EPIPWR_CTRL2_PREG},
> +	{0x5A5A, SIERRA_DEQ_ERRCMP_CTRL_PREG},
> +	{0x02F5, SIERRA_DEQ_OFFSET_CTRL_PREG},
> +	{0x02F5, SIERRA_DEQ_GAIN_CTRL_PREG},
> +	{0xA9A9, SIERRA_DEQ_VGATUNE_CTRL_PREG},
> +	{0x0014, SIERRA_DEQ_GLUT0},
> +	{0x0014, SIERRA_DEQ_GLUT1},
> +	{0x0014, SIERRA_DEQ_GLUT2},
> +	{0x0014, SIERRA_DEQ_GLUT3},
> +	{0x0014, SIERRA_DEQ_GLUT4},
> +	{0x0014, SIERRA_DEQ_GLUT5},
> +	{0x0014, SIERRA_DEQ_GLUT6},
> +	{0x0014, SIERRA_DEQ_GLUT7},
> +	{0x0014, SIERRA_DEQ_GLUT8},
> +	{0x0014, SIERRA_DEQ_GLUT9},
> +	{0x0014, SIERRA_DEQ_GLUT10},
> +	{0x0014, SIERRA_DEQ_GLUT11},
> +	{0x0014, SIERRA_DEQ_GLUT12},
> +	{0x0014, SIERRA_DEQ_GLUT13},
> +	{0x0014, SIERRA_DEQ_GLUT14},
> +	{0x0014, SIERRA_DEQ_GLUT15},
> +	{0x0014, SIERRA_DEQ_GLUT16},
> +	{0x0BAE, SIERRA_DEQ_ALUT0},
> +	{0x0AEB, SIERRA_DEQ_ALUT1},
> +	{0x0A28, SIERRA_DEQ_ALUT2},
> +	{0x0965, SIERRA_DEQ_ALUT3},
> +	{0x08A2, SIERRA_DEQ_ALUT4},
> +	{0x07DF, SIERRA_DEQ_ALUT5},
> +	{0x071C, SIERRA_DEQ_ALUT6},
> +	{0x0659, SIERRA_DEQ_ALUT7},
> +	{0x0596, SIERRA_DEQ_ALUT8},
> +	{0x0514, SIERRA_DEQ_ALUT9},
> +	{0x0492, SIERRA_DEQ_ALUT10},
> +	{0x0410, SIERRA_DEQ_ALUT11},
> +	{0x038E, SIERRA_DEQ_ALUT12},
> +	{0x030C, SIERRA_DEQ_ALUT13},
> +	{0x03F4, SIERRA_DEQ_DFETAP_CTRL_PREG},
> +	{0x0001, SIERRA_DFE_EN_1010_IGNORE_PREG},
> +	{0x3C01, SIERRA_DEQ_TAU_CTRL1_FAST_MAINT_PREG},
> +	{0x3C40, SIERRA_DEQ_TAU_CTRL1_SLOW_MAINT_PREG},
> +	{0x1C08, SIERRA_DEQ_TAU_CTRL2_PREG},
> +	{0x0033, SIERRA_DEQ_PICTRL_PREG},
> +	{0x0330, SIERRA_CPICAL_TMRVAL_MODE0_PREG},
> +	{0x01FF, SIERRA_CPICAL_PICNT_MODE1_PREG},
> +	{0x0009, SIERRA_CPI_OUTBUF_RATESEL_PREG},
> +	{0x3232, SIERRA_CPICAL_RES_STARTCODE_MODE23_PREG},
> +	{0x0005, SIERRA_LFPSDET_SUPPORT_PREG},
> +	{0x000F, SIERRA_LFPSFILT_NS_PREG},
> +	{0x0009, SIERRA_LFPSFILT_RD_PREG},
> +	{0x0001, SIERRA_LFPSFILT_MP_PREG},
> +	{0x8013, SIERRA_SDFILT_H2L_A_PREG},
> +	{0x8009, SIERRA_SDFILT_L2H_PREG},
> +	{0x0024, SIERRA_RXBUFFER_CTLECTRL_PREG},
> +	{0x0020, SIERRA_RXBUFFER_RCDFECTRL_PREG},
> +	{0x4243, SIERRA_RXBUFFER_DFECTRL_PREG}
> +};
> +
> +static const struct cdns_sierra_vals usb_100_ext_ssc_plllc1_cmn_vals = {
> +	.reg_pairs = usb_100_ext_ssc_plllc1_cmn_regs,
> +	.num_regs = ARRAY_SIZE(usb_100_ext_ssc_plllc1_cmn_regs),
> +};
> +
> +static const struct cdns_sierra_vals usb_100_int_ssc_plllc1_cmn_vals = {
> +	.reg_pairs = usb_100_int_ssc_plllc1_cmn_regs,
> +	.num_regs = ARRAY_SIZE(usb_100_int_ssc_plllc1_cmn_regs),
> +};
> +
> +static const struct cdns_sierra_vals usb_100_ml_ln_vals = {
> +	.reg_pairs = usb_100_ml_ln_regs,
> +	.num_regs = ARRAY_SIZE(usb_100_ml_ln_regs),
> +};
> +
>   /* SGMII PHY PMA lane configuration */
>   static const struct cdns_reg_pairs sgmii_phy_pma_ln_regs[] = {
>   	{0x9010, SIERRA_PHY_PMA_XCVR_CTRL}
> @@ -2513,6 +2647,11 @@ static const struct cdns_sierra_data cdns_map_sierra = {
>   				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
>   				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &pcie_phy_pcs_cmn_vals,
> +				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
> +				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
> +			},
>   		},
>   	},
>   	.pma_cmn_vals = {
> @@ -2532,11 +2671,20 @@ static const struct cdns_sierra_data cdns_map_sierra = {
>   				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
>   				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &pcie_100_no_ssc_plllc_cmn_vals,
> +				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
> +				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
> +			},
>   		},
>   		[TYPE_USB] = {
>   			[TYPE_NONE] = {
>   				[EXTERNAL_SSC] = &usb_100_ext_ssc_cmn_vals,
>   			},
> +			[TYPE_PCIE] = {
> +				[EXTERNAL_SSC] = &usb_100_ext_ssc_plllc1_cmn_vals,
> +				[INTERNAL_SSC] = &usb_100_int_ssc_plllc1_cmn_vals,
> +			},
>   		},
>   		[TYPE_SGMII] = {
>   			[TYPE_NONE] = {
> @@ -2573,11 +2721,20 @@ static const struct cdns_sierra_data cdns_map_sierra = {
>   				[EXTERNAL_SSC] = &ml_pcie_100_ext_ssc_ln_vals,
>   				[INTERNAL_SSC] = &ml_pcie_100_int_ssc_ln_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &ml_pcie_100_no_ssc_ln_vals,
> +				[EXTERNAL_SSC] = &ml_pcie_100_ext_ssc_ln_vals,
> +				[INTERNAL_SSC] = &ml_pcie_100_int_ssc_ln_vals,
> +			},
>   		},
>   		[TYPE_USB] = {
>   			[TYPE_NONE] = {
>   				[EXTERNAL_SSC] = &usb_100_ext_ssc_ln_vals,
>   			},
> +			[TYPE_PCIE] = {
> +				[EXTERNAL_SSC] = &usb_100_ml_ln_vals,
> +				[INTERNAL_SSC] = &usb_100_ml_ln_vals,
> +			},
>   		},
>   		[TYPE_SGMII] = {
>   			[TYPE_NONE] = {
> @@ -2620,6 +2777,11 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
>   				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
>   				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &pcie_phy_pcs_cmn_vals,
> +				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
> +				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
> +			},
>   		},
>   	},
>   	.phy_pma_ln_vals = {
> @@ -2655,11 +2817,20 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
>   				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
>   				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &pcie_100_no_ssc_plllc_cmn_vals,
> +				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
> +				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
> +			},
>   		},
>   		[TYPE_USB] = {
>   			[TYPE_NONE] = {
>   				[EXTERNAL_SSC] = &usb_100_ext_ssc_cmn_vals,
>   			},
> +			[TYPE_PCIE] = {
> +				[EXTERNAL_SSC] = &usb_100_ext_ssc_plllc1_cmn_vals,
> +				[INTERNAL_SSC] = &usb_100_int_ssc_plllc1_cmn_vals,
> +			},
>   		},
>   		[TYPE_SGMII] = {
>   			[TYPE_PCIE] = {
> @@ -2693,11 +2864,20 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
>   				[EXTERNAL_SSC] = &ti_ml_pcie_100_ext_ssc_ln_vals,
>   				[INTERNAL_SSC] = &ti_ml_pcie_100_int_ssc_ln_vals,
>   			},
> +			[TYPE_USB] = {
> +				[NO_SSC] = &ti_ml_pcie_100_no_ssc_ln_vals,
> +				[EXTERNAL_SSC] = &ti_ml_pcie_100_ext_ssc_ln_vals,
> +				[INTERNAL_SSC] = &ti_ml_pcie_100_int_ssc_ln_vals,
> +			},
>   		},
>   		[TYPE_USB] = {
>   			[TYPE_NONE] = {
>   				[EXTERNAL_SSC] = &usb_100_ext_ssc_ln_vals,
>   			},
> +			[TYPE_PCIE] = {
> +				[EXTERNAL_SSC] = &usb_100_ml_ln_vals,
> +				[INTERNAL_SSC] = &usb_100_ml_ln_vals,
> +			},
>   		},
>   		[TYPE_SGMII] = {
>   			[TYPE_PCIE] = {

Looks good:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
