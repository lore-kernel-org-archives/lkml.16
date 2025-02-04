Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46C586358
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657391; cv=none; b=iYCBGuQ6/j6dBOq+IW4a2T7RQWLoU583BqnXH5PdaDv/WShvDc1pSfzHmBqnAt4DGjRrR+yyUAiqkBagjePmU1oE4/ulHGXZyEVUK2nlZG8jfHFhHnEK8466JpsZB2jcePnQ6UIp9ABcOYBo5SypYMsQeZs+lzFsYZ4pgI6UmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657391; c=relaxed/simple;
	bh=qWJgKcGae71GB2ssf2O5YmlsXadCUYdUYbFNqD+Ntgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlENqi9l2/9ebRulePMQ9gTYQgUrPAdRlYH28SNMirQd4W/CkyBLLw6YY5gblo/J1lJ6un47iUOWBUBl70lFOzF+sd6XsX/CRC6+5ErSq8BqaYcPPOj6UtMiSFKyJlTreafj4rW2TKvcnIlFeiSJvIVbfStckXfkD9dcvo+E7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQlUSYyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQlUSYyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F0AC4CEDF;
	Tue,  4 Feb 2025 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738657391;
	bh=qWJgKcGae71GB2ssf2O5YmlsXadCUYdUYbFNqD+Ntgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQlUSYyNkqa9eot3QrbmyIvqmK/FpOsP7GttI9wkjzffMyIS8PuWNwEIASSxLo4lj
	 Ofz1CvZPkR3cNdQZMLWVAzlPYLy+WC3lN3r3pGP81F5ENT7VWaDfMo1JYFH5dkCD4q
	 1Mo7i3wCiwcj+jynEknpmiWduqbL3VATLA4M5HtQKhoe1XfSli+HdwFK/mQQAvde+v
	 HZgVty5hZ4rjD3Fds5tzM2PoMte6ZRuFFPIJ2JSJLjcH5GalX1QjHCd0b0ktFqcWA7
	 dKIyILIR+aolo9JtCEvZRNAt1RhfJII1hyTjBarSVUGb24PQHCjFDnzGNSWfBLKyyL
	 Gz07zLAFkuSxw==
Date: Tue, 4 Feb 2025 09:23:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <20250204-vehement-curious-eagle-b87d7e@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
 <20250203-orthodox-watchful-poodle-4018f4@houat>
 <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ntwvjcipumgqyvo2"
Content-Disposition: inline
In-Reply-To: <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>


--ntwvjcipumgqyvo2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 07:49:05PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 11:01:28AM +0100, Maxime Ripard wrote:
> > Hi Dmitry,
> >=20
> > On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that =
is
> > > > deprecated and shouldn't be used by atomic drivers.
> > > >=20
> > > > This was due to the fact that we did't have any other alternative to
> > > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now pro=
vided
> > > > in the bridge state, so we can move to atomic callbacks and drop th=
at
> > > > deprecated pointer usage.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---=
------------
> > > >  1 file changed, 24 insertions(+), 17 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/dr=
m/bridge/ti-sn65dsi86.c
> > > > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb=
00af2bdf9ba1b6f890ffd 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_=
sn65dsi86 *pdata,
> > > >  	u8 buf[2] =3D { val & 0xff, val >> 8 };
> > > > =20
> > > >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> > > >  }
> > > > =20
> > > > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > > > +				     struct drm_bridge_state *bridge_state)
> > > >  {
> > > >  	u32 bit_rate_khz, clk_freq_khz;
> > > >  	struct drm_display_mode *mode =3D
> > > > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > > > +		&bridge_state->crtc->state->adjusted_mode;
> > >=20
> > > At least we should document why is it safe to follow the crtc->state.
> >=20
> > What do you have in mind there? crtc->state is a pointer that is widely
> > used, what is there to document?
>=20
> If I understand correctly, crtc->state is safe to be used during atomic
> callbacks only or if the mutex is being held. However this function is
> also being called from ti_sn65dsi86_enable_comms(), which is in turn is
> used in ti_sn65dsi86_resume(). Is it safe? Why?

It's not safe, and it wasn't before this series. I'll send a patch
trying to fix it. However, I can't test it and fixing individual locking
issues isn't really the point of this series either, so I might as well
drop it.

Maxime

--ntwvjcipumgqyvo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6HOZgAKCRAnX84Zoj2+
docGAYDFvQf4dmONWW+FGa4qFnMCeEOCquBMjAhsSFHPZjLBB2PynZdPmj39eD1i
KpyVK1wBfR5notRYrzykawEvNQGD9XTA5IugySHNIzFyjDD0HIraU4YnNBmMGTNy
viMS1rQ4cw==
=13r0
-----END PGP SIGNATURE-----

--ntwvjcipumgqyvo2--
