Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72CB4594A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930567; cv=none; b=ueMn7KlIi53o8mebOQhFW9VSOGq2RjClee2X7mTuoHH/viRI60/mOp0vRN5LEvk73qpI2Y3RNU31s9xVVoIEQWsfikJ8yyP9n0RvnSI9Umho0WCbjypRDaRSGORH6RmsKqKy/pV3X00PxDl228vJ+4CQI2CQlq9PzGU+6yww9os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930567; c=relaxed/simple;
	bh=iP2PagZOuTlQYwtXEIS3nGBd1jiTN2n+OxpL1RH6JzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeTA+hG7PBilMTRK3YZgoBdVSDwid86lYDACfUc/PVkHqpjpRsr+AeCiNENQdBd1DBmtQN6KBW+A54tDNQNjFaMQCVJpaaLfB4YAhmSet81ChKy/hjM7FffPIlSCV0HpkfiE3iyqBg87RVlqZN5wBip1U5sJZZF++lFfzWE8GlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9krYB+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9krYB+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CA5C4CEE4;
	Thu, 22 May 2025 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747930567;
	bh=iP2PagZOuTlQYwtXEIS3nGBd1jiTN2n+OxpL1RH6JzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9krYB+yegW8QS+CzT2jy2VOeai+gZWIgsOomVsu4KP6hx3eUwEmasI6pwmvoXMxT
	 3RaZBVYYh0frxxZy+qO1/XI9dvcbEEA/ymZkHFcjKDH145dnJ5lkLl/xKQAkPbR0zE
	 /EGCopAhHyKSLFFMcL2VHiWags8bc7eCaPo6lnZ2f+7kVIUSQrmV+zlmwiR+WGTF+t
	 UVqon5koKJhYPeD8RhX0h4eRktk9Zyca+R6mrIPanPTLrDGjlGJdqyIAkaukKR+MuN
	 sHXw1pUKQUc/n3U/fKpdou3yQvsu++/kdkuzzhtWt4DV2GQbosR3cs6ause3WbmMM8
	 qor8PMLjHaMwA==
Date: Thu, 22 May 2025 18:16:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
Message-ID: <20250522-mutant-emu-of-youth-ae70cd@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
 <20250519-classy-millipede-of-competence-4bb6ad@houat>
 <a37b4045-0d94-4148-bb1e-fc08104e6173@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mhdrv5hb2rwnvz46"
Content-Disposition: inline
In-Reply-To: <a37b4045-0d94-4148-bb1e-fc08104e6173@collabora.com>


--mhdrv5hb2rwnvz46
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
MIME-Version: 1.0

Hi,

On Mon, May 19, 2025 at 01:55:10PM +0300, Cristian Ciocaltea wrote:
> On 5/19/25 11:42 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
> >> Provide a test to verify that if both driver and screen support RGB and
> >> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succeed
> >> when trying to set a mode unsupported by the display.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 +++++++++++++=
+++++++++
> >>  1 file changed, 66 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/driv=
ers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f44=
6c4995e7ee63dbc084 100644
> >> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> >> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported_f=
allback_yuv420(struct kunit *test
> >>  	drm_modeset_acquire_fini(&ctx);
> >>  }
> >> =20
> >> +/*
> >> + * Test that if a driver and screen supports RGB and YUV420 formats, =
but the
> >> + * chosen mode cannot be supported by the screen, we end up with unsu=
ccessful
> >> + * fallback attempts.
> >> + */
> >> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(st=
ruct kunit *test)
> >> +{
> >> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> >> +	struct drm_modeset_acquire_ctx ctx;
> >> +	struct drm_crtc_state *crtc_state;
> >> +	struct drm_atomic_state *state;
> >> +	struct drm_display_info *info;
> >> +	struct drm_display_mode *preferred, *unsupported_mode;
> >> +	struct drm_connector *conn;
> >> +	struct drm_device *drm;
> >> +	struct drm_crtc *crtc;
> >> +	int ret;
> >> +
> >> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> >> +				BIT(HDMI_COLORSPACE_RGB) |
> >> +				BIT(HDMI_COLORSPACE_YUV420),
> >> +				10,
> >> +				&dummy_connector_hdmi_funcs,
> >> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> >> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> >> +
> >> +	drm =3D &priv->drm;
> >> +	crtc =3D priv->crtc;
> >> +	conn =3D &priv->connector;
> >> +	info =3D &conn->display_info;
> >> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
> >> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
> >> +
> >> +	preferred =3D find_preferred_mode(conn);
> >> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> >> +
> >> +	unsupported_mode =3D drm_kunit_display_mode_from_cea_vic(test, drm, =
96);
> >> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);
> >=20
> > I'm not sure what this one is supposed to test. If the mode is
> > unsupported by the screen, it will be for both YUV and RGB, right? So
> > what are we testing here?
>=20
> That would be the case suggested at [1]:
>=20
> "We still need to do the same with a driver that supports both, but the
> monitor doesn't."
>=20
> Should we drop it?

Ah, I see. I meant that we should normally end up with YUV420 (so mode
is supported by the monitor, but the resolution is too high for RGB and
we should pick YUV instead), but the monitor doesn't support it and thus
we fail.

Maxime

--mhdrv5hb2rwnvz46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9NxAAKCRAnX84Zoj2+
dvjcAYCrIYbp+3gtUVmOEXvLPcHTGaV8voIHR/Yy2Kan41uLSiJ/9x91JrV3fB25
cSaXAgwBfje3/Oq4Y9XCr7RjoyQ+0XDtYtEe2NtJ8toIvJm4auAiJV+gWAGhrYJP
p0pHi8mFRw==
=HtM9
-----END PGP SIGNATURE-----

--mhdrv5hb2rwnvz46--
