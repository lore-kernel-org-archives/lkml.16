Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40625B668;
	Mon, 10 Feb 2025 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212456; cv=none; b=HDH7DhWRFmMYmxLmmmNREwFvvoTd6fUe1wXYpEZYHInm3WSsx9ShkRARQtlg1tPriGKyeS1KGHVSvtzJyWWDY4XbL4sBVubZZTJ+yGuivERVjEZ4aUZKVDsWFQFvtiS4vf9Kmq65KWx2yYtubOFi8wPcG7FhMVfO7Mo7/95gJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212456; c=relaxed/simple;
	bh=ktJrQgrd5tNbtyj+LrP9zGWCOfkEzbfTm6w/svlvBbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbzVM/aM0kfha2jYQPAn87CFNOz95Qh/LzBf/n0twwaS+rrlUsWJz+4lCvEoaJis5bK3QXPb1s6U7hjM702VggzdeGFpWL8OFuV1RvXM4b1Qh18a7wUlxFzCF4XUKDdM68A9vnRfhE2q5QbU2MVIX32eOcklikHjmpSqo398HEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5Wk+kBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5Wk+kBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6DC4CED1;
	Mon, 10 Feb 2025 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212456;
	bh=ktJrQgrd5tNbtyj+LrP9zGWCOfkEzbfTm6w/svlvBbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5Wk+kBV1aZJtbf3H7CfmLvS51rq9NiYwCuz4IDx8h1ik9VzGoglngQaCFpN6OLJA
	 skaqSgw/OGOXMym8t5hnoX1PkEt8RUDx8j/okhPpwGqisL2hEMFLsDmJB3TC+jwVJi
	 ef1TeaYrPbDnyDDRg8tKmv//f4XDEy5i7n91v+CbnePoWvNIr3tnJ44+GKOXpTU22i
	 G8/m1x3AXaDb8KwR9S8+xLkAQ3Cgw0iw2ZPSAA89UycoX5S/+DKF+e1XsBhJ0E1zGE
	 NjQzLVAOn5wRf9LVcv8lWSgejbM7F2BRm0zlvJkM59yAjBeokQLuHIakhVk4bDEeRa
	 3UwFxcrReNcTw==
Date: Mon, 10 Feb 2025 19:34:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fcofu4bb2ss3srog"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>


--fcofu4bb2ss3srog
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previo=
us
> bridge or the encoder) calls *_of_get_bridge() and the following element =
in
> the pipeline is a panel.
>=20
> This has some drawbacks:
>=20
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
>=20
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
>=20
> Correct removal of a panel_bridge might possibly be obtained by adding mo=
re
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandabl=
e.
>=20
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_brid=
ge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
>=20
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). =
In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---=
------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb153afd=
475746ced764712 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
>   */
>  void drm_panel_add(struct drm_panel *panel)
>  {
> +	panel->bridge =3D drm_panel_bridge_add(panel);
> +	WARN_ON(!panel->bridge);
> +
>  	mutex_lock(&panel_lock);
>  	list_add_tail(&panel->list, &panel_list);
>  	mutex_unlock(&panel_lock);
> @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
>  	mutex_lock(&panel_lock);
>  	list_del_init(&panel->list);
>  	mutex_unlock(&panel_lock);
> +
> +	drm_panel_bridge_remove(panel->bridge);
> +	panel->bridge =3D NULL;
>  }
>  EXPORT_SYMBOL(drm_panel_remove);

Given that drm_panel_add and drm_panel_remove are typically called at
probe/remove, it's pretty much equivalent to using devm. Both of these
solutions aren't safe, and the drm_panel lifetime is still broken.

I'd rather work on a solution that actually fixes those lifetime issues.

Maxime

--fcofu4bb2ss3srog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pGpQAKCRAnX84Zoj2+
dupmAX0QCqXAlwjOigazwjLqLppxgT//Mch4tKS4d4c1SuZ5OCPF+108O+yXaidt
tq6KGDwBf1aBzn4NygKkr+X8NMETD8f58JqWfuEBykbqP2ZhQvQgM/RII/JgW0QQ
gJXXs7dFkQ==
=CCam
-----END PGP SIGNATURE-----

--fcofu4bb2ss3srog--
