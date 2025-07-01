Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759D26B96E;
	Tue,  1 Jul 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362138; cv=none; b=ERigD6BWjdpY+C4ymzidC/W+Xr5vqNUun4KZNMpCKh8VAewNfpv2qffIHVIIOIlTu0wKYS1rip4ziOeGWsYC/5wOlC+sWB9D9eETNfhVMeMOs6T1/SwoaA3IccjxkFoM2goDPdVfFUZmcglKhhe5gHMihs/DCPk0rJxw8+hyKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362138; c=relaxed/simple;
	bh=baD1oT/1E3kXY6Gn5bOXEfsAApfUUQ8npZKA9Kja8lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzZTvi7voP00hxJMSW6qU9c0aJBsp3Y/uzLyxSU9uZDLqLpi4quUPvj9s3yHpFBsQnk2FRegNbE+0CpS+fCa8M6PFbh9c2WVqPoVMVzPjmE++Pv04AzwzAy6KcNcf/IfRZDPLCFqqkdm2mjcBuI+uXclUoEkP7AKzuzxcnFhjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MQmjxL0Q; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GEm6n63V reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MQmjxL0Q";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GEm6n63V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751362136; x=1782898136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=;
  b=MQmjxL0QLGRPpcwpKPUmqSx9BXxisDLLDXzv/9d+58MKfmdwHaqGdoyc
   4wA3yCUHpd4j/Nkkwr5jYVhXRmqXmN8bSvoo32MymMm6Z4U87GpQMMlzX
   uQqkQvx5HJOhS4emPD0hhsMcBOLWMwXz7WJ7PhwYB+w2zOQYfAI1umQcd
   vc2P9CjPVoPYjFmMDuYXhoKWzb8v8k6zSDLEOUizfj5J4aPBX1jEOc9B+
   wUPS53j09FEJ3jfzjyinczr6LUPlPmXU+iIA+ZQbi6aHM5azP8TM3JD1/
   VDkWV25kGhd9MMHoZm2KvUjLY05Dwq5turY6zrLcZD1iVSI/l7J7ZdbaN
   g==;
X-CSE-ConnectionGUID: WiRnyJtIQlKd8eYAiIkgkw==
X-CSE-MsgGUID: KEvumEGjQeW5ktFmMDa8TQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44950481"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 11:28:52 +0200
X-CheckPoint: {6863AA54-44-468F1319-EAD2FB43}
X-MAIL-CPID: F252A9CB289518CC4256D487AD399445_0
X-Control-Analysis: str=0001.0A006398.6863AA84.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27EA316ADA1;
	Tue,  1 Jul 2025 11:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751362128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=;
	b=GEm6n63V9oVKKMGrYiNQ87+e3gq75QL7U9Dsu4EUkBLe7AziTzswNqWWP5drp8WY+i6Has
	osFbvp5LRsU0hRAoxnU5T6U5QNHfGw0wIzBpoBlT2lXrMqrnK3i8zF+kyneY2zEMVn0BOZ
	I6zLKNdNtnKZrGR603x3cT94pRxYNdCTzQp2HkAztHJzDnkWabZZV9U2Hy04vXVRqHeoSt
	AvZhuC5NX9X4dJdSt2Pa1QYjxOITrN2OyBTUgMfVfrFjyLd3sh2Ui7SODaWgGgTXUzqW3x
	oKh3eyePHjmL96j3KQV77xBsEGAntjQtDeDiN8evayfNedMny+/TS9pZmMGcNA==
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
Subject:
 Re: [PATCH 1/5] dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
Date: Tue, 01 Jul 2025 11:28:47 +0200
Message-ID: <6173943.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
References:
 <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
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

thanks for the patch.

Am Dienstag, 1. Juli 2025, 09:04:37 CEST schrieb Peng Fan:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
>=20
> Add clock index for the two CSRs.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++=
++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..4e20e8c8663b3b6665ff91ae6=
3e1539aa8e9cc9b 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -19,6 +19,8 @@ properties:
>            - nxp,imx95-lvds-csr
>            - nxp,imx95-netcmix-blk-ctrl
>            - nxp,imx95-vpu-csr
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr

Please sort them properly

Best regards,
Alexander

>        - const: syscon
> =20
>    reg:
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bin=
dings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad88=
5b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMX94_H
> +#define __DT_BINDINGS_CLOCK_IMX94_H
> +
> +#define IMX94_CLK_DISPMIX_CLK_SEL	0
> +
> +#define IMX94_CLK_DISPMIX_LVDS_CLK_GATE	0
> +
> +#endif /* __DT_BINDINGS_CLOCK_IMX94_H */
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


