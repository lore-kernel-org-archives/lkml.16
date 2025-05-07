Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82E1D88AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606931; cv=none; b=szcVUQLzvueJhEMMTvmxGOrcqNbAIkOh4OvSH84krsgy1zIE2QZltLSDUdHBPiR7j/6UEGBOkxyGVZgJ9FbT9rNENYcfyoNcYoftCg1c0qzRMmqytEXKUXXGwYolgPLWQRt5fZuAFwJeEF2bpi2FjzHY98+mntgTuq74LPW1Rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606931; c=relaxed/simple;
	bh=1jyTBOcmArkE8Z36utr9V2biBVQ+pbPrw3JWfCn6NLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjRNfyx6DF4NlsYYrSb+u1Ud/Jdw3r8Yb4suTAGVDkskXZnI2+Db7gLS7iyUMM/FQS0ncdJz6DgfjQuStW+875zLScWqVmfJPCu5U+Llfws4rrE7CxTSByvci1TZ6eXw093HzrRlqcd/C1204R6NMjYjObrtGFyU0JpYQGlAfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y+pAVywH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i840Ye8Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y+pAVywH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i840Ye8Y"
Date: Wed, 7 May 2025 10:35:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746606928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKP88jiLJ2LRmARbjHis7oZUhkjNg6ao9XoIi8JN85A=;
	b=y+pAVywHMgnNwO0X5rC7bI13jT9ZS7MDCStRmHsgxiqWl31fTbrdoE65HH+zneO8FnYHSS
	WCb8OaNLr+sNN8mXEyd74lsS/jltYFI47gTZ110oeTBU0VbopjZt8Sdg4VfK+n3f4UTgsv
	6TSy/O3pAV/bKPy0Mmjrts1affoUQQa7OS9g2qQ9/FEG+6u2WhG3TCAc57dZQ9Tt61RLUe
	Zlae/3Z0LVzs+k+Tesz1HdFdhAxDBFv1s4Z86rMoXq0m2hdeIaRJD21bcxDYicLLfRFV9G
	3hB1b8zUQNMRiB2E51Kj2JLUg0cCjCXaBaIvKH42Nwm1DKRpcbUcKS08q+ur6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746606928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKP88jiLJ2LRmARbjHis7oZUhkjNg6ao9XoIi8JN85A=;
	b=i840Ye8YBpS6lxCtNnCotFk32Bct149RtIYX/XFLo1TyxG4RZygwZpyfMmUz8hBKyWWB4L
	AMqewwJN+KQPO5DQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aBsbTiBuWmUC3QaP@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <aBnSgu_JyEi8fvog@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBnSgu_JyEi8fvog@gmail.com>

On Tue, 06 May, Ingo Molnar wrote:
>
> Regarding CPUID header organization:
>
>  - Please move <asm/cpuid/internal_api.h> into <asm/cpuid/table_api.h>.
>
>    There's not really much point to making it 'internal' AFAICS, as the
>    main <asm/cpuid.h> header already includes <asm/cpuid/table_api.h>
>    and <asm/cpuid/internal_api.h> respectively, so it's not all so much
>    internal anymore.
>

Yeah, will do.

>
>  - Could we rename <asm/cpuid/leaves.h> to <asm/cpuid/leaf_types.h> or
>    so? It's really a sub-header of <asm/cpuid/types.h> and should thus
>    share the nomenclature.
>

Correct, it aligns much better; will do.

>
>  - Please just use a single central API header: <asm/cpuid/api.h>, and
>    remove <asm/cpuid.h>. It's confusing to have both <asm/cpuid.h> and
>    a proper <asm/cpuid/> header hierarchy.
>
>    ( I wanted to point to <asm/fpu/api.h> as the shining example to
>      follow, but then I noticed that somehow we grew a <asm/fpu.h> wart
>      last year via b0b8a15bb89e. Will fix that ... )
>
>  - Is there a strong reason to keep <asm/cpuid/leaf_0x2_api.h>? I think
>    for_each_leaf_0x2_entry() could just be moved into
>    <asm/cpuid/api.h>, it's one of the accessors.
>
>  - In a similar vein, I don't see much point of keeping
>    <asm/cpuid/table_api.h> header separate either. <asm/cpuid/api.h>
>    won't be overly large I think.
>
>  - After all this we'll only have 3 headers left:
>
> 	<asm/cpuid/types.h>
> 	<asm/cpuid/leaf_types.h>
> 	<asm/cpuid/api.h>
>

The idea (which I admit was not properly executed) was to sepearate the
(quite large) CPUID "raw operations" header with cpuid(), cpuid_count(),
and cpuid_subleaf() from the new "CPUID API" work like cpudata_cpuid(),
cpudata_cpuid_subleaf() and for_each_leaf_0x2_entry().

This way, after all this new CPUID work gets more established, the CPUID
raw operations becomes an implementation detail that call sites should
not be encouraged much to look at.

Would you be OK with at least having:

    asm/cpuid/
    ├── raw.h		Raw CPUID ops; what is now <asm/cpuid/api.h>
    ├── api.h		Everything else (CPUID model API, CPUID(0x2) API, ..)
    ├── leaf_types.h
    └── types.h

because if I merge raw.h and api.h, the new CPUID APIs (which people
should be encouraged to use) would be so deep in the new merged header it
will be no longer visible.

What do you think?

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
