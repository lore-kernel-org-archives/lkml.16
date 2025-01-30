Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BA1B6CF0;
	Thu, 30 Jan 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230659; cv=none; b=OMb2y89FuiXc3RvxG51VXeeR+hENjzLZEyEkbkJrg8CxY7Jl5aZftqQw2n1guAD2z1riYWb9uj9xdWSOmIfiiRykCQLi5qVUCCdRW1gkrAlhi6k4ecY5Oqod78wWRCAGE4EquV1PdA1ZUwUiA/ffnzKIKLCoGsbQSZ9k9P/6HHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230659; c=relaxed/simple;
	bh=gvQtqSkM2Azzl9eW+61Gix8wW/h+Xv8INjrnMwEE8SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzq5itOQYfOGaM1tnCj+v9K7hH+czr4fRtluY22bzp35aNkyMwhWIwwybsEQrDZVuIQdQnaWsUN6Lk4+63AtqCQZFTd4EnOWhlEDifRMEh4Orf6JenVQCJWA+B5IUaB3psmK7EqlFjFOecwWg9x5W9Wl0xvAXpO4r8KJGCRUHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=APUY0V3y; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=A3i5T7FW reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="APUY0V3y";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="A3i5T7FW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738230655; x=1769766655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rd2a38AIvhmJF+sIIntn3sECyoZlnToSJTC1vvQgGpU=;
  b=APUY0V3yDmBNFYrSxpahi2Y15X0KNuXtg+M2jLa5TfHZP0+fZD5uesyx
   Q/yaVh5NtzB6VwW2kzP17U2/IlVXcwfUSpwRWZweNO6EtHbTpwV4klFJi
   4RbrbzYw6PFUgohFCqicNznOgl6/eDRyKQOwglVuKemYpqQOoyEkQnsVQ
   VgPyqgzGpqYrlVTXAty5qx6wX+CT9KSVfwaxSlzPzgEmJ2Oc1cqC9iLMP
   fxL+BHaYfmZb4vdskIZ2OouCb2xlpWb81c7JDaCvRCMZNLdzEZy+YBTlh
   lGiWoEhjRMxd31jztgFB/a5qjYKHFR3Ntf9w4t7k7v35hfinC2nk86dD5
   Q==;
X-CSE-ConnectionGUID: yJZjX8XqQE24M0r03Fnbdg==
X-CSE-MsgGUID: bNrVFvibQqGR23uGzNF9Fw==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41370002"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 10:49:43 +0100
X-CheckPoint: {679B4B37-18-1CE016C0-E589DA3E}
X-MAIL-CPID: DD08E384A724ED70B11DF9CE815C91BE_1
X-Control-Analysis: str=0001.0A682F27.679B4B37.00B9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D53167A0C;
	Thu, 30 Jan 2025 10:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738230579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd2a38AIvhmJF+sIIntn3sECyoZlnToSJTC1vvQgGpU=;
	b=A3i5T7FWTQyr0aYYLUVJR4wNh6PNlonbj/S8+XBd3QZqrMwR+vGsSwIvojS4R3cgU/OMLN
	p9Pjody1PtAvH+UMO+dbKEqVe7trjFcXhyEn3iwNJWo3NHdhBF9RPpBjB7zLCwpKaYWXEV
	ICiB9ceIlgzNe2T7pbWQ8XTS9TaHEo8qziWro20NYknF0NYcJFB50W0oH9XiXODbpuC9M+
	/0GVIlz9GvnXV6N/Lz+lCp7pYWn0IUHN1Bi+ZHNn5pYOZljPehu+D+jpE/GuGyzENCqDb6
	CVMMKX1nxi+2ytByDrctmB3v31E1dfGnREvIZZkFJshWW+YSWDuQuQdpHAVSBg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
Date: Thu, 30 Jan 2025 10:49:37 +0100
Message-ID: <2771977.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250121-imx-ocotp-v6-1-76dab40e13db@nxp.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com> <20250121-imx-ocotp-v6-1-76dab40e13db@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 21. Januar 2025, 16:05:31 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Introduce "#access-controller-cells" to make OCOTP be an accessing
> controller, because i.MX Family OCOTP supports a specific peripheral
> or function being fused which means being disabled.
>=20
> Add the i.MX[95,93] OCOTP gate index.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
>  include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
>  include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++=
++++++
>  3 files changed, 72 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Doc=
umentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827=
b71ba434832d2a7 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -54,6 +54,11 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the gate ID associated to the peripheral.
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bin=
dings/nvmem/fsl,imx93-ocotp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5=
a17e53a14f71362
> --- /dev/null
> +++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
> +#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H

