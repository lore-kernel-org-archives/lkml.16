Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F827AC34;
	Thu,  8 May 2025 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716215; cv=none; b=M0W/sM0NwNr2QPh31LNmjpF5S9+UsVc1S4++red0c4rWd+ZQbU/8aBl4s50iLuB3NFYt297ZVzNVEcC2embRcNg82VCCqKoQYlj0/bxlTr0YjC75rp2kA1+hCqHtDXh5CfMoqugDhcGoYFqGxdJwrW7Vv8ZIbdRuSlfubDbFBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716215; c=relaxed/simple;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYuOTSWKy43sYv1rL2M/jUSSpn1GsDIJEAQOuKoq2iRHMRh6MCSJx2rZzoPdUuriaHXsc1gEph+/spI8oOuAdW6xxoiM0dsIttSbczNIBvCBNdeld5hmIrDxPOGNpUA5ADVcjnQKtPvNO3NT7eGPMrA5XowIscMKJGHtvmv4HDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j07kvywV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j07kvywV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A12C4CEE7;
	Thu,  8 May 2025 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716215;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j07kvywVUKN4l2qE9kTZVbyyzXQMh5gn/i7jJIOvsFTdJI2DaCj5f01to0kD1yOPn
	 oNbYZLuUXb7btBzUHSGlUSgbyvpV6IIzNF+u6JaXMywUKN4Aqo/f5y5dNUqz9QE0rc
	 SWNCQrPJR1fYLKQBHOiTHr8BGoquAUD5XeSXdJ+TzZfHnNutQIGmVyl7+DemlVlAEl
	 G4nnXIofN1dyRp9t6V/P3Ln2ISaAGcY5E/Q1l7fgG7zDHyDUSgdRpgjw1erVujp5H0
	 lm+ZwIDFz37odHj3WzqDxaeOvI1G0t3DXcSAG00r8EIq2f061mFYe5s01Fb0ZFoxVP
	 XY55/TPE8R2Sw==
Date: Thu, 8 May 2025 15:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <20250508-tumbling-suffocate-a0f41c8e67b4@spud>
References: <20250507154231.1590634-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oD3B2Ah4KH8Tz7Mp"
Content-Disposition: inline
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>


--oD3B2Ah4KH8Tz7Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 10:42:31AM -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
>=20
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml fo=
rmat")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oD3B2Ah4KH8Tz7Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGMwAKCRB4tDGHoIJi
0jQLAQDjo0zImdxubhL2UWRrPkobD019kaPhau2jHa4h21N5xQD+M40JHVkb1q4E
VNgqwP6qcDhA0fIZ7YW9nJZYAS+vjQ0=
=kREc
-----END PGP SIGNATURE-----

--oD3B2Ah4KH8Tz7Mp--
