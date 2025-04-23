Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB42566DF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400616; cv=none; b=dUTM4XsTCKN1sfjOTSbdGRPANwxHvAKaNEcb8Yfs4pm7usprYaBasUtbE41r/IRzvyjc+iNAjPmI7JqNuo4DLzCDJFXeUgkNZz0EHw8zX2I09B9Q1fCjjtHj8R+f6Zfiu7J4tHift+QCW3NxLqh3Qmr7RD3nBqdwsT8jCbnsRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400616; c=relaxed/simple;
	bh=jHLD1n2gGYYVd5R6g6n10KSyD4gzCZwcAeLg23QXHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eymg/X1nz1p10NiBZYGKp7dQntmPSEzNyBC8uzDez8Mh8iVNdN8YYhW5pf8gDeuYVkSJlCEjyBL065TsbuFECL6K34NwfeoBGosCFTOgYXflObJNR3mWU6d1H9PekspWU+ln7rZ9QnqwAldVB+piEF4W5mK+cdtElPwNHVYfUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B8aSvBY1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B8aSvBY1"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AC3C1461;
	Wed, 23 Apr 2025 11:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745400610;
	bh=jHLD1n2gGYYVd5R6g6n10KSyD4gzCZwcAeLg23QXHSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8aSvBY1/x2LIAKbBf8SeWyhbszS53PJJ2D9rpDEVhrVflfZaQ69KXvsDknb/kAf0
	 s5rTmuvH6bNtoniEgH+GxWR3FE24MVTDz2jbt/iNyaeXd1P8/5Z9n3Z9268TPPuMck
	 /NJY8yJK5oDnz/PHrW4NfLzSX3khyvl+LFcpEup0=
Date: Wed, 23 Apr 2025 12:30:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy-zynqmp: Postpone getting clock rate until actually
 needed
Message-ID: <20250423093008.GC17813@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7a5992b5-aa78-4b18-bf5c-70f893b58f48@emailsignatures365.codetwo.com>
 <20250314150431.28319-1-mike.looijmans@topic.nl>
 <20250422221802.GB32759@pendragon.ideasonboard.com>
 <f3051d1d-ecb2-4a93-ad6b-76ab7a5538af@topic.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f3051d1d-ecb2-4a93-ad6b-76ab7a5538af@topic.nl>

Hi Mike,

On Wed, Apr 23, 2025 at 08:59:43AM +0200, Mike Looijmans wrote:
> On 23-04-2025 00:18, Laurent Pinchart wrote:
> > Hi Mike,
> >
> > Thank you for the patch.
> >
> > On Fri, Mar 14, 2025 at 04:04:18PM +0100, Mike Looijmans wrote:
> >> At probe time the driver would display the following error and abort:
> >>    xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
> >>
> >> This issue was that at probe time, the system has not decided yet whether
> >> the GTR is to be used for SATA (150MHz) or PCIe (100 MHz).
> > At what point does the system decide that ? I've only used (and tested)
> > this driver for DisplayPort.
> 
> In retrospect, yeah, the commit text could be a bit more elaborate on that.
> 
> This PHY driver probes before the I2C bus which contains the programmable 
> clock chip that provides the GT clocks for the PS. This isn't a problem, as 
> the PHY lane won't be needed yet.
> 
> When the SATA (or PCIe or network or displayport or ...) driver probes, the 
> clock gets programmed. The PHY lane won't be enabled until after that.

Would it be possible to defer probing (as in returning -EPROBE_DEFER) of
the PHY until the clock is available ?

