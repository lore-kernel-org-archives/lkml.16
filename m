Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F9269B08
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362235; cv=none; b=R/WoFg+VAYhZ3Ug/kR+Vdrv1SKM8C/USgyw7naT3wEJWXYd8Uie/pKhKgkkcZwGmnASXrXc8bZzMAxqU/BLVIkSYeYArasHNqRHvfGPzZ82lH8lAQZMBtklTXM+Ec+pEIB7eVCluhKohq8VqxA0cUOgl2b04FSJcbN8yDzBrrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362235; c=relaxed/simple;
	bh=x02CK+8qrbvy4LwdV881C8rJPLJYRgJj2LP6IK2gJ5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRglOTH/katZzUTGgxzwrYs2S08tQO0U7rnRYQJrynt4ehQ7MVs/fxUIXU3ZMnmzEzkifeZ/iWb1+ValBmrZiMJRqKrs6nbJNGhp3ulTlReq52Ni5ZcQc466GVrPm1zLd3H+pDZ+qg1hH8apbQws746Mqv+SYMRDAT/Xg0JHgFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rECuIYBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rECuIYBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B5BC4CEE9;
	Tue, 27 May 2025 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748362234;
	bh=x02CK+8qrbvy4LwdV881C8rJPLJYRgJj2LP6IK2gJ5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rECuIYBJfhCMLhOQr4xdq8+9OdV0x7uoz1jAIY0WoBAVhU5UwLCkeiWkTs08SWR+E
	 ZWGe9Zf0JD/h8HQ/z58OIqh+hYIis4E8vvgSujoQpHwPpzvLGEQytmmyCM+vEMei26
	 /2WNclsqVSGV7YvcHMWBlG3Fec8qD+5s82DaXano8MDGX2WP+E2Rn+Gvk50fkBzgdg
	 JphSEDN3BIM5Opkw689sFzziuU7KL8Vjmj1HgjtxW4lwj6afr04cH09nP+b7sDoHhv
	 FF1BsNlKR3BCV/ERXzKav9GhOlTWzf33Cgbc4oBbEphuhL836rD3MgqSQGj9oJW4/T
	 mcBgI19c8drcw==
Date: Tue, 27 May 2025 18:10:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
Message-ID: <20250527-smiling-peacock-from-uranus-dc032f@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-3-7e356fd58ba5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="y2prcnw7nnkz2dsu"
Content-Disposition: inline
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-3-7e356fd58ba5@bootlin.com>


