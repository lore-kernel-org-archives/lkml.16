Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752A15A86B;
	Wed, 25 Jun 2025 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839715; cv=none; b=OG2uA2QvOpnzgcXVvQ9b+e9GTFBbNpKBmnUj+NHFTOx8A1HwvqxxVZ1VEx8Kkd5ZOS29uEJfHWTERKtEhZQpmu0ZwA7vg1/S/GqTckqhYtJ+VvyT74sqQB+WTUhnqJFgHj5l5V1ze8TF8rqFERebdkLewE4FI7pxIWErbbSFTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839715; c=relaxed/simple;
	bh=EWmpGBQr93VwGYphPN1mqtDgtD2Nh9NaQj6utWcWPlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZzf2pYN2u2hYxqpvBFAKtWdcmhD/OcpNXGI5ydN7Vs8ORThYIVRWPYrCYGPzP27Nn6/v1LqrCsHNT0xZ9YTID9mo+qaSym1SVEK8ekdLwTM10Y/M4A1Mew8Wbx72KkPmN8ccp6EdZhla90br86PkNzZPG5vNvgT5u1w89hE7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNtVW0Pc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNtVW0Pc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A48CC4CEEA;
	Wed, 25 Jun 2025 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750839715;
	bh=EWmpGBQr93VwGYphPN1mqtDgtD2Nh9NaQj6utWcWPlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNtVW0PciOraX7px3gUf6NBKLnvSlyvsSJ6TLRHWjUzX0iwSm3iR/M3Pr9jiHZWvh
	 GmOrxW8fPt5ABhZrSrlOmgnBtOUelqqTxqXsxTTyq8bg+mtSiI0CpvFEytlQsIGc7j
	 nsBIz8QjD+9r9Q8v8TbuHkWQgfCDFifE9+veARSvsKk2BkGFdHG/CmIbYH2+T00qKX
	 g3RfNFfjUbVV/oWFJyAGxl4ybPu5hIv7t/gAxapfhBnEmSjf0kQ3Gb4aoKBxvGnArX
	 Uy1qRxAKjVy5TQ582NauhE5PA+vSz5xwXsWIfnVcBHAvYSxibp0pac6B4nuN/cm7Hh
	 QursECtoS8m7Q==
Date: Wed, 25 Jun 2025 09:21:49 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250625082149.GO795775@google.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
 <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>

On Fri, 20 Jun 2025, Alex Elder wrote:

> On 6/19/25 9:40 AM, Lee Jones wrote:
> > On Fri, 13 Jun 2025, Alex Elder wrote:
> > 
> > > Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
> > > but the driver is structured to allow support for others to be added.
> > > 
> > > The P1 PMIC is controlled by I2C, and is normally implemented with the
> > > SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> > 
> > six or 12.  Please pick a format and remain consistent.
> 
> "Numbers smaller than ten should be spelled out."

Never heard of that before Googling it.  Formal writing is odd. :)

> But I'll use 6 and 12.
> 
> > > regulators.  It also implements a switch, watchdog timer, real-time clock,
> > > and more, but initially we will only support its regulators.
> > 
> > You have to provide support for more than one device for this to be
> > accepted into MFD.
> 
> OK.  I'm looking at the other device functions to see if I
> can pick the easiest one.
> 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/mfd/Kconfig         | 11 +++++
> > >   drivers/mfd/Makefile        |  1 +
> > >   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 103 insertions(+)
> > >   create mode 100644 drivers/mfd/spacemit-pmic.c
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 6fb3768e3d71c..c59ae6cc2dd8d 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
> > >   	  Say M here if you want to include support for the Qualcomm RPM as a
> > >   	  module. This will build a module called "qcom_rpm".
> > > +config MFD_SPACEMIT_PMIC
> > > +	tristate "SpacemiT PMIC"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	depends on I2C && OF
> > > +	select MFD_CORE
> > > +	select REGMAP_I2C
> > > +	default ARCH_SPACEMIT
> > > +	help
> > > +	  This option enables support for SpacemiT I2C based PMICs.  At
> > > +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
> > > +
> > >   config MFD_SPMI_PMIC
> > >   	tristate "Qualcomm SPMI PMICs"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 79495f9f3457b..59d1ec8db3a3f 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
> > >   obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
> > >   obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
> > >   obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> > > +obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
> > >   obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
> > >   obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
> > >   obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
> > > diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
> > > new file mode 100644
> > > index 0000000000000..7c3c3e27236da
> > > --- /dev/null
> > > +++ b/drivers/mfd/spacemit-pmic.c
> > > @@ -0,0 +1,91 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
> > > + * Derived from code from:
> > > + *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct spacemit_pmic_data {
> > 
> > s/data/ddata/
> 
> I hadn't noticed that convention.  I'll use it.
> 
> > > +	const struct regmap_config *regmap_config;
> > > +	const struct mfd_cell *mfd_cells;	/* array */
> > 
> > Hmm ... this is a red flag.  Let's see.
> > 
> > > +	size_t mfd_cell_count;
> > > +};
> > > +
> > > +static const struct regmap_config p1_regmap_config = {
> > > +	.reg_bits	= 8,
> > > +	.val_bits	= 8,
> > > +	.max_register	= 0xaa,
> > > +};
> > > +
> > > +/* The name field defines the *driver* name that should bind to the device */
> > 
> > This comment is superfluous.
> 
> I'll delete it.
> 
> I was expecting the driver to recognize the device, not
> the device specifying what driver to use, but I guess
> I'm used to the DT model.

