Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E725C83E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423996; cv=none; b=OGcLDaofeCyNm4xOsx0m6gpY+8PJT+dMMc4/QZcCPB52y4JIfhsU3xPMQOu5tjpgj2Wk+o/a7fosHGUeSrHNT9MYQXmyQhu3kXVQqqmeq8At5hZnUZrrjUpgDq+62g/1yYyFG8KmWvBtLGtdP/KTQE7I9/f90CL7o7EZ+v8PB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423996; c=relaxed/simple;
	bh=fKOOhxBmLqqUQizLEtoVJN4/gxy8qbr7uqSO+qgPMpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0zlrMwrfgEmJ/dkxbGpsemDVzFi2nnvcnTeYHX0ey1rBiRPhioCRSOvOTKQFaktwp/B1WhtWN2iaffjxypbbZQ0tf51pzTnY2S3OorUzjXevH/zMDaJjRwyhCL8UucGHyJdLNKucmgUF5upuZvk5+ZlGSna7MM+TJSpEqBAORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7XrU6R0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7XrU6R0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A217CC4CEE2;
	Wed, 23 Apr 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423995;
	bh=fKOOhxBmLqqUQizLEtoVJN4/gxy8qbr7uqSO+qgPMpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7XrU6R046vTfci5uyQGMwpPcPX/5rUAmqCpG7ekzsoBXUnhCKr7mZ5fHyrS5Ud9/
	 kNwf5VSIu370pLS4UCaiLxHYE/SrHgvItuLoMoCU6pT3foe73B1gK0zLppsD/d33DC
	 fZ1Ndkh7DOf/PVi1Y19GoNLtL61A0wRdr4XweA6mOo5vXpBWFsfluVbTlMrTmDiei1
	 AwoXQ5dUYhNnHzom5Z/+YKIpmO0oO4XmpN2tXB6WN+obrgc45mxafAYyp+4Nam8EJL
	 Bj0+ZD1MY3DjHjStdV8vtTAExMpRgKGiEyKoiEr1lBLVinNM2MheFKd0pmJvaojtOJ
	 dc6JA04rOnKeA==
Date: Wed, 23 Apr 2025 16:59:49 +0100
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
Message-ID: <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wGDMa8FcLiC2f7lB"
Content-Disposition: inline
In-Reply-To: <20250418171359.1187719-11-paulmck@kernel.org>
X-Cookie: I'm wearing PAMPERS!!


--wGDMa8FcLiC2f7lB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 18, 2025 at 10:13:56AM -0700, Paul E. McKenney wrote:
> Currently, rate limiting being disabled results in an immediate early
> return with no state changes.  This can result in false-positive drops
> when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> structure "uninitialized" when rate limiting is disabled.

Today's -next is failing to boot a defconfig on a wide range of arm64
ACPI platforms.  One ACPI platform (Softiron) is still fine, and I've
not noticed any DT platforms having issues.  Output grinds to a halt
during boot shortly after userspace starts on affected systems:

[   23.334050] Freeing unused kernel memory: 11328K
[   23.355182] Run /init as init process
[   23.378221] NET: Registered PF_INET6 protocol family
[   23.396506] Segment Routing with IPv6
[   23.414054] In-situ OAM (IOAM) with IPv6

A bisect converges fairly smoothly on this patch in -next, which doesn't
look completely implausible for something that stops console output - I
didn't dig into it at all though.  I see that Sirkanth (CCed) seems to
have reported a similar issue though with a different SHA1 since he
noticed on yesterday's -next.

Bisect log:

git bisect start
# status: waiting for both good and bad commits
# bad: [6ac908f24cd7ddae52c496bbc888e97ee7b033ac] Add linux-next specific files for 20250423
git bisect bad 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
# status: waiting for good commit(s), bad commit known
# good: [2a9308cbc987660dd54df7af2a8685d512d467d0] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 2a9308cbc987660dd54df7af2a8685d512d467d0
# good: [68123785b5b6b54698b92e534c2d42cbb39701c0] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
git bisect good 68123785b5b6b54698b92e534c2d42cbb39701c0
# good: [99554718252d6f01036ac8e0b45bcfc16bf0e0ce] next-20250414/tip
git bisect good 99554718252d6f01036ac8e0b45bcfc16bf0e0ce
# bad: [d017479907b87ffbcfe908c7188f19722d3fdb46] Merge branch 'togreg' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
git bisect bad d017479907b87ffbcfe908c7188f19722d3fdb46
# bad: [379565a0c27c2b9c9e6df8cac66dd458a71a33b5] Merge branch 'driver-core-next' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
git bisect bad 379565a0c27c2b9c9e6df8cac66dd458a71a33b5
# good: [fd02aa45bda6d2f2fedcab70e828867332ef7e1c] Merge branch 'kvm-tdx-initial' into HEAD
git bisect good fd02aa45bda6d2f2fedcab70e828867332ef7e1c
# bad: [a46505d01338de4299d417ebe01b12060ebadce7] next-20250414/workqueues
git bisect bad a46505d01338de4299d417ebe01b12060ebadce7
# good: [5109fd27d5ade19fe5de22c746157c693878dde7] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git
git bisect good 5109fd27d5ade19fe5de22c746157c693878dde7
# bad: [ad0c7a85f8b529154c99103d4daa0e86f4c14272] ratelimit: Avoid atomic decrement under lock if already rate-limited
git bisect bad ad0c7a85f8b529154c99103d4daa0e86f4c14272
# good: [945e63d4897045421a64f86cbd8194e0ff06dc41] ratelimit: Count misses due to lock contention
git bisect good 945e63d4897045421a64f86cbd8194e0ff06dc41
# good: [13fa70e052ddc778ecf70db21a07d97c2487da90] ratelimit: Allow zero ->burst to disable ratelimiting
git bisect good 13fa70e052ddc778ecf70db21a07d97c2487da90
# bad: [5d80e7bbfddda9369f301b484d621c45de8edf5f] ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
git bisect bad 5d80e7bbfddda9369f301b484d621c45de8edf5f
# bad: [c8943bdecfc76711f83241e21da9d4530f872f0d] ratelimit: Force re-initialization when rate-limiting re-enabled
git bisect bad c8943bdecfc76711f83241e21da9d4530f872f0d
# first bad commit: [c8943bdecfc76711f83241e21da9d4530f872f0d] ratelimit: Force re-initialization when rate-limiting re-enabled

--wGDMa8FcLiC2f7lB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgJDnUACgkQJNaLcl1U
h9A4sgf/fSfrk/7ZH7MgvVTv2cpWXUBgg/KwE9CdVrUEwtL65meKJIrnUirJjqcO
6Mpez4CcguqNayP9OCBzHVdh6VNE8SbyRo0QCrkv3nDmDF/FGHgldPNDEC3sZhBd
Cs3WSRXbdwm97+Mpk/oF+TzXFzOuys7F44Ghv49AkZ+85i9ZjK79tdGTbF3HVqYG
rwwvQiAyveNQ0DU9T1tqwcdn15iM6LuOkDh7ml2DMvjtfMAhxhAUf8TldZI0I9Oz
diIzWboKD7dWxx5BXta4SSFMSv429hOzx6AGLRbX/C6BD8NS9ZQQvHuywHxHFkBX
txwjpdGgrD7601JxbkrA2EJKdnq1rQ==
=mLke
-----END PGP SIGNATURE-----

--wGDMa8FcLiC2f7lB--
