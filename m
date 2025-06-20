Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7157FBA1;
	Fri, 20 Jun 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429070; cv=none; b=GE6qH6yE+LFyOTnLdxKJ4THXvqao4fm7vvtH0ZDcPZ0idPDGuHJANMh++ZVInInfgmac3M/lzrv+5ZxIZC3sZxGIyHelLz3i983zLGbEUidXwYDFvxWVRnbnzlD6DW6ggET1oH6Sn34FMJE+Oj0sOvRr1x8YRnl8T+++5tU9jnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429070; c=relaxed/simple;
	bh=KPvCPPMWre8gKapQM76kxEQscahxubiK8cL/rbbJAJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpV6Ld11Tu4tFM8ubBW7kw6NdgxsI7/64g9KfSqaWHyvxt4E3mJsvWgxczSYo9PcU4AENLBsEkaoOwVN+cIE9qRedOkqKMpyWyBBTtJQhlp3xS6GbAHPOWQPkRctZ8NdEFQxGaMIHhmMN6vpwT3TW2h24/xdH1CiGT+v6yDNJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZ6dtslt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZ6dtslt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA07C4CEE3;
	Fri, 20 Jun 2025 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750429069;
	bh=KPvCPPMWre8gKapQM76kxEQscahxubiK8cL/rbbJAJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZ6dtslt1Jp1miZRnCWarasA8latQYl4eaUeiJtcB+Y1xKJRFhFVBgbCzQbHIU5Eg
	 1AGTgHQsMWbcEZHFOvGO1nzvREQGdk9aFQZX0JUvnOt5B7aqHnez1Q4D0Y4MTfFZOG
	 KX97RGf3+fP/1p2q4A4GzqS4fKRobS9PuG2Fg9Psjsy9LWeRS+i4GzQal5Dy2UgaCB
	 Z5QiOogQ4tTyYn7kp4JwYhgrEH3nr1Nh4nXXVrEDiqJ1Fyxs52NPzZkjB5OwSMCNzf
	 PyWTUYk7Eh+JHeab3hvB/8LfhhC7wl2evP58goaLbcSwpyXaxmpudoVWMnC7lbH0AT
	 OSarEjQaX9Dwg==
Date: Fri, 20 Jun 2025 15:17:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing
 PPU0 reset
Message-ID: <20250620-stegosaur-subpanel-08403c80910b@spud>
References: <20250619171025.3359384-1-wens@kernel.org>
 <20250619171025.3359384-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P4JxWVq/o9oAhrtu"
Content-Disposition: inline
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>


--P4JxWVq/o9oAhrtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 01:10:24AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
>=20
> Add a reset entry for it at the end of the existing ones.
>=20
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner =
A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--P4JxWVq/o9oAhrtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVtiAAKCRB4tDGHoIJi
0sy4AP40BvUBHSqm1o/Bhr3FkdlzzrUWaAqywLNNtJtM6Hr3aQEA5Bxl0ai6zPbt
VeUnc2rD5TanorWC6N3/LX2DWqEu5gw=
=hFhO
-----END PGP SIGNATURE-----

--P4JxWVq/o9oAhrtu--
