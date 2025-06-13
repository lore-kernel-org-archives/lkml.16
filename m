Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FFD18FDBD;
	Fri, 13 Jun 2025 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825393; cv=none; b=OZBe7TEhfSg/JayXJX5nb9AKQstrgYT5vIRtDW5kFMcL9MVGmt43r759bVmt1ZhVjVjoSL6TAzeoFC+fbFTEXx6MHCcitAKQC1HuBvaz1fTF3BinAcwDvS+iiIykUAqrRwnXe7Qa8m/IulozK4RtXFpVieyWzsHiszSzhwAK8N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825393; c=relaxed/simple;
	bh=UK2lJlz2LCjhQudxqPQDGhW8klEAjhwowG06LslQSUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuTI9iGqlJggYWEREkfLFGgPrh2FdNvLcLiTfvab6EK30eITP1sWYWD2Ai9yn81+lyroDKYDxnEqXgc/Cspyv4hucRzT4Igy/WKAbsuF725xezkRRFGRgrBpmhyD0Rw+aYWjoresd8m8P/x0Dqis/CpBe9O3N+igMLfZjVseGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXey7G72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXey7G72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8E9C4CEE3;
	Fri, 13 Jun 2025 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825393;
	bh=UK2lJlz2LCjhQudxqPQDGhW8klEAjhwowG06LslQSUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXey7G72HGtYGGVpC1CdwXhlq9L90TvyO+p8PUW6Gy+i5rqtKzJdkqBrnA3ukajqJ
	 Hl/7+yGoUyY/CnBr7JzEKlrfUdoKQEKWbY4a/gUCXHinJUfR27DM43c4rpALOxbFl6
	 k8dPE+VvqUHhjknC/lwlxYTcrHXJ8ARzN6qVrOC+8kodUeHLB+ez2oMCdk5Gf/dEi4
	 yECThuEu9PMcPSnkYo2FfZSHwoqTFACX3nbPCFm3NhJzq4dX5TYKwyBonp105nEjD7
	 cFutdZGfLq3j0CLb3DeMcwOQqboD7lN+j0VJbcHvJ7ZWrY/oTI7KYZ6xbzTs9odFpF
	 aZFCpiezL4Wag==
Date: Fri, 13 Jun 2025 15:36:28 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Message-ID: <20250613-eternal-resonant-90e254e1e7c2@spud>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
 <20250613-b4-amc6821-cooling-device-support-v4-1-a8fc063c55de@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLtA+ltvLcySd3/R"
Content-Disposition: inline
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-1-a8fc063c55de@toradex.com>


--SLtA+ltvLcySd3/R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:42:38AM -0300, Jo=E3o Paulo Gon=E7alves wrote:
> From: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
>=20
> The fan can be used as a cooling device, add a description of the
> `cooling-levels` property and restrict the maximum value to 255, which
> is the highest PWM duty cycle supported by the AMC6821 fan controller.
>=20
> Signed-off-by: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--SLtA+ltvLcySd3/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw3bAAKCRB4tDGHoIJi
0rneAP9ayr/LfVHhlHHfjMakBX/nJT1pcblHAYhuwfn/j+jRUgD+Lw1rJEgWeDY9
Ha24jYgTf6Bh3WdwPMPz37Qqu2eYywg=
=qA05
-----END PGP SIGNATURE-----

--SLtA+ltvLcySd3/R--
