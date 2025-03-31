Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9113B59B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423364; cv=none; b=JnyiVX2wvwQv+Gd3a6s2tVm/jjf1yBlivSjcRmHmMFf4Km5Cs5A7QgO/Um4GDN8Vf0ibv8aJC9cscDM0DtqqwzMCvaYnN34AD/UtgWKFDbf1F+mb3B4khj+xnsr5vO9519ilS1hDaNR3wV+Ir+HzOPlm/Kbg2pjr0AFeRDyqVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423364; c=relaxed/simple;
	bh=wUTUKz+IrV1b4kGMI/raV5aXx1ThKF09bUAHq2ryA9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3d6yRTxeB1fKH/K1qTLK4gF1K67nZTg5e62gKXicPeLwOAOsnVW/y16TGQ42IBl7HQ/BRBligT9iuboApZyYMyJfAK+c0dM3s3pJcMiescB00EFdCOOUyKVO8MpSRdPMNf+noQClDTJVspIub6U51FheWImq+04wFZq413oIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX1qncjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX1qncjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD11CC4CEE3;
	Mon, 31 Mar 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743423364;
	bh=wUTUKz+IrV1b4kGMI/raV5aXx1ThKF09bUAHq2ryA9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX1qncjjatxJmBWPzqGePwqdfI44j7y9cGite5XzwPSG5jEnYCOD5YbKalNjj4djQ
	 Vlm9HQoZj9mR06Q07vqjONNPMhw/kSxXBP9RKNS6cOwNxX7a49IjBkukzEq1WnTiMl
	 EdUEbF+4j32ZoSLvOho8nBjjZ2yZulyk2ph1qXwyi0ATFG613bYcKHbX9qU8cLhc25
	 8KiYLYAX2e7CTk6q2zWtAkxDHrffQN8kMbs8+34dBkqcuzc4YAZ0AMqEPlJzmrUEnG
	 J8MTZZ/IRcHvSnPWCF8g06AyCUDAu+YLzt13kN5l4vuj9ixDJoYj7IXmSPWJxKnMou
	 uwBvUu0mF/yLA==
Date: Mon, 31 Mar 2025 13:16:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Witold Sadowski <wsadowski@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] spi: cadence: Fix out-of-bounds array access in
 cdns_mrvl_xspi_setup_clock()
Message-ID: <4f589f15-7531-46cf-9ed9-0e4c6afdcda3@sirena.org.uk>
References: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>
 <gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YKhR3hbcL3sSR/FU"
Content-Disposition: inline
In-Reply-To: <gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs>
X-Cookie: The Ranger isn't gonna like it, Yogi.


--YKhR3hbcL3sSR/FU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 28, 2025 at 09:36:30PM -0700, Josh Poimboeuf wrote:
> If requested_clk > 128, cdns_mrvl_xspi_setup_clock() iterates over the
> entire cdns_mrvl_xspi_clk_div_list array without breaking out early,
> causing 'i' to go beyond the array bounds.

> -	while (i < ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list)) {
> +	while (i < ARRAY_SIZE(cdns_mrvl_xspi_clk_div_list)-1) {

The usual coding style would be to have spaces around the - here.

--YKhR3hbcL3sSR/FU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfqh38ACgkQJNaLcl1U
h9A2AQf9E9/9Vc7Zl0gW/VCRfB4ZvGGgmhvpvg5qrsQRAMlne1vxkd3C2tzk18QR
oQBwmeUECptEnhWuErwZ7qse8vYtuJcACJ1on8OlTZOtR0HkLLQFwVyt6mQHHwlL
1FLAcTZ+4FMLx1fn2FMhSkx1Mydye7a+IkVtsWpPnuUrKntCRjxQkPoRlLhblyW3
rJmPvMvVDGfbUBZztwmpRS6a/aFfesCVmIshD3oe0lSUNv6Jni3ejvaAydgEojHq
AktvqrOjvfVnqNKMoicNL+3SFimdyIH8hBSmtG14VMne7ENva5niRlrDxlN61XnK
PtUw5jSgTFFqeSePtSo0/+GAtzjd8A==
=vOsi
-----END PGP SIGNATURE-----

--YKhR3hbcL3sSR/FU--
