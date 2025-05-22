Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8A22173A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930016; cv=none; b=oyuLSx6dXntyQtrAIojUmU3bb784MAKp4RZ95ntOB5hI94sJMbCO5mJ2KIV3lCdzIbQ5tthn0vmNVnBN8STvfhUUgTNO6L2VnaFH+57dPs/w2hnKePWiTi7Rpxd1+mC+EIMeQ+MjmHYxX7whW6Z47d9RvrNcoHuGZybB9lC8LoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930016; c=relaxed/simple;
	bh=oHAfxtLr472fih4uM/Vr2ZVIojGMCSC2Y8rZRoTUvsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOrP0AKoJU9NUYjWw/CqS9lmXE6HHiLIOxS1+hEBkwB7iI0ISEo28FqtEvWCQUqQO+7MmT2B+R1t2TSSXswpt4gi1SBfDfpmnm0MT9ySjLOaREFzGFx4B/Z6dOh9sTDqTSUD6PYHzfedapNtcMk17YvyDJ0gagfDmrSntUXjhrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfBpLEXK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfBpLEXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D01C4CEE4;
	Thu, 22 May 2025 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747930016;
	bh=oHAfxtLr472fih4uM/Vr2ZVIojGMCSC2Y8rZRoTUvsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PfBpLEXKaSTCYKDSU8zEeKgcKomCjcePLn+Z3u/QpAYXVrVamlLD4Hw//0SVn+jtr
	 BQDqKjPorn2poTIJbcJ+nG4k2SaSKdg3aKc0ShH80DcZTYDc7E7LrIDgQVDgmaDUH7
	 1ML2mSY6CsFme7Btw0/s6Bf526zihTIISeLz51fi7ewTSSWueBntt1bIqAMJLUTb+H
	 11x5GouXcETVWUSIBl6xZOKxZKHaqBHPxJfM2UfAjFUAqHOIfVEzU3gnNjrQjzZUpa
	 2CNsHCKmGDWME2/2i5k4NlOIzjq70Y31xUj5L9Zj+ICMKJ2RigkGaSK1jcfdd2+kuN
	 91Yz/TWcnyyyg==
Date: Thu, 22 May 2025 18:06:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
Message-ID: <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
 <20250519-sturdy-cyan-mouse-6bd0f1@houat>
 <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yiydieeqfbxg6yib"
Content-Disposition: inline
In-Reply-To: <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>


--yiydieeqfbxg6yib
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
MIME-Version: 1.0

On Mon, May 19, 2025 at 01:35:46PM +0300, Cristian Ciocaltea wrote:
> On 5/19/25 10:22 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
> >> In preparation to improve error handling throughout all test cases,
> >> introduce a macro to check for EDEADLK and automate the restart of the
> >> atomic sequence.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/driv=
ers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c=
8d9ba5e403118cd9f1 100644
> >> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit=
 *test,
> >>  				test_edid_hdmi_1080p_rgb_max_200mhz);
> >>  }
> >> =20
> >> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) =
do {	\
> >> +	if (ret =3D=3D -EDEADLK) {							\
> >> +		if (state)							\
> >> +			drm_atomic_state_clear(state);				\
> >> +		ret =3D drm_modeset_backoff(ctx);					\
> >> +		if (!ret)							\
> >> +			goto start;						\
> >> +	}									\
> >> +} while (0)
> >> +
> >=20
> > I'm not sure here either, for pretty much the same reason. As far as
> > locking goes, I really think we should prefer something explicit even if
> > it means a bit more boilerplate.
> >=20
> > If you still want to push this forward though, this has nothing to do
> > with kunit so it should be made a common helper.=20
>=20
> Ack.
>=20
> > I do think it should be
> > done in a separate series though. Ever-expanding series are a nightmare,
> > both to contribute and to review :)
>=20
> Indeed, let me take this separately.
>=20
> If you agree, I'd prefer to drop EDEADLK handling from the new tests as
> well, to allow sorting this out for all in a consistent manner.

We can't unfortunately. Most CI runners now run with WW_DEBUG that will
test for EDEADBLK handling.

Maxime

--yiydieeqfbxg6yib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9LnQAKCRAnX84Zoj2+
dpMYAXwPIo/WlZh2Znxsf6x67Xtl607BrjMkiSQ7aGP9WlUu+xhuPDs91FHUKLZe
VS4wt08Bfjn43SZVO5jlm3sCrxcyDOuVU9l0bbsv/gKvu3/c78IATNUWg4o6QU9J
MjjGG82UyA==
=ZgmH
-----END PGP SIGNATURE-----

--yiydieeqfbxg6yib--
