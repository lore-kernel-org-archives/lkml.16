Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C252218ABA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761792; cv=none; b=ffMvDmUbVMm8I6coWjvOV+3I/8G+Xg78aZCNxObZDs896jwar0Cb1clRun/nAyKU6an0qq+Q+WG1lVPxnEXic3qi683RBlB6ZtMoHHMLHDcxllHPkQUF3aC1kZfmcqmpzkxP2FSwT/ufFx1xWEtlLGDZoZKITfNNxoupK9ek2rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761792; c=relaxed/simple;
	bh=yz+JsuAiHyWr/UyOi0g9uuvNp3Sy8j7oMp0yuTEJQxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns9V3gak30qQ+9XdpZtZJkYLUgAoXzmbepMYqIMCbcsbKYQXhKTxEBQzfjhmprmGmo9me+Tfr7M74c+ejt6ExVK9w46bm3H8vT41whIAxvOUfy6rh2sHAXmLRNUfPdUjyH9aBKnVvZgRocNbIBp1haQhNy/RKZpyTlNTxXJGAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ePAFulvM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ePAFulvM"
Received: from pendragon.ideasonboard.com (85-76-34-99-nat.elisa-mobile.fi [85.76.34.99])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EFE946A6;
	Tue, 24 Jun 2025 12:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750761772;
	bh=yz+JsuAiHyWr/UyOi0g9uuvNp3Sy8j7oMp0yuTEJQxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePAFulvMmvswetLospzsePX/uVj/vzBwEAPvsFBHa+eS7EPE1Eqo+IsrtMPNjtDvY
	 MzRclrzKONfQwkxDK3jJX4MFYzz/+ou1QkhWiXHiMGKMK8vzahz0zaLENbvlvknLjO
	 PG7PEwMTPE2wDnJPzQoKnzje1YwxXMXVInU34sFU=
Date: Tue, 24 Jun 2025 13:42:48 +0300
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Message-ID: <20250624104248.GH15951@pendragon.ideasonboard.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>

On Tue, Jun 24, 2025 at 02:54:14PM +0530, Dharma Balasubiramani wrote:
> Drop the drm_panel field of the mchp_lvds struct as it is unused.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/gpu/drm/bridge/microchip-lvds.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> index 9f4ff82bc6b4..42751124b868 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -23,7 +23,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -56,7 +55,6 @@ struct mchp_lvds {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct clk *pclk;
> -	struct drm_panel *panel;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  };
> @@ -179,13 +177,8 @@ static int mchp_lvds_probe(struct platform_device *pdev)
>  			"can't find port point, please init lvds panel port!\n");
>  		return -ENODEV;
>  	}

The above code seems unneeded now, I think you can drop it too.

> -
> -	lvds->panel = of_drm_find_panel(port);
>  	of_node_put(port);
>  
> -	if (IS_ERR(lvds->panel))
> -		return -EPROBE_DEFER;
> -
>  	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>  
>  	if (IS_ERR(lvds->panel_bridge))

-- 
Regards,

Laurent Pinchart
