Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C9F9C0;
	Tue, 20 May 2025 02:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709240; cv=none; b=I/WRkASNgBv0jF1sM9dhdIR2uklehoHJ3lhXSCF940PsIVfhZ8krO8ZY/NOIQDb59yc1y7Uy0Gxycbr14DlvGhPeqgbjWFYWbX1JPVOjescJhdrxsUFcujXcUY/3c4IEepKAB2Gzxte9gh3DOmAznbH/V3lPvur+jkqR695JnQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709240; c=relaxed/simple;
	bh=JLVtDiZPvylcSEUq25PNRGqKWM3uUEhinrMr64Djxtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcaO6hMfYn2zW/haEbAvZ3+njKoOZDCuMn9ufLAYYoFneFWSsFlSGe/cNmAr7tvD7TndqzpJukylhgxJGA2F6Nib+uU21UgLHJ2w2iXjBLURKm0azdp8N2JecF8y11z5mklDKcozmTTKKraZhuH/uB7X0wCUGO1QJTiwl+lJXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15a4db399;
	Tue, 20 May 2025 10:47:14 +0800 (GMT+08:00)
Date: Tue, 20 May 2025 10:47:14 +0800
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
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aCvtMu9gNxKoTXWo@jean.localdomain>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
 <20250519-busy-expert-buffalo-2c01ea@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-busy-expert-buffalo-2c01ea@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkgeVkgdTkoeSRhNQkhITVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96eb968c4c03a1kunm7ee6d6a366406
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTo6SQw5MzExIiMUDh81FgsO
	Li4KCTRVSlVKTE9MTEtCSUhOSENPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFITUxCNwY+

On Mon, May 19, 2025 at 11:35:28AM +0200, Krzysztof Kozlowski wrote:
> On Sun, May 18, 2025 at 03:19:19AM GMT, Ze Huang wrote:
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: usbdrd30
> > +
> 
> How many phys?
> 

Two phys: USB2.0 phy and USB3.0 phy

Will update the bindings in next version.

> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interconnects:
> 
> compatible, reg and then order by name: clocks +names, interconnects +
> names, interrupts, resets, vdd-supply.
> 

Got it wrong again - thanks for your patience.

I'll update the property order as you suggested.

> > +    maxItems: 1
> > +    description:
> > +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> > +      The 'interconnects' property explicitly describes this path, ensuring
> > +      correct address translation.
> > +
> > +  interconnect-names:
> > +    const: dma-mem
> > +
> > +  vbus-supply:
> > +    description: A phandle to the regulator supplying the VBUS voltage.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - interrupts
> > +  - interconnects
> > +  - interconnect-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    usb@c0a00000 {
> > +        compatible = "spacemit,k1-dwc3";
> > +        reg = <0xc0a00000 0x10000>;
> > +        clocks = <&syscon_apmu 16>;
> > +        clock-names = "usbdrd30";
> > +        resets = <&syscon_apmu 8>;
> > +        interrupt-parent = <&plic>;
> > +        interrupts = <125>;
> > +        interconnects = <&mbus0>;
> > +        interconnect-names = "dma-mem";
> 
> Feels like missing port or ports. Are you sure your example is complete?
> 

Will include ports in next version

    hub@1 {
        compatible = "usb2109,2817";
        reg = <0x1>;
        vdd-supply = <&usb3_vhub>;
        peer-hub = <&hub_3_0>;
        reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
    };

    hub@2 {
        compatible = "usb2109,817";
        reg = <0x1>;
        vdd-supply = <&usb3_vhub>;
        peer-hub = <&hub_2_0>;
        reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
    };