--y2prcnw7nnkz2dsu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Fri, May 16, 2025 at 06:48:39PM +0200, Luca Ceresoli wrote:
> Add KUnit tests for the newly introduced devm_drm_bridge_alloc().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changed in v8:
>  - rebase on new patch converting drm_bridge_test.c to
>    devm_drm_bridge_alloc()
>  - add check that bridge is removed (thanks to the .destroy callback)
>  - add a check with get/put
>=20
> Changed in v7:
>  - rebase on current drm-misc-next, which now has a drm_bridge_test.c file
>  - cleanup commit message
>=20
> Changed in v6:
>  - update to new devm_drm_bridge_alloc() API
>  - remove drm_test_drm_bridge_put test, not straightforward to write with
>    the new API and the current notification mechanism
>  - do not allocate a drm_device: a bridge is allocated without one
>  - rename some identifiers for easier code reading
>=20
> This patch was added in v5.
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 84 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 84 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index f3a625c536f610dc8560b56531056df7c613f564..32db3a82fe6d14a3e9d6536bc=
f4b19f1bc65969a 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_bridge_helper.h>
>  #include <drm/drm_kunit_helpers.h>
> =20
> +#include <kunit/device.h>
>  #include <kunit/test.h>
> =20
>  /*
> @@ -21,6 +22,7 @@ struct dummy_drm_bridge {
>  	unsigned int enable_count;
>  	unsigned int disable_count;
>  	struct drm_bridge bridge;
> +	void *data;
>  };
> =20
>  struct drm_bridge_init_priv {
> @@ -422,11 +424,93 @@ static struct kunit_suite drm_bridge_helper_reset_c=
rtc_test_suite =3D {
>  	.test_cases =3D drm_bridge_helper_reset_crtc_tests,
>  };
> =20
> +struct drm_bridge_alloc_test_ctx {

drm_bridge_alloc_priv

> +	struct device *dev;
> +	struct dummy_drm_bridge *dummy_br;
> +	bool destroyed;

This can be in drm_bridge_priv

> +};
> +
> +static void dummy_drm_bridge_destroy(struct drm_bridge *bridge)
> +{
> +	struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(bridge);
> +	struct drm_bridge_alloc_test_ctx *ctx =3D (struct drm_bridge_alloc_test=
_ctx *)dummy_br->data;
> +
> +	ctx->destroyed =3D true;
> +}
> +
> +static const struct drm_bridge_funcs drm_bridge_dummy_funcs =3D {
> +	.destroy =3D dummy_drm_bridge_destroy,
> +};

And same here, you don't need to create yet another function set, just
add it to the existing ones.

> +static int drm_test_bridge_alloc_init(struct kunit *test)
> +{
> +	struct drm_bridge_alloc_test_ctx *ctx;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	ctx->dev =3D kunit_device_register(test, "drm-bridge-dev");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
> +
> +	test->priv =3D ctx;
> +
> +	ctx->dummy_br =3D devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_brid=
ge, bridge,
> +					      &drm_bridge_dummy_funcs);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dummy_br);
> +
> +	ctx->dummy_br->data =3D ctx;
> +
> +	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
> +
> +	return 0;
> +}
> +
> +static void drm_test_drm_bridge_alloc_basic(struct kunit *test)

You need a comment explaining what this test is about

> +{
> +	struct drm_bridge_alloc_test_ctx *ctx =3D test->priv;
> +
> +	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
> +
> +	kunit_device_unregister(test, ctx->dev);
> +	KUNIT_ASSERT_TRUE(test, ctx->destroyed);

EXPECT

> +}
> +
> +static void drm_test_drm_bridge_alloc_get_put(struct kunit *test)

Comment here

> +{
> +	struct drm_bridge_alloc_test_ctx *ctx =3D test->priv;
> +
> +	KUNIT_ASSERT_FALSE(test, ctx->destroyed);
> +
> +	drm_bridge_get(&ctx->dummy_br->bridge);
> +	KUNIT_ASSERT_FALSE(test, ctx->destroyed);

EXPECT

> +	kunit_device_unregister(test, ctx->dev);
> +	KUNIT_ASSERT_FALSE(test, ctx->destroyed);

Ditto

> +	drm_bridge_put(&ctx->dummy_br->bridge);
> +	KUNIT_ASSERT_TRUE(test, ctx->destroyed);

Ditto

> +}
> +
> +static struct kunit_case drm_bridge_alloc_tests[] =3D {
> +	KUNIT_CASE(drm_test_drm_bridge_alloc_basic),
> +	KUNIT_CASE(drm_test_drm_bridge_alloc_get_put),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_bridge_alloc_test_suite =3D {
> +	.name =3D "drm_bridge_alloc",
> +	.init =3D drm_test_bridge_alloc_init,
> +	.test_cases =3D drm_bridge_alloc_tests,
> +};
> +
>  kunit_test_suites(
>  	&drm_bridge_get_current_state_test_suite,
>  	&drm_bridge_helper_reset_crtc_test_suite,
> +	&drm_bridge_alloc_test_suite,
>  );
> =20
>  MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
> +
>  MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
>  MODULE_LICENSE("GPL");

Looks good otherwise, thanks
Maxime

--y2prcnw7nnkz2dsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXj9wAKCRAnX84Zoj2+
dr/BAX9uVwJKf3m4xtOc++ZZUCTKyhY/iUGf628qH7SRN1zyikZiRnX73TsiKBLo
cep1bTwBf3Q9JBwvbW2AhtZ2UjUQnjSjjUXHK3pq5H8+oF2Q9CjoqHsfz9LpopfL
9H5lA102Ww==
=+xu1
-----END PGP SIGNATURE-----

--y2prcnw7nnkz2dsu--
