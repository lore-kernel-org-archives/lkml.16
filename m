Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844801A3168
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672979; cv=none; b=HG63gM4gu5s4on6iYxCTj+trISrWrqSCGV3iXaaCcFVSd8YvUJEU3nq3+zJVrGyA9fIARaP/baw9MvT1NenOlzdEngLXSeVqyo+iZBITNnup3VeZjHtXykdna7TjqyOGgNGxVRjlL+ABhstPIHztrzSIE+sQF+F9XLMLl/nLKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672979; c=relaxed/simple;
	bh=zwzcoEIkkg26/Ri7aIdMkYDloXpkCtTah/ZbEw9wpqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGqo9sFPRPDffMGNrzVOnquWrWE7rXFsF+5axDBhwNApTHN1wnR0criB0Arb3sWnOHhN6pY6MVB0We4R+DTboOavilisLzxUE9bftyi+stonbNPH/ocOMYSvvL92IhcwSbgq3nBnxSQ1IE60ApaayosPMgaKjEi07xFBn2VyhKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YknfX437; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YknfX437"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7A76A1FA8F;
	Mon, 23 Jun 2025 12:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750672974;
	bh=o9gK1oyJAjE6oa76DzirijbCMI6ITVFFKA9WRcVsiT0=; h=From:To:Subject;
	b=YknfX437HZgovMEl0FLqq8i55sHKy/dG4VIucIsOBk8u3uBSNsAItiKCi5jZr9Qkr
	 Ne6V6S5/eXWz9kYtVokuXMtXW+KqJBZH+IM8Fr2mdd3tLwmNEWHwsrl1LL4WXiwHDz
	 nQgvlbBZh8R69LAC5fYhsC09mmJzzrzrKZ6PIrkBxuNLuoBPZoKNNEMnZsPGo+YqdM
	 UwzUPqZRGxyqafupcruy1tPc/vAGWk4eTUAk0sS7Y1HZ+cz/yF8oI4w00RJVaVhwri
	 vH2bpx476LPXct4rPIoowpK+n8A3zkYUdjmxzMayQdm8ckWwgC4sXGdXazkOxm6OVj
	 DHu331xwM3NvA==
Date: Mon, 23 Jun 2025 12:02:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiagofranco@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Message-ID: <20250623100249.GA32388@francesco-nb>
References: <CGME20250619122746eucas1p149ff73e78cb82dc06c19960a2bbd3d89@eucas1p1.samsung.com>
 <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
 <e23e6192-6e13-41b4-acdd-2593f4f37895@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e23e6192-6e13-41b4-acdd-2593f4f37895@samsung.com>

On Mon, Jun 23, 2025 at 11:34:34AM +0200, Marek Szyprowski wrote:
> On 19.06.2025 14:27, Tomi Valkeinen wrote:
> > The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> > pre-enable and post-disable") changed the order of enable/disable calls.
> > Previously the calls (on imx8mm) were:
> >
> > mxsfb_crtc_atomic_enable()
> > samsung_dsim_atomic_pre_enable()
> > samsung_dsim_atomic_enable()
> >
> > now the order is:
> >
> > samsung_dsim_atomic_pre_enable()
> > mxsfb_crtc_atomic_enable()
> > samsung_dsim_atomic_enable()
> >
> > On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> > issues:
> >
> > 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> > set the rate, just uses it with the rate it has. On imx8mm this refclk
> > seems to be related to the LCD controller's video clock. So, when the
> > mxsfb driver sets its video clock, DSI's refclk rate changes.
> >
> > Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> > refclk rate was set (and didn't change) in the DSI enable calls. Now the
> > rate changes between DSI's pre_enable() and enable(), but the driver
> > configures the PLL in the pre_enable().
> >
> > Thus you get a black screen on a modeset. Doing the modeset again works,
> > as the video clock rate stays the same.
> >
> > 2. The image on the screen is shifted/wrapped horizontally. I have not
> > found the exact reason for this, but the documentation seems to hint
> > that the LCD controller's pixel stream should be enabled first, before
> > setting up the DSI. This would match the change, as now the pixel stream
> > starts only after DSI driver's pre_enable().
> >
> > The main function related to this issue is samsung_dsim_init() which
> > will do the clock and link configuration. samsung_dsim_init() is
> > currently called from pre_enable(), but it is also called from
> > samsung_dsim_host_transfer() to set up the link if the peripheral driver
> > wants to send a DSI command.
> >
> > This patch fixes both issues by moving the samsung_dsim_init() call from
> > pre_enable() to enable().
> >
> > However, to deal with the case where the samsung_dsim_init() has already
> > been called from samsung_dsim_host_transfer() and the refclk rate has
> > changed, we need to make sure we re-initialize the DSI with the new rate
> > in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> > flag and uninitializing the clocks and irqs before calling
> > samsung_dsim_init().
> >
> > Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> > Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Seems to be working fine on all my Exynos based boards:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> BTW, it was a long discussion how to handle the dsim initialization and 
> we agreed to keep calling samsung_dsim_init() on first dsi transfer for 
> Exynos case and from pre-enable for others:
> 
> https://lore.kernel.org/all/20221209152343.180139-11-jagan@amarulasolutions.com/
> 
> I'm not sure if changing this won't break again something, especially 
> the boards with DSI bridge or panel controlled via I2C instead of the 
> DSI commands. This has to be tested on the all supported variants of 
> this hardware.

FWIW, DSI bridges (LT8912B and SN65DSI83) controlled over I2C were
tested fine with this patch on both NXP i.MX8MP and 8MM (see Hiago
tested-by).


Francesco

