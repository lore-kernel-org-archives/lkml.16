Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B659F63B9;
	Thu, 10 Apr 2025 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258155; cv=none; b=YZu5VZn815/j8PrbJDAoRO7jATQtnEKgd/9YCy6Ko+VDjBamKY/GinQDwiHhaYnnA1sogfJZs9LWeidmmU67Q+k4+2H6KCYu+WKj0lGUb0yG9t1xm3fl+IWrmhhnry7lqgJiuCrtsprt31PbxVe9EC4JzWgdsRTlr+M+K/u3hiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258155; c=relaxed/simple;
	bh=6FmV8bhSqaSEa6plfveepL1iT4YnlQ4z1nGKZbWPdJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgXYTr1qk5kWcPwZvVlNxS+mgM5bsu1TvXQ8e3UHpZEhWsnjFDxrNWmBf9BOsb07BTkwURW1gikgriGUfRDRm0v/U/D8esmX4QO/rGDIbtgY35WIReFAPhE9WgKUIEc32ESgr5YCYNISHlTutQ1RocEaje43YqzkAv9WFmIp4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=zojyFwc7; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=sWkxP/PE; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="zojyFwc7";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="sWkxP/PE"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 1FFB512FB451;
	Wed, 09 Apr 2025 21:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258152; bh=6FmV8bhSqaSEa6plfveepL1iT4YnlQ4z1nGKZbWPdJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zojyFwc7TEpeZrWEgNWBaJeCxFP6ZzTp2Q5+gzKBKwVKTkFEXZJv13sZO5r64mSRE
	 eHYXMxjDRWhTf99nTgZ+I4NktzNMeFMOuLzDKVUYEHOpDE3j7if/MEdPGsfJ81R05U
	 lPtlR1OuYe8OuI0U5piWYfW5khcDnD+1YmOEi/esHepfPTNNVDHjRd4Qhm8x4Jn5KS
	 LbQB6C8KEwfXJE7rvFlx2US3ihmaW0GqY2qWEUzNep7s11hq55NPzErbnFWmkQBCkz
	 inD54HEhtQiA2NELs8TXkwIN5okmIexy6lck2V5Z+ANXRBXBsvhbKcf7G/LUVzAtHA
	 fnUnZVw/8PaMw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_uxOYlqyssR; Wed,  9 Apr 2025 21:09:10 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id EFDEB12FB430;
	Wed, 09 Apr 2025 21:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258150; bh=6FmV8bhSqaSEa6plfveepL1iT4YnlQ4z1nGKZbWPdJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWkxP/PEEFnaHVLza+A29CN8dI2HCLiXZBcrDGa4DzL4VLDAPRo9Qoer8Pv5Eg/8E
	 5JlRZIXlirPGARdKCNVh7g/mx4MidLb9T6xn18mDed9/xFrTLwevz4Z+DO4juR50cz
	 eXQVgj9v5ukB6NiNgWBnBy7EwM/ZhOBB5/xs5I460KI39LZEQ6yprIBxLC4+J5fPYY
	 G50FxwRfVJJsoPeP3ZQ+TQVMiCdoMbiDv+CwALfYLSxb3lS+WjzELlQbvecqUPWFoF
	 IKS2+LgZiws+9Gge1R90UXzY7mZTjLFGu2IvZFNRHxPkEC3ja4NB8Yg8VOuVkzEw96
	 UAQrVyO2a+3pQ==
Date: Thu, 10 Apr 2025 04:09:02 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
Message-ID: <Z_dEXjck56Q_M6r3@ketchup>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-5-heylenay@4d2.org>
 <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>

On Tue, Apr 08, 2025 at 02:37:29PM -0500, Alex Elder wrote:
> On 4/1/25 12:24 PM, Haylen Chu wrote:
> > The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> > selection bits, reset assertion bit and enable bits for function and bus
> > clocks. It has a quirk that reading always results in zero.
> > 
> > As a workaround, let's hardcode the mux value as zero to select
> > pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> > is combined from the real bus and function clocks to avoid the
> > write-only register being shared between two clk_hws, in which case
> > updates of one clk_hw zero the other's bits.
> > 
> > With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> > controller could be brought up, which is essential for boards attaching
> > power-management chips to it.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> Now that I understand why, I'm glad you put this into a separate
> patch.  However I think you should make a note in the code to
> indicate there's something different about this one clock.
> People can then go back (with "git blame") to see the explanation
> above.
> 
> Please consider adding such a comment in your next version.

Sure I'm willing to.

> Reviewed-by: Alex Elder <elder@riscstar.com>

Best regards,
Haylen Chu

> > ---
> >   drivers/clk/spacemit/ccu-k1.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > index cd95c4f9c127..5804c2f85407 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
> >   		    0);
> >   CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
> >   		    0);
> > +CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
> > +		BIT(1) | BIT(0), 0);
> >   static const struct clk_parent_data timer_parents[] = {
> >   	CCU_PARENT_HW(pll1_d192_12p8),
> > @@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
> >   		BIT(0), 0);
> >   CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
> >   		BIT(0), 0);
> > +CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
> >   CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
> >   		BIT(0), 0);
> > @@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
> >   	[CLK_TWSI5]		= &twsi5_clk.common.hw,
> >   	[CLK_TWSI6]		= &twsi6_clk.common.hw,
> >   	[CLK_TWSI7]		= &twsi7_clk.common.hw,
> > +	[CLK_TWSI8]		= &twsi8_clk.common.hw,
> >   	[CLK_TIMERS1]		= &timers1_clk.common.hw,
> >   	[CLK_TIMERS2]		= &timers2_clk.common.hw,
> >   	[CLK_AIB]		= &aib_clk.common.hw,
> > @@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
> >   	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
> >   	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
> >   	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> > +	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
> >   	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
> >   	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
> >   	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,
> 
