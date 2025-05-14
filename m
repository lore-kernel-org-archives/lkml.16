Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B461E5B71
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262663; cv=none; b=BFK88BUeyJnsZBrwBkIQRxYRmvsWRm+w2x4mlC6OLuuSJmd7beW9SDQ4fnijRnDFCBfxqrFoKauOzpZouKGAccaOONWOXnUhASbnRbKfk0tCIwgDEKbIKJivl35SaWgibHDSB73jxrGLFdqgq3Gk1dUX291Qrz9t2huNrLv5HrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262663; c=relaxed/simple;
	bh=a9g5/nTsv58/kN/3kVuw5tJnxuUMmHXHoyRiQwDN6KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK028Z96CUJW5uRXod10kv6BuU+eCmU8AUOqn93IMKh+t3rVLbS71KugQ/LJ2vbnfhmmjwt58d4y66qs5wHeZ8klQt17SBaSL4HosEY+9HhmlwaGilhg2OpnxUO+Lrcwuj2FEOrCCWP1O+gFKu9OdEebp6gsDAK/G30/haSwfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NOPCxL0z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NOPCxL0z"
Received: from pendragon.ideasonboard.com (cust-east-par-46-193-72-226.cust.wifirst.net [46.193.72.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6030082A;
	Thu, 15 May 2025 00:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747262641;
	bh=a9g5/nTsv58/kN/3kVuw5tJnxuUMmHXHoyRiQwDN6KA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOPCxL0zZeEpZY+zGdWCZqYl2+Wtn65QqMDz3lWi06Alj2mZ+ip3dTKMu33YxtXhU
	 /Ho+PLZx9vDJB8ay/R75U0/ZlAh8Ei7gXTjXJiCUFVawTJk+TCw3wnkSxuCJZm+JO3
	 FFLvZjbSNtHwEHqW0y5WMSwINo7NFtTWK6vuaQmM=
Date: Thu, 15 May 2025 00:44:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/3] drm/bridge: fsl-ldb: simplify device_node error
 handling
Message-ID: <20250514224410.GL23592@pendragon.ideasonboard.com>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-4-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514222453.440915-4-m.felsch@pengutronix.de>

Hi Marco,

On Thu, May 15, 2025 at 12:24:53AM +0200, Marco Felsch wrote:
> Make use of __free(device_node) to simplify the of_node_put() error
> handling paths. No functional changes.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index e0a229c91953..cea9ddaa5e01 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -287,8 +287,9 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;
> -	struct device_node *remote1, *remote2;
> +	struct device_node *panel_node __free(device_node) = NULL;
> +	struct device_node *remote1 __free(device_node) = NULL;
> +	struct device_node *remote2 __free(device_node) = NULL;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
> @@ -321,21 +322,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
> -	of_node_put(remote1);
> -	of_node_put(remote2);
> +	panel_node = remote1 ? remote1 : remote2;

This will cause a double put of panel_node, once due to __free() on
remote1 or remote2, and the second time due to __free() on panel_node.

>  
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
>  		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
>  
>  	dev_dbg(dev, "Using %s\n",
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>  
>  	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
>  	if (IS_ERR(panel))
>  		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
>  
> @@ -345,14 +341,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  				     "drm panel-bridge add failed\n");
>  
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
> -		struct device_node *port1, *port2;
> +		struct device_node *port1 __free(device_node) =
> +			of_graph_get_port_by_id(dev->of_node, 1);
> +		struct device_node *port2 __free(device_node) =
> +			of_graph_get_port_by_id(dev->of_node, 2);
>  
> -		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> -		port2 = of_graph_get_port_by_id(dev->of_node, 2);
>  		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> -		of_node_put(port1);
> -		of_node_put(port2);
> -
>  		if (dual_link < 0)
>  			return dev_err_probe(dev, dual_link,
>  					     "Error getting dual link configuration\n");

-- 
Regards,

Laurent Pinchart
