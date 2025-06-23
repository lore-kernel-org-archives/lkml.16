Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD352673AA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680133; cv=none; b=WfrYTOf7wK0PqSVd4F8aEfta7X8UJygiP4KaexGZ86SBxBHTiLSPFdetZXCtD+z6k+3oPpByHbzIhZS4j32BNKG0SUAlT8iBBzCIqKVNLwPcoUtbP3H0Wc1lhu4MD5c6MotPkGggPYQtUwfZQDbg83lktXQSiPaVI9Us++mv7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680133; c=relaxed/simple;
	bh=eRambE0IBM8lNOiYCxa2v73RenBHpxNaK9LeTRHj+AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWS9xltaE0ZUMdSB3vMRPxf/m1SseKoaCj6H+xgMdqWx0uB2qNT1tb8NBQxfkIeZQEkuch+NIYw3j0trkoWUITKBwfHuWpm3CA5rQkNr6APREXTp+lIIvOyNdPvyDz7Rdp4ZGZNLho4BXH03ZMCGheVPBQBAUNwm+AfRxBdRpYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l3+UqK+K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l3+UqK+K"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 92EE9D77;
	Mon, 23 Jun 2025 14:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750680112;
	bh=eRambE0IBM8lNOiYCxa2v73RenBHpxNaK9LeTRHj+AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3+UqK+KWz4sGVgbakoiaVTmeJjO6bv7sXCPr3994UjbHOvGFinjekByWnIlIIumD
	 +BmzInw6CZif2voQk9KtawqU16spy5+mpeD40aBE/SyXqRYhqI8UICjQ5GYPwjil1u
	 ma5r9yxK0Rwf+4UrnD8DVxcX7FJsCvlwyvj05Q4Q=
Date: Mon, 23 Jun 2025 15:01:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Subject: Re: [PATCH v2] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
Message-ID: <20250623120149.GA19319@pendragon.ideasonboard.com>
References: <20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com>

Hi Dharma,

Thank you for the patch.

On Mon, Jun 23, 2025 at 04:20:20PM +0530, Dharma Balasubiramani wrote:
> From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> 
> The LVDS controller was hardcoded to JEIDA mapping, which leads to
> distorted output on panels expecting VESA mapping.
> 
> Update the driver to dynamically select the appropriate mapping and
> pixel size based on the panel's advertised media bus format. This
> ensures compatibility with both JEIDA and VESA displays.
> 
> Modernize the bridge ops to use atomic_enable/disable, and retrieve
> the bus format from the connector via the atomic bridge state.
> 
> Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Note: Tested the changes on newvision 10.1 VESA display.
> 
> Changes in v2:
> - Switch to atomic bridge functions
> - Drop custom connector creation
> - Use drm_atomic_get_new_connector_for_encoder()
> - Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com
> ---
>  drivers/gpu/drm/bridge/microchip-lvds.c | 64 +++++++++++++++++++++++++++------
>  1 file changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> index 9f4ff82bc6b4..b71478aa36e9 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -11,6 +11,7 @@
>  #include <linux/component.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/devinfo.h>
> @@ -41,9 +42,11 @@
>  
>  /* Bitfields in LVDSC_CFGR (Configuration Register) */
>  #define LVDSC_CFGR_PIXSIZE_24BITS	0
> +#define LVDSC_CFGR_PIXSIZE_18BITS	1

#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)

>  #define LVDSC_CFGR_DEN_POL_HIGH		0
>  #define LVDSC_CFGR_DC_UNBALANCED	0
>  #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
> +#define LVDSC_CFGR_MAPPING_VESA		0
>  
>  /*Bitfields in LVDSC_SR */
>  #define LVDSC_SR_CS	BIT(0)

I think you can drop the panel field of the mchp_lvds structure in the
same patch.

> @@ -76,9 +79,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
>  	writel_relaxed(val, lvds->regs + offset);
>  }
>  
> -static void lvds_serialiser_on(struct mchp_lvds *lvds)
> +static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
>  {
>  	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
> +	u8 map, pix_size;
>  
>  	/* The LVDSC registers can only be written if WPEN is cleared */
>  	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
> @@ -93,11 +97,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
>  		usleep_range(1000, 2000);
>  	}
>  
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		map = LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_18BITS;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		map = LVDSC_CFGR_MAPPING_VESA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	default:
> +		map = LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	}
> +
>  	/* Configure the LVDSC */
> -	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
> -				LVDSC_CFGR_DC_UNBALANCED |
> -				LVDSC_CFGR_DEN_POL_HIGH |
> -				LVDSC_CFGR_PIXSIZE_24BITS));
> +	lvds_writel(lvds, LVDSC_CFGR, (map | LVDSC_CFGR_DC_UNBALANCED |
> +		    LVDSC_CFGR_DEN_POL_HIGH | pix_size));

You can drop the inner parentheses.

>  
>  	/* Enable the LVDS serializer */
>  	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
> @@ -113,7 +130,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }
>  
> -static void mchp_lvds_enable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  	int ret;
> @@ -129,11 +147,35 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
>  		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
>  		return;
>  	}
> +}
> +
> +static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
> +	struct drm_connector *connector;
> +
> +	/* default to jeida-24 */
> +	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (connector && connector->display_info.num_bus_formats)
> +		bus_format = connector->display_info.bus_formats[0];
> +
> +	lvds_serialiser_on(lvds, bus_format);
> +}
> +
> +static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  
> -	lvds_serialiser_on(lvds);
> +	/* Turn off the serialiser */
> +	lvds_writel(lvds, LVDSC_CR, 0);
>  }
>  
> -static void mchp_lvds_disable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  
> @@ -143,8 +185,10 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
>  	.attach = mchp_lvds_attach,
> -	.enable = mchp_lvds_enable,
> -	.disable = mchp_lvds_disable,
> +	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
> +	.atomic_enable = mchp_lvds_atomic_enable,
> +	.atomic_disable = mchp_lvds_atomic_disable,
> +	.atomic_post_disable = mchp_lvds_atomic_post_disable,
>  };
>  
>  static int mchp_lvds_probe(struct platform_device *pdev)
> 
> ---
> base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
> change-id: 20250618-microchip-lvds-b7151d96094a

-- 
Regards,

Laurent Pinchart
