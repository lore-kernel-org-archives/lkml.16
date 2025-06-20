Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F890EBE;
	Fri, 20 Jun 2025 00:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379931; cv=none; b=hVOaBbg/ksTg0paRsEEEgNq4Ah/env70BQ1KQ3CrzQdfmgpOKEyCO5q9gzz3pQyuXEJn1lxCmt+DpLdCUOrkcabHmQvDXrNGkA8JiYT4eQJ+AoJiiPxxIlr/4paLpIdBYq4tZo77Z2V00hf9wgLfdZOvBCWcIj/U34woDnepQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379931; c=relaxed/simple;
	bh=xT+r7K9OiBk+EdMW4tR3tGw9dLU8vBuU4Ipb1ONEep4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=WRp4EsLrWsIJhhoGGLaY/oHky7Ta010EWPf1B+rf8Tl2tvKT9h+Fq69+DSVAr7mUyHwfFTjfw6W3vMuPKDqApw9TFaqMPKzGO8jW1qEocg0j9F/yrnRcb3pLccD/zUiG54J3IYMiuxX2RGwDfozcpMlE7yukvu3PqsG8/ssTXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVzENPjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVzENPjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8677EC4CEEA;
	Fri, 20 Jun 2025 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750379930;
	bh=xT+r7K9OiBk+EdMW4tR3tGw9dLU8vBuU4Ipb1ONEep4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GVzENPjX9I9+db+c2/GbYUz8TUjCoTCbPrWl4Ppa+kMTKigeinpZI0PDs6pLjZdzs
	 iusETX77A9BJN4Y6kKc9mJuwiI8Zl2UJDka72P+btN4NAMXuXaKm0DQzc7h1daH2gY
	 pktEY8l9s6jOOTQ1gwobcB2UbBUttsN9CulbOmoDFFOPopai26QzUt0dboS8UFXODS
	 aNrBYWQCBoDGXkqmnCsQIGONzW6ESNFtUWOfe2dJ4E/i1EpUFDTymX+mNdNA3hYrdp
	 qPHN4qDAKa3bgBPaKBdevk4hRqIautR4btFF7l7BZEa4JrVixcQLiSQBqnCvvaAGZn
	 oiz3CbOi1cXMQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
References: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
Subject: Re: [PATCH v3] clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Frank.li@nxp.com, Xiaolei Wang <xiaolei.wang@windriver.com>, abelvesa@kernel.org, festevam@gmail.com, kernel@pengutronix.de, mturquette@baylibre.com, peng.fan@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org
Date: Thu, 19 Jun 2025 17:38:49 -0700
Message-ID: <175037992976.4372.2373294324696093637@lazor>
User-Agent: alot/0.11

Quoting Xiaolei Wang (2025-06-18 23:21:08)
> When num_parents is 4, __clk_register() occurs an out-of-bounds
> when accessing parent_names member. Use ARRAY_SIZE() instead of
> hardcode number here.
>=20
>  BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
>  Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
>   Hardware name: NXP i.MX95 19X19 board (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>     dump_backtrace+0x94/0xec
>     show_stack+0x18/0x24
>     dump_stack_lvl+0x8c/0xcc
>     print_report+0x398/0x5fc
>     kasan_report+0xd4/0x114
>     __asan_report_load8_noabort+0x20/0x2c
>     __clk_register+0x1844/0x20d8
>     clk_hw_register+0x44/0x110
>     __clk_hw_register_mux+0x284/0x3a8
>     imx95_bc_probe+0x4f4/0xa70
>=20
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Applied to clk-fixes
