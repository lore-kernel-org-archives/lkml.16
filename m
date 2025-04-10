Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624F1E0E15;
	Thu, 10 Apr 2025 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312147; cv=none; b=VSwDJlvBN97rbLOLkS/m3sZwMqkME2Oa2/sRbEVZaA/dg4HzXpG+MhJl2z/jPiS0k/PNeLhHpuJBha97OMYBM112E/MoSbJIQNo5cziNPMyYSHBsyxxVrJGDTXgZNdWevHlH1gStC6BLW3O8tmV1eKtZkxeHA5SrYPu81YVVaPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312147; c=relaxed/simple;
	bh=R8R0Z54+GbH3qN8RFeqF3pH51Bc/uXCZ7As2PQCIyIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLRGGB01Bq6UDJZ8XS6p9dWqpzYD7yG+HMpcZTnd3UvnFw6rHem4W0Lgjngu5Io4of+4qFMFwuQY6Su2FiPH1wiR9Clz+nNAc4qAaLWl4nkPB1T/o9Na5622polsEs7/XiJ92swvOmx9oVRHksGY138UJbfxwzns46mW3cKK7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBLVpZ/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBLVpZ/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D50C4CEDD;
	Thu, 10 Apr 2025 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744312146;
	bh=R8R0Z54+GbH3qN8RFeqF3pH51Bc/uXCZ7As2PQCIyIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBLVpZ/flLnefJCS8lc+kZRekbRtyw6ig6n/PkImpbL7p65sDZlfL1MAhYju5KYCr
	 irb33yPBjALnu+s789iBq1wolPk+l+KruuTd1W9aq6VcasRiFGvSdPSEs/TuoEKmN0
	 /ATiZ5i/6dLWj/zQz+EM8f6Os4aOCTImS2bmiZZwft05VNRpAG4dPey2CT5aV6ickG
	 VKJCfWDnsJDKTWqcJr6d5yK3R98c9o9TId3hQLcrinJ1wfQpJwxk1hWpZJRx/ZRlcL
	 8gicvTWz88wxrAI3Ckxp46hPift34P8Hh6LUEno5wkZnBq5QnWt165ICd9yXvBLD5+
	 ZwvR60tU3cauw==
Date: Thu, 10 Apr 2025 12:09:02 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] objtool: Detect __nocfi calls
Message-ID: <x5ltxw6z45gty6hylw2flde5w7qnmztg5mzaq7ffh4tl5ssm6r@h2xnxzqvnljb>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
 <20250410154556.GB9003@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410154556.GB9003@noisy.programming.kicks-ass.net>

On Thu, Apr 10, 2025 at 05:45:56PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 10, 2025 at 03:25:22PM +0200, Peter Zijlstra wrote:
> 
> > I should get objtool to warn about those. They undermine the point of
> > CFI.
> 
> ---
> Subject: objtool: Detect __nocfi calls

"Warn on indirect calls in __nocfi functions" ?

>  static int add_retpoline_call(struct objtool_file *file, struct instruction *insn)
>  {
> +	struct symbol *sym = insn->sym;
> +
> +	/*
> +	 * kCFI call sites look like:
> +	 *
> +	 *     movl $(-0x12345678), %r10d
> +	 *     addl -4(%r11), %r10d
> +	 *     jz 1f
> +	 *     ud2
> +	 *  1: cs call __x86_indirect_thunk_r11
> +	 *
> +	 * Verify all indirect calls are kCFI adorned by checking for the UD2.
> +	 * Notably, doing __nocfi calls to regular (cfi) functions is broken.
> +	 */
> +	if (opts.cfi && sym && sym->type == STT_FUNC && !sym->nocfi) {
> +		struct instruction *prev = prev_insn_same_sym(file, insn);
> +		if (!prev || prev->type != INSN_BUG)
> +			WARN_INSN(insn, "no-cfi indirect call!");

Since this can break things pretty badly at runtime, this should
actually fail the build on CONFIG_OBJTOOL_WERROR.

The warning counts aren't plumbed in this early, so can this check be
done later?  validate_retpoline() or validate_call()?

-- 
Josh
