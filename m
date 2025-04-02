Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3D2746C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580463; cv=none; b=uuuBCNQ4v7p+st5nXVZzZSS7dO86/L7GLwJu1UniZCYGY6N7nUUN+Oi44uXXujss5Oe7WctR/0PDvkmx5xiL6mddnV8K72LY7sQXxJb7GEg8UqEnfv9kw5kvUVYbleG0eDmAs22IMw1/BAwr8I1vWVv1gVV/a+J7DKrpjg27zxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580463; c=relaxed/simple;
	bh=c509z78gLwInA8mWC4l1f86kaUPKhKxnSr2LvkkSCJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbrG+HD1/wRxxcQxt10CERng7lW9VZnhZ+pfnwB1FsXtxDmHbVwFyoM3ARuOnGXW6dN9HHxeN8HAlvJBYwmR29Nk9+/j//rTPGIvvltA4zM/SwcnrlK4lpQIFyEfuxAYfzcwhhY8pIgB6+ynDnk/B1/Zeff3j1jyIv0ImwmsDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=grhnVAI/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="grhnVAI/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EPaGWIUiXvI5cFuhDoTAev3QSns7G4LVvZrvmwGMQfU=; b=grhnVAI/7cW/wQ/p81PWH/eGdb
	K9dy8mQqv7zc3GeXC1s0YHJ7jcbNsI8b9RLZimF4J8uuzy+bWzXOLNwBQwONegWqKuQPwu6PhRV6V
	5UEqG6SUtTTn2g2tvwLABxK3IxvgPGiO516wt/QuKGhQ1H6mwqRxudAHsfhhsCTQwWjKUXXd2kXyR
	kpbf4wAOYPGr+TVyQKaLGq1uMCaqMaPyk/OJ1Zs9vtCV/dgsVAHFvkMkpHsFKgm28p0HD3wtk8729
	6PAe4KV/WkQAlpshXGT8BE8IEhX9WXxsFqsV42UvPbj3m4hjv3TxKCM7t/0Ixfa0vxpO8m5x7eneF
	NppkCIAQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsvS-00000006zPX-0Jxj;
	Wed, 02 Apr 2025 07:54:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A625530049D; Wed,  2 Apr 2025 09:54:17 +0200 (CEST)
Date: Wed, 2 Apr 2025 09:54:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 11/49] x86/alternatives: Remove the confusing, inaccurate
 & unnecessary 'temp_mm_state_t' abstraction
Message-ID: <20250402075417.GS5880@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-12-mingo@kernel.org>
 <20250401143624.GI5880@noisy.programming.kicks-ass.net>
 <Z-w5INj77OkbFDQe@gmail.com>
 <Z-y3958dG_giqfjw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-y3958dG_giqfjw@gmail.com>

On Wed, Apr 02, 2025 at 06:07:19AM +0200, Ingo Molnar wrote:
> 
> * Ingo Molnar <mingo@kernel.org> wrote:
> 
> > 
> > * Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Fri, Mar 28, 2025 at 02:26:26PM +0100, Ingo Molnar wrote:
> > > > So the temp_mm_state_t abstraction used by use_temporary_mm() and
> > > > unuse_temporary_mm() is super confusing:
> > > 
> > > I thing I see what you're saying, but we also still have these patches
> > > pending:
> > > 
> > >   https://lkml.kernel.org/r/20241119162527.952745944@infradead.org
> > > 
> > > :-(
> > 
> > Yeah, so I think we should do your queue on top of mine, the
> > whole temp_mm_state_t abstraction was rather nonsensical,
> > and we shouldn't be iterating confusing code...
> > 
> > I've ported patches #1 and #3 from your queue on top, see
> > attached below - these should be the two that represent 99%
> > of the conflicts between these two efforts AFAICS.
> > 
> > Does that work for you?
> 
> To make this an easier decision, I've ported Andy's and your patches on 
> top of the x86/alternatives series, into WIP.x86/mm, resolving the 
> conflicts, with a few touchups:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/mm
> 
> Seems to work fine, after some light testing.
> 
> I'll send it out for another round of review if that's fine to you.

Yep, that looks right, Thanks!
