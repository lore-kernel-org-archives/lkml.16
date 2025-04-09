Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93A267732
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211518; cv=none; b=IAuUU4VyhMLOQYtQMuuKxo1pDeLtItWJ1NqL2t1n4SXy58DBlTe3P2AqX61S2/GgqTZsHMrPMTQg/GcTlLGMINRc/1ENbRMSL4Y6SCqOQS7M1lybC5nDGwl/Hc2ITnISy6T2gJ4MzJ9CSIeZSLMWrcuEltXXgQPJvvKePJ60CQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211518; c=relaxed/simple;
	bh=9zEvmNFlQZZmYfUY7s7s4qVdIjQmXfR0n8TD+iHvIys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUh/J0UFQY5/zZRjzt4p5fY8DgMfcDBwMQ527gKzi72BbAOcHAn9D2Fp9XBBDJMtmoISPeoUDTCGzVt/op0Ig/9YjoIgHaRmjLOQRdZNQSIvhQTTCniuCnU/C5aQvkiLMBmM/PiJrgydOnJ4PGnptpO6l5ZFBe5Z+BAjFqP/giY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uqd/k6WG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uqd/k6WG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD55C4CEE2;
	Wed,  9 Apr 2025 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744211517;
	bh=9zEvmNFlQZZmYfUY7s7s4qVdIjQmXfR0n8TD+iHvIys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uqd/k6WGDY2YY9TkGdFJSudBsy9nQNK4bhZusAwhojB5RwFEq/RwRwntqDMjfDFLq
	 n7YxZQDPx55+eLK8hnuz/FELuyfplqqc5WOQWSBbhea6Spmsj+kQNNiv4gvL6CC4ZU
	 jg9GbZCW0jDtHOGFmEQgUKrRiR8buCsYo7OHn10kTNgwgu0GVT7U1ZBXcPqfrPlcBR
	 uq5okBHT2RQbeAFVhOAeCin9gguV7Ou+Df4MITb0aU3NTQkgbWHv7nzjbLB2r/pbIi
	 x8GJzPNlfuQBSoprLTKg/e15SYA1DEObikyKi/PcKepz5vUBacFJ90Bn8U11VvbB5b
	 35KoK/oyM4qbA==
Date: Wed, 9 Apr 2025 17:11:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/15] drm/tests: hdmi: Add macros to simplify EDID
 setup
Message-ID: <20250409-ubiquitous-amethyst-trogon-bbb3cf@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-8-294d3ebbb4b2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lzskk4kxc2hm5gh"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-8-294d3ebbb4b2@collabora.com>


--5lzskk4kxc2hm5gh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/15] drm/tests: hdmi: Add macros to simplify EDID
 setup
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:57PM +0200, Cristian Ciocaltea wrote:
> Introduce a few macros to facilitate setting custom (i.e. non-default)
> EDID data during connector initialization.
>=20
> The actual conversion to use the new helpers is handled separately.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 43 +++++++++++-----=
------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 7ffd666753b10bc991894e238206a3c5328d0e23..bcbd146fb655f4402529e59af=
09c99dbae7be0bf 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -140,10 +140,12 @@ static const struct drm_connector_funcs dummy_conne=
ctor_funcs =3D {
> =20
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> -					   unsigned int formats,
> -					   unsigned int max_bpc,
> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +connector_hdmi_init_with_edid_funcs(struct kunit *test,
> +				    unsigned int formats,
> +				    unsigned int max_bpc,
> +				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +				    const char *edid_data,
> +				    size_t edid_len)
>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	struct drm_connector *conn;
> @@ -197,30 +199,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct k=
unit *test,
> =20
>  	drm_mode_config_reset(drm);
> =20
> +	if (edid_data && edid_len) {
> +		ret =3D set_connector_edid(test, &priv->connector, edid_data, edid_len=
);
> +		KUNIT_ASSERT_GT(test, ret, 0);
> +	}
> +
>  	return priv;
>  }
> =20
> -static
> -struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init(struct kunit *test,
> -				     unsigned int formats,
> -				     unsigned int max_bpc)
> -{
> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
> -	int ret;
> +#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bp=
c, funcs)		\
> +	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL=
, 0)

Again, we don't need that one. All current users would actually use
drm_kunit_helper_connector_hdmi_init_with_edid_funcs().

Maxime

--5lzskk4kxc2hm5gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aOOgAKCRDj7w1vZxhR
xdhZAQC2LBoDd/fH5aNs4u8Ya9lcI1PiTisit5ZjnQvPOmHlgQEAjracjEHWyXkC
uTkpjHqU0kwHuF1xfWwfwvuEXkMgkgg=
=Tpyq
-----END PGP SIGNATURE-----

--5lzskk4kxc2hm5gh--
