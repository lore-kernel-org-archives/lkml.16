Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C833CFC;
	Fri,  2 May 2025 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146620; cv=none; b=bB9gLBqDvPd071MwqRaL7e7h0l4zCB5j9LOhN8+GN6053Hw29nEyDfCw/eZRarHMiNK3wRYEDwuf+JbNbvJo7I4M0xqxaev2pQjwbP4vZt0LvRla+ELteiPNRnvlo9u7QhDgwXHiTefb3Nb1XQStryJ5ifHwVaHjWbD7npMsxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146620; c=relaxed/simple;
	bh=Hiro1vgcIUzXXEzV5xvaa7gLx6x7Wui3T/yJyNUygCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUAo7HOR74THsa9i5G3wQP0HWTT36D+K3a9HCpw7PtC9o/MhQD/JEqYYUqHkWtGzzJtGGkhpANHKK3KAZP4B2DioaKqRSLfAK6Ft2mANlpejGVd6/zicA2NEKVFY9DbDtlbpACZ7Q3CuKFx8SbOupGVsfw2OW67QFdYZlt5ohyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0E151342FDB;
	Fri, 02 May 2025 00:43:37 +0000 (UTC)
Date: Fri, 2 May 2025 00:43:28 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device
 into soc dtsi file
Message-ID: <20250502004328-GYA427222@gentoo>
References: <20250430012654.235830-1-inochiama@gmail.com>
 <20250430012654.235830-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430012654.235830-2-inochiama@gmail.com>

On 09:26 Wed 30 Apr     , Inochi Amaoto wrote:
> Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
> some basic peripherals, like clock, pinctrl, clint and plint, are
> not shared. These are caused by not only historical reason (plic,
> clint), but also the fact the device is not the same (clock, pinctrl).
> 
> It is good to override device compatible when the soc number is small,
                                                    ~~~SoC, we usually
> but now it is a burden for maintenance, and it is kind of annoyed to
> explain why using override. So it is time to move this out of the
> common peripheral header.
> 
> Move all soc related peripherla device from common peripheral header
                       ~~~~~~~~~~typo, peripheral
> to the soc specific header to get rid of most compatible override.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
otherwise, looks good

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++--------
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++--------
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 22 --------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 38 +++++++++++++++++--------
>  4 files changed, 78 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aa1f5df100f0..fc9e6b56790f 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -15,23 +15,37 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,cv1800b-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,cv1800-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
> -
> -&plic {
> -	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,cv1800-clk";
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 8a1b95c5116b..fcea4376fb79 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -17,23 +17,37 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,cv1812h-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,cv1810-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
> -
> -&plic {
> -	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,cv1810-clk";
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..805b694aa814 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -49,18 +49,10 @@ osc: oscillator {
>  
>  	soc {
>  		compatible = "simple-bus";
> -		interrupt-parent = <&plic>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		dma-noncoherent;
>  		ranges;
>  
> -		clk: clock-controller@3002000 {
> -			reg = <0x03002000 0x1000>;
> -			clocks = <&osc>;
> -			#clock-cells = <1>;
> -		};
> -
>  		gpio0: gpio@3020000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0x3020000 0x1000>;
> @@ -344,19 +336,5 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <4>;
>  			status = "disabled";
>  		};
> -
> -		plic: interrupt-controller@70000000 {
> -			reg = <0x70000000 0x4000000>;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -			interrupt-controller;
> -			#address-cells = <0>;
> -			#interrupt-cells = <2>;
> -			riscv,ndev = <101>;
> -		};
> -
> -		clint: timer@74000000 {
> -			reg = <0x74000000 0x10000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> -		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> index 7f79de33163c..df133831bd3e 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -17,27 +17,41 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,sg2002-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,sg2000-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
>  
> -&plic {
> -	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,sg2000-clk";
> -};
> -
>  &sdhci0 {
>  	compatible = "sophgo,sg2002-dwcmshc";
>  };
> -- 
> 2.49.0
> 

-- 
Yixun Lan (dlan)
