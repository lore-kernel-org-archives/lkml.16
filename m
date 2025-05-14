Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87019161310;
	Wed, 14 May 2025 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238382; cv=none; b=gpHbkppp74w2iwVPk/WVCaDAZBeNw29ZEzD+se7nuhwqL+x4SOc8cqEFCHB027JDJbJk6jN7Mv86yZ+icGVXsMcJcrkqkC7p2aq+K0QF7CytlzK+xh7tlXjzAbjKQSzKglmEbzh3M5jT45NRrrX7Zit/ohmDiIs6zwOp8fRlgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238382; c=relaxed/simple;
	bh=y7lI/EUSb1UnQsHiI7dhsmMP7inV1Q2tEA9azOkLIHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWzHtKsSi2wsBS6Hlqhrsfnrta15aO2cQvApQLvEwNQ6N5YECvETC5IZts4B/XqWoO2WkzNixgAUFvSx2pWb8/RMD1Vvzl0h4xRG8CgV+r+gIPTkZ+mceCqgGSZ45vyqq/FrLE3gDjRHVL9TW4DRSDd44yCcTAl9ZJnRa1eHN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqRXpvtM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqRXpvtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71BAC4CEF2;
	Wed, 14 May 2025 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238381;
	bh=y7lI/EUSb1UnQsHiI7dhsmMP7inV1Q2tEA9azOkLIHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqRXpvtM+aCchvhVgaI8UPqSbyWxbqOeyJxTrq+aZZRQIZBMoOo8tdKEuTIo95M/s
	 Pn40frK80HCGWRFgwNWfsQ1mJTucCSOlpmlHb654blx/t70VWNyls9hUxPjhTjDtBf
	 dyRaaUxX/gwGwORRA04plJL1qFaWJdEbijEcEjIsw6ligpJS+mJGj8aZQbiO0mZH8q
	 KTA274Fj0EO3iWdhSNCjlJRQING53jUy5AGAsDRBu2buOu5/g1QCH9ZSEKWf8L86v7
	 xNTmqZ57D5t9gx2MibL7ccuQRoNDt0jq0T+mh+3QwP6zHSf3R7me7/S+R2UWwfQSV4
	 M0BofCvxDEERA==
Date: Wed, 14 May 2025 16:59:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: Fred Bloggs <f.blogs@napier.co.nz>, Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Message-ID: <20250514-affair-reentry-8e444e692da7@spud>
References: <20250513163515.177472-1-i@chainsx.cn>
 <20250513163515.177472-3-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ACMaEZG5UXjrJyTL"
Content-Disposition: inline
In-Reply-To: <20250513163515.177472-3-i@chainsx.cn>


--ACMaEZG5UXjrJyTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:35:13AM +0800, Hsun Lai wrote:
> This patch adds device tree binding support for
> Sakura Pi RK3308B, with compatibility for the
> Rockchip RK3308 SoC.
>=20
> Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ACMaEZG5UXjrJyTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS96AAKCRB4tDGHoIJi
0rvrAP9oquino9oJcGaDDnOhQt80+WydCtQhZ8xc6BuMGbI1RgD9Fo88RXe8PJsi
2YQ6plMxSYt78zIfs/wnXeFYBl0wegw=
=QJPp
-----END PGP SIGNATURE-----

--ACMaEZG5UXjrJyTL--
