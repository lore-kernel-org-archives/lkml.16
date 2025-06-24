Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA828313D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772175; cv=none; b=YjI4HMZ7ktssY22SZMxIzp796o1xvKStkcVAdPLNiqEjCSVaSK5Laz7qsfysdtmcZp37JobPVJfnGQxH5b3CTGICtBPvIvn/dIhEfEmh2brdbYOgE96KK+RnV9H0chs1uh9UUh0Q6YbaADlPrxgGqhljWQmz1YNs+c1YjcybM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772175; c=relaxed/simple;
	bh=DxzPPh7UbweOIrQkRNObcHZgtsQIPscNCqcNAExCunA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dfPO3hQxX7h2FPDsIhLXv3z1VD45j7SBBXmAnnaPviDEhTYz6iTrHDAR/VGKDhfAGieZcUNryRsHTBwNxSPcjLsibzx39kSDE7evfR1xRByva79ftphB4fBz2dphY4zNLYCL37PnfLWJUhs4uhLd61+y5LA/0kq+AVvSHZOeYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YbF4sUFa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=udYulpfC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YbF4sUFa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="udYulpfC"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750772171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUVAlCiU2PbwjKHg5CRahWaXnzvb22Zj2T3X59BzOOw=;
	b=YbF4sUFabswH9yy7yUNQLYeXglbPdnsf4v2wMhqyIs5lU9lbnfcpv00JgQ7wVYkpWpLAbq
	MFGc2bN1menfLKshwssJDvLum4lmp/P4CJoaree+FvBCn4R/KGyb8qoVHO8umtNcNKYpAN
	mjMGsmBz87cr7Zw6MqyeAR6oXH8hxSzWlGOOhjRfNFAufFM9lNItEKsbixs1jwphEQ0z9s
	VZnT+NMbT9a++KzW1Q2g/KJqVkv/FpT2KWpGok8eWNWgxFQIJ89QKEK8GIrS7tsadhF2sj
	UZ1alpwkHev2rrHlw3sFbFVDw+jTWz35Rkgrmcm2HrDLjvYR+bh9pqB9Abxm0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750772171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUVAlCiU2PbwjKHg5CRahWaXnzvb22Zj2T3X59BzOOw=;
	b=udYulpfCW+nuxSewUCgP4p57WgAuuX3t0RQ0zPJlZCzxFYVGmDO3yx80Yso9R++xIvYzgO
	LCEhjmsCtk4XtQCQ==
To: Li Chen <me@linux.beauty>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Peter Zijlstra <peterz@infradead.org>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Sohil Mehta
 <sohil.mehta@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
 <patryk.wlazlyn@linux.intel.com>, linux-kernel@vger.kernel.org, "Gautham
 R. Shenoy" <gautham.shenoy@amd.com>, Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH 2/2] x86/smpboot: avoid SMT domain attach/destroy if SMT
 is not enabled
In-Reply-To: <20250624080810.66821-3-me@linux.beauty>
References: <20250624080810.66821-1-me@linux.beauty>
 <20250624080810.66821-3-me@linux.beauty>
Date: Tue, 24 Jun 2025 15:36:10 +0200
Message-ID: <875xglntx1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24 2025 at 16:08, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
>
> Currently, the SMT domain is added into sched_domain_topology
> by default if CONFIG_SCHED_SMT is enabled.
>
> If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_weig=
ht

If cpu_attach_domain()

IIRC, I told you that before.

> is just 1, it will destroy_sched_domain it.
>
> On a large machine, such as one with 512 cores, this results in
> 512 redundant domain attach/destroy operations.
>
> We can avoid these unnecessary operations by simply checking

s/We can avoid/Avoid/

Care to read my reviews? If you disagree, then discuss it with me, but
silently ignoring it them is not an option.

> cpu_smt_num_threads and not inserting SMT domain into x86_topology if SMT

not inserting? That's not what this new version does.

> +static void __init maybe_remove_smt_level(void)
> +{
> +	if (cpu_smt_num_threads <=3D 1) {
> +		/*
> +		 * SMT level is x86_topology[0].  Shift the array left by one,
> +		 * keep the sentinel { NULL } at the end.
> +		 */
> +		memmove(&x86_topology[0], &x86_topology[1],
> +			sizeof(x86_topology) - sizeof(x86_topology[0]));
> +		memset(&x86_topology[ARRAY_SIZE(x86_topology) - 1], 0,
> +		       sizeof(x86_topology[0]));

So this sets the last entry in the array, aka the original sentinel in
the last array entry, to zero...

This is completely pointless. The above memmove() copies

	topo[1 .. (N - 1)]=20
to
	topo[0 .. (N - 2)]

Where N =3D ARRAY_SIZE(topo).

Therefore
        topo[N - 1] =3D=3D NULL
and
        topo[N - 2] =3D=3D NULL

No?

But then what's worse is that you fail to take that removal into account
for the x86_has_numa_in_package case, which still unconditionally sets
topo[N - 2] to zero even if the SMT level had been removed...

Please take your time and do not rush out half baked stuff.

Thanks,

        tglx
