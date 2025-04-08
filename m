Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC470810;
	Tue,  8 Apr 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128580; cv=none; b=gTTFJzBLZe7uxui601UtcGdCu83WKgwxsNJgl42id+GT8aL6LWicBSj2ndcz6Y3LhX5NEuPE1eAuEN9hwb9tBD0qozWdWiYilKBMSLn+zzVTZpx0quFrcG9bgvwCOEGrbbzdy2CgUyZk3w+6OJ4S7I1SAMxHvvF5utU7ZeD3nKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128580; c=relaxed/simple;
	bh=3WRYZ3ZZhmqV9utNFcmHEl9F2oSBkHO11gXq7GCdU/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf5ndXjM1XwVCcpmh78zGuIPunQEInuyuldNey6qqMt1ujeB+3a3us0xu8Njdi9qI4mGOUiZPDKvBvfXcH4soSGaKa34V+KOpVlvQQQBuuZ8nXu5fdkhzF1myetwFKG/6xlwaPV+j9an2SwbHdKH3/ji61CeyCYWul+Y/iohcJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryesXsKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryesXsKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16387C4CEE5;
	Tue,  8 Apr 2025 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744128580;
	bh=3WRYZ3ZZhmqV9utNFcmHEl9F2oSBkHO11gXq7GCdU/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryesXsKKfay2Qq7nNoLcyLhXadAsq5+NP7clKzMGvoPrscCIq6X0uozXMytaE5LyE
	 PKOnMv2nsjybjrEvNzvrVbiQrGi35HKK+H9MvtMMu06GH9wPjGIUs+qucg9OiBFS+C
	 8sY3WmgQPs9Mz+4DFjTzdtVfj2R+dTicBEyQ51pg+N0GqZnj23Oi8HEEJGz4i0BAvM
	 71dhdFYW9E412fbDQ6zzv0VyDnZrk9n/+t+oJqYPO0USsweYfXK8MKoIgUJ7aX0Lnm
	 +ihh5WpLIKhZCilzpJTIbFiBJMGAN4LDQX56lWOYWKZpsg3IOKbrvVAmCZr1OpdHjV
	 RQRzb1XUJKCdA==
Date: Tue, 8 Apr 2025 17:09:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/14] dt-bindings: mfd: bd96802: Add ROHM BD96806
Message-ID: <20250408-darling-recant-170b05eb0daa@spud>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <3c245cc3829dc64d977c97eae7ae8e2be6233481.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WCeI76TcsjAYNSZ7"
Content-Disposition: inline
In-Reply-To: <3c245cc3829dc64d977c97eae7ae8e2be6233481.1744090658.git.mazziesaccount@gmail.com>


--WCeI76TcsjAYNSZ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 11:44:24AM +0300, Matti Vaittinen wrote:
> The ROHM BD96806 is very similar to the BD96802. The differences visible
> to the drivers is different tune voltage ranges.
>=20
> Add compatible for the ROHM BD96805 PMIC.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Lee Jones <lee@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--WCeI76TcsjAYNSZ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VKPwAKCRB4tDGHoIJi
0nwWAQDTYE8W8nYFmKBXFqtzcTCOcj50u6jBfNvxHoyTdcmfQgEAytDwpK/ZT4tD
dE4280zJ3J9PNfFHAQ3xlliNijJe6wk=
=jOVY
-----END PGP SIGNATURE-----

--WCeI76TcsjAYNSZ7--
