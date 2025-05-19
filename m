Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB12257ACF;
	Mon, 19 May 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641010; cv=none; b=UTqbib/KBcg2L+BZqSqVh+zDASdKItpHRvSN52EfC+HXulqJrTb8Wcx9hi1Upkyf32GipR/OsCzBVQfWJ//jtl0n9YU9zwHca+vINbnDysw/yePPQi6scApXcI8cmltRaPrQbwIHQ6jh0ir19zfOySAElnbl7yb62GEIEvIZv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641010; c=relaxed/simple;
	bh=7AYBXBv9hJZfDoLFBvBon3/3G/8xWmXD3D7ANQ1f3jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5kT7/wLdwQ5qylNHsFDhFuh+m4LjePXTwS1rOPOprxAJMz1opo/1vgoqssUuk0777TLK8yRiM/bAkbxMgnb9IGYJ3HUtJyeoJEWgdgBBGq+NiNXv2Arqb72/SHWqDLSRClApYpnH5vpweFySJ0Gfo+q2TvTfk+AuWOOq0UKb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OXhGwQ3g; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OXhGwQ3g"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8687726048;
	Mon, 19 May 2025 09:50:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovcAx9lpnpgW; Mon, 19 May 2025 09:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747641003; bh=7AYBXBv9hJZfDoLFBvBon3/3G/8xWmXD3D7ANQ1f3jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXhGwQ3g2G/nirDRBc2kkgRofonOnnq3yruIY9oMnedr84KF1isk3GDb3lxpIjDZP
	 IZIu28K9c0x6xyZllGhSb4W+YJqDNR1VWGd99D/jXR3nur78tQHQP2o1bXngKLRgif
	 zwGnPACWX29107UwopKMoh09lX1mPKeXN7AtBwyJzqYG/R7+h7lvAWSVX01Sk1FJe+
	 XIOdrroksMRxxdla4itzkO6RSfgwtEhNhZJziR4GDrt16v44naqm1h8VG1gL+tufD5
	 /ttR+4tRCr60jvOV7usyJdHt8BQU6tG4ClZj37+5HWRjqJ5bKIUMAK5NzY5uPMrSy7
	 p5fXrGV0cdbtw==
Date: Mon, 19 May 2025 07:49:47 +0000
From: Yao Zi <ziyao@disroot.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v2 3/4] LoongArch: dts: Add initial SoC devicetree for
 Loongson 2K0300
Message-ID: <aCrim32dGexKJvXl@pie.lan>
References: <20250518080356.43885-1-ziyao@disroot.org>
 <20250518080356.43885-4-ziyao@disroot.org>
 <CAMpQs4L7U=Mkw=pburiUpJLEm=tHeMOW+6PRhWPTMnOGHxFqyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4L7U=Mkw=pburiUpJLEm=tHeMOW+6PRhWPTMnOGHxFqyA@mail.gmail.com>

On Mon, May 19, 2025 at 11:10:16AM +0800, Binbin Zhou wrote:
> Hi Yao:
> 
> Thanks for your patch.
> 
> On Sun, May 18, 2025 at 4:05 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
> > core and targets embedded market. Only CPU core, legacy interrupt
> > controllers and UARTs are defined for now.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/loongarch/boot/dts/loongson-2k0300.dtsi | 184 +++++++++++++++++++
> >  1 file changed, 184 insertions(+)
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
> >
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > new file mode 100644
> > index 000000000000..17974f793947
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > @@ -0,0 +1,184 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Loongson Technology Corporation Limited
> > + * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +       compatible = "loongson,ls2k0300";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               cpu0: cpu@0 {
> > +                       compatible = "loongson,la264";
> > +                       reg = <0>;
> > +                       device_type = "cpu";
> > +                       clocks = <&cpu_clk>;
> > +               };
> > +
> > +       };
> > +
> > +       cpuintc: interrupt-controller {
> > +               compatible = "loongson,cpu-interrupt-controller";
> > +               interrupt-controller;
> > +               #interrupt-cells = <1>;
> > +       };
> > +
> > +       cpu_clk: clock-1000m {
> > +               compatible = "fixed-clock";
> > +               clock-frequency = <1000000000>;
> > +               #clock-cells = <0>;
> > +       };
> > +
> > +       soc {
> I found the following warning while doing dtbs_check, please check again:
> 
>   DTC [C] arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dtb
> arch/loongarch/boot/dts/loongson-2k0300.dtsi:41.6-183.4: Warning
> (unit_address_vs_reg): /soc: node has a reg or ranges property, but no
> unit name

Oops, seems -Wunit_address_vs_reg is silent without W=1 specified.
Commit 8654cb8d0371 (dtc: update warning settings for new bus and
node/property name checks, 2017-03-21) shows it's a temporary workaround
("Disable the new dtc warnings by default as there are 1000s").

I'll the node to soc@10000000 in v3. Thanks for catching something I've
never noticed before. Yanteng, is it okay for you to keep your
reviewed-by tag with the change?

> > +               compatible = "simple-bus";
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges = <0x00 0x10000000 0x00 0x10000000 0x0 0x10000000>,
> > +                        <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
> > +                        <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
> > +

...

> > 2.49.0
> >
> >
> 
> -- 
> Thanks.
> Binbin
> 

Thanks,
Yao Zi
