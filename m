Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82A23C8B3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186862; cv=none; b=ci/VmEM1QRGU28LsN7q3+c4duae2dkfmkLrWKAcS3jHmLA1IZCOvCpr8+lj7RwCAbLEbMJlPB7rxAMzcgids9GWVRIZAidMYIMS+f+P1vyVEPGdu5kIoaSM1ANDDbSbIBwX2KrfEVFI3m7QLzkteLdssD6axkWNsOe2jTex9n4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186862; c=relaxed/simple;
	bh=H++uYy6CxgY3YumTF3321sCEcruCPrIqlCcoVy81izY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guxhUkZBIY3AUxA9L+lmP6QiX9TqgQHpG1+bEO6cpseTs+QLwEHBBOzz7kOOS5ZqSdYGr2hlCr48QcPfRsG+u4rC05KsEN7J8qdEnBs/a2vWu1dmAbYg4g9bP3Vxn8MEinfd0dB2bGOonybNBtFzyrIDK+oPbNhCUm/N62OW+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOeTbKGG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOeTbKGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF03AC4CEF0;
	Tue, 17 Jun 2025 19:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186861;
	bh=H++uYy6CxgY3YumTF3321sCEcruCPrIqlCcoVy81izY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOeTbKGGmFt9OYjoGDHyjdRzdXd/DqoYtvjB6e2ncfn4Cxx4K2iB3m4w/tTdWdrAV
	 lVf5PutFFyw3fvTZXtL+9cXAmh2hLPihCfdGw9g0EBt8Fe8ne2xL+MiBRG1Oq3br8L
	 9ikZi0H+kzbWx1yNmWFPbAjnrXfxq+b2p3HuU3A9qd+eIzxMe0C6/eODYJbwjzBm7m
	 1B3H/WW/Vu/7aovVQgzmPS8JJsoTRN26hjgpkO42XjPrwM7yV95e/2NPhZAc7io8Of
	 7txNATOWhXh7GNcTQE+9D5pAM0zKSSb3pIUqP0xa+t5NmyZIF3wMjXN9wwCR3+a+rr
	 K86K0RxfZHrjg==
Date: Tue, 17 Jun 2025 20:00:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
	kan.liang@linux.intel.com, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <38c3dd09-3a2f-435b-911f-7ed3cd717253@sirena.org.uk>
References: <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzzn0dpw32mQKQ7r"
Content-Disposition: inline
In-Reply-To: <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
X-Cookie: It is your destiny.


--jzzn0dpw32mQKQ7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 17, 2025 at 03:55:00PM +0100, Mark Rutland wrote:
> On Tue, Jun 17, 2025 at 04:44:16PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 17, 2025 at 03:24:01PM +0100, Mark Rutland wrote:

> > Anyway, your conditional length thing is 'fun' and has two solutions:

> >   - the arch can refuse to create per-cpu counters with SIMD samples, or

> >   - 0 pad all 'unobtainable state'.

We currently do a *bit* of the 0 for unobtainable state thing for FFR
when in !FA64 streaming mode, that's for a whole register though.
Probably also worth pointing out that we've got 16 predicate registers
plus FFR which is sized like a predicate register, I don't think it
makes much difference for this discussion but just in case.

> > Same when asking for wider vectors than the hardware supports; eg.
> > asking for 512 wide registers on Intel clients will likely end up in a
> > lot of 0s for the high bits -- seeing how AVX512 is mostly a server
> > thing on Intel.

> Yep, those options may work for us, but we'd need to think harder about
> it. Our approach for ptrace and signals has been to have a header and
> pack at the active vector length, so padding to a max width would be
> different, but maybe it's fine.

> Having another representation feels like a recipe waiting to happen.

Given that we have a different header format for everywhere we expose
the register state it's *probably* fine if the "header" is that
userspace selected the VL to record with, but like you say it is
different and therefore concerning.  We have something similar with KVM
where we expose these registers with the maximum VL we configured for
the guest regardless of what vector length the guest has configured for
itself.  It's certainly going to be more fiddly to read and write a
non-native format if you're not running in a higher EL like KVM though.

Another thought is that KVM exposes the vector lengths as virtual
registers, we could perhaps use a similar approach and write the active
VL out as part of the sample which does start to look like a header and
is perhaps not too horrifying for the perf abstractions (this being very
much a pick your poison situation)?  Even if the VL used to format the
data that's written out is fixed I'd expect we'll want to be able to
include enough state to figure out the actual VL along with it.

If we do padding I worry a bit about the overhead whenever we have to do
it.  AIUI with x86 the register sizes are constant on a given system so
userspace can simply not select a register size larger than the hardware
if they're concerned about the cost.  On arm64 when a system has both
SVE and SME we are expecting they will frequently implement different
vector lengths for each so needing to pad would be a much more common
case, it is expected that programs will only be in streaming mode for
the minimum amount of time required to do the SME operations they need.
Given that SME will tend to have the larger VL but be less frequently
used we'd probably pad more often than not by default which doesn't seem
ideal.  But having said that I have a feeling the overhead of just
recording things may be sufficiently high that the additional cost of
doing padding will be basically noise.

Like you say it needs thought.

--jzzn0dpw32mQKQ7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhRu2cACgkQJNaLcl1U
h9C2vAf/XONAoMNGZmxEGVAdw1hY6QwxhPWlNrZuzeqeWPE4vDESJqYsdkVaS6jm
DQeT7yI/coC+v7O/qcH4QmlUQTFCkPhDb6XKaYosRPAAHLVL4O9oNPsRUXpLVHuy
013H3GFQSrOrWzy6CIvy2OzzgEt4AP8refBmaQ6VPc/yGTPjvjayriMAGMzBcL/R
3HiRC0lGkuvZ2jVHTj/OQYJg5YJ0Gfgdb9zJ0WYtoE35AqY3sBQWvvjOn7ZneoQ4
bD4Yn30AcClxCHIxOzzQwWq7HtiF4ea2e9mp0hXnk7TW2oWsLmRpx+VKaMLgBdjV
mBqzYK+PBXEMkq9pvbxNq0SWWDAhug==
=8TAi
-----END PGP SIGNATURE-----

--jzzn0dpw32mQKQ7r--
