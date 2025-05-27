Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B292749ED
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353228; cv=none; b=nF6OgYo+uMZBWo3UmaTf+FE+BXjhO05fqSpfzvlac5dw5HwWuzCisKFa6ErAIIovxowuzFaPWFwbzFUXRsntdnvcbJFy4Po/1uy4q0gs6Vdj5iGUSW0n3SG/YSMOAAwqMAgDTV1CUU53T9Wxvu4uMg5m/r+UUpOofsf41JHXGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353228; c=relaxed/simple;
	bh=NKXxKBLhKHSeCIL8DOxhqdNGPwSsn0FRVfaShuEsJlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpwExlcsiqcD74EvOUP07cw/xQUmYMZZtg0G450KQuRQOO2ZApKnWNJn3nYPijjq5UciI5PQiZhbq8UgfUibiHIwhNnLzkyM7MGBgq0F2iJLQimb5y5W2iI6pQh+mcrhZe0bIWwHu2VUG13yXqcBnE1KnnNOpaUtC/QewEF80RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoZh9I2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoZh9I2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8075C4CEE9;
	Tue, 27 May 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748353227;
	bh=NKXxKBLhKHSeCIL8DOxhqdNGPwSsn0FRVfaShuEsJlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoZh9I2eAjzVq4ZywHMWomwG5MvufiipnhUf/UkFwmxfJ7TpoLQA3CC//3ldEgfyH
	 wtPNw9V4EBBUq8BfIj+ifbiOHpzyM88DKVZX9SYjChZpEbQoNNOUH5UjFimkqSjBOM
	 WB2teLi/cDX92ryiXd6rSW+R93GmIIszm/eqMiBhO4CQDvaj3TY8b0O5KQoNNK61Hm
	 D+7kYmyCUwAKc0ixAAxdAugFEEHHND8sdN7uKf0z3wiLeHp77cdwk9MLJP2YzR0g8P
	 xSBSdFLd0IHVI0H0FjGq+PpXuvDKwRgLV/1fYuYaDOU/V72LD2I1So3cf/TP5rYqxW
	 HyApKMwno1gMg==
Date: Tue, 27 May 2025 14:40:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <36bdcbe1-5f74-4afb-83dd-89f7348aeb5d@sirena.org.uk>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
 <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
 <20250527124327.5UDnm-ho@linutronix.de>
 <269b2f41-1405-4cab-9310-11df428e64c6@sirena.org.uk>
 <20250527132533.lqWBepWy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkiLacFJXVqFQ3sk"
Content-Disposition: inline
In-Reply-To: <20250527132533.lqWBepWy@linutronix.de>
X-Cookie: New customers only.


--lkiLacFJXVqFQ3sk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 03:25:33PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-27 13:59:38 [+0100], Mark Brown wrote:

> >    https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d14=
6/arm64/defconfig/build.log
> >    https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d14=
6/arm64/defconfig/kselftest.tar.xz

> > (note that this is the specific commit that I'm replying to the patch

> Ach, okay. I assumed you had the master branch as of today. The whole
> KTAP/ machine readable output was added later.



> > for, not -next.)  It looks like it's something's getting mistbuilt or
> > there's some logic bug with the argument parsing, if I run the binary
> > with -h it exits with return code 0 rather than 1.

> I copied the logic from the other tests in that folder. If you set -h (a
> valid argument) then it exits with 0. If you an invalid argument it
> exits with 1.

Yeah, so it was actually parsing arguments.

> But now that I start the binary myself, it ends the same way. This
> cures it:

>  	int ret;
> -	char c;
> +	int c;
> =20
>  	while ((c =3D getopt(argc, argv, "cghv:")) !=3D -1) {

Ah, yes - that'd do it.  Looking at the other tests there they do have c
as int.

--lkiLacFJXVqFQ3sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg1wMYACgkQJNaLcl1U
h9BHLQf+IKeUMy71KRyZ7siyYFfNYd3lI9daFcqN0hkpy16wx6JIPAL1ITcgYX3W
N5CAj0Ql/8M8QdioqDgUCxByzidNPDa3kky3dhKkaBztpO6/H0eOsGRN3gqrjFSX
1NoN/ZTUe+aBoNnjw8cdjKGM6IfMX7c8EWiirSk07Z8YHyOMhcG1gGvC30Wl3L4Y
F/vfbq7zeESk9u6OGwlH0E1R5hlrWQ9GpvEj1yTcdcUkWcggM0DT2458x0Q/Q9dn
lSszCg4d4MoeKKGhZrFqHSriNAq8AxBHFt10De0baKf+OX3CYF/OYkXdW7fUgzbW
qksHO25qb+yDCSfzALC+4B17W78x3g==
=L7Ov
-----END PGP SIGNATURE-----

--lkiLacFJXVqFQ3sk--
