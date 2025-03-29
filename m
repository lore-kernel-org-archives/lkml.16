Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79F208D0;
	Sat, 29 Mar 2025 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243718; cv=none; b=hJyr0BU7D0RXyYe6ud4zcAxkQ6Zxlz7OTnIyGXudVjAOpixv8Flv8L+YWk3dOFOALVHHGRNW08nqlaWustNHmDIN7A75S1E3Pk4LpGp1GOz2FRH9KJfhs+LIcP5SfEYLMzmTbFivLrq8vXfHc6osmcooehxXTtE4eqIi9S+EOfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243718; c=relaxed/simple;
	bh=fhA90Tx9eI1SkiVBFprOFxj8QYdAvN7Gsg11849kV7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avZBfBqozWct4Rq1wUjWL16jaht1RNzwSWGUoXfWb54ukkHGWXYyT2+/qRkAgpJHjN3Tp4NFHeYdNNwNp8x+uYj7s5ZO5Eq4ukPTCJwH8C1n0fRucXhXMjsZfm77apc+zYktH5kRp91y5i6i39IdCPIGJRtjXA352UlSwy+2qEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=fb8y+ap7; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=voX2CYEl; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="fb8y+ap7";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="voX2CYEl"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id ED04FEC59F9;
	Sat, 29 Mar 2025 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743243708; bh=fhA90Tx9eI1SkiVBFprOFxj8QYdAvN7Gsg11849kV7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fb8y+ap7DBFY1LJ6n2D6DONFzaF6mhO+7+hgOC99FiAZsPJK8w/meTLkSqU7QWULK
	 V2ck4SIV97dvsaxFGZqHqpEnF1yJr05wm/frUWsNfM3XRFPuXEN29Mtpxg22vdLpYZ
	 IDWu9RfpD7gFCubi87Ob4jBdGii0HksDLLW2IMv0BEfLxeEJQ9mez4mMQRyPiihswo
	 scxtJhsnQ+hshim06Y80tgL6hlbyDdLhbBA0vl+b+HeUcb4dV74XrxQ6riNj8fgwxQ
	 DJJHAqWvuhJFuENxlFiKOg7fkSB2do6mLViCXWOgaWtN+QgFf8/CLQx5hULZw8YhaS
	 itEkSikIZbkFQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLKqUTbdVgti; Sat, 29 Mar 2025 03:21:45 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id DF13BEC59F8;
	Sat, 29 Mar 2025 03:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743243704; bh=fhA90Tx9eI1SkiVBFprOFxj8QYdAvN7Gsg11849kV7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=voX2CYElcjGryqXnLzklh0uk6LbuUxt46gQyvHJeKaAJ2fR77jLi8H9g0OO+I5kKg
	 ATZaZvrKZhNu0sHGwJO+NH/e7yDxZ56RdFXqnZXY8dWMKnCsfMLkTGZVe6nVFCvVZg
	 +B2A6IAn4qlDCL91e5NMf/DMJaza/Llge0oDrW9az4LQgDsLlwXB9CGs9SBYe3i32y
	 1+0FPJ+BOlLATdOf4790A+EjoiOJdjacQNPiPu/HXJKzO/5BeHkEy5hqo3hjjcM9EQ
	 g/BtB1CwdQ10rgiR/tSOcbLGbNCu6UZPbTiDlqR3FQdpPeGwM4YDsTXx/yXqJAYqW6
	 0h3Fxm+zxG8wg==
Date: Sat, 29 Mar 2025 10:21:36 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z-fJsC_OnmE_0yys@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
 <Z-E-nhNzUx_YFFZZ@ketchup>
 <188bd370-6e9d-4104-8731-926ce4f3c211@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <188bd370-6e9d-4104-8731-926ce4f3c211@riscstar.com>

On Fri, Mar 28, 2025 at 09:00:40AM -0500, Alex Elder wrote:
> On 3/24/25 6:14 AM, Haylen Chu wrote:
> > On Tue, Mar 11, 2025 at 06:19:51PM -0500, Alex Elder wrote:
> > > On 3/6/25 11:57 AM, Haylen Chu wrote:
> > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > 
> > > > All register operations are done through regmap to ensure atomiciy
> > > > between concurrent operations of clock driver and reset,
> > > > power-domain driver that will be introduced in the future.
> > > > 
> > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > 
> > > I'm very glad you have the DT issues resolved now.
> > > 
> > > I again have lots of comments on the code, and I think I've
> > > identified a few bugs.  Most of my comments, however, are
> > > suggesting minor changes for consistency and readability.
> > > 
> > > I'm going to skip over a lot of "ccu-k1.c" because most of what I
> > > say applies to the definitions in the header files.
> 
> Sorry I didn't respond to this earlier.

