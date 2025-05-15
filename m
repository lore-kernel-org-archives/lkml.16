Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB101E990B;
	Thu, 15 May 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301624; cv=none; b=sS1aJ5gzDXShTw2WvyGAsTanB66uqZpWdLdEBZgGJIYpXtumgJ12HbHZJUf7N6A0yYE746rSKYI00a3fWHEI14UC08rfehMqrjWW7iz0dnEZ1rBV1ivr35PkPathw8HuucE7eB2T68VlClHn8BfB6K+NVfG7shMvGLYgVF62eH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301624; c=relaxed/simple;
	bh=U+tPnOpL3m607kNEaHvTgUEJzEiFqUT9VJpj4Anya/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrq0Kb1EwKMjeHukNhq2U811Wbxs8FkIupC+CYYgEykHvUDio4PDbkeAmlsVBJsfBXgdEfltpNpiJ+tEQyKTYIkikICQXIo1ZvCprxu00QuJbqERpnr7lW8lOyUxPSwysMqnDaexzYq0gSRDb53vU1XRjp01PbxIsCFks7CXZ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXNjgnWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXNjgnWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F04C4CEE7;
	Thu, 15 May 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747301623;
	bh=U+tPnOpL3m607kNEaHvTgUEJzEiFqUT9VJpj4Anya/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXNjgnWA+H9nCoRF2qGohiFrM+9FMPSMyzLbuKMGzSIut6SneQ5AYUcvMaR4mY8zs
	 5rZ2AQ0wyVGpNGFJXsr1fU4zR+9Uzk66i7NnFVaQlkhcQaXpo67AMgy/qYLD628N0f
	 faFIQ9MSqNnmIyNl2evCqzqXt9Cx69CBb+nnunbzBgUGY2wu4gDEYlKPFCElm+ZzUF
	 oI0ZEebDwChS2GbD3vAcnmmT5D/eugikStnnPtMeePAKnCR5P+RTAK6fWefc5ukQ28
	 r/ilLS4EEcMC6h9BU9inlZuFI2WrvRWCrPtFi1hDuFnefN8qxXICkIoQUMdd4YRTaZ
	 pExzq0Nm0S3/g==
Date: Thu, 15 May 2025 11:33:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejBQO6RFNOdfKSiv"
Content-Disposition: inline
In-Reply-To: <20250515092000.GF2936510@google.com>
X-Cookie: Well begun is half done.


--ejBQO6RFNOdfKSiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
> On Thu, 15 May 2025, Mark Brown wrote:

> > Well, you choose 3 - I do think it'd be a lot easier to go with option
> > 2, or with applying the rest to your tree as acks come in.  There seemed
> > to still be a reasonable amount of discussion on the MFD bits (eg,
> > there's some formatting comments still) so I was expecting this series
> > to churn some more and was waiting for a resend.

> Yes, I expected to apply v9 with your Ack.

OK, that's about where I was expecting - at least one more respin before
the MFD bits are stable.

> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> in would be sub-optimal and would likely end up in a mess.

Well, then just going a head and applying them on a branch with a tag
seems easier than delaying then.

--ejBQO6RFNOdfKSiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgltPIACgkQJNaLcl1U
h9DkqQf/REpQxgWVfq8b7aQzalvyecOuF4kgL/JR9uyKEG8EDkwpLRnT/+yxJmCX
Dkw4A53gNv/cD2E1UWI2AYs6i4/rUScPzGsjtiUV5AUoDJ91LB2uxgHiSk/xFpck
x6A37s+FfJYLx9Gmq8cfwVrl103CH7er2kqiadxUL0db4mPXvq/g1EPk2XmuP/Lz
/dkbZtw92fLqWkofr/kiGGoKV9TKa0vlcVmunnaF1Pm14oN+cpTU3aAT58Ogi6Vn
1AuIHpgbH1fae6uL52xialrE8H3PVQF0KkkxyMPrSj+mSL17DDN3jDCXoz6Ypw2Y
eJFtfBiL5D0nmaE7Z2CtBkgLq3LMow==
=U5xD
-----END PGP SIGNATURE-----

--ejBQO6RFNOdfKSiv--
