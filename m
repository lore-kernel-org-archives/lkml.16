Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A34C2ED
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350785; cv=none; b=p+GAYuvg7akWBCozocEmCNFgJMcUGPn2+UILnY5IRHW2p+k13kzReGzAuf6wDNiiY6trxbwHa537UWT8B+4bFW1O0K/vz/lskQe+ndMN9GXwEajZ3prhwQ5WHowASNnRztTZZYX2PHtiTRe+6O+k8PVcJQbTCIl2r4TKUy32vQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350785; c=relaxed/simple;
	bh=e1GV5Fursv3jxjXaaowLW93Sq4u07fQHxLyWLASUANw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH9AfJatsSN4dIu4Kbyf2eejK7kmzXYvs8vmSMWTZ1TLVSdD4XyDiJ90ow5PNeZvuSTQijWSSXjZAHcZNMS/4u/pqGj8L51iQF/TZPBJQTrcpDZCZKfW+fT8GK1+t+2D8c5PbXH28LvJZETDH+52fJPUmU/SYk5fA40nEYdbCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N11naXjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N11naXjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A2EC4CEE9;
	Tue, 27 May 2025 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350783;
	bh=e1GV5Fursv3jxjXaaowLW93Sq4u07fQHxLyWLASUANw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N11naXjyZEIU6+bo523gk32c83h8FCHwgmbeVRM5VBum9pT3LgAr/OtjxVn+bLi6P
	 pFgQkI01SZwJR2LWGvj0CBVZOULeZUB9g5eM2iU06h/ZSCxC/21fScGxZoF78/gf5B
	 k2tk3LISTgRykpTKhfABgCb7idfnKdfSwMQ2bXxJ66WeFPqvlPft60maYpLvMQd3dj
	 wJzGqLnhwCSmMR/IiODi1a0PRoxJBSFyKFqFJnqQT7wL8b377d0M95YiMv1MgEG0Dv
	 wISNlCinqfOxvlHaMjbmM8XU2ND03RVicD3EZKIg81kUE3aq7xY612sz3GFoagSJJk
	 /iy6pgeMpPu/g==
Date: Tue, 27 May 2025 13:59:38 +0100
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
Message-ID: <269b2f41-1405-4cab-9310-11df428e64c6@sirena.org.uk>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
 <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
 <20250527124327.5UDnm-ho@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZwUdE3x5uzFqZERJ"
Content-Disposition: inline
In-Reply-To: <20250527124327.5UDnm-ho@linutronix.de>
X-Cookie: New customers only.


--ZwUdE3x5uzFqZERJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 27, 2025 at 02:43:27PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-27 13:35:50 [+0100], Mark Brown wrote:

> > Yeah, I was a bit confused as well.  This is running with an installed
> > copy of the selftests and IIRC the build is out of tree so it's possible
> > something is different with that path compared to what you're doing?
> > It's a common source of problems?

> It shouldn't be. The test is self-contained and as long as the run.sh
> script invokes all is good.  I don't see what futex_priv_hash might be
> is doing different compared to the previous test.

> I just noticed that after the two futex_priv_hash invocations there
> should be one futex_numa_mpol invocation. That one is missing in the
> output. Any idea why?

I'm not seeing that test being built or in the binary:

   https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d146/arm64/defconfig/build.log
   https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d146/arm64/defconfig/kselftest.tar.xz

(note that this is the specific commit that I'm replying to the patch
for, not -next.)  It looks like it's something's getting mistbuilt or
there's some logic bug with the argument parsing, if I run the binary
with -h it exits with return code 0 rather than 1.

--ZwUdE3x5uzFqZERJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg1tzkACgkQJNaLcl1U
h9CPuQf/QA3o7L5N8+KdE1DQyg66xnawb8GV7nKiV2MttE7F1uI/BA6rMXLjznqR
i5BXGvf7kmDZW4jjywVFh++cnEwrWDMbUnXfR64gBzRiuGNx/AesE/94YXDnoY6k
vixLY3RGFvZiLE2lVXU3nKC2bYCBT9FBhjiUTawkGzgYrLcW4p0s4mtUBWg50fvm
WHkqnoJR7RJROUv4UjZWE7yswQ/VPuQLueaPrKBh3LFVgHyzJF+/Mu5ReT4CM49t
vdfV6tzHRDzUPu3kDh5MWAdkZTHOrXehtE8hjt6s00rcjiSuOEeJbKKA6mdDPE+e
wZtICdc597ab1UPOR/giI/wb+gzdzg==
=4XED
-----END PGP SIGNATURE-----

--ZwUdE3x5uzFqZERJ--
