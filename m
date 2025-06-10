Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486B246BAC;
	Tue, 10 Jun 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572439; cv=none; b=d7ewZFNxRdMd4gvh+ij3pz4Gxa3BbVtLIVxrMbaeFvTYYC/aCLddlxPRXcjUJXloi1mQq9BhL5vBaakDX2U1i4QiGKKL0FjpDexh7hqbpIaB/4OP4AW7j+ea8+RhSWpcpkxB0Ofo6q6ut6kL2XiSynaS8xUXMZVglIYJ29Jk7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572439; c=relaxed/simple;
	bh=/RfRVh53kBLjq+yf9QWrquECCZiIGjUgSwMhlAFCgLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifamxz9JNQvqJMlYRPiL176r4a+FAPDPiyau/cuwfIxff1nO2F4qBCZ9F/4zrTQb3eHYijWkBQOUUIhGmpfpHKE9hnHgF2L5c1YkiEGDAYu/6mMImVSruAg7GREPHKHWi6y48sL2nYqI7v9MSlKEv9oSI35PUOa3TqYYxdlkv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVFRPm7P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVFRPm7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D3C4CEED;
	Tue, 10 Jun 2025 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572439;
	bh=/RfRVh53kBLjq+yf9QWrquECCZiIGjUgSwMhlAFCgLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVFRPm7P9TIu9q11XW8qN/63HIbhiH+zeF5qJ6MTXQCZGQPWtlMmyR8rE1hhdfb4A
	 jWbCp5Qp/DqSgP+o+L+byE6b95UUFbpQOaYxvzN9Yt07FO+dcx6fiRMgRiltlugslO
	 kz26QVq4xKHPaPGg/Dd2T/oaP4vzRvIRa88E8fNnVN0CoctwBf/gHNLPgrod8DzOpG
	 g+KEmUHO3EVUp6tU9A9ZfYecv77obzN/koEKHbDCSinp57n50F/4LZeC4kjwlFKlDS
	 1MRJGS4yI3y2CdCRe3EMrQnHUKEZ5i2thXRzkjmcE3Fa7Sjqyfx0RujVBhbUmvSx32
	 CDJoGqiCtlUyw==
Date: Tue, 10 Jun 2025 18:20:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 08/10] clk: test: introduce helper to create a mock mux
Message-ID: <20250610-heavy-liberal-moose-dba76e@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-8-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yifjjcymjnzixzmt"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-8-0d2c2f220442@redhat.com>


--yifjjcymjnzixzmt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 08/10] clk: test: introduce helper to create a mock mux
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:54PM -0400, Brian Masney wrote:
> Introduce a helper to create a mock mux to reduce code duplication.
> This also changes it so that the relevant clk_hws are registered with
> the kunit framework.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 141 ++++++++++++++++++-------------------------=
------
>  1 file changed, 52 insertions(+), 89 deletions(-)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 1440eb3c41def8c549f92c0e95b2a472f3bdb4a7..147935975969f8da4a9365c0f=
ac6ffe37e310933 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -538,45 +538,64 @@ static struct kunit_suite clk_uncached_test_suite =
=3D {
>  	.test_cases =3D clk_uncached_test_cases,
>  };
> =20
> -static int
> -clk_multiple_parents_mux_test_init(struct kunit *test)
> -{
> -	struct clk_multiple_parent_ctx *ctx;
> -	const char *parents[2] =3D { "parent-0", "parent-1"};
> +static int clk_init_multiple_parent_ctx(struct kunit *test,
> +					struct clk_multiple_parent_ctx *ctx,
> +					const char *parent0_name,
> +					unsigned long parent0_rate,
> +					const char *parent1_name,
> +					unsigned long parent1_rate,
> +					const char *mux_name, int mux_flags,
> +					const struct clk_ops *mux_ops)
> +{
> +	const struct clk_hw *parents[2];
>  	int ret;
> =20
> -	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return -ENOMEM;
> -	test->priv =3D ctx;
> -
> -	ctx->parents_ctx[0].hw.init =3D CLK_HW_INIT_NO_PARENT("parent-0",
> +	ctx->parents_ctx[0].hw.init =3D CLK_HW_INIT_NO_PARENT(parent0_name,
>  							    &clk_dummy_rate_ops,
>  							    0);
> -	ctx->parents_ctx[0].rate =3D DUMMY_CLOCK_RATE_1;
> +	ctx->parents_ctx[0].rate =3D parent0_rate;
>  	ret =3D clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[0].hw);
>  	if (ret)
>  		return ret;
> =20
> -	ctx->parents_ctx[1].hw.init =3D CLK_HW_INIT_NO_PARENT("parent-1",
> +	ctx->parents_ctx[1].hw.init =3D CLK_HW_INIT_NO_PARENT(parent1_name,
>  							    &clk_dummy_rate_ops,
>  							    0);
> -	ctx->parents_ctx[1].rate =3D DUMMY_CLOCK_RATE_2;
> +	ctx->parents_ctx[1].rate =3D parent1_rate;
>  	ret =3D clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[1].hw);
>  	if (ret)
>  		return ret;
> =20
> -	ctx->current_parent =3D 0;
> -	ctx->hw.init =3D CLK_HW_INIT_PARENTS("test-mux", parents,
> -					   &clk_multiple_parents_mux_ops,
> -					   CLK_SET_RATE_PARENT);
> +	parents[0] =3D &ctx->parents_ctx[0].hw;
> +	parents[1] =3D &ctx->parents_ctx[1].hw;
> +	ctx->hw.init =3D CLK_HW_INIT_PARENTS_HW(mux_name, parents,
> +					      mux_ops, mux_flags);
>  	ret =3D clk_hw_register_kunit(test, NULL, &ctx->hw);
>  	if (ret)
>  		return ret;
> =20
> +	ctx->current_parent =3D 0;
> +
>  	return 0;
>  }

In this patch too, I'm wondering if we're not making it more complex
than it needs to be. I can see how small variations (like the parent
flags, or ops, or...) will all sound reasonable, but will turn this
allegedly simple function into a large, hard-to-parse, one

Maxime

--yifjjcymjnzixzmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhbUwAKCRAnX84Zoj2+
djYSAYC1bgdfPaf0DnoyX7+MasqIoe/PKRtXkRNax6FUipiimxfqN5UYxMS7EDqu
a1+uWw4Bfj7Qh8/TzKvUi0l/53F1KAsfxk4tIllCc8a0+aY+ywVqg1jA7YZ8oUxc
cuuGqvbGUw==
=zR1d
-----END PGP SIGNATURE-----

--yifjjcymjnzixzmt--
