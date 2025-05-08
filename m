Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3B21420E;
	Thu,  8 May 2025 06:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684628; cv=none; b=uhGimfxiIHWWtzKWG6Ak+emU37RR5IOKY9kyl4vscyQnQ2EDgmbpb3SEAqqu9A7DXsw9xXQhxeUe97RZdtOuJwovbC0ysyJ3f6sWfDFZq5+VfywysVIq6sFHVur4njHfCOjg+puWI9bluIUHM+9GvpGPJJ5FisEC64YrO8oTaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684628; c=relaxed/simple;
	bh=K7oe0A7BgP4WD1oC62x+ywHGsTyFcCeJEXTseV/4mnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXl3eGwVaNNYpXZFd1Jw2JVn7SMkEENZGflOvPpGwVAEBFoajW77pGPGC5mbLGbF+ALevJxdIADJSJ2pDzQWlio9nW5dMNX4VAGLmllheyip3dVLeo6qckLdxNb7VdEgAiI2b3UmVvqauSLSCrx2M17Kow8UOn+yPeLGsF6W8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BBFE9343097;
	Thu, 08 May 2025 06:10:22 +0000 (UTC)
Date: Thu, 8 May 2025 06:10:12 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
Message-ID: <20250508061012-GYB505240@gentoo>
References: <20250416135406.16284-1-heylenay@4d2.org>
 <20250416135406.16284-6-heylenay@4d2.org>
 <aBxF81yqPgHP5oA_@ketchup>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxF81yqPgHP5oA_@ketchup>

Hi Haylen,

On 05:49 Thu 08 May     , Haylen Chu wrote:
> Hi Yixun,
> 
> On Wed, Apr 16, 2025 at 01:54:05PM +0000, Haylen Chu wrote:
> > Describe the PLL and system controllers that're capable of generating
> > clock signals in the devicetree.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index c670ebf8fa12..584f0dbc60f5 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> 
> I found that I forgot to make the nodenames of syscons consistent:
> both "system-control" and "system-controller" are used, and pll should
> be named as "clock-controller" instead.
> 
> Could you please drop the SoC devicetree patch then I could rework on
> it and correct the mistake? 
Sure, I can drop previous DT patch, and re-apply, thanks

> Or I could follow up a clean up patch if
> dropping isn't easy or doesn't follow the convention.
> 
> Thanks for your work,
> Haylen Chu
> 
> > @@ -314,6 +346,17 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		syscon_apbc: system-control@d4015000 {
> > +			compatible = "spacemit,k1-syscon-apbc";
> > +			reg = <0x0 0xd4015000 0x0 0x1000>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		uart0: serial@d4017000 {
> >  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> >  			reg = <0x0 0xd4017000 0x0 0x100>;
> > @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
> >  			reg = <0x0 0xd401e000 0x0 0x400>;
> >  		};
> >  
> > +		syscon_mpmu: system-controller@d4050000 {
> > +			compatible = "spacemit,k1-syscon-mpmu";
> > +			reg = <0x0 0xd4050000 0x0 0x209c>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		pll: system-control@d4090000 {
> > +			compatible = "spacemit,k1-pll";
> > +			reg = <0x0 0xd4090000 0x0 0x1000>;
> > +			clocks = <&vctcxo_24m>;
> > +			spacemit,mpmu = <&syscon_mpmu>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		syscon_apmu: system-control@d4282800 {
> > +			compatible = "spacemit,k1-syscon-apmu";
> > +			reg = <0x0 0xd4282800 0x0 0x400>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		plic: interrupt-controller@e0000000 {
> >  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
> >  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> > -- 
> > 2.49.0
> > 

-- 
Yixun Lan (dlan)
