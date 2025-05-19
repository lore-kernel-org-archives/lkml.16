Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E111185;
	Mon, 19 May 2025 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747624233; cv=none; b=BwTx2JXy+cn5Btf9jBtffwpVTc0JoE0BPK8u7bGBqnTDR9jsAmhl38d1w0IlNCMhXn+rJJZSMg7xoPrsSMl0Y1br8MogOft9jYeQg1vY7kl42vBCkp8yddBwu4rTB21A8vytRtFgqyJGss46AzY1TPCabOucecDUZ/wl1PSe/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747624233; c=relaxed/simple;
	bh=yHAPLS6jjuSLhfQ8PXf0pkKwXVDm9dlSYFgS/w4VFvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpceZ+0teLlzyThf1VzOqTe7N6f6QHCaJ+AECZmyxvN8+CQMvH4fxQpglYMd/jNbXlxvk1dWhokIGBK12LVJJ7zMameqzGgAO2IQR2xI2xLKSGx5XyxJsOar/Exypg3msJ/stFG4yBRg4ASTw5C5x3jTlncfsPHlyBQWFnzYjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0AE0wBb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0AE0wBb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6011407431cso3831459a12.3;
        Sun, 18 May 2025 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747624229; x=1748229029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PjvaaU1nC+1opFg++G/pY6ZC2Hyjnh3wj0PCLJBEWE=;
        b=h0AE0wBbUbc0kXAs2SpKTulemSKM/EdsyA3VfOpwgOnFAEw8QmeTWqs69C5OtM7nIo
         ZGYL7VSVKdN58rsKo7y2s7MuikDuez764Q3VONq0H3r02hQm11tQfFjuGGByTMAyXzwC
         FeZEOvfXORRVMeCde7Bs6elgs5G/uKIZxpAjy1s+VgBIeEgG+kuI/LLrX+2QXYeq9oDx
         IVgMOgZEryddpjRFDBebDCJ9NSPiZP4PeFhnPcBuFmaDG9APFqv7us6Pkpgsac62mBb5
         5UtqjP7nMDwWkDbYEzgDh4Hjl/AeH7ELOcBOywSItunLJbQCWCn62FtRzH/s9Mvt9A1Y
         nqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747624229; x=1748229029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PjvaaU1nC+1opFg++G/pY6ZC2Hyjnh3wj0PCLJBEWE=;
        b=WESv0dSbSQ50y2g9Y+mhFIxdlDXJirvUrLcQf8pC1Da3QgeSdM7RtiZ+pRCRIhq354
         lFouER0p95iwYiBBdFhNNc3GM0K/XSQW/x18cLvBZxFTtiZAaF9qvhqUKLH1NIbV69WB
         g02CSCKDNEdY6jMYcoSu3HDdcclwO0M8Fglr5PLHXwQa/Lj6vxOoDafl5slxvNlNg2Sd
         Jiz0qnS6o4ds3BP/hH+TGtYKO9xdwlJq3YehYpWfOfU79SPTbFUQPPcHEnwbBqfJb/zH
         vXOssjTJ1Uq2a9BM2/+7jjKQr/an295ZQD1V4oxHbq/vgNxsFxTj8CT/3yr2qRK3to4f
         YLIA==
X-Forwarded-Encrypted: i=1; AJvYcCWFA4x34gT8zMBZPOLe7rRASWqNZFKxStlo3Z7NE6HAl3pVqX/EuOiv2DQMdVXoDjNCEl6XV39kLZY8k+0W@vger.kernel.org, AJvYcCWsM+ICaq/BmGyrxTiBUtsb1OTnWkDgsV8IEomhq+gfC954KylUWH0eA8PEjTXZzjCHQ+cDZs1ZD8Gc@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/62ExESHl1M6xQCk3HYBknt4B2XW8qEyx6OmD4lx6MuUwJvy
	ojQzfalUBNoHLXofPIm6XKfjcRRvC/y+03rtTBfxTz6gRhD9DIxNoVcbY0/w+RzTgW+uR4ZCf88
	VnyfLOopxoXAmzWfcV/BEuwQD2iTXIkA=
X-Gm-Gg: ASbGncv4BoHaB8ex5wbCfQLaXTu93PgFexi6ADk41xeqtHOPZC8YIbRpBT3gjLyEFm4
	m4DJctHfO/WAQtkGyz83Rkxi/ORlG0P9LpvY2uvtpJfveugUaFqPePm6hZJ8drTRBSy4POzU9rq
	0jC+ajLQMfSp4AH/Q6BZ7oexbu3BXiLXVy
