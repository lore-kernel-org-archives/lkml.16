Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005B27874B;
	Mon, 19 May 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647332; cv=none; b=AJqWPaFPwBlEPIBUJELIcFtE0aD00dWAGrWjjFoMoryZe1+sxZZPvP2I5KV207+EwrkMjCvt43H6fMizVnD8i0/KjepQSy3nCooIP6MrK6ZQsuPHVllYsCDrto/nXHqps2unShEXhqC7eVI2RWC9jA4SYyRuTXmhBfpN4jk8XM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647332; c=relaxed/simple;
	bh=UVHwCwbhEk9S/BpWQrXka90Hbx/pl/lsbqyIqSeOAsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzO9Y8gB0vzEroGy2tCNRetswfnXwgywRR/S4jdfMePEh9SAFxnQYUZXAwKyqcmtb2JYAXsvSZUnwsSVEbzSGHhb3YAqxzTKGiYoRI4b3on6CpHpf/3fvxBy96SuvbOO9Hfh+Th/aoq3CD4ntxS76e3fC+PaVKpeSXXfNb49kx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=porisN7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="porisN7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06403C4CEE4;
	Mon, 19 May 2025 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647331;
	bh=UVHwCwbhEk9S/BpWQrXka90Hbx/pl/lsbqyIqSeOAsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=porisN7g4peOMbggbjmKqMpoc1QKljXcxXGvUp5Jzdt73Ta55LC0YeWYnYSNu0mpk
	 57av2F5rvk/kWI0/STwFWKjfCKFzH63U+KAu082fjeQCVLRDuBoxU15vZdyH7Sx19g
	 UtaiEs5E5p5u1Q7MRmWnkQnjq4PU8oetECzuPPFwXrm+84qqQhS4Ok7zwnZMT66FG4
	 8MzSrGret6009OwElZcC+U4PIRCH3tI0jOTNRrF5WpN8WXXtEKf/PHGwU4eqSw29nN
	 E/Ro1ax3c+j2GW7z7sdKpMWzXnSfYxY2PJWrpXqjjvYxFvLsleNQ3Vf63tOZxl5c0F
	 MF/HGcWtq1uhA==
Date: Mon, 19 May 2025 11:35:28 +0200
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
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250519-busy-expert-buffalo-2c01ea@kuoka>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>

On Sun, May 18, 2025 at 03:19:19AM GMT, Ze Huang wrote:
> +properties:
> +  compatible:
> +    const: spacemit,k1-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: usbdrd30
> +

How many phys?

> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interconnects:

compatible, reg and then order by name: clocks +names, interconnects +
names, interrupts, resets, vdd-supply.

> +    maxItems: 1
> +    description:
> +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> +      The 'interconnects' property explicitly describes this path, ensuring
> +      correct address translation.
> +
> +  interconnect-names:
> +    const: dma-mem
> +
> +  vbus-supply:
> +    description: A phandle to the regulator supplying the VBUS voltage.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    usb@c0a00000 {
> +        compatible = "spacemit,k1-dwc3";
> +        reg = <0xc0a00000 0x10000>;
> +        clocks = <&syscon_apmu 16>;
> +        clock-names = "usbdrd30";
> +        resets = <&syscon_apmu 8>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <125>;
> +        interconnects = <&mbus0>;
> +        interconnect-names = "dma-mem";

Feels like missing port or ports. Are you sure your example is complete?

> +    };
> 
> -- 
> 2.49.0
> 
