Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C595228
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746959916; cv=none; b=KNnbm7IF+OEQGIRpaLMUl0Ae9MR0m5SXkgGd+r9jDDviGyOg0uEwhnIlGtKK8Y3QHlB+w+8sDZi0rvwJVbe4C7EnYeF93eA3ee+XIFVeQD3lPe4m12uIx5tszZjAA8QxOHswgTtlX61Aeiey4vyawA69cLOcc2vNblFEIPf06Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746959916; c=relaxed/simple;
	bh=FDjXCaSUAFTz8h1Cfb+Yw4ryg7CBI6pXjTaPHanJXIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1OVRIEpyQSRPUCBRiEctFTO49TuijBm4x7MS8Fh6e3sGSu7+r47aWgtA9QD1iIM78DFiC4Oo2F08jXcjDSyYZbU3xljdEakmkMms4tPjekuT47yx5aMy/zyfX+82j0iJIvCaadbRjYJ1Fhf/mteY8hwXrHDoqzHLNeQCWXcfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ElkXcjg4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ElkXcjg4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 209C525BE1;
	Sun, 11 May 2025 12:38:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxEtpmilfeGs; Sun, 11 May 2025 12:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746959904; bh=FDjXCaSUAFTz8h1Cfb+Yw4ryg7CBI6pXjTaPHanJXIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ElkXcjg4P8dgjxzokPxKWdrbYZJxCuw6FhacHSxNdXGGBIH8WxzRyGnUsVsCRqkib
	 NEfCe71/pseFcwL7NI/2Ra1o8jpaZv7eCSpg/1Wku4ecHmEAWQP3T6tqhSpm7K/avc
	 vIcH11oFI3qd3CYjfupDDXYnR8RuFWF2gauVIr4HPOjKumL33ljv8n71pq0VTIwzh1
	 pljTIyr5VYMLvPGYlxf8s5KqVz3nlLdG5TbXaQXHGC8XH08c44HhDUGQXy9shPgblh
	 G2g6Iasg4VZmMqyeErwGFnVmIUxL3CfW/73u5LsKnhmp79js5gOUxyIoqM04RFpWct
	 iL1sGr/vlN2Ow==
Date: Sun, 11 May 2025 10:38:05 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to
 board files
Message-ID: <aCB-AVcZLvFw6mRS@pie.lan>
References: <20250510220106.2108414-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>

On Sun, May 11, 2025 at 12:01:06AM +0200, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.
> 
> So move the newly added aliases for rk3528 over to the Radxa E20C board,
> which is the only rk3528 board right now.
> 
> Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3528")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
>  2 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Yao Zi <ziyao@disroot.org>

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 506d54337ece..9f6ccd9dd1f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -18,8 +18,10 @@ / {
>  
>  	aliases {
>  		ethernet0 = &gmac1;
> +		i2c1 = &i2c1;
>  		mmc0 = &sdhci;
>  		mmc1 = &sdmmc;
> +		serial0 = &uart0;
>  	};
>  
>  	chosen {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index cd8ef389ccf3..b2724c969a76 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,22 +24,6 @@ aliases {
>  		gpio2 = &gpio2;
>  		gpio3 = &gpio3;
>  		gpio4 = &gpio4;
> -		i2c0 = &i2c0;
> -		i2c1 = &i2c1;
> -		i2c2 = &i2c2;
> -		i2c3 = &i2c3;
> -		i2c4 = &i2c4;
> -		i2c5 = &i2c5;
> -		i2c6 = &i2c6;
> -		i2c7 = &i2c7;
> -		serial0 = &uart0;
> -		serial1 = &uart1;
> -		serial2 = &uart2;
> -		serial3 = &uart3;
> -		serial4 = &uart4;
> -		serial5 = &uart5;
> -		serial6 = &uart6;
> -		serial7 = &uart7;
>  	};
>  
>  	cpus {
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
