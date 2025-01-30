Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E294179BC;
	Thu, 30 Jan 2025 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262852; cv=none; b=h0Hnxj8b5b/f5uaa1oqjhNouyRIMHWrT4ml2bYLEUojssDclNL4comnwlKaFnKq9VNKGtjIhtDhR7Y/uGTYgJbytqvVf/4RTXHIW7fMDFXleVvh/nc/YNK9JdzqyDH8x39HbtxyiLII6zsZ+9jwMKy300Lcjc6yk1+Eufyqj0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262852; c=relaxed/simple;
	bh=mZJRq9k9X5Pu3nkmopql7LVi/y4tYssCQBqEevf/y7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crwe6+pzW65w8IJ2UqmKaPtwVcY7nPaO/K/YPEU9x1IUysYDbliHn+zEnqTEt2gcPFULPEiM7Wiz1uaP9sohQkU1SmEscrbga/dt6vaj37RzSLD6hQd6dTVTTNs6uilja24D8K6XL109S6A4Qbx9YkjTtpVmx4iMGsC41xBDHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8XhSYpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8XhSYpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B95C4CED2;
	Thu, 30 Jan 2025 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738262851;
	bh=mZJRq9k9X5Pu3nkmopql7LVi/y4tYssCQBqEevf/y7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8XhSYpVEgOVg7CPv7mdSBjxIe6IM3wMxmJpnF+fyePkW2XCp9406387nlnCAsT0a
	 rydEh1IhviEaaJd2XioVWIzivnsyLO0nOldlRSQJPjpyWPFeHwXaONkLtMKTKmPFNX
	 Q5DgkbSVUDEgN4pVDymRUV7WhO0MtsVSj5OxjKoL1Ec7ugVkxO41vWZSXF0o42J3N9
	 HVzZPCCX/PjWnZjirRKRbMM3PJ7DWGYOAzvc6IDqRcsZ679rHFBQCmCJTwzHx6g2WW
	 yPy2a53dNB6jMUdEqCVzJuO4ka2fvxm/wJRczp2yE+1wzo4vhWBJxzC+BmU0Sagqnf
	 o5lSFtaEbXEwQ==
Date: Thu, 30 Jan 2025 18:47:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano
 access controller definitions
Message-ID: <20250130-awkward-referee-3bec6c8cb1cd@spud>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mU4vkAAU2Hn3gqn"
Content-Disposition: inline
In-Reply-To: <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>


--4mU4vkAAU2Hn3gqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 02:00:58PM +0100, Alexander Stein wrote:
> These are the definition for the bindings of imx-ocotp for disabling
> fuses.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4mU4vkAAU2Hn3gqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5vJPgAKCRB4tDGHoIJi
0u+EAQDYdX6jxw/RzEi8k4fHQSVdiqM7o4HubF0JSKkZjwwU2wD8CffUuSP6JtiJ
RfePnNXmBYGsnu0cSu/Ttx6O7v6IhQ4=
=loIX
-----END PGP SIGNATURE-----

--4mU4vkAAU2Hn3gqn--
