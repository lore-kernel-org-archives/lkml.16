Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F326272E58;
	Thu,  8 May 2025 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715225; cv=none; b=L2EUG8VI0ZGf4qVxgsi1NEYZro80QxwFvQGxfaI19Cq2B86fOYZB3opKgK/sjhvQjSQ3vd8c97grLSiI5Dh0KH5Mm6k2NhetyiI6v3DaOFXBHfTJpYU8AMd+OGzF/ZkdTT51X6ov9gVZ2CWpeB67QEYYHAa/6A5MIKMFfIyjMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715225; c=relaxed/simple;
	bh=oOkN9eTtHAZMv8eJ38WFaxwihMyuyCmS4TLnJR5DMHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD9u2rkJuSsBuLbchOFlLsX900f8BY5lTWo3k9LX8GCwRzDEJ+4/RrQGcSIuMd5msT91/WX9tQho4Hrjr87vQLOVMTVE4SGwdHZmbnCL6eu2bJSXpFrK1dc4QcYxNyfpFURYufkAQN3rpUfZ/MF7xJujS/5pkx1b49MMyVz02cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNa7OPnX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNa7OPnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A055C4CEE7;
	Thu,  8 May 2025 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715224;
	bh=oOkN9eTtHAZMv8eJ38WFaxwihMyuyCmS4TLnJR5DMHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNa7OPnX0CNUOKdch145DwLMBBih3ivsZMalyTflGD5v8ZZ5mWZ0flgsPMyUIc5Oc
	 /KLeEBbJEsXmQhSA0u/zVVyAoyTtSiyrwrkBEuW87wpHz1edTx9IBUr2wgtQIpVO/j
	 bil1wqHIn4drBTAmODDg3iteAIacLy+1xKEqblmhms419aj4dOSvM4okY4oRj214JQ
	 Pe/QGWGevMKnUhigq5gMyamppHwr8HnRMNFddQMjilB6K5tAULGIjnR0nITYBYDqlT
	 8SQztnBdqDOwC3Iedicxyk/DF4PQaep72gI96JUu4YmLKItcZPAkid/+38+IeCXNry
	 TbJP3A7gdTTuQ==
Date: Thu, 8 May 2025 15:40:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250508-subprime-maroon-e3563cf5e5b2@spud>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bPcc+DbOY/gFaVyK"
Content-Disposition: inline
In-Reply-To: <20250508134332.14668-4-ziyao@disroot.org>


--bPcc+DbOY/gFaVyK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 01:43:30PM +0000, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bPcc+DbOY/gFaVyK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzCUgAKCRB4tDGHoIJi
0hLfAPwNSAKLDOq1qwBiOVlwMilxhkuD21shzglKBEL/f5NaYQEA2CiDGljsLFj3
OXBTVzoRp1PjafMIGQle3ENwjj3vyg8=
=kdEO
-----END PGP SIGNATURE-----

--bPcc+DbOY/gFaVyK--
