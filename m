Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546817A302
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846205; cv=none; b=Bmvi2KzOi5g5JHIw1T/aKNvHQTxoXP0ubzCcMt2F/XEQNkAXS4IHX7Uvr1YbUnnSjI7C48TXoEVGINxPhbymMqPbFizPO/TOV9jxjkCPn7WuDqkONq0ANTNO335ZAMoaPS/dU1GYzygGxyrZ3oLzHx4+3wihg+2J0vbVOrDs4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846205; c=relaxed/simple;
	bh=yzWoLWPaK6AymDML/d1H3AizCYCjzH8GrXsn0PCe2js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni1SNbgs4f8CYxdfZsKjoo+F4VwmslIJI2/Zlinbcsb5qOzPkgHu6MN14q4+WWXFOKT4CMw4fMm0jVZag3WWlkTtTFIaxrw/HpNTdEsya+SeXXg063LV7zHTfK3ZG0Y1cV5mIo9SwvLCafZE811BeDPROBWFJYRg05ZpsqfGWN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgTSaWw6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgTSaWw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED505C4CEE2;
	Wed, 16 Apr 2025 23:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744846204;
	bh=yzWoLWPaK6AymDML/d1H3AizCYCjzH8GrXsn0PCe2js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgTSaWw6MAhBkPTXi4lX33hXj82rkwDNIxI3PK4OmEOLCQb9qL7FSTem8Jic2AEmd
	 EDhf34g8wpF/9XYUOVfap5/H1JXXLGLED2jS9Z3nhHPi4eTvXEcalWeNvdHMyNeVoC
	 jZ4B1fqQrT5DO7xrYLkB02VCNfiLFLuVdmezlvWDGmjDK7jC5yAp+lXuNA2wn8XzFJ
	 e6s+Nj4ic530qN2kJ+0uksdSU0P+xST47c02ANUhX5ttrmkz5rTGJApzzgMyMcM1/C
	 Y8Ie5/P+XhS0Eo5cFraUfsSDjDDQjqnjYohcm590V8ml5+g8VSDrrR/BGEOw9MiqoF
	 I/mn7nDESPJ0w==
Date: Wed, 16 Apr 2025 16:30:02 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <focwffxfbjx3gwobutrfkqvagfw2dt6zvyesejta4sosuporkh@xnhk4uofwadj>
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

We could just give up on trying to making the code itself readable, and
instead put the code+features in comments, e.g.:

# <ALTERNATIVE>
#
# ORIG:	rep movsb
# NEW:	call rep_movs_alternative	# ALT_NOT(X86_FEATURE_FSRM)
#
771: rep movsb; 772: .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90; 773: .pushsection .altinstructions,"a"; .long 771b - .; .long 774f - .; .4byte (((1 << 0) << 16) | ((18*32+ 4))); .byte 773b-771b; .byte 775f-774f; .popsection; .pushsection .altinstr_replacement, "ax"; 774: call rep_movs_alternative; 775: .popsection
# </ALTERNATIVE>

-- 
Josh
