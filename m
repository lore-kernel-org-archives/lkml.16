Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65501F0984
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549463; cv=none; b=n6lLJNFIzO6jWAHx3VqdE2M5Pt69tWxvS48jginfGZ8XY8Dyzr6uCOyzPIcI3fHa5oZYF9gDw8xYQ+sKp/qAbznimQh4RwttQLT6JB4OWJsptn8hE4snpF1buY/aK2/iFYGF4AJQatrTwzVRDBTtJXxc/Y5v0gyxvehH7Q7lmn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549463; c=relaxed/simple;
	bh=N7gYYHLZCiIa80T8uyfmFC7KQ4wN+euvQF5YpOGeAoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4Ov2Qt207OZQM4iRlGh05i3/32lhKxXFl8dm+/KqbM/Zd8DASw1h8n88EMpelyNTe+/xqfhp4guortY6biV9VXyfnc6MVC+gVpzvVZdJIcWpa8ciJkyfFqTvPeNIMWOWCETaGLWiqgKPvljjIOYBZhutu5lJ86W8iZoewy6Bkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EJob9pHR; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EJob9pHR"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7d8eb10c06so3910057276.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549461; x=1750154261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9dEIw1urmXPXSyEjfiptdSoKUNx7ybVNTHvf2bqei8=;
        b=EJob9pHRH5F+wxe0FWaouFoARtIaSRUBtRtOWsEibLyVxQCBM+aQjGMq4gWtifTddL
         rkFI0EQ69KTxovcyAnwNdPaidj6pIbUTxnde7yPPFJ7c5xU1bdM3d+7UazXkVh47FBmx
         +GaRNCzIsaEfnnl29wxPimH+CsQIpPqKVYQN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549461; x=1750154261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9dEIw1urmXPXSyEjfiptdSoKUNx7ybVNTHvf2bqei8=;
        b=ZpdH75yTkLGZLddLWpdwy3BfF9WA4nfnIov8jPFdPkaHKliUMebVluO2HtMcm4p11y
         MWIQC1LCjudqTY96qVEFXdoiCbmxtbeAXGu5qxzChDNo8BYee+yMAixaaILWxUAz2OGs
         iHpiXH50QdLvQsIvCpc7pJ6cuSj2tLB74EPLnLOjkAxfzslSWANafCcaiw413olBxguK
         9QxHB62ZDhXmeeuaBjlG1mwXuWrI3aDfF7ye+wvgHhh2kMtatDSbNa4FAVvdpZxyEPIh
         UfkRup0Sq1ks5v6WCCdQgmCgihdit6WijzEQQifmEkxL4mRTXFB5AwLzJEpWsq45jEGi
         BaAQ==
X-Gm-Message-State: AOJu0Yx57MSCETXrQom17a1ps1hW0mRSF3qqXymdvtICCIBPq+RP2+F9
	MzbcL9vSaO32A5m0iJxUaNy6BYBFVgHJ/BaN2qT7E308F7BFqk3rrNQ4HwZsp2EbMxj/Rwd5IXZ
	wGaVp/mum2O45L1F2ioU8Bkat3wpPKw6Qo4WGx+5W0g==
X-Gm-Gg: ASbGncvjdSDY1mbmnppVcUYzolb0QzJXPQ8Ygm58MlqvWdeQvtJbYHpujflwqBPAKY1
	11w0zC+aQTgkv1K1TYtuVRmXeigN4/58mJL7kr0hAo7KhFUdZPxJJXZ1bdssAjV88ua2XebQFyk
	QfOTnl0whJxm6Hx2fH/p+hYeXgwSHXHoSvcQLPHBPoiQ==
X-Google-Smtp-Source: AGHT+IFodtS1VYnVo9bbt5qXymWY3lsJGCo0KtXDocUtEfb/F89rGPTFtUZIHa5j2tOsbpXapJCL6XzrNaw6xaDkRr0=
X-Received: by 2002:a05:6902:2841:b0:e81:45da:4aed with SMTP id
 3f1490d57ef6-e81a215345amr21634275276.26.1749549460846; Tue, 10 Jun 2025
 02:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
 <20250609101637.2322809-3-dario.binacchi@amarulasolutions.com> <aEb6uQNDHYRKpiI6@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb6uQNDHYRKpiI6@lizhi-Precision-Tower-5810>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 10 Jun 2025 11:57:29 +0200
