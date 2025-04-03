Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35D35942;
	Thu,  3 Apr 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683850; cv=none; b=NvsecIjuikyX3mEjLNtaPH8yHNh/FnidNWS/8k4TxmeWYCzLjbPxbnLyZ5N1RMnr4Fr2ybO7ACB6Rgs9iIFbxKYgcqaQ4/hqqmc1OpqyRhfbZXB2+7tUi4IDyKBZDuD1b49M05G/z1PP7LpC3nd815jvuIbHnPb1peu8MRA6uVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683850; c=relaxed/simple;
	bh=Bf/cfNxshTlQzJMgijVW/D8OCmO7Vte65scldhDo0wA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dJj3uEVvjaI1KwWGBO13Xzkp63shSK5JxLdcNQp3HSKGTwC9/5nMlikMDswpakN7ERK5Aum139ghjWDu32mGLY4SUfRbO3803sxTtk1cU+XrBRbv0E2C2IRRp4fS872d82JjhrzCl9eQBeSqHnHuYT86j2MHJHOLmmit1JDgitk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGSt36im; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGSt36im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743683848; x=1775219848;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bf/cfNxshTlQzJMgijVW/D8OCmO7Vte65scldhDo0wA=;
  b=iGSt36im9tsfLWR4bYISZbImOi0CY+ELulQ8h4CBIdH+2wHNc8sd1ePP
   lg+9tasV0U58lhDQtuyrkAJihWvMWUxVt0/AjtZTF48F/dP+9I8YdS5xb
   FxZQPsGEcymbsaFdi7LkqvH4j4/ywyEGhG5Pon2C5qZuzWudz/gPLRbTi
   VqwJyownJv1sFZO6vbmwOlcu+sTtue/odXhY31R1O/h+vMvjCtjON1pph
   iXngXl+vcMkbWeY8id+OB4L5geGCmj3ys7i6cAeHWkpV/lnG+TC6C24fY
   3AbhS4TsM9qIgnH2EqlRx/nsi26yqa/R3mW0MeSMHc6BKUawf7fOQrqB0
   Q==;
X-CSE-ConnectionGUID: ziU458oYSvG9z0AP7NPP5Q==
X-CSE-MsgGUID: 4fEGFF4lTI2mZ+mA9NScmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44239752"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44239752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 05:37:27 -0700
X-CSE-ConnectionGUID: o92YcWimRymk9Vnucg65Kw==
X-CSE-MsgGUID: HcQyWSR6QnyU0r2LkPbggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131713295"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 05:37:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 15:37:21 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, jay.chen@canonical.com
Subject: Re: [PATCH] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
In-Reply-To: <3ec9d070-2d2a-45ff-af78-923ff1628c08@portwell.com.tw>
Message-ID: <ae9e7c27-e5b0-b431-2811-c5d8d3549e43@linux.intel.com>
References: <3ec9d070-2d2a-45ff-af78-923ff1628c08@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Yen-Chi Huang wrote:

