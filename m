Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE125291C;
	Thu,  8 May 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717197; cv=none; b=c4ifebtPBEGlxn9thxixcdD5BbwO59BRT5rtOOAl5VdH5rENv5Lo3Yhmw3tH5Uubcc43P0P3HJtmC1uQcEPvlRUuDW9dJi0feROwY3qeDaqNgRQUxhC13DG9NEs/UbWBpeIE6hwPIai+ZaIG2L9vR44Jo+D655YnEKEM9aGcM4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717197; c=relaxed/simple;
	bh=EhxkiRkA/dJEtSpxpXcb2z+sFr0qOmbcUC4g8N7f23M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh8kKHiPGZ51Dn8dgu4RRUY4kOdLu1QysTQPNRBFRXukAbvGI3zGK8vEZC4OsEvIFk1C4Hwvay4V/XVNd1RFBSUagnbW6ZtP/2xfuKxENMnHffis1nVapc62DjlBNxmCHn+PbF5LcNbZEn3pv+4Z2mT88gVVkvfmzrh6P/eDQSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPnTA1Wz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPnTA1Wz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6C9C4CEE7;
	Thu,  8 May 2025 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717195;
	bh=EhxkiRkA/dJEtSpxpXcb2z+sFr0qOmbcUC4g8N7f23M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPnTA1WzHdkvw3r7TKb8RZmnQHLPevPj98fSJybVESgphcCs5vdEdMYDvV0n2wsMu
	 cp3Vj2s+yh9/nYGbgXg2Ah4JcqFdzuyz4j/mok+vr99SZBgPzBF6r5y3M7vDr8ZR/d
	 PIm4ISusC3AMaDZV2mU8IKyBPEK1bb93hQCaiFbwsSA5VtkJNSz3r1dboWivlpI+Mb
	 Fj8Z/7CcBpM9HCtOAuZWRjPexsrNlTowNm6LGRY8NFGQkrkVRTIjMnX9SWsojlvD1a
	 S9oqaLdT/oRaanQKDfYdq7kWOyE8Uo0Esx5kEgVF4RW2qxjTFGzvP1+VexU94yvABx
	 3NTKfGBSdfzgA==
Date: Thu, 8 May 2025 16:13:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards
 from Theobroma Systems
Message-ID: <20250508-wrongness-alone-0fa99ee91b2c@spud>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-6-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RygXSkiMF273WoCd"
Content-Disposition: inline
In-Reply-To: <20250508150955.1897702-6-heiko@sntech.de>


--RygXSkiMF273WoCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:09:54PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> PP1516 are Touchscreen devices built around the PX30 SoC and companion
> devices to PX30-Cobra, again with multiple display options.
>=20
> The devices feature an EMMC, OTG port and a 720x1280 display with a
> touchscreen and camera
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--RygXSkiMF273WoCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzKBwAKCRB4tDGHoIJi
0kVgAP9H0qZrqI/23SFHXMeBsME2dzsQGKGhc8nyBgN4GIPRzQD/SvRuXoEC0+lH
tnSDJUIDm/BnABVZNw7/2NFcdCInfgY=
=pPjZ
-----END PGP SIGNATURE-----

--RygXSkiMF273WoCd--
