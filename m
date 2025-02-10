Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573A25B690;
	Mon, 10 Feb 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211738; cv=none; b=mplOTD0TEMmLSyByWD1CSSMRlLw3d0lQf/rs4v6XGqdrXsYpYO10rwB8O+TN5vsQ/3IljGmIGah3XyU2UzL4PnyH0JpoPjd2WfhMtPtC15Q4pTHVjdbHr9FAn52vloEl+xC2mvOhRhKv+GWdrh2/kn0Q/VQdn0a4mcW+IeBFlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211738; c=relaxed/simple;
	bh=kW4WlH1HkjqvMNtVdOaqv6Bu3HBYq9GrG/aLmkyGeCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awm7aFyNQK3QF38alVH5+sMnUx1iy7oRapOR1ApaaF82UaWENRvw6spoLKr6GeHFzNPE7n8AN5Y2LME01bgjwpAJQzP3mfqPMbYtcwelg9KH1peCoGxjXoZ3cLV9rWmb3aTCBO27z5fJPQFrp554b6r+HcqR2Vv8X4LBEskDgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be1eT55i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be1eT55i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A8BC4CED1;
	Mon, 10 Feb 2025 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211738;
	bh=kW4WlH1HkjqvMNtVdOaqv6Bu3HBYq9GrG/aLmkyGeCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=be1eT55i+UR6ruMjbhjaLYShzWBV7ozYReKlgdefdv/FGyh77+ltMi3kDsqbo/sVF
	 eHRVRXaqBUzsfLgIzgOEeKSp6hKXCEOrVSin5J1mkd58bPYgwxnnU+qKyP4sPeMqIf
	 tVBEhX6NQHBU8JD/H0/rIZJaX2T6mhwDPsz43JOINFl1GVXwNWJGH9zcJFAQZRC20C
	 qnVOrHalrHMtHpuxYxkC6VZ9o7zMhOGGeYftsHslUmYk5whiorSveKLY1PZC/FOPA+
	 h0OGLPdtge3ogo82C6Ksqvc6KrUWpWrKHm7mdekN5jTU8J5DPSdCCb5CZwBVoAkPaY
	 aVJ7wRqrkyRgg==
Date: Mon, 10 Feb 2025 19:22:15 +0100
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
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <20250210-vague-fluorescent-toad-c7d1ce@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="a3gp6fts62sykw5k"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>


--a3gp6fts62sykw5k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommend=
ed
> function to get a pointer to the following bridge.
>=20
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
>=20
> However there are drivers supporting the panel subnode description in
> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  8 ++++++++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 2aa17fbe538b86066c4e68f0d0e8046e9ca9b965..b0834b8644284e5f7751cec81=
724af849b4180e7 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1407,6 +1407,36 @@ struct drm_bridge *devm_drm_of_get_bridge(struct d=
evice *dev,
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> =20
> +/**
> + * devm_drm_of_get_bridge_by_node - Return bridge for a given OF node
> + * @dev: device to tie the bridge lifetime to
> + * @bridge_node: device node of the remote bridge
> + *
> + * Given a bridge DT node, returns the associated bridge if any. This
> + * should be used in addition to devm_drm_of_get_bridge() when the regul=
ar
> + * graph link search is not enough, e.g. for drivers that need to support
> + * panels described only as subnodes.
> + *
> + * RETURNS:
> + * A pointer to the bridge if successful, or an error pointer otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
> +						  struct device_node *bridge_node)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	if (!bridge_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	bridge =3D of_drm_find_bridge(bridge_node);
> +	if (!bridge)
> +		return ERR_PTR(-ENODEV);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
> +

A bridge is a KMS-facing structure, there's no reason to tie it to the
lifetime of the device.

Maxime

--a3gp6fts62sykw5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pD1wAKCRAnX84Zoj2+
duqYAYCyFN95MaOSOiHSy48n6f+H3RwjknEahucK0hxM//iGFFhtWemOcArKOv5O
ruChdWsBgMttvepbPSgqHfhHAKiGVSo2oYhJYPPZWeYyVlDWHVRi49u6PZWnEoWZ
iHl0s6SF1A==
=82V5
-----END PGP SIGNATURE-----

--a3gp6fts62sykw5k--
