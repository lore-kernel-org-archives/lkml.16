Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCD22066
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284441; cv=none; b=I6qPzCDGgmN/rlWN+dAYPWfaV7yG6VQo/76+gxXgukEOvfUBpPkmFLWSLzSraUQdNdGHcZjKFg2bjORXQ+H3f39m+VOJxcVqO/HGBuCQu9nDps7HglDhNub/vzm9ZOMdVYYteKEkKIp89e2FYMFIEdmku7nSkhV3COzOwQXyKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284441; c=relaxed/simple;
	bh=+Xvc4q5W1nscYEGrfBD6bl7hrDJvjlsORL+X+YUEzB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7NQYPiWN2kWLqBUpb/orahn/3DABM32ZqSbYDGCEAIRocXiNuUEBRIScpP2qIVwV+VNLmWuPh5TuKcdSV9hnerRViVpO21tuZLXRxCkR9XbMNk6RxhCioIGzJLnORFJbqmMHzilU9endhHTLhgbns9ybwPpfNHAahkec3+vNoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El4u34Su; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El4u34Su"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCFFC4CEE5;
	Tue, 11 Feb 2025 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739284441;
	bh=+Xvc4q5W1nscYEGrfBD6bl7hrDJvjlsORL+X+YUEzB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El4u34SuyR7NUtS7W3tKXegG1bVy9I3PrYZnCJhz6+voeGTD/QizADjr5UUAAbcmr
	 2w78/sTkKGgrz8fog72euYcwdo8v4mzgaw6rkJ8lgEWYZ98j6f74X3WA3b4gu8TY+n
	 oRCzB254B14ER/EkMk+vNQIrxj9yQlX9bL2wrsDXJzQ4YVARHpziaRNPcYYQXKrgi1
	 D6sOKHZf2HIpfvcWwSWiBjDwvfQFA9RpgIK0xWDdmByd/6cRk/8ERdVe8Pl7BK2BR1
	 TjmBuJveh96TbLy8pXKDQcuyx2HiBvYCNYGS7pEsLuYtEC28qiUrkBWTvd6FumEgYU
	 KRFRifS5TVtOA==
Date: Tue, 11 Feb 2025 15:33:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <20250211-solemn-meticulous-angelfish-85d1ce@houat>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
 <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="auslch53w3r7wyf5"
Content-Disposition: inline
In-Reply-To: <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>


--auslch53w3r7wyf5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
MIME-Version: 1.0

On Sun, Feb 09, 2025 at 09:13:36AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 03:58:02PM +0100, Maxime Ripard wrote:
> > The tc358768 driver follows the drm_encoder->crtc pointer that is
> > deprecated and shouldn't be used by atomic drivers.
> >=20
> > This was due to the fact that we did't have any other alternative to
> > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > in the bridge state, so we can move to atomic callbacks and drop that
> > deprecated pointer usage.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge=
/tc358768.c
> > index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b=
4fec83c5230512d96 100644
> > --- a/drivers/gpu/drm/bridge/tc358768.c
> > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > @@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_br=
idge *bridge)
> >  	ret =3D tc358768_clear_error(priv);
> >  	if (ret)
> >  		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
> >  }
> > =20
> > +static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
> > +					   struct drm_atomic_state *state)
> > +{
> > +	tc358768_bridge_disable(bridge);
> > +}
> > +
>=20
> Please change corresponding functions into atomic_disable() and
> atomic_post_disable(). Calling sites have access to the atomic state, so
> there is no need to have yet another wrapper.

It's pretty hard to do (at least without the hardware), both
tc358768_bridge_disable() and tc358768_bridge_post_disable() have
multiple call sites in the driver, and passing a state enabling the
bridge doesn't make sense for those.

I guess I can still drop that patch.

Maxime

--auslch53w3r7wyf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tf1gAKCRAnX84Zoj2+
dmpdAYDqA4YrlLcb3EyXi/l21syAmf4+bTONXVK75+H36XZfA17WUJyteK04OzSA
d5lceosBfRXiMtZpz+H56wLndIQiQuGVTOGJYRSwkZDkxxqs0VIUD52GWPIXX9Yw
l4MHHK8rvw==
=b5F7
-----END PGP SIGNATURE-----

--auslch53w3r7wyf5--
