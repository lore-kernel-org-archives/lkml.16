Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3CB15278E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834647; cv=none; b=nuXFhdv/+wiiJ8scFv3zPDmla6zm7xZwXsg0nWZp0x1ZF0ujJRjC+GkorW08MGOntKMVCb7jtuoehfhrT9ufbEWm5+U8oS+HqswaWeLO395fg6NrTUfm9T7Su2UxwQGOx+rIS6QgEI40CjDpjQM1a9pDbPkAUxXfwlLfq91uZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834647; c=relaxed/simple;
	bh=VbDwXsKrhM8CHsbHpV38JK2VbTNZhGvF2JCOWkAiZ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eARbooHU1rlshjYuSqp++9NNMa9I4RfJpBeBfYPNYNegyWR0L4I1+tujVt1awiLpRot+9egxDI/LtpL01nQnEmx0a7KJXkeCh9HMi2QvzECvI7FAQFR8ZsAfFqt+nLF7lDnM2yfbFYBB6dVVHsYrHasKrxbm7oQdsY2bxAzRHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+69cIVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+69cIVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EE6C4CEF1;
	Wed, 25 Jun 2025 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834646;
	bh=VbDwXsKrhM8CHsbHpV38JK2VbTNZhGvF2JCOWkAiZ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+69cIVkBWEaspGFnnCUJWn4Q2gZQMJWOnRrLgtfZJ7B7TkA78C/I2UDeJhUnXWJr
	 k1Deg/jPGYKFxnV3i7mgF4XosKTM/BjRcWJxXEzRTsQVkXMCBDrI7XniMCp00IKWVs
	 NQZVNJjWK5am1RpauxlrRpiWBdane3OaCeH+4CCGo2y0s5jk9PnOOZKACWueXtHIvY
	 ewH1fvQJNwB9SOxV9S9kc48ZfevAUbAVK/DV7O1rjzN1TIQLffcNnDV/XqueEq2E6x
	 McsPljU5io0vhm9JRiEdI7Ah0adW7S9j4xCuyWU3in3VNfQYKQu89qgj/WbvcaGe3R
	 /Xa/PSe1GG3+g==
Date: Wed, 25 Jun 2025 08:57:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic
 pre_enable() and post_disable()
Message-ID: <20250625-mongrel-of-holistic-fascination-4f1a44@houat>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
 <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vb3krjv7gv7cfhgo"
Content-Disposition: inline
In-Reply-To: <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>


--vb3krjv7gv7cfhgo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic
 pre_enable() and post_disable()
MIME-Version: 1.0

On Wed, Jun 25, 2025 at 10:26:11AM +0530, Dharma Balasubiramani wrote:
> pm_runtime_get_sync() and clk_prepare_enable() must be outside the atomic
> context, hence move the sleepable operations accordingly.
>=20
> - atomic_pre_enable() handles pm_runtime and clock preparation
> - atomic_enable() enables the serializer based on panel format
> - atomic_disable() turns off the serializer
> - atomic_post_disable() disables clock and releases runtime PM
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

If that's the reason you wanted to split the enable and disable hooks in
two, you don't need to. You can sleep in any context here.

Maxime

--vb3krjv7gv7cfhgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFud1AAKCRAnX84Zoj2+
diamAX9Q2VxvGLr4UTpE/YYMeO43sN+fUFjGx2oEGs2EYLpe/t3hfdfhBIxeyHdD
R6jM0JQBfjCCXgDU6myUftntCZOhDlTIHbL1lK9JKqZYzIuugWSbEtC/bPKzVP5y
pEV+FRRDqA==
=8zuh
-----END PGP SIGNATURE-----

--vb3krjv7gv7cfhgo--
