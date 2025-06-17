Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925632E7F0F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169186; cv=none; b=L/ATfXYP0LB+I4w13v0QDqwNDruaOod2VTL5bi9VG6+BOkVV2juQ4u34pldGXZarIamn4gYEJUKwLk9lccf2kkYiKXdWAOXcTa+sEl4a9Pl2K+cE+M68JE6DWOZPVvNsZi6vyuc831ok76X5aWhPOoMnt7IjVKoWvHA1FwucjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169186; c=relaxed/simple;
	bh=URKWKzZxHliFtKUFZ7vLf5zoqDf0yHaXL9j2oRWdjJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBAZDq3ILnjAqHWXFw+V0b4P4EYBbb143hviMi8+AA1m7ahwyv2zWDx2ck9WocikJSj75T1oeV98NcABCeMbwl8kJ58r+W8dRUX+a7XpdxgYdQko9iZSVcOyIkBYaKiKd7fhWWOE4zlNbKoedT4udCzS7A8+VHcbYab6O6IwpOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FZXrU1xF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FZXrU1xF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mr5YGUygxiBtBgej+wGLD/Jr1Ps7yrpAunL7H2twdww=; b=FZXrU1xFXQYaTEAHATUXVJLgmT
	fisbYXf40WQ1XlTjcRk2Tcis3YGzOdkvmNYAs9GThsQgdj37aiNgjxdn5uNtxjvH89EHchqgRWQCf
	cuyoSBdolB0usmq83oRikvdKcAQDngck37mdCSarumB5el7wBlvk6kx8Sjtx0ElvhRBRWnTRHxMSr
	as70sTmHFGxODLW/3bwXSUDQ64+0sv4FqZBiXgdOGemQCd9bOiAkA091KbM/2rswp90sMzx6JRkg1
	DxbQPhDamaRrExQMVne+o6lUOqMVo085NxhFZID4/h+Hrs8+bmZMGBQgKT2rGxYT6wbKp9ZbY+EHX
	nkDjQrVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWx9-00000003otF-22f0;
	Tue, 17 Jun 2025 14:06:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7D33D30BDAD; Tue, 17 Jun 2025 16:06:17 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:06:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: kan.liang@linux.intel.com, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617133333.GU1613376@noisy.programming.kicks-ass.net>

On Tue, Jun 17, 2025 at 03:33:33PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 08:14:36PM +0800, Mi, Dapeng wrote:
> 
> > > We're going to do a sane SIMD register set with variable width, and
> > > reclaim the XMM regs from the normal set.
> > 
> > Ok, so we need to add two width variables like
> > sample_ext_regs_words_intr/user,
> 
> s/ext/simd/
> 
> Not sure it makes sense to have separate vector widths for kernel and
> user regs, but sure.
> 
> > then reuse the XMM regs bitmap to represent the extend regs bitmap.
> 
> But its not extended; its the normal bitmap.
> 
> > Considering the OPMASK regs and APX
> > extended GPRs have same bit-width (64 bits), we may have to combine them
> > into a single bitmap, e.g. bits[15:0] represents R31~R16 and bits[23:16]
> > represents OPMASK7 ~ OPMASK0. 
> 
> Again confused, bits 0:23 are the normal registers (in a lunatic
> order). The XMM regs are in 32:63 and will be free if the SIMD thing is
> present.
> 
> SPP+APX should definitely go there.
> 
> Not sure about OPMASK; those really do belong with the SIMD state. Let
> me go figure out what ARM and Risc-V look like in more detail.

So ARM-SVE has 32 vector registers with 16 predicate registers.

Risc-V Zv seems to only have 32 vector registers; no special purpose
predicate registers, instead a regular vector register can be used as a
predicate register.

PowerPC VSX has 64 vector registers and no predicate registers afaict.

While reading this, I came across the useful note that predicate
registers are 1/8-th the length of the vector registers (because the
minimal element is a byte). So while the current AVX-512 predicate
registers are indeed 64bits, this would no longer be true for the
hypothetical AVX-1024 (or even AVX-512 if we allow 4bit elements).

As such, I don't think we should stick the predicate registers in the
normal group -- they really are not normal registers and won't fit for
future extensions.

This then leaves us two options:

 - stick the predicate registers in the high bits of the vector register
   word, or

 - add an explicit predicate register word.