X-Google-Smtp-Source: AGHT+IEVkb5RoxfyEOqNdmb2FFlLdTMXnUBayP9UAzkULXboHjIaViD0rLelsuDRThgAFvyiT6lWMX8f9vw7kjwXwcM=
X-Received: by 2002:a17:907:96a1:b0:ad2:2ef3:d487 with SMTP id
 a640c23a62f3a-ad536f5ee59mr905413766b.58.1747624229296; Sun, 18 May 2025
 20:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518080356.43885-1-ziyao@disroot.org> <20250518080356.43885-4-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-4-ziyao@disroot.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 19 May 2025 11:10:16 +0800
X-Gm-Features: AX0GCFtq3DXnofzn-kBzvLENqC_QvkrAY1A7sezshsGgk2UbdzGu8AXnAz3_vsQ
Message-ID: <CAMpQs4L7U=Mkw=pburiUpJLEm=tHeMOW+6PRhWPTMnOGHxFqyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] LoongArch: dts: Add initial SoC devicetree for
 Loongson 2K0300
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yao:

Thanks for your patch.

On Sun, May 18, 2025 at 4:05=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
> core and targets embedded market. Only CPU core, legacy interrupt
> controllers and UARTs are defined for now.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/loongarch/boot/dts/loongson-2k0300.dtsi | 184 +++++++++++++++++++
>  1 file changed, 184 insertions(+)
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
>
> diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarc=
h/boot/dts/loongson-2k0300.dtsi
> new file mode 100644
> index 000000000000..17974f793947
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Loongson Technology Corporation Limited
> + * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       compatible =3D "loongson,ls2k0300";
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       cpus {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               cpu0: cpu@0 {
> +                       compatible =3D "loongson,la264";
> +                       reg =3D <0>;
> +                       device_type =3D "cpu";
> +                       clocks =3D <&cpu_clk>;
> +               };
> +
> +       };
> +
> +       cpuintc: interrupt-controller {
> +               compatible =3D "loongson,cpu-interrupt-controller";
> +               interrupt-controller;
> +               #interrupt-cells =3D <1>;
> +       };
> +
> +       cpu_clk: clock-1000m {
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <1000000000>;
> +               #clock-cells =3D <0>;
> +       };
> +
> +       soc {
I found the following warning while doing dtbs_check, please check again:

  DTC [C] arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dtb
arch/loongarch/boot/dts/loongson-2k0300.dtsi:41.6-183.4: Warning
(unit_address_vs_reg): /soc: node has a reg or ranges property, but no
unit name

> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges =3D <0x00 0x10000000 0x00 0x10000000 0x0 0x1000000=
0>,
> +                        <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>=
,
> +                        <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>=
;
> +
> +               liointc0: interrupt-controller@16001400 {
> +                       compatible =3D "loongson,liointc-2.0";
> +                       reg =3D <0x0 0x16001400 0x0 0x40>,
> +                             <0x0 0x16001040 0x0 0x8>;
> +                       reg-names =3D "main", "isr0";
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +
> +                       interrupt-parent =3D <&cpuintc>;
> +                       interrupts =3D <2>;
> +                       interrupt-names =3D "int0";
> +
> +                       loongson,parent_int_map =3D <0xffffffff>, /* int0=
 */
> +                                                 <0x00000000>, /* int1 *=
/
> +                                                 <0x00000000>, /* int2 *=
/
> +                                                 <0x00000000>; /* int3 *=
/
> +               };
> +
> +               liointc1: interrupt-controller@16001440 {
> +                       compatible =3D "loongson,liointc-2.0";
> +                       reg =3D <0x0 0x16001440 0x0 0x40>,
> +                             <0x0 0x16001048 0x0 0x8>;
> +                       reg-names =3D "main", "isr0";
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +
> +                       interrupt-parent =3D <&cpuintc>;
> +                       interrupts =3D <4>;
> +                       interrupt-names =3D "int2";
> +
> +                       loongson,parent_int_map =3D <0x00000000>, /* int0=
 */
> +                                                 <0x00000000>, /* int1 *=
/
> +                                                 <0xffffffff>, /* int2 *=
/
> +                                                 <0x00000000>; /* int3 *=
/
> +               };
> +
> +               uart0: serial@16100000 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16100000 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart1: serial@16100400 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16100400 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart2: serial@16100800 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16100800 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart3: serial@16100c00 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16100c00 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart4: serial@16101000 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16101000 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart5: serial@16101400 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16101400 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart6: serial@16101800 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16101800 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart7: serial@16101c00 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16101c00 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart8: serial@16102000 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16102000 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               uart9: serial@16102400 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0 0x16102400 0 0x10>;
> +                       interrupt-parent =3D <&liointc0>;
> +                       interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> +                       no-loopback-test;
> +                       status =3D "disabled";
> +               };
> +
> +               isa@16400000 {
> +                       compatible =3D "isa";
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <1 0x0 0x0 0x16400000 0x4000>;
> +               };
> +       };
> +};
> --
> 2.49.0
>
>

--=20
Thanks.
Binbin
