Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68B229B36;
	Tue, 24 Jun 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762859; cv=none; b=OtgljccUVadyX3P8PSyiqBasLBAqhEleLZ6/eFXhpzqKmhi0dgLv8xWL+D+2tLCL6CHhzlbVYVFcBmRloOpfuaV2cOMQIQtnaZrjlhTGCRyPxScVPeceqvi+lmSLB7bcN0PZseC5k79vKVgCsDSofd0RZO5ij8/bq7xjwFn1yT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762859; c=relaxed/simple;
	bh=FoF0p/Xd6d2XLyOYAUtlJno6CwxeRwrK4FnBNCnaBKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocOEWpDTapHuxHGOoFLqedwwR6wVRCpO77zWiyJxU326vdhN4x+LD0OHb0p9L0560sUb8vXNyBtJ8QoETntan1DJU5PE+Tux7WCEJGmiaJym5/qOFYFyGR5XFZcedSlHYMTjI3IsSj1J3uYUeBED3LLYxGxdWQ3JOXFlh50dWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecVKd2zi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecVKd2zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AE1C4CEE3;
	Tue, 24 Jun 2025 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750762858;
	bh=FoF0p/Xd6d2XLyOYAUtlJno6CwxeRwrK4FnBNCnaBKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ecVKd2ziH/fQHEkxedPGzvc57yYb4PGnT4AeISrq7rgxOOdycnFKL1QeeXTExBEaS
	 +s2Is64lJgNBCQQ41Tih6hFBVAxMP3N+/X6tx3DSHcLLWuBDwq3xa99d7A/0qsj5MN
	 U46sSAR/QGw/4sNaoIF5M3BuKJVQ7w/FdOcJpR8DArmFHrRPUVzVRV/YLuJqez+T/Y
	 gx5TagxPGW+z5vGDjn/GksW3VxXnH8t2qc7+I1604sSo9ija8miEkpBtwpfDp8kzJ/
	 r/NTxDwIzbxi6cQDCI8AhL9jlIrFgza4rddfgZey0Rkviglq2t8IX7Kb+QIt7djpr0
	 wVBFmmPQNeuMw==
Message-ID: <cd98add5-dd2f-455f-b534-c83e62a97bd0@kernel.org>
Date: Tue, 24 Jun 2025 13:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: eswin: Documentation for
 eic7700 SoC
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250624103212.287-1-dongxuyang@eswincomputing.com>
 <20250624103256.345-1-dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250624103256.345-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 12:32, dongxuyang@eswincomputing.com wrote:
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  cpu-default-frequency:

Frequency has a type - hz, use it as unit suffix if this stays.

> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop

Anyway, why do you need it? Why would this be a different per board and
why would you ever need to encode it in DT? If firmware initializes
device, just the registers.

> +    default: 1400000000
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'


... and your example is not complete. Add all properties there.

...

> +#define EIC7700_MUX_U_VI_SHUTTER_XTAL_2MUX1_4	68
> +#define EIC7700_MUX_U_VI_SHUTTER_XTAL_2MUX1_5	69
> +#define EIC7700_MUX_U_VO_ACLK_XTAL_2MUX1		70
> +#define EIC7700_MUX_U_IESMCLK_XTAL_2MUX1		71
> +#define EIC7700_MUX_U_VO_PIXEL_XTAL_2MUX1		72
> +#define EIC7700_MUX_U_VO_MCLK_2MUX_EXT_MCLK		73
> +#define EIC7700_MUX_U_VC_ACLK_XTAL_2MUX1		74
> +#define EIC7700_MUX_U_JD_XTAL_2MUX1		75
> +#define EIC7700_MUX_U_JE_XTAL_2MUX1		76
> +#define EIC7700_MUX_U_VE_XTAL_2MUX1		77
> +#define EIC7700_MUX_U_VD_XTAL_2MUX1		78
> +#define EIC7700_MUX_U_SATA_PHY_2MUX1		79
> +#define EIC7700_MUX_U_AONDMA_AXI2MUX1_GFREE		80
> +#define EIC7700_MUX_U_CRYPTO_XTAL_2MUX1		81
> +#define EIC7700_MUX_U_RMII_REF_2MUX			82
> +#define EIC7700_MUX_U_ETH_CORE_2MUX1		83
> +#define EIC7700_MUX_U_VI_DW_ROOT_2MUX1		84
> +#define EIC7700_MUX_U_VI_DW_XTAL_2MUX1		85
> +#define EIC7700_MUX_U_NPU_E31_3MUX1_GFREE		86
> +#define EIC7700_MUX_U_DDR_ACLK_ROOT_2MUX1_GFREE		87
> +
> +/* divider clocks */
> +#define EIC7700_DIVDER_U_SYS_CFG_DIV_DYNM		100

DIVIDER... or just shorter DIV

