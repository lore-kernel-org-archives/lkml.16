Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42328188A3A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694149; cv=none; b=dL6XK6e69dX7cTB/vdiHEhQv6zMlzZOJ8/MmH2uSOE8CVluLbCXD4gC4+3I7P1anSm5HcBc17yhGQbo7jtKCXDwGZqmguj9H34zbSQlAsF0eAV96cQGS9sMCL5HsXIG9IKW2vRNEgrBsIBr1ovv6ec6Zg6sVGy6qmie0AHyyT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694149; c=relaxed/simple;
	bh=1soCiRYfYgFYJkqcHhSND4Hu+3WH6iJ7mCH3l5a9bdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5W2F4RSCPGZMTOWlda1lB0wSIJaOHUf848YLmoH+H4CXD87C1dYDjbcjGAzOSoMdFWmFdNY8GBo7oYUptxxPjDYGqg/4Nks5JJbqrDEePLN5Z54wYXsCRcOqV+JgsRuVx04CH+dPIhNmr332yYKdqFBzqUVYECWqNecrxAKGX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY3RWa+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY3RWa+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FC7C4CEE3;
	Thu,  3 Apr 2025 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694148;
	bh=1soCiRYfYgFYJkqcHhSND4Hu+3WH6iJ7mCH3l5a9bdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GY3RWa+CxqL2KozO6NIHBPISPK83QrfVWmlzHqrVhRR88WkARuuh5VLhl3qqsJROA
	 KMSQI5YF04Ypc3oRskIAv6LukjToU0d38TL2+oFMFonjrWLlHbkSLQwVQuBarCWH3c
	 dh8vsU3nvMsPP7vzmA+hQFabXDQWz6sR7j4Yp73lhDj0A7YJ9XjTYuTyItccfmQWKM
	 0BsRPOsxx7YQIVdIMBW/Go+KaYRIVFi6W38LRz/oNiBaFAyu6IFO2rOkP2k+MvcK00
	 EsA/hWFu13Hp1na4OhXD5504d+D4UXSlBMsr9yCaD5N/yW/sG+Mh249D7xEJ2Ep7pF
	 CV3iPyqEG4MoA==
Date: Thu, 3 Apr 2025 17:29:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
Message-ID: <Z-6pQPDuNkshB04F@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>
 <Z-6PWWyopb86UC6y@gmail.com>
 <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com>
 <Z-6XkEpiXg4stqLY@gmail.com>
 <b0b87bd7-e104-4c9b-b9e2-0682dfef28e9@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0b87bd7-e104-4c9b-b9e2-0682dfef28e9@suse.com>


* Nikolay Borisov <nik.borisov@suse.com> wrote:

> I meant doing this:
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 5b1a6252a4b9..b6a781b9de26 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -2587,12 +2587,16 @@ noinstr int smp_text_poke_int3_trap_handler(struct
> pt_regs *regs)
>   *               replacing opcode
>   *     - SMP sync all CPUs
>   */
> -static void smp_text_poke_batch_process(void)
> +void smp_text_poke_batch_finish(void)
>  {
>         unsigned char int3 = INT3_INSN_OPCODE;
>         unsigned int i;
>         int do_sync;
> 
> +
> +       if (!text_poke_array.nr_entries)
> +               return;

> -               smp_text_poke_batch_process();
> +               smp_text_poke_batch_finish();

I suppose we could do this - it adds one more check to 
smp_text_poke_batch_add() though.

> AFAICS this doesn't change the semantics. I.e smp_text_poke_batch_add 
> will call poke_batch_finish iff the address to be added violates the 
> sorted order of text_poke_array. The net effect is we have 1 less 
> function name to care about.

Yeah, it doesn't change semantics, but it's a very small 
deoptimization.

Mind sending a patch? It does simplify the facility some more and that 
single branch will wash away against costs like the CR3 flushes done 
...

Thanks,

	Ingo
