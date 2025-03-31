Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA931C5D77
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459474; cv=none; b=nIkzXszv/9NlYD6KIFwBkOPgzq0rNjsYJQbMU0+I/xO01wheaiX//HyZpuOW1rlERSETWvX2m/ldFb5YlLGESa8fu5q+t57gU9xh8K+reFepqmXrI7x52JCdWZquqiucd+lI9LblHHK3A1o6ZOmVGO/A6GO36dB3u9PH6z887kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459474; c=relaxed/simple;
	bh=tMmd8bJ9O3ncSJ1cPNTStwm+z3KZiM/DfHDk/1nJPww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPY4GG+tVqIs50+MHm0k8ClbCeRRQHQaAv8QUI5EZv3k0B6AShUr+jzikr592B++y7/m8Ve2BFAkovjPHSGJt3GzZWoQ7c4wPDBsi4Ib+P90wLHQ6fAQ7Y7MsGCcyDWaFLGRBDqihCsYXUHIxj9gqCZuzqIKtc6k+IqtQkVjLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1J2iP/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1J2iP/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8065C4CEE3;
	Mon, 31 Mar 2025 22:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743459473;
	bh=tMmd8bJ9O3ncSJ1cPNTStwm+z3KZiM/DfHDk/1nJPww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1J2iP/g0iz7QpD3FIgfrWLJlKqSGrcruZZtP/j2uTGK8pYg9Cm6gbtMgogv1vdCY
	 55LJ5wOIp7+msEaQTW9+vqcQMZtvonLv22DukOzhqntW+aKUSA5dgJZ5K24iBTkIwt
	 FCjrwJlQhgNQog/CTtxh0WjtK6HpSz4mAyHBoDGA+VdTnTvNR3GsDGsOWvNwTttZo5
	 pANj1Cxf12cQ9rGRnI+sTnYRrgu/Xl2qmyVIHkKYaa2d1X1sVIB4m4cZ6NS2QPCToG
	 OvuakrqJ44s3Ga9rtTQzb0Qrx2HmT8gWP34HItDagwGv72AhkUubTBHpwdC6CRZOx0
	 ZebzQ1iGsJ3hg==
Date: Mon, 31 Mar 2025 15:17:51 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Philip Li <philip.li@intel.com>, Borislav Petkov <bp@alien8.de>, 
	lkp@intel.com, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <rqwvk5a2ziu2hoklq45nrnw6n3k6akbd3k4tb5i2he4vty5dxt@gj4w2tsnj55o>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
 <Z-q-hYllyb7yAiBP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-q-hYllyb7yAiBP@gmail.com>

On Mon, Mar 31, 2025 at 06:10:45PM +0200, Ingo Molnar wrote:
> > > This can be seen in the full report:
> > > 
> > >   https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> > > 
> > >   All warnings (new ones prefixed by >>):
> > > 
> > >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> > >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> > >   >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)
> > > 
> > > Note how '>>' is the new warning - the summary line added recently that 
> > > suggests that there's more warnings. It appears to me the test-bot 
> > > considers the other warnings old regressions, but I couldn't find any 
> > > trace of them being reported before. Maybe they weren't Cc:-ed to lkml.
> > > 
> > > Or maybe these *are* all new warnings. I've Cc:-ed the LKP folks.
> > 
> > Hi Ingo and all, sorry for confusion, here only the line with >> is considered
> > as new warning, due to the commit 0a7fb6f07e3a you mentioned.
> 
> Oh, so the loongson 'stack state mismatch' warnings started sometime in 
> the past, but were never reported by the bot? Or were they reported 
> somewhere? I'd like to discover the timeline of those warnings, if 
> that's possible.

I believe those warnings were introduced a year ago with:

  cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")

but I wasn't able to find the original report.

-- 
Josh
