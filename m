Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528F233D92;
	Tue, 10 Jun 2025 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572909; cv=none; b=AP+7u0MAQGud7r9CJFAyI0TaKcG4pDb64asgNXbNcnPFwYIOO5k2F5L8sMftTgTwc5zortm68KZCven0DTzJYv8i5TJTNfRvQG2uWAexL+PMo0amHajVbhrkV2jIFTuaAgAzO3rQBt1iWFs56HO6wGm1gl4QQXbCY57kXzEGtVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572909; c=relaxed/simple;
	bh=y3iTblb10g0L1NBLsroMMvLS5yuT8zO0ahcr1JeCwlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD5QLvo9Hl2z/udpEDrnS1Hsvu1zSkCugwW3HtaBf4jS4eaDa+fTV9QdCj7nzWwAUu730VSYOKmw9sPUV0hPyYsKiJvPUHPbGIwGduXJp871XFG19aOQkP0zz/uspBfWTtd97Fc+a4hg8F8b/i2NLzBXq1BdDXDbI1QfECDwkHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxEcUgBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxEcUgBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43560C4CEED;
	Tue, 10 Jun 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572908;
	bh=y3iTblb10g0L1NBLsroMMvLS5yuT8zO0ahcr1JeCwlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxEcUgBnGCNoC+5OqGxJC4lRgPP/kayp4AfoyMp6xuQ4gLs7FLGXQ+bsmYCRtHrCi
	 3gcTxCWeqOATWOCg8AZQrRiAC7hCig4DKs4BhiPEqvLJ7n8NfWjto2BmCkIlVHGaNF
	 Xe2KCUN3Sjj1rKRAMkCGBxWKIu7b6esA0EWxeifIgdmH8V1nXKd9BTty/SVtFBxRy9
	 BE4uWlwQTK+k6d2mEkNhM3Wt5pe13SMjEl3cBig9bbYo0mbWyHpdt1tau1sIo0DUJp
	 rFkELIxkOtsNerocyaIClC3RctDewHurAe4t8pu3NgP8KAlqWS+rhYEFG1V7obF5s9
	 A4a4Vj6j+D9Bw==
Date: Tue, 10 Jun 2025 18:28:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Message-ID: <20250610-hot-shapeless-skua-dcfc2a@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
 <20250606-fabulous-fortunate-chamois-ab4c98@houat>
 <aEL7A_YeC8b4Wj48@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j2s7e6xz263okgjh"
Content-Disposition: inline
In-Reply-To: <aEL7A_YeC8b4Wj48@x1>


--j2s7e6xz263okgjh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 10:28:19AM -0400, Brian Masney wrote:
> On Fri, Jun 06, 2025 at 10:56:57AM +0200, Maxime Ripard wrote:
> > On Wed, May 28, 2025 at 07:16:49PM -0400, Brian Masney wrote:
> > > Some of the mock tests care about the relationship between two
> > > different rates, and the specific numbers are important, such as for
> > > mocking a divider.
> > >=20
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> >=20
> > It's not obvious to me why they are important, actually. The relation
> > between the two is, but a divider (and our tests) should work with any
> > parent rate, so I guess we can expect it to be opaque.
>=20
> I agree as well.
>=20
> > Can you expand on why it's important?
>=20
> I personally find that having specific numbers in some (but not) of the
> tests make the tests clearer that specific functionality within the clk
> core is exercised. For example, assume we have a parent that can do any
> rate, and two children that are dividers. We could have a test like the
> following:
>=20
>     clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_1);
>     clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_2);
>     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE=
_1);
>     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE=
_2);
>     /*
>      * Make something to figure out what the ideal parent rate should be
>      * and test that as well?
>      */
>=20
> So if we set child1 and child2 to 16 MHz and 32 MHz, then that exercises
> one path through the clk core. However, it will currently fail if we set
> the children to 32 MHz and 48 MHz. I have this working on a WIP branch
> and one of my new tests looks similar to:
>=20
>     clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_32_MHZ);
>     clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
>     // This should test that it's a multiple of 96 MHz
>     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE=
_96_MHZ);
>     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE=
_32_MHZ);
>     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE=
_48_MHZ);
>=20
> Based on the work in my WIP branch, I think we need to make some of the
> divider only clk tests parameterized, and have a table with various
> specific frequencies so that various edge cases within the clk core are
> tested by the frequency combinations.
>=20
> I think that instead of having a list of DUMMY_CLOCK_RATE_XXX_MHZ
> defines, a single define like this will suffice:
>=20
> #define clk_dummy_rate_mhz(rate)      ((rate) * 1000 * 1000)

So, my main worry is that I'm concerned that some tests will only pass
because (or thanks to) the rates we've chosen, and not because they are
actually passing. Kind of like what happened with your earlier patch to
change the rate clk_recalc was called with.

I have the feeling our tests should have caught it, and maybe it's also
because we're missing some coverage, but didn't because we picked those
particular rates it worked by accident.

Maybe we should start using parent_rate / X in our assertions instead of
defines, or come up with better assertions?

Maxime

--j2s7e6xz263okgjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhdKQAKCRAnX84Zoj2+
duslAX45mPHHS5X45hack0b7fMLLs1OKrfgfGRRaEODzcenZ9Dm+73LMSfVWocAH
hJNwmogBfjAQMTk5fuR8HC+ytmd+Vwo6SubV1eqorqAYEQ7M+W1emUb74VXOlzP4
pDAxYq7SrA==
=0Zjj
-----END PGP SIGNATURE-----

--j2s7e6xz263okgjh--
