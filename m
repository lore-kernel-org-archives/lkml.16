Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18A3207;
	Wed,  2 Apr 2025 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586341; cv=none; b=UBzRsDrP2TsRRJZjMtgiO6N/UM8Un2x7GoNHLKEdLzR7RFPVMMWzxe1ocNk+tCvyheBggVBiJ5iI48pkiX7718a4kGgMIvGTK7tBH3AgB77mWYM+F/cSZVW/fOwdQP9LD1+auvphPQFfsOVU+Vldt3ZJeDHIlCWyBIKZT/V0MZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586341; c=relaxed/simple;
	bh=c62McDsiFCGOqG9OWkabQrRPktHz1wVYapoZIsRczbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EozuTSA1o3DOVnTm8lOfb5BRiowiVD20kxHoUktaW7ncSeBkuMNlCcTGZ8T8axjcMcJ2b96m/05SC1SlFRRlPscPWjtKIQKxzd03Cr/6zxg7AIseoCr6piLrEHkezdzAuGW7suPCkJd+KI1xAizOH2Dum93EsOxhxfuSmB0X/ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbMFPEme; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbMFPEme"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499d2134e8so7325512e87.0;
        Wed, 02 Apr 2025 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743586338; x=1744191138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hF+lVD/siQDSMFb2h6qkbqkGQ3tLTrlnM6vF9JHlI90=;
        b=AbMFPEme0RZsJT5pQSoeaGOosD+dRDBtp5WXnXx9NVqqd23R/jlZJ42gTpG7IAQdIt
         +7gCjhxcQyl3eS0u26xHYYHYtp/I53IixJNlHahgLAGm2j5svo1bOHOiw3rU6YqAt2fL
         DflvZBIcTWvagI2mq8ksMYuXmQVJh20Cc0jDdL+LNf3KZOqwviDWSfOoPFk4gB6Mlnj9
         cryunh5JvH4FLBnNSn6vX6USg6NjvYBD9bdikOYBMTZ1rvj6+aWw0xMq1sK9C9OefV5n
         DfSPMsMe8kyBqyVnJSNA0x/uKxI/bMsfiECzY3Yugtp2RBuUgfj6uA27fQnD75Q3S/Si
         Jo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586338; x=1744191138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hF+lVD/siQDSMFb2h6qkbqkGQ3tLTrlnM6vF9JHlI90=;
        b=Hpnkvi18/TyWjhA7luMH3qd6h7eZAFnqJkV2ESH2qiEyn2iuAPCv+y+j7aq0feBYAD
         yCDte3F2+0qc4yaShedasj4/dx1I9Wj3po3iVg1J7Y3EfnhEm31l4oVZcmxYHfWNspXS
         /0fcmvavzv1yTNic1ce5eeQkofQPvs8XZjr+j3nmR4FDcK9XXCTFQksXRfbilPMvLQHw
         3qFGL2qxlUKKoIfJNpCGf252z5A/REnhYkB89OVwbd4cVIHSwSjotI9JnzkcenwP+IWF
         mRM2RwRScn51DdTK7eTolBo1hzfN61H3GNd2Srrs5O7HUEFFBMz3ca5bICrMTt8dCHiq
         6t+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeESApRBvFEBFAGkOioS6jLL3p2f8I3SwpigcJE0nEh+wA/Ef9+5ZBPXduXXKrcYGgFfU1EBhPq6BJ@vger.kernel.org, AJvYcCV2V/TYJrFlqU597vDioDDxzv93h/nyzV24Ed3IxdWueeXCfk/l5feyjI45z2cduMrvG/Mt+Jy4pOdrSfJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzpjnBJOs/xuYO6HfCeT/AQBGD61PA/RsSstZBMxszquz/k7T
	pqjguCuxuHPLb31zatbfGohAPDEXvkX/99NpoROw9CIMkZLAw6485dmDjg==
