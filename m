Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D912CD96;
	Thu, 15 May 2025 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296179; cv=none; b=T41DybavB5v3np6i/BiQ55/olTltu26Krdi42il4PZW7QhOoLaKvsi1OgGmPeV21Q7FHiPmXPc3LFiQSvtBzdgEWmChBoC4OlvsQJnxNvOhZrlc0z5ZvlyPe2OStpTmq0FVJ1xqquZKDuIafNDm0N2QCqQh6CbI5JhRCMUHJeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296179; c=relaxed/simple;
	bh=bDjuUuhDO1eKs8zJQ8OSPWNjfdrBghRphQ/ti3Qq3yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV3AukY6k1rmF7Ujyjq0Cvt2ykn3A6a8f6p/cJ1Ekq7P/AA1ubIckpU1IM1MHFt3V8Scpj7Dr9xmH7CRlWjT8ZGVyNtAoi2oZgk+NdhlQx5v9Af5b6ZEBS1VdymrAvZJIZqZgjVXKhcfqvhDpehDdaS1VtF9i8FvgnOtBbZSnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECdt2NVr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECdt2NVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB71EC4CEE7;
	Thu, 15 May 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747296179;
	bh=bDjuUuhDO1eKs8zJQ8OSPWNjfdrBghRphQ/ti3Qq3yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECdt2NVrLK4F2ha+dMk5ZykvFmtwjx+CpHviKSOzucKfOyBZJSN50/VtCRIdom59g
	 tOMkWWi4eTJUQLB16cn1bigliKv9vH10OUDFhFXT9gEfQQNaiG91DDONVViomJEIee
	 8LxUMfJI0ZYf3vxD1BuOn3M893502sFR5TU++erM+j+ypxqaKe13hJcP4AhfRJ8T+I
	 yrQVKUVaKdvYtDwX6rD3DzEcxPyCMjwVpTsMmdw2u5u0iGP+ifCNlN4oNEHAHVwkAm
	 CWdfxDCbAiX1snrVLsyUcOLxRL+4OPRCVxYOesWMoyh/K3bdcsKeo55cMQIl8WLslD
	 V2tYibkVzlX3Q==
Date: Thu, 15 May 2025 10:02:53 +0200
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
Message-ID: <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+iDnWdstEN1hguV"
Content-Disposition: inline
In-Reply-To: <20250515071357.GD2936510@google.com>
X-Cookie: Well begun is half done.


--3+iDnWdstEN1hguV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 08:13:57AM +0100, Lee Jones wrote:
> On Wed, 14 May 2025, Mark Brown wrote:

> > Could you be more explicit what you're looking for here, the diffstat is
> > entirely MFD?

> Okay, more explicitly, I can merge this and MFD will have no issue.
> However, the Regulator commits make use of 'pmu_id' introduced in this
> change and would therefore cause a compile break.  So we could:

>   1. Apply this now and merge the dependents next cycle
>   2. Apply this now and provide an IB
>   3. Wait for all Acks and apply as a unified set

> We usually choose 3, hence my assumptions above.

Well, you choose 3 - I do think it'd be a lot easier to go with option
2, or with applying the rest to your tree as acks come in.  There seemed
to still be a reasonable amount of discussion on the MFD bits (eg,
there's some formatting comments still) so I was expecting this series
to churn some more and was waiting for a resend.

--3+iDnWdstEN1hguV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgln6wACgkQJNaLcl1U
h9Ccawf/eQQDUsNgS0TKYfGdBLq2g0QMIhInBoBlUy7l3xZbRm5WP2U9ZBbH5/2f
dxkSlwAkqIR29ii+atAZqTqbxdZxBMrcEkt4VergJxL0bXFZtmGxpRWq6vJ2w8gh
d5RBAd+2TKRlb/Augai+XkjI9sFVe4pt3Xpj4CiIx7zUHI31ZH0UJ7dGiCyvE4On
OWtn0GQ30jDyPKEfnFdMnkEM6WBFq+5GRvXcGba8qa6xTlwWYB/nQ30czLuz4yxA
PvvKw5KMT8aj9STkWj/Nqbbc6RyojjiPK6XrnPzkK/QaF6Pv1Lmo6D1Fim1ri82N
7mGSZ21WJB9/+4JRRFc6NBONqJvzKw==
=0NJf
-----END PGP SIGNATURE-----

--3+iDnWdstEN1hguV--
