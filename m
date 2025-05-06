Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024222B5B1;
	Tue,  6 May 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548444; cv=none; b=horQmFD+k/x+kV5NTH62eha07lBVnKA9rLnpZ5l87baMNFiwrmxFR/qRd6437VQA2o5AcFa+tVEtupDp1ve2PKbIiP9iLWKJ9QH5aZuxLXRGDf/oceRZD+7hSTLssPNvxBijFdzsjkEwtMCWFlsj95uHWuz+1BCsATgvYvSBr8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548444; c=relaxed/simple;
	bh=ffcpxlWjSEshf5NcicDlb/m67mTvD/u3Mouc4HHrfXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJTA2u4kQTR8VXGKpvBlXwxhDF/Y4udxij0hPiZwm+t9lwgKDdMl/c4iVZZcg9Nvglf44j4ysnUl9RiPJriCXNbQriStqQg4Lr3cAzVdLm2SpCE0oRsZ4xKB7+yX/q+pKJKDgpCfeCtUerHiYp1Hv6xBAW8zYdVUcogPldi/pG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqOu6pB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqOu6pB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B872C4CEE4;
	Tue,  6 May 2025 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548443;
	bh=ffcpxlWjSEshf5NcicDlb/m67mTvD/u3Mouc4HHrfXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqOu6pB8m+qYaRr1P2LXzSuy0Tn8Oo30S+afmUZDcTkselexJTLXbirWpS+nRdrVl
	 es407zMXNM7gbLi3ookAni5E2KNB4W0AkTPIghN0K3PXDaab4dzjfeZNVatuKQvOpu
	 Cwbhm0bEr6q9f7dfxgde8iscwE546fd0P3LJtA0FZAPcCeX/oidwqnWzFP0RJqZkM4
	 KSQDzgRepikagtYEmT2R21rz9PCMXkEvtceCsX2zgmw00rQzfljyG3OWucHTVlQAyk
	 WDi720Vc+1bdTkvHH5MQyLO3A9nq/6HM3nqKam4dV52aYhV8Vy3E2YENIoXZ1P4dBR
	 9GnagFPZwYEBQ==
Date: Tue, 6 May 2025 17:20:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: sophgo: Use precise
 compatible for CV1800 series SoC
Message-ID: <20250506-rhyme-gangway-023d58f1488a@spud>
References: <20250504104553.1447819-1-inochiama@gmail.com>
 <20250504104553.1447819-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J7ij7iB+WCTcP2Yg"
Content-Disposition: inline
In-Reply-To: <20250504104553.1447819-2-inochiama@gmail.com>


--J7ij7iB+WCTcP2Yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 04, 2025 at 06:45:50PM +0800, Inochi Amaoto wrote:
> As previous binding uses a wildcard compatible for existed clock device
> of CV1800 series SoC, it is not suitable for existed requirement. The
> only exception is sophgo,sg2000-clk, it does match a real device, so
> keep it as is.
>=20
> Add new precise compatible for existed clock devices of CV1800 series
> SoCs and make old wildcard compatible deprecated.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--J7ij7iB+WCTcP2Yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo21QAKCRB4tDGHoIJi
0otGAQCWZraHz/cRq5N3eF/1QZha/fa65MJtkglr3lJkKPPA2gEAsZX+9TUKCii9
XXKXZikRNTV4EP7DGbVw8OT8lQ4HyQg=
=ueEX
-----END PGP SIGNATURE-----

--J7ij7iB+WCTcP2Yg--
