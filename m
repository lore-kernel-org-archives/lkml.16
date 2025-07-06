Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604129A5;
	Sun,  6 Jul 2025 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751767696; cv=none; b=kk1HupXfkLHP4MT9B3DGOSqT/fI0BP0/Bd96B8+BpKpLRl2oq+5HI+1TlLXjDKzqWQSVVqNkVxK6z1Z12vZBanLfRGCHoDUngl2xpFZBAW+w7t87CJRixVo6wA/g6a42VtOzWFsoFoE5+/B6VJve0dGAe7LkZrwVnfcmvoL+DNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751767696; c=relaxed/simple;
	bh=qbb9qUQDN3f4Sd+pgIv8uMMRUnNZzrqkxxKE9i/HdpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSE6UqrYN0IlXtykSLODVFFu8LdqhaLPMYMYUFqeQKZ9voh94GvtTcVAhSLyXUjM9BKlNuZayEuwPduBTwqEz5Dh1O/3wXTdAuKM3ouSZVman3nmvfzXrDmnMW2diMWPkI9vF7nOa/jvAZYefvVaXfGOzNs0rB0m9qg7YFM1OlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Nh6pRZBb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Nh6pRZBb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5CFED2307C;
	Sun,  6 Jul 2025 04:08:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HydFQqZyg1UX; Sun,  6 Jul 2025 04:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751767689; bh=qbb9qUQDN3f4Sd+pgIv8uMMRUnNZzrqkxxKE9i/HdpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nh6pRZBbZPbBVd6rlqgXn6VkyHqMJeBET1dH+mWBb7uE3Plod4Kf0xBby7O3n2UEm
	 MyDBuaKcAHw8RrGdnjsjCmXLZNCw+raNm12XtTiNj/bvgF86ItZPn54KRDEZuDz7s8
	 39D+UTmRY7mlezXftdI/JAL93Gpohpfyj+EovDfDmliH/mXnN6FVxHg7DVyBH59LUC
	 bIIQblzD/tfr9oSgkFdJ4pDKrBn9UOGpchrrXumQ4lKsdNSsw7hDKHSp34kAVEDwb0
	 +dUCQVhcG5viSTLTQsyqTUD6WBkZPLcleq7Nd8ubcpAn75el59BNU0ck6SyX9tm8qj
	 xQq9Qk8U6Wvfw==
Date: Sun, 6 Jul 2025 02:07:51 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGnaZjMoWbW_FZfj@pie>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGm+adSNdTHyN7K1@x1>

On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > booting the kernel with mainline U-Boot,
> > 
> > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > 	[
> > 	  "c910",
> > 	  "osc_12m"
> > 	]
> > 
> > where the correct parents should be c910-i0 for c910, and osc_24m for
> > osc_12m.
> 
> Thanks for sending this patch. However, I only see "osc_12m" listed in
> clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> I didn't ever see "c910" appear [1]. What branch are you using?

I think it has something to do with the bootloader: as you could see in
your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
second possible parent which could be correctly resolved by the CCF,
thus c910 doesn't appear in the clk_orphan_dump.

But with the mainline U-Boot which doesn't reparent or reclock c910 on
startup, c910 should remain the reset state and take c910-i0 as parent,
and appear in the clk_orphan_dump.

Another way to confirm the bug is to examine
/sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
should be something like

	osc_24m cpu-pll1

c910's parents are defined as

	static const struct clk_parent_data c910_parents[] = {
		{ .hw = &c910_i0_clk.common.hw },
		{ .hw = &cpu_pll1_clk.common.hw }
	};

and the debugfs output looks obviously wrong.

There's another bug in CCF[1] which causes unresolvable parents are
shown as the clock-output-names of the clock controller's first parent
in debugfs, explaining the output.

> I think it would be best for this patch to be split into separate
> patches for osc_12m and c910.

Okay, I originally thought these are relatively small fixes targeting
a single driver, hence put them together. I'll split it into two patches
in v2.

> > The correct parent of c910, c910-i0, is registered with
> > devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> > structure from scratch. But it's assigned as c910's parent by
> > referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> > structure is never registered.
> 
> I recall Stephen Boyd had the feedback when trying to upstream this
> driver to avoid strings for parents and instead use clk_parent_data or
> clk_hw pointers directly [2]. It was difficult to find alternitves to
> parent strings in all instances.

Yes, especially the predefined clock types which always allocate a new
struct clk_hw, so one has to choose between filling the parent data
dynamically or using the parent's name.

> > Meanwhile, osc_12m refers the external oscillator by setting
> > clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
> > clock-names property is allowed for compatible thead,th1520-clk-ap.
> > 
> > For c910, refer c910-i0 by its name; for osc_12m, refer the external
> > clock input by index. This eliminates these orphan clocks.
> > 
> > Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index ebfb1d59401d..74da1a61e6f0 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
> >  };
> >  
> >  static const struct clk_parent_data c910_parents[] = {
> > -	{ .hw = &c910_i0_clk.common.hw },
> > +	{ .index = -1, .name = "c910-i0" },
> 
> Stephen - would this use of a parent string be acceptable?
> 
> >  	{ .hw = &cpu_pll1_clk.common.hw }
> >  };
> >  
> > @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
> >  	{ .hw = &peri2sys_apb_pclk.common.hw }
> >  };
> >  
> > -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> > +struct clk_fixed_factor osc12m_clk = {
> > +	.div		= 2,
> > +	.mult		= 1,
> > +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> > +						   osc_24m_clk,
> > +						   &clk_fixed_factor_ops,
> > +						   0),
> > +};
> 
> I think this hunk is a good fix for osc_12m. I applied the patch and
> osc_12m no longer appears in clk_orphan_dump [3]. clk_summary now shows
> osc_12m under osc_24m.

Thanks for the confirmation!

> >  
> >  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
> >  
> > -- 
> > 2.49.0
> > 
> 
> [1] https://gist.github.com/pdp7/d00f0f4fe3fcf368ce253d606dc7b01f
> [2] https://lore.kernel.org/all/91c3373b5b00afc1910b704a16c1ac89.sboyd@kernel.org/
> [3] https://gist.github.com/pdp7/30e51ed013d4bedf0c6abc5717e0b6a5

Regards,
Yao Zi

[1]: https://lore.kernel.org/linux-clk/20250705095816.29480-2-ziyao@disroot.org/