X-Gm-Features: AX0GCFvXGARRqo4WtdQpGt4geFTzn6cBu8i4y7nYSpclBk1GV6MofVQXo2ClbwU
Message-ID: <CABGWkvp4aEb-QusmJPat=khJk9cAaqq6CVxcC8ma8Wzqecbvfg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Matteo Lisi <matteo.lisi@engicam.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Mon, Jun 9, 2025 at 5:16=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Jun 09, 2025 at 12:15:35PM +0200, Dario Binacchi wrote:
> > Support Engicam MicroGEA-MX6UL SoM with:
> >
> >  - 256 Mbytes NAND Flash
> >  - 512 Mbytes DRAM DDR2
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v2:
> > - Change local-mac-address to 00 00 00 00 00 00. The actual value will
> >   be set by the bootloader. The previous one was assigned to Freescale
> >   Semiconductor.
> >
> >  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.=
dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > new file mode 100644
> > index 000000000000..38971f6512a2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacch=
i@amarulasolutions.com>
> > + * Copyright (C) 2025 Engicam srl
> > + */
> > +
> > +/dts-v1/;
> > +
> > + #include "imx6ull.dtsi"
> > +
> > +/ {
> > +     compatible =3D "engicam,microgea-imx6ull", "fsl,imx6ull";
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
> > +};
> > +
> > +&fec1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_enet1>, <&pinctrl_phy_reset>;
> > +     phy-mode =3D "rmii";
> > +     phy-handle =3D <&ethphy0>;
> > +     local-mac-address =3D [00 00 00 00 00 00];
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy0: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     reset-gpios =3D <&gpio5 9 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <4000>;
> > +                     reset-deassert-us =3D <4000>;
> > +             };
> > +     };
> > +};
> > +
> > +/* NAND */
> > +&gpmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > +     nand-ecc-mode =3D "hw";
> > +     nand-ecc-strength =3D <0>;
> > +     nand-ecc-step-size =3D <0>;
> > +     nand-on-flash-bbt;
>
> Not related this patch, latest device tree binding for nand-controler sho=
uld
> look like
>
>         nand@0 {
>                 reg =3D <0>;
>                 nand-ecc-mode =3D "hw";
>                 ...
>         }
>
> I am not sure if above dts work at your ul board.

I tested the change you suggested, but it's not working on my board.

I also did a search through various DTS files on the i.MX6ULL SOM, and inde=
ed,
the scheme I adopted is used by other boards that have already been merged.

Thanks and regards,
Dario

>
> Frank
>
> > +     status =3D "okay";
> > +};
> > +
> > +&iomuxc {
> > +
> > +     pinctrl_enet1: enet1grp {
> > +             fsl,pins =3D <
> > +                     MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN      0x1b0b0
> > +                     MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00 0x1b0b0
> > +                     MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN      0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1  0x4001b00=
9
> > +                     MX6UL_PAD_GPIO1_IO07__ENET1_MDC         0x1b0b0
> > +                     MX6UL_PAD_GPIO1_IO06__ENET1_MDIO        0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_gpmi_nand: gpminandgrp {
> > +             fsl,pins =3D <
> > +                     MX6UL_PAD_NAND_CLE__RAWNAND_CLE         0xb0b1
> > +                     MX6UL_PAD_NAND_ALE__RAWNAND_ALE         0xb0b1
> > +                     MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B       0xb0b1
> > +                     MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B 0xb000
> > +                     MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B     0xb0b1
> > +                     MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B       0xb0b1
> > +                     MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B       0xb0b1
> > +                     MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07   0xb0b1
> > +             >;
> > +     };
> > +};
> > +
> > +&iomuxc_snvs {
> > +     pinctrl_phy_reset: phy-resetgrp {
> > +             fsl,pins =3D <
> > +                     MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09     0x1b0b0
> > +             >;
> > +     };
> > +};
> > --
> > 2.43.0
> >



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
