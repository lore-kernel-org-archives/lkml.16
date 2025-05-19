Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93A210FB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644160; cv=none; b=eg+kYfYGkI3q9gswCBJec/nE5FNRWLCHJr5V/j4a8ST+NSJ1GC9CmQxHxcveBXqWr5em7XyCb/TOIJS4bClC5TIa+8JWnQcYMH9CWnAsUTYZdq8p8iLUTR7r1vnKwIXMmBWD1//fLOv2OdBFkoDzdT3AsWu8v1jINqGCAwt04O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644160; c=relaxed/simple;
	bh=+03kt9iwtLbG5099ncvcgBRXBcr3CMG+xuHJpXjVv8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnh35PbGlpm/GOUBM+Nh74y9Wq4z7pSs4AtWXRgPXWVlfDr3ggBpkpfgV2R2jf+8ocVyegUlOrLHUPe/Vv1IePq0o80WCEsy0xiyQTngS9PZOb4VLN31YW1a0L5QpIkgqscu57lwsVAa3nluqImoyKzvUQpB8Q2S7wCJAPuXhNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruo60tw3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruo60tw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE772C4CEE4;
	Mon, 19 May 2025 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747644160;
	bh=+03kt9iwtLbG5099ncvcgBRXBcr3CMG+xuHJpXjVv8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruo60tw34zleKTt4jpUqfFIJ3YMcB6k/v+uuq3cOv/rMDR3RnaOVZyEtJ4734/L3E
	 +EkCePqWJBJHrJQPrIlBrQtPFSyt9DGBzarHT4rYTGE06RNeUuufcGFHLYxV8p9Ecw
	 Un2quvG4Yg/hYIB1CoTUlveWIZno3351Jfk0Qvi2PRhIyPFO1lcSsrk9VpOxnrCgjv
	 QJ7F99dUA6Zphj32joniv6FSThYfSMeDX5Xl+myxNH1711W+EI9gQJ+h9Hr14wD5eB
	 I7X0FyI0VfAIzJKW/CwMDSl9J2VAtx1mFE7aDhsnD2mWywA9WIGm49Uzfk7dHXHe8V
	 cBYQ72jCr/LZw==
Date: Mon, 19 May 2025 10:42:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
Message-ID: <20250519-classy-millipede-of-competence-4bb6ad@houat>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="itn5qs25mfwdt27d"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>


--itn5qs25mfwdt27d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
> Provide a test to verify that if both driver and screen support RGB and
> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succeed
> when trying to set a mode unsupported by the display.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f446c4=
995e7ee63dbc084 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported_fall=
back_yuv420(struct kunit *test
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +/*
> + * Test that if a driver and screen supports RGB and YUV420 formats, but=
 the
> + * chosen mode cannot be supported by the screen, we end up with unsucce=
ssful
> + * fallback attempts.
> + */
> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(struc=
t kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_info *info;
> +	struct drm_display_mode *preferred, *unsupported_mode;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB) |
> +				BIT(HDMI_COLORSPACE_YUV420),
> +				10,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm =3D &priv->drm;
> +	crtc =3D priv->crtc;
> +	conn =3D &priv->connector;
> +	info =3D &conn->display_info;
> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	unsupported_mode =3D drm_kunit_display_mode_from_cea_vic(test, drm, 96);
> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);

I'm not sure what this one is supposed to test. If the mode is
unsupported by the screen, it will be for both YUV and RGB, right? So
what are we testing here?

Maxime

--itn5qs25mfwdt27d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCru/QAKCRAnX84Zoj2+
dpkPAX9GdEFrGMnaPgHsQYafngD7rrP1g7XAmzcFOpgFYItZhI1qolmUM49ckdRB
yBw98JEBfjSASo48jnLPA51hoO+zrUdLQpRH8EB3d50j+yyodfMb5jxLo1SqUfCF
Y6qeLcFhyw==
=4oAs
-----END PGP SIGNATURE-----

--itn5qs25mfwdt27d--
