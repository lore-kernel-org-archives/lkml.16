Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C819343B;
	Sun,  6 Jul 2025 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751776841; cv=none; b=s1Xo0GCW2BAYUDzDvDUsaEHKKNoXdCSqrmRL45dETADyw4gA2VtEylJG+OS7zVTUzT4GnMKCQr0SVXW/dSpUaPdpK3K9sbUipTXU/22WADohah3/HPw/tAvXtCUNCjxu9G3u48Vt4fhgt8WzCBNVMvavYdhfho41hb/kCDd+tng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751776841; c=relaxed/simple;
	bh=yD7hy+qvA/sqLOhhyRdGian/38CtG4QZ1NJCxIqtssE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t43YmVz/23ptGCkB6cGue6fqblkSk+Tx2uomW7opyYMpUE7og3xoHMnAAWs629wFmw2miPTrbvRK/AIDBsNls4WGjgzweJu5M8U6PVdM7zdYowAOk5B7KRmQYZDf6uF9zCBTNoeFUtLlO+6vJ5vY3aEJdhndclt8Fiaht5Edc3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avQ40iEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avQ40iEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7337BC4CEF1;
	Sun,  6 Jul 2025 04:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751776840;
	bh=yD7hy+qvA/sqLOhhyRdGian/38CtG4QZ1NJCxIqtssE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avQ40iEf43hpf73MdaoS6qgkZ7zLUoNH+dTJpWx0nG+bv3ahSO5tzyH/fw39+18fT
	 lCOzoW9Wr27hKzrXyHlJSeZcJSNYwL1vFTLvTzAh/TSo3LcfyhbdQj6DJVhea3pqAQ
	 PO2P3ynl+y63kSZES5Ta/wHe9RW+AnNXXO73uWKafZf05w/+/Cw+IbmBpgXm2digVV
	 6zM0GVfEaMUOyfNxAfiSWTSpHh/l3dUaQHfQT8GjGkKSrSUZXkvxbRpYRQ2+DnT6T5
	 RpEzyoIDfRb7GPtyzRD+HMPFNrPL2Vb3LB7L4W03WYqI6WD2+UQLh+lonKszKflULF
	 6LQXXjYUhcsxw==
Date: Sat, 5 Jul 2025 21:40:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Avoid DT fetch in possible_parent_show if clk_hw is
 provided
Message-ID: <aGn+R1/y8AxoZPsH@x1>
References: <20250705095816.29480-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705095816.29480-2-ziyao@disroot.org>

On Sat, Jul 05, 2025 at 09:58:17AM +0000, Yao Zi wrote:
> When showing a parent for which clk_core_get_parent_by_index fails, we
> may try using the parent's global name or the local name. If this fails
> either, the parent clock's clock-output-names is fetched through
> DT-index.
> 
> struct clk_hw pointer takes precedence with DT-index when registering
> clocks, thus most drivers only zero the index member of struct
> clk_parent_data when providing the parent through struct clk_hw pointer.
> If the pointer cannot resovle to a clock, clk_core_get_parent_by_index
> will fail as well, in which case possible_parent_show will fetch the
> parent's clock-output-names property, treat the unintended, zeroed index
> as valid, and yield a misleading name if the clock controller does come
> with a clocks property.
> 
> Let's add an extra check against the struct clk_hw pointer, and only
> perform the DT-index-based fetch if it isn't provided.
> 
> Fixes: 2d156b78ce8f ("clk: Fix debugfs clk_possible_parents for clks without parent string names")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
> 
> This was found when fixing the wrong parent description of
> clk-th1520-ap.c[1]. Without the patch,
> 
> 	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
> 	osc_24m cpu-pll1
> 
> The first parent should be c910-i0, provided by an unresolvable struct
> clk_hw pointer. osc_24m is the first (and only) parent specified in
> devicetree for the clock controller. With the patch,
> 
> 	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
> 	(missing) cpu-pll1
> 
> [1]: https://lore.kernel.org/linux-riscv/20250705052028.24611-1-ziyao@disroot.org/
> 
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf..280d3a470228 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3594,7 +3594,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
>  	} else if (core->parents[i].fw_name) {
>  		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
>  	} else {
> -		if (core->parents[i].index >= 0)
> +		if (!core->parents[i].hw && core->parents[i].index >= 0)
>  			name = of_clk_get_parent_name(core->of_node, core->parents[i].index);
>  		if (!name)
>  			name = "(missing)";
> -- 
> 2.49.0
> 

Tested-by: Drew Fustini <fustini@kernel.org>

I've tested this using next-20250704 on with the TH1520-based LPi 4a.
Without the patch, I also get the misleading output:

 # cat /sys/kernel/debug/clk/c910/clk_possible_parents
 osc_24m cpu-pll1

With this patch applied, the output now reflects the missing parent:

 # cat /sys/kernel/debug/clk/c910/clk_possible_parents
 (missing) cpu-pll1

Thanks,
Drew
