Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D66232367;
	Wed, 21 May 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819586; cv=none; b=jRauP0eTp3459v6HILzSm+P5RkMJ0Nsx0SGZKLXK9AyaFCA7MOxXJo4VXcMHqFwJQuwrPOrAs84nTOrzvNHFCB1bNRyYNZH5krIxCtTZpF+nWIQIvGDCQSni079KDSGYM5wai1L0qh3wbgR4kz2UKPO1tMrEBsc39ne2xKMUSPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819586; c=relaxed/simple;
	bh=ZOpY/97Ajk1+AuKUdRW8yZtKpNrYH5Zl/G/U2z+Pzyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcVK6O4WTZ0We1/yxlmQkFOPqbzXiFo9PTUOxd6I4QwUxRFJrT8o+R0X94eIKVeK+eIPH88niRzideGZNjlL5wkg4L+9nsLEZrU+4ZWVpWGAaLFzals65wyTZh+zQc2Ny3fZpuIi6iWYIn1+Ftk3bd/h9vC5E+wK5mGkzKBMXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aPjLRi73; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aPjLRi73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747819582;
	bh=ZOpY/97Ajk1+AuKUdRW8yZtKpNrYH5Zl/G/U2z+Pzyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPjLRi73TKSd6G/BjOpJGab4gaFrJiIEj1xZD070Y7LlyE0OH0h/VmZg71+Hg/qP3
	 +hfsHj3aOx+42qiffBTrkuL1KkpjP3BGQ4dGSTnRd+xENmz0cYf+Jwo87aSZTH9vG5
	 oKdXARLPjySUfLo5Ri6ddTtmLtHtDJMSmdBrvbWPEpd2ZqpUYbJQKt09CeH84Z9w78
	 HWdoOHDcUFVs+pKbqVYzuaKQYQOO1SQcD8vgP7akuVFvNTpHlHpTihMsH5K4/Wz/gD
	 T1JrMuQpmJUKrV3qktg5Uzf0hEw9CWYykGKc3fSVUCfIOw1X46+CPom/EtlM3NaYeY
	 95DxLunFkj97g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD8B517E02BE;
	Wed, 21 May 2025 11:26:21 +0200 (CEST)
Message-ID: <9c594eaa-9ddc-4340-ac0d-d911073764ac@collabora.com>
Date: Wed, 21 May 2025 11:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250521091626.4283-1-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250521091626.4283-1-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/05/25 11:16, Friday Yang ha scritto:
> Add initial ostd setting for mt8186. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement. Without this, the VENC HW works
> abnormal while stress testing.
> 
> Fixes: 86a010bfc739 ("memory: mtk-smi: mt8186: Add smi support")
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

I agree about this commit and you can get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I still have a question.

This driver is getting lots of those big OSTD arrays, and I can foresee this
getting bigger and bigger with every new SoC getting supported in there.

I'd like to understand how we can improve that, hence, can you please describe
how the OSTD values are calculated and how are they limiting the bandwidth?

I'm thinking that we can do something such that we get this runtime calculated
instead of just holding fixed values, so that we may eventually replace all those
big arrays with just a few values (foreseeing 3-4 values) and performing a big
cleanup (which may bring further improvements in the future).

Cheers,
Angelo

> ---
>   drivers/memory/mtk-smi.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index c086c22511f7..733e22f695ab 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -320,6 +320,38 @@ static const u8 mtk_smi_larb_mt6893_ostd[][SMI_LARB_PORT_NR_MAX] = {
>   	[20] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1},
>   };
> 
> +static const u8 mtk_smi_larb_mt8186_ostd[][SMI_LARB_PORT_NR_MAX] = {
> +	[0] = {0x2, 0x1, 0x8, 0x1,},
> +	[1] = {0x1, 0x3, 0x1, 0x1,},
> +	[2] = {0x6, 0x1, 0x4, 0x1,},
> +	[3] = {},
> +	[4] = {0xf, 0x1, 0x5, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
> +	       0x1, 0x1, 0x1,},
> +	[5] = {},
> +	[6] = {},
> +	[7] = {0x1, 0x3, 0x1, 0x1, 0x1, 0x3, 0x2, 0xd, 0x7, 0x5, 0x3,
> +	       0x1, 0x5,},
> +	[8] = {0x1, 0x2, 0x2,},
> +	[9] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
> +	       0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
> +	       0x1, 0x1, 0x1, 0x1, 0x1,},
> +	[10] = {},
> +	[11] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
> +		0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x8, 0x7, 0x7, 0x1, 0x6, 0x2,
> +		0xf, 0x8, 0x1, 0x1, 0x1,},
> +	[12] = {},
> +	[13] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x6, 0x6, 0x6, 0x1, 0x1, 0x1,},
> +	[14] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1,},
> +	[15] = {},
> +	[16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
> +		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
> +	[17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
> +		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
> +	[18] = {},
> +	[19] = {0x1, 0x1, 0x1, 0x1,},
> +	[20] = {0x2, 0x2, 0x2, 0x2, 0x1, 0x1,},
> +};
> +
>   static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
>   	[0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
>   	[1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
> @@ -491,6 +523,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
>   static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
>   	.config_port                = mtk_smi_larb_config_port_gen2_general,
>   	.flags_general	            = MTK_SMI_FLAG_SLEEP_CTL,
> +	.ostd			    = mtk_smi_larb_mt8186_ostd,
>   };
> 
>   static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
> --
> 2.46.0
> 

