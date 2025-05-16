Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66372940F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401361; cv=none; b=cmAXuyJvL99fGlqq6jec7kE0JfpMcRJGr4ZsypnqkhAX9mNe8dyR8ky/vaKGKo/MfmGiablpDtxvPyRSi7LUvJFhAd16VdfdcaAPxZcn5irHdm17XP9WBLzkvUi1UKA0JZWqPHobrPdjONiZgy/kKONcDaJXIAScVzFVFaLfeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401361; c=relaxed/simple;
	bh=uvvI8RXh4rZJqEJHK/WRU2hAsaJ0v4o/pfgSZSgKH6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaMfhXfcBCvEpNywp0G3F6hF/3p4P5QzSvq5Ptp45/OHGcUSnzbFQA63jLcNqYLrp4FVHYQMc5WS4CBhePFF3b56nDzyqSBvxyo3anCE1LxVqW/K9ZOOrkRAz3ngIxR1LV6PDEo8qIexaTG0DRy3UUqgW/2NonmBTPUI82wpWJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZndHyWnU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZndHyWnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325BCC4CEE4;
	Fri, 16 May 2025 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747401360;
	bh=uvvI8RXh4rZJqEJHK/WRU2hAsaJ0v4o/pfgSZSgKH6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZndHyWnUtTl2Ohswj3nHyvVAXeQ6TjP9gkXk8xPOjGtX+f72esC2vbnNw1DiGIsWJ
	 lVmTjzE6CFCeoxIoO7Fzxlzlpv6FYXhIYKd8Df5jjx3X0QECNmguPuz39ToUNPw4SR
	 +2TlFO+0konrNtwjzaoH1QfK5O8JErI6U271cSAk7f0buYA0Cst4GxwngMj9+d6Y13
	 i2kluMysPKw/7TCqX7HtmVaMcS0DowRMkuDGNek6kb7JH8M4bCglgD1FFzLFHy1nkK
	 4l+rSc8F8qckDFHv15znnxQsvBRYX1wX8rF3f0ySanQYhuMr/UqkF/gOkTu4ik8IDa
	 ZSUQMXC7NUzAA==
Date: Fri, 16 May 2025 15:15:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper
 variant to enable CRTC connector
Message-ID: <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="btnk46swg4gpsgrg"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>


--btnk46swg4gpsgrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper
 variant to enable CRTC connector
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:27:03PM +0300, Cristian Ciocaltea wrote:
> Provide a wrapper over drm_kunit_helper_enable_crtc_connector() to
> automatically handle EDEADLK.
>=20
> This is going to help improve the error handling in a bunch of test
> cases without open coding the restart of the atomic sequence.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 39 +++++++++++++++++++++++++=
++++++
>  include/drm/drm_kunit_helpers.h           |  7 ++++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/=
tests/drm_kunit_helpers.c
> index 5f7257840d8ef0aeabe5f00802f5037ed652ae66..4e1174c50b1f2b6358eb740cd=
73c6d86e53d0df9 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -332,6 +332,45 @@ int drm_kunit_helper_enable_crtc_connector(struct ku=
nit *test,
>  }
>  EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
> =20
> +/**
> + * drm_kunit_helper_try_enable_crtc_connector - (Re)tries to enable a CR=
TC -> Connector output
> + * @test: The test context object
> + * @drm: The device to alloc the plane for
> + * @crtc: The CRTC to enable
> + * @connector: The Connector to enable
> + * @mode: The display mode to configure the CRTC with
> + * @ctx: Locking context
> + *
> + * This function is a wrapper over @drm_kunit_helper_enable_crtc_connect=
or
> + * to automatically handle EDEADLK and (re)try to enable the route from
> + * @crtc to @connector, with the given @mode.
> + *
> + * Returns:
> + *
> + * A pointer to the new CRTC, or an ERR_PTR() otherwise.
> + */
> +int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
> +					       struct drm_device *drm,
> +					       struct drm_crtc *crtc,
> +					       struct drm_connector *connector,
> +					       const struct drm_display_mode *mode,
> +					       struct drm_modeset_acquire_ctx *ctx)
> +{
> +	int ret;
> +
> +retry_enable:
> +	ret =3D drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connect=
or,
> +						     mode, ctx);
> +	if (ret =3D=3D -EDEADLK) {
> +		ret =3D drm_modeset_backoff(ctx);
> +		if (!ret)
> +			goto retry_enable;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_try_enable_crtc_connector);

I'm not sure it's a good idea. This function might affect the locking
context of the caller without even reporting it.

Generally speaking, I'd really prefer to have explicit locking, even if
it means slightly more boilerplate.

Maxime

--btnk46swg4gpsgrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCc6hwAKCRAnX84Zoj2+
dvcBAYDcTwDF538RFQHBgVAINQXEsJRaLAEAcd9prk21mK44LnqoDRgF5/Yg5F+n
we44oSABgKmQossFkY00emM9Nm+PKxJYxKdSsPJzFceIrdumROrLzgfYnB1zHpOz
wWLd/RlkyA==
=kUrs
-----END PGP SIGNATURE-----

--btnk46swg4gpsgrg--
