Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA920E026
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879402; cv=none; b=uHn+1Y//gxhAXdGDywi0Y9hDGh+YQB4fj8yKrS6w4d3EXbHY95C61Lx5aXJm9hIxqn23bwhuBNWAAd9Tr7pmg/Y64lksiR06oqqhUZwJFtfodkM//Yn0zzH2w43MnJG1Th5DuG5Exm4wo4hH3sAuEBWl0C5/RwXnSYRKFBXLUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879402; c=relaxed/simple;
	bh=/VHivltKqxqSaf5juV87j5L52YWHMf1OKo/22wkVjiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT2CoRbd5nUU+PsEN5sx4Y3GwSnzrMZ/rY9VFPbtAJBNVLZgmHAtsbDK52MiPPh+rosRljNipSFXfCjLl39O2Xd3QCZzoOe1DoKvf2AlWOT50r269GjSYk0UcWCeF3hPmlmqLYWVdYPoT9ibFPb0bK9ZoMY1WgswBVjj1Ue78/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=azi7hOe2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="azi7hOe2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0oV50ImWJ0MX64pfE8X9DZy1qeBv7O5McR9r1DBIgc8=; b=azi7hOe2K9SsyGmBTl03L0JaYE
	hvOLgaAZuyfqS9pO6C6VDLcJC2HrpZn57hij+oXZktcO7/OMB8/mrIV/tvLziq9AEqrMGkzWQlUW3
	W92+bHa/HGaoLudcS7MxYjRnoip3zzMI8/bBi/1XtZRpV24ml5ZjSJuRsY1tF9/niFUujyBQWiG4o
	orFapv2JfLRB+rH2QbbmFOm2Vq5Jb70fspYRZBBReHYj1qirYYYQE3c3woKn+r/40fVxpFfmgepJX
	K/gCTn+aWB9kPqoZ1cJlGQQ9TzqtiSbKp/NBMqeSfPND68mkQpOAvLEvdNCcHMCZzl/5UrOjA8XYj
	9RNfy+9g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Q1-000000014LX-2kup;
	Mon, 02 Jun 2025 15:49:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4823E300F1D; Mon,  2 Jun 2025 17:49:43 +0200 (CEST)
Date: Mon, 2 Jun 2025 17:49:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250602154943.GB30486@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>

On Mon, Jun 02, 2025 at 08:02:24AM -0700, Linus Torvalds wrote:
> On Mon, 2 Jun 2025 at 07:52, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Use the normal COUNT_ARGS() trick to split the variadic WARN() macro
> > into per nr_args sub-marcos, except use a custom mapping such that 4
> > and above map to another variadic that does the current thing as
> > fallback.
> 
> Does this horror work with clang? Because I suspect not. The games you
> play with inline asm are too disgusting for words.

Yes, it absolutely builds with clang. The inline asm isn't something we
don't already do elsewhere :-) *cough* extable *cough*

> But honestly, even if it does,I really hate this kind of insane
> complexity for dubious reasons.
> 
> If you have a warning that is *so* critical for performance that you
> can't deal with the register movement that comes from the compiler
> doing this for you, just remove the warning.
> 
> Don't make our build system do something this disgusting.

It isn't just the register movement. What we currently have for WARN()
is:

WARN(cond, fmt, arg...)

	if (unlikely(cond)) {
		__warn_printf(fmt, arg);
		ud2
	}

Where the UD2 bug_entry will have NO_CUT_HERE, because __warn_printf()
will have started the printing.

Part of the problem is with unlikely() not causing the text to break out
into .text.unlikely, but at best it moves it to the end of whatever
function we're in.

This also means that if you do WARN_ONCE() the whole ONCE machinery is
also dumped into that function.

And now someone wants to go add some KUnit specific testing to this as
well, which is also dumped into the function.

This is all cruft that shouldn't be in the normal .text.


The horrors I did will change things into:

	if (unlikely(cond))
		ud1 regs

where the bug_entry will then have the fmt, and the ud1 instruction some
regs (provided 3 or less args). Then all the ONCE and KUnit crap can
live in the exception handler. Not littered around the real code.


Now, I can still relate to: "this is too horrible for words". But then I
would strongly suggest people go poke at the compilers so we can get:

	if (really_unlikely(cond)) {
		whatever;
	}

such that the compiler is forced to split whatever into a cold
sub-function placed in .text.unlikely. Then it doesn't really matter how
much crap we stick in there, it will not affect the normal code paths /
I$.

Anyway, I had fun hacking this up :-)
