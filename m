Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B81E98FE
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745172688; cv=none; b=Jl/SI7/d1fErRFe1eWUAY3Yebgir//S/f5nVDBuM5LYFtG/37J16Z0YEmw7Y50IeUVFltUZpYh2vmUsZMsodstkAwa3s9JcNF7TBL8TNMPgoMbqJHSQqB8hznnv9swAgpl1Z6tg+d2/w+uYoFLyghCbKS+aJh3XS4EsGSHDVhak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745172688; c=relaxed/simple;
	bh=btnNxKa3NO7m05myfpFZWeCxBXHZUXP98TjHN62yTKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhCOhrlpuxnGy8qDrq8WNOgxkmBKNtSi3O3VpAMjm/hrwHqauiat9fDsuvur4CyyqdGq8HVYk7XJiUOtzH5F9kaJlSM2BHPqw60QRIcQESD+AWpO7Dd9iZjmfkI2Ek3Cf/jVLcQEPYhq7/YOdzvVA59tawd3kjhnO8DSze3JVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aznFVrSR; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aznFVrSR"
Message-ID: <0072bb93-5456-40c4-96bc-a7afb3523238@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745172683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9aamBQ0ZU3bGoMpZmyKNMQL3sm5Iv1i0Ot2VzAuk9Q=;
	b=aznFVrSR5pijCE0f9jOwqOZVQA5RUEE0ZKIjHKF4C/QGssZhK8K0TDOH6e8hGj00yM7QpE
	iVTNelR+Q7sdYc4hpc4wcE24q3OXH2zw9UZq3wALJrBn/W8wYKJ3CgAAGeMxPdl5aHEOA6
	m/L2aoRw1pqruk3OtAKnmLovQgWFkAQ=
Date: Sun, 20 Apr 2025 23:40:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 14/17] drm/bridge: cdns-dsi: Use video mode and clean
 up cdns_dsi_mode2cfg()
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
 <20250414-cdns-dsi-impro-v3-14-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250414-cdns-dsi-impro-v3-14-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 14/04/25 16:41, Tomi Valkeinen wrote:
> The driver does all the calculations and programming with video timings
> (hftp, hbp, etc.) instead of the modeline values (hsync_start, ...).
> Thus it makes sense to use struct videomode instead of struct
> drm_display_mode internally.
> 
> Switch to videomode and do some cleanups in cdns_dsi_mode2cfg() along
> the way.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 45 ++++++++++++++------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index fb0623d3f854..a55f851711f0 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_probe_helper.h>
>  #include <video/mipi_display.h>
> +#include <video/videomode.h>
>  
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> @@ -467,36 +468,35 @@ static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
>  }
>  
>  static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
> -			     const struct drm_display_mode *mode,
> +			     const struct videomode *vm,
>  			     struct cdns_dsi_cfg *dsi_cfg)
>  {
>  	struct cdns_dsi_output *output = &dsi->output;
> -	unsigned int tmp;
> -	bool sync_pulse = false;
> +	u32 dpi_hsa, dpi_hbp, dpi_hfp, dpi_hact;
> +	bool sync_pulse;
>  	int bpp;
>  
> +	dpi_hsa = vm->hsync_len;
> +	dpi_hbp = vm->hback_porch;
> +	dpi_hfp = vm->hfront_porch;
> +	dpi_hact = vm->hactive;
> +
>  	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
>  
> -	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -		sync_pulse = true;
> +	sync_pulse = output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>  
>  	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
>  
> -	tmp = mode->htotal -
> -		(sync_pulse ? mode->hsync_end : mode->hsync_start);
> +	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
> +					 bpp, DSI_HBP_FRAME_OVERHEAD);
>  
> -	dsi_cfg->hbp = dpi_to_dsi_timing(tmp, bpp, DSI_HBP_FRAME_OVERHEAD);
> +	if (sync_pulse)
> +		dsi_cfg->hsa =
> +			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
>  
> -	if (sync_pulse) {
> -		tmp = mode->hsync_end - mode->hsync_start;
> +	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
>  
> -		dsi_cfg->hsa = dpi_to_dsi_timing(tmp, bpp,
> -						 DSI_HSA_FRAME_OVERHEAD);
> -	}
> -
> -	dsi_cfg->hact = dpi_to_dsi_timing(mode->hdisplay, bpp, 0);
> -	dsi_cfg->hfp = dpi_to_dsi_timing(mode->hsync_start - mode->hdisplay,
> -					 bpp, DSI_HFP_FRAME_OVERHEAD);
> +	dsi_cfg->hfp = dpi_to_dsi_timing(dpi_hfp, bpp, DSI_HFP_FRAME_OVERHEAD);
>  
>  	dsi_cfg->htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
>  	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)

I think at this stage, the dsi_cfg->htotal will always come out to be

((dpi_htotal * bitspp) / 8),

no matter whether the sync_pulse or the event_mode is set or not.

Whatever the overheads are there, they get cancelled out. So, it doesn't
need to be individually tracked.


> @@ -509,7 +509,7 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
>  }
>  
>  static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
> -			       const struct drm_display_mode *mode,
> +			       const struct videomode *vm,
>  			       struct cdns_dsi_cfg *dsi_cfg)
>  {
>  	struct cdns_dsi_output *output = &dsi->output;
> @@ -517,11 +517,11 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
>  	unsigned int nlanes = output->dev->lanes;
>  	int ret;
>  
> -	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg);
> +	ret = cdns_dsi_mode2cfg(dsi, vm, dsi_cfg);
>  	if (ret)
>  		return ret;
>  
> -	ret = phy_mipi_dphy_get_default_config(mode->clock * 1000,
> +	ret = phy_mipi_dphy_get_default_config(vm->pixelclock,
>  					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
>  					       nlanes, phy_cfg);
>  	if (ret)
> @@ -909,12 +909,15 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>  	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
>  	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>  	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
> +	struct videomode vm;
>  
>  	/* cdns-dsi requires negative syncs */
>  	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>  	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
>  
> -	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg);
> +	drm_display_mode_to_videomode(adjusted_mode, &vm);
> +
> +	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);
>  }
>  
>  static struct drm_bridge_state *
> 

With the above taken care of,

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


-- 
Regards
Aradhya