This doesn't match the filename.

> +
> +#define IMX93_OCOTP_NPU_GATE		0
> +#define IMX93_OCOTP_A550_GATE		1
> +#define IMX93_OCOTP_A551_GATE		2
> +#define IMX93_OCOTP_M33_GATE		3
> +#define IMX93_OCOTP_CAN1_FD_GATE	4
> +#define IMX93_OCOTP_CAN2_FD_GATE	5
> +#define IMX93_OCOTP_CAN1_GATE		6
> +#define IMX93_OCOTP_CAN2_GATE		7
> +#define IMX93_OCOTP_USB1_GATE		8
> +#define IMX93_OCOTP_USB2_GATE		9
> +#define IMX93_OCOTP_ENET1_GATE		10
> +#define IMX93_OCOTP_ENET2_GATE		11
> +#define IMX93_OCOTP_PXP_GATE		12
> +#define IMX93_OCOTP_MIPI_CSI1_GATE	13
> +#define IMX93_OCOTP_MIPI_DSI1_GATE	14
> +#define IMX93_OCOTP_LVDS1_GATE		15
> +#define IMX93_OCOTP_ADC1_GATE		16
> +
> +#endif
> diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bin=
dings/nvmem/fsl,imx95-ocotp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2d21d1f690974d0215c713521=
68378a150f489af
> --- /dev/null
> +++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
> +#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H

This doesn't match the filename.

Best regards,
Alexander

> +
> +#define IMX95_OCOTP_CANFD1_GATE		0
> +#define IMX95_OCOTP_CANFD2_GATE		1
> +#define IMX95_OCOTP_CANFD3_GATE		2
> +#define IMX95_OCOTP_CANFD4_GATE		3
> +#define IMX95_OCOTP_CANFD5_GATE		4
> +#define IMX95_OCOTP_CAN1_GATE		5
> +#define IMX95_OCOTP_CAN2_GATE		6
> +#define IMX95_OCOTP_CAN3_GATE		7
> +#define IMX95_OCOTP_CAN4_GATE		8
> +#define IMX95_OCOTP_CAN5_GATE		9
> +#define IMX95_OCOTP_NPU_GATE		10
> +#define IMX95_OCOTP_A550_GATE		11
> +#define IMX95_OCOTP_A551_GATE		12
> +#define IMX95_OCOTP_A552_GATE		13
> +#define IMX95_OCOTP_A553_GATE		14
> +#define IMX95_OCOTP_A554_GATE		15
> +#define IMX95_OCOTP_A555_GATE		16
> +#define IMX95_OCOTP_M7_GATE		17
> +#define IMX95_OCOTP_DCSS_GATE		18
> +#define IMX95_OCOTP_LVDS1_GATE		19
> +#define IMX95_OCOTP_ISP_GATE		20
> +#define IMX95_OCOTP_USB1_GATE		21
> +#define IMX95_OCOTP_USB2_GATE		22
> +#define IMX95_OCOTP_NETC_GATE		23
> +#define IMX95_OCOTP_PCIE1_GATE		24
> +#define IMX95_OCOTP_PCIE2_GATE		25
> +#define IMX95_OCOTP_ADC1_GATE		26
> +#define IMX95_OCOTP_EARC_RX_GATE	27
> +#define IMX95_OCOTP_GPU3D_GATE		28
> +#define IMX95_OCOTP_VPU_GATE		29
> +#define IMX95_OCOTP_JPEG_ENC_GATE	30
> +#define IMX95_OCOTP_JPEG_DEC_GATE	31
> +#define IMX95_OCOTP_MIPI_CSI1_GATE	32
> +#define IMX95_OCOTP_MIPI_CSI2_GATE	33
> +#define IMX95_OCOTP_MIPI_DSI1_GATE	34
> +#define IMX95_OCOTP_V2X_GATE		35
> +
> +#endif
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


