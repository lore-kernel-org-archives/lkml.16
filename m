Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D828A413;
	Fri,  6 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224634; cv=none; b=XyxeZyCIE5lXv6brClUoROIZr/SMgNBU83Empts/fL7iHpZfh9/jsfB2aMZEZe/pquvhOCQVv4iYvx/KfTPNrS7jPujP5n4JfuQ6h6o1/gdkiBRCvDKYITd9w6O9CI37Ansz1UeaE9wHghTd3+pZhAMxyVpMTD+v5Zj9xj+lTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224634; c=relaxed/simple;
	bh=iGO8SORWMUFTmXITj8rFdTt1r4Y7ccbtUi/G+XcmSPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUkESuXle3bcXzrPguCWbXSGER1DqRUrPcrQSdejSTNpxGFQPa3z/W9y8C4t89V1Sz6IAA1QgjJ/I1Bi+lyQmi/BNH65NqmsFjoDHf06+gWMe/aPNK/dJrMFpvQDw141Ukbz4qsaHlv2wAbM8dCZZ0VnxQ+YFStTtJMjjgWrLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTss1BfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTss1BfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306E5C4CEEB;
	Fri,  6 Jun 2025 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749224634;
	bh=iGO8SORWMUFTmXITj8rFdTt1r4Y7ccbtUi/G+XcmSPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTss1BfYfzjfeaCqJHcIk9rN1rVP6zXkr1BE1bV8Xagd0K1cu1pVspxN6qSManx3u
	 YDUt408omxAIU2Mkz4EfnaJAMVRhaSx2BiS1lDp4KDyO9eEzDKNXXcfI3F67xyEwX9
	 33HLAp1gkNbRkWgEcEvjtoDcnfEG5hk0gtz9wCmcUynJgftSY9yI0sOsudk8pqMbTP
	 EtXYjQ6UOh/tESGOEf3usNNX8t1mKGJxekjDwLMyGIrxWtRxvDdohG7vhOJYitGZ1L
	 qNVyQkNhYqBh7VqbIFFojGffPr3LL/OV9obY09apIGhNI4y32HtjTxwA/kQdQtetGJ
	 4q6zcBsugBs/g==
Date: Fri, 6 Jun 2025 16:43:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: jagan@amarulasolutions.com, neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt-bindings: display: st7701: Add Winstar
 wf40eswaa6mnn0 panel
Message-ID: <20250606-copious-cubbyhole-28f5b9ad2e8b@spud>
References: <20250606114644.105371-1-eichest@gmail.com>
 <20250606114644.105371-3-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HKMTKpwMG6GAESTE"
Content-Disposition: inline
In-Reply-To: <20250606114644.105371-3-eichest@gmail.com>


--HKMTKpwMG6GAESTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 01:45:51PM +0200, Stefan Eichenberger wrote:
> The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
> resolution of 480x480 pixels.
>=20
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HKMTKpwMG6GAESTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMMtAAKCRB4tDGHoIJi
0sZnAP0YfqTWoNBCd0YPO96H53A8CzEWr6Lzx1kGpGPNbT6O0AD/UcDVG79r85Mk
+8pxO2VNo4Vjkv73P8wTe+vfaNevgw8=
=CCyf
-----END PGP SIGNATURE-----

--HKMTKpwMG6GAESTE--
