Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42BE1853
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745172141; cv=none; b=AkN0EYdF35YezNDFssZeEn3XZ/7Iwy4QvAi9ksg6Tx3n9W+PWj/PfJss4yTPNXyCgLK8vufqeygC8bhj2HkrAaR0nqanMJC7K8TxrH++xhodZxYrCus24/RF/AOLKsZJOrGJc/OR6hztPiPoAqLg25kjkdIPiycFg6lTYQmclEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745172141; c=relaxed/simple;
	bh=Z62lxCtBRp/2/fUDTg36hQJ6qGNTZoetkvn7mZilOOE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GT8ZVLOi2KQYEWHLvsRidw1FGFFVJ7FUtQWOe4CfPp2mc/cISK2HRwWnHHQAly0TZtt2FA0dQmlb61KL0DcTCRgzaUQdT/5sMDZX6P0/FM9LevQgI/1XX0HDujaa9H2Hj7BxkRgZ8oQgGCu+uOwaH7pBhevb+2/unrYmNae3ic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G3LdSFbm; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G3LdSFbm"
Message-ID: <7de0229a-192f-4d0f-8add-1a50c58f367b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745172135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNV6mUL9LuZCuP3+4baaG3zrGHMcnuMfKZ/AN4GnbKw=;
	b=G3LdSFbmjhexJplLYkrlHdZCRR6rbQ908yzpsyib+g+rZDekzmZPhjbketatQVm/t7w71A
	T0vRpJv5Iha9iMHLzDGcSLOlItDceSAMK8ny6VeQa138XUSXfukckdMHQttcp+sb9QsbTG
	mkB+ZPJuOZuSgxkQEN3gVmx4wASutqA=
Date: Sun, 20 Apr 2025 23:31:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 16/17] drm/bridge: cdns-dsi: Tune adjusted_mode->clock
 according to dsi needs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-16-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-16-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Tomi,

On 14/04/25 16:41, Tomi Valkeinen wrote:
> The driver currently expects the pixel clock and the HS clock to be
> compatible, but the DPHY PLL doesn't give very finely grained rates.
> This often leads to the situation where the pipeline just fails, as the
> resulting HS clock is just too off.
> 
> We could change the driver to do a better job on adjusting the DSI
> blanking values, hopefully getting a working pipeline even if the pclk
> and HS clocks are not exactly compatible. But that is a bigger work.
> 
> What we can do easily is to see in .atomic_check() what HS clock rate we
> can get, based on the pixel clock rate, and then convert the HS clock
> rate back to pixel clock rate and ask that rate from the crtc. If the
> crtc has a good PLL (which is the case for TI K3 SoCs), this will fix
> any issues wrt. the clock rates.
> 
> If the crtc cannot provide the requested clock, well, we're no worse off
> with this patch than what we have at the moment.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 37 ++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 63031379459e..165df5d595b8 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -908,6 +908,28 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static long cdns_dsi_round_pclk(struct cdns_dsi *dsi, unsigned long pclk)
> +{
> +	struct cdns_dsi_output *output = &dsi->output;
> +	unsigned int nlanes = output->dev->lanes;
> +	union phy_configure_opts phy_opts = { 0 };
> +	u32 bitspp;
> +	int ret;
> +
> +	bitspp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
> +
> +	ret = phy_mipi_dphy_get_default_config(pclk, bitspp, nlanes,
> +					       &phy_opts.mipi_dphy);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &phy_opts);
> +	if (ret)
> +		return ret;
> +
> +	return div_u64((u64)phy_opts.mipi_dphy.hs_clk_rate * nlanes, bitspp);
> +}
> +
>  static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>  					struct drm_bridge_state *bridge_state,
>  					struct drm_crtc_state *crtc_state,
> @@ -919,11 +941,26 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>  	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>  	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
>  	struct videomode vm;
> +	long pclk;
>  
>  	/* cdns-dsi requires negative syncs */
>  	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>  	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
>  
> +	/*
> +	 * The DPHY PLL has quite a coarsely grained clock rate options. See
> +	 * what hsclk rate we can achieve based on the pixel clock, convert it
> +	 * back to pixel clock, set that to the adjusted_mode->clock. This is
> +	 * all in hopes that the CRTC will be able to provide us the requested
> +	 * clock, as otherwise the DPI and DSI clocks will be out of sync.
> +	 */
> +
> +	pclk = cdns_dsi_round_pclk(dsi, adjusted_mode->clock * 1000);
> +	if (pclk < 0)
> +		return (int)pclk;
> +
> +	adjusted_mode->clock = pclk / 1000;
> +
>  	drm_display_mode_to_videomode(adjusted_mode, &vm);
>  
>  	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);

I think at this point cdns_dsi_check_conf is really only creating a
dsi_cfg (from the video-mode) so that it can later be used, and then
running phy_mipi_dphy_get_default_config(), and phy_validate(), both of
which have nothing to do with the freshly made dsi_cfg.

If there is no benefit in running both the latter functions again after
cdns_dsi_round_pclk() runs them, then perhaps we can just drop the
cdns_dsi_check_conf() altogether in favor of cdns_dsi_mode2cfg() being
called from .atomic_check()?


Furthermore, I understand updating the adjusted_mode->clock might help
the CRTC to use a pixel clock that's more in-tune with the _actual_
hs_clk_rate that is going to be generated. But, I am worried that it'll
cause a delta from the intended fps from the CRTC's end because the
timings aren't adjusted in accordance with the pixel-clock.

Perhaps, along with pixel-clock, we can update the dsi_htotal and
dpi_htotal both too, to

new_dsi_htotal = (hs_clk_rate * #lanes) / (dpi_votal * fps * 8)
new_dpi_htotal = (hs_clk_rate * #lanes) / (dpi_vtotal * fps * bitspp).

And then, the respective front-porches can too get updated accordingly.


--
Regards
Aradhya
