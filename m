Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D4204F6B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518416; cv=none; b=htnDj8Grw/kE5+vR9UpR8QWBssEzS1gWoKoOeXsY/IT4ST0eoa48x2EkcpeBEqEVY9l6wOD8x/gQxXKWUsXeOXK0ghvHcwscGhRawF2Z/xbuvxRhYM6pK6RrFJYNsfB2dVKfOXYMfFRQ63y/ozd5qm0T+r7ge7XvwYi4G88j44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518416; c=relaxed/simple;
	bh=kPSrZSO5uXb7Ygzi222UIaBngtdCzXsdIfgQldd5lok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE01hJwQNx8MBMkc87k7f9CrJDN++qBMmgZuYap++zg5e9qlgDZzRJx3wAHp/uMLVoM1rf2RpAFbIC3jFSyXEh9jBCWkm71vm85Oxen9x0RRgIL/mKlxu2VDPalCxP1HGaLq+jqngB0haHuJn43Hx8m8K8TdYtVxEqpAetlb82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s2nZb0fw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s2nZb0fw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XYu1a0TXcpv657pmLoQBWrtbVTDUIF0CEiw/elnfVXs=; b=s2nZb0fwKYdxLrD9t5nT94UQ4R
	OiEIa947fKkAW0h72ztMp2cbMpqAYI6F7P40EJ2B/uHVVbtV7usDcIfc7pudiW+k2TR+L0baUUodU
	VjwL+Vm/eJwTsHKURk3erFtRT4dGGklVpQflrCazZ5tUDUu/bKNUqg581TOgWxLSpWQa9MxNz6Dup
	UpaDkTj0jpgeW5H5hTGvo78Khzq1aLJXJF7YMusUGshN0B+HdVGHdw3rS+efCrZDI/QrEjhWJhXsz
	so2HZsupXPOQ+uXk12mLOosM/qeC0XffdgxJTnpCskeV6GKNVimJc9FjQ4sRUoSeqpQJ1te8zw3uL
	maXKiBYQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcmh-00000007TxW-1XiU;
	Tue, 01 Apr 2025 14:40:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E551F3003FA; Tue,  1 Apr 2025 16:40:10 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:40:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 23/49] x86/alternatives: Simplify smp_text_poke_single()
 by using tp_vec and existing APIs
Message-ID: <20250401144010.GJ5880@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-24-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132704.1901674-24-mingo@kernel.org>

On Fri, Mar 28, 2025 at 02:26:38PM +0100, Ingo Molnar wrote:
> Instead of constructing a vector on-stack, just use the already
> available batch-patching vector - which should always be empty
> at this point.
> 
> This will allow subsequent simplifications.

This should go before patch 20, otherwise you'll have this intermediate
state where we trip the WARN, no?

> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>  arch/x86/kernel/alternative.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index ffffec4597b7..70abc636b87c 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -2906,8 +2906,13 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
>   */
>  void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
>  {
> -	struct smp_text_poke_loc tp;
> +	struct smp_text_poke_loc *tp;
> +
> +	/* Batch-patching should not be mixed with single-patching: */
> +	WARN_ON_ONCE(tp_vec_nr != 0);
> +
> +	tp = &tp_vec[tp_vec_nr++];
> +	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
>  
> -	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
> -	smp_text_poke_batch_process(&tp, 1);
> +	smp_text_poke_batch_finish();
>  }
> -- 
> 2.45.2
> 
