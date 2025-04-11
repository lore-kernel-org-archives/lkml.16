Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88D1EE014;
	Fri, 11 Apr 2025 06:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353992; cv=none; b=ujDAa6MwidzJYWMHhhV+InzYvNX18nlphvKnFbTqQVQVjLk3espXj/6Xwtsbtcvh9TkARCosBRIaX5QtOVFxOAGHuB5TF5AKdP5Ps/V/357CJUZCh3saK8ZrVOUFgmJVjvn9cGi6V3gxa4QmYHeSGsZ7w/o7zqOqvfl+3cmYXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353992; c=relaxed/simple;
	bh=X99zMb8EHsqKwuNsevCCfb1/FfYIhdYUZap6fWSWkXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/oX+WObM7mEZSmGyj1k7MRY6NYlvKOkfUisKcOIhk6MeUD1vQgdkKimiGFzvvhgReWWlrkPkYjF7nbef7UDoamXiKBsf7+b6v38y+treXFPgAakD2JL8N8GW51PG6LRmeF4eoX0epw6P2windtRB7d/smxwSHS7nzL4Modk2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BpzxXODS; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BpzxXODS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0nJo3BILZ4XgRosm/WTpceSuJ2fcE75v1DMC4YJQMT0=; b=BpzxXODSBiDPAgXFqLpvH4PbT6
	gWUGafMd1O+KMTLbgNpJqH6XTI2SjXI/BrfbFj/iZnybY4PqC1hyfenTKsSuCltkH34GAv8+AD3IJ
	4VkhX4sxJMDBVakYnQlk0lqMnarBka3nZldATxyTgln/Zwr5qQoE/EtLDALML0KgC2kt/FAAc6qLb
	WoPtVqn+3JvJC3hgYp1DTiTEAwa9Td3YrZ0rhgPpVIPbEZjar8vO7jP0+Z3ARFYSWvxTkf/h8HY63
	umQ21fTmG4LUJacSHG7IIIZiooJ9JY19bUPFmCDbadXyR/3APeEvpcDfYzCTE1yIPfIlE3aXWgE0e
	y9rC2CpQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u389g-00000008x8q-11ie;
	Fri, 11 Apr 2025 06:46:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CF6F33003C4; Fri, 11 Apr 2025 08:46:23 +0200 (CEST)
Date: Fri, 11 Apr 2025 08:46:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] objtool: Detect __nocfi calls
Message-ID: <20250411064623.GL9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
 <20250410154556.GB9003@noisy.programming.kicks-ass.net>
 <x5ltxw6z45gty6hylw2flde5w7qnmztg5mzaq7ffh4tl5ssm6r@h2xnxzqvnljb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x5ltxw6z45gty6hylw2flde5w7qnmztg5mzaq7ffh4tl5ssm6r@h2xnxzqvnljb>

On Thu, Apr 10, 2025 at 12:09:02PM -0700, Josh Poimboeuf wrote:
> On Thu, Apr 10, 2025 at 05:45:56PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 10, 2025 at 03:25:22PM +0200, Peter Zijlstra wrote:
> > 
> > > I should get objtool to warn about those. They undermine the point of
> > > CFI.
> > 
> > ---
> > Subject: objtool: Detect __nocfi calls
> 
> "Warn on indirect calls in __nocfi functions" ?

Yeah, I suppose that's more accurate.

> >  static int add_retpoline_call(struct objtool_file *file, struct instruction *insn)
> >  {
> > +	struct symbol *sym = insn->sym;
> > +
> > +	/*
> > +	 * kCFI call sites look like:
> > +	 *
> > +	 *     movl $(-0x12345678), %r10d
> > +	 *     addl -4(%r11), %r10d
> > +	 *     jz 1f
> > +	 *     ud2
> > +	 *  1: cs call __x86_indirect_thunk_r11
> > +	 *
> > +	 * Verify all indirect calls are kCFI adorned by checking for the UD2.
> > +	 * Notably, doing __nocfi calls to regular (cfi) functions is broken.
> > +	 */
> > +	if (opts.cfi && sym && sym->type == STT_FUNC && !sym->nocfi) {
> > +		struct instruction *prev = prev_insn_same_sym(file, insn);
> > +		if (!prev || prev->type != INSN_BUG)
> > +			WARN_INSN(insn, "no-cfi indirect call!");
> 
> Since this can break things pretty badly at runtime, this should
> actually fail the build on CONFIG_OBJTOOL_WERROR.

Oh right, I still got to adjust to the new world order here :-)

> The warning counts aren't plumbed in this early, so can this check be
> done later?  validate_retpoline() or validate_call()?

Hmm, let me have a poke around, see what can be done.