> >> The driver
> >> doesn't need to know the clock frequency at that point yet, so wait until
> >> the lane is actually being initialized before requesting the clock rate
> >> setting.
> >>
> >> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >> ---
> >>
> >>   drivers/phy/xilinx/phy-zynqmp.c | 61 ++++++++++++++++-----------------
> >>   1 file changed, 30 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> >> index 05a4a59f7c40..e29e3e51d380 100644
> >> --- a/drivers/phy/xilinx/phy-zynqmp.c
> >> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> >> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
> >>    * @siou: siou base address
> >>    * @gtr_mutex: mutex for locking
> >>    * @phys: PHY lanes
> >> - * @refclk_sscs: spread spectrum settings for the reference clocks
> >>    * @clk: reference clocks
> >>    * @tx_term_fix: fix for GT issue
> >>    * @saved_icm_cfg0: stored value of ICM CFG0 register
> >> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
> >>   	void __iomem *siou;
> >>   	struct mutex gtr_mutex; /* mutex for locking */
> >>   	struct xpsgtr_phy phys[NUM_LANES];
> >> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
> >>   	struct clk *clk[NUM_LANES];
> >>   	bool tx_term_fix;
> >>   	unsigned int saved_icm_cfg0;
> >> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
> >>   	return ret;
> >>   }
> >>   
> >> +/* Get the spread spectrum (SSC) settings for the reference clock rate */
> >> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr_phy)
> >> +{
> >> +	unsigned long rate;
> >> +	struct clk *clk;
> >> +	unsigned int i;
> >> +
> >> +	clk = gtr_phy->dev->clk[gtr_phy->refclk];
> >> +	rate = clk_get_rate(clk);
> >> +
> >> +	for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> >> +		/* Allow an error of 100 ppm */
> >> +		unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> >> +
> >> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
> >> +			return &ssc_lookup[i];
> >> +	}
> >> +
> >> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n",
> >> +		rate, gtr_phy->refclk);
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >>   /* Configure PLL and spread-sprectrum clock. */
> >>   static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
> >>   {
> >>   	const struct xpsgtr_ssc *ssc;
> >>   	u32 step_size;
> >>   
> >> -	ssc = gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
> >> +	ssc = xpsgtr_find_sscs(gtr_phy);
> >> +	if (!ssc)
> >> +		return;
> >
> > Isn't it an issue that we now fail here without propagating an error
> > back to the caller ? The function is called by xpsgtr_phy_init(), which
> > return an int, so I think returning an error code here would make sense.
> 
> Agree, I'll make a v2
> 
> > The rest of the patch looks good to me. I would however appreciate
> > feedback from someone at AMD more knowledgeable than I am with the
> > hardware. Michal, could you propose an appropriate second maintainer for
> > this driver ?
> >
> >> +
> >>   	step_size = ssc->step_size;
> >>   
> >>   	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
> >> @@ -823,8 +848,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
> >>   	}
> >>   
> >>   	refclk = args->args[3];
> >> -	if (refclk >= ARRAY_SIZE(gtr_dev->refclk_sscs) ||
> >> -	    !gtr_dev->refclk_sscs[refclk]) {
> >> +	if (refclk >= ARRAY_SIZE(gtr_dev->clk)) {
> >>   		dev_err(dev, "Invalid reference clock number %u\n", refclk);
> >>   		return ERR_PTR(-EINVAL);
> >>   	}
> >> @@ -928,9 +952,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
> >>   {
> >>   	unsigned int refclk;
> >>   
> >> -	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk) {
> >> -		unsigned long rate;
> >> -		unsigned int i;
> >> +	for (refclk = 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
> >>   		struct clk *clk;
> >>   		char name[8];
> >>   
> >> @@ -946,29 +968,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr_dev)
> >>   			continue;
> >>   
> >>   		gtr_dev->clk[refclk] = clk;
> >> -
> >> -		/*
> >> -		 * Get the spread spectrum (SSC) settings for the reference
> >> -		 * clock rate.
> >> -		 */
> >> -		rate = clk_get_rate(clk);
> >> -
> >> -		for (i = 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
> >> -			/* Allow an error of 100 ppm */
> >> -			unsigned long error = ssc_lookup[i].refclk_rate / 10000;
> >> -
> >> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
> >> -				gtr_dev->refclk_sscs[refclk] = &ssc_lookup[i];
> >> -				break;
> >> -			}
> >> -		}
> >> -
> >> -		if (i == ARRAY_SIZE(ssc_lookup)) {
> >> -			dev_err(gtr_dev->dev,
> >> -				"Invalid rate %lu for reference clock %u\n",
> >> -				rate, refclk);
> >> -			return -EINVAL;
> >> -		}
> >>   	}
> >>   
> >>   	return 0;

-- 
Regards,

Laurent Pinchart
