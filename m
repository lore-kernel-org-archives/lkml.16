Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CBC1A314F;
	Wed, 21 May 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837381; cv=none; b=MxOBv/6ZwtbfVZiz1yBWsckcUDD2WT3Bya4hl/sTk/tfU2eqFWycNAbocAyB5yuhV7XA8KYxnB6LgmuCdjchoAg5Ui1UFNxtwRA/I2QoCY78ZF58Le49DIG/zc42mlFgkO7Uq5WO9pVa9iIbNjFV4lvUeO8uikb/otxbRZ0PGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837381; c=relaxed/simple;
	bh=pa8b6sT6qx/AjmEa+fGychHn1RrQJhHunTxAnt2l3XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5GdYPLpdylvxauSMuMsYTEi/3fpDREIXQnGyIkoLv23QweKlv1FY2EItw1tKznJyVufQ0lMaIWYxhWZBRZ5l3egmLMjGeI2E7grG8Tc6jD3d1x4zh5h6aoWxmqN7PFVOmOtTUMDw1LOA4h2kA+gFCZpcmIfG45QnuLv3K9ue80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15eccc893;
	Wed, 21 May 2025 22:22:48 +0800 (GMT+08:00)
Date: Wed, 21 May 2025 22:22:48 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: add usb3.0 support for K1
Message-ID: <aC3huEM4f9qAfgAR@jean.localdomain>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>
 <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUlMVhpNQklOTEoeTBhCGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96f339b70803a1kunme43b676d164aa4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6Ogw5HTE*Lh0pSiwNNksX
	F0wKCihVSlVKTE9MQ0hMSE1CS01JVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPT0tKNwY+

On Mon, May 19, 2025 at 11:37:30AM +0200, Krzysztof Kozlowski wrote:
> On Sun, May 18, 2025 at 03:19:21AM GMT, Ze Huang wrote:
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 61f5ca250ded0da7b91cd4bbd55a5574a89c6ab0..164244fdb49f5d50a8abadb7b7e478cccc828087 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -4,6 +4,8 @@
> >   */
> >  
> >  #include <dt-bindings/clock/spacemit,k1-syscon.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/phy/phy.h>
> >  
> >  /dts-v1/;
> >  / {
> > @@ -346,6 +348,15 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		mbus0: dram-controller@0 {
> 
> Missing compatible.
> 
> > +			reg = <0x0 0x00000000 0x0 0x80000000>;
> > +			reg-names = "dram";
> 
> Where are the bindings for this?
> 
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> 
> Why are these needed?
> 

Will drop them

> > +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> > +			#interconnect-cells = <0>;
> 
> No, you cannot just add any properties to any custom node. You need ABI
> for all this.
> 

Thanks for correcting, will create a binding for it.

> > +		};
> > +
> >  		syscon_rcpu: system-controller@c0880000 {
> >  			compatible = "spacemit,k1-syscon-rcpu";
> >  			reg = <0x0 0xc0880000 0x0 0x2048>;
> > @@ -358,6 +369,64 @@ syscon_rcpu2: system-controller@c0888000 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		usb_dwc3: usb@c0a00000 {
> > +			compatible = "spacemit,k1-dwc3";
> > +			reg = <0x0 0xc0a00000 0x0 0x10000>;
> > +			clocks = <&syscon_apmu CLK_USB30>;
> > +			clock-names = "usbdrd30";
> > +			resets = <&syscon_apmu RESET_USB3_0>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <125>;
> > +			interconnects = <&mbus0>;
> > +			interconnect-names = "dma-mem";
> > +			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
> > +			phy-names = "usb2-phy", "usb3-phy";
> > +			dr_mode = "host";
> 
> This does not look like property of the soc.
> 

Will move `dr_mode` to board level

> > +			phy_type = "utmi";
> > +			snps,hsphy_interface = "utmi";
> > +			snps,dis_enblslpm_quirk;
> > +			snps,dis-u2-freeclk-exists-quirk;
> > +			snps,dis-del-phy-power-chg-quirk;
> > +			snps,dis_u2_susphy_quirk;
> > +			snps,dis_u3_susphy_quirk;
> > +			snps,dis_rxdet_inp3_quirk;
> > +			status = "disabled";
> > +		};
> > +
> > +		usbphy0: phy@c0940000 {
> > +			compatible = "spacemit,k1-usb2-phy";
> > +			reg = <0x0 0xc0940000 0x0 0x200>;
> > +			clocks = <&syscon_apmu CLK_USB_AXI>;
> > +			#phy-cells = <0>;
> > +			status = "disabled";
> 
> What is missing here? Why is this node disabled?
> 

There're three USB controllers on K1 [1]:
- A USB2.0 OTG
- A USB2.0 Host Only
- A USB3.0 with a USB2.0 DRD interface

usbphy0 is for USB2.0 OTG, and ushphy1 is for USB2.0 Host Only.
They're not supported yet.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

> Best regards,
> Krzysztof
> 
> 
> 
> 
