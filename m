Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B041E2853
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422130; cv=none; b=i2bzhAxD9pkFTa+gknWiq1O8ct7dISbfVtO5iFCXyYA4yMMjpnvhAv67KlC9HoD2LiO1iATBjBLfOnTiMnBfP/iPoh2e91+rTVYebN7uy0v3a2Elro3y4PFHkJoRhgEildRGmxxf3Vi7aEOrkeW2L4ArcIuQyyi8i17UhdM3HFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422130; c=relaxed/simple;
	bh=IfKoGBus3XxnOx/EbhJyIHcZAT8tY6wMOpjs9940+9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jho4lHZQGzdANmQoGlonnu0c2kruCdT6qlNTh40e+IYnuJYwL6/fKeXsXOTov3xgvZ6wU0ZhSEllv8I3MCYqP+b5hlCi0PVnIGWrYoEAE6Fd5/6zeThwIdoGYX8ufuYOa1SqwCR2+4fr4cMmOyCNfNR1qIPQnyt8gMeKqozU7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKsX9Vti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKsX9Vti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102B2C4CEE3;
	Mon, 31 Mar 2025 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743422130;
	bh=IfKoGBus3XxnOx/EbhJyIHcZAT8tY6wMOpjs9940+9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKsX9VtiaObQCNuzdJ5wcupoBxXA4yB//8z8dR6AH2ESnFasctuhbwsz8DY+/Pnq8
	 grpyxY/OmQs5lGr/2F9GtdERJDBcWIdF39q4HmnyAIU1N9s5gknBYp9i+lHRC84wCL
	 t+RTDe62zzZ/w8lW5bFN8iVfEDwQXP9E2kTlgJgazAIYlZHd7gajdEh9gClj1rfsOm
	 B0nw4LCVVPCOWU6xH09R5ZFS3IPZhyp/0M60Syk1d+Pzk6PmO9Gt3HbgSx3Qk2VGQg
	 aK3B5/hEdGAaeqh88Z3XZrBe9m+8ZZIdwgrI2sbIcjljG7hAME7oNKNGc5pBgh+D+N
	 xTSD9izmuGcKA==
Date: Mon, 31 Mar 2025 13:55:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>, lkp@intel.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z-qCrbNvP2cil6jJ@gmail.com>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Mar 28, 2025 at 10:18:57PM +0100, Ingo Molnar wrote:
> > Linus,
> > 
> > Please pull the latest objtool/urgent Git tree from:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28
> > 
> >    # HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140 objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
> > 
> > [ Merge note: not all driver fixes below have maintainer acks. ]
> 
> Btw, test bot complains:
> 
> https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com

AFAICS that particular report is not a new regression, but essentially 
a test-bot false positive due to a reporting change, because the 
objtool warning output changed.

This can be seen in the full report:

  https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/

  All warnings (new ones prefixed by >>):

     arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
     arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
  >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)

Note how '>>' is the new warning - the summary line added recently that 
suggests that there's more warnings. It appears to me the test-bot 
considers the other warnings old regressions, but I couldn't find any 
trace of them being reported before. Maybe they weren't Cc:-ed to lkml.

Or maybe these *are* all new warnings. I've Cc:-ed the LKP folks.

To add confusion to confusion, the test bot also incorrectly attributed 
ae958b1294 for that new warning line, and incorrectly categorized it as 
a 'recent_error':

  recent_errors
  `-- loongarch-randconfig-001-20250328
      `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)

While the commit that added this new reporting line is:

  0a7fb6f07e3a ("objtool: Increase per-function WARN_FUNC() rate limit")

... which is a few weeks old and already upstream. We didn't get a 
loongson related test-bot regression report for that commit or any 
other commits, other than the weeks-late & self-contradictory report 
against ae958b1294.

So something's wonky with the test-bot reporting in this particular 
case for loongson, or my parsing thereof.

Thanks,

	Ingo
