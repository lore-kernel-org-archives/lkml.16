Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168123314B;
	Wed,  2 Apr 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576732; cv=none; b=KF0cs0WtnPC93ZN3McKqjnDVafV/LbYQge7ntaUFrK7s3hJAwYB6EJw7BmX7TgB9CZms2IQSXIjS05wkrDTnuFXsFU5AduV0KqRTTfdTppOyUFrOlN3y5opMoc4IO6HPEViPBD5kgfiQlP3aBo1wdbkQMQXttvYQlu+EIhA1JTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576732; c=relaxed/simple;
	bh=Qy/1IpLmdqk0eoWiuuWOg2HuWfB63T6KL+1+HLO4yEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+kyebl/093G6GvZxmB4GaR61DtwpzSDPCEebN481pQMbVw+BSTf3iTVM/x2RHNlFTO1wOu7dbra0S9nmvD34DhE80PpZgPSAVG19GxIjSmIhW+qInpbBtSL6avDQy7Jaibv1l4ezsAmJDaBgW8aVjgoIQuPuWgqv4ZOgFWp3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvHxLXR3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvHxLXR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E10C4CEDD;
	Wed,  2 Apr 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743576730;
	bh=Qy/1IpLmdqk0eoWiuuWOg2HuWfB63T6KL+1+HLO4yEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvHxLXR3FgbpId+ViaVyp4nkr/8eDd6JHBk4vUb4WFfJOPOk2znfCL5L7ZEUctQV6
	 Cz9CFdPTaFRk5gtUlYHmOgxCRAw77iKnZ+v02CHSGs5HJQleUhhGhTp9JXuTaD/VWr
	 mtmyEUjnmVW0m8iIzlzbxF5KM8oAnL3wb0Q1qHe2by94F/d+JZDFqv3Qjsdet6V830
	 3eQl+IY6yLdzW9M6Z8Yed5SCAJ1ujLmcN09jVMCC7VS+Fy9weRuda/4HjgqbqfXTSx
	 9125wOYgiBjAH6CXH59AVa8QcmB9Y0DsNKmbbx4yJ4Oo0VdyA8pY2HiIzbwwLa8ytZ
	 DR020zzg/ZzXg==
Date: Wed, 2 Apr 2025 08:52:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250402-toucanet-of-inspiring-aurora-e7ba6f@krzk-bin>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-2-laurentiumihalcea111@gmail.com>

On Tue, Apr 01, 2025 at 11:43:59AM -0400, Laurentiu Mihalcea wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus@30df0000 {
> +        compatible = "fsl,imx8mp-aipstz";
> +        reg = <0x30df0000 0x10000>;
> +        power-domains = <&pgc_audio>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <3>;
> +        ranges = <0x30c00000 0x30c00000 0x400000>;
> +
> +        dma-controller@30e00000 {
> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +            reg = <0x30e00000 0x10000>;
> +            #dma-cells = <3>;
> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +            clock-names = "ipg", "ahb";
> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +        };
> +    };
> diff --git a/include/dt-bindings/bus/imx-aipstz.h b/include/dt-bindings/bus/imx-aipstz.h
> new file mode 100644
> index 000000000000..b81b4654e00f
> --- /dev/null
> +++ b/include/dt-bindings/bus/imx-aipstz.h

Filename matching compatible, if this stays.

But more important, I do not see this being used - neither here in
example nor in the driver, so not a binding.

> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +#define _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX_AIPSTZ_MASTER 0x0
> +#define IMX_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX_AIPSTZ_MPL 0x1
> +#define IMX_AIPSTZ_MTW 0x2
> +#define IMX_AIPSTZ_MTR 0x4
> +#define IMX_AIPSTZ_MBW 0x8

IDs are not hex values. What do you exactly represent here?

Best regards,
Krzysztof

