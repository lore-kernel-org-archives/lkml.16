Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57F20F081;
	Thu,  8 May 2025 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683423; cv=none; b=iZwTZ7HXsLYJRJBuP6upBq/WK+PQlMWvWwVrxDoBsi3keZrYwCBNZEMwXnsUCg08mRvvLAgOIkM9N1NG9vGZv6aa8//8H9MsrU804gwKX6/y4qJ+YYjqAyobtTV28jHXn3b42SPEkG8iLXm5kWVN0es7v2/BLE03IvhZdS6Tfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683423; c=relaxed/simple;
	bh=9h1xbURXxGWrvKx9QCcbV1QCEaBoQJVsir3FtKD2gCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbUNToMQnNSJgXPcJ8Z85vF+3EtXBLSpCqk7TfphV36+a2lqFEVno2lexcLqSCtin6AKrmMIi36RoI9/4Vk3THLVf4PmQnZQhOiNfdQy0knxpj7609eEZ/xLKccfNLJxkekLSXKq1qPgpZ+ouWHrxPonBqp01cfqKRDxLZ1a/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=mtVqxhw4; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=Q7g4GK4Q; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="mtVqxhw4";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="Q7g4GK4Q"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 8305B12FB447;
	Wed, 07 May 2025 22:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746683421; bh=9h1xbURXxGWrvKx9QCcbV1QCEaBoQJVsir3FtKD2gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtVqxhw4uMfcFkqkn2govDBg6HdQT72/yv4YNkMaAMZ2W/qkCfX1waLVpD32rUYE6
	 pdyZx/XcDqW7FEI0x26rojU6SejdMYGe/ue0olk1cN1M3jjP0P9/WY0Cu1vCIuzZaX
	 4yJiwaOIWJBgqJayp0uWrbcg6CLXnftxGNNr7W9bulaQVVHh9agzmhWYNvCAVrOwXA
	 mKVXUDHfYTwxE6Sn7bdVukTP4KajT9Qr+bbBxqiKZJamvCdSKhRsTpqtGmYNThoySm
	 z8J15ghInqO+VDIeEeL0Fnd6FZWcXvLr1tNLxd/PdkugaDfZV6e7EeMEv7mEaCH07w
	 tcOdpUiTgVJgg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZB89_tY-Ofmk; Wed,  7 May 2025 22:49:47 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 896BA12FB439;
	Wed, 07 May 2025 22:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746683387; bh=9h1xbURXxGWrvKx9QCcbV1QCEaBoQJVsir3FtKD2gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7g4GK4QYHgbQRvVz6WueosEuJM3dTt/iuT/Z69kHnZRsG0/sUiBbIyX4qx/VniWK
	 SWoAyq3+YdPBynkoZy8PMBLF/6a8XVwYF5jAGJaYVLPi5fEU+SGJdnbQm1UbgERhb2
	 knsws/s/c6KJgz3BRpNDaspFV50aUkpi/tE9GlVs9uCLSXth8ItSS7xFnDrato4Z2E
	 nEkHMItd74NUdWtAF7qFWr95LFveUeghbIFwWhVVsKLYQ8iaIJjqrJaDTOo3SpXXaV
	 B9bNrtnQXXwriCcCMqxef2UHdfSuvxPu+lB/kcc2Sk0GnC4zYzfLEo9n64czP8mj89
	 yRq0ef7LoXY0A==
Date: Thu, 8 May 2025 05:49:39 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
Message-ID: <aBxF81yqPgHP5oA_@ketchup>
References: <20250416135406.16284-1-heylenay@4d2.org>
 <20250416135406.16284-6-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416135406.16284-6-heylenay@4d2.org>

Hi Yixun,

On Wed, Apr 16, 2025 at 01:54:05PM +0000, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..584f0dbc60f5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi

I found that I forgot to make the nodenames of syscons consistent:
both "system-control" and "system-controller" are used, and pll should
be named as "clock-controller" instead.

Could you please drop the SoC devicetree patch then I could rework on
it and correct the mistake? Or I could follow up a clean up patch if
dropping isn't easy or doesn't follow the convention.

Thanks for your work,
Haylen Chu

> @@ -314,6 +346,17 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>  			reg = <0x0 0xd401e000 0x0 0x400>;
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> -- 
> 2.49.0
> 