> +#define EIC7700_DIVDER_U_NOC_NSP_DIV_DYNM		101
> +#define EIC7700_DIVDER_U_BOOTSPI_DIV_DYNM		102
> +#define EIC7700_DIVDER_U_SCPU_CORE_DIV_DYNM		103
> +#define EIC7700_DIVDER_U_LPCPU_CORE_DIV_DYNM	104
> +#define EIC7700_DIVDER_U_GPU_ACLK_DIV_DYNM		105
> +#define EIC7700_DIVDER_U_DSP_ACLK_DIV_DYNM		106
> +#define EIC7700_DIVDER_U_D2D_ACLK_DIV_DYNM		107
> +#define EIC7700_DIVDER_U_HSP_ACLK_DIV_DYNM		108
> +#define EIC7700_DIVDER_U_ETH_TXCLK_DIV_DYNM_0	109
> +#define EIC7700_DIVDER_U_ETH_TXCLK_DIV_DYNM_1	110
> +#define EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_0	111
> +#define EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_1	112
> +#define EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_2	113
> +#define EIC7700_DIVDER_U_PCIE_ACLK_DIV_DYNM		114
> +#define EIC7700_DIVDER_U_NPU_ACLK_DIV_DYNM		115
> +#define EIC7700_DIVDER_U_NPU_LLC_SRC0_DIV_DYNM	116
> +#define EIC7700_DIVDER_U_NPU_LLC_SRC1_DIV_DYNM	117
> +#define EIC7700_DIVDER_U_NPU_CORECLK_DIV_DYNM	118
> +#define EIC7700_DIVDER_U_VI_ACLK_DIV_DYNM		119
> +#define EIC7700_DIVDER_U_VI_DVP_DIV_DYNM		120
> +#define EIC7700_DIVDER_U_VI_DIG_ISP_DIV_DYNM	121
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_0	122
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_1	123
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_2	124
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_3	125
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_4	126
> +#define EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_5	127
> +#define EIC7700_DIVDER_U_VO_ACLK_DIV_DYNM		128
> +#define EIC7700_DIVDER_U_IESMCLK_DIV_DYNM		129
> +#define EIC7700_DIVDER_U_VO_PIXEL_DIV_DYNM		130
> +#define EIC7700_DIVDER_U_VO_MCLK_DIV_DYNM		131
> +#define EIC7700_DIVDER_U_VC_ACLK_DIV_DYNM		132
> +#define EIC7700_DIVDER_U_JD_DIV_DYNM		133
> +#define EIC7700_DIVDER_U_JE_DIV_DYNM		134
> +#define EIC7700_DIVDER_U_VE_DIV_DYNM		135
> +#define EIC7700_DIVDER_U_VD_DIV_DYNM		136
> +#define EIC7700_DIVDER_U_G2D_DIV_DYNM		137
> +#define EIC7700_DIVDER_U_AONDMA_AXI_DIV_DYNM	138
> +#define EIC7700_DIVDER_U_CRYPTO_DIV_DYNM	139
> +#define EIC7700_DIVDER_U_VI_DW_DIV_DYNM		140
> +#define EIC7700_DIVDER_U_NPU_E31_DIV_DYNM	141
> +#define EIC7700_DIVDER_U_SATA_PHY_REF_DIV_DYNM	142
> +#define EIC7700_DIVDER_U_DSP_0_ACLK_DIV_DYNM	143
> +#define EIC7700_DIVDER_U_DSP_1_ACLK_DIV_DYNM	144
> +#define EIC7700_DIVDER_U_DSP_2_ACLK_DIV_DYNM	145
> +#define EIC7700_DIVDER_U_DSP_3_ACLK_DIV_DYNM	146
> +#define EIC7700_DIVDER_U_DDR_ACLK_DIV_DYNM		147
> +#define EIC7700_DIVDER_U_AON_RTC_DIV_DYNM		148
> +#define EIC7700_DIVDER_U_U84_RTC_TOGGLE_DIV_DYNM	149
> +#define EIC7700_DIVDER_U_VO_CEC_DIV_DYNM		150
> +
> +/* gate clocks */
> +#define EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_0	200

151, there should be no gaps in IDs.

> +#define EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_1	201
> +#define EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_2	202
> +#define EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_3	203


...

> +
> +#define EIC7700_CLK_VC_JE_PCLK		685
> +#define EIC7700_CLK_VC_JD_PCLK		686
> +#define EIC7700_CLK_VC_VE_PCLK		687
> +#define EIC7700_CLK_VC_VD_PCLK		688
> +#define EIC7700_CLK_VC_MON_PCLK		689
> +
> +#define EIC7700_CLK_HSP_DMA0_CLK		690
> +#define EIC7700_CLK_HSP_DMA0_CLK_TEST	691
> +
> +#define EIC7700_NR_CLKS		700

Drop

> +
> +#endif /* _DT_BINDINGS_ESWIN_EIC7700_CLOCK_H_ */


Best regards,
Krzysztof
