Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2AE238152;
	Tue, 20 May 2025 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713245; cv=none; b=FhstxFytG+XjTWXeABIXFKaO7FKKbE1JS+qDKnsjneNqKz9bdMFuUaKOD2Ib5h3RVg3mvWx+QN40IO6mW8kuMApdklE3Z3hygv5Efw9nUFMw3LCKMPsEszkyF4PYQtuAkSeUjnXRrn+I7SgLSH3QXlDnaqIrUYXRHDawYmFkQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713245; c=relaxed/simple;
	bh=q5wVY9c5ZPA69PfiOdhIK17xTDSEDcrWg6odtPauNPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l796UQaL/I/U2URorHVIf54t/TkCdg4xS3/stoC0+uUOj02P5mCLS9efi4cBwY/LOOVh3dl2zxik1TalyULh5DRWr+vxLLUkLjyJcdzLVU8kWT9Q9xCpVJMxmPWTO5wBkWXQFh+j4vrpoRdFns8fv3Yi78tZF5/sA3NQgKOgbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bRglVG/a; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bRglVG/a"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CEB20260B9;
	Tue, 20 May 2025 05:53:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKH9mDnhu9xu; Tue, 20 May 2025 05:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747713239; bh=q5wVY9c5ZPA69PfiOdhIK17xTDSEDcrWg6odtPauNPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRglVG/azLZ19gIcL7BUT6PSdMpeIK2cyN1B5rrDEjCfZdCI28h2AUrsUisFHdCSS
	 hky1ueQKFAfq0zNVhJr34EAr7koJmAQDW4NTglUujmRVgElNFw3aZHafDrr+QimJ0d
	 6AIwAblYSddp8ho8ZvO1RI/8A54pPzFOtuEWd0aXwi3UvJwKIfHgeEmJzWZgwPkNtP
	 lJVVC/K5uKI/N5tfaRFI/S9O1GfHDGTkpdlhihlSIPJMsjLdhZp2bRBo0yHiHUOS9b
	 JINGMlkIldMVYEbjAtXcJbS2aIy2JPZggM9wnqJd+lkGBGhbC9ah0LoR6h1EYUIUSK
	 8v7O25M68YUdQ==
Date: Tue, 20 May 2025 03:53:33 +0000
From: Yao Zi <ziyao@disroot.org>
To: "Diederik de Haas" <didi.debian@cknow.org>,
	"Vinod Koul" <vkoul@kernel.org>,
	"Kishon Vijay Abraham I" <kishon@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Frank Wang" <frank.wang@rock-chips.com>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	"Detlev Casanova" <detlev.casanova@collabora.com>,
	"Shresth Prasad" <shresthprasad7@gmail.com>,
	"Chukun Pan" <amadeus@jmu.edu.cn>,
	"Jonas Karlman" <jonas@kwiboo.se>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
Message-ID: <aCv8vRu8gjrvK8wr@pie.lan>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
 <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org>

