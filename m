Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315263CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434758; cv=none; b=O9w/Gp7euHtDA+bMQ22nzZ9H4DA8GXZbvgtvqhFcJzm/QXKAU0n1FPuyvAfMlDj6vsgRrW6eMgAFojfDwBkcFQ965umpnfm+iW6gTY8JCseJml6xU3Mp1D9+AuxMBJqY/pK7CtF2/QwnhkCOTeypp/7WWwxwkjEew9EfgFruZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434758; c=relaxed/simple;
	bh=YbSBCg5rh1XSa/CSXLLtwB9av9TRb1XLO0XYmqf6ha0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNo1eXNPDRBr604EIkXuDSDjOpmNUg90819WyfDnQi62dRjgd8U9Zlt8YO6EASRPokRl3ZinCpk24N75LZNnvCP7O2PsIOvHbHA8r22f+0qJsG/ucyFXwWFb4MjCheNM/nYzdg7b1BhbXzI7m0YLheNwCkJkVYftdZYvLVMJ4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQMy/WCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQMy/WCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B868DC4CEE2;
	Wed, 23 Apr 2025 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745434757;
	bh=YbSBCg5rh1XSa/CSXLLtwB9av9TRb1XLO0XYmqf6ha0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQMy/WCRTDvKk2KH/dnZ7mj3mQVQB7Z7CEqHxI4UpfI3iTKzA9SLPCdMsiBoLYvco
	 iNIHOhJpqXiWwpFiwpPfT4dCqebCTr7SSPXKgTNUPYWZwMfw+7zx/gUlSqUoVoBH4Z
	 l9Rf9IzZXjUDuwjq92eESpDIEPOi9jiyVRTBkwlpqCaJgNnDiQanxj/cS82d9ErQAT
	 9jWn5WRkVFb1gtftBe367CAOfsPmCvkCQpYP4o6u3fWqgLx3BCmihIRViPYqbuQ+2o
	 0s4qAXOPbnL+pZV8dqP/BG+9+yzvyzD/a5bI7tE+kh48Mh9bGdaUU/kb4JKsbrEMw6
	 /WRifDZWstULw==
Date: Wed, 23 Apr 2025 19:59:11 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Aishwarya.TCV@arm.com, sraithal@amd.com
Subject: Re: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization
 when rate-limiting re-enabled
Message-ID: <98e5ab65-7601-452e-9ebc-bb3a7426313e@sirena.org.uk>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
 <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
 <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ub6QCIoIjoSPmZpC"
Content-Disposition: inline
In-Reply-To: <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
X-Cookie: If you have to hate, hate gently.


--Ub6QCIoIjoSPmZpC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:20:59AM -0700, Paul E. McKenney wrote:
> On Wed, Apr 23, 2025 at 04:59:49PM +0100, Mark Brown wrote:

> They reported that the replacing the offending commit with the following
> patch fixed things up:

> =20
> -	if (!interval || !burst)
> +	if (interval <=3D 0 || burst <=3D 0)
>  		return 1;
> =20

That fixes things, yes.

> If that fixes things for you, could you also please try the following,
> also replacing that same commit?

> =20
> -	if (!interval || !burst)
> +	if (interval <=3D 0 || burst <=3D 0) {
> +		ret =3D burst > 0;
>  		return 1;
> +	}

Are you sure about that - the value set for ret will be ignored, we
still return 1 regardless of the value of burst as for the first patch
AFAICT?  I tried instead:

+	if (interval <=3D 0 || burst <=3D 0) {
+		return burst > 0;
+	}

which failed.

--Ub6QCIoIjoSPmZpC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgJOH8ACgkQJNaLcl1U
h9Cm5gf/Qp2YgT/kjjIc49g7fEtTaLBjAvowN/xt+CbU/pqq+aw/mx/Hjtr9NP1Z
LX7ugs5p7AwAN9dxgEquhsQbBLe9vM38onldQ0BCb3nfFo8s/CLxWJVAJq78BKAC
ddd2eX9gM9remVAfOeT4vHdryRV5ga42xKwhMxajv3yi4rSCszP1VhgB7O2SokWY
r4jrBcCOI+bPmOetva80JyFqGehJl7MHdA4WgZ1acdPjylmJztP82PxOgPK4LZlv
ROEakkkbfS8etqNIPeHudot6cUTVU2rWpm0PuzCT+RCTs8ydXUeGs5jJ2RdiKWR6
gVmMzOJTCUnJ3h5hAXSBqeuJ1aPR3w==
=5Wy6
-----END PGP SIGNATURE-----

--Ub6QCIoIjoSPmZpC--
