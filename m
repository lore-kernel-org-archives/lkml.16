Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137B1FF1D9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746439361; cv=none; b=sGWc4oAWhUqVldQuGUVy1Kj54JS3jPij7/zz5i7ImcmGeQg6tyBcvpwI+VK0l06RW7x+kSTGPdWdqRJ/Oo68OSOLxM5I+VGtKrbyr1bTtz82PoKIt6Bz5kQLF7fs75qkKQ+iljzu8/0LdYBy5rH71FkMyFtqMiureJhumz9anIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746439361; c=relaxed/simple;
	bh=+i8RFzkZoX9C4Y5E+ML1qDAqYKxNOwUEf4YF2pe5eY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3hMHSQu8x+XI2NsxgsLpzv34piQDfnsSJhXisr2u0Awzb2P9TfmilM3xEeSMK1qyd5eoqt+DQw7qVhcszI5TLGjPLs8S2dUcYJBdpXqVZBY+PAL1bjC2OcHB4N7KXudzL5J/Hq7KUQBRsygERPYFtysa8t9vxb6R5mw2HhQ25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uBseZ-00065o-Fv; Mon, 05 May 2025 12:02:27 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uBseZ-001DBp-0F;
	Mon, 05 May 2025 12:02:27 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uBseY-004a6Z-31;
	Mon, 05 May 2025 12:02:26 +0200
Date: Mon, 5 May 2025 12:02:26 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v4 3/3] clk: add TI CDCE6214 clock driver
Message-ID: <aBiMsjGBx0V4Vbsl@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
 <20250430-clk-cdce6214-v4-3-9f15e7126ac6@pengutronix.de>
 <e5858fe5d4276a735c5354e955358f27@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5858fe5d4276a735c5354e955358f27@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Thu, May 01, 2025 at 11:48:15AM -0700, Stephen Boyd wrote:
> Quoting Sascha Hauer (2025-04-30 02:01:36)
> > diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
> > new file mode 100644
> > index 0000000000000..62e832dd85ba5
> > --- /dev/null
> > +++ b/drivers/clk/clk-cdce6214.c
> > @@ -0,0 +1,1310 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Driver for the TI CDCE6214 clock generator
> 
> Maybe you can link to the datasheet site

Ok, can do.

> 
> > + *
> > + * Copyright (c) 2023 Alvin ¦ipraga <alsi@bang-olufsen.dk>
> > + * Copyright (c) 2025 Sascha Hauer <s.hauer@pengutronix.de>
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/of.h>
> > +#include <linux/clk.h>
> 
> Drop this include assuming it isn't used.

Dropped.

