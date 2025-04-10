Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DF2857ED;
	Thu, 10 Apr 2025 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291530; cv=none; b=Q3G52I80Mkncx7HagUbps+asxJa6qgxkm0PgGDyc0sR7Jsfm+90h1rTxwvog5JiBV+/2j+ceA6kmoLds7zv4eZowgtm0gLfy/91M9ljbHzAnkgTcBZuwkl+D17xQZ36SWvdupO2dGsbiXmTZyLaYmoxXiejEfbFDKA9nadyycVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291530; c=relaxed/simple;
	bh=jXa/9L8q58oylyVhTKfVve64IpqYEzWfaOGJh38ajU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzpHMnwZ8f/+8etDpTvhD7+k3ToAFdZu7g2TdggkMNLzc8OOOORd9caG7/WNz5VmLdluPKNydEC1KdG0TTiJoGbiutYFhhqiHSxKZOe2GpjJzLuNRIA0a0Qf/Sl4XsNlrEfGZNK9kaqwtz4TT6LT1YSAV6MTFfOIgs1WAMMLe3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fOCd/Jch; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fOCd/Jch"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aUNwQ11yeiOSyopf3WgJzqAUdg8ZhUFm0KygW9mzUmo=; b=fOCd/JchTIw5O9rCO82jONzdvN
	9iGW0maraAiQ5JeCoVDPy5xVwJAvjYD/UKsMRPbOLdvRg59L8ZSeqlt4wBOvYvpq144JagzmbEe4u
	4btwNZGqrA3PAWBtXrRiyZG8sm4c9SbSryky8Yl8AcRCEYBIlduYE5LaxABjJTxoAmbkYNK1GzjoI
	N9IBP34eNCet7bzJerNnofMp6u7dBb785hc6lVFC4qvaWcjvnjVjeh4MJbEDzvvtg+Faaqi0PGptO
	M792kfE6/HuG5gytDOpRwD/CUP2/LCNun90KjmqAI4xh08Iaq142y4yAtGhP9dbxAjIBzAZDj5k0l
	1FQO/qyw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ruE-00000002w26-172h;
	Thu, 10 Apr 2025 13:25:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5B9503003FA; Thu, 10 Apr 2025 15:25:22 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:25:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <20250410132522.GD9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>

On Thu, Apr 10, 2025 at 03:12:54PM +0200, Paweł Anikiel wrote:

> I'll let the rust maintainers answer this one.
> 
> > >
> > > How is it still compatible with kCFI and not with FineIBT?
> 
> kCFI keeps the original function's endbr64. If a callsite disables
> CFI, it simply jumps to that function (without any magic value
> checks), the endbr64 is there, so no #CP.
> 
> With FineIBT, the original function's endbr64 gets replaced with a
> nop, and the callsite is supposed to be modified to jump to the CFI
> preamble. With CFI disabled, that modification doesn't happen
> (cfi_rewrite_callers() quietly ignores that callsite), so we jump to
> the nop, and we get a #CP.

Oh, you're attempting to do a no-cfi indirect branch? Yeah, you don't
get to do that.

I should get objtool to warn about those. They undermine the point of
CFI.

> > FWIW, CFI violations of any kind are a no-no. They're not accepted in C
> > and they're not accepted in Rust. This is clearly a Rust bug that needs
> > to be fixed ASAP. Disabling CFI is not an option.
> 
> This is a known issue, but it doesn't seem to have high priority:
> https://github.com/rust-lang/rust/issues/115199

Now you get to fix it :) Because such code is unacceptable for the
kernel.

Just because some crazy Rust person sticks this in their runtime,
doesn't mean you get to use it in the kernel.