Even in DT, the *driver* compatible is specified.

  .driver.of_match_table->compatible

> > > +static const struct mfd_cell p1_cells[] = {
> > > +	{
> > > +		.name		= "spacemit-p1-regulator",
> > 
> > This spacing is wonky.  Take a look at all the other drivers here.
> > 
> > Also, you probably want to use MFD_CELL_NAME().
> 
> Yes, I see that does what I want.
> 
> > One is not enough.
> > 
> > > +	},
> > > +};
> > > +
> > > +static const struct spacemit_pmic_data p1_pmic_data = {
> > > +	.regmap_config	= &p1_regmap_config,
> > > +	.mfd_cells	= p1_cells,
> > > +	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
> > > +};
> > > +
> > > +static int spacemit_pmic_probe(struct i2c_client *client)
> > > +{
> > > +	const struct spacemit_pmic_data *data;
> > > +	struct device *dev = &client->dev;
> > > +	struct regmap *regmap;
> > > +
> > > +	/* We currently have no need for a device-specific structure */
> > 
> > Then why are we adding one?
> 
> I don't understand, but it might be moot once I add support
> for another (sub)device.

There are 2 rules in play here:

  - Only add what you need, when you need it
  - MFDs must contain more than 1 device

... and you're right.  The second rule moots the first here.

> > > +	data = of_device_get_match_data(dev);
> > > +	regmap = devm_regmap_init_i2c(client, data->regmap_config);
> > > +	if (IS_ERR(regmap))
> > > +		return dev_err_probe(dev, PTR_ERR(regmap),
> > > +				     "regmap initialization failed");
> > > +
> > > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> > > +				    data->mfd_cells, data->mfd_cell_count,
> > > +				    NULL, 0, NULL);
> > > +}
> > > +
> > > +static const struct of_device_id spacemit_pmic_match[] = {
> > > +	{
> > > +		.compatible	= "spacemit,p1",
> > > +		.data		= &p1_pmic_data,
> > 
> > Ah, now I see.
> > 
> > We do not allow one data from registration mechanism (MFD) to be piped
> > through another (OF).  If you have to match platform data to device (you
> > don't), then pass through identifiers and match on those in a switch()
> > statement instead.
> 
> I haven't done an MFD driver before and it took some time
> to get this working.  I'll tell you what led me to it.
> 
> I used code posted by Troy Mitchell (plus downstream) as a
> starting point.
>   https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/
> 
> Krzysztof Kozlowski made this comment on Troy's DT binding:
>   Drop compatible, regulators are not re-usable blocks.
> 
> So my goal was to have the PMIC regulators get bound to a
> driver without specifying a DT compatible string, and I
> found this worked.
> 
> You say I don't need to match platform data to device, but
> if I did I would pass through identifiers.  Can you refer
> me to an example of code that correctly does what I should
> be doing instead?

git grep -A5 compatible -- drivers/mfd | grep -E "\.data = .*[A-Z]+"

Those identifiers are usually matched in a swtich() statement.

> One other comment/question:
>   This driver is structured as if it could support a different
>   PMIC (in addition to P1).  Should I *not* do that, and simply
>   make a source file hard-coded for this one PMIC?

This comes back to the "add only what you need, when you need it" rule.

> > > +	},
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
> > > +
> > > +static struct i2c_driver spacemit_pmic_i2c_driver = {
> > > +	.driver = {
> > > +		.name = "spacemit-pmic",
> > > +		.of_match_table = spacemit_pmic_match,
> > > +	},
> > > +	.probe    = spacemit_pmic_probe,
> > 
> > Remove these odd tabs please.
> 
> OK.
> 
> > > +};
> > > +
> > > +static int __init spacemit_pmic_init(void)
> > > +{
> > > +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
> > > +}
> > > +
> > > +static void __exit spacemit_pmic_exit(void)
> > > +{
> > > +	i2c_del_driver(&spacemit_pmic_i2c_driver);
> > > +}
> > > +
> > 
> > Remove this line.
> 
> Sure.
> 
> > > +module_init(spacemit_pmic_init);
> > > +module_exit(spacemit_pmic_exit);
> > 
> > Are you sure there isn't some boiler plate to do all of this?
> > 
> > Ah ha:
> > 
> >    module_i2c_driver()
> 
> Thanks for Googling that for me.  And thank you very much
> for the review.

`git grep` is my bestie! =:-)

-- 
Lee Jones [李琼斯]