I've already started to work on the v6, so it doesn't matter. I'll also
cover some new decisions made during improving v6 in the reply.

> > > > ---
> > > >    drivers/clk/Kconfig               |    1 +
> > > >    drivers/clk/Makefile              |    1 +
> > > >    drivers/clk/spacemit/Kconfig      |   20 +
> > > >    drivers/clk/spacemit/Makefile     |    5 +
> > > >    drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
> > > >    drivers/clk/spacemit/ccu_common.h |   47 +
> > > >    drivers/clk/spacemit/ccu_ddn.c    |   80 ++
> > > >    drivers/clk/spacemit/ccu_ddn.h    |   48 +
> > > >    drivers/clk/spacemit/ccu_mix.c    |  284 +++++
> > > >    drivers/clk/spacemit/ccu_mix.h    |  246 +++++
> > > >    drivers/clk/spacemit/ccu_pll.c    |  146 +++
> > > >    drivers/clk/spacemit/ccu_pll.h    |   76 ++
> > > >    12 files changed, 2668 insertions(+)
> > > >    create mode 100644 drivers/clk/spacemit/Kconfig
> > > >    create mode 100644 drivers/clk/spacemit/Makefile
> > > >    create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > >    create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > >    create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > >    create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > >    create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > >    create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > >    create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > >    create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > 
> > 
> > ...
> > 
> > > > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > > > new file mode 100644
> > > > index 000000000000..5974a0a1b5f6
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/ccu-k1.c

...

> > > > diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
> > > > new file mode 100644
> > > > index 000000000000..494cde96fe3c
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/ccu_common.h
> > > > @@ -0,0 +1,47 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > > > + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
> > > > + */
> > > > +
> > > > +#ifndef _CCU_COMMON_H_
> > > > +#define _CCU_COMMON_H_
> > > > +
> > > > +#include <linux/regmap.h>
> > > > +
> > > 
> > > I'm not going to suggest it at this point, but it might
> > > have worked out more nicely if you defined a top-level CCU
> > > structure that contained a union of structs, one for each
> > > type of clock (PLL, DDN, mix).
> > > 
> > > > +struct ccu_common {
> > > > +	struct regmap *regmap;
> > > > +	struct regmap *lock_regmap;
> > > 
> > > The lock_regmap is only used for PLL type clocks, right?
> > > So it could be included in the PLL struct within the union
> > > below?
> > 
> > This makes sense to me.
> 
> It might make sense but in part my suggestion makes more
> sense when taken with the comment I had above (about having
> a CCU structure with a union rather than separate per-type
> structures).  I think that would be better, but again I
> don't want you to have to do all that work if it means
> delaying getting your code accepted.
> 
> So move it to the union if that works, but for now it's
> fine the way it is.

I'll prefer to keep the regmap lock in the toplevel structure for now.
Moving the pointer into the union requires special care: we cannot
simply assign lock_regmap with NULL anymore in spacemit_ccu_register()
without checking the subtype of clk_hw, or part of the mix/ddn's struct
may be overwritten.

Keeping lock_regmap out of the union ensures the code is simple and
makes it less possible to accidentally mess the union up.

> > > > +
> > > > +	union {
> > > > +		/* For DDN and MIX */
> > > > +		struct {
> > > > +			u32 reg_ctrl;
> > > > +			u32 reg_fc;
> > > > +			u32 fc;

...

> > > 
> > > You define PLL_SWCR3_EN in "ccu_pll.c" to have value BIT(31).
> > > that's good.  But you should define its inverse, to define
> > > which bits in the reg_swcr3 field are the valid "magic" part.
> > > In both cases, I would define them here in this file, where
> > > the structure type is defined (not in "ccu_pll.c").
> > > #define SPACEMIT_PLL_SWCR3_EN	(u32)BIT(31)
> > > #define SPACEMIT_PLL_SWCR3_MASK	~(SPACEMIT_PLL_SWCR3_EN)

I changed my mind and consider it's better to keep these macros in
ccu_pll.c, since it isn't that useful outside of the file (knowing the
exact definition of swcr3 doesn't help much, as we're really defining
some magic values). It's not a strong opinion anyway.

> > > > +		};
> > > > +	};
> > > > +
> > > > +	struct clk_hw hw;
> > > > +};

