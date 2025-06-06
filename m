Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC86265CC5;
	Fri,  6 Jun 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200134; cv=none; b=Kb8wEO+X4yIriVrePoOoTHNwOsR/GBNSl61VnLrE7mEi5ICdQbqL+n4xDoGJhTC1bEVwGf7PE9Q+52GuAzo121qdyG7Npm7cs2B/EiIjfxcb2qvvSgdFewoB8bNKnnBqXKvjMmvomcs3RgzPekTlkiz+oR/pOVYCFRFbuYH29/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200134; c=relaxed/simple;
	bh=PH4RRYCty1gEBXTDuKyPYtf1YvofysFu4ZuG8vMd1U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twie2ULSinUNh1tewsEgcrBJsb+2eQG3h8Qv/3hEvPklyM8qTuPi6c2njcTsGHLT0MgkOvwF82pb7yIlrSNXLf88BOUv9B7DVPfXSapN6OxLyu4PG6YzVqakVlmX+PZA6DJoqlUJNjHHygXYdaEtjUIkokc6PR0Ma3oSQF5XQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ5Z9kh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ5Z9kh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7263FC4CEEB;
	Fri,  6 Jun 2025 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749200133;
	bh=PH4RRYCty1gEBXTDuKyPYtf1YvofysFu4ZuG8vMd1U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZ5Z9kh6+vecLMgHZBlOd+af5iW6EbSzH9ruDBBfaf7re/ZqowFYh1+Q66t+Hu1dC
	 GV7H9+wScvo+KpoL+x7chYi8mQkqDDI7GYQMkKhAAnlNWx8Xi8iPTJNo0n38NZ2MiM
	 Y5CjFUPbhKscUlH5IS4orXYiTgoX4O0BeVFiiMKM4yWzAxSeG0z5G79hRF50uaBPc/
	 pErqQX04bozlgmPDfFN7Ts4yHDy0C4CV90QWXtQ526P5nKyfQPrDg8sXbCGYQN4rRA
	 LorbIqsOVBD9LXOgKBJKw7Jzr5oDV+qgC7RB7hbVany8dZDr+Whhl+mkSuJkW1HvM6
	 nJDb4ZS69/p9Q==
Date: Fri, 6 Jun 2025 10:55:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 02/10] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <20250606-polar-scallop-of-revolution-dbf920@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="44qogzmlg5q2b4tl"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com>


--44qogzmlg5q2b4tl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 02/10] clk: preserve original rate when a sibling clk
 changes it's rate
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:48PM -0400, Brian Masney wrote:
> There are times when the requested rate on a clk cannot be fulfilled
> due to the current rate of the parent clk. If CLK_SET_RATE_PARENT is
> set, then the parent rate will be adjusted so that the child can
> obtain the requested rate.
>=20
> When the parent rate is adjusted, there's currently an issue where
> the rates of the other children are unnecessarily changed. Let's take
> the following simplified clk tree as an example:
>=20
>                      parent
>                      24 MHz
>                     /      \
>               child1        child2
>               24 MHz        24 MHz
>=20
> The child1 and child2 clks are simple divider clocks in this example,
> and it doesn't really matter what kind of clk parent is; for simplicity
> we can say that the parent can obtain any rate necessary. Now, let's
> update the value of child2 with the existing clk code:
>=20
> - child2 requests 48 MHz. This is incompatible the current parent rate
>   of 24 MHz.
> - parent is updated to 48 MHz so that child2 can obtain the requested
>   rate of 48 MHz by using a divider of 0.

If we're talking about theory, a divider of 0 doesn't sound great :)

