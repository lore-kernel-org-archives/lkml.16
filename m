Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54C1FDA97
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421664; cv=none; b=tWBIPxD4ErMBJz0TjtpHYuugg2T1DtePYwcR+oGsgzlHi64z9kPeoqXkZ0a1OX0mnu4VgejF/zIe82tbyLM+T4v8J2xWXtwLv1dEIOLp+5GfVmo1SQ5Zr7Z2Rz+Lbgo99mV+vQ5eU82x5IoOuwgUtUpZR9id2ActbwtGRH1cLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421664; c=relaxed/simple;
	bh=Fv/TKgh9eTLv763R4ZnHaSsINzNdzmor0qGpi2hMieE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNB6Awqc60oWMJUqzDHpMOM2Ri2r476LPRoYIHIkl6OJ8e57Ww6Y+1rw3FaWaQeu4bdsoT6jySOD6nB3jyy2qTNic/Fhz5e29rWoKD5gwztlsbpGew4+EFrEDPCHpAyGghghmVZY24riPGfEENmMOtG9zMPFCF+3anLCfuiSo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DaUJmDRD; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DaUJmDRD"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e731a56e111so3374496276.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748421659; x=1749026459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOp9yb1iMfIg8KuNEiZqm2W0TJPYXEB8Jeh6+Rs46M0=;
        b=DaUJmDRDWrvEV4oDYiTmiNC8vos+udafwSh3UE7/5upzvfscha2bbKPVp1KO27tlGl
         oJbb8IlvqE3SOE19t/SMf+xUoOiwZOtwT2vrhu8Ohw7+onVOgSRaA0N0bTuUWfqal+I9
         QTzkYTtnhsD9Xd3RfpwSb5iroQ+ihU9crEN/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748421659; x=1749026459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOp9yb1iMfIg8KuNEiZqm2W0TJPYXEB8Jeh6+Rs46M0=;
        b=iIcV2W6JszgurdZsq8fZJ2p4dYsxiPHDkLEUJKvUGihq006JrHDqWLMVzs7fTuSv/S
         CnyI3eGF6wSnNjN7bRfYLhCrRJ8sKq3Au2bL6ptcuJh8Ac2wGfVI/ZM8ptC3ZRlb8+1u
         ifV1mKUHr29jtAQKks6DOnU4J5JJqbHHGp09mK9WplbJCofH69VdJF45R+88PFslGQVJ
         5UC+prpkxymxrd2j6hC05ob63j6oVJoXzaRRyT1TP5/fQR7l6xYZkD7U+IZMRkbejMsa
         AwDzW9sRNL02JISfb9IsnKu9zkhMwqO6R6vIvJLR7tQCfu9Cr5OaxmWUKghTwWUmKRcb
         JkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZeDZ7hpForHqjMHp1Yk9X7euRWU2w+4klHz0lv6av8S/8mSDZC8we6Y0zd/pKUS6RoIyu63xcOArMchk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlrv2hb5ANCqEiqZUfH9A2ElynjkBpYzVc5Y7woF8h9Db8ZQOn
	/nc6dB9+3VlzkNlb7ljgn4WZ6zg8Tf1sRboPVOe/+q+gUN8TMxju4ljp2gQPTCo81xX+06hS9jX
	cdFKkTfJ/qOs100bKkcUJ9WEyHbhXuAQfuXlNBhkPhQ==
X-Gm-Gg: ASbGnctkH/eqGHhAamdO95YXfpzKh5VmSfxwSNRM84tlW4JX2Ereboap+hCUhBnHQrP
	joOHF2u2lVmP5KBmQdAOZKQpGqGwsBp2FgzVbWy9mjE3f8BXjA8h3RVDE7Fs9ei88NrnT11KL1o
	aGB2N7nsrOBrEXPXaew/ORB+0xVPYLWtb3DdqJuQOavy6+R5Bv2zkFFF2EJieBrQgI0Q==
X-Google-Smtp-Source: AGHT+IHG+q1O67LcoaeQjuzxx89eFCJ0WIZuOIaFFw6q3mgcHnwnOYXo7QBB9FAQ5+Zaxc+P/C+hqNHKyRIGwe3W7Zo=
X-Received: by 2002:a05:6902:20c8:b0:e7a:c04c:2ee3 with SMTP id
 3f1490d57ef6-e7d919abe7amr17767116276.17.1748421659130; Wed, 28 May 2025
 01:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com> <174783212340.3233254.8471978099095548477.robh@kernel.org>