...

> > > > diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> > > > new file mode 100644
> > > > index 000000000000..ee187687d0c4
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/ccu_ddn.c
> > > > @@ -0,0 +1,80 @@
> > 
> > ...
> > 
> > > > +static unsigned long clk_ddn_calc_best_rate(struct ccu_ddn *ddn,
> > > > +					    unsigned long rate, unsigned long prate,
> > > > +					    unsigned long *num, unsigned long *den)
> > > > +{
> > > > +	rational_best_approximation(rate, prate / 2,
> > > > +				    ddn->den_mask, ddn->num_mask,
> > > > +				    den, num);
> > > 
> > > Using rational_best_approximation() is excellent.  However I
> > > think you have a bug, and I don't think the exact way you're
> > > using it is clear (and might be wrong).
> > > 
> > > The bug is that the third and fourth arguments are the maximum
> > > numerator and denominator, respectively.  You are passing mask
> > > values, which in some sense represent the maximums.  However,
> > > your masks are not always in the low-order bits.  Here is one
> > > example:
> > > 
> > > static CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6,
> > >                        MPMU_SUCCR,
> > >                        GENMASK(28, 16), 16, GENMASK(12, 0), 0,
> > >                        0);
> > > 
> > > The "_num_mask" argument to this macro is 0x1fff0000, and the
> > > "_den_mask" is 0x00000fff.  The latter value (which gets passed
> > > as the max_numerator argument to rational_best_approximation())
> > > is fine, but the former is not.  So you need to shift both masks
> > > right by their corresponding shift value.
> > 
> > Thanks for finding it! I forget to change the function when redefining
> > struct ccu_ddn.
> > 
> > > Beyond that bug, rational_best_approximation() wants its first
> > > two arguments to define the desired rate (as a fraction).
> > 
> > I don't think it's the way that rational_best_approximation() works.
> > The first two arguments define the desired fraction, not the rate.
> > 
> > > So the desired rate should be the actual desired rate divided by 1
> > > (rather than being divided by the half the parent rate).  So
> > > this too might be a bug.
> 
> OK I took another look at this.  And I looked at the first commit
> that used this function to understand how to use it:
>   534fca068ec80 imx: serial: use rational library function
> 
> You want to know what are the best available numerator and
> denominator values to use (which fit into your register fields).
> These should be as close as possible to the fraction you're after.
> 
>     Fout = Fin * num / denom
> 
> Fin is the parent rate (always divided by two in this case),
> or "prate / 2".  Fout is the desired rate, or "rate".  You might
> get a better result if you express the "/ 2" in the parent rate
> as "* 2" in the desired rate.
> 
>     num_max = ddn->num_mask >> __ffs(ddn->num_mask);
>     den_max = ddn->den_mask >> __ffs(ddn->den_mask);
>     rational_best_approximation(rate * 2, prate,
> 				num_max, den_max, &num, &den)

Thanks, this should help :)

...

> > > > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > > > new file mode 100644
> > > > index 000000000000..9df2149f6c98
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/ccu_pll.c

...

