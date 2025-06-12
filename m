Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AD298CB3;
	Thu, 12 Jun 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743925; cv=none; b=h9WNuAFATzNMFfJjMFmUmHcv3wGiL4B1ekgAaXO83HbpOeq2Cht0KGlKqKNDGqeFqbqH6wEARdfG7eLQC/kfG+Hn9HL8tKD18GC8QmKz25dZlpVIeQrZOZVE4WIw0xvIBq8gNM3mdFhU8XVrFlMzTX88uxPRzloXl5+s/a08az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743925; c=relaxed/simple;
	bh=Y7GeWw59ZemDS0hMwBwc5tqTiUWXS+EZSuykH0gjoBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv/MHK2SsougUqBUpnQm7RWfeWL0O0u+qlslx3+tBkN50ZBaEoO4JgUdrmP3ggraO/r+ii40uP5x9nAfAtDnMpxiQ5Aq5YtjS7vNqyOAI7tczMA0kX2NDP/SQyECAXVO86glboOHeWkI5S99g1EZK6pagOLKxVMkx6+KyP+lRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/szzcdj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/szzcdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F4CC4CEEA;
	Thu, 12 Jun 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743924;
	bh=Y7GeWw59ZemDS0hMwBwc5tqTiUWXS+EZSuykH0gjoBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/szzcdj2ikGb9JZYEidUMorZoo+YqXPebhsKAzhYjNKTpdFLhEFc7GhN6XhZzmtE
	 PZQuwdtU0UOdAVlOnBb8JhEUcebhhEtxT9/I3Xo0Qh9hvXKSfSvupfHg5Vs02N9O8K
	 3PUoy4Rsivldeu1N9upVgUQnliFkVxEhyhKUYPc/JiHG2LAdTuBxZIdHQOTIDGDt2k
	 6b0EHu32mbkDTZ9sqMWs2bzZbyiq+V3r7SkvPmjvSczPzfDXjSVhD07sEjoWcMvGTk
	 PUtyLLfL+5qHpKNgbiu8egMl0gAr4ozXsmGlrI0z4bj2M0OxrxLOW6WSX2sgDzboA/
	 IfPlZZfMHxz4Q==
Date: Thu, 12 Jun 2025 16:58:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <20250612-specks-banter-adac9a126ec4@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
 <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L5iTnG89HErv1R46"
Content-Disposition: inline
In-Reply-To: <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>


--L5iTnG89HErv1R46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:30:17AM +0800, Inochi Amaoto wrote:
> On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > > Add top syscon device bindings related DTS change for CV1800.
> > >=20
> > > The patch required the following 3 patch series.
> > > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gma=
il.com
> > > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gma=
il.com
> > > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gma=
il.com
> >=20
> > What is RFC about this?
>=20
> I use RFC to ignore the patch check, as the dependency are not merged.
> This series itself require the binding from link 2 3, which provdes
> binding of the USB2 phy and DMA multiplexer.

In the future, please provide a reason for things being RFC in the cover
letter or patches themselves.=20

--L5iTnG89HErv1R46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr5LwAKCRB4tDGHoIJi
0mGpAQDnw09DkwnV3+Zok+5PspuZAWYTNAerifzajZnqmaoz7AD/b884Kd2PmZjN
NnGFIdPRk6I8/JOMNJOqYsUCSqSRTwY=
=8+LR
-----END PGP SIGNATURE-----

--L5iTnG89HErv1R46--
