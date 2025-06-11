Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083B182B4;
	Wed, 11 Jun 2025 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658627; cv=none; b=pH4asdfzfGjpX5wjmQyq4BDqjokPw976b7S59JFeOeCTlUGRSlbpzKpFxzLh7/6tGD09Mj8yHRbnroSjP0JLoDqnh+kNXkfENz+LjaXjLBRcrYdbMp3YYFt/2dX3uR8YKlLEFDQJG5p/VZmbtzX6rS3z4BmXRLNRmAkoFUk4aLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658627; c=relaxed/simple;
	bh=9WqLpEYfcD+QLhrUn74iN5+OPqJiISIfCkK29TLRZ30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEF9RwLxNiVSruCrSPXn9ogPvuB6BmATdnDnrOVK+CJKoYe5WrZYNIm4HrwOS6OP4ARJW2fJyPI8Cmjldy/BLQ1d/LYK6OeM3ReQBZDLmWOK+QR+il9Hkz5lZrNwBfWGJISXXV2GNzJ6v+21018xzS94i+HQI6k3R12JqofLHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX5Y9v6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX5Y9v6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB16C4CEE3;
	Wed, 11 Jun 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658626;
	bh=9WqLpEYfcD+QLhrUn74iN5+OPqJiISIfCkK29TLRZ30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX5Y9v6LeSQKvbq/icf0BM3kfSjmvsyIMQP70Aoi/9VJhJbOd4SDlZS2QKLewojyG
	 v5iqUmNVZ73E3bLWCixjjRu+NAr6koYPohiyOtQDKtZ9HsfEVrjzChstwLoOZ78oal
	 491bZ1r4gZUAu/IjUFce5XJQRr355ldkYWuToNy5AfxtvRoZsazQ2Rt0uc7MxcKMeB
	 f6xmSnkRmDMsdOWRV8M0fAp2+4z4EjW4GnmWqQl3yfJ6P5nWXaDz7zJjd5gN2opytC
	 pTOjxHjipSzP/YalsKXihfpHX55JdmcP1VpqObt5tJKVXMkQKPznQNaRtA3lF36sDR
	 TGLYad0a3xWTg==
Date: Wed, 11 Jun 2025 17:16:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
Message-ID: <20250611-sprint-playable-07774a23f027@spud>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-9-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfZ5oRqjm3LAqNK8"
Content-Disposition: inline
In-Reply-To: <20250611062238.636753-9-apatel@ventanamicro.com>


--BfZ5oRqjm3LAqNK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:52:23AM +0530, Anup Patel wrote:
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
>=20
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

On v4 I said the tag I provided was for all binding patches.
Is there a reason, other than using b4 to grab tags, or not noticing,
for why you only added it here?

--BfZ5oRqjm3LAqNK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmr+wAKCRB4tDGHoIJi
0kujAQDLET9FZ9Gc8aN2OlODGIIifyLalFZ9jfQUhim5Kazv1gEApYD2AXEXq+/U
2d795Qo7pM/xNs/jCWwACDW+0un1SgI=
=4cmR
-----END PGP SIGNATURE-----

--BfZ5oRqjm3LAqNK8--