In-Reply-To: <174783212340.3233254.8471978099095548477.robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 28 May 2025 10:40:47 +0200
X-Gm-Features: AX0GCFtDKpjeiiYu1B01hFlPhJAzdoSRmyi40A5vNz0OboAoy6_1xKRNydKJu3g
Message-ID: <CABGWkvpV2+Ks5jPjE87Bboubu6x-26tX93mum0Lz1kBSpeUxdg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support i.MX28 Amarula rmm board
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Tim Harvey <tharvey@gateworks.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Fabio Estevam <festevam@denx.de>, Heiko Schocher <hs@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org, 
	michael@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Wed, May 21, 2025 at 2:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 21 May 2025 11:28:19 +0200, Dario Binacchi wrote:
> > The series adds support for i.MX28 Amarula rmm board.
> >
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 256 Mbytes SRAM
> >  - LCD-TFT controller
> >  - CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >
> >
> > Dario Binacchi (3):
> >   ARM: dts: imx28: add pwm7 muxing options
> >   dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
> >   ARM: dts: mxs: support i.MX28 Amarula rmm board
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   1 +
> >  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
> >  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
> >  arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
> >  4 files changed, 314 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> >
> > --
> > 2.43.0
> >
> > base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
> > branch: imx28-amarula-rmm
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series.

There are some errors/warnings that need to be fixed in the board's
DTS, but most of them
originate from imx28.dtsi and the lack of data bindings.

By applying the following patches to my series:

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505221947=
32.493624-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505222057=
10.502779-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505222237=
42.516254-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505231919=
28.563368-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505231920=
16.563540-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505231920=
55.563711-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505232031=
59.570982-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505232132=
52.582366-1-Frank.Li@nxp.com/
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202505232045=
24.573028-1-Frank.Li@nxp.com/

and by adding a new patch for the mxs-lradc.yaml binding to the
series, I managed to reach the following situation,
where almost all warnings/errors have been fixed, but one still remains:

make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- CHECK_DTBS=3Dy dtbs
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
  DTC [C] arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb
/home/dario/projects/linux/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb:
spi@80010000: $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
/home/dario/projects/linux/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb:
spi@80010000: Unevaluated properties are not allowed
('#address-cells', '#size-cells', 'broken-cd', 'bus-width', 'clocks'
were unexpected)
from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
make[1]: Nothing to be done for
'arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts'.

I don=E2=80=99t know how to fix this, and the issue also appears when
compiling other boards.

I=E2=80=99ll send out version 2 with the changes to imx28-amarula-rmm.board=
.

Thanks and regards,
Dario

> Ultimately, it is up to the platform
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
>  Base: using specified base-commit 4a95bc121ccdaee04c4d72f84dbfa6b880a514=
b6
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/nxp/' for=
 20250521092826.1035448-1-dario.binacchi@amarulasolutions.com:
