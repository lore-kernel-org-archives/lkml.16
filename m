Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57613242D69;
	Tue, 27 May 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335618; cv=none; b=U3xHytWdRJ3n1EjzXwPosf0SYWQ+Q/CbQBV5gjvG7crjLQPLlzXModIW9Zg+73kTsYrwGP7TNpa49khYmmzOJdh0/h5AgP2md0sLfC+Q9nFfVEta96t7faKDoNwDBm8sVvo/F+OJiI+LFLhT1zzkNQIxmLTAG3L4hyJvEcyHXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335618; c=relaxed/simple;
	bh=YOGK1VmvbqAqWyUgyv7t5StT15fjnicbsSQZQ/DjEnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeYgVRl4vk3SaW7VeKA2j+/h0fWFRUxdyXcIuNynhn4pilOjg2nSnbe+QtSzTj8iy5HctumhO8qKkncl2v8ZYRqBWps9skYbzbneazWQi0622YjeZ4X5xNxtE7WNBASHsJtS4FGwuZgRArLCMC02JCSUI2rMGjS2HbRDUH430Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LezB19kx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LezB19kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FECC4CEE9;
	Tue, 27 May 2025 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748335617;
	bh=YOGK1VmvbqAqWyUgyv7t5StT15fjnicbsSQZQ/DjEnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LezB19kxUYfug+WyMrY/E70eavFNjV08U5WB0wM17SQ+XYcD+GOCtkmx+gIdaSOE9
	 WUfBXJKp+zEJjjmG2TEhyzQtfU7EWPeHYe3xUroA77xZUjDFPbGvvUYIBtw/L0e2cP
	 J2LgCE8AY02F/RSvq2TcFbHz5hE42141EUEt8J8rKEFXaOuqzxpxHl+feTt3JF4LTA
	 4iYceX95wI1SyxTAFJBnmU+fWhSkgjUDJ2SlBCkVyr27PLafUxLtG91da79TIJf4OK
	 tD0rgsdkHIz16ShXvMc6QOdKWiM8+iuMZpR69XvpF1TIW9mmHz/VcRJfZ4JIrhjire
	 tD/odwPl9iqSA==
Date: Tue, 27 May 2025 09:46:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 8/9] clk: divider, gate: create regmap-backed
 copies of gate and divider clocks
Message-ID: <20250527-decimeter-ferment-c9b82914a463@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-dandelion-canola-c10f5934434b@spud>
 <20250501-deafening-obtain-ab689094972d@wendy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xM3vR9gf+YHhvQz"
Content-Disposition: inline
In-Reply-To: <20250501-deafening-obtain-ab689094972d@wendy>


--5xM3vR9gf+YHhvQz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen,
On Thu, May 01, 2025 at 09:51:48AM +0100, Conor Dooley wrote:
> On Fri, Mar 21, 2025 at 05:22:41PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Implement regmap-backed copies of gate and divider clocks by replacing
> > the iomem pointer to the clock registers with a regmap and offset
> > within.
>=20
> Is this the sort of implementation you were looking for in your comments
> on the previous version of this series?
> (https://lore.kernel.org/linux-clk/20250220-iciness-mobilize-94a027ff52ce=
@spud/)

Any chance of taking a look at this approach and letting me know if it
is what you wanted me to do?

Thanks,
Conor.

> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/clk/Kconfig              |   8 +
> >  drivers/clk/Makefile             |   2 +
> >  drivers/clk/clk-divider-regmap.c | 270 +++++++++++++++++++++++++++++++
> >  drivers/clk/clk-gate-regmap.c    | 253 +++++++++++++++++++++++++++++
> >  drivers/clk/clk-gate.c           |   5 +-
> >  include/linux/clk-provider.h     | 120 ++++++++++++++
> >  6 files changed, 656 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/clk/clk-divider-regmap.c
> >  create mode 100644 drivers/clk/clk-gate-regmap.c
> >=20
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..c700b6ef4f34 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -33,6 +33,14 @@ menuconfig COMMON_CLK
> > =20
> >  if COMMON_CLK
> > =20
> > +config COMMON_CLK_DIVIDER_REGMAP
> > +	bool
> > +	select REGMAP
> > +
> > +config COMMON_CLK_GATE_REGMAP
> > +	bool
> > +	select REGMAP
> > +
> >  config COMMON_CLK_WM831X
> >  	tristate "Clock driver for WM831x/2x PMICs"
> >  	depends on MFD_WM831X
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..c57f72af5db9 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -20,11 +20,13 @@ clk-test-y			:=3D clk_test.o \
> >  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
> >  				   kunit_clk_parent_data_test.dtbo.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-divider.o
> > +obj-$(CONFIG_COMMON_CLK_DIVIDER_REGMAP)	+=3D clk-divider-regmap.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-fixed-factor.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-fixed-rate.o
> >  obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+=3D clk-fixed-rate-test.o
> >  clk-fixed-rate-test-y		:=3D clk-fixed-rate_test.o kunit_clk_fixed_rate=
_test.dtbo.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-gate.o
> > +obj-$(CONFIG_COMMON_CLK_GATE_REGMAP)	+=3D clk-gate-regmap.o
> >  obj-$(CONFIG_CLK_GATE_KUNIT_TEST) +=3D clk-gate_test.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-multiplier.o
> >  obj-$(CONFIG_COMMON_CLK)	+=3D clk-mux.o
> > diff --git a/drivers/clk/clk-divider-regmap.c b/drivers/clk/clk-divider=
-regmap.c
> > new file mode 100644
> > index 000000000000..2906130a2b47
> > --- /dev/null
> > +++ b/drivers/clk/clk-divider-regmap.c
> > @@ -0,0 +1,270 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/slab.h>
> > +
> > +static inline u32 clk_div_regmap_readl(struct clk_divider_regmap *divi=
der)
> > +{
> > +	u32 val;
> > +
> > +	regmap_read(divider->regmap, divider->map_offset, &val);
> > +
> > +	return val;
> > +}
> > +
> > +static inline void clk_div_regmap_writel(struct clk_divider_regmap *di=
vider, u32 val)
> > +{
> > +	regmap_write(divider->regmap, divider->map_offset, val);
> > +
> > +}
> > +
> > +static unsigned long clk_divider_regmap_recalc_rate(struct clk_hw *hw,
> > +		unsigned long parent_rate)
> > +{
> > +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> > +	unsigned int val;
> > +
> > +	val =3D clk_div_regmap_readl(divider) >> divider->shift;
> > +	val &=3D clk_div_mask(divider->width);
> > +
> > +	return divider_recalc_rate(hw, parent_rate, val, divider->table,
> > +				   divider->flags, divider->width);
> > +}
> > +
> > +static long clk_divider_regmap_round_rate(struct clk_hw *hw, unsigned =
long rate,
> > +				unsigned long *prate)
> > +{
> > +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> > +
> > +	/* if read only, just return current value */
> > +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> > +		u32 val;
> > +
> > +		val =3D clk_div_regmap_readl(divider) >> divider->shift;
> > +		val &=3D clk_div_mask(divider->width);
> > +
> > +		return divider_ro_round_rate(hw, rate, prate, divider->table,
> > +					     divider->width, divider->flags,
> > +					     val);
> > +	}
> > +
> > +	return divider_round_rate(hw, rate, prate, divider->table,
> > +				  divider->width, divider->flags);
> > +}
> > +
> > +static int clk_divider_regmap_determine_rate(struct clk_hw *hw,
> > +				      struct clk_rate_request *req)
> > +{
> > +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> > +
> > +	/* if read only, just return current value */
> > +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> > +		u32 val;
> > +
> > +		val =3D clk_div_regmap_readl(divider) >> divider->shift;
> > +		val &=3D clk_div_mask(divider->width);
> > +
> > +		return divider_ro_determine_rate(hw, req, divider->table,
> > +						 divider->width,
> > +						 divider->flags, val);
> > +	}
> > +
> > +	return divider_determine_rate(hw, req, divider->table, divider->width,
> > +				      divider->flags);
> > +}
> > +
> > +static int clk_divider_regmap_set_rate(struct clk_hw *hw, unsigned lon=
g rate,
> > +				unsigned long parent_rate)
> > +{
> > +	struct clk_divider_regmap *divider =3D to_clk_divider_regmap(hw);
> > +	int value;
> > +	unsigned long flags =3D 0;
> > +	u32 val;
> > +
> > +	value =3D divider_get_val(rate, parent_rate, divider->table,
> > +				divider->width, divider->flags);
> > +	if (value < 0)
> > +		return value;
> > +
> > +	if (divider->lock)
> > +		spin_lock_irqsave(divider->lock, flags);
> > +	else
> > +		__acquire(divider->lock);
> > +
> > +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> > +		val =3D clk_div_mask(divider->width) << (divider->shift + 16);
> > +	} else {
> > +		val =3D clk_div_regmap_readl(divider);
> > +		val &=3D ~(clk_div_mask(divider->width) << divider->shift);
> > +	}
> > +	val |=3D (u32)value << divider->shift;
> > +	clk_div_regmap_writel(divider, val);
> > +
> > +	if (divider->lock)
> > +		spin_unlock_irqrestore(divider->lock, flags);
> > +	else
> > +		__release(divider->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +const struct clk_ops clk_divider_regmap_ops =3D {
> > +	.recalc_rate =3D clk_divider_regmap_recalc_rate,
> > +	.round_rate =3D clk_divider_regmap_round_rate,
> > +	.determine_rate =3D clk_divider_regmap_determine_rate,
> > +	.set_rate =3D clk_divider_regmap_set_rate,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_divider_regmap_ops);
> > +
> > +const struct clk_ops clk_divider_regmap_ro_ops =3D {
> > +	.recalc_rate =3D clk_divider_regmap_recalc_rate,
> > +	.round_rate =3D clk_divider_regmap_round_rate,
> > +	.determine_rate =3D clk_divider_regmap_determine_rate,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_divider_regmap_ro_ops);
> > +
> > +struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock)
> > +{
> > +	struct clk_divider_regmap *div;
> > +	struct clk_hw *hw;
> > +	struct clk_init_data init =3D {};
> > +	int ret;
> > +
> > +	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
> > +		if (width + shift > 16) {
> > +			pr_warn("divider value exceeds LOWORD field\n");
> > +			return ERR_PTR(-EINVAL);
> > +		}
> > +	}
> > +
> > +	/* allocate the divider */
> > +	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> > +	if (!div)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init.name =3D name;
> > +	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
> > +		init.ops =3D &clk_divider_regmap_ro_ops;
> > +	else
> > +		init.ops =3D &clk_divider_regmap_ops;
> > +	init.flags =3D flags;
> > +	init.parent_names =3D parent_name ? &parent_name : NULL;
> > +	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
> > +	init.parent_data =3D parent_data;
> > +	if (parent_name || parent_hw || parent_data)
> > +		init.num_parents =3D 1;
> > +	else
> > +		init.num_parents =3D 0;
> > +
> > +	/* struct clk_divider assignments */
> > +	div->regmap =3D regmap;
> > +	div->map_offset =3D map_offset;
> > +	div->shift =3D shift;
> > +	div->width =3D width;
> > +	div->flags =3D clk_divider_flags;
> > +	div->lock =3D lock;
> > +	div->hw.init =3D &init;
> > +	div->table =3D table;
> > +
> > +	/* register the clock */
> > +	hw =3D &div->hw;
> > +	ret =3D clk_hw_register(dev, hw);
> > +	if (ret) {
> > +		kfree(div);
> > +		hw =3D ERR_PTR(ret);
> > +	}
> > +
> > +	return hw;
> > +}
> > +EXPORT_SYMBOL_GPL(__clk_hw_register_divider_regmap);
> > +
> > +struct clk *clk_register_divider_regmap_table(struct device *dev, cons=
t char *name,
> > +		const char *parent_name, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock)
> > +{
> > +	struct clk_hw *hw;
> > +
> > +	hw =3D  __clk_hw_register_divider_regmap(dev, NULL, name, parent_name=
, NULL,
> > +					       NULL, flags, regmap, map_offset,
> > +					       shift, width, clk_divider_flags,
> > +					       table, lock);
> > +	if (IS_ERR(hw))
> > +		return ERR_CAST(hw);
> > +	return hw->clk;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_register_divider_regmap_table);
> > +
> > +void clk_unregister_divider_regmap(struct clk *clk)
> > +{
> > +	struct clk_divider_regmap *div;
> > +	struct clk_hw *hw;
> > +
> > +	hw =3D __clk_get_hw(clk);
> > +	if (!hw)
> > +		return;
> > +
> > +	div =3D to_clk_divider_regmap(hw);
> > +
> > +	clk_unregister(clk);
> > +	kfree(div);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_unregister_divider_regmap);
> > +
> > +/**
> > + * clk_hw_unregister_divider_regmap - unregister a clk divider
> > + * @hw: hardware-specific clock data to unregister
> > + */
> > +void clk_hw_unregister_divider_regmap(struct clk_hw *hw)
> > +{
> > +	struct clk_divider_regmap *div;
> > +
> > +	div =3D to_clk_divider_regmap(hw);
> > +
> > +	clk_hw_unregister(hw);
> > +	kfree(div);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_unregister_divider_regmap);
> > +
> > +static void devm_clk_hw_release_divider_regmap(struct device *dev, voi=
d *res)
> > +{
> > +	clk_hw_unregister_divider_regmap(*(struct clk_hw **)res);
> > +}
> > +
> > +struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *de=
v,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock)
> > +{
> > +	struct clk_hw **ptr, *hw;
> > +
> > +	ptr =3D devres_alloc(devm_clk_hw_release_divider_regmap, sizeof(*ptr)=
, GFP_KERNEL);
> > +	if (!ptr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	hw =3D __clk_hw_register_divider_regmap(dev, np, name, parent_name, p=
arent_hw,
> > +					      parent_data, flags, regmap, map_offset,
> > +					      shift, width, clk_divider_flags, table,
> > +					      lock);
> > +
> > +	if (!IS_ERR(hw)) {
> > +		*ptr =3D hw;
> > +		devres_add(dev, ptr);
> > +	} else {
> > +		devres_free(ptr);
> > +	}
> > +
> > +	return hw;
> > +}
> > +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_divider_regmap);
> > diff --git a/drivers/clk/clk-gate-regmap.c b/drivers/clk/clk-gate-regma=
p.c
> > new file mode 100644
> > index 000000000000..cf9e48407971
> > --- /dev/null
> > +++ b/drivers/clk/clk-gate-regmap.c
> > @@ -0,0 +1,253 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/io.h>
> > +#include <linux/err.h>
> > +#include <linux/string.h>
> > +
> > +/**
> > + * DOC: basic gatable clock which can gate and ungate its output
> > + *
> > + * Traits of this clock:
> > + * prepare - clk_(un)prepare only ensures parent is (un)prepared
> > + * enable - clk_enable and clk_disable are functional & control gating
> > + * rate - inherits rate from parent.  No clk_set_rate support
> > + * parent - fixed parent.  No clk_set_parent support
> > + */
> > +
> > +static inline u32 clk_gate_regmap_readl(struct clk_gate_regmap *gate)
> > +{
> > +	u32 val;
> > +
> > +	regmap_read(gate->map, gate->map_offset, &val);
> > +
> > +	return val;
> > +}
> > +
> > +static inline void clk_gate_regmap_writel(struct clk_gate_regmap *gate=
, u32 val)
> > +{
> > +	regmap_write(gate->map, gate->map_offset, val);
> > +
> > +}
> > +
> > +/*
> > + * It works on following logic:
> > + *
> > + * For enabling clock, enable =3D 1
> > + *	set2dis =3D 1	-> clear bit	-> set =3D 0
> > + *	set2dis =3D 0	-> set bit	-> set =3D 1
> > + *
> > + * For disabling clock, enable =3D 0
> > + *	set2dis =3D 1	-> set bit	-> set =3D 1
> > + *	set2dis =3D 0	-> clear bit	-> set =3D 0
> > + *
> > + * So, result is always: enable xor set2dis.
> > + */
> > +static void clk_gate_regmap_endisable(struct clk_hw *hw, int enable)
> > +{
> > +	struct clk_gate_regmap *gate =3D to_clk_gate_regmap(hw);
> > +	int set =3D gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> > +	unsigned long flags;
> > +	u32 reg;
> > +
> > +	set ^=3D enable;
> > +
> > +	if (gate->lock)
> > +		spin_lock_irqsave(gate->lock, flags);
> > +	else
> > +		__acquire(gate->lock);
> > +
> > +	if (gate->flags & CLK_GATE_HIWORD_MASK) {
> > +		reg =3D BIT(gate->bit_idx + 16);
> > +		if (set)
> > +			reg |=3D BIT(gate->bit_idx);
> > +	} else {
> > +		reg =3D clk_gate_regmap_readl(gate);
> > +
> > +		if (set)
> > +			reg |=3D BIT(gate->bit_idx);
> > +		else
> > +			reg &=3D ~BIT(gate->bit_idx);
> > +	}
> > +
> > +	clk_gate_regmap_writel(gate, reg);
> > +
> > +	if (gate->lock)
> > +		spin_unlock_irqrestore(gate->lock, flags);
> > +	else
> > +		__release(gate->lock);
> > +}
> > +
> > +static int clk_gate_regmap_enable(struct clk_hw *hw)
> > +{
> > +	clk_gate_regmap_endisable(hw, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static void clk_gate_regmap_disable(struct clk_hw *hw)
> > +{
> > +	clk_gate_regmap_endisable(hw, 0);
> > +}
> > +
> > +int clk_gate_regmap_is_enabled(struct clk_hw *hw)
> > +{
> > +	u32 reg;
> > +	struct clk_gate_regmap *gate =3D to_clk_gate_regmap(hw);
> > +
> > +	reg =3D clk_gate_regmap_readl(gate);
> > +
> > +	/* if a set bit disables this clk, flip it before masking */
> > +	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> > +		reg ^=3D BIT(gate->bit_idx);
> > +
> > +	reg &=3D BIT(gate->bit_idx);
> > +
> > +	return reg ? 1 : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_gate_regmap_is_enabled);
> > +
> > +const struct clk_ops clk_gate_regmap_ops =3D {
> > +	.enable =3D clk_gate_regmap_enable,
> > +	.disable =3D clk_gate_regmap_disable,
> > +	.is_enabled =3D clk_gate_regmap_is_enabled,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_gate_regmap_ops);
> > +
> > +struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data,
> > +		unsigned long flags,
> > +		struct regmap *map, u8 map_offset, u8 bit_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock)
> > +{
> > +	struct clk_gate_regmap *gate;
> > +	struct clk_hw *hw;
> > +	struct clk_init_data init =3D {};
> > +	int ret =3D -EINVAL;
> > +
> > +	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
> > +		if (bit_idx > 15) {
> > +			pr_err("gate bit exceeds LOWORD field\n");
> > +			return ERR_PTR(-EINVAL);
> > +		}
> > +	}
> > +
> > +	/* allocate the gate */
> > +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +	if (!gate)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init.name =3D name;
> > +	init.ops =3D &clk_gate_regmap_ops;
> > +	init.flags =3D flags;
> > +	init.parent_names =3D parent_name ? &parent_name : NULL;
> > +	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
> > +	init.parent_data =3D parent_data;
> > +	if (parent_name || parent_hw || parent_data)
> > +		init.num_parents =3D 1;
> > +	else
> > +		init.num_parents =3D 0;
> > +
> > +	/* struct clk_gate_regmap assignments */
> > +	gate->map =3D map;
> > +	gate->map_offset =3D map_offset;
> > +	gate->bit_idx =3D bit_idx;
> > +	gate->flags =3D clk_gate_flags;
> > +	gate->lock =3D lock;
> > +	gate->hw.init =3D &init;
> > +
> > +	hw =3D &gate->hw;
> > +	if (dev || !np)
> > +		ret =3D clk_hw_register(dev, hw);
> > +	else if (np)
> > +		ret =3D of_clk_hw_register(np, hw);
> > +	if (ret) {
> > +		kfree(gate);
> > +		hw =3D ERR_PTR(ret);
> > +	}
> > +
> > +	return hw;
> > +
> > +}
> > +EXPORT_SYMBOL_GPL(__clk_hw_register_gate_regmap);
> > +
> > +struct clk *clk_register_gate_regmap(struct device *dev, const char *n=
ame,
> > +		const char *parent_name, unsigned long flags, struct regmap *map,
> > +		u8 map_offset, u8 bit_idx, u8 clk_gate_flags, spinlock_t *lock)
> > +{
> > +	struct clk_hw *hw;
> > +
> > +	hw =3D __clk_hw_register_gate_regmap(dev, NULL, name, parent_name, NU=
LL,
> > +					   NULL, flags, map, map_offset, bit_idx,
> > +					   clk_gate_flags, lock);
> > +	if (IS_ERR(hw))
> > +		return ERR_CAST(hw);
> > +	return hw->clk;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_register_gate_regmap);
> > +
> > +void clk_unregister_gate_regmap(struct clk *clk)
> > +{
> > +	struct clk_gate_regmap *gate;
> > +	struct clk_hw *hw;
> > +
> > +	hw =3D __clk_get_hw(clk);
> > +	if (!hw)
> > +		return;
> > +
> > +	gate =3D to_clk_gate_regmap(hw);
> > +
> > +	clk_unregister(clk);
> > +	kfree(gate);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_unregister_gate_regmap);
> > +
> > +void clk_hw_unregister_gate_regmap(struct clk_hw *hw)
> > +{
> > +	struct clk_gate_regmap *gate;
> > +
> > +	gate =3D to_clk_gate_regmap(hw);
> > +
> > +	clk_hw_unregister(hw);
> > +	kfree(gate);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_unregister_gate_regmap);
> > +
> > +static void devm_clk_hw_release_gate_regmap(struct device *dev, void *=
res)
> > +{
> > +	clk_hw_unregister_gate_regmap(*(struct clk_hw **)res);
> > +}
> > +
> > +struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data,
> > +		unsigned long flags, struct regmap *map,
> > +		u8 map_offset, u8 bit_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock)
> > +{
> > +	struct clk_hw **ptr, *hw;
> > +
> > +	ptr =3D devres_alloc(devm_clk_hw_release_gate_regmap, sizeof(*ptr), G=
FP_KERNEL);
> > +	if (!ptr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	hw =3D __clk_hw_register_gate_regmap(dev, np, name, parent_name, pare=
nt_hw,
> > +					   parent_data, flags, map, map_offset,
> > +					   bit_idx, clk_gate_flags, lock);
> > +
> > +	if (!IS_ERR(hw)) {
> > +		*ptr =3D hw;
> > +		devres_add(dev, ptr);
> > +	} else {
> > +		devres_free(ptr);
> > +	}
> > +
> > +	return hw;
> > +}
> > +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_gate_regmap);
> > diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> > index 68e585a02fd9..1e3f21a249ca 100644
> > --- a/drivers/clk/clk-gate.c
> > +++ b/drivers/clk/clk-gate.c
> > @@ -34,10 +34,11 @@ static inline u32 clk_gate_readl(struct clk_gate *g=
ate)
> > =20
> >  static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
> >  {
> > -	if (gate->flags & CLK_GATE_BIG_ENDIAN)
> > +	if (gate->flags & CLK_GATE_BIG_ENDIAN) {
> >  		iowrite32be(val, gate->reg);
> > -	else
> > +	} else {
> >  		writel(val, gate->reg);
> > +	}
> >  }
> > =20
> >  /*
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index 2e6e603b7493..6f5cf6670b48 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -8,6 +8,7 @@
> > =20
> >  #include <linux/of.h>
> >  #include <linux/of_clk.h>
> > +#include <linux/regmap.h>
> > =20
> >  /*
> >   * flags used across common struct clk.  these flags should only affec=
t the
> > @@ -526,6 +527,7 @@ void of_fixed_clk_setup(struct device_node *np);
> >  struct clk_gate {
> >  	struct clk_hw hw;
> >  	void __iomem	*reg;
> > +	u8		map_offset;
> >  	u8		bit_idx;
> >  	u8		flags;
> >  	spinlock_t	*lock;
> > @@ -538,6 +540,37 @@ struct clk_gate {
> >  #define CLK_GATE_BIG_ENDIAN		BIT(2)
> > =20
> >  extern const struct clk_ops clk_gate_ops;
> > +
> > +#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
> > +/**
> > + * struct clk_gate_regmap - gating clock via regmap
> > + *
> > + * @hw:		handle between common and hardware-specific interfaces
> > + * @map:	regmap controlling gate
> > + * @map_offset:	register offset within the regmap controlling gate
> > + * @bit_idx:	single bit controlling gate
> > + * @flags:	hardware-specific flags
> > + * @lock:	register lock
> > + *
> > + * Clock which can gate its output.  Implements .enable & .disable
> > + *
> > + * Flags:
> > + * See clk_gate
> > + */
> > +struct clk_gate_regmap {
> > +	struct clk_hw hw;
> > +	struct regmap	*map;
> > +	u8		map_offset;
> > +	u8		bit_idx;
> > +	u8		flags;
> > +	spinlock_t	*lock;
> > +};
> > +
> > +#define to_clk_gate_regmap(_hw) container_of(_hw, struct clk_gate_regm=
ap, hw)
> > +
> > +extern const struct clk_ops clk_gate_regmap_ops;
> > +#endif
> > +
> >  struct clk_hw *__clk_hw_register_gate(struct device *dev,
> >  		struct device_node *np, const char *name,
> >  		const char *parent_name, const struct clk_hw *parent_hw,
> > @@ -663,6 +696,31 @@ void clk_unregister_gate(struct clk *clk);
> >  void clk_hw_unregister_gate(struct clk_hw *hw);
> >  int clk_gate_is_enabled(struct clk_hw *hw);
> > =20
> > +#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
> > +struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data,
> > +		unsigned long flags,
> > +		struct regmap *map, u8 map_offset, u8 bit_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock);
> > +struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data,
> > +		unsigned long flags,
> > +		struct regmap *map, u8 map_offset, u8 bit_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock);
> > +struct clk *clk_register_gate_regmap(struct device *dev, const char *n=
ame,
> > +		const char *parent_name, unsigned long flags,
> > +		struct regmap *map, u8 map_offset, u8 bit_idx,
> > +		u8 clk_gate_flags, spinlock_t *lock);
> > +
> > +void clk_unregister_gate_regmap(struct clk *clk);
> > +void clk_hw_unregister_gate_regmap(struct clk_hw *hw);
> > +int clk_gate_regmap_is_enabled(struct clk_hw *hw);
> > +#endif
> > +
> >  struct clk_div_table {
> >  	unsigned int	val;
> >  	unsigned int	div;
> > @@ -736,6 +794,41 @@ struct clk_divider {
> >  extern const struct clk_ops clk_divider_ops;
> >  extern const struct clk_ops clk_divider_ro_ops;
> > =20
> > +#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
> > +/**
> > + * struct clk_divider_regmap - adjustable divider clock via regmap
> > + *
> > + * @hw:		handle between common and hardware-specific interfaces
> > + * @map:	regmap containing the divider
> > + * @map_offset:	register offset within the regmap containing the divid=
er
> > + * @shift:	shift to the divider bit field
> > + * @width:	width of the divider bit field
> > + * @table:	array of value/divider pairs, last entry should have div =
=3D 0
> > + * @lock:	register lock
> > + *
> > + * Clock with an adjustable divider affecting its output frequency.  I=
mplements
> > + * .recalc_rate, .set_rate and .round_rate
> > + *
> > + * @flags:
> > + * See clk_divider
> > + */
> > +struct clk_divider_regmap {
> > +	struct clk_hw	hw;
> > +	struct regmap	*regmap;
> > +	u8		map_offset;
> > +	u8		shift;
> > +	u8		width;
> > +	u8		flags;
> > +	const struct clk_div_table	*table;
> > +	spinlock_t	*lock;
> > +};
> > +
> > +#define to_clk_divider_regmap(_hw) container_of(_hw, struct clk_divide=
r_regmap, hw)
> > +
> > +extern const struct clk_ops clk_divider_regmap_ops;
> > +extern const struct clk_ops clk_divider_regmap_ro_ops;
> > +#endif
> > +
> >  unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long par=
ent_rate,
> >  		unsigned int val, const struct clk_div_table *table,
> >  		unsigned long flags, unsigned long width);
> > @@ -972,6 +1065,33 @@ struct clk *clk_register_divider_table(struct dev=
ice *dev, const char *name,
> >  void clk_unregister_divider(struct clk *clk);
> >  void clk_hw_unregister_divider(struct clk_hw *hw);
> > =20
> > +#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
> > +struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock);
> > +
> > +struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *de=
v,
> > +		struct device_node *np, const char *name,
> > +		const char *parent_name, const struct clk_hw *parent_hw,
> > +		const struct clk_parent_data *parent_data, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock);
> > +
> > +struct clk *clk_register_divider_regmap_table(struct device *dev,
> > +		const char *name, const char *parent_name, unsigned long flags,
> > +		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
> > +		u8 clk_divider_flags, const struct clk_div_table *table,
> > +		spinlock_t *lock);
> > +
> > +void clk_unregister_divider_regmap(struct clk *clk);
> > +void clk_hw_unregister_divider_regmap(struct clk_hw *hw);
> > +#endif
> > +
> >  /**
> >   * struct clk_mux - multiplexer clock
> >   *
> > --=20
> > 2.45.2
> >=20



--5xM3vR9gf+YHhvQz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDV7/AAKCRB4tDGHoIJi
0m+3AQDj+GhrsI3UL5rK3r9p0tcjq1YVuVd44hkOroQfiKgwfQEAuiEW2pa81Ety
4nsnXZ+5SPq5Of0dY57hsXO3uqNbbwo=
=E8Gp
-----END PGP SIGNATURE-----

--5xM3vR9gf+YHhvQz--
