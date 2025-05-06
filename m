Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D708F7D;
	Tue,  6 May 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540646; cv=none; b=cIrCxp6R3xn4JSea1gA3CzvxkS78qYFJNt/vGAHC1XxoEB+BNyfQKUjpf/SQhuAw2ijKMoc32rILlJauBJKAGnut/ywzO+ycE0Aql9L9kiECVprHX8gsfhXypkIR+m1fcvuW97AS8xbPSfqxeVdWhww2tFOtcxwu0m0uGUDW6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540646; c=relaxed/simple;
	bh=XJjU0D/OeJxtS2m3IDGLAsdw/mtedEpSYJb+msPVzsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVWz0NN2wdQA714slUS1zbDru34H/BHc5w1iilYSiaNIMKgG2btCMabQy+iE5jNa2bJTnsY64025R0wAEeEQfKFdgyhE6WwypMG2sombrFrJaQYWrS/eG2EqQDqQ866/svQIjjSaG3y0IC2Pz4GqgDhPdc2a0Fvi/k8hXDdc9K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdfM5/HL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdfM5/HL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B80C4CEE4;
	Tue,  6 May 2025 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746540646;
	bh=XJjU0D/OeJxtS2m3IDGLAsdw/mtedEpSYJb+msPVzsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdfM5/HLELUuu3dDd6pA40ax2Px6Vf2PejFr+R6v9nzz8FRWvFIjE5BndYr+rcU3D
	 coyCkgC/guJk/AxIJ2g9RKLDdEOCgCmAgp/MyX4t2okRHmoveFTjW6fNqupcPL0QF7
	 mvfI+J4eKDj114wyaKouuQqJRxPzjaJl6AKoTib7SDlRRnmBIxkUzvtXszdIuI/11e
	 F63uKhWcss9nvRREFV1LGzDh5dqbapfcqa0ZM5GnwHoWGhKTfLJ3IUBjPUKRxYb31u
	 7yXhEqhO9uBFYZPqeFtd/36f94K4EzPbSwKLk75fp3JZzLJzU1D7SD//QXQvidXsN6
	 gFb0a3SkmTLDw==
Date: Tue, 6 May 2025 23:10:42 +0900
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for
 the v6.16 merge window
Message-ID: <aBoYYrfANv8QLfWA@finisterre.sirena.org.uk>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com>
 <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
 <CANhJrGPMhRy4TW_JMZ8dkgdctgF3f+bAsoWLkrNvqbcbc412WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MCFrpB4KIFdckYLu"
Content-Disposition: inline
In-Reply-To: <CANhJrGPMhRy4TW_JMZ8dkgdctgF3f+bAsoWLkrNvqbcbc412WA@mail.gmail.com>
X-Cookie: Well begun is half done.


--MCFrpB4KIFdckYLu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 08:28:33AM +0300, Matti Vaittinen wrote:
> la 3.5.2025 klo 2.25 Mark Brown (broonie@kernel.org) kirjoitti:

> > > are available in the Git repository at:

> > >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16

> > You need to specify a separate url and pushurl for the git remote so git
> > generates PRs with a public URL people can use.

> I didn't spot this in regulator/for-next. Is the URL sorted? I'd love
> to see this merged...

I've not seen any updates, you can infer the URL by hand if needed:

   s,ssh://git@gitolite,https://git,

should do it so

   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16

I generally don't actually pull these unless there's a dependency
materialises, especially if I'd have to fight with my tooling for pull
requests a bit.  If you've got a dependency then send it and mention the
dependency in your cover letter.

--MCFrpB4KIFdckYLu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaGFsACgkQJNaLcl1U
h9DIrgf/bAUwsQt5WCCIIFbdeuEFAD2CsuYr9X7ABwSEwcESjL3CJfX7XggKWKJs
Jaoc/2FmG7YgukGGU6FEDuAffSUDZOv2ezv7KepYkCsQhMRxtpV5DZyrmQ+sMQjb
mt4hUoJI+wcdtWouXqZI5tW257wOT98aqhUkIGtKs9fpYBR8tsE1tNeFP0qv2LQz
Ra0m78woBCNoigMT5azKbefNhme6rXQa/GZzCH7FCwDqPnw4ooLyWBYRx01/SEzh
nGAeeFtvE1Lepnr3BNcFjq/iSW+GR+OTkEJ2vx8P99lzVlt18oB6IhwrHafGhqde
hOqt4IyGbjfJ8OthPOnrrar5vE0Mmw==
=Al8X
-----END PGP SIGNATURE-----

--MCFrpB4KIFdckYLu--
