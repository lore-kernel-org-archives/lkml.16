Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FC2E610F;
	Wed, 11 Jun 2025 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749678584; cv=none; b=O1VpyL7YZamEv1qEzhRi+CLZxDcmiiJhekw2X9D3YWQjUpE2jXYCXDcRChQfE3Liv698BtK+YVq+DtqIbokKOGhO/o3DtscBhG+ZqhExr2t/BaclhOJYFXTKIZHYpmhJji558jaM7OLQv7pHD5wPLVKhXW+ZhYhZkANH+nT2qZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749678584; c=relaxed/simple;
	bh=0Luy/GZTvOJxbPT9HRmWme4ywxjUebdc3U2uMURoMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/8rc0LTCrl7cJc9T8/NtLDhaAY/EaaGWWmn3KYHrbTiw+uybVvEhQWnnBPtuNDth4GGUgji+hEpR74cIrbSy5YQz9naJUnIow7uKZADuG3bgq1e8O7n6h6z1qNMRXQndgyOuUEsaiHGk/v7cbHUbJYejKwBJZ4pAHepPXCd8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=CkNekZTx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ant+dIKY; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="CkNekZTx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ant+dIKY"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 219C313804DF;
	Wed, 11 Jun 2025 17:49:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 11 Jun 2025 17:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749678581; x=1749764981; bh=y1uszv6YuO
	g7iXkALbp8AWMQ97qKkEmgUUlVgFz7u14=; b=CkNekZTxGSrPDNFW85kwvoRH/0
	SEUP/xNDPmAhXmFMr/Wpin5NGjzqcID9l3RwDKpgUwygn/08nF4CjT//PHs3DK+E
	6peA+qscBI71W830jYYnioR2n4QC+iPKAKJtZB1KlAD0K46xktFsymu2zFofR9CA
	SqrgVY1bVnupP8e/eab5kkY6GRzHzZPrBR7qcjkaQTQ/vD1BTvxIMmeWUC9U0ovl
	v/nfpqm6pfzf31R8I4RokiOOXIF5eFY8G8p1rpiB2EUyp46nPbXPAgRjGup2dAxH
	xpFpl2jcpm0dh9KPTtR1uFEAPQhzX7tHGoktozdwSDCyZFdAgTNhS5tm+hMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749678581; x=1749764981; bh=y1uszv6YuOg7iXkALbp8AWMQ97qKkEmgUUl
	VgFz7u14=; b=Ant+dIKYLfq0AD1oHGVibCDhOFd8mcpdEerSRQbaxBM32DHCefh
	cR7aORIl3W6J8EoSK3OZmWoHksavhPQr9mpEiLoU32afs69OHOJpRA1Azj0snK+u
	MUBOq8HIfkyN02BwxH7Q9KG71WCtG8cG7llc3IFUKEkiaPhfq5u0cgb8rkyatMXw
	Dhy7S5Vb/5hsdNppjrxqzuYmyxjNu24HRKb4oZG9tZ4aoY+ujaDOI72/VU946pQy
	ZMk9ctqTbmuQ1yMUbWthfAgdKxc2vv1pb/fEGPvCmQhMUVzlQ4sgcsbK+ZXxX0JX
	77NFIrT3KpoxeyLHauIGzHuEabpgXowYSIw==
X-ME-Sender: <xms:9PlJaKudVxquCH7_4r3Y1BeoIEJ49suMGftNvKEy8S4yJOcXHSIWvA>
    <xme:9PlJaPffj9qQv1LLLA72rcmy2EHQLAME7CxZ26nWVxSP-xehrhL-OCGjhS5SPQ03v
    ptfrhdfpubnowu8_ZU>
X-ME-Received: <xmr:9PlJaFyejvOjoJxqPka68BOO7cBzp1H4y8dGka4wD_CJ_5OSoEDAO0_nuzhKGj_zVJmbkpAx5qslCTEbWFmJM-bDTyNUkMfROnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvg
    hlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhofihinhgthhgvnhhmihesghhmrghi
    lhdrtghomhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:9PlJaFOBs99OoFiBNi-CXRmGeMsqDoGh4kJpz2Bg9bWmXFTZJqRX7A>
    <xmx:9PlJaK9mZvTTmeT2mcoIq7OhhD4wGAiGi_kE30yjBinKj6Nb73T46Q>
    <xmx:9PlJaNWOFfwDpHV85nZVncClUot-bl6mFPS6u-PDJPFc8NcBA0L8eQ>
    <xmx:9PlJaDfAeohEKGZ5QihTgkr0uD4OGdko8_y45z-FRT8Y9evXrMdthA>
    <xmx:9flJaD_0sbA4UmwT--1OstRHr2Mw_fbWWMwiex02gQrwMtPZTpFzEX8t>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 17:49:40 -0400 (EDT)
Date: Wed, 11 Jun 2025 23:49:38 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Move touchbar mipi
 {address,size}-cells from dtsi to dts
Message-ID: <20250611214938.GD3141695@robin.jannau.net>
References: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>

On Wed, Jun 11, 2025 at 03:18:53PM +0000, Sven Peter wrote:
> Move the {address,size}-cells property from the (disabled) touchbar screen
> mipi node inside the dtsi file to the model-specific dts file where it's
> enabled to fix the following W=1 warnings:
> 
> t8103.dtsi:404.34-433.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 2 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 2 --
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 2 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 2 --
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index e2d9439397f71a93c28b75a7eea589f4bcb3e374..5b3c42e9f0e6776241bf746d3458766e44e3639a 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -100,6 +100,8 @@ dfr_mipi_out_panel: endpoint@0 {
>  
>  &displaydfr_mipi {
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	dfr_panel: panel@0 {
>  		compatible = "apple,j293-summit", "apple,summit";
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 20faf0c0d80927b2e18dd966a61b5507b322c72f..3a204845b85befb093dd470b4280e778c2894b09 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -405,8 +405,6 @@ displaydfr_mipi: dsi@228600000 {
>  			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
>  			reg = <0x2 0x28600000 0x0 0x100000>;
>  			power-domains = <&ps_mipi_dsi>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index be86d34c6696cb47d31696541266e504cee8ce10..fb8ad7d4c65a8fe7966f5541f24f03a379143cfb 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -63,6 +63,8 @@ dfr_mipi_out_panel: endpoint@0 {
>  
>  &displaydfr_mipi {
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  
>  	dfr_panel: panel@0 {
>  		compatible = "apple,j493-summit", "apple,summit";
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index e95711d8337f6cea898e88a3d564caf2c4f94404..f68354194355807dae9b5922bb8aff74da3c29e6 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -420,8 +420,6 @@ displaydfr_mipi: dsi@228600000 {
>  			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
>  			reg = <0x2 0x28600000 0x0 0x100000>;
>  			power-domains = <&ps_mipi_dsi>;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>  			status = "disabled";
>  
>  			ports {
> 

This looks a little odd and the two qcom devicetrees I've looked at have
the same "issue". Fixing warnings is welcome and the resulting dtbs are
unchanged.

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