X-Gm-Gg: ASbGncuZYa1+uWlB6+Vd8YNK12O6ew9Rq2gr1c3rrnUAl1oD5oFsjXskin/lbUKDx9N
	c36790vDFxaCIS7s688050R97fO0ksj0hQMwo9vZlZkhpQsw/sBfevbDIm4zHmYU/IWDEBoxxW1
	Xhi+tFFlvGbldnV2/Mz1KZiHR5BPlLOChOvORTrLo13C9uz2H6S1bnuH1ZviGJA/XOqHzpGws7Q
	4uLPcb1fPCFV3RrBbl+EcjlAV/ozRSbxeiM6BXYL//Qt71ArJwDoicCabwuwpUZaKU2Mb2diDXs
	2HGFpDsUBrPHGuoYTpHMpG/I/CGTlIvh+WlUz4RSz5k/YYZcB5wwWlcAH844HUEo6FLBPjjraeI
	kBzLKYciFEeK9AW++/CCwhGPjcg==
X-Google-Smtp-Source: AGHT+IG+LSUGy2TPrdQBfFTITqkoZ9Zs2Tmb8BCRl2Dip06fYtzbhmGbXqXbG6FToe5ULeeSqNgrRQ==
X-Received: by 2002:a05:6512:6ce:b0:549:5989:bb89 with SMTP id 2adb3069b0e04-54c19c8f41cmr558399e87.35.1743586337502;
        Wed, 02 Apr 2025 02:32:17 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959115esm1584525e87.178.2025.04.02.02.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 02:32:16 -0700 (PDT)
Message-ID: <9a74816b-4a0b-4862-85e5-a10aa2eca586@gmail.com>
Date: Wed, 2 Apr 2025 12:32:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] regulator: bd96801: Support ROHM BD96806 PMIC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1742802856.git.mazziesaccount@gmail.com>
 <734397c8bdb86419fbced3432c7074badaad6657.1742802856.git.mazziesaccount@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <734397c8bdb86419fbced3432c7074badaad6657.1742802856.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/2025 10:57, Matti Vaittinen wrote:
> The ROHM BD96806 is from the software perspective almost identical to
> the ROHM BD96802. The main difference is different voltage tuning
> ranges.
> 
> Add support differentiating these PMICs and provide correct voltages
> for both models.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v1 => :
>   - No changes
> ---
>   drivers/regulator/bd96801-regulator.c | 65 +++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
> index d829289942f9..fb9e7c3314a3 100644
> --- a/drivers/regulator/bd96801-regulator.c
> +++ b/drivers/regulator/bd96801-regulator.c
> @@ -962,6 +962,70 @@ static const struct bd96801_pmic_data bd96805_data = {
>   	.num_regulators = 7,
>   };
>   
> +static const struct bd96801_pmic_data bd96806_data = {
> +	.regulator_data = {
> +	{
> +		.desc = {
> +			.name = "buck1",
> +			.of_match = of_match_ptr("buck1"),
> +			.regulators_node = of_match_ptr("regulators"),
> +			.id = BD96801_BUCK1,
> +			.ops = &bd96801_buck_ops,
> +			.type = REGULATOR_VOLTAGE,
> +			.linear_ranges = bd96805_tune_volts,
> +			.n_linear_ranges = ARRAY_SIZE(bd96805_tune_volts),
> +			.n_voltages = BD96805_BUCK_VOLTS,
> +			.enable_reg = BD96801_REG_ENABLE,
> +			.enable_mask = BD96801_BUCK1_EN_MASK,
> +			.enable_is_inverted = true,
> +			.vsel_reg = BD96801_BUCK1_VSEL_REG,
> +			.vsel_mask = BD96805_BUCK_VSEL_MASK,
> +			.ramp_reg = BD96801_BUCK1_VSEL_REG,
> +			.ramp_mask = BD96801_MASK_RAMP_DELAY,
> +			.ramp_delay_table = &buck_ramp_table[0],
> +			.n_ramp_values = ARRAY_SIZE(buck_ramp_table),
> +			.owner = THIS_MODULE,
> +		},
> +		.init_ranges = bd96801_buck_init_volts,
> +		.num_ranges = ARRAY_SIZE(bd96801_buck_init_volts),

This is wrong. The BD96806 has similar voltage ranges as the BD96805, so 
we should use the

		.init_ranges = bd96805_buck_init_volts,
		.num_ranges = ARRAY_SIZE(bd96805_buck_init_volts),

Also for buck2.

I'll fix this in v3 but wait for a couple of days to see if the rest of 
the regulator patches gain comments :)

Yours,
   -- Matti
