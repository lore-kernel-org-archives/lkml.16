Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7929A1
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748226195; cv=none; b=VHl39DW0/Zbahlol4ZAUzXrY3F8Q8HgqBUrGK4IwKNTfx4J659MpuKkXCct56Csl0ogfIsX9MZXk+JBAYJH65X568z+igwvIRNiPnJsCtDM76SwsVydq7DM4c2ZUVhOe5PdfpL5OxvstlT7AtDmnYcKq7k9wbEDxOROYybQ+u9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748226195; c=relaxed/simple;
	bh=n2SqlytwItWt8/wF4P3nV4tFs422265MYYlBSANWFvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3GQkFuDPGI94lSUjqfBGJkBroCNUw52XzIn4/bCdmRgndPUeMhTF3D4U6PuVJhJs/WtVGuR/V4mRJh8WS+mTmY6Gt1JA49pjra7h7dJBeZikReaMiWqGaAQiIv6vRqzApPXSkySnN5srfKkj0HfhWRBIfjEKkvl4AW4zJCTQqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zekzu02V; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zekzu02V"
Message-ID: <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748226180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHrrgO4T8/5vtp/a4llt3X0WdmaU+h5OTxvm6amIygc=;
	b=Zekzu02VUU4sA5O/Q7hlWJRDia/qU8bJPMeFs2zxqQb1BH6yp6B3EstCyGEgyCb5+PSHyn
	wh6v/EiZN01xVP96FIKAc8+OXWJ0aGTBTvPbw9lPiGnXDY3lSvOn8lSatgw238V+31C2YK
	JBEtsP+6KT1Cm55H4qHnrlMTw2x7V2c=
Date: Mon, 26 May 2025 10:22:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: add explicit check and error on invalid PTP
 clock rate
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/23/25 7:46 PM, Alexis LothorÃ© 写道:
> While some platforms implementing dwmac open-code the clk_ptp_rate
> value, some others dynamically retrieve the value at runtime. If the
> retrieved value happens to be 0 for any reason, it will eventually
> propagate up to PTP initialization when bringing up the interface,
> leading to a divide by 0:
> 
>   Division by zero in kernel.
>   CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.30-00001-g48313bd5768a #22
>   Hardware name: STM32 (Device Tree Support)
>   Call trace:
>    unwind_backtrace from show_stack+0x18/0x1c
>    show_stack from dump_stack_lvl+0x6c/0x8c
>    dump_stack_lvl from Ldiv0_64+0x8/0x18
>    Ldiv0_64 from stmmac_init_tstamp_counter+0x190/0x1a4
>    stmmac_init_tstamp_counter from stmmac_hw_setup+0xc1c/0x111c
>    stmmac_hw_setup from __stmmac_open+0x18c/0x434
>    __stmmac_open from stmmac_open+0x3c/0xbc
>    stmmac_open from __dev_open+0xf4/0x1ac
>    __dev_open from __dev_change_flags+0x1cc/0x224
>    __dev_change_flags from dev_change_flags+0x24/0x60
>    dev_change_flags from ip_auto_config+0x2e8/0x11a0
>    ip_auto_config from do_one_initcall+0x84/0x33c
>    do_one_initcall from kernel_init_freeable+0x1b8/0x214
>    kernel_init_freeable from kernel_init+0x24/0x140
>    kernel_init from ret_from_fork+0x14/0x28
>   Exception stack(0xe0815fb0 to 0xe0815ff8)
> 
> Prevent this division by 0 by adding an explicit check and error log
> about the actual issue.

 From your description, I cannot determine the scope
of "some platforms". My point is: if there are only
a few platforms, can we find a way to handle this in
the directory of the corresponding platform?

And there need a Fixes tag.


Thanks,
Yanteng
> 
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 918d7f2e8ba992208d7d6521a1e9dba01086058f..f68e3ece919cc88d0bf199a394bc7e44b5dee095 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -835,6 +835,11 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
>   	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
>   		return -EOPNOTSUPP;
>   
> +	if (!priv->plat->clk_ptp_rate) {
> +		netdev_err(priv->dev, "Invalid PTP clock rate");
> +		return -EINVAL;
> +	}
> +
>   	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>   	priv->systime_flags = systime_flags;
>   
> 
> ---
> base-commit: e0e2f78243385e7188a57fcfceb6a19f723f1dff
> change-id: 20250522-stmmac_tstamp_div-f55112f06029
> 
> Best regards,

