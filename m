Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925A213E77
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228313; cv=none; b=DQ8550UpPDVtTLl0vsj8bClSNNlYPVXG0Y+cwqnx+/s8J6hhDo9haRL981K6fW8fHrbRG/tLkL/DCq+uGpvjKteJvLsA7MstXmmhvc40Xco+yrY7Ln19tiHHYh+osnet6eaKidQH0IiS3kLpHCT553OY+G3sRE8Lv3e7Gt+S43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228313; c=relaxed/simple;
	bh=xUUsFbA8OabnMgSAkK1pSmdYIwuCe2BU6DsspI9RfN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9eC9GBF5gdMLpHY5kcZBBrXos8TjquiEVuoPH7SGgXcjlwBbHvpiMPIUrp+LTdu04LWU5iB6kDt4V3Z3F+WEFnUMzHOt0LfEyDN3UyZGCMm11H8ea5l8hwq5yZhpb082LkpzqaM/1U9Q54cRiOkahS9SvpyJFvjjEkmP3gfk+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbIDQJns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbIDQJns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1C8C4CEE2;
	Wed,  9 Apr 2025 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744228312;
	bh=xUUsFbA8OabnMgSAkK1pSmdYIwuCe2BU6DsspI9RfN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbIDQJnsAThrfZZDBRu047vyVIg+P8+JGtyX0gl+soKBC2Kae16OYWU/BwkkfiF4S
	 U2xCagDDn/W3ZVLqun7/o4Em0uhAU6XmwZW2r0STKxQdEGuLAc6gM+gUa8ZpvcM1eM
	 KS3eE+N3rsWdYpchdNq6Qo3xaJDkAOogBpGCOhjNwk/UB6KLt3socXDJWUSAdYpeGm
	 a/7svu2dhLRUGdU51kYf/p+q5nx2b1ZMZAmfyGRmO2iDriJROHU8MJVXG1sGd2EkNQ
	 +jcAvsx/743s41zHox+h3Z7doe4hIoULEI64aBJmEaKttjiE2FQ1aYVlZZfVdLCp4o
	 SYYcUNsmXqDxg==
Date: Wed, 9 Apr 2025 12:51:49 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <qik3dltarxj5trsbgzoifhf545nss4vwnabhql7i2b7qiowq52@y3d5pirwd4ni>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net>
 <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
 <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>

On Wed, Apr 09, 2025 at 11:02:29AM -0700, Linus Torvalds wrote:
> On Wed, 9 Apr 2025 at 10:41, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > I actually think the compactness of putting the entry on a single line
> > is really nice.
> 
> Yeah, I think the noise with size calculations in particular is stuff
> that I never look at, and making it one long line is better than
> multiple lines, I think.
> 
> That said, for some of the alternatives, it would be even nicer if we
> could make the noise more compact by just hardcoding sizes. Our
> generic alternatives macros do result in some *very* verbose output
> that is entirely illegible to humans.

What if we were to use a global asm() to define an alternative .macro
whenever "alternative.h" gets included?

e.g.:

asm(".macro alternative oldinstr, newinstr, ft_flags\n"
    "771:\t\\oldinstr\n"
    "772:\t.skip -(((" alt_rlen ")-(" alt_slen ")) > 0) * "
		  "((" alt_rlen ")-(" alt_slen ")),0x90\n"
    "773:\n"
    ".pushsection .altinstructions,\"a\"\n\t"
    ".long 771b - .\n\t"			/* label           */
    ".long 774f - .\n\t "			/* new instruction */
    ".4byte \\ft_flags\n\t"			/* feature + flags */
    ".byte " alt_total_slen "\n\t"		/* source len      */
    ".byte " alt_rlen "\n\t"			/* replacement len */
    ".popsection\n"
    ".pushsection .altinstr_replacement, \"ax\"\n"
    "774:\t\\newinstr\n"
    "775:\n"
    ".popsection\n"
    ".endm");

#define ALTERNATIVE(oldinstr, newinstr, ft_flags)			\
	"alternative \"" oldinstr "\", \"" newinstr "\", \"" __stringify(ft_flags) "\"; "

Then it becomes extremely readable:

  alternative "", "stac", "( 9*32+20)";

Of course the downside is the macro gets generated even if it's never
used.

-- 
Josh
