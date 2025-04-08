Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9D157A72;
	Tue,  8 Apr 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143605; cv=none; b=aHzIlYFVRrmlquzvoAk/TBmZ1vkYWqnCkzlTBIQNiWiSXufzaU+Wktm7rHL5/G3VHIuKAYUskUVA4hP7htKichL/vAzX3UdPkkPXLyuPc4NtFXha3KidjB1oxu/Z0l2t+6Ly+yGEO0IgIFvNfQVtmUe0rIdXbCdI5stUB/9evU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143605; c=relaxed/simple;
	bh=qUiB+hj1ouJgP1jVz003/Ifvs5LLe0bmr4Fmw1IXnaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcvG/hpY6W2gFa1IcPzb8OVkK1zcQJFyZr6qn5ugKjoevFp/CDzs6rD7EGtFh+DZhEPIhA+pjQ2g6Lo7DB6guFXDOx0N5J0qfqAA3OmeBHmNlZn9zGf/dvfjeqH9YU0BeQ7HDlsSN/ujVdMWKpELPPkIFPz6Qy3Kw16JA//JDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL7PH3Xc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL7PH3Xc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3942C4CEE5;
	Tue,  8 Apr 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143604;
	bh=qUiB+hj1ouJgP1jVz003/Ifvs5LLe0bmr4Fmw1IXnaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL7PH3XcJG41k8R1pqNrws2V5cmBLF2n/UNcGjRq2qu0bPUd3Pp9xwlPrjN4vgP/m
	 DW5Ty697yzFG2pOJR4wf9acGS92jhKWwTV+o7YGcKSnGwreJYlctA5UD+pRvfX1eY3
	 zqncCplWdpLtzOtTwM++7yil8q/SGVEvMJd91cXYmPF51IzvecwuZNp1mik22kdKJ6
	 EEd+wLGgIfv5AvDnGW+Zm3kHduHGEEVJdLeduldcz65QSwiLmRneXgTlcR8s3V1jkv
	 oAUAiXXereoGe04gR0fGtYRakmNftY4nZbfqKBiIP0Pkg9EOBB7LSuBj76Rps3r6Ph
	 cEzRDf9M7mocQ==
Date: Tue, 8 Apr 2025 21:19:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/14] regulator: bd96801: Drop IC name from the IRQ
 resources
Message-ID: <d69800fe-56f6-4b89-bb8e-56921e059af1@sirena.org.uk>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <73ec2425655ab19c9f0cf990419641ad36561590.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QstMvh6f04LH0Wzz"
Content-Disposition: inline
In-Reply-To: <73ec2425655ab19c9f0cf990419641ad36561590.1744090658.git.mazziesaccount@gmail.com>
X-Cookie: Meester, do you vant to buy a duck?


--QstMvh6f04LH0Wzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 11:45:34AM +0300, Matti Vaittinen wrote:
> The resources generated in the BD96801 MFD driver are only visible to
> the sub-drivers whose resource fields they are added. This makes
> abbreviating the resource name with the IC name pointless. It just adds
> confusion in those sub-drivers which do not really care the exact model
> that generates the IRQ but just want to know the purpose IRQ was
> generated for. Thus, as a preparatory fix to simplify adding support for
> ROHM BD96802 PMIC the IC name "bd96801-" prefix was dropped from the IRQ
> resource names. Adapt the regulator driver to this change.

Reviewed-by: Mark Brown <broonie@kernel.org>

--QstMvh6f04LH0Wzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1hO8ACgkQJNaLcl1U
h9DOSgf/T5fb1eAd4c/H8vV2askRmt1gcUcHBWqjJjm7yYA/5HA0kV1BLAVe1Iqn
Kv8KAYJER5fLytzdd9BmXLp8LvUyTvWUjaeZC9AQsMW+iZvimyasLiDfycNpc28Y
hctPYaqvxjnurWRayi4CdgWOvhXaQL6ed6Ta9S3cuNCGokLTnai8lh8rcZh/A8Hb
OeXGwjEu8cufYayKIQFIosAZcEEUHkshia+rs2g3wHiyLm1IpN2mEdSPbmGvsFey
gD8LfY5VQxZqsesNs8T5pCsBvVTZIAYSe03xlFRgqgRLowFrsbeVz9/6lvFuv61i
mOeW8tttWPrvCF/JMO+sdNvSKzux1w==
=tTSY
-----END PGP SIGNATURE-----

--QstMvh6f04LH0Wzz--
