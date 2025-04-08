Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCAC2686B9;
	Tue,  8 Apr 2025 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110538; cv=none; b=JqRTJPLQL28r1mYztbr4ZTCt4ISeK8eKnhB27To5ML9pfRwEGiKMaK2bZFXdK/NL8UIKgfy+3XtMnURuoQwjIBU8CbpUbxdPjVfOTO7pGEbsvEKm+aqOJoe5QOAH+f3Tiha8zYi8/VgNZ3zy94QV0JLjhA7jeXq/a1uT6xaxWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110538; c=relaxed/simple;
	bh=Q9qhVI0VAXu8TAAa28jWHMGKiF8kAlOH841EdjjYeWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3jzVEaKuO7gMvCtB7dC5TpNmZmRGxbyM5/wWmVBVe2Z3Zc0HhXjZ7+ozq2TduGRgbyeidifrs9CbWLnzHjp+cpzz2DjLTH53BDGAHaa6zM5d9HYWkKWkkl5DVozuJ3urVc7Sypck5BDSM0ZrrjLYood2saSTW50HVQbZEMFVqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfLYF6uo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfLYF6uo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3F1C4CEE5;
	Tue,  8 Apr 2025 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744110538;
	bh=Q9qhVI0VAXu8TAAa28jWHMGKiF8kAlOH841EdjjYeWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfLYF6uonVzCl+5YV62WoOsQu1L1n3sxGoh4t8L4Go3e5nIi5HcU6P/JU/kFd/eci
	 H72zYs1zngshpn/qkJjjP+YiS+nbdeNtQuXxBNxG8Js+BLJ8e4mv2VxKAJotDv81a8
	 W7W6k1RmekDv7UiW73hsN1wckSl3nfvCd0kh+tVq2A0Aa9XgprABgKPwSbvZC1a1OV
	 t2UUMGaa4ZogPOG2eqKu1wZZLiBW9U4Hg4rlPpS2qNMxAKY8AElb1ilqWl/ImJRLtq
	 pscroOsGuYiL03y7jrvQn9KknI6EjVHoNyC/22602LYra8hfowQWaWHtb4xu+SSk/k
	 QeLfooM0WbxkQ==
Date: Tue, 8 Apr 2025 12:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] regulator: adp5055: Add driver for adp5055
Message-ID: <201f221c-1fc0-4a90-a2f3-7ae8dc31a7e5@sirena.org.uk>
References: <20250408-upstream-adp5055-v5-0-dc58d98a7a3d@analog.com>
 <20250408-upstream-adp5055-v5-2-dc58d98a7a3d@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="COwVgEfJDcml99cf"
Content-Disposition: inline
In-Reply-To: <20250408-upstream-adp5055-v5-2-dc58d98a7a3d@analog.com>
X-Cookie: Meester, do you vant to buy a duck?


--COwVgEfJDcml99cf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 12:25:49PM +0800, Alexis Czezar Torreno wrote:
> Add ADI ADP5055 driver support. The device consists
> of 3 buck regulators able to connect to high input voltages of up to 18V
> with no preregulators.

This breaks an x86_64 allmodconfig build with clang-19:

/build/stage/linux/drivers/regulator/adp5055-regulator.c:169:3: error: variable 'i' is incremented both in the loop header and in the loop body [-Werror,-Wfor-loop-analysis]
  169 |                 i++;
      |                 ^
/build/stage/linux/drivers/regulator/adp5055-regulator.c:160:34: note: incremented here
  160 |         for (i = 0; i < ADP5055_NUM_CH; i++) {
      |                                         ^

--COwVgEfJDcml99cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1A8UACgkQJNaLcl1U
h9AOIAf9H4Z5VTOk/dUuzFJLSjE6ZkxlYsZ9kBaOdF/1tZhKUTFVyLvtUTHEN0pf
orDYbwzIr3NYBva/mB3hZKpv3DNowvtflM9VhUdNZBPJM3ou6O3VbDF0c3VkxTaX
7sjGXHNwvUzq4IYIbkC5n/xN4OeinqMju3FNH1+OOfc76EpGD0WEmTvfSwp5/aok
JheOUS+lmyZlG+qn7L+tq0Iu1wtrG5fC3BnzZTkPeZfl2Db1A2KbFkzWlU55454o
IrwDYPw7gcwfpHBQKZmcqGYVFdT7m3tNsQqEwzS0P5JfGI8EVD4Us1bd5vTN1paD
q/6PZ7Ih9D64jxlQ1kYFPlY3toUX0w==
=EZ7U
-----END PGP SIGNATURE-----

--COwVgEfJDcml99cf--