> > +#define CDCE6214_NUM_CLOCKS    ARRAY_SIZE(clk_names)
> > +
> > +struct cdce6214;
> > +
> > +struct cdce6214_clock {
> > +       struct clk_hw hw;
> > +       struct cdce6214 *priv;
> > +       int index;
> 
> Does it need to be signed?

No, changed to unsigned.

> > +static u8 cdce6214_clk_out0_get_parent(struct clk_hw *hw)
> > +{
> > +       struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
> > +       struct cdce6214 *priv = clock->priv;
> > +       unsigned int val, idx;
> > +
> > +       regmap_read(priv->regmap, 2, &val);
> > +
> > +       idx = FIELD_GET(R2_REFSEL_SW, val);
> > +
> > +       switch (idx) {
> > +       case 0:
> > +       case 1:
> 
> Why isn't case 3 here?
> 
> > +               idx = 0;
> > +               break;
> > +       case 2:
> > +               idx = 1;
> > +               break;
> > +       case 3:
> > +               idx = 0;
> > +               break;
> > +       };
> 
> Or even better, idx = 0 by default and if the FIELD_GET() returns 2 idx
> is 1.
> 
> 	if (FIELD_GET(R2_REFSEL_SW, val) == 2)
> 		return 1;
> 
> 	return 0;

Ok, changed.

> > +static int cdce6214_get_out_div(unsigned long rate, unsigned long parent_rate)
> > +{
> > +       unsigned int div = DIV_ROUND_CLOSEST(parent_rate, rate);
> > +
> > +       if (div < 1)
> > +               div = 1;
> > +
> > +       if (div > R72_CH4_DIV)
> > +               div = R72_CH4_DIV;
> > +
> > +       return div;
> 
> Is this divider_get_val(rate, parent_rate, NULL, 13,
> CLK_DIVIDER_ROUND_CLOSEST)?

Will check. One difference is that divider_get_val() actually ignores
the CLK_DIVIDER_ROUND_CLOSEST flag, but maybe DIV_ROUND_UP_ULL() is even
more correct here.

> > +static int pll_calc_values(unsigned long parent_rate, unsigned long out,
> > +                          unsigned long *ndiv, unsigned long *num, unsigned long *den)
> > +{
> > +       u64 a;
> > +
> > +       if (out < CDCE6214_VCO_MIN || out > CDCE6214_VCO_MAX)
> > +               return -EINVAL;
> > +
> > +       *den = 10000000;
> > +       *ndiv = out / parent_rate;
> > +       a = (out % parent_rate);
> 
> Drop useless parenthesis please.

Ok.

> 
> > +       a *= *den;
> > +       do_div(a, parent_rate);
> > +       *num = a;
> > +
> > +       return 0;
> > +}
> > +
> > +static unsigned long cdce6214_clk_pll_recalc_rate(struct clk_hw *hw,
> > +                                                 unsigned long parent_rate)
> > +{
> > +       struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
> > +       struct cdce6214 *priv = clock->priv;
> > +       unsigned long ndiv, num, den;
> > +       unsigned int val;
> > +
> > +       regmap_read(priv->regmap, 30, &val);
> 
> Maybe it would be better to have '#define R30 30' just so we can easily
> jump to the fields like R30_PLL_NDIV. I see that the datasheet doesn't
> give a name to these registers besides prefixing the decimal offset with
> the letter 'R'.

Ok.

> 
> > +       ndiv = FIELD_GET(R30_PLL_NDIV, val);
> > +
> > +       regmap_read(priv->regmap, 31, &val);
> > +       num = FIELD_GET(R31_PLL_NUM_15_0, val);
> > +
> > +       regmap_read(priv->regmap, 32, &val);
> > +       num |= FIELD_GET(R32_PLL_NUM_23_16, val) << 16;
> > +
> > +       regmap_read(priv->regmap, 33, &val);
> > +       den = FIELD_GET(R33_PLL_DEN_15_0, val);
> > +
> > +       regmap_read(priv->regmap, 34, &val);
> > +       den |= FIELD_GET(R34_PLL_DEN_23_16, val) << 16;
> > +
> > +       if (!den)
> > +               den = CDCE6214_DENOM_DEFAULT;
> > +
> > +       return parent_rate * ndiv + DIV_ROUND_CLOSEST(parent_rate * num, den);
> > +}
> > +
> > +static long cdce6214_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > +                                       unsigned long *best_parent_rate)
> > +{
> > +       if (rate < CDCE6214_VCO_MIN)
> > +               rate = CDCE6214_VCO_MIN;
> > +       if (rate > CDCE6214_VCO_MAX)
> > +               rate = CDCE6214_VCO_MAX;
> > +       if (rate < *best_parent_rate * 24)
> 
> What is 24?

It's the minimum allowed divider value for the PLL. I'll add a define
for it.

> > +
> > +       if (enable > 0) {
> > +               regmap_clear_bits(priv->regmap, 5, mask);
> > +       } else if (!enable) {
> > +               regmap_set_bits(priv->regmap, 5, mask);
> > +       } else {
> > +               regmap_read(priv->regmap, 5, &val);
> > +
> > +               return !(val & mask);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cdce6214_clk_psx_prepare(struct clk_hw *hw)
> > +{
> > +       return cdce6214_clk_psx_ldo(hw, 1);
> 
> Instead of this multiplexing with 1/0/-1 can we have logic that returns
> the mask?
> 
> 	unsigned int cdce6214_clk_psx_mask(struct clk_hw *hw)
> 
> This prepare function would be easier to read because we can see that it
> clears bits
> 
> 	static int cdce6214_clk_psx_prepare(struct clk_hw *hw)
> 	{
> 		struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
> 		struct regmap *regmap = clock->priv->regmap;
> 		unsigned int mask = cdce6214_clk_psx_mask(hw);
> 
> 		return regmap_clear_bits(regmap, 5, mask);
> 	}

Ok, can do.

> > +static unsigned long cdce6214_clk_psx_recalc_rate(struct clk_hw *hw,
> > +                                                 unsigned long parent_rate)
> > +{
> > +       struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
> > +       struct cdce6214 *priv = clock->priv;
> > +       unsigned int psx[] = { 4, 5, 6, 6 };
> 
> const?

Yes.

> > +static int cdce6214_get_psx_div(unsigned long rate, unsigned long parent_rate)
> > +{
> > +       unsigned int div = DIV_ROUND_CLOSEST(parent_rate, rate);
> > +
> > +       if (div < 4)
> > +               div = 4;
> > +
> > +       if (div > 6)
> > +               div = 6;
> 
> Use 'return clamp(div, 4, 6)'

Ok.

> > +static int cdce6214_clk_register(struct cdce6214 *priv)
> > +{
> > +       struct clk_init_data init[CDCE6214_NUM_CLOCKS] = { 0 };
> > +       struct clk_parent_data pdata_out0[2] = {};
> > +       struct clk_parent_data pdata_out[4] = {};
> > +       struct clk_parent_data pdata_pll = {};
> > +       struct clk_parent_data pdata_psx = {};
> > +       int i, ret;
> > +
> > +       pdata_out0[0].fw_name = "priref";
> > +       pdata_out0[1].fw_name = "secref";
> > +
> > +       init[CDCE6214_CLK_OUT0].ops = &cdce6214_clk_out0_ops;
> > +       init[CDCE6214_CLK_OUT0].num_parents = 2;
> > +       init[CDCE6214_CLK_OUT0].parent_data = pdata_out0;
> > +       init[CDCE6214_CLK_OUT0].flags = CLK_SET_RATE_NO_REPARENT;
> > +
> > +       pdata_out[0].hw = &priv->clk[CDCE6214_CLK_PSA].hw;
> > +       pdata_out[1].hw = &priv->clk[CDCE6214_CLK_PSB].hw;
> > +       pdata_out[3].hw = &priv->clk[CDCE6214_CLK_OUT0].hw;
> > +
> > +       for (i = CDCE6214_CLK_OUT1; i <= CDCE6214_CLK_OUT4; i++) {
> > +               init[i].ops = &cdce6214_clk_out_ops;
> > +               init[i].num_parents = 4;
> 
> Please use ARRAY_SIZE(pdata_out) so we don't worry that the static
> assignment above gets changed without this changing too.

Ok.

> 
> > +               init[i].parent_data = pdata_out;
> > +               init[i].flags = CLK_SET_RATE_NO_REPARENT;
> > +       }
> > +
> > +       init[CDCE6214_CLK_PLL].ops = &cdce6214_clk_pll_ops;
> > +       init[CDCE6214_CLK_PLL].num_parents = 1;
> > +       pdata_pll.hw = &priv->clk[CDCE6214_CLK_OUT0].hw;
> > +       init[CDCE6214_CLK_PLL].parent_data = &pdata_pll;
> > +
> > +       pdata_psx.hw = &priv->clk[CDCE6214_CLK_PLL].hw;
> > +       for (i = CDCE6214_CLK_PSA; i <= CDCE6214_CLK_PSB; i++) {
> > +               init[i].ops = &cdce6214_clk_psx_ops;
> > +               init[i].num_parents = 1;
> 
> Same sort of comment.

I don't understand this comment here. num_parents is 1, there is no
array. Did you mean to comment on the place further up where num_parents
is set to 2 instead?

> 
> > +               init[i].parent_data = &pdata_psx;
> > +       }
> > +
> > +       for (i = 0; i < CDCE6214_NUM_CLOCKS; i++) {
> > +               struct cdce6214_clock *clk = &priv->clk[i];
> > +               char name[128];
> > +
> > +               if (!init[i].ops)
> > +                       continue;
> > +
> > +               snprintf(name, sizeof(name), "%s_%s", dev_name(priv->dev), clk_names[i]);
> > +               init[i].name = name;
> > +               clk->hw.init = &init[i];
> > +               clk->priv = priv;
> > +               clk->index = i;
> > +               ret = devm_clk_hw_register(priv->dev, &clk->hw);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void cdce6214_setup_xtal(struct cdce6214 *priv, struct device_node *np)
> > +{
> > +       unsigned short ip_xo_cload[] = {
> 
> const?

Yes.

> 
> > +               /* index is the register value */
> > +               3000, 3200, 3400, 3600, 3800, 4000, 4200, 4400,
> > +               4600, 4800, 5000, 5200, 5400, 5600, 5800, 6000,
> > +               6200, 6400, 6500, 6700, 6900, 7100, 7300, 7500,
> > +               7700, 7900, 8100, 8300, 8500, 8700, 8900, 9000
> > +       };
> > +
> > +       unsigned short ip_bias_sel_xo[] = {
> 
> const?

Yes.

> > +static int cdce6214_get_clkout_fmt(struct cdce6214 *priv, struct device_node *np)
> > +{
> > +       const char *fmt;
> > +       int ret;
> > +
> > +       ret = of_property_read_string(np, "ti,clkout-fmt", &fmt);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return match_string(clkkout_fmt_names, ARRAY_SIZE(clkkout_fmt_names), fmt);
> 
> We have a helper for this sort of thing.
> device_property_match_property_string()? Likely you can get rid of these
> helpers and inline the call to that function instead.

device_property_match_property_string() uses dev->of_node, but we have a
subnode of that node here.

> > +static int cdce6214_parse_subnode(struct cdce6214 *priv, struct device_node *np)
> > +{
> > +       struct regmap *reg = priv->regmap;
> > +       unsigned int idx, val;
> > +       int fmt;
> > +       int ret;
> > +
> > +       ret = of_property_read_u32(np, "reg", &idx);
> > +       if (ret) {
> > +               dev_err(priv->dev, "missing reg property in child: %s\n",
> > +                       np->full_name);
> > +               return ret;
> > +       }
> 
> I don't like this binding design. It is too much one node per clk style,
> which we don't want.

Note the subnodes are merely used for configuring the in/outputs, not
for referring to as a clock. Maybe I should have named them input/output
instead of clk.

> Assuming these clkout formats are configuring
> things, can we have that be an array of strings indexed based on the
> DT specifier for the provider, similar to assigned-clocks? Then we don't
> need a node for each configuration.

We have two inputs and four outputs with a different set of properties.

With your suggestion we would get something like this:

	ti,clkin-fmt = "lvcmos", "xtal"; /* two inputs */

	ti,xo-cload-femtofarads = <4500>; /* XO, only on PRIREF, no array */
	ti,xo-bias-current-microamp = <1758>; /* XO, only on PRIREF, no array */

	ti,clkout-fmt = "cmos", "lvds", "cmos", "cmos"; /* four outputs */
	ti,cmosn-mode = "low", "disabled", "disabled", "disabled";
	ti,cmosp-mode = "high", "disabled", "disabled", "disabled";

Would that be Ok?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
