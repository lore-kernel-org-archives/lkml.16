Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCF15ADB4;
	Sun,  6 Jul 2025 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751776292; cv=none; b=efZWi4z90YbHihg36o7vsvdkDWCHnJQJrKRrtcCtAEtrgQBYf64RCJBZ86C3thwZo84beiXXIwQ3Pkf2ZXOph+USboGSr8GQQY+oL+dRDyWK3EkEBEVFuMpSfxeAiQXdezY8BMrsNWpq6wiNanc975r83F0LISRV8qJmQqSvAlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751776292; c=relaxed/simple;
	bh=Hq5aQNa3aom6TCoSy+iVuy9sh/cxbUw9rIyDrG1A4iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2ibGmE5iE5Cl1KmOJZC7HoFuGoJXbc+1swsdR7EcApSKlInyr7Ad8ls9FrBxtrDr+SfYR7E2clETukFev7N1IbtyO4IAEKnl+GXtaC7/i/pVHCONhikLuXpXifCmwuQ7nJ7z/Y+sSb1oXlaQGf3EYg0cb4nVK81RKhzGjdpRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq+2YEcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq+2YEcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62568C4CEEF;
	Sun,  6 Jul 2025 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751776291;
	bh=Hq5aQNa3aom6TCoSy+iVuy9sh/cxbUw9rIyDrG1A4iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wq+2YEcPd7G1gYvqBSjPaEehRIX2ybqq3vogU8k/KQD0bdw+3478AEfjiystxqsuz
	 0jtPrrJxX1yzsvCfZG8ZGgHrVPZj4qsiOI6CEdOxaT9hKVb47McfMTfxiB/1mIEt9n
	 3ZzjM6lapSiMXemeEa6gYBH7FjG8hpJC5SaufnWuR7Q8Iu6WhAACwsRgMmUw+NiN8L
	 TQuZfMfOhNGyqjB4y6To7jJ3vQgL+ZMhyv+pQqWoDlkMgTQjKSO/PvYlYmx6k49Y3w
	 /UxdHQujj3I+rsNKhTmpVKrdp1gUTBnLbRMf3HLn8uqLOotcfeGkQhSHWWSH/AAJ4x
	 ZcSeoVMyEd47g==
Date: Sat, 5 Jul 2025 21:31:29 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGn8IVkWQJjHMfCT@x1>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
 <aGnaZjMoWbW_FZfj@pie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGnaZjMoWbW_FZfj@pie>

On Sun, Jul 06, 2025 at 02:07:51AM +0000, Yao Zi wrote:
> On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> > On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > > booting the kernel with mainline U-Boot,
> > > 
> > > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > > 	[
> > > 	  "c910",
> > > 	  "osc_12m"
> > > 	]
> > > 
> > > where the correct parents should be c910-i0 for c910, and osc_24m for
> > > osc_12m.
> > 
> > Thanks for sending this patch. However, I only see "osc_12m" listed in
> > clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> > I didn't ever see "c910" appear [1]. What branch are you using?
> 
> I think it has something to do with the bootloader: as you could see in
> your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
> second possible parent which could be correctly resolved by the CCF,
> thus c910 doesn't appear in the clk_orphan_dump.
> 
> But with the mainline U-Boot which doesn't reparent or reclock c910 on
> startup, c910 should remain the reset state and take c910-i0 as parent,
> and appear in the clk_orphan_dump.

Ah, thanks for the explanation. I'm on an old build:

U-Boot SPL 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
FM[1] lpddr4x dualrank freq=3733 64bit dbi_off=n sdram init
U-Boot 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)

I would like to run mainline but I have the 8GB RAM LPi4a. Does mainline
only work for the 16GB version right now?

> Another way to confirm the bug is to examine
> /sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
> should be something like
> 
> 	osc_24m cpu-pll1
> 
> c910's parents are defined as
> 
> 	static const struct clk_parent_data c910_parents[] = {
> 		{ .hw = &c910_i0_clk.common.hw },
> 		{ .hw = &cpu_pll1_clk.common.hw }
> 	};
> 
> and the debugfs output looks obviously wrong.

Thanks, yeah, without the patch I also see:

==> c910-i0/clk_possible_parents <==
cpu-pll0 osc_24m

> 
> There's another bug in CCF[1] which causes unresolvable parents are
> shown as the clock-output-names of the clock controller's first parent
> in debugfs, explaining the output.

Thanks for that fix. I now see '(missing)' for c910 too when I apply
that patch:

root@lpi4amain:/sys/kernel/debug/clk# head c910/clk_possible_parents
(missing) cpu-pll1

> 
> > I think it would be best for this patch to be split into separate
> > patches for osc_12m and c910.
> 
> Okay, I originally thought these are relatively small fixes targeting
> a single driver, hence put them together. I'll split it into two patches
> in v2.

I think the osc_12m is good as-is but I'm not sure what Stephen will
think about using the string "c910-i0" in c910_parents[]. I think
splitting it up will make discussion go faster.

Thanks,
Drew
