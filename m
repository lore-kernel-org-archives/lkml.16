Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6D20E6E7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264060; cv=none; b=YzThQ5XQ2icfbxl3tV67aa3PCU9eYaUQU+KmioXorVAhqDAgJmkW1tV6f0O6VJ296lfwZrFIOiiFZipjgD66SWC+uliFGUOMtII/R8R4nFh0C68ZXXojuMmY1Tyffcn++ZJM+aOGHkYmGLtpc3Ipb8ovPw2Kd3u7Hd0YP+6lNMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264060; c=relaxed/simple;
	bh=wUcH2iTBfljSCxkviRVSrLkqLoksGITmeGA7aQVR91E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATy7hDdQ3FbCCJ56VB7TZgN81FoOn9HIVSPSsfdkiXomnyrhp3Ew0di7o0Bzk/DAUfTDlsk5ahzWrJ6HXmD8cOZ1OZ79rGMtspRZjBELhPOFD7vv+a0yFqCUICO52yw/qMcG44ZizwCFLKTz6ILI8coMu3fX8dhUlrMXYNYCsEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uFLCA-0003Tq-OO; Thu, 15 May 2025 01:07:26 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uFLC9-002maB-16;
	Thu, 15 May 2025 01:07:25 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uFLC9-004f9s-28;
	Thu, 15 May 2025 01:07:25 +0200
Date: Thu, 15 May 2025 01:07:25 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/3] drm/bridge: fsl-ldb: simplify device_node error
 handling
Message-ID: <20250514230725.fmqnrxrr3odwzn4a@pengutronix.de>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-4-m.felsch@pengutronix.de>
 <20250514224410.GL23592@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514224410.GL23592@pendragon.ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Laurent,

On 25-05-15, Laurent Pinchart wrote:
> Hi Marco,
> 
> On Thu, May 15, 2025 at 12:24:53AM +0200, Marco Felsch wrote:
> > Make use of __free(device_node) to simplify the of_node_put() error
> > handling paths. No functional changes.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 24 +++++++++---------------
> >  1 file changed, 9 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index e0a229c91953..cea9ddaa5e01 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -287,8 +287,9 @@ static const struct drm_bridge_funcs funcs = {
> >  static int fsl_ldb_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > -	struct device_node *panel_node;
> > -	struct device_node *remote1, *remote2;
> > +	struct device_node *panel_node __free(device_node) = NULL;
> > +	struct device_node *remote1 __free(device_node) = NULL;
> > +	struct device_node *remote2 __free(device_node) = NULL;
> >  	struct drm_panel *panel;
> >  	struct fsl_ldb *fsl_ldb;
> >  	int dual_link;
> > @@ -321,21 +322,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
> >  	fsl_ldb->ch0_enabled = (remote1 != NULL);
> >  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> > -	panel_node = of_node_get(remote1 ? remote1 : remote2);
> > -	of_node_put(remote1);
> > -	of_node_put(remote2);
> > +	panel_node = remote1 ? remote1 : remote2;
> 
> This will cause a double put of panel_node, once due to __free() on
> remote1 or remote2, and the second time due to __free() on panel_node.

Argh.. you're right. I drop the __free() from the panel_node.

Thanks,
  Marco

> 
> >  
> > -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> > -		of_node_put(panel_node);
> > +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> >  		return dev_err_probe(dev, -ENXIO, "No panel node found");
> > -	}
> >  
> >  	dev_dbg(dev, "Using %s\n",
> >  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
> >  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> >  
> >  	panel = of_drm_find_panel(panel_node);
> > -	of_node_put(panel_node);
> >  	if (IS_ERR(panel))
> >  		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
> >  
> > @@ -345,14 +341,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  				     "drm panel-bridge add failed\n");
> >  
> >  	if (fsl_ldb_is_dual(fsl_ldb)) {
> > -		struct device_node *port1, *port2;
> > +		struct device_node *port1 __free(device_node) =
> > +			of_graph_get_port_by_id(dev->of_node, 1);
> > +		struct device_node *port2 __free(device_node) =
> > +			of_graph_get_port_by_id(dev->of_node, 2);
> >  
> > -		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> > -		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> >  		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> > -		of_node_put(port1);
> > -		of_node_put(port2);
> > -
> >  		if (dual_link < 0)
> >  			return dev_err_probe(dev, dual_link,
> >  					     "Error getting dual link configuration\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
