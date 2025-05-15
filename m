Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70291B6D11
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290110; cv=none; b=mjm8F9K9ZBEKVMzP1zA7toDr9w58LwcXqbhCDr7VHky3YThSyfpaqWs+pMInb2mCBuRW4BIYM0eYfKeGA8ARk32UEho6Rq39ToflPCzWSiUT2w0DwRYdJZO8Kg98SYx4ar2yue4Iw5JdjUhOwNA5WqPylNhcMI+sBYLEybOKZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290110; c=relaxed/simple;
	bh=gbtrw/D7gxH/6QMa/SyTc7C9lDva0Xx0PZks+pxDASA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EW8QkxNsWyh/qhc8Y88RCv+iSOyCcjrUqd0nRDRqUFrEPCrta3Lg8wf6jpQ8ySRTAdzy+1+z6s/U6R48eoAsLoJb0gWHPhgtiLJsBI6SBZkowink0pKbIaOy7DO1Ip8xDbjfCFZ/lDVf0iCi2T2lNzNlfinvsxhY7rPQlzIlFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IDRM9pki; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ik/D1XMy reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IDRM9pki";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ik/D1XMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747290107; x=1778826107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zvaqjaq2s2J7Vp+BItaHSMNz11n0rCofPVOKUb72ZdQ=;
  b=IDRM9pkiteZ/U1fsjkefOsuaXgl+I2zTQWp+nFrpqlTqXSOkjn/VWKTD
   LUuI0VDG6owKxYEx2eUszh7q1gc+dul9TWNWKTCfNMvrDkYoIDyjSyFeY
   ZHQV1fEZoflQbsHJe+HB1rqJnqiwu6cqHmyK/oSEIMdw3bPsS/o7YNpEg
   AJOBAaqsHdJRq12qhOlUKEa6UDfe5MQculs3XQtwV6EEXkIIvMxWBBD8d
   AnHkQZZnIIv+5QeMkbZwWJYmPhShQXkN67zal7aDa2uXnY0fiG258xmbZ
   wlZWiQ1ZM/dvaYh8MXVISM54oTluu5RIe7hanoVMSAmPCevT8UUcOQRFb
   Q==;
X-CSE-ConnectionGUID: ymgbScsyTImTixjB3tpFMw==
X-CSE-MsgGUID: c47bUS/AQDirSUcuKPPxhg==
X-IronPort-AV: E=Sophos;i="6.15,290,1739833200"; 
   d="scan'208";a="44086124"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 May 2025 08:21:38 +0200
X-CheckPoint: {682587F2-21-C7E25413-F4312D34}
X-MAIL-CPID: 33C6A6DA3D81B7962B7B6E2E349BD329_4
X-Control-Analysis: str=0001.0A006374.682587F0.0032,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B92916983A;
	Thu, 15 May 2025 08:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747290094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvaqjaq2s2J7Vp+BItaHSMNz11n0rCofPVOKUb72ZdQ=;
	b=Ik/D1XMym9knRRj0CGwmE5kAGwr9f+K/FAQtrwwTlFfj5YDxt51d4kO2NqdcNocl5sYxXO
	0YEsl1sOQx1GIzEgAdtZyX38QCiHA68YHmiQXMsMmV0OIbI5FyfesGC8+ZIKgpTkXefaOz
	NTtIqXVD2Joop/2O8LPHU7OCK80qsUfYjq9iM1l3koCOPGQuin1OPDp88xbW0YplXlqcoA
	50GDv7lAxylXeIXvcbj9EdxXiM5tok+PeX9QxgBVA+kTiajt5hdl54qkgb7iElw8OcS+qN
	s7JUn/stDl1ObKxH1wRBCIqM2MuKBieCif2Z/XUyT37pO3iWclKWjOe+iH2R3A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/bridge: fsl-ldb: make use of dev_err_probe
Date: Thu, 15 May 2025 08:21:30 +0200
Message-ID: <6179238.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250514222453.440915-3-m.felsch@pengutronix.de>
References:
 <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-3-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 15. Mai 2025, 00:24:52 CEST schrieb Marco Felsch:
> Make use of dev_err_probe() to easily spot issues via the debugfs or
> kernel log. No functional changes.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index fa29f2bf4031..e0a229c91953 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -308,11 +308,13 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
> =20
>  	fsl_ldb->clk =3D devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
> -		return PTR_ERR(fsl_ldb->clk);
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->clk),
> +				     "Failed to get ldb clk\n");
> =20
>  	fsl_ldb->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
>  	if (IS_ERR(fsl_ldb->regmap))
> -		return PTR_ERR(fsl_ldb->regmap);
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->regmap),
> +				     "Failed to get regmap\n");
> =20
>  	/* Locate the remote ports and the panel node */
>  	remote1 =3D of_graph_get_remote_node(dev->of_node, 1, 0);
> @@ -335,12 +337,12 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
>  	panel =3D of_drm_find_panel(panel_node);
>  	of_node_put(panel_node);
>  	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> +		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
> =20
>  	fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>  	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> -
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> +				     "drm panel-bridge add failed\n");
> =20
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
> @@ -356,10 +358,9 @@ static int fsl_ldb_probe(struct platform_device *pde=
v)
>  					     "Error getting dual link configuration\n");
> =20
>  		/* Only DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS is supported */
> -		if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> -			dev_err(dev, "LVDS channel pixel swap not supported.\n");
> -			return -EINVAL;
> -		}
> +		if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "LVDS channel pixel swap not supported.\n");
>  	}
> =20
>  	platform_set_drvdata(pdev, fsl_ldb);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


