Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD4297B60;
	Thu, 15 May 2025 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308634; cv=none; b=X7SpzmWlXlK+mLtAVFyV5784Yl0sc3jqbSA8Vg9pT5n5BtfdQdUTDzHIwyBo4HQQyAKXu1PbEtVHmzI/SWk2OKBxP6/nzoWVSq4PztDbwQP7AfUuaFo159iFL6CbHf4SSxlXwGEx7dfk1uQXzP1QcCnzopv6nGZgTBCSit9A8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308634; c=relaxed/simple;
	bh=qs/HCp/tuPqxoIZBhL/5F24zhipN07IbjkxVJVKrgz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUICd+rYl96X6NMZOkQ6E49n3GTsBUhH77yMNy6uTqsHsesMeA+GXTMgUyknf00oNgz7CsjDXDagA6dAekCPzCyfUq7TIKNeC4PGrkaXDKvpJBotcFngBYa3M3V+QzDyPZwDf/y88SXslsVJSYmJ7uMh0lpzf70t7qhwB5oXghM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGtrEPQ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGtrEPQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE78C4CEF1;
	Thu, 15 May 2025 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747308631;
	bh=qs/HCp/tuPqxoIZBhL/5F24zhipN07IbjkxVJVKrgz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGtrEPQ+qNi7DwYEWf9t2kIgX0yUK9xH93+d7phxdg0AhZpJL8Q23vTkPWBpbdZcQ
	 bXze78eHqzJvcVEJvTQ2pj8RI/dkYek4k8UgyOEAIX8Xuw9EC425OWr8HuwHsmonBH
	 nHp80i5JXzG4g5CyMBuV1HhHd3ml37j7IsdMZWVTt8G+QEtWmOhbj8nlE8lTFZT5BE
	 DT6MEcUk901uV5LINbw5MeQPPKiGMt1wcItLUgErooF2+a+BCOFi9bFR7ZwcoTHpJq
	 ydt825eVVBdziEPDl5HSeK+IsiheqlUYUprKVeLYqZxZDhVs3c9t7zixf4Au5pU6pG
	 P73SeOiIC+Mig==
Date: Thu, 15 May 2025 13:30:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EfsCzTWB3diViB+9"
Content-Disposition: inline
In-Reply-To: <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
X-Cookie: Well begun is half done.


--EfsCzTWB3diViB+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
> On 5/15/25 11:33, Mark Brown wrote:
> > On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:

> > > I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> > > in would be sub-optimal and would likely end up in a mess.

> > Well, then just going a head and applying them on a branch with a tag
> > seems easier than delaying then.

> I can split the patchset into two parts (one for MFD, one for regulator)
> if it helps.

There's still a dependency on the MFD bits whatever happens.

--EfsCzTWB3diViB+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgl0FIACgkQJNaLcl1U
h9CRQQf/Wx34agRsQjJ2L7RzP4M/Z0iU+/Xw0es0YHN1eDqCFQ7368/GShTJ7J4U
utqRkkzJTWqNvk0DQeHY4GsMCk6yPIrIR6cOENq8gUciYHzdm66JombPUN2mnqFs
z89Yg5kvAjbqoMjMAvppNzwgkTfMH/TtGFByO8+C8AdgXiepwJuNWKQTvMELoJ6A
Uy3wTygq9HlCCgguqG4p0CZJF+f3wNbDaRc2J9aes3GifYM95AOa46rdaUhz4EhV
2hDqSxBUnFIMHpFnWKaMr2o8nfWf29UY2TsqjOvoDhXnCsKSKuGvzIgZSk0FxCpG
v+6XIegFtSG6KQfjGQKcIH3V7sGk9w==
=G2Oh
-----END PGP SIGNATURE-----

--EfsCzTWB3diViB+9--
