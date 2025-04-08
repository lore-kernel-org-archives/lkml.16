Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4722ACF1;
	Tue,  8 Apr 2025 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128695; cv=none; b=XazFxQJVct2tEeKFrlj4nV8bimpcb4GIxEIRB8D8TKNPFbHbyV3YyI0ilpzpTop30Et1eRQJ37rbR/7bEvgs54gc8vihF1HWGXLqljDEyY7u1ctd8j/nb+mslxFD5T6MIpvMgRK3gGixkwB3J02YG3HsXlUcu9LXUb+OrcB3PeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128695; c=relaxed/simple;
	bh=dr6BGFM6xjiTGSy4biZqFkFFoAz71aC0x/hQYvJLh3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeUJtY9jXwh0sIY/ZluEwgIU+6aYqRD4+dCaxGG6e+DGhU8ignwdMHhiV7aqI6fD+MdaEp41MhbLCc+QprKnKiiP3mknW8og1X+ibI1Sxt/aiI12GDSG5TicP1Furb1xRUGb8Fqn6dTFlRMF52CUG/To8JuQmBeBjc733DaQVbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEE7TnzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEE7TnzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E380C4CEE5;
	Tue,  8 Apr 2025 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744128694;
	bh=dr6BGFM6xjiTGSy4biZqFkFFoAz71aC0x/hQYvJLh3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEE7TnzThL5obJGUGGgMbdLqwyhJkdT10Mmd451QBNKeShopYfUzIQx7ae3R3oRP7
	 2QcInWFrzvp1b7c7R3i5OJBT9z4NWWCj/eQDKWrF8NPRTP+S5XnYl+Thhk3sk9nJUl
	 WtJH/+hShDVT66C18kl4DQbpwwAJNla6DWPwTTuxSyMizz1MW/QMOE8/lRdZZBMhAA
	 DgpnLF/w2DJP7j4F4Eg2zJIQvQc/ECorxIUZblmajXA1lVNqbu+58MSQJ9Gxg644N6
	 MgHm//DZn5RWYY4Ubpx8/p4kjqQ06ByZP/jVHjbLff6wS4qR0KGeW4DAp/aRcNIsJL
	 Um64S6G98HnhQ==
Date: Tue, 8 Apr 2025 17:11:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/14] dt-bindings: mfd: Add ROHM BD96802 PMIC
Message-ID: <20250408-atonable-evolve-bd5fdf1c14e0@spud>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <ed55edffca3b0a2d7e8bcd9ebd8d8abd9a9b7dfe.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GMod9BGrjR6suPrL"
Content-Disposition: inline
In-Reply-To: <ed55edffca3b0a2d7e8bcd9ebd8d8abd9a9b7dfe.1744090658.git.mazziesaccount@gmail.com>


--GMod9BGrjR6suPrL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 11:40:56AM +0300, Matti Vaittinen wrote:
> BD96802Qxx-C is an automotive grade configurable Power Management
> Integrated Circuit supporting Functional Safety features for application
> processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
> interrupt lines and has two controllable buck regulators.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GMod9BGrjR6suPrL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VKsgAKCRB4tDGHoIJi
0tmFAQDaXkSaj+qv5IaE/+NWosKo+JfJJKDLajW0yimUhYdHCAD/TJ4jqvAdyDbM
r1vK0CUqL68ttc+I2b3msbyTNxWPHgM=
=aPI7
-----END PGP SIGNATURE-----

--GMod9BGrjR6suPrL--
