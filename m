Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08001DEFE9;
	Tue, 27 May 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349413; cv=none; b=RBHron8VJTfKTH36bNJN2Q9Lcri1N4+l73+691jjiHd3/6mqkLAhMZ74OFp3f9+hnekm7ELbBhfvtbTXz5+9/Dh4LI3/JWKkqkaXd6zIRPGySx3bb8zyIcUJGhcWAw6Bi1sFgwCW36oYW2OavxOmICxDmzeDRT6nA/x7x8xZKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349413; c=relaxed/simple;
	bh=v6+ZJLma28oFvSPBb1ehwurXq11We1UdUZlskqjpsW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN2UWOQvV1jSzCjSRaxa7xWZ1WrNgSOBSPTsitpfVfdtzwNxp/5AfPvcquh3lREnjNwkFxnL78lPyTP2OG58elR4qdgseubhuxBNk3diECc+wvXaQJAVgeQTpT7Re4cfbueES+dxNkKEMHfWOIhYbQiJ3GYqy8TJogeP266vkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLjor9en; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLjor9en"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEA5C4CEE9;
	Tue, 27 May 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748349412;
	bh=v6+ZJLma28oFvSPBb1ehwurXq11We1UdUZlskqjpsW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLjor9enfF36PhqcRQxq+k9oIF/xwVp3DNj8m/zXzjdetPPTDd4gubBXXNDupvIn8
	 df+t2LvSEalT0v3pxMEcnoCJKmZriLJxC8hY84tJ2iI1gGicXUmLHESWoafP+9wG1H
	 0TIQ13PuzSggZyr8QuBY8BAnWL0hkhCc8hxmKA8KaSUxM7fbVi/oGxoQi7tWrHu7L/
	 vtlXJ+JwQdmVrNJ3Qso19L9bJHXweYMzMgBNQqhxPnkxg0pdzKIepiE+4yPqzLus8s
	 IhVchdy0Q9wz+JSFiw8cgAXW7veWwd5u8Y1MTAXJySLvqS1bZSs0EGESCzzzOG0Meb
	 P927R0k1N0t8g==
Date: Tue, 27 May 2025 14:36:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <20250527-incredible-shaggy-stoat-8a5ba8@houat>
References: <20250520192846.9614-1-bmasney@redhat.com>
 <20250520192846.9614-2-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="u7hasxzct2ec4dyb"
Content-Disposition: inline
In-Reply-To: <20250520192846.9614-2-bmasney@redhat.com>


--u7hasxzct2ec4dyb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: preserve original rate when a sibling clk
 changes it's rate
MIME-Version: 1.0

Hi Brian,

Thanks for your patch

