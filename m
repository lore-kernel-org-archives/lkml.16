Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04D2045A6;
	Tue,  1 Apr 2025 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743528990; cv=none; b=rA4pBQl41GGwC7PKGFIGiTiCXTnQ04GjGwBLgGTxABGvKtXzAW5MyRt+sWDxY3l+PH+FFF906Zf5i5oP11Nd5D0wwd6UMsb98Rg29K6qqawv09LBeCEcnTO/dF6BQ8muuPlFFtXD4wh7OiSTQZDLDVq2ZH9etwdgDKVvb8Q/WUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743528990; c=relaxed/simple;
	bh=fzp725Jl1448wIARjxbrq/kaOVZ0/ZOHyXPogF42rQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X55zekb09mcCXRo0/j591qJ371Pjf7ZOiVfVh7NSaZNajq/UT5INow/+I/pysjtcIwtX5JQrvOPlhh1j4VLVIF/8CeYP6gK90y/m/1rcRkVMT+k5zFhJiLuq2MeZ4yQUdpUBN2eLH+4AqnXf3wDRKPdrszgoFSnkhdrO7t+v1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QpY78WWR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QpY78WWR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D079F25C5F;
	Tue,  1 Apr 2025 19:36:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85kTxoqsDQpS; Tue,  1 Apr 2025 19:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1743528978; bh=fzp725Jl1448wIARjxbrq/kaOVZ0/ZOHyXPogF42rQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QpY78WWREkPzmaMORR2X6BiBkCKQuye4HPfTvVRwUrtJhRs4tqPWlwgxKFrCn9U7o
	 lPWhnePhuVl6Xqqgat624FuEjs5yDqvygTGz7/Sw2Ayw+0Pp6D8iP3yhJkjYzmvCOW
	 zX6pw2x0m+QSkF03FIySiLfSvjLHdLOhlUETjbeDzZ481j0ou4R1XR07S5DRvPic5U
	 Kz2EeHVkmpLz5V8Cjsig5wO2vP4WXz/+6b1EDMy1/AAdkaL/yOxxu8rIy0PvXA2UCX
	 cmdYhClZfafwGoSw+v8hO9Dh4ReYSu0wSGPm2RGebnr6UJehd5dA5pXsc4Zd09J0Am
	 V93pf7RabQ7LA==
Date: Tue, 1 Apr 2025 17:35:57 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add DMA controller for
 RK3528
Message-ID: <Z-wj_eO6FGcwsEh6@pie.lan>
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
 <20250401100020.944658-3-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401100020.944658-3-amadeus@jmu.edu.cn>

On Tue, Apr 01, 2025 at 06:00:19PM +0800, Chukun Pan wrote:
> Add DMA controller dt node for RK3528 SoC.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 7f1ffd6003f5..c366766ee3f5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
>  			status = "disabled";
>  		};
>  
> +		dmac: dma-controller@ffd60000 {
> +			compatible = "arm,pl330", "arm,primecell";
> +			reg = <0x0 0xffd60000 0x0 0x4000>;
> +			clocks = <&cru ACLK_DMAC>;
> +			clock-names = "apb_pclk";
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			arm,pl330-periph-burst;

Should this be moved above "clocks" line to sort the properties?

Thanks,
Yao Zi

> +			#dma-cells = <1>;
> +		};
> +
>  		pinctrl: pinctrl {
>  			compatible = "rockchip,rk3528-pinctrl";
>  			rockchip,grf = <&ioc_grf>;
> -- 
> 2.25.1
> 
