Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3326FD86
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220504; cv=none; b=QvaMvI1Sxa7nDGPxS/3ODHbHUWGhbSzDkZxtivueG1g6avh4b+mNf1ehAjGsL4zYwysosksZ2OzmPu+laQ1L0+gMV8/Yo1Tnli6sxdtDy0FL60Z3YNgWgRZJJv2LI0QSK02D4eO5XKO2CMgdCrh4Hc19vpOalvPTcwyLwP1YyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220504; c=relaxed/simple;
	bh=uWFpB4S8aqcJqUgMUrkcXOwnj/tmWpw4ViGFpgFTyRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXIFk3LwTKeKizJBKln/QNoGvhMUMrNIOknDd8oCB3QJPs2ktOmy83Gc5gLvVqDHQIt09gI5ydCCoS+NlmTxdvI6IUJmZVgkdMylAZJI4zNwZt2IBWzPDeaZ0aPSRicQIhEvKenmfMey2o5DCjf11LzgNTrEqPb0qqYPV6tYMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdIMgoV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdIMgoV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DF7C4CEE2;
	Wed,  9 Apr 2025 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744220503;
	bh=uWFpB4S8aqcJqUgMUrkcXOwnj/tmWpw4ViGFpgFTyRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdIMgoV0kXEcNVfsaSNxS3YL3BaBO9jo3pDHrNTE8C6D/MAAkuhA1hW7MuKcfGR8v
	 qMfAFLWJ8IYWwep9ws0rd5tnYPM8aitTnwfz6siVmrefvFKE8sD/lQfj+zayV1wwVA
	 lzGr3CfXDpiNbGqrdXwznCH5wow8gG3eauCZUhW0NPON5kzqf4HypEFzbxAvwn86vp
	 ONUEJT8Z1ikKWsgnC+MppYYcrDVIdemoa+KVebB8bIiiXojw5o8nfAXu63IhvleBwz
	 0S8YkJC5uoiFk5HBlSo7kqTr5JFZWdIkoDECwN+mHrZUPp4+Dt52TxPAPpH1npjL5k
	 uUNnqZafMRGDw==
Date: Wed, 9 Apr 2025 10:41:40 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409143821.GE9833@noisy.programming.kicks-ass.net>

On Wed, Apr 09, 2025 at 04:38:21PM +0200, Peter Zijlstra wrote:
> On Tue, Apr 08, 2025 at 01:21:17AM -0700, Josh Poimboeuf wrote:
> > Improve the readability and compactness of alternatives code.
> > 
> > ---------------------
> > ALTERNATIVE() before:
> > ---------------------
> > 
> >   	# ALT: oldinstr
> >   771:
> >   	rep movsb
> >   772:
> >   # ALT: padding
> >   .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
> >   773:
> >   .pushsection .altinstructions,"a"
> >    .long 771b - .
> >    .long 774f - .
> >    .4byte (((1 << 0) << 16) | ((18*32+ 4)))
> >    .byte 773b-771b
> >    .byte 775f-774f
> >   .popsection
> >   .pushsection .altinstr_replacement, "ax"
> >   # ALT: replacement
> >   774:
> >   	call rep_movs_alternative
> >   775:
> >   .popsection
> > 
> > --------------------
> > ALTERNATIVE() after:
> > --------------------
> > 
> >  # <ALTERNATIVE>
> >  771:	rep movsb
> >  772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
> >  773:
> >  # ALT ENTRY:
> >  .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection
> 
> I find this very hard to read. I prefer the multi line form it had
> before.

I actually think the compactness of putting the entry on a single line
is really nice.

We're usually more interested in reading the code *around* the
alternatives, rather than the alternatives themselves.

Making the alt entry a big sprawling mess, for what typically resolves
to just a few instructions, makes that a LOT harder.  And it's *really*
bad for ALTERNATIVE_2() and ALTERNATIVE_3().

Also, 99% of the time, we're not going to be debugging the alternatives
themselves.  Spreading out the alt entry directives across multiple
lines is way overkill.  It wastes space and cognitive load.

That's what the comments are for.  All you really need to care about are
the original instructions, the replacement instructions, and potentially
what feature+flags.

We could even print the feature by adding the '(((1 << 0) << 16) |
((18*32+ 4)))' to one of the comments.

Or even better, we can just show the actual human readable feature:
ALT_NOT(X86_FEATURE_FSRM).

Something like:

 # <ALTERNATIVE>
 771:	rep movsb
 772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 # ALT ENTRY:
 .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection
 # ALT REPLACEMENT: ALT_NOT(X86_FEATURE_FSRM):
 .pushsection .altinstr_replacement, "ax"
 774:	call rep_movs_alternative
 775:
 .popsection
 # </ALTERNATIVE>

Then with all the relevant information in the comments, there's no
reason to make the alt entry directives themselves very readable, right?
Unless alternatives are broken and you're debugging it.  Which should
very much be the exception rather than the rule.

One thing that does bother me slightly is the asymmetry of having the
.pushsection and .popsection on the same line, whereas the replacement
has them on separate lines.  We could just put the .popsection on its
own line:

 # <ALTERNATIVE>
 771:	rep movsb
 772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
 773:
 # ALT ENTRY:
 .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f
 .popsection
 # ALT REPLACEMENT: ALT_NOT(X86_FEATURE_FSRM):
 .pushsection .altinstr_replacement, "ax"
 774:	call rep_movs_alternative
 775:
 .popsection
 # </ALTERNATIVE>

-- 
Josh
