Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB14623497E;
	Fri,  7 Feb 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919146; cv=none; b=sUXAGZY2cnPafzqRTje6lrOZsyaNOdLD2y5nWh5jOq8XleDRaXCEQEUxGwqv9F5tAff9YKSuIbjiZ6WPxEDFQloofw2ovJwp7chbPRDFZjAdVibkY43hSY9hZiEiypLMX9PH3PieDirjx87L1/Ec3VZjij6FYaa0F1LBkHHReqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919146; c=relaxed/simple;
	bh=3dRjkGHiqCFJ8gaSi26v3o8D8Ct0u2v99KNMcksrZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GEO1ybAntrCPreaOYpI8DbVM7j8h2ZZVtb0lL6sI91qZt/dU8dexRcx9hLIXep1vWehYx/M0aU2DZB0tOmATEHCyOL6JkaVPcv93D4kUFTtdJWAGrlg9fR2Wlya96y4KLIqgmc3ebQjXtx4gPnBwypMP6DmHMFPHBy8ratr2nkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YJ3w2CG9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rlBQXGe+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YJ3w2CG9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rlBQXGe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738919116; x=1770455116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zBX8ExALcmiDF+/qEtJjMkDw2zlW64wywf43Ky2a6Ug=;
  b=YJ3w2CG9vDxDLA+obhiyRgaELfGS9Tg12qxQm983jJnhIRUX6kwJ1v1Z
   rPY8pUzwkJijCjh5ClAJN3JaVFU1HaQVozfjh+sogdDOLBJnc9yPjGHWa
   NoNjzoRbn7Uh2tSxmu6fdX09mqXzA7fNacZFp9WVpdz67IU1oSiFsixOE
   Eeci6dMY4BYMHSmymCrQMUFWOLaX0RJzUXRrhI/N4UzMzKanVn9xdZlHy
   0H4mbRVxEku/wxKaw3uTxgbA6yZhr70CC78n9tKHbCA1lyzactW+/bnNM
   Mdhy4hGxkvl0BStCc2qDrU3YwzNdnemBFlW+Ppoot2jTUnbHRpHvOEDhN
   w==;
X-CSE-ConnectionGUID: Xhk74j5JQbWAra0Mv6t0Pw==
X-CSE-MsgGUID: 3Lct4PK2QXKQuQADTfdvpQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41637080"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 10:03:29 +0100
X-CheckPoint: {67A5CC61-19-727D2C21-EE1B71AA}
X-MAIL-CPID: 6157D79B86A1E4CE120E29C0B85C15C2_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 587D1166639;
	Fri,  7 Feb 2025 10:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738919005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBX8ExALcmiDF+/qEtJjMkDw2zlW64wywf43Ky2a6Ug=;
	b=rlBQXGe+M/MvgnHi6cUhxMQ9Q35+XqdAYZ6WPwI+6SH+/1yaI5UzRqvNEufnNtPdreYPIy
	cYC4s+MO36XQfo5ojoJ19NB53Wqn3A/K9SFJDJBWOC9SNwpkit5PAuL4DYj7RZqMRCnoB9
	T6tbtpOpiMhLKmsPmD8QZDkHPvn4Ta5THB+5R6RYAFPjt50xX4za4NG7Vx4kZqqJ8HeKzz
	Ci5R7i91781egwuqpkaGZP7IDRWkgerCmAyEb8FlsMTQBO/nLX/Y2bWWUmR7GAgvcgKSR/
	Z5fyew18JBVWiLlT6qJ5G7DEI8Ybi5MNEXoTnSIesR2DNmOUo5cNBH0w2y4tdg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx8mq: Add access-controller references
Date: Fri, 07 Feb 2025 10:03:23 +0100
Message-ID: <2568692.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250207083616.1442887-11-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <20250207083616.1442887-11-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 7. Februar 2025, 09:36:15 CET schrieb Alexander Stein:
> Mark ocotp as a access-controller and add references on peripherals
> which can be disabled (fused).
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index df8ba1d5391ae..95a40cccd46b9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi

I just noticed, I missed #access-controller-cells =3D <2>; for ocotp node.
Will add in next version.

Best regards,
Alexander

> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include <dt-bindings/interconnect/imx8mq.h>
> +#include "imx8mq-ocotp.h"
>  #include "imx8mq-pinfunc.h"
> =20
>  / {
> @@ -1275,6 +1276,7 @@ mipi_dsi: dsi@30a00000 {
>  					 <&src IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N>,
>  					 <&src IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N>;
>  				reset-names =3D "byte", "dpi", "esc", "pclk";
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_MIPI_DSI_DISABLE>;
>  				status =3D "disabled";
> =20
>  				ports {
> @@ -1392,6 +1394,7 @@ mipi_csi1: csi@30a70000 {
>  				fsl,mipi-phy-gpr =3D <&iomuxc_gpr 0x88>;
>  				interconnects =3D <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
>  				interconnect-names =3D "dram";
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_MIPI_CSI1_DISABLE>;
>  				status =3D "disabled";
> =20
>  				ports {
> @@ -1414,6 +1417,7 @@ csi1: csi@30a90000 {
>  				interrupts =3D <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clk IMX8MQ_CLK_CSI1_ROOT>;
>  				clock-names =3D "mclk";
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_MIPI_CSI1_DISABLE>;
>  				status =3D "disabled";
> =20
>  				port {
> @@ -1444,6 +1448,7 @@ mipi_csi2: csi@30b60000 {
>  				fsl,mipi-phy-gpr =3D <&iomuxc_gpr 0xa4>;
>  				interconnects =3D <&noc IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
>  				interconnect-names =3D "dram";
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_MIPI_CSI2_DISABLE>;
>  				status =3D "disabled";
> =20
>  				ports {
> @@ -1466,6 +1471,7 @@ csi2: csi@30b80000 {
>  				interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clk IMX8MQ_CLK_CSI2_ROOT>;
>  				clock-names =3D "mclk";
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_MIPI_CSI2_DISABLE>;
>  				status =3D "disabled";
> =20
>  				port {
> @@ -1566,6 +1572,7 @@ fec1: ethernet@30be0000 {
>  				nvmem-cells =3D <&fec_mac_address>;
>  				nvmem-cell-names =3D "mac-address";
>  				fsl,stop-mode =3D <&iomuxc_gpr 0x10 3>;
> +				access-controllers =3D <&ocotp IMX8MQ_OCOTP_ENET_DISABLE>;
>  				status =3D "disabled";
>  			};
>  		};
> @@ -1705,6 +1712,7 @@ gpu: gpu@38000000 {
>  			                         <&clk IMX8MQ_GPU_PLL>;
>  			assigned-clock-rates =3D <800000000>, <800000000>,
>  			                       <800000000>, <800000000>, <0>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_GPU_DISABLE>;
>  			power-domains =3D <&pgc_gpu>;
>  		};
> =20
> @@ -1725,6 +1733,7 @@ usb_dwc3_0: usb@38100000 {
>  			phy-names =3D "usb2-phy", "usb3-phy";
>  			power-domains =3D <&pgc_otg1>;
>  			snps,parkmode-disable-ss-quirk;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_USB_OTG1_DISABLE>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -1757,6 +1766,7 @@ usb_dwc3_1: usb@38200000 {
>  			phy-names =3D "usb2-phy", "usb3-phy";
>  			power-domains =3D <&pgc_otg2>;
>  			snps,parkmode-disable-ss-quirk;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_USB_OTG2_DISABLE>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -1778,6 +1788,7 @@ vpu_g1: video-codec@38300000 {
>  			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
>  			power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_VPU_DISABLE>;
>  		};
> =20
>  		vpu_g2: video-codec@38310000 {
> @@ -1786,6 +1797,7 @@ vpu_g2: video-codec@38310000 {
>  			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
>  			power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_VPU_DISABLE>;
>  		};
> =20
>  		vpu_blk_ctrl: blk-ctrl@38320000 {
> @@ -1839,6 +1851,7 @@ pcie0: pcie@33800000 {
>  			                         <&clk IMX8MQ_SYS1_PLL_80M>;
>  			assigned-clock-rates =3D <250000000>, <100000000>,
>  			                       <10000000>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_PCIE1_DISABLE>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -1882,6 +1895,7 @@ pcie1: pcie@33c00000 {
>  			                         <&clk IMX8MQ_SYS1_PLL_80M>;
>  			assigned-clock-rates =3D <250000000>, <100000000>,
>  			                       <10000000>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_PCIE2_DISABLE>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -1916,6 +1930,7 @@ pcie1_ep: pcie-ep@33c00000 {
>  					       <10000000>;
>  			num-ib-windows =3D <4>;
>  			num-ob-windows =3D <4>;
> +			access-controllers =3D <&ocotp IMX8MQ_OCOTP_PCIE2_DISABLE>;
>  			status =3D "disabled";
>  		};
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