Please add watchdog drivers people/lists from MAINTAINERS file into the 
next submission.

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
> 
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
> 
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
>  MAINTAINERS                        |   6 +
>  drivers/platform/x86/Kconfig       |  14 ++
>  drivers/platform/x86/Makefile      |   3 +
>  drivers/platform/x86/portwell-ec.c | 224 +++++++++++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 drivers/platform/x86/portwell-ec.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5dfb9186962..c52f819786dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
>  F:	kernel/time/posix-*
>  F:	kernel/time/namespace.c
>  
> +PORTWELL EC DRIVER
> +M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/portwell-ec.c
> +
>  POWER MANAGEMENT CORE
>  M:	"Rafael J. Wysocki" <rafael@kernel.org>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..5b61ab422953 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -779,6 +779,20 @@ config PCENGINES_APU2
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pcengines-apuv2.
>  
> +config PORTWELL_EC
> +	tristate "Portwell Embedded Controller driver"
> +	depends on X86 && WATCHDOG && GPIOLIB
> +	help
> +	  This driver provides support for the GPIO pins and watchdog timer
> +	  embedded in Portwell's EC.
> +
> +	  Theoretically, this driver should work on multiple Portwell platforms,
> +	  but it has only been tested on the Portwell NANO-6064 board.
> +	  If you encounter any issues on other boards, please report them.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called portwell-ec.
> +
>  config BARCO_P50_GPIO
>  	tristate "Barco P50 GPIO driver for identify LED/button"
>  	depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 650dfbebb6c8..83dd82e04457 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>  # PC Engines
>  obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>  
> +# Portwell
> +obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
> +
>  # Barco
>  obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
>  
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> new file mode 100644
> index 000000000000..59c51b80a148
> --- /dev/null
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * portwell-ec.c: Portwell embedded controller driver.
> + *
> + * Tested on:
> + *  - Portwell NANO-6064
> + *
> + * This driver provides support for GPIO and Watchdog Timer
> + * functionalities of the Portwell boards with ITE embedded controller (EC).
> + * The EC is accessed through I/O ports and provides:
> + *  - 8 GPIO pins for control and monitoring
> + *  - Hardware watchdog with 1-255 second timeout range
> + *
> + * It integrates with the Linux GPIO and Watchdog subsystems, allowing
> + * userspace interaction with EC GPIO pins and watchdog control,
> + * ensuring system stability and configurability.
> + *
> + * (C) Copyright 2025 Portwell, Inc.
> + * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
> + *

Remove the extra line.

> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/watchdog.h>
> +#include <linux/io.h>
> +#include <linux/string.h>

Please sort alphabetically.

> +
> +#define PORTWELL_EC_IOSPACE 0xe300
> +#define PORTWELL_GPIO_PINS 8
> +#define PORTWELL_GPIO_DIR_REG 0x2b
> +#define PORTWELL_GPIO_VAL_REG 0x2c
> +
> +#define PORTWELL_WDT_EC_CONFIG_ADDR    0x06
> +#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
> +#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 255
> +#define PORTWELL_EC_FW_VENDOR_ADDRESS  0x4d
> +#define PORTWELL_EC_FW_VENDOR_LENGTH   3
> +#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
> +
> + /* Functions for access EC via IOSPACE*/

Missing space.

> +static void pwec_write(u8 index, u8 data)
> +{
> +	outb(data, PORTWELL_EC_IOSPACE + index);
> +}
> +
> +static u8 pwec_read(u8 address)
> +{
> +	return inb(PORTWELL_EC_IOSPACE + address);

IIRC, CONFIG_HAS_IOPORT is these days required for iob/outb() so you 
should add depends on HAS_IOPORT into Kconfig.

> +}
> +
> +/* GPIO functions*/

Missing space.

> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
> +}
> +
> +static void pwec_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
> +{
> +	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
> +
> +	if (val)
> +		tmp |= (1 << offset);
> +	else
> +		tmp &= ~(1 << offset);
> +	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> +}
> +
> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return (pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset))
> +			? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;

Please move ? to the preceeding line

I'd add a local variable for the read result to make this more readable.

> +}
> +
> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
> +{
> +	/* Changing direction causes issues on some boards, so it's disabled for now. */
> +	return -EOPNOTSUPP;
> +}
> +
> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	/* Changing direction causes issues on some boards, so it's disabled for now. */

Perhaps just one comment above both functions would suffice. The functions 
are right after another so it seems overkill to have the same comment for 
both.

> +	return -EOPNOTSUPP;
> +}
> +
> +static struct gpio_chip pwec_gpio_chip = {
> +	.label = "portwell-ec-gpio",
> +	.get_direction = pwec_gpio_get_direction,
> +	.direction_input = pwec_gpio_direction_input,
> +	.direction_output = pwec_gpio_direction_output,
> +	.get = pwec_gpio_get,
> +	.set = pwec_gpio_set,
> +	.ngpio = PORTWELL_GPIO_PINS,
> +};
> +
> +/* Watchdog functions*/

