Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22344149DE8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901724; cv=none; b=LUXQIm/8gD2y5u4JQ5rO+uSwk95OGqDYS0NjidzdCFIu7TtkpIbRbEAawac1YFFQxXAvb/VBgodYwdSTic5HCEStaLfy8qd7XS68c5X/RhaXV4o7AOOA1YVvbwiid3jUnBdjXm/OHqFaiZiUFYPYbAztAk0uRWo2SdBFnpIx0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901724; c=relaxed/simple;
	bh=Mv5iFeSBDQ4HpRCbLwgsBr3jD1X4/dJVa4lZzdSh9SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9/1xI0F7aYD1RIqGFPy7iTKnZayOBn+ToAKFrKrLreMtuSdVeFr7pgaGYr55dn/je3IXtsocJZKPa6Xpi1/tWfvcKHdVYvkMe8LIHwA+E02PoC430PjEIcMSjGwSmwKwQESUBOx+vHM2YxLmN8dK93Y0Lr+MvihdeR4AII66FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=owLZvVAt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="owLZvVAt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nUXp/MV3fY4GYnrtE7gJdbv5PETvJ8TzofAY5i/vg6A=; b=owLZvVAttMLMcPqW+Vj2VJAEce
	bOJp3Fbi8phyObUYFvMs3H60i/YkkPuPzrMDEfF+Rk8y+6IH0mcS3qV/x0i08/+HluMvI96VH5xHe
	4ha1icNZnsqpata4lCSd5U9iCLVhAydq3WQvjN1EWbTSXNA4gGkdVWVaGq3phPtfkFcKmij5UQao+
	ASNo4aHg8mE7D+6V6wtkoyVpRUsDhEiTMAGJqUuFFVXALa0Ls+3UtR8E+S82E12ALKC2HC+jKaBph
	CKJvRAlldSoesUwKV2R/RSI3kilmPkqNkE4gMI1c8hBupz8ZwL5/X9fs/KzWHixrPwHV/isiBjU0m
	X7Ge9J3Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDEG-00000001N0y-2Q75;
	Mon, 02 Jun 2025 22:02:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 24D54300787; Tue,  3 Jun 2025 00:02:00 +0200 (CEST)
Date: Tue, 3 Jun 2025 00:01:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250602220159.GB39782@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
 <20250602215725.GA39782@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602215725.GA39782@noisy.programming.kicks-ass.net>

On Mon, Jun 02, 2025 at 11:57:25PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 02, 2025 at 09:38:09AM -0700, Linus Torvalds wrote:
> 
> > And no, I'm not ok with only using 'objdump' and friends to look at
> > assembly generation. I want to be able to do
> > 
> >    make xyz.s
> > 
> > and look at code generation without throwing up.
> 
> So if I stuff the asm macro in a global asm() block then GCC ends up
> looking like so:
> 
>         .set warn_imm, 0
>         warn_add_reg var=warn_imm reg=%rcx      # tmp215
>         .set warn_imm, (warn_imm << 4)
>         warn_add_reg var=warn_imm reg=%rdx      # tmp212
>         1: ud1 warn_imm(%ecx),%rax      # tmp210
>         .pushsection .discard.annotate_insn,"M",@progbits,8
>         .long 1b - .
>         .long 8
>         .popsection
>         .pushsection __bug_table, "aw" ; 123: .long 1b - . ; .long .LC76 - . ; .long .LC0 - . ; .word 8710 ; .word 2321 ; .org 123b + 6 + 4 + 6 ; .popsection   #,,,
> 
> However, clangd is 'helpful' and fully expands the asm macro for the .s
> file :-(

It generates his horror show:

	#APP
.set warn_imm, 0
.set .Lregnr, 0
.set .Lregnr, 1
.set .Lregnr, 2
.set warn_imm, 2
.set .Lregnr, 3
.set .Lregnr, 4
.set .Lregnr, 5
.set .Lregnr, 6
.set .Lregnr, 7
.set .Lregnr, 8
.set .Lregnr, 9
.set .Lregnr, 10
.set .Lregnr, 11
.set .Lregnr, 12
.set .Lregnr, 13
.set .Lregnr, 14
.set .Lregnr, 15
.set .Lregnr, 16
.set .Lregnr, 0
.set .Lregnr, 1
.set .Lregnr, 2
.set .Lregnr, 3
.set .Lregnr, 4
.set .Lregnr, 5
.set .Lregnr, 6
.set .Lregnr, 7
.set .Lregnr, 8
.set .Lregnr, 9
.set .Lregnr, 10
.set .Lregnr, 11
.set .Lregnr, 12
.set .Lregnr, 13
.set .Lregnr, 14
.set .Lregnr, 15
.set .Lregnr, 16
.set warn_imm, 32
.set .Lregnr, 0
.set .Lregnr, 1
.set warn_imm, 33
.set .Lregnr, 2
.set .Lregnr, 3
.set .Lregnr, 4
.set .Lregnr, 5
.set .Lregnr, 6
.set .Lregnr, 7
.set .Lregnr, 8
.set .Lregnr, 9
.set .Lregnr, 10
.set .Lregnr, 11
.set .Lregnr, 12
.set .Lregnr, 13
.set .Lregnr, 14
.set .Lregnr, 15
.set .Lregnr, 16
.set .Lregnr, 0
.set .Lregnr, 1
.set .Lregnr, 2
.set .Lregnr, 3
.set .Lregnr, 4
.set .Lregnr, 5
.set .Lregnr, 6
.set .Lregnr, 7
.set .Lregnr, 8
.set .Lregnr, 9
.set .Lregnr, 10
.set .Lregnr, 11
.set .Lregnr, 12
.set .Lregnr, 13
.set .Lregnr, 14
.set .Lregnr, 15
.set .Lregnr, 16
.Ltmp1656:
	ud1q	33(%ecx), %rax
	.section	.discard.annotate_insn,"M",@progbits,8
.Ltmp1657:
	.long	.Ltmp1656-.Ltmp1657
	.long	8
	.section	.init.text,"ax",@progbits

	.section	__bug_table,"aw",@progbits
.Ltmp1658:
.Ltmp1659:
	.long	.Ltmp1656-.Ltmp1659
.Ltmp1660:
	.long	.L.str.29-.Ltmp1660
.Ltmp1661:
	.long	.L.str-.Ltmp1661
	.short	8710
	.short	2321
.org ((.Ltmp1658+6)+4)+6, 0
	.section	.init.text,"ax",@progbits


	#NO_APP
