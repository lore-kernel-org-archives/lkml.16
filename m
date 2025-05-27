Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CEC258CF6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345285; cv=none; b=PHReyMphp6aYC0Vd5BqrWgNgqpzinwHV8UV64vEEhpPwH3l6mJIitE8aw+MWs9Apac1zk0zJPc+6ebeF8epxwGCcTWx51Tfb2dXZre4NBrdU3zu8QkGwsa0/GZzPluQeAOzJyOl3d9QKi9UWbynSMOieo+N+dFIHC2YSaDp7enk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345285; c=relaxed/simple;
	bh=e8ddUAcAhPV3l5dBkgY/xuvDDZopdmpnqpS9KtVRxVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWkFmOyRGkyufGDConMTt5BS4+t8QbqnpmwlsGxOnM4sh2yUhGIoumMRZGlOfA/aix+fK3LFzcz0ve2YvBoPV/Mj6yU6EgqPDHl/Id9nHkmf77H8P9D1Pn4eOP7SCDtw1yJO0mNpQqXe/kO9E8JmG4/Ya8VqrSy27lpef5dolc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvkjMVNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvkjMVNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F63C4CEE9;
	Tue, 27 May 2025 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345285;
	bh=e8ddUAcAhPV3l5dBkgY/xuvDDZopdmpnqpS9KtVRxVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvkjMVNqS7XC52fNlKRybn1OoCtgS8x8R/GBAiGz+G9cX6/TNKD7vWmTgo3W9FnD9
	 nU3HZSxEo57YIOzK88YDXac0w4UpgCqXLg+C5JY2v6fTk0ETvjTCkqC44iAgzAHFXF
	 gCzsLeQnANMW+3R30XZwusRynCQDz5YGDpcfH2FVbv7GxztOPD3KYGDr8IXOTRGo8A
	 Efg471bhtviU6JmKWMKyFayvP/xcjeB5KSHnhKR4i4x6cN9u2/0bzYucHZ0M0jc7eX
	 U0RkNbeXpJwX8Law7lsscUs208K/D4yAe+5MqsFAfzt7Tqbofbi/W8aFmRiI2qOPkL
	 2r1Mx6jrE/0LA==
Date: Tue, 27 May 2025 12:28:00 +0100
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
Message-ID: <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9UDHV7Y4OQ1VHzv1"
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-21-bigeasy@linutronix.de>
X-Cookie: Identify your visitor.


--9UDHV7Y4OQ1VHzv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 06:29:20PM +0200, Sebastian Andrzej Siewior wrote:
> Test the basic functionality of the private hash:
> - Upon start, with no threads there is no private hash.
> - The first thread initializes the private hash.
> - More than four threads will increase the size of the private hash if
>   the system has more than 16 CPUs online.

This newly added test is not running successfully on arm64, it looks
like it's just a straightforward integration issue:

# Usage: futex_priv_hash
#   -c    Use color
#   -g    Test global hash instead intead local immutable=20
#   -h    Display this help message
#   -v L  Verbosity level: 0=3DQUIET 1=3DCRITICAL 2=3DINFO
# Usage: futex_priv_hash
#   -c    Use color
#   -g    Test global hash instead intead local immutable=20
#   -h    Display this help message
#   -v L  Verbosity level: 0=3DQUIET 1=3DCRITICAL 2=3DINFO
not ok 1 selftests: futex: run.sh # exit=3D1

Full log:

   https://lava.sirena.org.uk/scheduler/job/1414260#L9910

--9UDHV7Y4OQ1VHzv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg1ob8ACgkQJNaLcl1U
h9AXbwf/Rvs4s6D2yura4n5NtMsqS8XdGRcsRw9+O7vrDeMUhWoP5W6i29FaFBm+
W4IIHtHlU7b3oaNn8PQMe3BvSkW3qjQxUdh2NgVzGDFCXs/2nrYJDHzXO3grT749
W6kA7iMImvrGcUbREervQ15EpGL+BHJD4clVZlwMPOCI4ndtemQV/7guvi5R1wRF
hIqQBKvX/rwAJyGIAtPkJXZynUuunUWpHiPUneBLk6e8Yuuki6BD5N/FW4LDOSK2
pi0UOeEjq1lA3tKHQuPf35kWluUr/JsJZKT7aLoj4P7fI6WP+wNzkP88XxsCTUbh
rpcvF8Zbm70Si8x+ZtAMMBypXMPb0Q==
=lJBf
-----END PGP SIGNATURE-----

--9UDHV7Y4OQ1VHzv1--
