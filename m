Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9CC25F793;
	Fri,  6 Jun 2025 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200415; cv=none; b=WyYsWckDQzhFzBDB8iBHFkZlVo9p1zunYZ8ULUBZeup+IbwgdL2Gpy0TTBjIJ2GhDQ3RSziKVXsrltfb4r6sDcbmPygMBoztQk1I6OHttyncHJoxYoEl20qNOjlzwPZUcdmMTEIhejADroYwaK06OzK2sLTr1de2gV6HNH56i00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200415; c=relaxed/simple;
	bh=xNHwIpVHeWC+mE1P2Ks1p+kDy+CdkMZCOyr72R8daRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtMTsEKtILe4RNXtbcpj77sv2HL7Ca5/EArfagyk6gYm1LFY1s6o68pa1eQC5Ttc0oGaV9IXKsaQHEV31RTKmgNf98LDcTJuKiteeaYX0TnUlxm9L7vMLx8qoGa3VxdWEO2Epf20X+s3sVBAp0CzRVCzPz9xcYWtbunt7yFXcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDyefeYI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDyefeYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DC8C4CEEB;
	Fri,  6 Jun 2025 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749200414;
	bh=xNHwIpVHeWC+mE1P2Ks1p+kDy+CdkMZCOyr72R8daRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDyefeYI157FNH1aszpofzkfeeMkkuM1s9Z1o7gBDjducPeG0nAxFkO4y5gunuDG7
	 ogXA36f7wH53CO3U7nzv1p/9dfz3RiN1o1RgyRpLD/L73poLScECVIfuj8EZCNTv3p
	 zYOyzqTKKea8twIq/Da9YgjuGt5nSnPPkZFuD4om6yIDPTZyp3fRFgMD6AsIsvjWTu
	 dVCbMOJ9oBkp3GmQyLFL6x99yU1m3rJfbmy0jXfag/5iGJ7V64SoNs+HG6wljSpqvZ
	 rx0eF6cFVuTqcsoBBB8RqJWCyTVuxFddCxnZhx/kIijf1Fxe8qGWk+9kgUW7EbXQ0N
	 GJNEiHv1RT+Fg==
Date: Fri, 6 Jun 2025 11:00:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 04/10] clk: test: introduce clk_dummy_div for a mock
 divider
Message-ID: <20250606-screeching-pigeon-of-judgment-dacc1b@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-4-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="exdw6jl56rzsynhl"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-4-0d2c2f220442@redhat.com>


--exdw6jl56rzsynhl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] clk: test: introduce clk_dummy_div for a mock
 divider
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:50PM -0400, Brian Masney wrote:
> This is used to mock up a divider in the clk kunit tests.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 1b34d54ec9c610ffa3e91b06f5a5180e0395e26f..4908fb9c0c46e34063ecf696e=
49b48510da44538 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -140,6 +140,47 @@ static const struct clk_ops clk_dummy_single_parent_=
ops =3D {
>  	.get_parent =3D clk_dummy_single_get_parent,
>  };
> =20
> +// 4 ought to be enough for anybody
> +#define CLK_DUMMY_DIV_WIDTH 4
> +
> +struct clk_dummy_div {
> +	struct clk_hw hw;
> +	unsigned int div;
> +};
> +
> +static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
> +					       unsigned long parent_rate)
> +{
> +	struct clk_dummy_div *div =3D container_of(hw, struct clk_dummy_div, hw=
);
> +
> +	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
> +				   CLK_DIVIDER_ROUND_CLOSEST, CLK_DUMMY_DIV_WIDTH);
> +}
> +
> +static long clk_dummy_div_round_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long *parent_rate)
> +{
> +	return divider_round_rate(hw, rate, parent_rate, NULL,
> +				  CLK_DUMMY_DIV_WIDTH, CLK_DIVIDER_ROUND_CLOSEST);
> +}
> +
> +static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	struct clk_dummy_div *div =3D container_of(hw, struct clk_dummy_div, hw=
);
> +
> +	div->div =3D divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WID=
TH,
> +				   CLK_DIVIDER_ROUND_CLOSEST);
> +
> +	return 0;
> +}

I wonder if we should use CLK_DIVIDER_ONE_BASED too, that way we would
catch any improperly initialized structure.

Maxime

--exdw6jl56rzsynhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKuGwAKCRAnX84Zoj2+
doDPAYDyd2YH/7g4mNgLjfHV9eB9s2Tt0o1q2WR7+GtOlW32oMr2LKAx2/wykc71
o0VyCsEBfAy/YwfHxrcWAZzNulk/TchV6luX5ADYTKAUrs/CMZzoTSoK8s75HJYa
KLT0qgmOcw==
=B35y
-----END PGP SIGNATURE-----

--exdw6jl56rzsynhl--
