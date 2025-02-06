Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E946BF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841304; cv=none; b=ao7ev5r7kpvQqhHlQygH84GLd8BCdC/+rSBRoKanSEe/VZRU7CdSW7cwFBMaV22GPuz2bBtnxe/xONW0Wb0jgaTzInRBeRLX9TJoqICbDaa+f0grHfX6LAEVZNwqWuuPes1u3HxDGsIykfa0nBfC+fw0LrlBJ0q7SLYXdDCl/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841304; c=relaxed/simple;
	bh=NfowIVG729IO+yiwiyj7GtyAVxjfjagBcIdwCuBGCFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sejrtq2ubNGo10KlYpcViarvg+LGA6CDKSbVuuwMIQHBMBHDNurIO4BGL8rngE+TFUNDVCoBPGx6HxkK1jPBt4vv+qLVYK1Wrpn6VrvPM7E24EYzN8hpjaW8zS834KJ38o1hxGzgNYpS6gjq6DRfqBATpD+vhKQb5QIqaeT3aDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw6BZ5xj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw6BZ5xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DCFC4CEDD;
	Thu,  6 Feb 2025 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841303;
	bh=NfowIVG729IO+yiwiyj7GtyAVxjfjagBcIdwCuBGCFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xw6BZ5xj8u/KuoHtzaigoAY7SGI5VUEK7fJOrFNXZmXgsyJnySMKUxn/nNeO8Rqkn
	 XvPGc75dWRJy1gnhFwrKLrR74UEmLd8ORHpdIonGnHkGmLKom8eqbZ1M8kTbtQBG2v
	 FwmFaN1NsYcX2cbRrlu3tZqW6fjbXcfB/3Y0B49vMTIoW6ARbMSpm+nR0vpiVHLDB+
	 7DJODckBf/flgw/vF1bZovuimHVblm/OCXgA8mRHfQfv+2sFk/KNhsGA3PVKhyv2FY
	 xtMVnwbDea/bJAMEAPrj7r1KohcqT93gcD8PektJj/c0rBJZ0/tjhz9PBmzAheqkAC
	 Qyr3wairNsVfQ==
Date: Thu, 6 Feb 2025 11:28:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH drivers-next] regulator: ad5398: Fix incorrect power down
 bit mask
Message-ID: <6d856228-e5e7-4502-9d0b-9755626faf40@sirena.org.uk>
References: <20250206103153.59114-1-dheeraj.linuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPVmE2z9ZrAS0Un0"
Content-Disposition: inline
In-Reply-To: <20250206103153.59114-1-dheeraj.linuxdev@gmail.com>
X-Cookie: With your bare hands?!?


--JPVmE2z9ZrAS0Un0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 04:01:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> AD5398_SW_POWER_DOWN was defined with a bit position outside the valid
> range of the device's 16-bit register. The bitwise operation with an
> unsigned short would always evaluate to 0, making the power down check
> ineffective.

Please don't add noise like drivers-next to your subject lines - it just
makes it harder to see the actual subject.

--JPVmE2z9ZrAS0Un0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeknNIACgkQJNaLcl1U
h9BUtAgAgeCf9JzL3c9wGNQaF+L0qhep+IZMCkAX3x+lLSkKdY94noJdP1hEKD7h
4FXJeCMSwdOvXja0fxOuykH/YwYPXXXFPPJCmiX1pNe5FulyIjyejwOnbNShtCIY
bEhVooQv7iCa6r0YNuA8QueFuF0mFW287slOxoUiPl2Wz5cqUyWWEiU1Ho3zQ/tO
dLOGGOBVmOCUnobfN4oesWrJcXeT5mfEQRiW/Q1cm9eCSFkpETShSuwMRWvmg4E4
XealJ3lJheUBEXXxaX2eKDb7gQ93205Dcth/xQCFfKb5ksznPQ64WLqbT/t9Y8pn
x0MFZKaQ49pJ4B7HrKUThcWIvbYNSw==
=bobQ
-----END PGP SIGNATURE-----

--JPVmE2z9ZrAS0Un0--
