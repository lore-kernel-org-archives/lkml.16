Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DE248F50;
	Wed, 30 Apr 2025 00:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972221; cv=none; b=r4Q9zh5mXH9o1gPJ0g92WshephWj/OMQHTfcJ+OSjtAnzYPLts+q7A+hUghwD6GwCdkM0jarYLGFXRLdOcFB/9DKgr27I+2L1TqTazpnc55QaMUAhkyy7y/cxiUQXcoRp1DMWKJtOhZI8rFpaym4xLy7xjgQCadmTK7lUz9Ok+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972221; c=relaxed/simple;
	bh=aK9F9nwIdg1FphfT+Yfjld5zvSum/rAfg7pCxAMkINY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO7r1IM6+9IRKsvlR9kVKX65JVV7UDkxjVsMwx/Dm1ZGckFMTO+Hvglw/01wbWkRGWP5IbS7/PU33a5tFR92SywjYcatUnRwHa7WNhNY/Dtf+3xpYjCFzMUvy+EHjAW2mLpHSJ1mzDW0P2FcJgC5VYcekY4y1mQx+DBLKlxCWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2qmY2zJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2qmY2zJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643AEC4CEF1;
	Wed, 30 Apr 2025 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745972220;
	bh=aK9F9nwIdg1FphfT+Yfjld5zvSum/rAfg7pCxAMkINY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2qmY2zJxR+ibK/Gxzvt5dyIAIgHEFb0wJlpCM1untRcEPWw80nYDj9aUM9LmQCTO
	 lZMeo4qtAnYSRYO2HTwMS1dzOLylqleohStMuC5Oyqe5LZdl1JUkNhNHN0jO0Oyz9a
	 6sQdEs5JxrYXJvueCGqanCFfEGPzCrRPVZGSOYjL/euAFpfKnkp31PCG8JRDf9Neuc
	 DI8GsQL1+afXp9PUy9ic1RtHK/PbmlWXsZ3CUMCbVbN9SeWZDZACSxiucdE5CGHTcN
	 OP8Tc+9y5Pd5/+g4+P5Ts4nNF4XLGI8BFtKNj4/adKwW2mNEWt7mEzDuG8CVf8waKs
	 QMWDPQrJCcIIA==
Date: Wed, 30 Apr 2025 01:16:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] regcache: Use sort()'s default swap() implementation
Message-ID: <aBFr-OJlWHg5a0Lj@finisterre.sirena.org.uk>
References: <20250428061318.88859-2-thorsten.blum@linux.dev>
 <edab112f-9449-4862-8f8a-0beae136e0c6@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NFTx9axBbIHKVfre"
Content-Disposition: inline
In-Reply-To: <edab112f-9449-4862-8f8a-0beae136e0c6@web.de>
X-Cookie: Well begun is half done.


--NFTx9axBbIHKVfre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 11:00:46AM +0200, Markus Elfring wrote:

> Would the following source code formatting become applicable?
>=20
> +	sort(defaults, ndefaults, sizeof(*defaults), regcache_defaults_cmp, NUL=
L);

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--NFTx9axBbIHKVfre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgRa/UACgkQJNaLcl1U
h9CyyQf9GfxP0Cy0bZ97n/ofMRRGMjpH6U3zALBxa2zXqCorH55hSQsEfUQRCfXJ
UzR/jIdXczE7jdyZEQm+psDrDJegAOkYD2AWrLKF5U417evMcXcusr3chjfX2o4u
0so9BBw4bpk3PAZMWlv5LadCc7gH/wJDfzPxOO59CO+pWTr3pwIpiotPYx5jDM0u
KQ/VKWDOGyGXYGEvU+rA71pXDHV1Y+SSF9NehOS9zasrCiYxeXEjVTXABs61sYba
6vjBWO9eIFXPurZ1fqkK7AbdtTq1UM6TleP293zosRUm+jw+DU9pAjb7OvTktbs9
qyP6k5NsV9SweDj/sj6uIg2TCvUpyg==
=siGj
-----END PGP SIGNATURE-----

--NFTx9axBbIHKVfre--
