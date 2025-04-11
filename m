Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89642367DD;
	Fri, 11 Apr 2025 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388754; cv=none; b=NdrnVPT5B2sfIWArAG+1XgVodpvntzVaANcnE6gSNNMgvS4dPlPxi9ekXEeD/cDFz6lujVvsNrE+n/aCTQY2j6+VlU1zICyzbLerXchRUzjplfatB3nKmNZtNpBrP9pO/6ogANU8AhFu1j/cKDZaW5B0Sc2giacp2laPcrGu04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388754; c=relaxed/simple;
	bh=IbMPUMiRgDbJN5mpv1wHxB3TJALuK+hzkSmv68laefY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUNaOk+F8i5F09fgOtIae3N85Zl58kn2O/U/v5nCZ1k1z60Z9dUNuAggazRhBMekspWd4xlAI66FzvYvFpYf8dptKZUpOU0Vyla7oHVslFGxolifdAgC/CNt9FMK2LxwN6QBUvlX01kzQl65XKZyQsom3QtGJbYTGOXSgg+GfQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3yuqv8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3yuqv8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C037FC4CEE2;
	Fri, 11 Apr 2025 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388754;
	bh=IbMPUMiRgDbJN5mpv1wHxB3TJALuK+hzkSmv68laefY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3yuqv8fKUi5nha3YG/pWqLsM2cDkpVSnuQa+L7k2Rux6xvFYPpr2Jph4j2/k+YmF
	 EarVHrIbYbWwvpFYfnEwNkacVuiUq4cUfRCCAufG0lDvJy8siTghBvZ7JqOAkM6nVh
	 XEXt9qX/1RJjKzJM1g87mzpcD9sfw9mo1joWInEcBskl3GDe6hKOWKLzC5CLoOSu2g
	 1t59A5ekBnxygRD7ywtwzhD4clEGePSR8G5tETGv83oxMBUv60FwHP6QkBCSeP8lKI
	 v+IMzqOXnUwg9qaalr9RzWccUFNYFuIc3bREgHYBUgX16jU/+dmSbCudN4H6Io+E5y
	 2Zz5XpTo/cBqQ==
Date: Fri, 11 Apr 2025 17:25:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN
 EIC7700 SoC compatibility
Message-ID: <20250411-backward-mountain-3dd2b913f9f9@spud>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfCbZ/DX2h4jl3k9"
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>


--BfCbZ/DX2h4jl3k9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 08:55:14PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> This cache controller is also used on the ESWIN EIC7700 SoC.
> However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
> So add dedicated compatible string for it.
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

This and the cache driver patch have already been applied.

--BfCbZ/DX2h4jl3k9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lCiwAKCRB4tDGHoIJi
0r0TAP9/Xe91SCCpsd+5pjIflb9aHhJFCLjbG5kJPXINt8lY4QD+JSZmjbgPp37B
aixKMKnrSHweJ/BUODIZMYhcz4HmfQM=
=3dNx
-----END PGP SIGNATURE-----

--BfCbZ/DX2h4jl3k9--
