Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C342701A4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354253; cv=none; b=PYW2Lv3smKi9irDkX36CyhY4ej557sD2i2ZijmvNm56IkspGHdI+o6CmdGEfZyvSGbLJkzf9DQyQ/Pxoj0gFxHHVdAQL13sN7DLu7/a7vDRHlxUaQ0mW7F0EYJM0FEkNK1nhniuY7rNrjkyVefV9LB6SIItvdUNTw+/JhCZQ5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354253; c=relaxed/simple;
	bh=4wR2+R1SGWiNS1/xOD9/LQsBZfHHyeGnuDsDGl6v85A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V05q2+wVs+UWL7e+LBE/WdDsA8oRq8LJ2zdlz5bCk3D6QVdapq06UN/KTkbc5fmiw05rvRXef+S6ImTFB8vqItfpDQP4bL4IbFGN8Z78m0s2bOVXPA9AXH/myDXDKIvwo8wck9dFopIBC38dBwEUqXnk3nHx/PV3ZFUG+45PerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hjcc63mH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hjcc63mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F47C4CEE9;
	Tue, 27 May 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748354252;
	bh=4wR2+R1SGWiNS1/xOD9/LQsBZfHHyeGnuDsDGl6v85A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hjcc63mHWnGmKR4RXUugqyiioX7+KcIBg/AqVFxdLjpyl049iZKFdA0P0cQvzxfw5
	 j1pMhzYwFMODpPmTI/7GhGhHUWeWsFxrIS36cVr2lQ4jWH+9gsr/YbsaahfhaDMHSf
	 HfpRHNBZ+bWj25e7TEJd63HuwEDyesnp6BqAN+fm8dTGgRBhpVQTd1tOJnSk3YvPma
	 jyJifml2ojRAAxUyjcdAuakglu0FXQ7EcMel7JAT/hxzPDIrQhx5gqSncBiONx584b
	 nohbBslRUOmKOgeyv8/BUAtuQg8IRw4rTLZWvF7AvtkQfGtjKZapI3oanDXjiAtyww
	 Jp0ZnhZfkYqRw==
Date: Tue, 27 May 2025 15:57:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
Message-ID: <20250527-fractal-quick-trogon-67aeeb@houat>
References: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
 <0a55c763-c1c1-48dc-bad0-d993b4fc4f87@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="h6okyk6sojwvl3v6"
Content-Disposition: inline
In-Reply-To: <0a55c763-c1c1-48dc-bad0-d993b4fc4f87@igalia.com>


--h6okyk6sojwvl3v6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
MIME-Version: 1.0

On Sat, May 24, 2025 at 08:09:36AM -0300, Ma=EDra Canal wrote:
> On 20/05/25 09:08, Maxime Ripard wrote:
> > Commit 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_allo=
c()")
> > removed a kunit-managed function to get a drm_modeset_acquire_ctx.
> >=20
> > It converted the vc4_pv_muxing_test_init() function, used by
> > drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid(). However,
> > during that conversion, it went from being kzalloc'd to being allocated
> > on the stack.
> >=20
> > vc4_pv_muxing_test_init() then uses that context to allocate a
> > drm_atomic_state using drm_kunit_helper_atomic_state_alloc(), which
> > stores a pointer to the locking context in the allocated state.
> >=20
> > However, since vc4_pv_muxing_test_init() is a test init function, the
> > context is then cleared when we leave the function, and before executing
> > the test. We're then running the test with a dangling pointer, which
> > then leads to various crashes.
> >=20
> > Rework the context initialization and state allocation to move them to
> > drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid().
> >=20
> > Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_allo=
c()")
> > Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> > Closes: https://lore.kernel.org/r/Z_95jWM2YMTGy3pi@arm.com/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 38 ++++++++++++++++-=
---------
> >   1 file changed, 24 insertions(+), 14 deletions(-)
>=20
> Hi Maxime,
>=20
> Didn't you fix this issue in commit 7e0351ae91ed ("drm/vc4: tests: Stop
> allocating the state in test init") [1]?
>=20
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7e0351ae91ed2=
b6178abbfae96c3c6aaa1652567

I did, and forgot I guess.. :/

It should be on its way to 6.16-rc1 already, so hopefully it'll get
picked up by the stable kernel team at some point.

Maxime

--h6okyk6sojwvl3v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXEygAKCRAnX84Zoj2+
djaWAYCWBJKD2mwg/m3+coQTtR52dUwJMXdEidSdSxChHI/akBYFajJMlUHItiYz
1yCBEdEBgJ8ALVWFUZeXRSm68pPOYsRXNvsGtdx2SwO4woZ4OdaUjytj5JaKRPZj
l4Bl7uRLFQ==
=LqBF
-----END PGP SIGNATURE-----

--h6okyk6sojwvl3v6--
