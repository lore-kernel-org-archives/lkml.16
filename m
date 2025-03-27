Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FB155312
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090698; cv=none; b=kLdyCO3+15l0rB5tGzfGG+Luk8zvrJVnBxHU46CoCytPkz7a3p+89KZj+bHEYe0zIq87vlDjDGXxha9/oB5C4Fcc9ZJUMSXtmJLX4aSJr5zMq7mv28I/pHcEmcAN//QSzIlOulDCDbIfABzyyfkfP0R7T05ZfJ0hzUiwhS6POHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090698; c=relaxed/simple;
	bh=vAe2BAzY2N92NxfakxIQcqxIPERdP0ngW1a3+ysyFHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvbRFSmiZm3MyEoNniskQKDGuvFTxD3nQBvtb2Q0cPMuV8Hps+vXhhDz1Edtqe5RUyl499BlCIZqmIJELA7k1SXc5nP/ecbrYKvkXlaOOMEgJ3Ar1mz8ltNoncAPcvNi8Dw6Qi1s+XbZP56MMUz6IjtDbrw3M1SphKBV0Xvl2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMJqGF0X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMJqGF0X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6991985e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090695; x=1743695495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=XMJqGF0X9ra/xTBrzOGtSLuJm+2hemfK5eZr+B8fyPlGyrzEwONnwP4LJ/fJnTFgJY
         8/pGEutXpZtf2PUVlzSPeUj1wBh3p1eFYnoLeUwp+Zg8lfnUdjevztx6G2Lf3Sd8wvRo
         INRq0n1UOeYMfTd3BxA+6C2uQfIyCbhKNGjZ+/XNvjnYe6KQOZrPsBdHpzhD7cmblQjW
         8Eo1GIowjsgluks5XtB2ox+GAqsWMVl8FH3vQkmqmQ8ZdSWaauFPM7GCzLdADR4X9dFa
         J4okn7qkDMjpWb4D19wye058vyC97j5GWZ1mlg4mkhCNvws6APHl2VPDwWx0g72wpT4R
         o2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090695; x=1743695495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=V55DkLHSLVCqFsVMvMm5Bow+BVWwQvu/v1g89kFa6k3TsYG6zPYlObSPDxhVZUWR3i
         WCTTpdEOfCo5nFGd3udl42fCgw2k2PgEh9zSpYAORNboSBMKCSMBYWQ0R8e6mS+2+MRF
         9/u/rLHrWdKpNQVI6G3h7wsHgb4soQn7dazgnj8clsHCFpKz+eZXhxxgnK/l6lRfRwiB
         4vsjJ0ds2gVq7/IpNsbLCUXtZ3WaD5JNs2fDD5vvQq13nOiDhrrYZ2c0AcmsnintEX0I
         oJa/Ae9I/hjyNYIN43ADIQkgrLBeW/iqWDdUGVmvf71/hMY3wHBACEwVQVJvtv3a0LUt
         WEwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGrU8tKqoN2fbkV4xAsms5Rgop3d3tQcdV5oBoczb8aM9XDkY0/sCVb0IX9/rKh14IuBOlIHomLkY4FsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63qhuhieHxJMouyfBPeEuQ2WMaWM6fOndksrU5bNfD/uUul5Y
	333eVyEbNeX+cZLD4TMLEW9ccwSmJ59fuyyM9h0kPhKwZ5G4Iw8F4xwRCLJUzJZbg90im/oXF9Y
	7kdY=
X-Gm-Gg: ASbGncufMjjXkv1VMFiMnMvCrmx8DBAxA0RHVDy0aSxP+iohv0ymscEt2J6r6SD+EGr
	CLAXdJO7/drXXUzrX1vK8LSk+Dg+cdssxrrRQFVr5NdRVhvINqsKyD3wThOaG3ywCcXLticQw+S
	R8cChWrd5XbOW1skPzFAQ2busmPB5S23ENvTvqkkdTUjKCgemwOCOFqNERsCShP4ABkWxEEfqTK
	bkQCppQ8xKrWhF+RKefRBzbAcctWd9fjFELE6o85u7vNH6YW8HpfrJFa8mbX1YsuTEXdNtH50J/
	+0wSdRoR3Ky7ZaSq+5pPft1KGjaLWUja7yXKoaGvsGMmLs1TVpkDbclhFPtnejILhKYVsf/3XuB
	s8wMUUMPNcA==
X-Google-Smtp-Source: AGHT+IGEOPuBwOnlQZwn7egIILmy4OvFd8oBZAN1W6IrnJklr7xjZZaKwIAxHQnmoX4bC4rGyQDzNQ==
X-Received: by 2002:a05:6000:2a7:b0:391:bed:ec9e with SMTP id ffacd0b85a97d-39ad1718621mr3637240f8f.0.1743090695191;
        Thu, 27 Mar 2025 08:51:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ad0c6bae8sm4191678f8f.68.2025.03.27.08.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:51:34 -0700 (PDT)
Message-ID: <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
Date: Thu, 27 Mar 2025 15:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -63,6 +63,8 @@
>   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>   
> +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> +
>   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
>   		[PLL_OFF_L_VAL] = 0x04,
> @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>   	.set_rate = clk_zonda_pll_set_rate,
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> +{
> +	const struct clk_init_data *init = pll->clkr.hw.init;
> +	const char *name = init->name;
> +
> +	if (!pll->config || !pll->regs) {
> +		pr_err("%s: missing pll config or regs\n", name);
> +		return;
> +	}

Seems like a strange check - you are calling this function in a loop 
which looks like

for (i = 0; i < desc->num_alpha_plls; i++)
	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);

Can num_alpha_plls be true but alpha_plls be NULL and why is regmap 
considered valid ?

I think you can drop this check.

> +
> +	switch (GET_PLL_TYPE(pll)) {
> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TRION:
> +		clk_trion_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_FABIA:
> +		clk_fabia_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_AGERA:
> +		clk_agera_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> +		clk_zonda_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_STROMER:
> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> +		clk_stromer_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> +		clk_alpha_pll_configure(pll, regmap, pll->config);
> +		break;
> +	default:
> +		WARN(1, "%s: invalid pll type\n", name);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -81,6 +81,7 @@ struct pll_vco {
>    * struct clk_alpha_pll - phase locked loop (PLL)
>    * @offset: base address of registers
>    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> + * @config: array of pll settings
>    * @vco_table: array of VCO settings
>    * @num_vco: number of VCO settings in @vco_table
>    * @flags: bitmask to indicate features supported by the hardware
> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>   	u32 offset;
>   	const u8 *regs;
>   
> +	const struct alpha_pll_config *config;
>   	const struct pll_vco *vco_table;
>   	size_t num_vco;
>   #define SUPPORTS_OFFLINE_REQ		BIT(0)
> @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			       const struct alpha_pll_config *config);
>   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			     const struct alpha_pll_config *config);
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
>   
>   #endif
> 
