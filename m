Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02B1624F7
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241848; cv=none; b=CYwnQSeI7hwp1inlY0n+6hvU4iqjpOEKCHsZ+URyFupDv8F5+1mmROed1YVRvpy2iW9FuYGERwdMEnstLWf7ai27xV+rSIKyLCaUXKmNmvTDQcGp0LPqXvLn878kWX6zj90wpZMs7V/EGDsJPHxmhe6m66/fOIU7fK1fQpK1jMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241848; c=relaxed/simple;
	bh=hVpxBRkHdn9LWbevrRY7cTwGyqnEoh9xSW6K+/UdL3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw6hWjUbxoi0GLOmBRxIBmbtVqwNdR17JkFajLu2M6+bUxC7p/14kqmfA7H6jFAvjgJJ9nkVoG7Fbv8R1BZ3svTMot5443YDea7c634qd6/IyxGYmse2S7451T1EpI4Jigds92/sR0+R4U6fPZz4oeZSm3B9iOEob+bBESm6JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9i3RBdK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9i3RBdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164B8C4CEE7;
	Mon, 26 May 2025 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748241847;
	bh=hVpxBRkHdn9LWbevrRY7cTwGyqnEoh9xSW6K+/UdL3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9i3RBdKOZouDq5Vu7nuEx+uNgKGM+jZIbRoIsaak74rop4f3tecnEhVEtq6V2QhA
	 iNbRu18t+BuN3E+LjtqY7bBm+iuFN8Cjde4V/h5jklCDblgJHnucfOHoGEFu7pisfU
	 lsRkGO4phNemm50WYWlkjIZLCsVg21rtkvUHxxF+TIQRw6a4Ih/+pNiikR8iVQvvFg
	 4vEVRSQoE0XkSM7gQvI+QjIhGakYEXW7B0xpfFZMH7nt/4L+6TibNGyqbO1XukiBZN
	 EYjLR+Br0HjWtGGO2VAQ+QEGFlQ8Kn17V+gf3Q9hGYgf+6Ky84UOcDRoQLXFgTJyI0
	 6MdmKVF63Hn2g==
Date: Mon, 26 May 2025 08:44:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
Message-ID: <20250526-brawny-determined-lizard-aeef92@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
 <20250519-sturdy-cyan-mouse-6bd0f1@houat>
 <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
 <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
 <88e1fed3-47eb-4925-b11a-71557af9add5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zxkukyinj66w3cmw"
Content-Disposition: inline
In-Reply-To: <88e1fed3-47eb-4925-b11a-71557af9add5@collabora.com>


--zxkukyinj66w3cmw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
MIME-Version: 1.0

On Thu, May 22, 2025 at 07:47:00PM +0300, Cristian Ciocaltea wrote:
> On 5/22/25 7:06 PM, Maxime Ripard wrote:
> > On Mon, May 19, 2025 at 01:35:46PM +0300, Cristian Ciocaltea wrote:
> >> On 5/19/25 10:22 AM, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
> >>>> In preparation to improve error handling throughout all test cases,
> >>>> introduce a macro to check for EDEADLK and automate the restart of t=
he
> >>>> atomic sequence.
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
> >>>>  1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/dr=
ivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e16=
6c8d9ba5e403118cd9f1 100644
> >>>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >>>> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kun=
it *test,
> >>>>  				test_edid_hdmi_1080p_rgb_max_200mhz);
> >>>>  }
> >>>> =20
> >>>> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start=
) do {	\
> >>>> +	if (ret =3D=3D -EDEADLK) {							\
> >>>> +		if (state)							\
> >>>> +			drm_atomic_state_clear(state);				\
> >>>> +		ret =3D drm_modeset_backoff(ctx);					\
> >>>> +		if (!ret)							\
> >>>> +			goto start;						\
> >>>> +	}									\
> >>>> +} while (0)
> >>>> +
> >>>
> >>> I'm not sure here either, for pretty much the same reason. As far as
> >>> locking goes, I really think we should prefer something explicit even=
 if
> >>> it means a bit more boilerplate.
> >>>
> >>> If you still want to push this forward though, this has nothing to do
> >>> with kunit so it should be made a common helper.=20
> >>
> >> Ack.
> >>
> >>> I do think it should be
> >>> done in a separate series though. Ever-expanding series are a nightma=
re,
> >>> both to contribute and to review :)
> >>
> >> Indeed, let me take this separately.
> >>
> >> If you agree, I'd prefer to drop EDEADLK handling from the new tests as
> >> well, to allow sorting this out for all in a consistent manner.
> >=20
> > We can't unfortunately. Most CI runners now run with WW_DEBUG that will
> > test for EDEADBLK handling.
>=20
> Ok, in that case I'll proceed with the explicit error handling for the
> new tests only.  And as soon as the series gets merged, I'll come up
> with a common helper and apply it for all tests.

Sounds like a good plan :)

Maxime

--zxkukyinj66w3cmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDQNrwAKCRAnX84Zoj2+
dkb6AX9DojgehpO2uMfUajX5D5kQjQI1O7fI/s2oGtaLk3c9NeB4WtyK6hWz4kpG
Mx0+6m8BgPJEwLrr2nXe501YcBIqai1vPQc2BJ26AlLTZR/PhfS405mfZVUnc2S0
098thcySYg==
=aDTM
-----END PGP SIGNATURE-----

--zxkukyinj66w3cmw--
