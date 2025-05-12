Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DBF1B3956;
	Mon, 12 May 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058081; cv=none; b=qfqLBr+VDu9MDu4rdnPndajZhkTF33zbU2e0c4SBfJZaZRD4FQqjZdxNjf4vqMZpOauBxA9Jr8o9zX/ivCWuhSbN9WjMXMV9PgpTo/WvSWyPnRqrdqt6BPvW6jqC58Nxua3uLotf2djlxjynlt7Sh8bezEhMUg2lW56NMryMT+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058081; c=relaxed/simple;
	bh=uWFgPnEf6SnCZ4dyfllxv7eJLNeqfcKdcos2J8D+o50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFswU7/HaaGNTIMX9hRnc3EU/RnE5YOWl/9Evw1wIrp8qHP0f+hXsEhLs2wceoZ8B1pa4OCEXjxZKF/GYHzWCIFAyl2v20Z8Ffibjk7S1yRQlSYkfOkJusFLPE6M1UalpVrP2IvMUgTkR8PlJkmcm5mldf34EsiEGEcunkIkxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 79D9F3434F9;
	Mon, 12 May 2025 13:54:38 +0000 (UTC)
Date: Mon, 12 May 2025 13:54:29 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <20250512135429-GYA517867@gentoo>
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509112032.2980811-4-elder@riscstar.com>

On 06:20 Fri 09 May     , Alex Elder wrote:
> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
> non-null, the CCU implements a reset controller, and the name will be
> used in the name for the auxiliary device that implements it.
> 
> Define a new type to hold an auxiliary device as well as the regmap
> pointer that will be needed by CCU reset controllers.  Set up code to
> initialize and add an auxiliary device for any CCU that implements reset
> functionality.
> 
> Make it optional for a CCU to implement a clock controller.  This
> doesn't apply to any of the existing CCUs but will for some new ones
> that will be added soon.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v8: Allocate the auxiliary device using kzalloc(), not devm_kzalloc()
> 
>  drivers/clk/spacemit/Kconfig     |  1 +
>  drivers/clk/spacemit/ccu-k1.c    | 90 ++++++++++++++++++++++++++++----
>  include/soc/spacemit/k1-syscon.h | 12 +++++
>  3 files changed, 93 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> index 4c4df845b3cb2..3854f6ae6d0ea 100644
> --- a/drivers/clk/spacemit/Kconfig
> +++ b/drivers/clk/spacemit/Kconfig
> @@ -3,6 +3,7 @@
>  config SPACEMIT_CCU
>  	tristate "Clock support for SpacemiT SoCs"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select AUXILIARY_BUS
>  	select MFD_SYSCON
>  	help
>  	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 801150f4ff0f5..551df9d076859 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -5,12 +5,14 @@
>   */
>  
>  #include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <soc/spacemit/k1-syscon.h>
>  
>  #include "ccu_common.h"
> @@ -21,6 +23,7 @@
>  #include <dt-bindings/clock/spacemit,k1-syscon.h>
>  
>  struct spacemit_ccu_data {
> +	const char *reset_name;
see my comment below..

>  	struct clk_hw **hws;
>  	size_t num;
>  };
> @@ -710,8 +713,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_pll_data = {
> -	.hws	= k1_ccu_pll_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
> +	/* The PLL CCU implements no resets */
> +	.hws		= k1_ccu_pll_hws,
> +	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_mpmu_hws[] = {
> @@ -751,8 +755,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.hws	= k1_ccu_mpmu_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
> +	.reset_name	= "mpmu-reset",
> +	.hws		= k1_ccu_mpmu_hws,
> +	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_apbc_hws[] = {
> @@ -859,8 +864,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.hws	= k1_ccu_apbc_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
> +	.reset_name	= "apbc-reset",
> +	.hws		= k1_ccu_apbc_hws,
> +	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_apmu_hws[] = {
> @@ -929,8 +935,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.hws	= k1_ccu_apmu_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
> +	.reset_name	= "apmu-reset",
> +	.hws		= k1_ccu_apmu_hws,
> +	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
>  
>  static int spacemit_ccu_register(struct device *dev,
> @@ -941,6 +948,10 @@ static int spacemit_ccu_register(struct device *dev,
>  	struct clk_hw_onecell_data *clk_data;
>  	int i, ret;
>  
> +	/* Nothing to do if the CCU does not implement any clocks */
> +	if (!data->hws)
> +		return 0;
> +
>  	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
>  				GFP_KERNEL);
>  	if (!clk_data)
> @@ -981,9 +992,63 @@ static int spacemit_ccu_register(struct device *dev,
>  	return ret;
>  }
>  
> +static void spacemit_cadev_release(struct device *dev)
why this function define as _cadev_ prefix, while below as _adev_
is it a typo? or c short for ccu, I just feel it isn't consistent..

> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	kfree(to_spacemit_ccu_adev(adev));
> +}
> +
> +static void spacemit_adev_unregister(void *data)
> +{
> +	struct auxiliary_device *adev = data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int spacemit_ccu_reset_register(struct device *dev,
> +				       struct regmap *regmap,
> +				       const char *reset_name)
> +{
> +	struct spacemit_ccu_adev *cadev;
> +	struct auxiliary_device *adev;
> +	static u32 next_id;
> +	int ret;
> +
> +	/* Nothing to do if the CCU does not implement a reset controller */
> +	if (!reset_name)
> +		return 0;
> +
> +	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> +	if (!cadev)
> +		return -ENOMEM;
add one blank line here?

> +	cadev->regmap = regmap;
> +
> +	adev = &cadev->adev;
> +	adev->name = reset_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = spacemit_cadev_release;
> +	adev->dev.of_node = dev->of_node;
[..]
> +	adev->id = next_id++;
so I'd assume the underlying device doesn't really care the id?
but with different order of registration, it will result random id for the device

how about define a reset struct, and group reset_name and next_id together,
then we can intialize them with fixed value
(this will also let us dropping 'static next_id' variable)

with this change, it's more easy to extend in the future (a weak reason)..

> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> +}
> +
>  static int k1_ccu_probe(struct platform_device *pdev)
>  {
>  	struct regmap *base_regmap, *lock_regmap = NULL;
> +	const struct spacemit_ccu_data *data;
>  	struct device *dev = &pdev->dev;
>  	int ret;
>  
> @@ -1012,11 +1077,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
>  					     "failed to get lock regmap\n");
>  	}
>  
> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> -				    of_device_get_match_data(dev));
> +	data = of_device_get_match_data(dev);
> +
> +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to register clocks\n");
>  
> +	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register resets\n");
> +
>  	return 0;
>  }
>  
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 039a448c51a07..53eff7691f33d 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,6 +5,18 @@
>  #ifndef __SOC_K1_SYSCON_H__
>  #define __SOC_K1_SYSCON_H__
>  
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
>  /* APBS register offset */
>  #define APBS_PLL1_SWCR1			0x100
>  #define APBS_PLL1_SWCR2			0x104
> -- 
> 2.45.2
> 
> 

-- 
Yixun Lan (dlan)
