Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED924BC09;
	Thu, 17 Apr 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895040; cv=none; b=dfbEkgV6oMS/LQv/7SvbxVeksxF2cSao9S64AqotAU++IwtGFyxxDmO2aSPpWbd/4tkC9hQhC02bfwMD1rMtC18fQNv6M6+PTkop7sY+MvR+xK3V/Fxy48gQOccYhotseeEgxtz5EJCs1S6hySBX5GUZXU6E5yZBmKIs77QEW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895040; c=relaxed/simple;
	bh=lFeALokJFpgk28Aq35eQ1HRQJYe1F50kbXfYETsPyFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxtxed7T78gqbgJ1TsX01HeZHBryu+5hf3BXk38D1I2dghO/tXmI5NBpIRVeqDuzBgM/bjk7EVPdfEVuZ2uByY2YTNCQmQ5ieJO5QxRQpsl4Nxl5QtHxkVuHbyEcD398DFohhuYx2hRl9OE7Wmvw0GB+QJQejrXAmS8vcZAiTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KPzhyH1W; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KPzhyH1W"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B71961F91A;
	Thu, 17 Apr 2025 15:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744895028;
	bh=LVIv+Euugq4tGgOroUBB26lcmJe4QB+yarX/KrXGKoU=; h=From:To:Subject;
	b=KPzhyH1WrJIKuXn4iDgsC61lXzCe1axXYyM9GRAGE4fsHLHTnE1wAqWGZwfS71ft/
	 nA0ZpkIoMNpVG8On6N+KDyb5ttYOEERQ4IWBTolo/A2cjwB/nhLdB/CGaqiQTlf2OM
	 /gSGRJDD8Lr6PSKZjNK8AXLJc4ZqSVQL+V4GkMC53obPRlvHHWgipM4GR0I5+mSGbn
	 KKWmuEsMXuXmzbktwZlDCWTdCsFzXyFe1GnOUP9uJpdLcctRzzgN5bxc/+20wDuU9Y
	 vBNiWRRq3YA0jxNMExpISjRCEOFuqgp+vByQIX6uAk0qLQmmvjCyVM70p9tEU552pe
	 wsPG/35PlJDAA==
Date: Thu, 17 Apr 2025 15:03:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mm-verdin: Link reg_nvcc_sd to usdhc2
Message-ID: <20250417130342.GA18817@francesco-nb>
References: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>

Hello Wojciech,
thanks very much for your patch.

On Thu, Apr 17, 2025 at 01:20:11PM +0200, Wojciech Dubowik wrote:
> Link LDO5 labeled reg_nvcc_sd from PMIC to align with
> hardware configuration specified in the datasheet.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 (regulator: pca9450: Fix enable register for LDO5).
> 
> Fixes: f5aab0438ef1 (regulator: pca9450: Fix enable register for LDO5)
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index 7251ad3a0017..6307c5caf3bc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -785,6 +785,7 @@ &usdhc2 {
>  	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
>  	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_cd_sleep>;
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&reg_nvcc_sd>;

I am worried just doing this will have some side effects.

Before this patch, the switch between 1v8 and 3v3 was done because we
have a GPIO, connected to the PMIC, controlled by the USDHC2 instance
(MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT, see pinctrl_usdhc2).

With your change both the PMIC will be programmed with a different
voltage over i2c and the GPIO will also toggle. It does not sound like
what we want to do.

Maybe we should have a "regulator-gpio" with vin-supply =
<&reg_nvcc_sd>, as we recently did here
https://lore.kernel.org/all/20250414123827.428339-1-ivitro@gmail.com/T/#m2964f1126a6732a66a6e704812f2b786e8237354
?

Francesco

