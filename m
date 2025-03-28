Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD4849C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175832; cv=none; b=MRt3fitiYNykkTq8qtL2AO444KOZQmk60YmDbEuRtFAYJHYJb+gFVS1bprCfs3Q9zLCykHy9tAvm44Irp2G5ZVsBilOTB1EROeMpyYsS7cRGUQR2gw73lQwHOj5CSgTXuXIXg9X3d+UapitJf5OqV8XRByYeEPv7Jikzgfxuj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175832; c=relaxed/simple;
	bh=Jl6uojou14Op0Uf3RkPACc3fPv0mAsQ6t1m1fCsEYuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXfH7Qf/47iRI09vdAOvYEuyjyKCCWQz61uQZURtJPORNQZVTfFL72/2tYrbg+xbCQ2jZYWbinYkjkcfWhL9CnWroF0ozDSQbSsWjj1WMexYN1B5VirzHJMNwDyh6EGGOZFA8URR8YWsgquZNh7l9N7Dv8MITgWG1vF5bIn43xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuRO+xID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuRO+xID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D230C4CEE4;
	Fri, 28 Mar 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743175831;
	bh=Jl6uojou14Op0Uf3RkPACc3fPv0mAsQ6t1m1fCsEYuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuRO+xIDsgl1mScfWOcT1sPjuNDA71B3WBhwI5gQTW9DawJT1Isbu+n/IHTmblmt3
	 ay7OSJKzOSeznh1U1qDSDebmGattehbIXtE5qCg9JHxGzfobiPBd071CH29cQqlTyY
	 zjUpRXRyAJk8OZam43pWsL0EQ+WuFSfmFr1RytXOjFRvm1YcxtLcq14/0TK4AOrSau
	 vOK4AoDkQZe5H8f1mVT2hed61XkTX/5y6TTQlqEF1iKxmGwrkusf8XrL9XfqsZNC/3
	 BMqHkxxrSRVQJhE06qitn/uGWe42fhr5OYMTIERf1aQiwqCgNiXjdXJSxcyBi+SXGf
	 Ld1ROENcQYtrg==
Date: Fri, 28 Mar 2025 16:30:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/vc4: tests: Document output handling functions
Message-ID: <20250328-brave-pompous-seagull-b0f728@houat>
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-2-779864d9ab37@kernel.org>
 <0eae371a-0677-407c-952e-fe49bd6dae6e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjtbep4bzdsc3nwc"
Content-Disposition: inline
In-Reply-To: <0eae371a-0677-407c-952e-fe49bd6dae6e@igalia.com>


--tjtbep4bzdsc3nwc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/vc4: tests: Document output handling functions
MIME-Version: 1.0

On Sun, Mar 23, 2025 at 03:34:50PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 18/03/25 11:17, Maxime Ripard wrote:
> > vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() public but
>=20
> Nit: s/public/are public

Good catch, thanks!

> > aren't documented. Let's provide the documentation.
> >=20
> > In particular, special care should be taken to deal with EDEADLK.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++=
++++++
> >   1 file changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/=
drm/vc4/tests/vc4_mock_output.c
> > index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec6=
14c381a214886bf27 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > @@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct ku=
nit *test,
> >   static const struct drm_display_mode default_mode =3D {
> >   	DRM_SIMPLE_MODE(640, 480, 64, 48)
> >   };
> > +/**
> > + * vc4_mock_atomic_add_output() - Enables an output in a state
> > + * @test: The test context object
> > + * @state: Atomic state to enable the output in.
> > + * @type: Type of the output encoder
> > + *
> > + * Adds an output CRTC and connector to a state, and enables them.
> > + *
> > + * Returns:
> > + * 0 on success, a negative error code on failure. If the error is
> > + * EDEADLK, the entire atomic sequence must be restarted. All other
> > + * errors are fatal.
> > + */
> >   int vc4_mock_atomic_add_output(struct kunit *test,
> >   			       struct drm_atomic_state *state,
> >   			       enum vc4_encoder_type type)
> >   {
> >   	struct drm_device *drm =3D state->dev;
> > @@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
> >   	crtc_state->active =3D true;
> >   	return 0;
> >   }
> > +/**
> > + * vc4_mock_atomic_del_output() - Disables an output in a state
> > + * @test: The test context object
> > + * @state: Atomic state to disable the output in.
> > + * @type: Type of the output encoder
> > + *
> > + * Adds an output CRTC and connector to a state, and disables them.
>=20
> I'm not sure if "Adds" properly expresses what the function does. How
> about "Finds an output CRTC and connector in a state, and disables
> them"?

Yeah, I see what you mean, but it doesn't really work either. The state
is empty before, we do try to find them to add a new state for them in
the global one, and that new state will disable them.

So we can't find them in that state prior to adding them, which is what
this function does.

Maxime

--tjtbep4bzdsc3nwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+bAlAAKCRDj7w1vZxhR
xfSfAP4z2GrXxDxhBaBz6BWIi44gC7iGk3mFwlpeRNv5vbyyVQD8CH7CZYyRbSc7
2iDN+9tTv6XJmS4m+38lDlI+ODt31Qk=
=d0PE
-----END PGP SIGNATURE-----

--tjtbep4bzdsc3nwc--
