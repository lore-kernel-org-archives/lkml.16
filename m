Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D331B425C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481707; cv=none; b=fas5Vap56YcIbHsJzHk0XmgA4PizAdfu0ohTRo/eGInbBhk1gGaNExqnLY/HtBzahoscARDaTPnDXFYVQJ2ws9GHJJ/x9uW7C0QIU93w9/qlfQHUOrNiF2iql5Bxxfw+bRY5JfdR6/ePqw2jJ6jIlI5rDIiEU5zswGEyAEX2rxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481707; c=relaxed/simple;
	bh=0Xe0eY9ltM9JA/g6k+HjMgjHmlrR1XxJ2AAtueBFYsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw2CaOkl/gq5C7CZ8fpKwgPRo6SU+iOds2n+XpkMO5l0z8eo9QjlicvnJ/Or0PaBgM5qU1063ZuJBRZbVjqPMJu2Lt0s8J6SkC25YPb/zo6fvrT+hyxpQB4HXogFjL1Az4S5gigkrb0YzJCLIv5XxUktplFEpBV7+O4ZSzRTMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mI8Wwy1W; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mI8Wwy1W"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e694601f624so3149458276.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749481704; x=1750086504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=mI8Wwy1WMmCoJZDv/R0mEqSJtmkDX6FtEWzxzHBVqWJg+lPN8gctQJGHnK/ygv7XZ8
         Sn6BTw2E4q/d3S1bGx5mk4s3X7yHP7mBHW0uivTT87LAXKNO4dcXxLebtuDrVfMuWMtp
         op/VXO16BW50uOXsCYJ8qWsi5+6ZDDeHY3mHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481704; x=1750086504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=bnVH0hd4QYEgUMaqZPI1YRgh7DPn3QLMLbZ8ntKcOMwCR27AWQUlUj2FBuOlYBw6KU
         4heJVDBRRFCImtdD9sve2T89kbWR2d0Tu7oP0eLVA+vRCj8QyrtLmBrfZkH2UscgZM2E
         18+0eSJF4btPfTv6xZE02SimGkp1MxjTIWUhW8YWPBc8i9FzH5CL9y0TTcM2JCjesIQC
         jS4Zgg6STbMW3y6q3aYs8kDeRMNmTOelPUrXIWMhNiDCcVjAw6yAMB852sf2pjX2K5lY
         49ImBjbHVuGL0YeLRDQMnSrisC/kbuGCgGe+OhvLC0AZ5Xl0QtOjC9/oG97Rsf/xI5/O
         sUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEFrH3Hn+Mk3mDkVwWA3os0v3DUvtvWLXrx6UIKT6CoU5D5qsVBg6etchDZXqb+ky+yWUFVnLX01ly54A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXYhllg4i8LqQ3KZ5nl+GOwa33don3pqInvVZloTldyA/2l7A0
	ntX7BldrFa1O4IsvhKWt6YrWD5ypEnU0+DHvahmFjeZxo3fMFFESRT+5E5rXSsak8Nnvp4njkuZ
	/w++3N8vgT6UfCrgQPzeFSGqOeL+9g/e4g8PXtjHOyg==
X-Gm-Gg: ASbGncvfVWhCdo86GAO66zoOODQhCSTPPuxF5M85/BaNC8kShAJwUZpk/hMu8sQrwYM
	5P61lAInBZUUI0CO6w6/Ws+w6teO+5Zd2wQsGkcxu8QNJ4N2EbVJwEyyUaFaQTrgJ7mLP9WElsu
	+OMkwjISfadDo8yHs3Om9cjeUngKb6Hw==
X-Google-Smtp-Source: AGHT+IGWeHbdh3O/z4F1SRgYEltcGRfcEHSD7V4hOn6ole1VQ4KjcZtPvIWPOt0TiMXPWHw0tvG0AyUJrHsqEFKBpiA=
X-Received: by 2002:a05:6902:1546:b0:e7d:8eee:ae8f with SMTP id
 3f1490d57ef6-e81a22b0e19mr21079312276.19.1749481704110; Mon, 09 Jun 2025
 08:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com> <174948105106.2282643.172324663412189128.robh@kernel.org>
In-Reply-To: <174948105106.2282643.172324663412189128.robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 9 Jun 2025 17:08:12 +0200
X-Gm-Features: AX0GCFu7PzsfDvF842eUkzXyordNhd1acsYRKIzmAppp3qtvrKjzob8AA4_bZEY
Message-ID: <CABGWkvpv-0QjAgz_j3QMJvSO0gpzxY07GpkT0SWL1zEY0Y_ufg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support Engicam MicroGEA boards
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Marek Vasut <marex@denx.de>, 
	Dmitry Baryshkov <lumag@kernel.org>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Eric Biggers <ebiggers@google.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
	Matteo Lisi <matteo.lisi@engicam.com>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
	Primoz Fiser <primoz.fiser@norik.com>, Max Merchel <Max.Merchel@ew.tq-group.com>, 
	Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Markus Niebel <Markus.Niebel@tq-group.com>, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jun 9, 2025 at 5:01=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Jun 2025 12:15:33 +0200, Dario Binacchi wrote:
> > The series adds support for Engicam MicroGEA boards:
> >
> > - BMM
> > - RMM
> > - GTW
> >
> > based on MicroGEA-MX6UL SoM.
> >
> > Changes in v2:
> > - Change local-mac-address to 00 00 00 00 00 00. The actual value will
> >   be set by the bootloader. The previous one was assigned to Freescale
> >   Semiconductor.
> > - Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
> > - Drop an extra blank line from the DTS file.
> >
> > Dario Binacchi (10):
> >   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
> >   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
> >   ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
> >   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
> >   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
> >   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
> >   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
> >   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   9 +
> >  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
> >  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
> >  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
> >  arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
> >  7 files changed, 944 insertions(+), 21 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
bmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
gtw.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
rmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.=
dtsi
> >
> > --
> > 2.43.0
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > branch: imx6ull-engicam-microgea
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi.

Yes, these warnings are generated by included .dtsi files and also appear i=
n
other boards that have already been merged into mainline.
IMHO I have already addressed and fixed the warnings introduced by my board=
s
during the tests executed before submitting the series.

Thanks and regards,
Dario

> Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/nxp/' for=
 20250609101637.2322809-1-dario.binacchi@amarulasolutions.com:
>
> arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: cpu@0 (arm,cortex-a7=
): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc=
-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
>
>
>
>
>


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
