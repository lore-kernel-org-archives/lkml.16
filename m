Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC71C28E;
	Mon, 26 May 2025 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748272960; cv=none; b=lK2yjZglXcEE6f1TM/sIHyNt8aGJb42vCTKLGHD+srVZBwPnKbZQhyChCFWDHInUNOTaJDl9pQTdM4OYNxUHKTIzcqPoz6A7i4I+CMAYaAc1bkNugL3yPFAeu+fazZ0r/+OXbDYddP5RO8VWlhXE/ObyB3DunnI3TTLVz7MJE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748272960; c=relaxed/simple;
	bh=M1N4V+Fwx+IL5CSJk2Y0BFwILOwBXrEPkVrxkzfT1Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkNicyWudczct4A7rl7cgLhyfJDqNMLBRek4MBMDv3v6Q5zxEyrDp+xh4B4dwqr8jzZGfC/LX22v1GV4QRPYxKyP3FyUHtbaQf2AtWpYxb8C4TDvRJScVknGaexlKBOXclZb/Av2NlsQizEs5FrTSHJdFyewM7PV+2vKUAb0CBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lw0PwEY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lw0PwEY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9723C4CEE7;
	Mon, 26 May 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748272959;
	bh=M1N4V+Fwx+IL5CSJk2Y0BFwILOwBXrEPkVrxkzfT1Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lw0PwEY/lhbo4YaQFtpGh4Se4Xhq96mS+TclBA8SejedO29AiALBU5IDFoDAvxWNc
	 yywkDtyRpw7g/5UCJA1/fDkyX6HeqvMVr2IDmQWwTULxwXnggvuOukS9WSbaIZ6Vla
	 n6Kdju9jlPPD5F4YLvVcPUHwbKy/+K6mKnD7maGweAQMtBdKWJbXU9cOjEWg/7k32I
	 +iXlaimqDryrTRv3rNfF9h++eUkMpesgmzw7Q7qxi0dkub1Wf0993MtOEVVGe2T6Im
	 SZtRE+tR0UcPTlAhubATakkETx+vfAnMOSVAsMX/nVAOkJd7qOfw/6O7iAPVBH9f1d
	 NgBN5PN0z9U+A==
Date: Mon, 26 May 2025 16:22:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-ID: <20250526-stardust-thread-7e7b01207c42@spud>
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xLBWFn4PwdP4NJNT"
Content-Disposition: inline
In-Reply-To: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>


--xLBWFn4PwdP4NJNT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 09:18:20AM +0200, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
>=20
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xLBWFn4PwdP4NJNT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSHOwAKCRB4tDGHoIJi
0kqrAP9P27Up9bcaa3+2hLLmZ5yxCEzS4xRHKgr068SqyWIdfQD9E1FV9+rSmlu5
DN6kyFXEVUwHOzxfQLYNZUKuivM32QA=
=+flX
-----END PGP SIGNATURE-----

--xLBWFn4PwdP4NJNT--