Missing space

> +static int pwec_wdt_start(struct watchdog_device *wdd)
> +{
> +	int retry = 10;
> +	u8 timeout;
> +
> +	do {
> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01

Please use named defines and FIELD_PREP() instead of comments.

> +		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +		retry--;
> +	} while (timeout != wdd->timeout && retry > 0);
> +	pr_info("Portwell EC: Watchdog started with timeout: %d seconds\n", wdd->timeout);
> +	return (retry > 0) ? 0 : -EIO;
> +}
> +
> +static int pwec_wdt_stop(struct watchdog_device *wdd)
> +{
> +	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x00);
> +	pr_info("Portwell EC: Watchdog stopped\n");
> +	return 0;
> +}
> +
> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
> +{
> +	int retry = 10;
> +	u8 timeout;
> +
> +	pr_info("Portwell EC: Watchdog triggered with timeout: %d seconds\n", wdd->timeout);

This going to be pretty noisy.

> +	do {
> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
> +		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +		retry--;
> +	} while (timeout != wdd->timeout && retry > 0);
> +	return (retry > 0) ? 0 : -EIO;

Duplicated code.

> +}
> +
> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
> +		return -EINVAL;
> +	wdd->timeout = timeout;
> +	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
> +	pr_info("Portwell EC: Watchdog timeout is set: %d seconds\n", wdd->timeout);
> +	return 0;
> +}
> +
> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	unsigned int timeout;
> +
> +	timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +	pr_info("Portwell EC: Watchdog timeout left: %d seconds\n", timeout);
> +	return timeout;
> +}
> +
> +static const struct watchdog_ops pwec_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pwec_wdt_start,
> +	.stop = pwec_wdt_stop,
> +	.ping = pwec_wdt_trigger,
> +	.set_timeout = pwec_wdt_set_timeout,
> +	.get_timeleft = pwec_wdt_get_timeleft,
> +};
> +
> +static struct watchdog_device ec_wdt_dev = {
> +	.info = &(struct watchdog_info){
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.identity = "Portwell EC Watchdog",
> +	},
> +	.ops = &pwec_wdt_ops,
> +	.timeout = 10,
> +	.min_timeout = 1,
> +	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
> +};
> +
> +static int pwec_firmware_vendor_check(void)
> +{
> +	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH+1];

Add spaces around +

> +	u8 i;
> +
> +	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
> +		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS+i);

Spaces around +

> +	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
> +	return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) == 0) ? 0 : -ENODEV;
> +}
> +
> +static int __init pwec_init(void)
> +{
> +	int result;
> +
> +	result = pwec_firmware_vendor_check();

So this goes immediately to poke some io ports? On any x86 machine?
The cases should be narrowed down first with dmi matching.

> +	if (result < 0)
> +		return result;
> +
> +	result = gpiochip_add_data(&pwec_gpio_chip, NULL);
> +	if (result < 0) {
> +		pr_err("Failed to register Portwell EC GPIO\n");
> +		return result;
> +	}
> +
> +	result = watchdog_register_device(&ec_wdt_dev);
> +	if (result < 0) {
> +		gpiochip_remove(&pwec_gpio_chip);
> +		pr_err("Failed to register Portwell EC Watchdog\n");
> +		return result;
> +	}
> +
> +	pr_info("Portwell EC driver initialized\n");

Ok path should be silent.

> +	return 0;
> +}
> +
> +static void __exit pwec_exit(void)
> +{
> +	watchdog_unregister_device(&ec_wdt_dev);
> +	gpiochip_remove(&pwec_gpio_chip);
> +	pr_info("Portwell EC driver removed\n");

Remove print.

> +}
> +
> +module_init(pwec_init);
> +module_exit(pwec_exit);
> +
> +MODULE_AUTHOR("Yen-Chi Huang");
> +MODULE_DESCRIPTION("Portwell EC Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

