Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F11DF75A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437451; cv=none; b=qBx+p/L6P8PbJPiK1zsZqqnYOKXc77zTBAAbYNtGeZqgTbm83MU0k7beibWtry/kIVbuDtwteCdL8qhNnnhwFWnhm7XWa82argN+zcaY+VTMnRuziVNFNRN3KHUzt6F1kY6Qglm56WKNWAVvRR8uY9Uew1NaADzmCp5ZEFcV0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437451; c=relaxed/simple;
	bh=10lVyuutCtd6yrpwVOx8ZqiK1GM1gEMF3K9M6jQRqkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2icjNOmrGEqa4nRFXeeXsPc8THPn1dhbVt9S6jb8y6TIusH2Ium/fkbsgPi7Ns5YZG5SCN7FpwL/fzqZPiIP6+PVarZA8meZh3JUyQNWeXHHO7vXnos33sF+R0neoVX54tu6RkSxIJ0EcII4NFNQeBpjGcOFx6C6KCUZuW1ET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFIjRvq5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFIjRvq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA79DC4CEE3;
	Mon, 31 Mar 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743437450;
	bh=10lVyuutCtd6yrpwVOx8ZqiK1GM1gEMF3K9M6jQRqkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFIjRvq5Zq4lSHcNJn9X0Pz6DovWyXGJZqadW0RfkzvzrnLtaifzkCe9xQdToOH48
	 fIaCosPAjSy770ryRZ2/XAe5pDPYJTVRYYYoNx6W9y/Z7obpu//0Hvtmxi3gLyFniM
	 8HLioAR4OyYl8+bJl1pyu+cQah+qfE/ViH9JuefvvSll5wQgbcISEtNVwl4Ecx9sUE
	 zzTT6soEJO4x7z260ls/Gf7fpS9lsQDETQ61by8aoy8rHxZU1dVcC5HWI+xgIRtJOI
	 M/cSwOpJDENyYc4vQzKCfX2ztBjC2XyqSmUPAA+QHyJZN42E9vPmJL3ByJHv1g66kZ
	 NJ2YDqSRUeZhA==
Date: Mon, 31 Mar 2025 18:10:45 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, lkp@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z-q-hYllyb7yAiBP@gmail.com>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+qLDGvkY+TXdCjK@rli9-mobl>


* Philip Li <philip.li@intel.com> wrote:

> On Mon, Mar 31, 2025 at 01:55:25PM +0200, Ingo Molnar wrote:
> > 
> > * Borislav Petkov <bp@alien8.de> wrote:
> > 
> > > On Fri, Mar 28, 2025 at 10:18:57PM +0100, Ingo Molnar wrote:
> > > > Linus,
> > > > 
> > > > Please pull the latest objtool/urgent Git tree from:
> > > > 
> > > >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28
> > > > 
> > > >    # HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140 objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
> > > > 
> > > > [ Merge note: not all driver fixes below have maintainer acks. ]
> > > 
> > > Btw, test bot complains:
> > > 
> > > https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com
> > 
> > AFAICS that particular report is not a new regression, but essentially 
> > a test-bot false positive due to a reporting change, because the 
> > objtool warning output changed.
> > 
> > This can be seen in the full report:
> > 
> >   https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> > 
> >   All warnings (new ones prefixed by >>):
> > 
> >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> >   >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)
> > 
> > Note how '>>' is the new warning - the summary line added recently that 
> > suggests that there's more warnings. It appears to me the test-bot 
> > considers the other warnings old regressions, but I couldn't find any 
> > trace of them being reported before. Maybe they weren't Cc:-ed to lkml.
> > 
> > Or maybe these *are* all new warnings. I've Cc:-ed the LKP folks.
> 
> Hi Ingo and all, sorry for confusion, here only the line with >> is considered
> as new warning, due to the commit 0a7fb6f07e3a you mentioned.

Oh, so the loongson 'stack state mismatch' warnings started sometime in 
the past, but were never reported by the bot? Or were they reported 
somewhere? I'd like to discover the timeline of those warnings, if 
that's possible.

Thanks,

	Ingo
