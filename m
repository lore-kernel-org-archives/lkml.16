Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96C238144;
	Tue, 10 Jun 2025 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569956; cv=none; b=rBpQ29L+a1FnF1+zVfMZcZbAwR/b4swkdKp990AWeEzzxFcr66ZnJ2dgJNSmackLdtYwjk3xiMDPPY5WxeRAxh+MgiseI7aQFl1MIwomUF660UWY/NNvSQI+EGuQh2kuujcuKr2EpkIgimgxmnILGvkbkLe3X+T28flErztUt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569956; c=relaxed/simple;
	bh=ww3O6SHOxH7oHNxUHv2f1aaqenG4GVcVNUqWSPotybU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPNQrnBWa4C7AW0RH2yJ9mNJOlUGG6RBk/hElh8CVRBmfSSJdsLNnHsxRSWlQZnVv0zW2z3CvHN1QYhN+22fVorjRWggFsyhs6Iyegu1RLz8bHpC/KmYg2LdHtDFSU/VTpobXKbzU3p5SvxY0WizRJVTWbN+f6h2DTQmkVViXuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWAFMyNI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWAFMyNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82E2C4CEED;
	Tue, 10 Jun 2025 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569955;
	bh=ww3O6SHOxH7oHNxUHv2f1aaqenG4GVcVNUqWSPotybU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWAFMyNIk4A7Gq2NdlJDX/5nkpbCSv8syLRECRyYlp/Vw0Y5zW/Cvh4csEk2E89nn
	 Se79e1suxBFY72JrrRsS4F1RMBih0SDH6OJfhKGzsFEdGlUlyrbYqjmYzJ7VdIGxbs
	 +oOYeRhbukDtijgmKUa6lfBOKPbhFq15QQ2ndhIW5SRTWnR0tz8LE1pb5N3hNi7P4M
	 B8FUF+PlwVZxmXnjfNXTubaamh9wmh5TFyvdfXn+Io6ZdWGDSbbzmeVgjrFFe0Et4I
	 a5N7NNLZXMdDVpKXm/eug0+De/CaZT5FR/xQhkndAdP+lEFjo45xSpFGhRBa3qN1+t
	 UpUJLIVfkwrEw==
Date: Tue, 10 Jun 2025 17:39:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 05/10] clk: test: introduce test suite for sibling
 rate changes on a divider
Message-ID: <20250610-loose-quick-robin-e2ceae@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-5-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2mmbp4dpfehbqy7u"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-5-0d2c2f220442@redhat.com>


--2mmbp4dpfehbqy7u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 05/10] clk: test: introduce test suite for sibling
 rate changes on a divider
MIME-Version: 1.0

Hi,

On Wed, May 28, 2025 at 07:16:51PM -0400, Brian Masney wrote:
> Introduce a test suite that creates a parent with two divider-only
> children, and ensure that changing the rate of one child does not
> affect the rate of the sibling.
>=20
> Some of the tests are disabled until the relevant issue(s) are fixed in
> the clk core.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 139 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 139 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 4908fb9c0c46e34063ecf696e49b48510da44538..35f516fd71a2e33ca19a0512b=
d2db02111ea644c 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -653,6 +653,144 @@ clk_multiple_parents_mux_test_suite =3D {
>  	.test_cases =3D clk_multiple_parents_mux_test_cases,
>  };
> =20
> +struct clk_rate_change_sibling_div_div_context {
> +	struct clk_dummy_context parent;
> +	struct clk_dummy_div child1, child2;
> +	struct clk *parent_clk, *child1_clk, *child2_clk;
> +};
> +
> +static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_div_context *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	test->priv =3D ctx;
> +
> +	ctx->parent.hw.init =3D CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate=
_ops, 0);
> +	ctx->parent.rate =3D DUMMY_CLOCK_RATE_24_MHZ;
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->child1.hw.init =3D CLK_HW_INIT_HW("child1", &ctx->parent.hw,
> +					     &clk_dummy_div_ops,
> +					     CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->child2.hw.init =3D CLK_HW_INIT_HW("child2", &ctx->parent.hw,
> +					     &clk_dummy_div_ops,
> +					     CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->parent_clk =3D clk_hw_get_clk(&ctx->parent.hw, NULL);
> +	ctx->child1_clk =3D clk_hw_get_clk(&ctx->child1.hw, NULL);
> +	ctx->child2_clk =3D clk_hw_get_clk(&ctx->child2.hw, NULL);
> +
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_2=
4_MHZ);
> +
> +	return 0;
> +}

We should probably document that we're using CLK_SET_RATE_PARENT on the
dividers, because it'll affect the outcome of the tests.

The rest looks good to me, but is still dependant on some earlier
discussions being solved.

Maxime

--2mmbp4dpfehbqy7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhRlwAKCRAnX84Zoj2+
dtU6AX0WkzTBP1qCQ/5j9Bucp3IZRzvYfQdU+w+Tg214k3pSkxl8HFOUjahRfO0V
N3knl8kBfie0iXRVpTfNaFyqwWAWMVqNJNYn9wJhd2se3bXXi9Lqfgpb8lFhUdsu
fXGjzsT2Tg==
=RsCr
-----END PGP SIGNATURE-----

--2mmbp4dpfehbqy7u--
