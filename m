Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE213D89D;
	Thu, 30 Jan 2025 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269243; cv=none; b=mf6spGo6CC2ULhXveSXJnSFi2VZc0R86oESFjP4DnHjbJrAkTuf4xCamMwuBR8Yfd1WTAhPrg+/p8gzCSv7A1/6gT3B/INSInXhcXqZUVqEP34P12YEAkMYK6rAP8CR58/ix+rYo9+xGv+f3Nmgw9h24OyD17f1+hc9QHBmRHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269243; c=relaxed/simple;
	bh=Ut9zIlhirxl3yLYUOuo34o+FEI0eWkaDFYu4wC1gpS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsvIkmkuq2fBaRSrj0FefJue+R3NjzNZngPhUZ0qHPRraQhPOQl5ak5Pq6iOv7e5YoQBpsQWoYkbmbHNhpCKlOUGlEAYkc0YvOAnK4kQXY4LFbweBEl33o2OEpkhrni7KfF1cR9p4W9Qz5LyL34lxTXtdouKTWGh6W8nnEuuqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wsGxR3Wo; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wsGxR3Wo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GDjyYngW/V8rZ/9s/V2isOq01Zq2IRay1Y1ld6/4IKA=; b=wsGxR3WotEAaoIbMjuMGP44tEV
	h30tAbAt8BGPE+tBCGMkjfFLPpQbldEY68cX2M2Asp9fLBgbgU5FRpJQ0IDxBoGSMsTjqdq6oy5vU
	gfldPf0af8xcnoO7be0Feo+EMaKxOprioif7Jr0WAbtsfZYFw25CqABkFVU4vwvL8uzz+yCl9OqOr
	zMbEXrtT3trtJRQgoV/bJHlh2NZsZxyU5mb1VGJpi9MFs2e8tVeFGgzoXKAH47doMdvX1iSPRNVNy
	QlzQu7E2NRD0ycPV8L/1GWI1wJ1DJYJy//Bh+u1sT9IfuucEfyUo1O6J6MuHEmd0yFmmUFLAjEGHE
	YAJWXOOQ==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdbEM-0001gn-Po; Thu, 30 Jan 2025 21:33:42 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get panel from
 the DP AUX bus
Date: Thu, 30 Jan 2025 21:33:41 +0100
Message-ID: <3340006.44csPzL39Z@diego>
In-Reply-To: <20250123100747.1841357-9-damon.ding@rock-chips.com>
References:
 <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Donnerstag, 23. Januar 2025, 11:07:41 MEZ schrieb Damon Ding:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---

> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (IS_ERR(dp->adp))
>  		return PTR_ERR(dp->adp);
>  
> -	ret = component_add(dev, &rockchip_dp_component_ops);
> -	if (ret)
> -		return ret;
> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);

This causes an undefined-reference error, so you probably need something like:

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index f9cbbb40b36f..fa946a809858 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -8,6 +8,7 @@ config DRM_ROCKCHIP
        select DRM_PANEL
        select VIDEOMODE_HELPERS
        select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+       select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
        select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
        select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
        select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI



