Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856F275866;
	Wed, 14 May 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235673; cv=none; b=cFhYo2DL+ZNBwgqQUKW3X4yuTM+J9odSjJmJc82QX+3kYtRLLaOQSLEbkcat76Uyy/uY9JdpQWvoCVyBqsuo7qpkgFx0JcLOnPtEpVtVMqAnTVhIiQaHdT8YsPP1ECobAokbElfzVn2WwkYiIS3gI5FLEo6nA0blgVuru2Rlvs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235673; c=relaxed/simple;
	bh=dLC9FGNy02pDL83tAaPJ87NrmGoBZGcsUzjb8XxGGNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLDakCYyfyR8MEpotR1zVfNdnIFNrOG9ZY2jyZEc3X0pBdUJbGHWbtTOLNPZLGcwMVyAD+UP5D7YlW2HKh1mdz/dFnUVY0jk4qpFWZ0D5kukzE3iaa1URfoqt1Ocu9iY3f9ZD9mS5J5nrR5zhtHNhcPZgJQQvPDCNd0I0JrtYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIsCCnkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIsCCnkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAD4C4CEE3;
	Wed, 14 May 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235672;
	bh=dLC9FGNy02pDL83tAaPJ87NrmGoBZGcsUzjb8XxGGNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIsCCnkYpMWRtgCuQ3NFvMu+EM6eBuTQd4/ta+3wVQ6TTWIdcUylOtLpkwwZyxitX
	 q7LiHj5+rDSZ4YFHvkIHCZRR4qRbZWZe1LaAWwEj2967aZR7IMbltvSElc2wV6pSrd
	 /3wYFs16JBeHJBokX3dMCFd/64zzAs+SeCroZDGIg2iC5jCqYvlo4wWxVVIBkOqowu
	 9Et6lw3xW8OIm6D73GH0QSPjTFlRGyNZ3Atzu+SgEdtmfAQQB+SYr6VHzJQX2Yk7oo
	 PL7sDdebc1aoK4LfnAQ5whrdw/zjJlivgcptMl3yHe+8aynTAlCa9NoQBs43zHpkWy
	 jUui5QRzIUmTA==
Date: Wed, 14 May 2025 16:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: mt6357: Drop fixed compatible
 requirement
Message-ID: <20250514-unifier-drone-9e50962071ff@spud>
References: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N++8apABCTdwFzjN"
Content-Disposition: inline
In-Reply-To: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>


--N++8apABCTdwFzjN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 08:36:06AM -0400, N=EDcolas F. R. A. Prado wrote:
> Some of the regulators on the MT6357 PMIC currently reference the
> fixed-regulator dt-binding, which enforces the presence of a
> regulator-fixed compatible. However since all regulators on the MT6357
> PMIC are handled by a single mt6357-regulator driver, probed through
> MFD, the compatibles don't serve any purpose. In fact they cause
> failures in the DT kselftest since they aren't probed by the fixed
> regulator driver as would be expected. Furthermore this is the only
> dt-binding in this family like this: mt6359-regulator and
> mt6358-regulator don't require those compatibles.
>=20
> Commit d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed
> compatibles") removed the compatibles from Devicetree, but missed
> updating the binding, which still requires them, introducing dt-binding
> errors. Remove the compatible requirement by referencing the plain
> regulator dt-binding instead to fix the dt-binding errors.
>=20
> Fixes: d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed =
compatibles")
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--N++8apABCTdwFzjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCSzUwAKCRB4tDGHoIJi
0mJuAP9B/4VHGsZ0X0xndPuB01QdvWEoq6ZF6LCGTnGqk9VovQEAzjrQLtDlhNVH
A9jrFDYDFsPGw/EqpX0665ygyUQ18w8=
=URej
-----END PGP SIGNATURE-----

--N++8apABCTdwFzjN--
