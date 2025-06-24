Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16A28E5F8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771059; cv=none; b=jyIu9P19FGsIwQPmFsEtvtwWtW57zAKwlprvTqwpsvAndg7ZICVAxqGcxt3zBxnzfJW/mMFxGxYeYDpsNUVjP+Hl6huloI4ijtq+qH+YQsmtRRJ2CmMnQJA/IH6hHKnk92fU6STScM23nOrbrJuH+LMSXy5QaYUrxFaCYl5n2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771059; c=relaxed/simple;
	bh=58/OCqpQ7WUDprpGdcjlaMsOB10LaVqKAGJ1TTvEmWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRtGKYElKZIVF+k0eSX9i1OVyFz+HdLpR/y5i74BjPvBWqvLtzGfZIp2b/e1tzaozUmKAql5JRF3Qzpan+1lvflLmU/Lv5IbIPyC+cBJeGjgklGfCG7Xl9b+mqUdn054G1vseTy//MPn2PDm4FHT2J8+M4LbZPrY56laa7xA7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dVh7i0sj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dj4kO9Hf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dVh7i0sj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dj4kO9Hf"
Date: Tue, 24 Jun 2025 15:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750771056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IieBpWHrUJv1ck4+wSYHEjk5x9SCb1YNYUD3LP0jkSk=;
	b=dVh7i0sjSNv6aPgxQQ3ZbfR+PVq9/BRCCT5OvFwO4opVw94YOleFduwwtJ7i35s0RY1mcc
	spkMDXgoW422GwQP6qWPAM0CmCOl+LbO7vvk1oI42cBn31ikvj30RLLzB/lE49oQY7KduT
	yaBtTMMeKTgHPaDyiijt/qzGrYm/GwVCwNV3HVqKRZ8ljkEzSEesDWoEAEauJ2jnydQSqW
	KPcM3FdptK4WSd0JK86mxmDCa5fGFnQ4qGNznydbfIm8qeXtSulkG2+3VFtJwFWqnQ8APQ
	fpYMGkbEodnbIM6uVPLqM2tND7SieEpJZXJ9p+i81HbitX3t4+tQDAplLelxOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750771056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IieBpWHrUJv1ck4+wSYHEjk5x9SCb1YNYUD3LP0jkSk=;
	b=dj4kO9HfCpnvs8yEFiJQ1vwOtBep2CJz4cxkEeFgjILyB6PMaRzRqeRIOnE/DR03iTOxoI
	CxclgKHT7ijIsMAQ==
From: Nam Cao <namcao@linutronix.de>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624131730.XqPd1HUR@linutronix.de>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>

On Tue, Jun 24, 2025 at 01:37:13PM +0200, Clément Léger wrote:
> On 24/06/2025 04:09, Maciej W. Rozycki wrote:
> > On Mon, 23 Jun 2025, Palmer Dabbelt wrote:
> >> I'm kind of split on a Fixes tag here.  One could argue it's a regression, as
> >> having interrupts disabled during exceptions is going to cause all sorts of
> >> performance issues for users.  Seems a bit risk to just backport, though...
> >>
> >> That said, if nobody noticed then it's probably a good sign nobody is really
> >> paying attention and we should just backport it before anyone notices...
> > 
> >  Oh, someone did notice and it's not only performance, cf. 
> > <https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk/>.
> 
> I also had a series which was doing so for misaligned accesses handling,
> but after discussion, it was not ok to do so.:
> 
> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/

If I understand that right, exceptions from kernel should be treated as
NMI, so that lockdep can tell us if exception handlers touch locks.

But (conditionally) enabling interrupts does not lose us that benefit. It
is still considered NMI by lockdep.

Unless I miss something, the patch is fine as is.

Best regards,
Nam