>
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@8=
0000000/interrupt-controller@80000000: failed to match any schema with comp=
atible: ['fsl,imx28-icoll', 'fsl,icoll']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@8=
0000000/interrupt-controller@80000000: failed to match any schema with comp=
atible: ['fsl,imx28-icoll', 'fsl,icoll']
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: spi@80010000 (fsl,imx28-mmc): $n=
odename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-spi.dtb: pinctrl@80018000 (fsl=
,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0'=
, 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'a=
uart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'du=
art-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'ho=
g@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit=
@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy=
-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc=
0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cf=
g@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc=
2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', '=
qca7000@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', =
'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not matc=
h any of the regexes: '^p
>  inctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000=
 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000=
 (fsl,imx28-gpmi-nand): Unevaluated properties are not allowed ('#address-c=
ells', '#size-cells' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000=
 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controlle=
r.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10056-pullup@0', 'lcdif-10056@0', 'lc=
dif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036=
@0', 'mac0-10037@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bi=
t@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'm=
mc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cf=
g@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm=
2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@=
0', 'spi2-cfa10056@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'us=
b-10037@0', 'usb0@0', 'us
>  b0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of t=
he regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28-=
mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28-=
mmc): Unevaluated properties are not allowed ('#address-cells', '#size-cell=
s', 'broken-cd', 'bus-width', 'clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,im=
x28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', '=
auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auar=
t3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart=
-4pins@0', 'duart@0', 'duart@1', 'edt-ft5x06-0', 'edt-ft5x06-wake-0', 'fec-=
3v3-enable-0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-0', 'i2c0@0', 'i2c0=
@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0',=
 'lcdif-sync@0', 'leds-0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mm=
c0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@=
0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-=
sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4=
@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1=
', 'usb0-vbus-enable-0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1=
-vbus-enable-0', 'usb1@0'
>  , 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0=
-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,im=
x28-pinctrl): compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinc=
trl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2=
pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins=
@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0=
', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@=
1', 'hog@2', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdi=
f-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', =
'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit=
@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2=
-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0=
', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0',=
 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0',=
 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+=
$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24b=
it@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0-10037@0', 'mac0@0', 'mac0@1', =
'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', =
'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit=
@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036=
@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7=
@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd130=
6-10036@0', 'usb-10037@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'us=
b1@0', 'usb1@1' do not ma
>  tch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: pinctrl@80018000 (fsl,imx=
28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'a=
uart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart=
3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-=
4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0'=
, 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0',=
 'lcdif-24bit@0', 'lcdif-apx4@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1=
@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1=
-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit-apx4@0', 'mmc2-4bit=
@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg-apx4@0', 'mmc2-sck-cfg@0=
', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm=
7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@=
0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any =
of the regexes: '^pinctrl
>  -[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'h=
og@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bi=
t@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lc=
dif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'm=
mc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-=
cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'm=
mc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0',=
 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@=
0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-=
en-pin@0' do not match an
>  y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: pinctrl@80018000 (fsl,imx28-pin=
ctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-=
2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pin=
s@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@=
0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c=
0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdi=
f-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'm=
mc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg=
@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2=
-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm=
4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi-gpiogrp@0', 'spi2@0',=
 'spi3@0', 'spi3@1', 'tx28-edt-ft5x06-pins@0', 'tx28-flexcan-xcvr-pins@0', =
'tx28-lcdif-23bit@0', 'tx28-lcdif-ctrl@0', 'tx28-mac0-gpio-pins@0', 'tx28-p=
ca9554-pins@0', 'tx28-tsc
>  2007-pins@0', 'tx28-usbphy0-pins@0', 'tx28-usbphy1-pins@0', 'usb0@0', 'u=
sb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the=
 regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@8=
0000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,=
imx28-digctl', 'fsl,imx23-digctl']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@8=
0000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,=
imx28-digctl', 'fsl,imx23-digctl']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@8=
0040000/lradc@80050000: failed to match any schema with compatible: ['fsl,i=
mx28-lradc']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@8=
0040000/i2c@80058000/edt-ft5x06@38: failed to match any schema with compati=
ble: ['edt,edt-ft5x06']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@8=
0040000/timrot@80068000: failed to match any schema with compatible: ['fsl,=
imx28-timrot', 'fsl,timrot']
> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@8=
0040000/timrot@80068000: failed to match any schema with compatible: ['fsl,=
imx28-timrot', 'fsl,timrot']
> arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dtb: pinctrl@80018000 =
(fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart=
1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0'=
, 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0',=
 'duart-4pins@0', 'duart@0', 'duart@1', 'enocean-button@0', 'gpmi-nand@0', =
'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdi=
f-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'ma=
c0-phy-int@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit=
@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1=
-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0'=
, 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1=
', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0',=
 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' =
do not match any of the r
>  egexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24b=
it@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-=
4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', '=
mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cf=
g@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@=
0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', =
'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb=
0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match an=
y of the regexes: '^pinct
>  rl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-apf28.dtb: pinctrl@80018000 (fsl,imx28-pi=
nctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2=
-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pi=
ns@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins=
@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i=
2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@=
0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit=
@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mm=
c1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg=
@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'p=
wm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb=
0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match an=
y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', =
'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', '=
lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-reset@0', 'mac0@0', 'ma=
c0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-c=
fg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mm=
c2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', =
'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'sa=
if1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb=
0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]=
+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10058@0', 'lcdif-16bit@0', 'lcdif-18b=
it@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1',=
 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0',=
 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bi=
t@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa1003=
6@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm=
7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd13=
06-10036@0', 'usb-10058@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'u=
sb1@0', 'usb1@1' do not m
>  atch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'h=
og@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bi=
t@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lc=
dif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'm=
mc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-=
cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'm=
mc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0',=
 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@=
0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-=
en-pin@0' do not match an
>  y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx283lc.dtb: pinctrl@80018000 (f=
sl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@=
0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', =
'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', '=
duart-4pins@0', 'duart@0', 'duart@1', 'gpio-button-sw3-mbmx28lc@0', 'gpio-b=
utton-sw4-mbmx28lc@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-cpuimx283@0=
', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcd-3v3-mbmx28lc@0', 'lcdif-16b=
it@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-mbmx28lc@0', 'lcdif-sync@0'=
, 'led-d6-mbmx28lc@0', 'led-d7-mbmx28lc@0', 'mac0@0', 'mac0@1', 'mac1@0', '=
mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@=
0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-=
cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0'=
, 'pwm3@1', 'pwm4@0', 'pwm7@0', 'reg-usb0-vbus-mbmx28lc@0', 'reg-usb1-vbus-=
mbmx28lc@0', 'saif0@0', '
>  saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', '=
usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes:=
 '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-sps1.dtb: pinctrl@80018000 (fsl,imx28-pin=
ctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-=
2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pin=
s@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@=
0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-gpios@0'=
, 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0',=
 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@=
0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-=
cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0',=
 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1'=
, 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', =
'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' d=
o not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', =
'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', '=
lcdif-24bit@0', 'lcdif-apf28dev@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'ma=
c1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mm=
c1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1'=
, 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'otg-apf28dev@0', 'p=
wm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0=
@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@=
0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinct=
rl-[0-9]+$', 'gpio@[0-9]+
>  $'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10055-pullup@0', 'lcdif-16bit@0', 'lc=
dif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'leds-10036@0=
', 'mac0-10037@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@=
0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc=
1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@=
0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@=
0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0'=
, 'spi2-cfa10055@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-=
10037@0', 'usb0@0', 'usb0
>  @1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the=
 regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24b=
it@0', 'lcdif-evk@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1', '=
mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', '=
mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@=
1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@=
0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@=
0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306=
-10036@0', 'usb-10057@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb=
1@0', 'usb1@1' do not mat
>  ch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'h=
og@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bi=
t@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lc=
dif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'm=
mc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-=
cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'm=
mc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0',=
 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@=
0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-=
en-pin@0' do not match an
>  y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-evk.dtb: pinctrl@80018000 (fsl,imx28-pinc=
trl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2=
pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins=
@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0=
', 'duart@0', 'duart@1', 'gpmi-nand-evk@0', 'gpmi-nand@0', 'gpmi-status-cfg=
@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcd=
if-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'led_gpio3_5@0=
', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg=
@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'm=
mc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cf=
g@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0'=
, 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', '=
usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes:=
 '^pinctrl-[0-9]+$', 'gpi
>  o@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dtb: pinctrl@80018000 (fsl,imx=
28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'a=
uart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart=
3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-=
4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0'=
, 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0',=
 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy-res=
et@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd=
-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0'=
, 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sc=
k-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif=
0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1=
', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the rege=
xes: '^pinctrl-[0-9]+$',
>  'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dtb: pinctrl@80018000 (fsl,imx28=
-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'aua=
rt2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-=
2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4p=
ins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0',=
 'i2c0@1', 'i2c1@0', 'i2c1@1', 'i2cmux-10049@0', 'lcdif-10049-pullup@0', 'l=
cdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync=
@0', 'leds-10036@0', 'mac0-10049@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4b=
it@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mm=
c1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@=
0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0'=
, 'pca-10049@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0'=
, 'rotary-10049@0', 'rotary-btn-10049@0', 'saif0@0', 'saif0@1', 'saif1@0', =
'spi2-cfa10049@0', 'spi2@
>  0', 'spi3-cfa10049@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10049=
@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not=
 match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'en-sd-pwr@0', 'gpmi-nand@0', 'gpmi-status-cfg@=
0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0=
', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bi=
t@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc=
1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0=
', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@=
1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0'=
, 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1'=
 do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i=
2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lc=
dif-24bit@0', 'lcdif-m28@0', 'lcdif-sync@0', 'leds-m28@0', 'mac0@0', 'mac0@=
1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@=
0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-=
4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pw=
m2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1=
@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id=
@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$'=
, 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dtb: pinctrl@80018000 (fsl,imx28-p=
inctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart=
2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2p=
ins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pin=
s@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i=
2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lc=
dif-24bit@0', 'lcdif-m28@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', =
'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit=
@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2=
-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0=
', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0',=
 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0',=
 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+=
$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dtb: pinctrl@80018000 (fsl=
,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0'=
, 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'a=
uart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'du=
art-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'ho=
g@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit=
@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy=
-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc=
0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cf=
g@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc=
2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', '=
saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'us=
b0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the =
regexes: '^pinctrl-[0-9]+
>  $', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx287lc.dtb: pinctrl@80018000 (f=
sl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@=
0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', =
'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', '=
duart-4pins@0', 'duart@0', 'duart@1', 'gpio-button-sw3-mbmx28lc@0', 'gpio-b=
utton-sw4-mbmx28lc@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-cpuimx283@0=
', 'hog-cpuimx287@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcd-3v3-mbmx=
28lc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-mbmx28lc=
@0', 'lcdif-sync@0', 'led-d6-mbmx28lc@0', 'led-d7-mbmx28lc@0', 'mac0@0', 'm=
ac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-=
cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'm=
mc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0',=
 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'reg-usb0-vbus-mbmx28lc@=
0', 'reg-usb1-vbus-mbmx28
>  lc@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'u=
sb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match =
any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml=
#
> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/flash@20020000: faile=
d to match any schema with compatible: ['nxp,lpc3220-slc']
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
