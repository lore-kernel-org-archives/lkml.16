Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895326B948;
	Tue,  1 Jul 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362099; cv=none; b=f8C/+ejfGKQK5BJ6YYz/V9AtcAqQygOBBwQclM9/jc1SjKe1AWAtHeaDIGgB9MaylP8YecB0oTl4dJqf02Mq56ULn8B0aRRnGP31nP5uXPn5zR7x7IKHDrBW74pLrgg93aqyrq+PwyRyo60CsXkMh7H3MPd5B50OSorQC1F4/nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362099; c=relaxed/simple;
	bh=7HMOHxoNy1+keb7VAvKnbVMcQgX7X0MpHiY3sQvB2BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOzyD1bmPonTY/+L82wKEu2nO2nCLwvkXtxR+WI248Fh/Am9yapKv7kmRIvdnuJx3G/CwCLUi2oQa4k5k4orJ0TDd2vIffExonTeZ1WhMT2sGSh8KJwCMJLJNrftE3T+8V+edd/sjd4HKCb2yFqAW7yKdgvrnnMuP99dRFXIMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lOo6IJ1V; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SVDMR+lO reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lOo6IJ1V";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SVDMR+lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751362096; x=1782898096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=;
  b=lOo6IJ1VorD1GGzdDiNOZDqmxFuzGGV2TTHQ3Jsf+nVRRVPoA5VDYaZu
   RC1OLXttWi+lMD/+TrVdKvoiczQyWCbnW1LtBesI00mQvhA4aXBcUROL7
   fd3H03in/P9smvHzjt74VD83fL/0TkhiZWFbWmG9G0bNsegqJULoXSB2C
   idwijPVrOBxMoMVN4ASXOftSrQmBPRuTy9HSBBw9gHKKpNxDguSRK9r02
   5Gy5tmuBzcxU9od/AoyeylfdDQVpdErB82+wxSXX0L1mwjavRc0lYDEQT
   JH/6fH4Z84zQ/DYJAQNh4tIcOwbasaAk1lxrUAToTMhQWAx18WNn0/JSr
   A==;
X-CSE-ConnectionGUID: 5Zf31/qcQgK5fwixQENzjg==
X-CSE-MsgGUID: nsiA9ZZdRnWjzj7r6P5fPg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44950455"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 11:28:13 +0200
X-CheckPoint: {6863AA2D-7-ABFC28F4-D6731B76}
X-MAIL-CPID: 1F1760676F1FD6B864D31B9984EE8645_5
X-Control-Analysis: str=0001.0A006370.6863AA54.0046,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB77916AFA8;
	Tue,  1 Jul 2025 11:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751362088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=;
	b=SVDMR+lOaUcf3oyASPFD1CmRQwfXLjQ5VrKgrNYJRRQW0kqIaT4ZvvRwBCVvciNuFiF0yp
	5jJFO7JmRmhP+eRD/4kdJGqOUe0Ss8t47mjttec9DibDXU7BCty+xwDDWfrYsmfyp4DQ6V
	D4kp42bB8bZwQPUeNx4gZAHUulfbXk1y5MrgkAk20Vkvwsb9JjS/CeVScYJKO86SGOhkDw
	SdpTLKIOv3hr8Xzs+0nk+E43KXeZy610y3Yz+Dtz3fzyfqVqHDUXdvFAgy5pC5PVN0F5FE
	waAUnxYR2IsB0HMHHqSH5VM8YbwAdS+QOeeON/bXntcKgROBmcASAEoGTZuaTA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <frank.li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Date: Tue, 01 Jul 2025 11:28:07 +0200
Message-ID: <2791534.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
References:
 <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
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

Am Dienstag, 1. Juli 2025, 09:04:41 CEST schrieb Peng Fan:
> Add nodes for LVDS/DISPLAY CSR.
>=20
> Add ldb_pll_div7 node which is used for clock source of DISPLAY CSR.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/=
dts/freescale/imx943.dtsi
> index 45b8da758e87771c0775eb799ce2da3aac37c060..cf67dba21e4f6f27fff7e5d29=
744086e4ec9c021 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi

Why is this specific to imx943 but not imx94? What is the difference anyway?

Best regards
Alexander

> @@ -3,6 +3,8 @@
>   * Copyright 2025 NXP
>   */
> =20
> +#include <dt-bindings/clock/nxp,imx94-clock.h>
> +
>  #include "imx94.dtsi"
> =20
>  / {
> @@ -145,4 +147,36 @@ l3_cache: l3-cache {
>  			cache-unified;
>  		};
>  	};
> +
> +	ldb_pll_pixel: ldb_pll_div7 {
> +		compatible =3D "fixed-factor-clock";
> +		#clock-cells =3D <0>;
> +		clocks =3D <&scmi_clk IMX94_CLK_LDBPLL>;
> +		clock-div =3D <7>;
> +		clock-mult =3D <1>;
> +		clock-output-names =3D "ldb_pll_div7";
> +	};
> +
> +	soc {
> +		dispmix_csr: syscon@4b010000 {
> +			compatible =3D "nxp,imx94-display-csr", "syscon";
> +			reg =3D <0x0 0x4b010000 0x0 0x10000>;
> +			clocks =3D <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells =3D <1>;
> +			power-domains =3D <&scmi_devpd IMX94_PD_DISPLAY>;
> +			assigned-clocks =3D <&scmi_clk IMX94_CLK_DISPAXI>,
> +					  <&scmi_clk IMX94_CLK_DISPAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <400000000>,  <133333333>;
> +		};
> +
> +		lvds_csr: syscon@4b0c0000 {
> +			compatible =3D "nxp,imx94-lvds-csr", "syscon";
> +			reg =3D <0x0 0x4b0c0000 0x0 0x10000>;
> +			clocks =3D <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells =3D <1>;
> +			power-domains =3D <&scmi_devpd IMX94_PD_DISPLAY>;
> +		};
> +	};
>  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


