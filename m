Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF651D554;
	Fri,  2 May 2025 01:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746150767; cv=none; b=rC/8bP7U8PjV59ekdVcZGsAOj1WcP4HwHlmIM9SrEc9Yv32fffu6JEyQV3LXyic1xKxDCVXOWY+M4vLl4UEWoOmJnB6AJDv18ymfnhGf7v0zmA12i0kgu4SM3XvqJE+1R60vmTcmsMOsitU1GzKKPFAeCfIx5Zj0GxmwbqzqUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746150767; c=relaxed/simple;
	bh=+6KC8Er2Yg+3lM3yjbM95E/f1pA2PsuQKmRBF9nwBPI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1oZIbUoAa5BNquNWdSzRGug4dhX8x+TtuI4r+EZNt74IJ6api97VBioEOROLwof6i/SxQSr21wAXY5EmCgfuQzGqtl+YqSjgmEnwtmGbgA1GqG7meSwaVOdjfSrfQVwA1q2CmzwbJVAET7A5UpyDtFnQ3Njn04lBVtT+ZG22xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=e9lmI114; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="e9lmI114"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B325425F61;
	Fri,  2 May 2025 03:52:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDfb4-N8fou8; Fri,  2 May 2025 03:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746150758; bh=+6KC8Er2Yg+3lM3yjbM95E/f1pA2PsuQKmRBF9nwBPI=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=e9lmI114NV6RHhztBfWeTJ0Ra99aZNmodTieZXLWzA0Bg1z0EMACs5cDutqZOY8LN
	 tqCkxlAyF0i4fZNoliqbvSbI4l4XfZrqJrv0bHP4WN2dX/A9YZ0ulSF0oquXtmpPkC
	 Zr0k4E+Kn0O2Xt9CtzIoy2nzr0+ABHpkXYOFqXAMuGFHEzLFahbl5NBZodJgCywHUz
	 67/9ukio1bbsu/ZVL/X/ElhoxooyX6za26qntX4tFPAE3RsINvG++pMzFnELO5Gd4I
	 IPtv+RWbhx5bqoHQSrabI38Dem3pZuzNlx1Q5twlKyIrR+RMcwMacnh5t3rKdOxiGC
	 06c4RsDMTLdig==
Date: Fri, 2 May 2025 01:52:22 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH 3/4] LoongArch: dts: Add initial SoC devicetree for
 Loongson 2K0300
Message-ID: <aBQlVrA_fxb22aPF@pie.lan>
References: <20250501044239.9404-2-ziyao@disroot.org>
 <20250501044239.9404-5-ziyao@disroot.org>
 <8c102773-71e2-4c60-b260-07f099ddaae3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c102773-71e2-4c60-b260-07f099ddaae3@kernel.org>

On Thu, May 01, 2025 at 12:55:04PM +0200, Krzysztof Kozlowski wrote:
> On 01/05/2025 06:42, Yao Zi wrote:
> > Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
> > core and targets embedded market. Only CPU core, legacy interrupt
> > controllers and UARTs are defined for now.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/loongarch/boot/dts/loongson-2k0300.dtsi | 197 +++++++++++++++++++
> >  1 file changed, 197 insertions(+)
> >  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > 
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > new file mode 100644
> > index 000000000000..6991a368ff94
> > --- /dev/null
> > +++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > @@ -0,0 +1,197 @@
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
> > +	compatible = "loongson,ls2k0300";
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +		serial4 = &uart4;
> > +		serial5 = &uart5;
> > +		serial6 = &uart6;
> > +		serial7 = &uart7;
> > +		serial8 = &uart8;
> > +		serial9 = &uart9;
> 
> 
> UARTs depend on connectors, so these are board-level aliases.
> 
> 
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible = "loongson,la264";
> > +			reg = <0>;
> > +			device_type = "cpu";
> > +			clocks = <&cpu_clk>;
> > +		};
> > +
> > +	};
> > +
> > +	cpuintc: interrupt-controller {
> > +		compatible = "loongson,cpu-interrupt-controller";
> > +		interrupt-controller;
> > +		#interrupt-cells = <1>;
> > +	};
> > +
> > +	cpu_clk: clock-1000m {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <1000000000>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	soc {
> > +		compatible = "simple-bus";
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges = <0x00 0x10000000 0x00 0x10000000 0x0 0x10000000>,
> > +			 <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
> > +			 <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
> > +
> > +		liointc0: interrupt-controller@16001400{
> 
> Missing space, {
> 
> > +			compatible = "loongson,liointc-2.0";
> > +			reg = <0x0 0x16001400 0x0 0x40>,
> > +			      <0x0 0x16001040 0x0 0x8>;
> > +			reg-names = "main", "isr0";
> > +
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +
> > +			interrupt-parent = <&cpuintc>;
> > +			interrupts = <2>;
> > +			interrupt-names = "int0";
> > +
> > +			loongson,parent_int_map = <0xffffffff>, /* int0 */
> > +						  <0x00000000>, /* int1 */
> > +						  <0x00000000>, /* int2 */
> > +						  <0x00000000>; /* int3 */
> > +		};
> > +
> 
> 
> 
> Best regards,
> Krzysztof
> 

Thanks for finding the issues, will fix all of them in v2.

Thanks,
Yao Zi
