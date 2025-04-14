Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB041A2380;
	Mon, 14 Apr 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634474; cv=none; b=IQtzp920CY0a2IfE7ISJxf83aZa5lRLfljJWo7IHttlZhPKQ00n7EDJIE/2wI6+yu6EEBt7HlFZWXgDKH5psJNFn/4Cjgvlg+miLsiRMLa1qRkW778AnkGHxDXUTwsW0WFOqxQdozT4KGlUE7Ih24j0zpwohtFEKNSqGHPE4BFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634474; c=relaxed/simple;
	bh=QsIBr7PmztIyHLM9T+NpRun+FoqaEeRAxlPHdVqB1WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnzDX66bK2I9fmVUgmzWdWdTYydE4u6FOpCQxKcSKs/zXOCsgH3GU1HzCb8pOOyG8rlxgqlYVQjHVwsceHE+N7ffmqYTbrpOLfozxST8cyynD9d3iM+IHpxNioDHUCzaMX7YDpijXX3rhmgjyG0LE1yqhVjXR4i+ceM9er0el2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3vSR88V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3vSR88V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA9AC4CEE2;
	Mon, 14 Apr 2025 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634474;
	bh=QsIBr7PmztIyHLM9T+NpRun+FoqaEeRAxlPHdVqB1WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3vSR88V+CaMm4+J7dRa5OE26INA51ofAMCzDjqUAiTxIVJvOi7Yg4FS7DcXfHVV+
	 x3mNkGXK/ZB2QE3LjisppWC1XW7vSiVOx7yUJGHOPxw2wxGbPVwTYvskmVF6t6+2AC
	 IcQ6UUnBzg5tp5QxdE/xnnUi/z7ofHGHvbTsMlmNT4yb+NhuA73McjobP05Awwd5SZ
	 EzjBKtw72VN8m2jNELTtOP10l5h6qEHnSEFhdv7OnJHu2HBONwoXBZx/Ns60exlrGz
	 WamblujbQmJ9WeKD+X1PpW3sLrJGPltvpuFR3WgPGXRd1LWschSx1Of0LTkvQZvSre
	 miF4z++GRwgsA==
Date: Mon, 14 Apr 2025 14:41:03 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: marvell: Use preferred node names for
 "simple-bus"
Message-ID: <6mj4bvaqho5oazrhkkzncbwlrcupe3zpweuk7aqr2wdgfphejb@sc6ojhybs26g>
References: <20250226214751.3751865-1-robh@kernel.org>
 <20250226214751.3751865-3-robh@kernel.org>
 <20250412001703.qbbfhtb6koofvner@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412001703.qbbfhtb6koofvner@skbuf>

I will fix the U-Boot code in upstream, and schedule U-Boot upgrade
on MOXes running Turris OS...

Marek

On Sat, Apr 12, 2025 at 03:17:03AM +0300, Vladimir Oltean wrote:
> Hello,
> 
> On Wed, Feb 26, 2025 at 03:47:49PM -0600, Rob Herring (Arm) wrote:
> > The "simple-bus" binding has preferred node names such as "bus",
> > ".*-bus", or "soc". Rename the Marvell platforms to use these names.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi     | 2 +-
> >  arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
> >  arch/arm64/boot/dts/marvell/armada-ap806.dtsi     | 1 -
> >  arch/arm64/boot/dts/marvell/armada-ap807.dtsi     | 1 -
> >  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi     | 4 ++--
> >  arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 4 ++--
> >  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
> >  7 files changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > index 9603223dd761..6ec22eaaf816 100644
> > --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> > @@ -78,7 +78,7 @@ soc {
> >  		#size-cells = <2>;
> >  		ranges;
> >  
> > -		internal-regs@d0000000 {
> > +		bus@d0000000 {
> >  			#address-cells = <1>;
> >  			#size-cells = <1>;
> >  			compatible = "simple-bus";
> 
> Thank you for your patch, which is now commit
> ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95.
> 
> I have an off-the-shelf Turris MOX board, which was shipped with a
> U-Boot older than the commit linked below (does not contain it):
> https://github.com/u-boot/u-boot/commit/bcf6971d536793eb99e12ff857cc018963d7cd46
> 
> and as such, is incapable of loading current mainline device trees,
> which contain your change, because it is hardcoded to perform FDT fixups
> based on paths such as:
> #define ETH1_PATH	"/soc/internal-regs@d0000000/ethernet@40000"
> #define MDIO_PATH	"/soc/internal-regs@d0000000/mdio@32004"
> #define SFP_GPIO_PATH	"/soc/internal-regs@d0000000/spi@10600/moxtet@1/gpio@0"
> 
> which no longer exist.
> 
> Relevant portion of boot log:
> 
> ## Flattened Device Tree blob at 04f00000
>    Booting using the fdt blob at 0x4f00000
>    Loading Device Tree to 000000003bf16000, end 000000003bf1e11e ... OK
> ERROR: board-specific fdt fixup failed: FDT_ERR_NOTFOUND
>  - must RESET the board to recover.
> 
> FDT creation failed! hanging...### ERROR ### Please RESET the board ###
> 
> Note that the hint about what is wrong is only visible with a serial
> console which I happen to have. The board does not rely on it for normal
> operation, which could pose a problem to typical users.
> 
> Just bringing this to everyone's attention. In the meantime, I'm going
> off to figure out how to build and flash a new U-Boot using the steps at
> https://github.com/turris-cz/mox-boot-builder.
> 
