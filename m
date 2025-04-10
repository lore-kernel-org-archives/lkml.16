Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD1204F92
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270798; cv=none; b=OX+ecd7vgUqcuyZ4TX7gxxX+Sd6rE4eupvqBjBX6Uvm0vh3Fbi0DRE2TSIM7qtalJdRSHd46EyqKxnq0KkZ7uHgYRd26OzZmIIP056vqxWUc5S/dSIFqNim1kNPb4MkbrShGnF7OduBbqetxcz/g+ucgPt8c2cwQGB4gk7yPBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270798; c=relaxed/simple;
	bh=c23Ey8uIRGISUA8PaXvMUKRLxdV4JBys/L3fSeTN9S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOTkirfhTURpJ2Y4DvFnoT25yFj7mYo6pOoTcXM1/RjgSI/Z+I19aKgfErhWboV8YMV3aBAVH6wFCx7sNwSfrLNZAQ3QcOSQeSKhneJSPfNOSdpGxel64lglckrZtqehAjSY809Ot6bhak0GuvtUxfSbi4llKuR3tnE//PCW7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BFZdR7Zs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BFZdR7Zs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DpqEEY8WIEaX7DwcZAG4/3zi14jWLU2QQ0VgBeCSYN4=; b=BFZdR7Zs4GCJIuftCpnz+/XF23
	WE2Dm9Ix8q2cbtN8oD9wGp42b8YMFs4yizRZNCYrf7QYR7jDGWPaNG2K6ckpijBE54S2SQVrS2ia8
	ruAk1Eqrb+y5acQFNvQt9eGZdyBZ1x0YE5onkmq5VcASandiShGNT3NBHxUh/E6hqRjfw8c8dtI2T
	TZbe/vNJZ5RhxF7F0rGMeB0Wh7ex98+6S6vVaVzVqLKDBzhkwsy5lclAIE7phcCc7g+KEp6UHTb87
	O2qwAqL5d7SXGbyiMPsAQM3Tr99R2MRvAOrtRQJL5p9BdBMdPbdnP2zphu0I5KwjnSjWTkOPZ8XAA
	VNI+mppA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mVo-00000002ZKq-2D75;
	Thu, 10 Apr 2025 07:39:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C02193003C4; Thu, 10 Apr 2025 09:39:48 +0200 (CEST)
Date: Thu, 10 Apr 2025 09:39:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Message-ID: <20250410073948.GT9833@noisy.programming.kicks-ass.net>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211127.3544993-5-mingo@kernel.org>

On Wed, Apr 09, 2025 at 11:11:23PM +0200, Ingo Molnar wrote:

> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 5ea7e5d2c4de..b7f7c9c83409 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -514,12 +514,9 @@ struct thread_struct {
>  
>  	struct thread_shstk	shstk;
>  #endif
> -
> -	/* Floating point and extended processor state */
> -	struct fpu		*fpu;
>  };
>  
> -#define x86_task_fpu(task) ((task)->thread.fpu)
> +#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))

Doesn't our FPU state need to be cacheline aligned? Looking at struct
fpu, it has a bunch of members that have __aligned__(64) on them, and as
such the whole of struct fpu will inherit this alignment requirement.

This means that both task and sizeof(*task) need to be cacheline aligned
for this to work.

Would it make sense to add something like:

static_assert(sizeof(struct task_struct) % 64 == 0);

And I didn't check, but isn't task a page pointer and as such always
page aligned?
