Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D67221DA8;
	Thu, 12 Jun 2025 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742548; cv=none; b=AevXEY8JI6tILE/DyaGmoG2m0N9dFYLjMZ2a3wKW/zMe54E4ICytpoiTWUk6UvI6RLdpRaIQC1ZYKATqBjtqhDvHHbWLM8YDeF7lg1XrORZyQGUlebyw4MktAxONSHjjlOlxcC9wb79qX1McpXaRJafYODGg/8SfvGrA6B5ZGYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742548; c=relaxed/simple;
	bh=Ss4ahYRx/y3pjwhd7QqlDK8uOFCu1jOBr4RPH/Ks9bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVQbd8KR6zjzaOqcXrVgfGMHe+Q9I3FD3sDLyDYuUuTeZxeh55NKK4Tjj8Va2a0ndmBjw//Oj0jcSDdyd9n9EOy2r1C+KHn1R8uJffEGz+SdBQObRxTR0ApCcwVGuUF+HqY8DHJRIEeQFj2lySn9442NcZtQqDmQKsrHYGJ9nXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auLrsJ/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auLrsJ/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2588EC4CEEA;
	Thu, 12 Jun 2025 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742547;
	bh=Ss4ahYRx/y3pjwhd7QqlDK8uOFCu1jOBr4RPH/Ks9bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auLrsJ/6G8/Nk8NFr4MskwcvM4uw4NObh3me2bKXsGlCE/GgINLIKEF00tdXKPUVB
	 pRQiVQFnzPl1vUEnTcGP2+vnUDPGIs8+YdOduzrw6hjkiy+R9/p5Ne8jDIXxbggupA
	 a7Rh6ZfP9wsYptqrYGlAzeYshwm4qkEM+NgAbI+Hybe6HrG/jmYqQalFfJaTI6urnZ
	 jqkff3rGnxDBUmgcYqvl7JyPZscCfAIPrQZ9B71mwDY7S0/bdNdSn94FmRkXrivB4e
	 S5F4eDy2/qSR/o0GPYpkq7JU4c0MwhUTVhiPh8Db9fb310HtxM24ewwB7CQCCISp+A
	 V2uBjTwq0HlKg==
Date: Thu, 12 Jun 2025 16:35:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v3 3/7] dt-bindings: interrupt-controller: add MIPS P8700
 aclint-sswi
Message-ID: <20250612-wildfire-ambiance-b4acbe3fff31@spud>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-4-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="68if0ZfXqCRI0GCb"
Content-Disposition: inline
In-Reply-To: <20250612143911.3224046-4-vladimir.kondratiev@mobileye.com>


--68if0ZfXqCRI0GCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 05:39:07PM +0300, Vladimir Kondratiev wrote:
> Add ACLINT-SSWI variant for the MIPS P8700. This CPU has
> SSWI device compliant with the RISC-V draft spec (see [1])
> CPU indexes on this platform are not contiguous, instead
> it uses bit-fields to encode hart,core,cluster numbers, thus
> property "riscv,hart-indexes" is mandatory
>=20
> Link: https://github.com/riscvarchive/riscv-aclint [1]
>=20
^ this blank line shouldn't be here fwiw.

> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--68if0ZfXqCRI0GCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzzgAKCRB4tDGHoIJi
0qQtAP96mQXSweUBXZh9o3rMkqZLrg/kAmO+xkB2lY/aAdpU9QD9E5LQRDJdi1Jq
Grs4zFK0xB6PMdtGGbxpWhfpr/KbfA4=
=We6+
-----END PGP SIGNATURE-----

--68if0ZfXqCRI0GCb--
