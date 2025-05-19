Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9D1DF273;
	Mon, 19 May 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667633; cv=none; b=WjFb/wYxxE7RVYyB0Wrha1xxhJzXpQb+eBmFNxubIjAKLvBmIsoI09IBm5BHfStbhR/rHPhGDo7H0E3zMUfX5nOar52xSSxOS6Oc/2Jt4qDH5t1JqpbeP0bDRxJH0Uwhmd/JUQEyPtEvDMQs1snA0DvrH3CsmhR273zZ/Mnq0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667633; c=relaxed/simple;
	bh=Q9LKuooXrzGHQU5apnOQ8oee7U4B4rgxUBwxG8Elpsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k53odfDNV1QVBq9K3mADJn5RJYo2zqSHEmcBJ+bc8y5Q9Lvl82dDft62CAw2HKApZ0FE4dchsA9O3Hes9mZE/jd9MevpAYutB9DXrekRdEsE34Gs4CHUZSs473HH5z/LE7DXoaH1Nxi7zK7wiN224fUII/fPfC8BGfDzhB/Bjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK2PeuCC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK2PeuCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D20CC4CEE9;
	Mon, 19 May 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667632;
	bh=Q9LKuooXrzGHQU5apnOQ8oee7U4B4rgxUBwxG8Elpsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EK2PeuCCXN4Qdn0HbjIA7O/P1dkPFcR1Y7vHXymEBT3i9FmVF9FW3ZIBd5Y7FMWiC
	 nTv1vl7VjFJSKkv/Rf6HdVfDR5i/tjM/Tn2kxLkpefymn9mhz08Xn6riygcRsv2lxh
	 EXJmtBQQZhyY8xvdL+aD2kwFGwxN70g2fU92DScXGvhUuoOAoVfZ6EcuU9yh5LFBYH
	 vvd5lODD7L0FSVyG+7lq6saVXLdeA5FXPEoyBbWG/1wFdkg6ZsGTjHRdGIldv47Iiq
	 6r9h2fthwjA/bRjzTsYzCdcWilZFasK/sI8Pux0R6IaiOCYNcnnJe07jsj4a9h9pPS
	 v7DsGsW+HIKqg==
Date: Mon, 19 May 2025 16:13:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250519-amaze-sloped-9e7d9a63a1db@spud>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
 <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="080sWU4ve0SVO/mR"
Content-Disposition: inline
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>


--080sWU4ve0SVO/mR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 04:12:13PM +0200, Julien Massot wrote:
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--080sWU4ve0SVO/mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtKqwAKCRB4tDGHoIJi
0qBfAQD5AkEyB+46Q6g6BR2qh2MvFv0Vgj3nU9m2wiWm30jWFwD/U53P7fut2kFs
/C+1oDJOzggWHzy1BqdNCgr7XWppCgg=
=1n0W
-----END PGP SIGNATURE-----

--080sWU4ve0SVO/mR--
