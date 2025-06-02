Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8074D9478
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894688; cv=none; b=nqJgwYKgJ7PlA/57zxQFcDXt+EQuK5gxYvKHp+Vh20fgiibygrMifdD484ch2a5qLFw4lozZ5nGtlFVQzBZstX/E6gxuYQdi3TspwHybyFWXmljLmI/aufI4ek0u2K7eQAnRilsqfsin1/AT6w3pnlmlg85R9xGtIle4P2YmhjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894688; c=relaxed/simple;
	bh=cgJAkRwu8qrloap2W6VDtS0s3sbNEyuO5UiyJT6Yqq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTxkSb5IuEmqfjvDkee1TMjKCdmd4BFzmnzX185gs/qMDjBa0esXOzEUnU529EmuvPmtvXq0TElYBLSQzteXAq0QKRua10NL0QQnchTetxM3E5gnQQmskPcZ3jh3oMQDwtSOqaj+A/rgLYM3Qvz69ysm6RQw0RnqjtKQfWnBJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+QBq+Kj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+QBq+Kj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7F6C4CEEB;
	Mon,  2 Jun 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748894687;
	bh=cgJAkRwu8qrloap2W6VDtS0s3sbNEyuO5UiyJT6Yqq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+QBq+Kj1QILPp9XzV00mVfsfuQYvIqXti8G9WYHS8FTidbd6C5ddtYO15rqNiA+7
	 KSSp074txrk9Z72n4l8wls2dDI8KU4l3T85d1B4Bqy2rSiTjiZEidMkhQupa4CpDdw
	 O7dcNL31DYPEzsQ/28VRwQWYwlUonsUjhkIABqiHhyoA1QOZIcXex3/hO3rTxTJ9/r
	 +WKlFT4O+Zvt1trHmFBoiA2C4CHyBTHWK4Pr23PjXltgAvivWKYdPY56gwoisrT2Sw
	 gGuj+ZWtCnaEs5uGyPEYtuU/pp3KNMpnihl5rbz0BZhJikncNEMBrqLhMgpkmkRg/C
	 WOwmT6+i/nTag==
Date: Mon, 2 Jun 2025 13:04:45 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kees@kernel.org, acarmina@redhat.com, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <xnp5btu4aysccfyrcqwftvv6dx44vnwh4xx32k4nrjxy5ecoxf@rthjisd5aj5p>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
 <20250602180922.GC30486@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602180922.GC30486@noisy.programming.kicks-ass.net>

On Mon, Jun 02, 2025 at 08:09:22PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 02, 2025 at 09:38:09AM -0700, Linus Torvalds wrote:
> > On Mon, 2 Jun 2025 at 08:50, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Yes, it absolutely builds with clang. The inline asm isn't something we
> > > don't already do elsewhere :-) *cough* extable *cough*
> > 
> > Eww. I hadn't looked at that (or repressed it if I did). *Shudder*.
> > 
> > But looking around, I don't think any of the normal code I ever look
> > at actually *generate* that disgusting thing.
> > 
> > I had to search for it, and looked at the absolute horror it generates
> > in the futex code, and honestly, if I ever have to look at that
> > garbage, I would throw up.
> > 
> > And WARN_ONCE() is in stuff I *do* look at.
> > 
> > So no. I'm NAK'ing it just because it makes the asm look entirely unreadable.
> > 
> > And no, I'm not ok with only using 'objdump' and friends to look at
> > assembly generation. I want to be able to do
> > 
> >    make xyz.s
> > 
> > and look at code generation without throwing up.
> > 
> > The fact that we have this disgusting thing elsewhere in places that
> > I've not looked at does *not* excuse adding it to other places.
> 
> Right. So the problem is using asm macros in inline-asm. We've tried
> adding those macros to a global asm, but IIRC that had trouble.
> 
> So yeah, now we do the macro definition and purge right around the
> inline asm and then you get this horror show :-(
> 
> Anyway, I'll try and come up with something else.

At least the purge could be skipped if you check a global assembler
variable before defining the macro.

For example here was one of my experiments trying to making alternatives
more readable:

  #define DEFINE_ALT_MACRO							\
	".ifndef alt; "								\
	".set alt, 1; "								\
	__stringify(ALTERNATIVE_MACRO) "; "					\
	".endif\n\n\t"								\

  #define __ALTERNATIVE(oldinstr, newinstr, ft_flags, ft_flags_str)		\
	"\n# <ALTERNATIVE>\n"							\
	DEFINE_ALT_MACRO							\
	"alternative \"" oldinstr "\", \""					\
			 newinstr "\", \""					\
			 __stringify(ft_flags) "\" /* " ft_flags_str " */"	\
	"\n# </ALTERNATIVE>\n"

which produced code like:

  # <ALTERNATIVE>
  .ifndef alt; .set alt, 1; .macro __alt_replace orig, orig_end, newinstr, ft_flags, args:vararg; .skip -(((.Lnew_end_\@ - .Lnew_\@) - (\orig_end - \orig)) > 0) * ((.Lnew_end_\@ - .Lnew_\@) - (\orig_end - \orig)), 0x90; .Lskip_end_\@: .pushsection .altinstr_replacement, "ax"; .Lnew_\@: \newinstr; .Lnew_end_\@: .popsection; .pushsection .altinstructions, "a"; .long \orig - .; .long .Lnew_\@ - .; .4byte \ft_flags; .byte .Lskip_end_\@ - \orig; .byte .Lnew_end_\@ - .Lnew_\@; .popsection; .ifnb \args; __alt_replace \orig, \orig_end, \args; .endif; .endm; .macro alternative oldinstr, args:vararg; .Lorig_\@: \oldinstr; .Lorig_end_\@: __alt_replace .Lorig_\@, .Lorig_end_\@, \args; .endm; .endif

	alternative "", "stac", "( 9*32+20)" /* X86_FEATURE_SMAP */
  # </ALTERNATIVE>

which is much more readable if you ignore the horrendous first line ;-)

-- 
Josh