> > > > +/* frequency unit Mhz, return pll vco freq */
> > > > +static unsigned long ccu_pll_get_vco_freq(struct clk_hw *hw)
> > > > +{
> > > > +	const struct ccu_pll_rate_tbl *pll_rate_table;
> > > > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > > > +	struct ccu_common *common = &p->common;
> > > > +	u32 swcr1, swcr3, size;
> > > > +	int i;
> > > > +
> > > > +	ccu_read(swcr1, common, &swcr1);
> > > > +	ccu_read(swcr3, common, &swcr3);
> > > 
> > > You are masking off the EN bit, but you should really be
> > > using a mask defining which bits are valid instead.  As
> > > I said earlier:
> > > 
> > > #define SPACEMIT_PLL_SWCR3_MASK	~(SPACEMIT_PLL_SWCR3_EN)
> > > 
> > > > +	swcr3 &= ~PLL_SWCR3_EN;
> > > 
> > > 	swcr3 &= SPACEMIT_PLL_SWCR3_MASK;
> > > > +
> > > > +	pll_rate_table = p->pll.rate_tbl;
> > > > +	size = p->pll.tbl_size;
> > > > +
> > > > +	for (i = 0; i < size; i++) {
> > > > +		if (pll_rate_table[i].swcr1 == swcr1 &&
> > > > +		    pll_rate_table[i].swcr3 == swcr3)
> > > > +			return pll_rate_table[i].rate;
> > > > +	}
> > > > +
> > > 
> > > I have a general question here.  Once you set one of these
> > > clock rates, it will always use one of the rates defined
> > > in the table.
> > > 
> > > But what about initially?  Could the hardware start in a
> > > state that is not defined by this code?  Do you *set* the
> > > rate initially?  Should you (at least the first time the
> > > clock is prepared/enabled)?
> > 
> > Thanks, I've also seen your later report. Here we may support
> > clk_ops.init and reinitialize the PLL if it's not in a good state.
> > 
> > Could you please provide a possible reproducing scenario for me to test
> > against the PLL problem?
> 
> What I can tell you is that I see the warning, perhaps when
> I'm using the clock.  I'll try to narrow down a test case but
> right now I don't have one.
> 
> [    0.145906] WARNING: CPU: 0 PID: 1 at drivers/clk/spacemit/ccu_pll.c:51
> ccu_pll_recalc_rate+0x76/0x9a
> 
> I added code to report the swcr1 and swcr3 values but I don't
> have those right now.

I guess I've roughly located the cause, the warning is probably
triggered by PLL3,

- Comparing with vendor U-Boot, the driver is missing three or four
  entries and one of them matches the SWCR1 value (0x0050cd61)
- There's a typo when defining PLL3,

+static CCU_PLL_DEFINE(pll3, pll3_rate_tbl,
+                     APBS_PLL3_SWCR1, APBS_PLL2_SWCR3,
+                     MPMU_POSR, POSR_PLL3_LOCK, CLK_SET_RATE_GATE);

  here APBS_PLL2_SWCR3 should be APBS_PLL3_SWCR3. This explains the
  value of SWCR3 (0x3fe00000) in your case, where it's actually read
  from PLL2's register.

I'll add the missing configuration entries and fix the typo in v6.

> > 
> > > > +	WARN_ON_ONCE(1);
> > > 
> > > Maybe WARN_ONCE(true, "msg");
> > > 
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int ccu_pll_enable(struct clk_hw *hw)
> > > > +{
> > > > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > > > +	struct ccu_common *common = &p->common;
> > > > +	unsigned int tmp;
> > > > +	int ret;
> > > > +
> > > 
> > > Get rid of ret (see below).
> > > 
> > > Will clk_ops->enable() ever be called when it's already
> > > enabled?  (If it won't, this isn't needed.  If it will,
> > > this checks the hardware, which is good.)
> > 
> > CCF holds a refcounter of clock consumers, so we could drop the check.

I didn't expect calls to ccu_pll_enable() may happen when the
previous stage bootloaders have already initialized the PLL. So the
right anwswer is yes, clk_ops->enable() may be called when the
underlying clock hardware has been enabled, but remove the check
shouldn't hurt, either: it's okay to rewrite the register as long as
we don't change rate-related settings if the PLL is enabled.

> > > > +	if (ccu_pll_is_enabled(hw))
> > > > +		return 0;
> > > > +
> > > > +	ccu_update(swcr3, common, PLL_SWCR3_EN, PLL_SWCR3_EN);
> > > > +
> > > > +	/* check lock status */
> > > > +	ret = regmap_read_poll_timeout_atomic(common->lock_regmap,
> > > > +					      p->pll.reg_lock,
> > > > +					      tmp,
> > > > +					      tmp & p->pll.lock_enable_bit,
> > > > +					      5, PLL_DELAY_TIME);
> > > 
> > > Just:
> > > 
> > > 	return regmap_read_poll_timeout_atomic(...);
> > > 
> > > I note that you call this here, but you hide the call
> > > to regmap_read_poll_timeout_atomic() behind the macro
> > > ccu_poll().  And ccu_poll() (used for the FC bit) is
> > > also only called once.
> > > 
> > > I suggest you get rid of regmap_poll() and just open-code
> > > it.
> > > 
> > > (You use ccu_read() and ccu_update() numerous times, so
> > > your "saving some characters" is justified.)
> > 
> > Makes sense to me, will take it.
> > 
> > > > +
> > > > +	return ret;
> > > > +}

Thanks,
Haylen Chu
