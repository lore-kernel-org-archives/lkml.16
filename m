Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928E92AF1C;
	Thu, 19 Jun 2025 17:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354758; cv=none; b=DYePTf9r/+mkBDN3Emtacn2qeQfVf6F4YuAdVbsiM5+5UhJSx2mHWEyozRrLqD9rFFsOTybL+9v3klcuTx4vryn++/OZzzWwhLejoXJak55qH+dZCi/xKE8Ici3zv9XDpHdNWNosEhB2ERll10S3L8DGnOZd+XglCoUOlOSHDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354758; c=relaxed/simple;
	bh=pRBStzprMVQpdd4OIP73O35IQskVrjlp0foBBFOYXLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPhyixErgAjnaLDv5vSB78U+KnQ5D/0Is4tQThKk0lKdEixXlACHbcx6Dk57wqa+o1e4uqemrRJRT9BpRC+8SaPYLRR2KZFLFK7G/lEYldOpoISej0YHPkz3eIaDgXAOzyDL19xyxsNJFTbFiTD3lYfg+o94mdwjJbMkhXYjzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8ScjhxR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8ScjhxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2DEC4CEF0;
	Thu, 19 Jun 2025 17:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354758;
	bh=pRBStzprMVQpdd4OIP73O35IQskVrjlp0foBBFOYXLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8ScjhxR+n6D1FFXxPcmAsOicx5kvxOnV/MBY1d5+9OzyDoR9ByqLqF8OQsepE1vZ
	 pQA9jF0scj8TlOPcaY+B7xXddCNBSr5ARGkpENx96GxUAkLu74C4oa7RAhGZ9v230Z
	 orB2u90kOoFN8z8IGbpEsuNVMvGiUOc6eCmCNQAftzLmh12MHe6hVDJ/9kh6iHrfkl
	 2dFR0gO+jExeLcciK2ZfvoIsS35RyX1vEhDv2tSWxXv4YrO8iLDlA5EbVS5DCkm63h
	 6qk4C9x+spijKTjg8XToKwj9MPIEF+R+z6+NqCo/3RGuxejNa51/zhpOXQ7NII2Es4
	 Ti4aMrVmU7WWQ==
Message-ID: <81bd7bd3-46c8-45c0-8266-44316597a406@kernel.org>
Date: Thu, 19 Jun 2025 19:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: reset: eswin: Documentation for
 eic7700 SoC
To: dongxuyang@eswincomputing.com, p.zabel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250619075811.1230-1-dongxuyang@eswincomputing.com>
 <20250619080012.1300-1-dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250619080012.1300-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2025 10:00, dongxuyang@eswincomputing.com wrote:
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 2

What is the meaning of the cells?

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/eswin,eic7700-reset.h>
> +
> +    reset-controller@51828000 {
> +        compatible = "eswin,eic7700-reset";
> +        reg = <0x51828000 0x80000>;
> +        #reset-cells = <2>;
> +    };
> diff --git a/include/dt-bindings/reset/eswin,eic7700-reset.h b/include/dt-bindings/reset/eswin,eic7700-reset.h
> new file mode 100644
> index 000000000000..8c3aa3c87ea4
> --- /dev/null

> +++ b/include/dt-bindings/reset/eswin,eic7700-reset.h
> @@ -0,0 +1,460 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2024, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.

2025

> + *
> + * Device Tree binding constants for EIC7700 reset controller.
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#ifndef __DT_ESWIN_EIC7700_RESET_H__
> +#define __DT_ESWIN_EIC7700_RESET_H__
> +
> +#define SNOC_RST_CTRL 0
> +#define GPU_RST_CTRL 1
> +#define DSP_RST_CTRL 2
> +#define D2D_RST_CTRL 3
> +#define DDR_RST_CTRL 4
> +#define TCU_RST_CTRL 5
> +#define NPU_RST_CTRL 6
> +#define HSPDMA_RST_CTRL 7
> +#define PCIE_RST_CTRL 8
> +#define I2C_RST_CTRL 9
> +#define FAN_RST_CTRL 10
> +#define PVT_RST_CTRL 11
> +#define MBOX_RST_CTRL 12
> +#define UART_RST_CTRL 13


...

> +
> +/*TIMER1*/
> +#define SW_TIMER1_RSTN_0 0
> +#define SW_TIMER1_RSTN_1 1
> +#define SW_TIMER1_RSTN_2 2
> +#define SW_TIMER1_RSTN_3 3
> +#define SW_TIMER1_RSTN_4 4
> +#define SW_TIMER1_RSTN_5 5
> +#define SW_TIMER1_RSTN_6 6
> +#define SW_TIMER1_RSTN_7 7
> +#define SW_TIMER1_PRSTN 8
> +
> +/*TIMER2*/
> +#define SW_TIMER2_RSTN_0 0
> +#define SW_TIMER2_RSTN_1 1
> +#define SW_TIMER2_RSTN_2 2
> +#define SW_TIMER2_RSTN_3 3
> +#define SW_TIMER2_RSTN_4 4
> +#define SW_TIMER2_RSTN_5 5
> +#define SW_TIMER2_RSTN_6 6
> +#define SW_TIMER2_RSTN_7 7
> +#define SW_TIMER2_PRSTN 8

That's unreadable - missing indent before the value. Ids equal to block
number are not useful anyway.

The problem is: you still do not use this as an ABI. No driver usage at
all and (comment which I repeat very often) no point to add it to the
bindings. Look at other bindings how this is supposed to look like.


Best regards,
Krzysztof
