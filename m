Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5547136351
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733305; cv=none; b=mXnaIvegMsS6qlu07W9ii2Fxdh3gO1Y2IwFfU2y2YDQn+fUv+dngD8ANrUzzKwPDCc58Xh4RVPZtdR6qj7v7WUW+xOombaueGC6RkLym48vr+qhJ4t+xmEdKDYfxIPuH+f9XMccJHDtzH+EBUi771F4ZFHXTN6Dc6em+N8UnHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733305; c=relaxed/simple;
	bh=qhLFlGcWAzMtuMxtHo20slg88sTeEROxFnPPOCEv/1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtpMFscn7n/hiKal6QWxEUTdYiF5goXZgk1EXXS2EChcd5DEkJG5YJo0DyYFoY6TlLPmBSRLtiVuzmfab/pEtc+iaFYl+gK11z65lhidZr3nvPgFWWNMS5I5st1kiyzN4NajZaNBAgxHCJf/3o7GU3JZsRLFoWRyjPQYLKKMZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwAlUglm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwAlUglm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36962C4CEE9;
	Tue, 20 May 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747733304;
	bh=qhLFlGcWAzMtuMxtHo20slg88sTeEROxFnPPOCEv/1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwAlUglms2rz7KvZSbbbk4yn4KnGFbItsnkjfYWRoZgAFCHztiEOZTAgUsRcTg2Xl
	 MSAqW4X2rvOV+Z6i7E26y9dqnqg3PwlT0kc5fQsxdApgy1C4iMJPZJZ439fJ3Do305
	 VGWpzOeuJ2B032cUrwPFRi+CkY/MUt23+DVY5BGKcOMMxast8KoF0WlzKSPhzm7Ks+
	 +aHTAZt2akA/0V+xIi1w/CjIMzWxzm8DLAPPJkHRXLYMBGmVP86WeBRSw7ykLn3//n
	 Q/9TaMGhQ/FqusAwzYEWapgEmcQ4pBAhrgMsfGZsXn53vNt2SfvM90mH/wmvPiF9v9
	 jc+PMwCAWQKyQ==
Date: Tue, 20 May 2025 11:28:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, nadav.amit@gmail.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
Message-ID: <aCxLMsjkA9dBeKvD@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-8-riel@surriel.com>


* Rik van Riel <riel@surriel.com> wrote:

> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Remote Action Request (RAR) is a TLB flushing broadcast facility.
> To start a TLB flush, the initiator CPU creates a RAR payload and
> sends a command to the APIC.  The receiving CPUs automatically flush
> TLBs as specified in the payload without the kernel's involement.
> 
> [ riel: add pcid parameter to smp_call_rar_many so other mms can be flushed ]

Please actually review & tidy up patches that you pass through, don't 
just hack them up minimally and slap your tag and SOB on top of it.

One example, of many:

> +	 * We allow cpu's that are not yet online though, as no one else can

Here the comment has 'CPU' in lowercase, and with a grammar mistake.

> +	 * send smp call function interrupt to this cpu and as such deadlocks

Here 'CPU' is in lowercase.

> +	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this one. */

Oh, here 'CPU' is uppercase again! What happened?

> +	/* No online cpus?  We're done. */

Lowercase again. Damn, I thought we settled on a way to spell this 
thing already.

> +	/* Do we have another CPU which isn't us? */

And uppercase. What a roller-coaster.

> +	/* Fastpath: do that cpu by itself. */
> +	/* Some callers race with other cpus changing the passed mask */

And lowercase.

> +	/* Send a message to all CPUs in the map */

And uppercase.

It's almost as if nobody has ever read these comments after writing 
them.

There's like a zillion small random-noise details through the entire 
series that insert unnecessary extra white noise in critical system 
code that should be a lot more carefully written, which emits a foul 
aura of carelessness. Reviewers should not be forced to point these out 
to you, in fact reviewers should not be exposed to such noise at all.

Please review the entire thing *much* more carefully before submitting 
-v3.

Thanks,

	Ingo
