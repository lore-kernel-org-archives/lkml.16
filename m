Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA21632;
	Sun,  6 Jul 2025 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751760492; cv=none; b=ofhHZXPOSAK55K3QlShvj28/+p36nL7nzv8/4voJ9gXIGdKjXFXLmRiFEUwdPHQQAgtgF4oGoBD3Q6+66qr2Ft/jphJmndbyxCEXyRhxdeN1lh59Oi2F1yHwo8NitlkVuNCI8qNrGf7FyGjjg+/1atqsWdTr4Whn7a9Ay9vwFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751760492; c=relaxed/simple;
	bh=uC1minF/xwR/V1v5iYqpAyv3Ym5sMrGVxIQWTllzRes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzEJ8toUEF+qA7A9pe1VxmB2rvglkexVZT5M3s8s7F2nhl2sQo5083DB/qXnU4q7qAdZOIE1FHvE4FxjODGhe9S03wM6dUZy5seihypMCEA+r+8oeMnukLZFX3FiP/6+pyJCxdqO0WRYG6FlfMgUXfCd4cGuT8wXe+0pZcKmS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn5YbIGv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn5YbIGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881BEC4CEE7;
	Sun,  6 Jul 2025 00:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751760491;
	bh=uC1minF/xwR/V1v5iYqpAyv3Ym5sMrGVxIQWTllzRes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cn5YbIGv/LWgzDD/2gs1sB4MOBgTQ9kmN/yTMO/m/ydNNvX9NXIwRYu1SIRWiFM4H
	 R5qHXwhx9WhkvVMmiXnKlwz0oo5HX3AGuexgO5f7amECuv+gAoZ8v8TPwBza2ptSAL
	 0azXhLyXarYVS+FlF4GtSRCskeR2XPUlZqU8TOp/U5SZ9ZkxrvKsSTd4AGd9uK/iZh
	 RzHiDADc0DVNndkxeZuh7H0lBYaBEduxf/zu+PeP5YBcEHYmbs24QeZlQl4H4daH14
	 f46PLwfA12gizZVkO4VwkB0YhDmWaFCQLnniDlX/ZV2Hz9Lvm1wqz2x0fqOR1jgazH
	 lb0pUrQdtPevg==
Date: Sat, 5 Jul 2025 17:08:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGm+adSNdTHyN7K1@x1>
References: <20250705052028.24611-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705052028.24611-1-ziyao@disroot.org>

On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> booting the kernel with mainline U-Boot,
> 
> 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> 	[
> 	  "c910",
> 	  "osc_12m"
> 	]
> 
> where the correct parents should be c910-i0 for c910, and osc_24m for
> osc_12m.

Thanks for sending this patch. However, I only see "osc_12m" listed in
clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
I didn't ever see "c910" appear [1]. What branch are you using?

I think it would be best for this patch to be split into separate
patches for osc_12m and c910.

> The correct parent of c910, c910-i0, is registered with
> devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> structure from scratch. But it's assigned as c910's parent by
> referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> structure is never registered.

I recall Stephen Boyd had the feedback when trying to upstream this
driver to avoid strings for parents and instead use clk_parent_data or
clk_hw pointers directly [2]. It was difficult to find alternitves to
parent strings in all instances.

> Meanwhile, osc_12m refers the external oscillator by setting
> clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
> clock-names property is allowed for compatible thead,th1520-clk-ap.
> 
> For c910, refer c910-i0 by its name; for osc_12m, refer the external
> clock input by index. This eliminates these orphan clocks.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index ebfb1d59401d..74da1a61e6f0 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
>  };
>  
>  static const struct clk_parent_data c910_parents[] = {
> -	{ .hw = &c910_i0_clk.common.hw },
> +	{ .index = -1, .name = "c910-i0" },

Stephen - would this use of a parent string be acceptable?

>  	{ .hw = &cpu_pll1_clk.common.hw }
>  };
>  
> @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
>  	{ .hw = &peri2sys_apb_pclk.common.hw }
>  };
>  
> -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> +struct clk_fixed_factor osc12m_clk = {
> +	.div		= 2,
> +	.mult		= 1,
> +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> +						   osc_24m_clk,
> +						   &clk_fixed_factor_ops,
> +						   0),
> +};

I think this hunk is a good fix for osc_12m. I applied the patch and
osc_12m no longer appears in clk_orphan_dump [3]. clk_summary now shows
osc_12m under osc_24m.

>  
>  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
>  
> -- 
> 2.49.0
> 

[1] https://gist.github.com/pdp7/d00f0f4fe3fcf368ce253d606dc7b01f
[2] https://lore.kernel.org/all/91c3373b5b00afc1910b704a16c1ac89.sboyd@kernel.org/
[3] https://gist.github.com/pdp7/30e51ed013d4bedf0c6abc5717e0b6a5
