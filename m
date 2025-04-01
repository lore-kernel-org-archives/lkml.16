Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09D1519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494323; cv=none; b=FAXy+KBvsHnIGmfDXd/Wpv5J1kwLgQJS8XeaFzChifsIGJcMbNueiYo+8T7cctZD4omgxGnVFCsxXR0O+vDlQorKW1yjiZXrxYcus7HCoQXKWx5YJcpCGWTQK7Gx2ukCZHT7PdjOnXtuK5dEipGgvTw2SyFfOBdX2v9DL70Tqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494323; c=relaxed/simple;
	bh=REaIDa2/g+mb0jn6qNUOAEAxiQQ4g/SSmeUfYmyFIJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFaWwK9XJkH+UGOyyMHmjCUUxm639CGjKXw4LuFIp5PVMVBjVFuMZdXHdDyJy77uYjxvrj/wXCrj/69bnsAglQDPKQdkChexzUYXkuxhrRINKPp5TctQ+IxQ9OcCwe/W5dNZxjZeNE5Qg8+/dM70Te7wDbjfOQYZbjG/09XLvhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prt4HXO+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prt4HXO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E8AC4CEE4;
	Tue,  1 Apr 2025 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494323;
	bh=REaIDa2/g+mb0jn6qNUOAEAxiQQ4g/SSmeUfYmyFIJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prt4HXO+5GhCqI8fIDPpA5WY/AwPqEauKg83JRluUQ/c3/Sh5QQEzL7rwhDJav2jf
	 XX/60CM2cPaRfI1pw5Ulnm0nmOwO/SImvp5FugiYwslPKdk8fvB2oPNz/UgrPOgdjZ
	 8OfgnSQdbDuN3BhwxDMCUN7Gxrtux99Vpwk/CUsxM/Ff6NLvNLuftK8/IBiIhCxU+Q
	 CThJjjEgwd0aCDmA8Y2mLjhiEX8UNJrzHGiCKvnrm5CKDNUnadFwEl6gdIZe1C/Ud6
	 mc/dfDyvaEm2Fm8JBAWMD+V1t1MBhjMRMtpopBM4bfzlgPwwrUM1pV0CxMfpheD1jL
	 zuO4jN0q1yitA==
Date: Tue, 1 Apr 2025 09:58:38 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z-ucroZoh3TgtQxA@gmail.com>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
 <20250330231355.GFZ-nQM6NPcC7nWl__@fat_crate.local>
 <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>
 <ttv3iy3i57mvmkdp2mwh4cjwk3qx5eoyr7zmgjl5beohfxvwar@4na7dgto7r6m>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ttv3iy3i57mvmkdp2mwh4cjwk3qx5eoyr7zmgjl5beohfxvwar@4na7dgto7r6m>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Sun, Mar 30, 2025 at 06:39:51PM -0700, Josh Poimboeuf wrote:
> > On Mon, Mar 31, 2025 at 01:13:55AM +0200, Borislav Petkov wrote:
> > > On Sun, Mar 30, 2025 at 03:19:40PM -0700, Linus Torvalds wrote:
> > > > On Sat, 29 Mar 2025 at 08:33, Borislav Petkov <bp@alien8.de> wrote:
> > > > >
> > > > > Btw, test bot complains:
> > > > >
> > > > > https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com
> > > > 
> > > > That's not a very helpful error message
> > > 
> > > I found this:
> > > 
> > > https://lore.kernel.org/r/202503280703.OARM8SrY-lkp@intel.com
> > > 
> > > which looks like the original report.
> > > 
> > > Looks unsolved yet...
> > 
> > The "new" warning is just the "skipping duplicate warning", which was
> > already merged with commit 0a7fb6f07e3a ("objtool: Increase per-function
> > WARN_FUNC() rate limit").  So none of the warnings are specific to this
> > pull request.
> > 
> > Tiezhu, can you please look at this warning?
> >   
> >    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> >    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> 
> Here's a fix.  Will post a real fix soon, along with another pile of 
> fixes.

And just to make it clear, these objtool warnings were not a new 
regression, they were introduced more than a year ago, via:

  cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")

So, to bring this thread to a conclusion, I think by getting rid of the 
summary warning line:

  c5610071a69d ("Revert "objtool: Increase per-function WARN_FUNC() rate limit"")

... the CI test-bots ought to be back to the v6.14 baseline even taking 
such false positives into account.

I'll send the updated objtool/urgent tree to Linus later today, unless 
some last-minute problem pops up.

Thanks,

	Ingo
