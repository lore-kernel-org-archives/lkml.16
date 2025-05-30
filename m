Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95739198845;
	Fri, 30 May 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620582; cv=none; b=R9Vy+idWnEeUUNJusqrMvwp9n8citY3E5ZCG5G7PuLEOuL+2GPeQLoFCCbyH2d2vBk0x2OXOswCQXNfZnXzgMXCAnCd7v9hTL7MINe4upRCJCbuyxq6AcjvA4vg1Rdn/YAx5eioKVo2Od6hVt8EaWog5DDR3o0sg6SWzl14LImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620582; c=relaxed/simple;
	bh=46qdYaXfdnGmUSTdfd10vh5+aJpfEeugxFSJgWUzVd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbo6Id49WgbH32/ytkGYyyaPb6ONP2bwbg4RGUZinEvEa15ZVS1dZh1sAcN5qVHTW05kCHnDidYthhjdIiO3HcuUAxIboKIPY+WeXMYrHeXv2xqK5qO+mFTpss3KbyVfHFPKGtBqgSMsOPmtQB7pQdzoG48rWmuu32PyvCrXDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbncBUVI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbncBUVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971A3C4CEE9;
	Fri, 30 May 2025 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748620582;
	bh=46qdYaXfdnGmUSTdfd10vh5+aJpfEeugxFSJgWUzVd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbncBUVIpau3pBBVFWQnDrbREUKTE439bV41vy0htEqozNxpULTPxV2jFxopej/oZ
	 ySDmIQJyJU7Lxt6zMBdX6IkVvNp6dAtd0P/hHEVBUqY6Y13/lzhSYZfP50Jv1rbkp9
	 nihx0L3eSB0tTyCVOetyo1h8pxBQIhn4qlrrhmZswAFze7YEyiifV7vSBLotECA2Hv
	 bpxLX3EGMyxiXO+rGWRC0HRYCdiElCmhslyXShB42gzlh7eQJyPSpDfTbT9e9FZL42
	 PrQWSiBJFPoY5bddiAKhmikS5daaeY07Cz+lXNBChr6JEI7df+RnF/fLGTDuO//Dpm
	 whV8V0S7o0/4w==
Date: Fri, 30 May 2025 16:56:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: timer: Add fsl,timrot.yaml
Message-ID: <20250530-underdone-sitcom-3aee9f1ec277@spud>
References: <20250528165351.691848-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="STlooZGqUue+sWwC"
Content-Disposition: inline
In-Reply-To: <20250528165351.691848-1-Frank.Li@nxp.com>


--STlooZGqUue+sWwC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:53:50PM -0400, Frank Li wrote:
> Add fsl,timrot.yaml for i.MX23/i.MX28 timer.
>=20
> Also add a generic fallback compatible string "fsl,timrot" for legacy
> devices, which have existed for over 15 years.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--STlooZGqUue+sWwC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnVIgAKCRB4tDGHoIJi
0njhAP9bp9G1YnaQ2XCar8NXVTIs/sRffXHGqqJ7IVPO3IcdQAEA4jWLWiYdaYfP
fcP0ItXIC2Gh1MVhID81vUevEuvC7wI=
=fFke
-----END PGP SIGNATURE-----

--STlooZGqUue+sWwC--