On Tue, May 20, 2025 at 03:28:45PM -0400, Brian Masney wrote:
> When a clk requests a new rate, there are times when the requested rate
> cannot be fulfilled due to the current rate of the parent clk. If
> CLK_SET_RATE_PARENT is set, then the parent rate can also be changed.
> However, the clk core currently doesn't negotiate with any of the other
> children to see if the new parent rate is acceptable, and will currently
> just change the rates of the sibling clks.
>=20
> When a parent changes it's rate, only ensure that the section of the
> clk tree where the rate change request propagated up is changed. All
> other sibling nodes should try to keep a rate close to where they
> were originally at. The rate will go through a recalc_rate() with the
> new parent rate, so the rate may possibly change.
>=20
> This doesn't fix all of the issues where a clk can unknowingly change
> the rate of it's siblings, however this is a relatively small change
> that can fix some issues. A correct change that includes voting across
> the various nodes in the subtree, and works across the various types
> of clks will involve a much more elaborate patch set.
>=20
> This change was tested with kunit tests, and also boot tested on a
> Lenovo Thinkpad x13s laptop.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf..713d4d8a9b1e 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -72,6 +72,7 @@ struct clk_core {
>  	unsigned long		rate;
>  	unsigned long		req_rate;
>  	unsigned long		new_rate;
> +	bool			rate_directly_changed;

I think it would be worth documenting (some parts of) clk_core. Starting
with that new field looks like a good idea.

>  	struct clk_core		*new_parent;
>  	struct clk_core		*new_child;
>  	unsigned long		flags;
> @@ -2254,6 +2255,7 @@ static void clk_calc_subtree(struct clk_core *core,=
 unsigned long new_rate,
>  			     struct clk_core *new_parent, u8 p_index)
>  {
>  	struct clk_core *child;
> +	unsigned long tmp_rate;
> =20
>  	core->new_rate =3D new_rate;
>  	core->new_parent =3D new_parent;
> @@ -2264,7 +2266,14 @@ static void clk_calc_subtree(struct clk_core *core=
, unsigned long new_rate,
>  		new_parent->new_child =3D core;
> =20
>  	hlist_for_each_entry(child, &core->children, child_node) {
> -		child->new_rate =3D clk_recalc(child, new_rate);
> +		/*
> +		 * When a parent changes it's rate, only ensure that the section
> +		 * of the clk tree where the rate change request propagated up
> +		 * is changed. All other sibling nodes should try to keep a rate
> +		 * close to where they were originally at.
> +		 */
> +		tmp_rate =3D child->rate_directly_changed ? new_rate : child->rate;

There's something I don't quite understand here, sorry.

new_rate here is the parent rate, but child->rate is the current (as in,
currently programmed in hardware) rate.

> +		child->new_rate =3D clk_recalc(child, tmp_rate);

And child->new_rate is the future rate we will try to enforce when we'll
actually perform the rate change.

In the case where rate_directly_changed is set to false, you thus asks
for the future rate a clock will have, using its former rate as input?

I think that breaks the rate propagation for all the
rate_directly_changed=3Dfalse clocks.

It probably works in div_div_2 test case because you're using an
(implicit) divider of 1 for both child1 and child2.

So, child1 =3D=3D child2 =3D=3D parent =3D=3D 24MHz.

Thus, child2->rate will be 24MHz, new_rate would be 48MHz, and thus
using child2->rate instead of new_rate would work because we indeed have
the old parent rate and the new child2 rate lined up.

But from a logical point-of-view, it doesn't really work, and I'm sure
it would break some platforms too.

My understanding of the clk_change_rate logic is that you would get in
that test something like:

parent->rate =3D 24MHz
child1->rate =3D 24MHz? (it's implicit, we should probably improve that by =
setting it and using an assertion)
child2->rate =3D 24MHz? (Ditto)

then with the call to clk_set_rate,

parent->new_rate =3D 48MHz
child1->new_rate =3D 48MHz
child2->new_rate =3D 48MHz? (probably, since we keep the same divider)

So we want child2->new_rate to be what child2->rate is (or better,
req_rate if it was set, but we don't really have a way to tell afaik).

Unfortunately, I don't see an easy way to do that. My first thought
would be to use clk_core_determine_round_nolock() with a clk_request
with new_rate as the parent rate, and child->req_rate as the target
rate.

However, calling round_rate or determine_rate might affect the parent
rate, which is not something we want here.

Maybe we could clean up a bit req_rate to turn it into an optional value
(either 0 or a rate) that would allow us to tell if something has set
it, and if not we know we can fall back to clk->rate.

Then, we have a useful (for this anyway) req_rate, and we could add a
flag to round_rate and determine_rate to let drivers know that they
can't update their parent or parent rate, just report what they can do
with that set of parameters.

I guess it can even be that we convert everyone to determine_rate, and
repurpose round_rate for this?

Maxime

--u7hasxzct2ec4dyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDWx3QAKCRAnX84Zoj2+
dpNEAYC9VZ5mGWQJ8A2NZFTlAAnT3nNQFgUdxtW6U4AGItyLJUjXS4QOZyHxnnZs
OvZzQ+4Bf34Q7U8goA3avfHa6O1Ia0m2oiEwbpFG1KJ/GKDyHtmVy0kIvaxkYPJ8
D+mE/aq8Xw==
=IYrL
-----END PGP SIGNATURE-----

--u7hasxzct2ec4dyb--
