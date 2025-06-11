Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB715A8;
	Wed, 11 Jun 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658506; cv=none; b=i6NuK6+TiubESaXIpMAVx+M+7g7B7tFpuzgz3oNcAS8UeFKME2Wp5jUa7XZ/FeGt26ANV3NUUPN9/LIDvhnu+A2Unmo8hVapRfNTfH9eiYDWXcYmR1X+0/DwM0mVzlydfNE3IbncWuP+cO39eJ6w7RokFRKac5U1bblb2TD7vew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658506; c=relaxed/simple;
	bh=O9MOBWHvWZ5MN0ix5avPsdQVSs2Pd615xfzCnOn1X34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0ai3LOy2AXSAs4vNZFEDyVeFkyV8hXLAThOIP0AxR0OPb1EbaBVcSUwkGGVBWZyEFeOIgEctKcj9h84bEra5hW18Y25ZKhA2ueGsr+S40Zm5DThm6aypjZNMY0S2YwOst1aVKu+AfhF9Sp2g73L0aSevNzpP+N5UjXqbBjFN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCUZmOVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCUZmOVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B25C4CEE3;
	Wed, 11 Jun 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658505;
	bh=O9MOBWHvWZ5MN0ix5avPsdQVSs2Pd615xfzCnOn1X34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCUZmOVOhAomOZhebCoHlJAVMUeSTmncz16T0PwafTIuwYEXqioMK49DZFFjThD19
	 D7kjcJ/VF4nLxxCid4Id3aQC5LQhit7BSZsTY0xTNeccjhEnc5d72DTpLuoRsj2jQm
	 /fZcSjgP94qDmWt1OR5FzNyNTNMF+Cr8q0qBrt9TWzuykR4dPZGgFRzh5wa/pdLsT8
	 oyWjbH0WBVIqoFS00TyVfnI6UtOzBf+KQj4h7DUT9rZl6kKqp7qak5Ax8vtgCqbJQa
	 U1g+ZxJ96HsoirQNOrIKfq/UCwkhOWc+jf/L6gA1Vwcmwp1knTPmELuifkyDyo7I9f
	 InHgJCZJmVcOA==
Date: Wed, 11 Jun 2025 17:14:59 +0100
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
Message-ID: <20250611-doodle-storage-f1f23230adee@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4ajHlLW4CTqOoSC"
Content-Disposition: inline
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>


--l4ajHlLW4CTqOoSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> Add top syscon device bindings related DTS change for CV1800.
>=20
> The patch required the following 3 patch series.
> 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.c=
om
> 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.c=
om
> 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.c=
om

What is RFC about this?

--l4ajHlLW4CTqOoSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmrgwAKCRB4tDGHoIJi
0oEGAP9CowrUU72dQHLlJwso523NN6agE/wQrGVa7TAkoMkGHAEArgoSYWu2Xe+n
LLB9vYJIT+FexWc/jyDGiCGXj/Dn/A8=
=3V/H
-----END PGP SIGNATURE-----

--l4ajHlLW4CTqOoSC--