> - child1 should stay at 24 MHz, and the divider should be automatically
>   changed from 0 to 1.
>=20
> The current bug in the code sets the rate of child1 to 48 MHz by calling
> the clk_op's recalc_rate() with only the new parent rate, which keeps
> the clk's divider at 0. Specifically this example occurs in this part of
> the call tree:
>=20
> clk_core_set_rate_nolock(child2, 48_MHZ)
> -> clk_calc_new_rates(child2, 48_MHZ)
>   # clk has CLK_SET_RATE_PARENT set, so clk_calc_new_rates() is invoked
>   # via the following block:
>   # if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
>   #     best_parent_rate !=3D parent->rate)
>   #      top =3D clk_calc_new_rates(parent, best_parent_rate);
>   -> clk_calc_new_rates(parent, 48_MHZ)
>     -> clk_calc_subtree(parent, 48_MHZ, ...)
>       -> clk_recalc(child1, 48_MHZ)
>          # BOOM! This is where the bug occurs. This invokes the
>          # clk_op's recalc_rate() with the new parent rate of 48 MHz,
>          # and the original divider of 0 is kept intact, so child1's
>          # rate is changed from 24 MHz to 48 MHz by the clk core.
>=20
> When the clk core requests rate changes, the struct clk_core contains
> a new_rate field that contains the rate that the clk is changed to by
> clk_change_rate().

I'm not sure we should frame the problem as "the core calls clk_recalc",
but rather that it doesn't call round_rate or determine_rate on the new
parent rate, so the clock doesn't have the chance to update its
dividers.

If we were doing the latter, calling clk_recalc after would be ok (even
though a bit redundant).

And calling either will cause other challenges, since they can also
reparent or change the parent rate.

I think I'd still mention that it's a temporary solution because we
can't use them yet.

> When a parent changes it's rate, only ensure that the section of the
> clk tree where the rate change request propagated up is changed. All
> other sibling nodes should try to keep the same rate (or close to it)
> that was previously set. We avoid this by not initially calling the
> clk_op's recalc_rate() for parts of the subtree that haven't been
> modified.
>=20
> Once the new_rate fields are populated with the correct values,
> eventually clk_change_rate() is called on the parent, and the parent
> will invoke clk_change_rate() for all of the children with the expected
> rates stored in the new_rate fields. This will invoke the clk_op's
> set_rate() on each of the children.
>=20
> This doesn't fix all of the issues where a clk can unknowingly change
> the rate of it's siblings, or put them in an invalid state, however
> this is a relatively small change that can fix some issues. A correct
> change that includes coordination with the other children in the
> subtree, and works across the various types of clks will involve a
> much more elaborate patch set.
>=20
> This change was tested with kunit tests, and also boot tested on a
> Lenovo Thinkpad x13s laptop.
>=20
> Fixes: b2476490ef11 ("clk: introduce the common clock framework")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index a130eac9072dc7e71f840a0edf51c368650f8386..65408899a4ae8674e78494d77=
ff07fa658f7d3b0 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -78,6 +78,10 @@ struct clk_parent_map {
>   * @rate:              Current clock rate (Hz).
>   * @req_rate:          Requested clock rate (Hz).
>   * @new_rate:          New rate to be set during a rate change operation.
> + * @rate_directly_changed: Clocks have the ability to change the rate of=
 it's
> + *                     parent in order to satisfy a rate change request.=
 This
> + *                     flag indicates that the rate change request initi=
ated
> + *                     with this particular node.
>   * @new_parent:        Pointer to new parent during parent change.
>   * @new_child:         Pointer to new child during reparenting.
>   * @flags:             Clock property and capability flags.
> @@ -114,6 +118,7 @@ struct clk_core {
>  	unsigned long		rate;
>  	unsigned long		req_rate;
>  	unsigned long		new_rate;
> +	bool			rate_directly_changed;

clk_core already owns a lot of transient data, and I'm not sure adding
more is a good idea.

What if we were to pass the initiating clock to all these functions, and
test if we are indeed this clock instead?

Maxime

--44qogzmlg5q2b4tl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKs/gAKCRAnX84Zoj2+
diY8AYCWS7pwIzBSS9M01hKxUzqVNGWJNH3B87XjCEU5TaMv4aAprDe1ggMqvJWV
SXnP+pcBf1KrSo5KE8o2/KMstLAwMHd12VUzh0DHaiOYWmsgMYx9YxjX2WaOQXzm
w3aXVKEeRg==
=hE+U
-----END PGP SIGNATURE-----

--44qogzmlg5q2b4tl--