On Mon, May 19, 2025 at 09:26:05PM +0200, Diederik de Haas wrote:
> On Mon May 19, 2025 at 6:16 PM CEST, Yao Zi wrote:
> > All supported variants of naneng-combphy follow a register layout
> > similar to the RK3568 variant with some exceptions of SoC-specific
> > registers.
> >
> > Add RK3568 prefix for the common set of registers and the corresponding
> > SoC prefix for SoC-specific registers, making usage of definitions clear
> > and preparing for future COMBPHY variants with a different register
> > layout.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  .../rockchip/phy-rockchip-naneng-combphy.c    | 560 +++++++++---------
> >  1 file changed, 288 insertions(+), 272 deletions(-)
> >
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index ce91fb1d5167..1d1c7723584b 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -21,78 +21,80 @@
> >  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> >  
> >  /* COMBO PHY REG */
> > <snip>
> > -#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
> > +#define RK3568_PHYREG6				0x14
> > +#define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> > +#define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> > +#define RK3568_PHYREG6_PLL_DIV_2		1
> > +
> > +#define RK3568_PHYREG7				0x18
> > +#define RK3568_PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
> > +#define RK3568_PHYREG7_TX_RTERM_SHIFT		4
> > +#define RK3568_PHYREG7_TX_RTERM_50OHM		8
> > +#define RK3568_PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
> > +#define RK3568_PHYREG7_RX_RTERM_SHIFT		0
> > +#define RK3568_PHYREG7_RX_RTERM_44OHM		15
> > +
> > +#define RK3568_PHYREG8				0x1C
> > +#define RK3568_PHYREG8_SSC_EN			BIT(4)
> > +
> > +#define RK3568_PHYREG11				0x28
> > +#define RK3568_PHYREG11_SU_TRIM_0_7		0xF0
> > +
> > +#define RK3568_PHYREG12				0x2C
> > +#define RK3568_PHYREG12_PLL_LPF_ADJ_VALUE	4
> > +
> > +#define RK3568_PHYREG13				0x30
> > +#define RK3568_PHYREG13_RESISTER_MASK		GENMASK(5, 4)
> > +#define RK3568_PHYREG13_RESISTER_SHIFT		0x4
> > +#define RK3568_PHYREG13_RESISTER_HIGH_Z		3
> > +#define RK3568_PHYREG13_CKRCV_AMP0		BIT(7)
> > +
> > +#define RK3568_PHYREG14				0x34
> > +#define RK3568_PHYREG14_CKRCV_AMP1		BIT(0)
> > +
> > +#define RK3568_PHYREG15				0x38
> > +#define RK3568_PHYREG15_CTLE_EN			BIT(0)
> > +#define RK3568_PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
> > +#define RK3568_PHYREG15_SSC_CNT_SHIFT		6
> > +#define RK3568_PHYREG15_SSC_CNT_VALUE		1
> > +
> > +#define RK3568_PHYREG16				0x3C
> > +#define RK3568_PHYREG16_SSC_CNT_VALUE		0x5f
> > +
> > +#define RK3568_PHYREG18				0x44
> > +#define RK3568_PHYREG18_PLL_LOOP		0x32
> > +
> > +#define RK3568_PHYREG32				0x7C
> > +#define RK3568_PHYREG32_SSC_MASK		GENMASK(7, 4)
> > +#define RK3568_PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
> > +#define RK3568_PHYREG32_SSC_DIR_SHIFT		4
> > +#define RK3568_PHYREG32_SSC_UPWARD		0
> > +#define RK3568_PHYREG32_SSC_DOWNWARD		1
> > +#define RK3568_PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
> > +#define RK3568_PHYREG32_SSC_OFFSET_SHIFT	6
> > +#define RK3568_PHYREG32_SSC_OFFSET_500PPM	1
> > +
> > +#define RK3568_PHYREG33				0x80
> > +#define RK3568_PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
> > +#define RK3568_PHYREG33_PLL_KVCO_SHIFT		2
> > +#define RK3568_PHYREG33_PLL_KVCO_VALUE		2
> > +#define RK3576_PHYREG33_PLL_KVCO_VALUE		4
> > +
> > +/* RK3588 COMBO PHY registers */
> > +#define RK3588_PHYREG27				0x6C
> > +#define RK3588_PHYREG27_RX_TRIM			0x4C
> 
> Would it be better if RK3588_PHYREG* comes after RK3576_PHYREG*?
> 
> Cheers,
>   Diederik

It's intended to keep RK3576 definitions below RK3588 ones. The RK3576
driver makes use of a register introduced for RK3588 variant
(RK3588_PHYREG27). Since similar reusing doesn't happen reversely, I
consider the design of RK3576 a superset of the RK3588 one, and put
RK3576 definitions later in the file.

> > +
> > +/* RK3576 COMBO PHY registers */
> > +#define RK3576_PHYREG10				0x24
> > +#define RK3576_PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
> > +#define RK3576_PHYREG10_SSC_PCM_3500PPM		7
> > +
> > +#define RK3576_PHYREG17				0x40
> > +
> > +#define RK3576_PHYREG21				0x50
> > +#define RK3576_PHYREG21_RX_SQUELCH_VAL		0x0D
> > +
> > +#define RK3576_PHYREG30				0x74
> >  
> >  struct rockchip_combphy_priv;
> > <snip>


Thanks,
Yao Zi
