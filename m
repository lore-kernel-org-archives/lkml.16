Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD122DF83;
	Thu,  8 May 2025 23:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746027; cv=none; b=URt795rffurzBFyncRJRfYfdfchDXbsQBeHxRc+sl3HpDuL//w7YCvZtyaJEfzOYIvMwluE4dDf1ivwKPVY9n5+W18CljniRUkX7ZeFDs7vN7aQk1haqLnSVAtKeu0f9DVXE4WU2zrTQ+++EH1YPYZltlxLhPpwj600fQNVC4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746027; c=relaxed/simple;
	bh=bB3j8fb6z811VpRpryPJkvawI3jg6GwtmMHB9Bn3MXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6V1bL1GHyKK/OmTdNx4JWk/uHC0mJsy2twH5cneD7SfbHkBkREp9iuwTLLTbLj/VDkFOML5V3q2fUZoFvc3bbq63dYb8mO4usFVnPAlk6Kptw8WhKSJnxIpnEHp/F76a9rssBi0skIh3xO9GcXNQWa8Z9pljB7vEUbJr/swtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ZWSyrQuD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZWSyrQuD"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5FCE826161;
	Fri,  9 May 2025 01:13:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQQXvO6tkiyE; Fri,  9 May 2025 01:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746746021; bh=bB3j8fb6z811VpRpryPJkvawI3jg6GwtmMHB9Bn3MXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWSyrQuDh5IumxGz2OmiGWHrjY9wXY9i2F/vkQhU93LaOxvGebq9SifRwzhWk1e+a
	 /BCMa9uycuIDQiRlie6FoiyqeYGEwyz9K5Qb/etHmQJ8F0BBbTEd9B1eu/0GPen1Je
	 40bE/cwhkhAWP3IM91TNH0Py/q1Bqxcda/4stYi3S9RoI3C5WgLXHOfzMmdfTetG1N
	 Wthk5CuMo78/PHYXtNtaO9hu/BLtEphcec5uWxKm06pAJbgSqKT3jCSnFom9XsFgTK
	 nyMKN+AGLKfcErTnNtuBj61JeG8QwuQcjvayOpIn+mhVaj9U9RHCj48njfqS8jCbwq
	 BXHAC7VmzKmuA==
Date: Thu, 8 May 2025 23:13:25 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Message-ID: <aB06lQs9d0q8pMU_@pie.lan>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508135307.14726-1-ziyao@disroot.org>
 <5349721.GXAFRqVoOG@phil>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5349721.GXAFRqVoOG@phil>

On Thu, May 08, 2025 at 07:26:13PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 8. Mai 2025, 15:53:06 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> > PCIe and USB3 mode. The control logic is similar to previous variants of
> > naneng-combphy but the register layout is apperantly different from the
> > RK3568 one.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../rockchip/phy-rockchip-naneng-combphy.c    | 180 +++++++++++++++++-
> >  1 file changed, 179 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 1d1c7723584b..7c92f7ac3c7f 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -20,7 +20,40 @@
> >  #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
> >  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> >  
> > -/* COMBO PHY REG */
> > +/* RK3528 COMBO PHY REG */
> > +#define RK3528_PHYREG6				0x18
> > +#define  RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
> > +#define   RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> > +#define  RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> > +#define   RK3528_PHYREG6_SSC_UPWARD		0
> > +#define   RK3528_PHYREG6_SSC_DOWNWARD		1
> > +#define RK3528_PHYREG40				0x100
> > +#define  RK3528_PHYREG40_SSC_EN			BIT(20)
> > +#define  RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
> > +#define   RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> > +#define RK3528_PHYREG42				0x108
> > +#define  RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> > +#define   RK3528_PHYREG42_CKDRV_CLK_PLL		0
> > +#define   RK3528_PHYREG42_CKDRV_CLK_CKRCV	1
> > +#define  RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> > +#define   RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> > +#define  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> > +#define   RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> > +#define  RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> > +#define   RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> > +#define RK3528_PHYREG80				0x200
> > +#define  RK3528_PHYREG80_CTLE_EN		BIT(17)
> > +#define RK3528_PHYREG81				0x204
> > +#define  RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> > +#define  RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> > +#define   RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> > +#define RK3528_PHYREG83				0x20c
> > +#define  RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> > +#define   RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> > +#define RK3528_PHYREG86				0x218
> > +#define  RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> 
> I'd think staying with one layout would be best, so not doing this
> indentation here. Instead maybe follow the other ones like

Though seems more clear, it's reasonable to keep the style consistent.

Will change it in v2, thanks.

> #define RK3528_PHYREG6				0x18
> #define RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
> #define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> #define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> #define RK3528_PHYREG6_SSC_UPWARD		0
> #define RK3528_PHYREG6_SSC_DOWNWARD		1
> 
> #define RK3528_PHYREG40				0x100
> #define RK3528_PHYREG40_SSC_EN			BIT(20)
> #define RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
> #define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> 
> ...
> 
> i.e. register + bits + blank line
> 
> other than that
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> 

Best regards,
Yao Zi
