Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2072E1388;
	Sun, 25 May 2025 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748173846; cv=none; b=FZZV5KGFlga6KK/IJbLeJnY7pkO7VewTm9b02WtGOmokLXbylYisMTvlBlCPt4Mokm/Z9YuxGawYLsyxhiYC3EDdinCwpPvymr7F9npnaGcebXH7RFUj5jHxRrveM/OVBg1aUP0hsK5xemTOzTvoqjjVBXz9f84wl7FY71I2t7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748173846; c=relaxed/simple;
	bh=t8dfSEh9MkzHqyhNC6dqWZmlYRC1jltn+BfmoznaqTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sylhVhktYxsr1QZeQcQIHVDs/CeBY30j+CcX5nldqxXAYhBaB+otHJmvkHGEA6hkqdOOzKn1/v6fJGGorrzaHDRjwUoLPt7BIkRP/28+K7cpYCQaAacATPAYBikeo4XgaBe3B+cYsOOInqDErqkyD3EhYuWMnWVOHpgDjIwxxZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkA+lDAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkA+lDAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD54C4CEEA;
	Sun, 25 May 2025 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748173845;
	bh=t8dfSEh9MkzHqyhNC6dqWZmlYRC1jltn+BfmoznaqTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkA+lDARAPhJUC+d3CRiArVs2OcVkIVJ2TXnU2fkXBkBFfYAcpR7sfC8IaFNdIcxH
	 Z4A64OOVmEhWPEmEugldsoFrh6HT6L+CbsHeZmyJfidyFY3nhOrVuG6dNeb4LMGGR+
	 fjc/KpRB2O0zaKClPEZMU53VwP6B6Md5PQkrCrKIPjONM9VsyTWzXe/e3TxCxmhYTj
	 MQwt+hEjeWUY0D1hEH4FEO+IyFuFWRbVevRUAcDlozcwGtxUHf/lPf8GOFY7rcx+Ww
	 UmPW9DGoDUR0wwFuBWeA+C9CWITW4uQnUT0MxPoR+imyMMFnkxoMCpmKRy87mgAm+x
	 gkgX1afchKDOw==
Date: Sun, 25 May 2025 12:50:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-ID: <aDMEEoN1mifJOIQo@finisterre.sirena.org.uk>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
 <174801730004.578098.7742808995079543725.b4-ty@kernel.org>
 <8ff817a3-c734-45de-afbd-5da9aecd4cbb@kernel.org>
 <aDJKUl2l3l08LPDe@finisterre.sirena.org.uk>
 <6277cbd5-d57d-404a-baef-e8d87a027e37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sMksX5pI1VY+Nx4T"
Content-Disposition: inline
In-Reply-To: <6277cbd5-d57d-404a-baef-e8d87a027e37@kernel.org>
X-Cookie: Well begun is half done.


--sMksX5pI1VY+Nx4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 06:43:17AM +0200, Krzysztof Kozlowski wrote:
> On 25/05/2025 00:38, Mark Brown wrote:

> > That seemed to just be due to v1 splitting the header with the constants
> > from the binding change (the issue was that the header wasn't there)
> > which should be fixed by this version?

> No, this v2:

> https://lore.kernel.org/all/174801020316.1711348.10193654747801258488.robh@kernel.org/

> I must admit after quick look I don't see the cause error, but
> nevertheless this should be address by someone, preferably author.

OK, dropped these two.

--sMksX5pI1VY+Nx4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgzBBEACgkQJNaLcl1U
h9Adwgf+JDrYyZYUKLInJHOW+bJElqMAnVloH2sUNCe2kaj0B4vfQbZ1Zj3BqLaG
IeaWQntyZjgcLIXFwJuLCBn5XgIrUK3O7eRhXssKJ7myyXmu85JbjtlsWB/Oz/XD
r/FyxFFPfmF0Immx2wX/HaSb5tj9KTkF9RjX7uL64RIRgJeEVC5YwNvOaOx3TKPM
GxlB9Icszey+elT0CMaUXOK2H7/27PG8y/QTSxKH8Y68MStxsq09ATpBqtMjl5pA
LoGy19deEBBlOH0OcFRBHO8bO9RoeH8vg8QYX+a7XVh0Ftgy/MPi/QnWBA6eITbB
j+bwcYS94PPWaMM8O4yeu+5/xgfafw==
=34aL
-----END PGP SIGNATURE-----

--sMksX5pI1VY+Nx4T--
