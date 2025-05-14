Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F709DDC1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262726; cv=none; b=t6BciGRLz9/CGNnC7UE/s93oOhLnQpApSv5alyopPsH3U3oepQ6oLpaXjQElGitKJxQ9wQI1Tihkjvf3WptXIMAA2HoWB7muBZGUwFtFevLsPrOa1ba6BLs6gS/SQkLln8iRdolvdkA3oN8Wz4WJDA9vFdGLQjz0RJgoelBzSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262726; c=relaxed/simple;
	bh=mqJP2sZT8Eo6k92CZV4PoOt3At0pB7bBNfTKSsvm9II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIkBTHr2VQHhevG+nEmAvtwsmESlsJRys+XJK8ncCeRDWyi/CX+YjehtKDRYObrNoKUdZl6ZMpUxhEZw9X4jT3ElWLefDAbpI9iQfM3Wzqj3EbbRvbUBCY633UQW4MFDQ8cI+GLAPaGAWWUTsPovYExx7HuGcAiTfroi7Sfh25M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b+9XFCzN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b+9XFCzN"
Received: from pendragon.ideasonboard.com (cust-east-par-46-193-72-226.cust.wifirst.net [46.193.72.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45DAD725;
	Thu, 15 May 2025 00:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747262706;
	bh=mqJP2sZT8Eo6k92CZV4PoOt3At0pB7bBNfTKSsvm9II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+9XFCzNmHGLlmuuL5bVjHpnCb8lRRK8Tct4qrdz+Rax/F1cNREijoh2j59yqAzTK
	 qCip3W/dSJeGZ6RMPo5ubyAXtO30xC0gDHnI3j9EUrbGmKzgGt2Ry01ukmBGjYuqpQ
	 pVY3xSI6uCQkEdxaky+AUqEUYeZgFuejOjHHZWck=
Date: Thu, 15 May 2025 00:45:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: make use of driver_private
Message-ID: <20250514224515.GM23592@pendragon.ideasonboard.com>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-2-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514222453.440915-2-m.felsch@pengutronix.de>

Hi Marco,

Thank you for the patch.

On Thu, May 15, 2025 at 12:24:51AM +0200, Marco Felsch wrote:
> Make use of the drm_bridge::driver_private data instead of
> container_of() wrapper.

I suppose this is a personal preference, but I like usage of
container_of() better. In my opinion it conveys better that struct
fsl_ldb "unherits" from struct drm_bridge.

> No functional changes.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 0fc8a14fd800..fa29f2bf4031 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -99,11 +99,6 @@ static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
>  	return (fsl_ldb->ch0_enabled && fsl_ldb->ch1_enabled);
>  }
>  
> -static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
> -{
> -	return container_of(bridge, struct fsl_ldb, bridge);
> -}
> -
>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
>  {
>  	if (fsl_ldb_is_dual(fsl_ldb))
> @@ -115,7 +110,7 @@ static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>  			  enum drm_bridge_attach_flags flags)
>  {
> -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
>  
>  	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
>  				 bridge, flags);
> @@ -124,7 +119,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *old_bridge_state)
>  {
> -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
>  	struct drm_atomic_state *state = old_bridge_state->base.state;
>  	const struct drm_bridge_state *bridge_state;
>  	const struct drm_crtc_state *crtc_state;
> @@ -226,7 +221,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  				   struct drm_bridge_state *old_bridge_state)
>  {
> -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
>  
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
> @@ -270,7 +265,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  		   const struct drm_display_info *info,
>  		   const struct drm_display_mode *mode)
>  {
> -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
>  
>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
>  		return MODE_CLOCK_HIGH;
> @@ -309,6 +304,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.funcs = &funcs;
>  	fsl_ldb->bridge.of_node = dev->of_node;
> +	fsl_ldb->bridge.driver_private = fsl_ldb;
>  
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))

-- 
Regards,

Laurent Pinchart
