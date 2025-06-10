Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8A18A92D;
	Tue, 10 Jun 2025 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571538; cv=none; b=KhQ0eeLZN89sQy9eS6dZNe1GrbYZAvQTvs1LgMtdqQC4KcNfF7TJ2Sor7qygt8um5Y+uJrTpGOzgrrmiK6zkXKBEGHIRLXfMNI3Mt113dsSyos+Gt+t/A6O0t2SkfLEczDSI8lA293MsgOvYS0pLQkDoLgZSLKowNxKbMwBu4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571538; c=relaxed/simple;
	bh=9NrEzp00CGmjzxsEm6Mps/pz8PgCShBimEpq82zblss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGHNUq4xH3HUigaom1uBgmYZ8FjAh9/FpQReRyKSPC2e7QxNO3CrkzlOp1/fZ4RV0KJRtO1Eyb92+sUKMOBVnS2H0UfyC30LsiNFZXJ9+scbunH+nlsxbgICwNtXfnm5bIlonBNKNgQUAqj0djykwoeC3h6wfa2lF6rnPtaMVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heV6QvYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heV6QvYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B06CC4CEED;
	Tue, 10 Jun 2025 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571536;
	bh=9NrEzp00CGmjzxsEm6Mps/pz8PgCShBimEpq82zblss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heV6QvYDmRpD51BpuyiznNI8t94OO1K1ZnJWnPpizw538PxI8/rS6jd65puDgYHTj
	 kAKJFu/QqvirokH6ZKgn5VPHJOsiQX1aa5MJ/J9HS8V7tMK5zo629uQJXZmye/8bqj
	 Qx2RJ5KpdYhrDhN5FDxfXKHYRC/apa/TazR+rTZoORSYmf9eIRaS8hnFph0anK1LG/
	 7SpNuybVe1aHgFQc61n42vB4jt74sdVJRDKyE7AMczih+4Klw/OX5jl2rGzc+cAG01
	 +HzCsUoPxNbP1FrQhXB1QiTCymAcsKNcsnZkLXfbYY4wmI/sE+647th2i2hYDEQ16o
	 OBUSEi8gkrY6g==
Date: Tue, 10 Jun 2025 18:05:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 07/10] clk: test: introduce test suite for sibling
 rate changes on a gate
Message-ID: <20250610-brawny-pompous-iguana-0b38e4@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-7-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wamzdha63cyo2dkq"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-7-0d2c2f220442@redhat.com>


--wamzdha63cyo2dkq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] clk: test: introduce test suite for sibling
 rate changes on a gate
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:53PM -0400, Brian Masney wrote:
> Introduce a test suite that creates a parent with two children: a
> divider and a gate. Ensure that changing the rate of one child does
> not affect the rate of the gate.
>=20
> Some of the tests are disabled until the relevant issue(s) are fixed in
> the clk core. This is also implemented as a parameterized kunit test
> since additional test variations will be added.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 156 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 156 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index c2337527873d3241e7b0a38f67ecaa13535bcc71..1440eb3c41def8c549f92c0e9=
5b2a472f3bdb4a7 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -825,6 +825,161 @@ static struct kunit_suite clk_rate_change_sibling_d=
iv_div_test_suite =3D {
>  	.test_cases =3D clk_rate_change_sibling_div_div_cases,
>  };
> =20
> +struct clk_test_rate_change_sibling_clk_ctx {
> +	struct clk *parent_clk, *child1_clk, *child2_clk;
> +};
> +
> +static void
> +clk_test_rate_change_sibling_clk_ctx_put(struct clk_test_rate_change_sib=
ling_clk_ctx *clk_ctx)
> +{
> +	clk_put(clk_ctx->parent_clk);
> +	clk_put(clk_ctx->child1_clk);
> +	clk_put(clk_ctx->child2_clk);
> +}
> +
> +struct clk_rate_change_sibling_div_gate_sibling_context {
> +	struct clk_dummy_context parent;
> +	struct clk_dummy_div child1;
> +	struct clk_dummy_gate child2;
> +	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
> +};
> +
> +static struct clk_test_rate_change_sibling_clk_ctx *
> +clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_gate_sibling_context *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +	test->priv =3D ctx;
> +
> +	ctx->parent.hw.init =3D CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate=
_ops, 0);
> +	ctx->parent.rate =3D DUMMY_CLOCK_RATE_24_MHZ;
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ctx->child1.hw.init =3D CLK_HW_INIT_HW("child1", &ctx->parent.hw,
> +					     &clk_dummy_div_ops,
> +					     CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ctx->child2.hw.init =3D CLK_HW_INIT_HW("child2", &ctx->parent.hw,
> +					     &clk_dummy_gate_ops,
> +					     CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ctx->clk_ctx.parent_clk =3D clk_hw_get_clk(&ctx->parent.hw, NULL);
> +	ctx->clk_ctx.child1_clk =3D clk_hw_get_clk(&ctx->child1.hw, NULL);
> +	ctx->clk_ctx.child2_clk =3D clk_hw_get_clk(&ctx->child2.hw, NULL);
> +
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk),
> +			DUMMY_CLOCK_RATE_24_MHZ);

EXPECT is for the expected output of the test. It looks to me that
you're are here checking if the test is properly setup, which would be
an assertion.

> +	return &ctx->clk_ctx;
> +}
> +
> +struct clk_test_rate_change_sibling_test_case {
> +	const char *desc;
> +	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test=
);
> +};
> +
> +static struct clk_test_rate_change_sibling_test_case clk_test_rate_chang=
e_sibling_test_cases[] =3D {
> +	{
> +		.desc =3D "div_gate",
> +		.init =3D clk_rate_change_sibling_div_gate_test_init,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,
> +		       clk_test_rate_change_sibling_test_cases, desc);

I'm not sure making them parameterized is a good idea (yet), I tend to
think that the more straightforward the tests are the better. That can
indeed lead to repetitions, but it's also much easier to debug once we
get a test failure.

> +
> +/*
> + * Test that, for a parent with two children and one requests a rate cha=
nge that
> + * requires a change to the parent rate, the sibling rates are not affec=
ted.
> + */
> +static void clk_test_rate_change_sibling_1(struct kunit *test)
> +{
> +	struct clk_test_rate_change_sibling_test_case *testcase =3D
> +		(struct clk_test_rate_change_sibling_test_case *) test->param_value;
> +	struct clk_test_rate_change_sibling_clk_ctx *ctx;
> +	int ret;
> +
> +	kunit_skip(test, "This needs to be fixed in the core.");
> +
> +	ctx =3D testcase->init(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_2=
4_MHZ);
> +
> +	ret =3D clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_4=
8_MHZ);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_4=
8_MHZ);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_2=
4_MHZ);

And also, we wouldn't have the same expectations between a gate like
here, and a mux (that can reparent), so sharing the code isn't going to
be trivial.

> +	clk_test_rate_change_sibling_clk_ctx_put(ctx);

This won't be run if you hit any KUNIT_ASSERT_*() conditions. We should
probably create a kunit-managed clk_hw_get() variant so we don't have to
deal with this.

Maxime

--wamzdha63cyo2dkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhXzQAKCRAnX84Zoj2+
dnE3AX0dwtL/2zl+Bf8b6HLTJ2FnBO8EaQcmVS6QWBK5jCaJ2IDoeUJA9zkLDb5s
BYXCXwMBfRCwOR/HWokStMqDA/ue/9Nl1I4n6QD+AfwtoB4Sj42Kbo1tyMQ5kqR3
302+ajbCZw==
=imfa
-----END PGP SIGNATURE-----

--wamzdha63cyo2dkq--
