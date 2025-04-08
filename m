Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9670157A72;
	Tue,  8 Apr 2025 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143547; cv=none; b=nRDAhTuKA9DpC0Nl62O3+LRfg1qcnBZz/nF/oftb8wY53D0aTd9+89GDl0/xSqY32njcVwl0bOVkzGymKqSVPJFhzYGAvYGZEShxvkFgAN7dCsEA5wgf9w6ax1p0V6Ez/Bif7XopIbFHxMe9+vuEqHx/170nux2Fw2N8bfjycUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143547; c=relaxed/simple;
	bh=wKH39dCKyTi3SknpBUHRbciVLX/AZ84HXR8FWQkWQOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YznY/iVjvWuELd5+xWolpfp9iqagOQl0IzCzvMR9ICKNAlAOOgrvVXEvyiVGeKvYShjPObZ9ApY4AF5nFJ/FV7k1sQ2+I+WO31WYiptGrXzz/AE6K2DOR5LQtN4OD7bTcLEhu35lzTgafuEkLaP0oCL23r9uZdTGKXswEMwN9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG2zVh2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG2zVh2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220D2C4CEE5;
	Tue,  8 Apr 2025 20:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143547;
	bh=wKH39dCKyTi3SknpBUHRbciVLX/AZ84HXR8FWQkWQOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG2zVh2iSIcIoH0MzhnB693PCEvanZ07/xdjlybD3TJ15NllvTl5xinGVQS2MiBO5
	 fqDm2TApalnKt1N/VnYidQcvpBu1U/gk8Y8C74FT5lEKO8+9IbJSL4xx9KGGkRk4AH
	 cdbS1y/ICvnvLI3DZ3uiWj6NipyZgam4liIvyRFC0h56CPn+qC31IpjNtgYlD+CvT1
	 r1QXuYde+MJF261PMRhdCcaACExolK7ceHk5PHPCyUALcu1zOEdfXJZc9cQZPJ0s46
	 CazJirN8ETdN9BlQmD+y9fiC3DPjyaEjITVu7SsxllZgCKWay2GZJZO/2SxppgeJui
	 ST+RIDnkEPqgg==
Date: Tue, 8 Apr 2025 21:19:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/14] regulator: bd96801: Support ROHM BD96802
Message-ID: <189ec906-53fa-41af-a317-fe2f635f1e1b@sirena.org.uk>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <2fb2d0d4997c32d18bfa32cea4564352c00eebc8.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UuISoavhl7Dof7A9"
Content-Disposition: inline
In-Reply-To: <2fb2d0d4997c32d18bfa32cea4564352c00eebc8.1744090658.git.mazziesaccount@gmail.com>
X-Cookie: Meester, do you vant to buy a duck?


--UuISoavhl7Dof7A9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 11:46:16AM +0300, Matti Vaittinen wrote:
> The ROHM BD96802 PMIC is primarily intended to be used as a companion
> PMIC extending the capabilities of the BD96802 but it can be used on
> it's own as well. When used as a companion PMIC, the start-up and
> shut-down sequences are usually intitiated by the master PMIC using IF
> pins.

Reviewed-by: Mark Brown <broonie@kernel.org>

--UuISoavhl7Dof7A9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1hLUACgkQJNaLcl1U
h9B0ogf+KEcqFFZe5UKYVIZs/p7vVKLeBJmgnKluHFLvylx0CoNZtw/OsmjV8eUo
Gtv66Xypv9udQ5a9fmJEgSELhL3MdpCLvUun3ZcnWRN/AME0vpNttp70dlKpT4NB
PsjZDI0VxJEDpuzRY+OpT1IpnazHI92V8Jc8RoY9XJ6ZApyEwX1nKeC3m050LvAM
e259AQ0zKJjzSs6lZSQtm9MskQNnx6K9b8t0hUd16raWMISKpVVZPsdv/gzm7kiI
hA4wVP3rUxflHo6UMO1EqBYrg5L3/qKTKewmag8asOLOGtf+ckmNH4oOInKAV8eL
mqFb1YGLPF+f4GqYa/LFSdsmmB9VAQ==
=fcQy
-----END PGP SIGNATURE-----

--UuISoavhl7Dof7A9--
