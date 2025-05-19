Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12D26B96B;
	Mon, 19 May 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647453; cv=none; b=ljv9+DlwvjwuRMOaD1brxw7m5QFv5e4MI8f/s3c4nObX/WXBkAKhVrDf7+BZw6M3VoNbJnpM0F6N0Orvw3XjZfPPE1oCskaQXwHXZBNMxvfAlRDVF/QmvvBC4Uaet2eM/lNBk8/CZxqEWEZwkdcOupRmCt3J9oqxFQ++MKFr/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647453; c=relaxed/simple;
	bh=KK0Hhs+WBueOymdkeSk3Ewwoz2Qmj7koc8wdTHn/t40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9136BWQM/bS174HZPL6B6RqbWAnEMJVUal6NdsyZpf8OOuofRGAfmb9yliBueRUdlDK0gojMbHQ5rI8EAIH2nBbDIxMygkzGpzWIQtDrs29Dk1fOMUPeTOCRCq8GYf1YENZEm3DFlRot2ynDT8f8sy21FxCT6nc1EhoEbrhdF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXSw8Yln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXSw8Yln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14024C4CEE4;
	Mon, 19 May 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647452;
	bh=KK0Hhs+WBueOymdkeSk3Ewwoz2Qmj7koc8wdTHn/t40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXSw8Ylnp3l4YbRv7jpAv1NfkXlFy7MFhirzfqpAMaqYV7a2DxaMrS7OIwIFMTj1t
	 yYn97NZ7ffZe4XxtDOPIOt4XgRMNEDUqFxkbL9aeGkOsurI6qWL4GrEACo7tqDe4aE
	 kQItnB6USHC0bFRe47ArDgyIG/k6fPR00L7t8j91BT62pMUlV9cP+4JAlQX3L8QAIl
	 BKopGiWdhVrBTQtKRSj3Xw04Qm+pnhmAbBWZ2cXNux4HswAnJHr2h4aypkL+AzPwq2
	 u0wtigdeyuNNkzDo3rXLCo04vr9Y8HDlGUIASg3AwFq6TQKVjBBkOAZMUaKTTkFJLe
	 xtTu0mhNDiEwg==
Date: Mon, 19 May 2025 11:37:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: add usb3.0 support for K1
Message-ID: <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>

On Sun, May 18, 2025 at 03:19:21AM GMT, Ze Huang wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 61f5ca250ded0da7b91cd4bbd55a5574a89c6ab0..164244fdb49f5d50a8abadb7b7e478cccc828087 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -4,6 +4,8 @@
>   */
>  
>  #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/phy/phy.h>
>  
>  /dts-v1/;
>  / {
> @@ -346,6 +348,15 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		mbus0: dram-controller@0 {

Missing compatible.

> +			reg = <0x0 0x00000000 0x0 0x80000000>;
> +			reg-names = "dram";

Where are the bindings for this?

> +			#address-cells = <2>;
> +			#size-cells = <2>;

Why are these needed?

> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> +			#interconnect-cells = <0>;

No, you cannot just add any properties to any custom node. You need ABI
for all this.

> +		};
> +
>  		syscon_rcpu: system-controller@c0880000 {
>  			compatible = "spacemit,k1-syscon-rcpu";
>  			reg = <0x0 0xc0880000 0x0 0x2048>;
> @@ -358,6 +369,64 @@ syscon_rcpu2: system-controller@c0888000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		usb_dwc3: usb@c0a00000 {
> +			compatible = "spacemit,k1-dwc3";
> +			reg = <0x0 0xc0a00000 0x0 0x10000>;
> +			clocks = <&syscon_apmu CLK_USB30>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_USB3_0>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <125>;
> +			interconnects = <&mbus0>;
> +			interconnect-names = "dma-mem";
> +			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			dr_mode = "host";

This does not look like property of the soc.

> +			phy_type = "utmi";
> +			snps,hsphy_interface = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis_rxdet_inp3_quirk;
> +			status = "disabled";
> +		};
> +
> +		usbphy0: phy@c0940000 {
> +			compatible = "spacemit,k1-usb2-phy";
> +			reg = <0x0 0xc0940000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_AXI>;
> +			#phy-cells = <0>;
> +			status = "disabled";

What is missing here? Why is this node disabled?

Best regards,
Krzysztof

