Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CF487A5;
	Tue, 11 Feb 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291506; cv=none; b=lkwQB2CxgyCxLbnMdTPwDIFjx+33Sre20mXXSTy1QYCC8jcxCubpfY+l4ttlSx0jyy5XWcFADVtCAG5R6cUH+JqWzk5f2boOubpG91k5p2OtvpnZoqUDs7jEpKr7+cqpwmf9OyTmnq7jQgVuX1MFSc6Rzj0ZrYMxcvnbj/hkq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291506; c=relaxed/simple;
	bh=WHbx8D8WKN6+hpRNEmiKZwqpTFCaWvjmIP7bdWyOoLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqdclYBWXqQO+sEtcAG38UnPUEwqQjdEJfQFyxykrSFJJexgm4z6EpgfzULyTlWYRa/qOcBtgQvhnNPSixEl1RK58DWwfbomcfLVsZeVYns3KNuZHiD/HWm+CCpUHr8tslrAojfx4rs6bSPQsSXMYyiOmC2DpUh8EXbU2pQYDFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu+SaWGt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu+SaWGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C19C4CEE6;
	Tue, 11 Feb 2025 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291506;
	bh=WHbx8D8WKN6+hpRNEmiKZwqpTFCaWvjmIP7bdWyOoLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu+SaWGtRx2DxB5TRikQIrRVEXZdtbv2SAdm+F7jzHTlPPFUw6eIa6qAab/DcbVh0
	 5y4R/ZqyyauUi5Yn6dlugqGJIFIIqfeAIOVylT0UUL9y9cBO/dxOPe5KW7bd2CJDiB
	 s+F6ti0cYo+quULaBGjEHbPRcN2vbH20R2retDttaaZb3B2S4XnXzmPq5ztWmkpiqi
	 kfKu9c9WlICgSEABeRo8IxZDS9Jq7WmKV2MBVDM53eMeMuvXyTyPNd03ZgfmynHHun
	 Of6jP+D8O2nWAkHK99qYzsIFxP+I9HsMmmji/XshKPXdCBoHw7aC6J0Z/UsxQffB9X
	 jJVTGBlbvFWqQ==
Date: Tue, 11 Feb 2025 16:31:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8370 SoC
Message-ID: <20250211-sculpture-kindly-f609a5bfdbd9@spud>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
 <20250211-mt8370-enable-gpu-v4-1-77deb7a75c23@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NPhV4nCHfXvnVdVx"
Content-Disposition: inline
In-Reply-To: <20250211-mt8370-enable-gpu-v4-1-77deb7a75c23@collabora.com>


--NPhV4nCHfXvnVdVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 03:13:08PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> None of the already existing SoC specific compatibles is usable as
> fallback, as those either do not match the number of cores (and number
> of power domains), or are for a different GPU architecture.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NPhV4nCHfXvnVdVx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t7bAAKCRB4tDGHoIJi
0i+cAQDYKv1HrAj7IGdLB1J2AnBE7+u3Pb19+VvVkXzP4xD9MQD9ECsECRTHxV1D
II/TJXxFDRi2ikkrxmF2acujkXxITgg=
=KP0z
-----END PGP SIGNATURE-----

--NPhV4nCHfXvnVdVx--
