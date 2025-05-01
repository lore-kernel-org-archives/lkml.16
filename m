Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E52DC781;
	Thu,  1 May 2025 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096912; cv=none; b=TcyBJj/XcEnVU1BozO3Lb4C0M7exIfAEcRlWKMO+GfDwLiP+KnQWLesoPfTqlDr3MprRMB21xqZ4214wzsd9EmOFe1MC3IWd9OfMKOagKlYLTvNMKtvrIwi1vnofuQWn50V8Pf14tVn3S5ADPg9f2rucG8+Ns9KZJZBpattGVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096912; c=relaxed/simple;
	bh=jZ2VATRHVVRfJuKWaUJyoPaTmoyKIYqXUtF5EyZwSAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SWGLNLHIU9es8K9518NfoOb5n5H1Txb7N62J31pUQkgFkOHRxEFLbe3J6Khni9Zq6zLXyk56eLxcNYkBrphMpsLJqDARTKcXzPlT90i+hf1/WTTT15sweHd7Gn9k5w+XIel+hvY2dyBQ0WdlxXTd0baKZdgsMM/JTAZSuFRrttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvaWsD0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvaWsD0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05603C4CEE4;
	Thu,  1 May 2025 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746096911;
	bh=jZ2VATRHVVRfJuKWaUJyoPaTmoyKIYqXUtF5EyZwSAg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EvaWsD0kFLrE/P0/8X59Cjl8bLcX8cECnp01S+YZ3PQGy+qhApx4qvZRZQaqJjRjO
	 /u1d8oQXM0K9z52CcpeV/ew+bIh+oiZnfXni/j1aQEF6WywW240cvnL92rrUFPTwuC
	 GgnnSV/ClSq6KtZ0/UWOdGP0ZbCWoTaMV32LGEsIue4syRZe5tUhb7NhKToK9SE7Ne
	 IHEvbKw7IbKHJUuLpoHo1eXIIXhCY0qS5gzf4X1eNIhtEAmCjoVyYOOva8LRtgFPG3
	 EMNjgdY6ddMO0FToqu1rHGh6vI5F1IIWcgC8j7CCaC16F3mK3QjNzwWf1HehU9mx+s
	 5E2by8zNzhN3g==
Message-ID: <8c102773-71e2-4c60-b260-07f099ddaae3@kernel.org>
Date: Thu, 1 May 2025 12:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] LoongArch: dts: Add initial SoC devicetree for
 Loongson 2K0300
To: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250501044239.9404-2-ziyao@disroot.org>
 <20250501044239.9404-5-ziyao@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250501044239.9404-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 06:42, Yao Zi wrote:
> Add SoC devicetree for 2K0300 SoC, which features one LA264 dual-issue
> core and targets embedded market. Only CPU core, legacy interrupt
> controllers and UARTs are defined for now.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/loongarch/boot/dts/loongson-2k0300.dtsi | 197 +++++++++++++++++++
>  1 file changed, 197 insertions(+)
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
> 
> diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> new file mode 100644
> index 000000000000..6991a368ff94
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
> @@ -0,0 +1,197 @@
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
> +	compatible = "loongson,ls2k0300";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;


UARTs depend on connectors, so these are board-level aliases.


> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "loongson,la264";
> +			reg = <0>;
> +			device_type = "cpu";
> +			clocks = <&cpu_clk>;
> +		};
> +
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		compatible = "loongson,cpu-interrupt-controller";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};
> +
> +	cpu_clk: clock-1000m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <1000000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x00 0x10000000 0x00 0x10000000 0x0 0x10000000>,
> +			 <0x00 0x02000000 0x00 0x02000000 0x0 0x04000000>,
> +			 <0x00 0x40000000 0x00 0x40000000 0x0 0x40000000>;
> +
> +		liointc0: interrupt-controller@16001400{

Missing space, {

> +			compatible = "loongson,liointc-2.0";
> +			reg = <0x0 0x16001400 0x0 0x40>,
> +			      <0x0 0x16001040 0x0 0x8>;
> +			reg-names = "main", "isr0";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +			interrupt-names = "int0";
> +
> +			loongson,parent_int_map = <0xffffffff>, /* int0 */
> +						  <0x00000000>, /* int1 */
> +						  <0x00000000>, /* int2 */
> +						  <0x00000000>; /* int3 */
> +		};
> +



Best regards,
Krzysztof
