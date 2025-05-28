Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039082899;
	Wed, 28 May 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423353; cv=none; b=rARDf3XNI8VizeEmfX4q5Vw9pIH8te5iIpn1mKMhzGH8x5mUI7GBsJsORdNtpOpPXOF8CjSlu5Df6pTxAd1UyvXpY9BqfhCO5buvQ3DnuU4lcmavACn1Os8zE2SnOvIYPy22/Zo4QEBdAc/WJT/aQHASA3De5BBF1I1ul/Py42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423353; c=relaxed/simple;
	bh=jFv5cQIlrq8mQoRnawATs1ETAgrj4fY1PBOA8kx8G0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfhLLQT9BihtBpbNG/d3K8wxyezW7iLN6gWAPAkcKTviMyUjHWqlV0yc9vk4qRvEgarAOGm2b6zOv80T8OAPeyW0Iv67twQRnN9yxKWJJrjnvpVrUZhoanw3DYY+YIOAG4Aq5I0o/7KkKrY/S6wPZyPNtikwke4SA0xTuSPNIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8r1S2mw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8r1S2mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78ED3C4CEEB;
	Wed, 28 May 2025 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748423353;
	bh=jFv5cQIlrq8mQoRnawATs1ETAgrj4fY1PBOA8kx8G0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m8r1S2mwh4BizzgnesxNNREKtpE3ecaI05IGU7gv/k2HlVti8uDWlnZXelgExrjQI
	 Q5aNCOynA0v9xjeC1ZXIKrLOhXrqm1iDulHG33NDjK1nlnfuCGid9Fq4fLnFIRicJy
	 yzfdJN0gZlB793e7XNO+3STmWWg/sLyACYbYX5hB10gOqBmCVW+eUmPA/lcd6hXa3T
	 BZSG2D8BDVQU7u0X2g2gd+ED/ABWrXEeKpbUuaKN6A6Bfpzsnt4CmQd8/c663AEI3n
	 YGGMm7wkmtTF2cgUGzRK8SpHrgmZMrTNpV7v+cPKkZrACWU8cEVMNc8hhywEYsl31c
	 p21fvrqYNZe1A==
Message-ID: <4c93cea1-a27a-42dc-8248-06b23da3a558@kernel.org>
Date: Wed, 28 May 2025 11:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board
To: Albert Yang <yangzh0906@thundersoft.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250528085457.481372-1-yangzh0906@thundersoft.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250528085457.481372-1-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 10:54, Albert Yang wrote:
> Add device tree support for the Black Sesame Technologies (BST) C1200
> CDCU1.0 ADAS 4C2G platform. This platform is based on the BST C1200 SoC
> family.
> 
> The changes include:
> - Adding a new BST device tree directory
> - Adding Makefile entries to build the BST platform device trees
> - Adding the device tree for the BST C1200 CDCU1.0 ADAS 4C2G board
> 
> This board features a quad-core Cortex-A78 CPU, and various peripherals
> including UART, MMC, watchdog timer, and interrupt controller.
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/bst/Makefile              |  10 ++
>  .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 ++++++
>  arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 ++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/bst/Makefile
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
>  create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc2..135965288100 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -35,3 +35,4 @@ subdir-y += tesla
>  subdir-y += ti
>  subdir-y += toshiba
>  subdir-y += xilinx
> +subdir-y += bst

Don't add to random places or at the end, but place entries in
alphabetical order.

> diff --git a/arch/arm64/boot/dts/bst/Makefile b/arch/arm64/boot/dts/bst/Makefile
> new file mode 100644
> index 000000000000..64fd43c98275
> --- /dev/null
> +++ b/arch/arm64/boot/dts/bst/Makefile
> @@ -0,0 +1,10 @@
> +ifeq ($(CONFIG_SECOND_KERNEL), )

There is no such thing.

> +
> +# Enables support for device-tree overlays
> +DTC_FLAGS := -@
> +
> +dtb-$(CONFIG_ARCH_BSTC1200) += bstc1200-cdcu1.0-adas_4c2g.dtb
> +
> +endif
> +
> +clean-files	:= *.dtb

Why?

> diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
> new file mode 100644
> index 000000000000..92915e7630ff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "bstc1200.dtsi"
> +
> +/ {
> +	model = "BST C1200-96 CDCU1.0 4C2G";
> +
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0x20008000 console=ttyS0,115200n8 rw";

Earlycon is debugging, why do you  need it for general use?

console: redundant
rw: not suitable for DT

> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@8c0000000 {
> +		device_type = "memory";
> +		reg = <0x8 0x10000000 0x0 0x30000000
> +		      0x8 0xc0000000 0x1 0x0
> +		      0xc 0x0 0x0 0x40000000
> +		      0x8 0x254000 0x0 0x1000
> +		      0x8 0x151000 0x0 0x1000>;

Multiple entries go into multiple entries <>.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		ranges;
> +
> +		mmc0_reserved: mmc0_region@5160000 {

Follow DTS coding style. Also drop redundant "region"


> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x5160000 0x0 0x10000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	status = "okay";
> +	memory-region = <&mmc0_reserved>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
> new file mode 100644
> index 000000000000..6ed2d8cbd720
> --- /dev/null
> +++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +/ {
> +	compatible = "bst,c1200";
> +	#address-cells = <0x2>;
> +	#size-cells = <0x2>;

These are not hex.

> +
> +	cpus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;

Same comments

> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x0>;
> +			freq-domain = <0x3 0x1>;
> +		};
> +
> +		cpu@1 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x100>;
> +			freq-domain = <0x3 0x1>;
> +		};
> +
> +		cpu@2 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x200>;
> +			freq-domain = <0x3 0x1>;
> +		};
> +
> +		cpu@3 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x300>;
> +			freq-domain = <0x3 0x1>;
> +		};
> +
> +		l2_cache: l2-cache-1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +		};
> +	};
> +
> +	misc_clk: misc_clk {

Follow DTS coding style. Please use name for all fixed clocks which
matches current format recommendation: 'clock-<freq>' (see also the
pattern in the binding for any other options).

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1

> +		compatible = "fixed-clock";
> +		#clock-cells = <0x0>;
> +		clock-frequency = <0x3d0900>;

This is not a hex.

> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		always-on;
> +		interrupts = <GIC_PPI 0xd (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
> +			      GIC_PPI 0xe (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
> +			      GIC_PPI 0xb (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)
> +			      GIC_PPI 0xa (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		ranges = <0x0 0x0 0x0 0x0 0xffffffff 0xffffffff>;

Follow DTS coding style

> +
> +		mmc0: dwmmc0@22200000 {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +			#address-cells = <0x2>;
> +			#size-cells = <0x0>;
> +			compatible = "bst,dwcmshc-sdhci";
> +			reg = <0x0 0x22200000 0x0 0x1000>;
> +			reg-names = "base";

Order properties according to DTS coding style.

Best regards,
Krzysztof
