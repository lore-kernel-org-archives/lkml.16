Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5E26157D;
	Tue, 11 Feb 2025 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299618; cv=none; b=brLD1oJ8lHaj390TERXSw0KjW6nSL9ZPOmixyomW+SdIyL9X9+p7e2xpFM/ZPA8PzARF2Yqq5yeIJPPiCeQ4EY82+OAX0nQPTO1/fqgvuYiMa5OGUtT4BDk72Mi8oxZuSQdyXTTe1ESGvUYZbpvUAz3j/acEobhwF5FsZmf0NIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299618; c=relaxed/simple;
	bh=1tmYJwzpiN82GM9eC7S0KdCW2m2qZCsDfpaJowDAzto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqWGUxQ8dUjhxoYBGcDPBnYwFJAH1jQMjRDDOAITLtmxd5OJo4h35hHAF7g5Eni3GrtRri3sNsijSWUkZrgFmCeSvtetdOl4K7cOTCDyzF7sbCnGAoTnQ6SOTfiKChSCsmdo7gc0vxNjgEDh3m5G2NaIn2sRzz48tLjA++vW4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3vHm80V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3vHm80V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE34FC4CEDD;
	Tue, 11 Feb 2025 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299617;
	bh=1tmYJwzpiN82GM9eC7S0KdCW2m2qZCsDfpaJowDAzto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3vHm80V1MxuMz39kk4NM3szzMx4rPzzpzJotXcuUGH1lNYPtr1/oNQfbTpmBxqSn
	 yyIhrhosdxMk1GpUczZiiFJeVj1TqHuY98YF26akFbzplQhjXQXaXw+SoHf7ADsuOn
	 6CovGx+JH+3xYSPePtXxkPS/XstrF9VgyWbcIOkuRJi+fcAZ6q3IRvwhknLgvcJrLQ
	 eWEDPG2Tdw0UUgnEpEW+/EIqPnOrwWf9ushBGXa3DAzvJpwpkUX0zLOJxIaqitcIto
	 2Su4xegMFmqsDKAawORio6fpzyRFohGe42nYAELKovZkjOXbMii0TUjslLOv5xuEDo
	 ttrVwZslzkgFw==
Date: Tue, 11 Feb 2025 18:46:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH] dt-bindings: arm: ti: Add PocketBeagle2
Message-ID: <20250211-pegboard-dividing-24a17e921e33@spud>
References: <20250211181839.1575497-1-robertcnelson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dYxPXg4CmGsnpMpq"
Content-Disposition: inline
In-Reply-To: <20250211181839.1575497-1-robertcnelson@gmail.com>


--dYxPXg4CmGsnpMpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:18:38PM -0600, Robert Nelson wrote:
> This board is based on ti,am625 family using the am6232 variation.
>=20
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
>=20
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dYxPXg4CmGsnpMpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6ubHAAKCRB4tDGHoIJi
0srsAP0Raa76KzHP+t2mgKgp6YI9TNmYt2kXcJp0WcLoGAIXQgD9GaqOVcAWXDOd
Yu4ORkcOtXC6NV57PqJssUkKe9nyAgw=
=Y8Ed
-----END PGP SIGNATURE-----

--dYxPXg4CmGsnpMpq--
