Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976D3FC2;
	Mon,  7 Jul 2025 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751852644; cv=none; b=UJskfkY+jx3fEiCIMaWSezrMTdxtiQJ574eIcYygj/xwZJRuFxMeYbpjZHt3Pf6WaHzVGnUpM6X4+R1lses+h/8ZpWz3ghSlNG/uOPTfehTwfUUN6c2l65BhRfsCbkioVl+v5XB+4ZvNEzyfzRMzQaSV2MJ3uFWmqQN4U7kwLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751852644; c=relaxed/simple;
	bh=W0aYtN0vm8uGLHx3axEQY4aRYshmJ7EragvrKqgq9aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbRPFl7rwV1sIdOg53lyxHKRneJj/k7sOK/QOgcfPPrUfm5N1VVlVN8GTcae+ktZmzN8X60IlenebbYesV8w/JZCs1SBkaOW5anT3jDNJ6P4I86xz2s3hi2U/xkFDYXWeiYtvH5IAMWFj04ZVmO3tysY66F2Dv09dBq94Oto6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IVqQo5Xi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IVqQo5Xi"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D5CD625BB6;
	Mon,  7 Jul 2025 03:43:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhZxq-Ph4-IH; Mon,  7 Jul 2025 03:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751852638; bh=W0aYtN0vm8uGLHx3axEQY4aRYshmJ7EragvrKqgq9aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVqQo5Xi9Z13iyqaQDysPJP2fwBLeuJ+s5oe4BadfpVOOwHno4peWRtcMnSHWKKeV
	 g4Xxklg5yIxyyPFdTIIq/UrZ6Tz9UtJVy/AzXsogUZ7Hbl1cyY08lWsGBsvhY4LsoC
	 23y76RFrxbB31bhcPhhaZu4y/ao/47R2TZaQzV+rWwl+XvHGcXYsiffjy9N6+BlRib
	 Qs75LjIbSLzaZLXTdLZnnUTNddEeiNuJEV6qxUDcIJcqDmfgDm2BGSNBdP3H9tH2ir
	 wwv3ee5gIU4s6l7M8m46s7rk4z7NgxSYWwoVneDIAX3zI/DMNxhy1IO4bj5aBgO+Es
	 QK2JbOBhwPqTw==
Date: Mon, 7 Jul 2025 01:43:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGsmUSHjgkWo9SmB@pie>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
 <aGnaZjMoWbW_FZfj@pie>
 <aGn8IVkWQJjHMfCT@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGn8IVkWQJjHMfCT@x1>

On Sat, Jul 05, 2025 at 09:31:29PM -0700, Drew Fustini wrote:
> On Sun, Jul 06, 2025 at 02:07:51AM +0000, Yao Zi wrote:
> > On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> > > On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > > > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > > > booting the kernel with mainline U-Boot,
> > > > 
> > > > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > > > 	[
> > > > 	  "c910",
> > > > 	  "osc_12m"
> > > > 	]
> > > > 
> > > > where the correct parents should be c910-i0 for c910, and osc_24m for
> > > > osc_12m.
> > > 
> > > Thanks for sending this patch. However, I only see "osc_12m" listed in
> > > clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> > > I didn't ever see "c910" appear [1]. What branch are you using?
> > 
> > I think it has something to do with the bootloader: as you could see in
> > your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
> > second possible parent which could be correctly resolved by the CCF,
> > thus c910 doesn't appear in the clk_orphan_dump.
> > 
> > But with the mainline U-Boot which doesn't reparent or reclock c910 on
> > startup, c910 should remain the reset state and take c910-i0 as parent,
> > and appear in the clk_orphan_dump.
> 
> Ah, thanks for the explanation. I'm on an old build:
> 
> U-Boot SPL 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
> FM[1] lpddr4x dualrank freq=3733 64bit dbi_off=n sdram init
> U-Boot 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
> 
> I would like to run mainline but I have the 8GB RAM LPi4a. Does mainline
> only work for the 16GB version right now?

I only tested the DRAM driver on the 16GiB version, but have seen some
working reports on the 8GiB one. Btw, the mainline U-Boot is still in an
early stage (only MMC/eMMC is working and netboot is still WIP).

> > Another way to confirm the bug is to examine
> > /sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
> > should be something like
> > 
> > 	osc_24m cpu-pll1
> > 
> > c910's parents are defined as
> > 
> > 	static const struct clk_parent_data c910_parents[] = {
> > 		{ .hw = &c910_i0_clk.common.hw },
> > 		{ .hw = &cpu_pll1_clk.common.hw }
> > 	};
> > 
> > and the debugfs output looks obviously wrong.
> 
> Thanks, yeah, without the patch I also see:
> 
> ==> c910-i0/clk_possible_parents <==
> cpu-pll0 osc_24m
> 
> > 
> > There's another bug in CCF[1] which causes unresolvable parents are
> > shown as the clock-output-names of the clock controller's first parent
> > in debugfs, explaining the output.
> 
> Thanks for that fix. I now see '(missing)' for c910 too when I apply
> that patch:
> 
> root@lpi4amain:/sys/kernel/debug/clk# head c910/clk_possible_parents
> (missing) cpu-pll1
> 
> > 
> > > I think it would be best for this patch to be split into separate
> > > patches for osc_12m and c910.
> > 
> > Okay, I originally thought these are relatively small fixes targeting
> > a single driver, hence put them together. I'll split it into two patches
> > in v2.
> 
> I think the osc_12m is good as-is but I'm not sure what Stephen will
> think about using the string "c910-i0" in c910_parents[]. I think
> splitting it up will make discussion go faster.

Okay, I'm willing to do so.

> Thanks,
> Drew

Best regards,
Yao Zi
