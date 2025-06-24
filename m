Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DF1EFFA6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762258; cv=none; b=o6rnL7qfKqSwL6MN9U2dEBAdA6ip0mXlvCKE9yEt4kcmfOITvmgm3b8wC7IC3fpio/VPCIAK+ji+VTEHP4Yp6sfGtUg8ENVcxdEk2s5eaW/jDnsu2CW7o0Rj9Cpg9h3TZJ1VKMgM+0XLz8nZA8JlWJdQoXVi/nnOiVOUZr4gNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762258; c=relaxed/simple;
	bh=2N3TiNuQlTikFaXWsBVx57jLh/sk9fexFgbIBFUSCeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X98EsgkaVifUnprZcH9DJrL542ddBS9lL9x2J85+RlMZTA0ZfCo6CyJprGsDMAdiAxxIiYoEGbKxD+vFOBhvmI3FFpv+aaZQGWr1H54WyXEcMkKR5sZc2pbpTdIOgUEHsgUn6Hv8yw67EsSwudpkbf2JtZyf6YnQGQ7+/OY1y3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tyi41gIY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tyi41gIY"
Received: from pendragon.ideasonboard.com (85-76-34-99-nat.elisa-mobile.fi [85.76.34.99])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8FDAA6A6;
	Tue, 24 Jun 2025 12:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750762237;
	bh=2N3TiNuQlTikFaXWsBVx57jLh/sk9fexFgbIBFUSCeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyi41gIY9WjRuf6j4o8RK9Zuh0IK8i4Z4bn4O06YxGL8QDQkayT0pc0YaLzf5U6w8
	 fbSl69/byTa28Y9wr1kRkffvEJLD9PCCidAvRHnWILM72w4ORlmhMBouBUPvQ13PLH
	 EfUuAKEIUWvRvVF7ddTINg9+leaUWoORt7wTIbgA=
Date: Tue, 24 Jun 2025 13:50:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma.B@microchip.com
Cc: Manikandan.M@microchip.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Message-ID: <20250624105034.GI15951@pendragon.ideasonboard.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
 <20250624104248.GH15951@pendragon.ideasonboard.com>
 <adee247c-933b-418c-959d-665b1df11874@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adee247c-933b-418c-959d-665b1df11874@microchip.com>

On Tue, Jun 24, 2025 at 10:46:26AM +0000, Dharma.B@microchip.com wrote:
> On 24/06/25 4:12 pm, Laurent Pinchart wrote:
> > On Tue, Jun 24, 2025 at 02:54:14PM +0530, Dharma Balasubiramani wrote:
> >> Drop the drm_panel field of the mchp_lvds struct as it is unused.
> >>
> >> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >> ---
> >>   drivers/gpu/drm/bridge/microchip-lvds.c | 7 -------
> >>   1 file changed, 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> >> index 9f4ff82bc6b4..42751124b868 100644
> >> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> >> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> >> @@ -23,7 +23,6 @@
> >>   #include <drm/drm_atomic_helper.h>
> >>   #include <drm/drm_bridge.h>
> >>   #include <drm/drm_of.h>
> >> -#include <drm/drm_panel.h>
> >>   #include <drm/drm_print.h>
> >>   #include <drm/drm_probe_helper.h>
> >>   #include <drm/drm_simple_kms_helper.h>
> >> @@ -56,7 +55,6 @@ struct mchp_lvds {
> >>        struct device *dev;
> >>        void __iomem *regs;
> >>        struct clk *pclk;
> >> -     struct drm_panel *panel;
> >>        struct drm_bridge bridge;
> >>        struct drm_bridge *panel_bridge;
> >>   };
> >> @@ -179,13 +177,8 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> >>                        "can't find port point, please init lvds panel port!\n");
> >>                return -ENODEV;
> >>        }
> > 
> > The above code seems unneeded now, I think you can drop it too.
> 
> Yes, I considered removing it as well. However, I was wondering if it 
> might still be valuable to return early when the endpoint isn't found, 
> to clearly indicate that the panel port is missing.

That error is covered by the devm_drm_of_get_bridge() call below, so I
think you can drop the code above.

> >> -
> >> -     lvds->panel = of_drm_find_panel(port);
> >>        of_node_put(port);
> >>
> >> -     if (IS_ERR(lvds->panel))
> >> -             return -EPROBE_DEFER;
> >> -
> >>        lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> >>
> >>        if (IS_ERR(lvds->panel_bridge))

-- 
Regards,

Laurent Pinchart
