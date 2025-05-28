Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBC174420;
	Wed, 28 May 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439970; cv=none; b=A2Eo0kvZOeTBkHfpCM1i5H4N88Q5DSy+EXIWYJghSeXukXtZ2EFdCRc521qosxqSmpPq4DjjYFXtrgQiD5HIRX0MbjErpcQkBsG3Txmkm7ysVx/8DMFcM57nQVYVtqCkrrpriechl87pWTPMvuvOFDBvGtmkuaDC6JijNk4gCh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439970; c=relaxed/simple;
	bh=oq6Fac4wS0SHANH2J2t3p21BoUKhwTFerUYFaLqweXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnGTjRU5ZeTrEhwqJh0uHYc5ECpvcnQFoXZGTJliwrAGNL7PXXzD+Ph8jxFVxmTgtaImoadVzi2PuFlPd5q9rttE48HM/PQVJv0kJ27BAOaquWSOVIS6YqVgfq882qknOAW2tfi7msytwpaWcA3DRnefFI2kEnI7LdrCm9kxMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz/vjLJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz/vjLJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F8DC4CEE7;
	Wed, 28 May 2025 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439969;
	bh=oq6Fac4wS0SHANH2J2t3p21BoUKhwTFerUYFaLqweXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz/vjLJBco5Nolft1Ameracr5zQZuWlEjDpRrZfwHbbD1CdFkvvu7lcYeOq8Dm1iN
	 jIRW6PW2JF6IRXEBZU5XemKRYa+DIh+K9Xen+vwLg14fNQpziBW3M3gKUNKlWdc2Pp
	 vIGsAXGkw4opFX2GH41OOq8IWSrAttIbQbyD6cS1Clirj4qJ0EDFgzBoQuDcA8a+Cp
	 s0LpDAOSuYh8g0XACgKgFEhHAwyICnrve8/hboDl5wKMyTJLZs4jZ6IB3RBeg+VM3Q
	 eeit6KsvBpRXCw9DHZ7jFkfJ+I/5S+Yhh/Eq8jApLuptSeFLuUWUe9l1qQHGj8pmxz
	 FTvC+hUjrxyDg==
Date: Wed, 28 May 2025 14:46:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 0/2] Add MT8189 jpeg encoder and decoder compatible
Message-ID: <20250528-energetic-voltage-b02704c14df8@spud>
References: <20250528095748.17485-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv8zY9ORmuVZuCZ/"
Content-Disposition: inline
In-Reply-To: <20250528095748.17485-1-jianhua.lin@mediatek.com>


--vv8zY9ORmuVZuCZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 05:57:46PM +0800, Jianhua Lin wrote:
> This series is based on tag: next-20250528, linux-next/master
>=20
> jianhua.lin (2):
>   dt-bindings: media: mediatek-jpeg-encoder: Add MT8189 compatible
>     string
>   dt-bindings: media: mediatek-jpeg-decoder: Add MT8189 compatible
>     string

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vv8zY9ORmuVZuCZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcTmwAKCRB4tDGHoIJi
0sGYAQC2bzGNx7UyUv973y6yM7B6lHc6xUzFs1DLjDP/D/+C4wEA4pyq+WoirUwj
3RkNS7UtPhUxDGsw7kjuGUrdy7EvEQs=
=pFRV
-----END PGP SIGNATURE-----

--vv8zY9ORmuVZuCZ/--
