Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA54748F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031617; cv=none; b=sFVl5PtQphX89me9S9mAVS4FsIQ0TBbHxLs+JKGeVTowSUPpdYAm6RWAW/EgM68tn6HPi6dPFl5Ww40OeIH2ERs6sh+yo0n5wQS4IMsNsekxd4gES1tdkv80fmn1AaPncOMu5NG/UyGEB0Dez980ubsAZ/DsCd/mzmaeLgOeo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031617; c=relaxed/simple;
	bh=s8Zvrgk1wNEjJBcuY95Kurh/A9wtiUK4tZivAUQP/44=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cU1R7afvN9NJhjQat6rFo4Rpgapjhw18ViWmd7iTmb/ZJkGOi+KnzSewvunOMxwYz9hXlajuPiXelz3Q8j3EL0szKV4Kl5xa5BruyVV5zUIMWr4heVuOCXA6PM1uATwz1T2ZSspMYsUTGlNalCvyg660ur12W50YaFq9U3dOvd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uMl1B-0005Ea-VH; Wed, 04 Jun 2025 12:06:45 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uMl1A-001m8i-39;
	Wed, 04 Jun 2025 12:06:44 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uMl1A-000Cxx-2s;
	Wed, 04 Jun 2025 12:06:44 +0200
Message-ID: <fbca5b91c43f724656b0a7d7a35176fb2e44d9da.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: eswin: Documentation for
 eic7700 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dongxuyang@eswincomputing.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com
Date: Wed, 04 Jun 2025 12:06:44 +0200
In-Reply-To: <20250604085235.2153-1-dongxuyang@eswincomputing.com>
References: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
	 <20250604085235.2153-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mi, 2025-06-04 at 16:52 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add device tree binding documentation and header file for the ESWIN
> eic7700 reset controller module.
>=20
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/reset/eswin,eic7700-reset.yaml   | 41 +++++++++++
>  .../dt-bindings/reset/eswin,eic7700-reset.h   | 73 +++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700=
-reset.yaml
>  create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.=
yaml b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
> new file mode 100644
> index 000000000000..85ad5fec9430
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/eswin,eic7700-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 SoC reset controller
> +
> +maintainers:
> +  - Yifeng Huang <huangyifeng@eswincomputing.com>
> +  - Xuyang Dong <dongxuyang@eswincomputing.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: eswin,eic7700-reset
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 2
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
> +        compatible =3D "eswin,eic7700-reset", "syscon", "simple-mfd";
> +        reg =3D <0x51828000 0x80000>;
> +        #reset-cells =3D <2>;
> +    };
> diff --git a/include/dt-bindings/reset/eswin,eic7700-reset.h b/include/dt=
-bindings/reset/eswin,eic7700-reset.h
> new file mode 100644
> index 000000000000..7ba31db86141
> --- /dev/null
> +++ b/include/dt-bindings/reset/eswin,eic7700-reset.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2024, Beijing ESWIN Computing Technology Co., Ltd.. All rig=
hts reserved.
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
> +#define GPIO_RST_CTRL 14
> +#define TIMER_RST_CTRL 15
> +#define SSI_RST_CTRL 16
> +#define WDT_RST_CTRL 17
> +#define LSP_CFGRST_CTRL 18
> +#define U84_RST_CTRL 19
> +#define SCPU_RST_CTRL 20
> +#define LPCPU_RST_CTRL 21
> +#define VC_RST_CTRL 22
> +#define JD_RST_CTRL 23
> +#define JE_RST_CTRL 24
> +#define VD_RST_CTRL 25
> +#define VE_RST_CTRL 26
> +#define G2D_RST_CTRL 27
> +#define VI_RST_CTRL 28
> +#define DVP_RST_CTRL 29
> +#define ISP0_RST_CTRL 30
> +#define ISP1_RST_CTRL 31
> +#define SHUTTER_RST_CTRL 32
> +#define VO_PHYRST_CTRL 33
> +#define VO_I2SRST_CTRL 34
> +#define VO_RST_CTRL 35
> +#define BOOTSPI_RST_CTRL 36
> +#define I2C1_RST_CTRL 37
> +#define I2C0_RST_CTRL 38
> +#define DMA1_RST_CTRL 39
> +#define FPRT_RST_CTRL 40
> +#define HBLOCK_RST_CTRL 41
> +#define SECSR_RST_CTRL 42
> +#define OTP_RST_CTRL 43
> +#define PKA_RST_CTRL 44
> +#define SPACC_RST_CTRL 45
> +#define TRNG_RST_CTRL 46
> +#define RESERVED 47
> +#define TIMER0_RST_CTRL 48
> +#define TIMER1_RST_CTRL 49
> +#define TIMER2_RST_CTRL 50
> +#define TIMER3_RST_CTRL 51
> +#define RTC_RST_CTRL 52
> +#define MNOC_RST_CTRL 53
> +#define RNOC_RST_CTRL 54
> +#define CNOC_RST_CTRL 55
> +#define LNOC_RST_CTRL 56

These appear to be register offsets, not individual reset control
indices.

Are PIPE_RST_CTRL, TBU_RST_CTRL, and TEST_RST_CTRL left out on purpose?

regards
Philipp
