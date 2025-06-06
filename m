Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A84265CC5;
	Fri,  6 Jun 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200219; cv=none; b=ZKc8K5KBFYERclK6xMPXDEHxvrr24BlAZSRtopQRo1ZCF8yjIROMGO5xQQ8BrP1NrTGv+UxaIImCu9RO64YykFD5iZSJsZb0AIb7W4YSB1PMZszLRVq1AxSSDYQmPZq2WD1KCZrij0SmoyA/1T52XG7ZTTEgPKnIfbJP7pA2ErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200219; c=relaxed/simple;
	bh=ihq1PWlB2U3WzY86lVnSq59NBEGnqtz4IiNft5x+ZSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O83u2KxGKbbaEBHYuqhzdgY5T0IdNp6RYDmFUBPL5sWGKSKe8QIlIesH0/qiWCyMmWDl7CpN/FaBTMlt5OK4TP48meStuHMicAzBYP074JHWdXSB2/rYemirWjD9gol9UMHgBvd6B4NmrU1omJ83zBjiCIJaJQANi7SWhjEHkik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYzMRvCZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYzMRvCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0422EC4CEEB;
	Fri,  6 Jun 2025 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749200219;
	bh=ihq1PWlB2U3WzY86lVnSq59NBEGnqtz4IiNft5x+ZSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYzMRvCZvFXJL5/UK4Ayh1axQtFKH3Z/1LrvAm87knFoFPh7aJ+uq0mUcwhrK3oOu
	 6CpJd1Z4aHGjRhxq3Zm69/2RXAoWTZ1FlxRR8xXKm0y7Efvqzzy4vi6OPxBXEK35Sb
	 hHfp9w/NY8vrtAsNE/qlp8jTqG3QO/3YyzfaphH537iqUYqh4PNSB0TBqbsWoirjLV
	 ios/bNyHqo+84mtxrIIhgohAq/bq41bGEz/p5SnFjF3stlCufhpOoZV9+1IyHKy2hc
	 TMJD5DslnH9DnWar5pwx7DrThmtZ+Eot7642ySIiseWBQG+EvT/tLlMI3in6UreILa
	 xTTCcvA6lmEmw==
Date: Fri, 6 Jun 2025 10:56:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Message-ID: <20250606-fabulous-fortunate-chamois-ab4c98@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wea4pqj4lkytyzs5"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>


--wea4pqj4lkytyzs5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:49PM -0400, Brian Masney wrote:
> Some of the mock tests care about the relationship between two
> different rates, and the specific numbers are important, such as for
> mocking a divider.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

It's not obvious to me why they are important, actually. The relation
between the two is, but a divider (and our tests) should work with any
parent rate, so I guess we can expect it to be opaque.

Can you expand on why it's important?

Maxime

--wea4pqj4lkytyzs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKtWAAKCRAnX84Zoj2+
drfnAYDtvCw013kwk9Ob5wtsOFRbehBvu5UEoU6eZtcmqiNg9XzY6ULKSJUTsRTw
eOcbsWQBegOcYCyySnL2jfXK3176j3vFkZox9qW0yWQKbpgYdv9fJi9gmDtCftS4
y9jfowNwoQ==
=Ggfj
-----END PGP SIGNATURE-----

--wea4pqj4lkytyzs5--
