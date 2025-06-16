Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11CB20D4F8;
	Mon, 16 Jun 2025 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077149; cv=none; b=awAzXnUCKuOPgraYekPPaJs33Bu7RP+seIkpTnM47fsaMI+7p3Zz4YVG3fQfL29H2v97CQB3qxV2Ou5XVweBnSiBiAI53wc7Dhq2nCFaEt3H8JuqAgK8bAK6rmAJf21E/vq5RysMQ6/WeB64v8GWCpnKWHo8J64ybETfdYOy6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077149; c=relaxed/simple;
	bh=2JY4yMdC/vUhgTLm8B0r0nQCJY6onV70jiFurujpt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyFvRq6oyM3VQQ2RDqseRAPE4HX9mmLVPQjH4wh5eNvUnSfdd0eTA76I/VE+rpIdwkbvkupcaFepl1e6fE01iIijIwEtU8n90nA6qJ0TiFTHJEb7EXwfLJ2ZhS7oluwLVKz5XUno4fUX5iHgdl7lyGngWmFSSOEp6T9swmgWo5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=TSjowQ+/; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TSjowQ+/"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BC2CA2FC0090;
	Mon, 16 Jun 2025 14:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1750077140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c266o8JDAQhet9MuHtJSIn0Lt6dPovDllqqDDw6fl8Q=;
	b=TSjowQ+/gsblI1udvGptWCaGspDjVS52SF2awUI/X2tY6ZxWIcFC5tEOqgj8qg8fiwx3iN
	4IASLCiL2/k3kkRPS8Z0ccfOXIkamQZNDNSXOt96jw6N8XKah4BYIcf/P6Nmup1ydML0vL
	B6Kq4mew594bwMowdfMUG7ayPxp1rUE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <1020d244-4d52-4afd-ae98-bfcb2b8e7145@tuxedocomputers.com>
Date: Mon, 16 Jun 2025 14:32:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250615175957.9781-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 15.06.25 um 19:59 schrieb Armin Wolf:
> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
> interface to talk with the embedded controller, but relies on a
> DMI whitelist for autoloading since Uniwill just copied the WMI
> GUID from the Windows driver example.
>
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://github.com/pobrn/qc71_laptop
> - https://github.com/tuxedocomputers/tuxedo-drivers

Same as with the 1/3 patch, the main repo is the one on gitlab: 
https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers

tuxedo-control-center is not (yet) moved over, that's a "when there is time" 
thing xD

> - https://github.com/tuxedocomputers/tuxedo-control-center
>
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
>
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>   MAINTAINERS                                   |    8 +
>   drivers/platform/x86/uniwill/Kconfig          |   17 +
>   drivers/platform/x86/uniwill/Makefile         |    1 +
>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>   7 files changed, 1667 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..a4781a118906
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,53 @@
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/fn_lock
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the FN lock feature
> +		of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the FN lock functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/super_key_lock
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +                Allows userspace applications to enable/disable the super key functionality
> +                of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the super key functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/touchpad_toggle
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the touchpad toggle functionality
> +		of the integrated touchpad by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the touchpad toggle
> +		functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Forces the integrated lightbar to display a rainbow animation when the machine
> +		is not suspended. Writing "enable"/"disable" into this file enables/disables
> +		this functionality.
> +
> +		Reading this file returns the current status of the rainbow animation functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Causes the integrated lightbar to display a breathing animation when the machine
> +		has been suspended and is running on AC power. Writing "enable"/"disable" into
> +		this file enables/disables this functionality.
> +
> +		Reading this file returns the current status of the breathing animation
> +		functionality.
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..2be598030a5e
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +============================================
> +Uniwill WMI Notebook driver (uniwill-laptop)
> +============================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide an WMI-based
> +EC interface for controlling various platform settings like sensors and fan control.
> +This interface is used by the ``uniwill-laptop`` driver to map those features onto standard
> +kernel interfaces.
> +
> +WMI interface description
> +=========================
> +
> +The WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class used to operate methods on a ULong"),
> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_MULong {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Return the contents of a ULong")]
> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(2), Implemented, read, write, Description("Set the contents of a ULong")]
> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(3), Implemented, read, write,
> +     Description("Generate an event containing ULong data")]
> +    void FireULong([in, Description("WMI requires a parameter")] uint32 Hack);
> +
> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Set the contents of a ULong")]
> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
> +                     [out, Description("Ulong Data")] uint32 Return);
> +
> +    [WmiMethodId(5), Implemented, read, write,
> +     Description("Get and Set the contents of a ULong for Dollby button")]
> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
> +                   [out, Description("Ulong Data")] uint32 Return);
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples, which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for autoloading.
> +
> +WMI method GetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method SetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method FireULong()
> +----------------------
> +
> +This WMI method allows to inject a WMI event with a 32-bit payload. Its primary purpose seems
> +to be debugging.
> +
> +WMI method GetSetULong()
> +------------------------
> +
> +This WMI method is used to communicate with the EC. The ``Data`` argument hold the following
> +information (starting with the least significant byte):
> +
> +1. 16-bit address
> +2. 16-bit data (set to ``0x0000`` when reading)
> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
> +4. 16-bit reserved (set to ``0x0000``)
> +
> +The first 8 bits of the ``Return`` value contain the data returned by the EC when reading.
> +The special value ``0xFEFEFEFE`` is used to indicate a communication failure with the EC.
> +
> +WMI method GetButton()
> +----------------------
> +
> +This WMI method is not implemented on all machines and has an unknown purpose.
> +
> +Reverse-Engineering the Uniwill WMI interface
> +=============================================
> +
> +.. warning:: Randomly poking the EC can potentially cause damage to the machine and other unwanted
> +             side effects, please be careful.
> +
> +The EC behind the ``GetSetULong`` method is used by the OEM software supplied by the manufacturer.
> +Reverse-engineering of this software is difficult since it uses an obfuscator, however some parts
> +are not obfuscated.
Iirc Christoffer said there is also another non wmi, but acpi, get/set cmd that 
can write only specific regions but is faster. Just wanted to leave this here 
for potential future optimizations if you are interested.
> +
> +The EC can be accessed under Windows using powershell (requires admin privileges):
> +
> +::
> +
> +  > $obj = Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MULong | Select-Object -First 1
> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Arguments @{Data = <input>}
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ package which also served as
> +a foundation for this driver.

same as above: 
https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers

Best regards,

Werner

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 53876ec2d111..5b12cc498d56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
>   S:	Maintained
>   F:	drivers/ufs/host/ufs-renesas.c
>   
> +UNIWILL LAPTOP DRIVER
> +M:	Armin Wolf <W_Armin@gmx.de>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:	Documentation/wmi/devices/uniwill-laptop.rst
> +F:	drivers/platform/x86/uniwill/uniwill-laptop.c
> +
>   UNIWILL WMI DRIVER
>   M:	Armin Wolf <W_Armin@gmx.de>
>   L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> index 5f1ea3e9e72f..57f9f88c757c 100644
> --- a/drivers/platform/x86/uniwill/Kconfig
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>   
>   if X86_PLATFORM_DRIVERS_UNIWILL
>   
> +config UNIWILL_LAPTOP
> +	tristate "Uniwill Laptop Extras"
> +	default m
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on UNIWILL_WMI
> +	depends on REGMAP
> +	depends on HWMON
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on DMI
> +	help
> +	  This driver adds support for various extra features found on Uniwill laptops,
> +	  like the lightbar and hwmon sensors. It also supports many OEM laptops
> +	  originally manufactured by Uniwill.
> +
> +	  If you have such a laptop, say Y or M here.
> +
>   config UNIWILL_WMI
>   	tristate "Uniwill WMI Event Driver"
>   	default m
> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/uniwill/Makefile
> index a5a300be63f3..b55169a49e1e 100644
> --- a/drivers/platform/x86/uniwill/Makefile
> +++ b/drivers/platform/x86/uniwill/Makefile
> @@ -4,4 +4,5 @@
>   # Uniwill X86 Platform Specific Drivers
>   #
>   
> +obj-$(CONFIG_UNIWILL_LAPTOP)	+= uniwill-laptop.o
>   obj-$(CONFIG_UNIWILL_WMI)	+= uniwill-wmi.o
> diff --git a/drivers/platform/x86/uniwill/uniwill-laptop.c b/drivers/platform/x86/uniwill/uniwill-laptop.c
> new file mode 100644
> index 000000000000..7dc630ea0d74
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-laptop.c
> @@ -0,0 +1,1477 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Uniwill notebooks.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#define pr_format(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fixp-arith.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/pm.h>
> +#include <linux/printk.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +#include <linux/string_choices.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>
> +#include <linux/wmi.h>
> +
> +#include <acpi/battery.h>
> +
> +#include "uniwill-wmi.h"
> +
> +#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
> +
> +#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
> +
> +#define EC_ADDR_BAT_STATUS_1		0x0432
> +#define BAT_DISCHARGING			BIT(0)
> +
> +#define EC_ADDR_BAT_STATUS_2		0x0433
> +
> +#define EC_ADDR_BAT_CURRENT_1		0x0434
> +
> +#define EC_ADDR_BAT_CURRENT_2		0x0435
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
> +
> +#define EC_ADDR_BAT_VOLTAGE_1		0x0438
> +
> +#define EC_ADDR_BAT_VOLTAGE_2		0x0439
> +
> +#define EC_ADDR_CPU_TEMP		0x043E
> +
> +#define EC_ADDR_GPU_TEMP		0x044F
> +
> +#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
> +
> +#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> +
> +#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
> +
> +#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
> +
> +#define EC_ADDR_DEVICE_STATUS		0x047B
> +#define WIFI_STATUS_ON			BIT(7)
> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
> +
> +#define EC_ADDR_BAT_ALERT		0x0494
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
> +
> +#define EC_ADDR_PROJECT_ID		0x0740
> +
> +#define EC_ADDR_AP_OEM			0x0741
> +#define	ENABLE_MANUAL_CTRL		BIT(0)
> +#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
> +#define FAN_ABNORMAL			BIT(5)
> +
> +#define EC_ADDR_SUPPORT_5		0x0742
> +#define FAN_TURBO_SUPPORTED		BIT(4)
> +#define FAN_SUPPORT			BIT(5)
> +
> +#define EC_ADDR_CTGP_DB_CTRL		0x0743
> +#define CTGP_DB_GENERAL_ENABLE		BIT(0)
> +#define CTGP_DB_DB_ENABLE		BIT(1)
> +#define CTGP_DB_CTGP_ENABLE		BIT(2)
> +
> +#define EC_ADDR_CTGP_OFFSET		0x0744
> +
> +#define EC_ADDR_TPP_OFFSET		0x0745
> +
> +#define EC_ADDR_MAX_TGP			0x0746
> +
> +#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
> +#define LIGHTBAR_APP_EXISTS		BIT(0)
> +#define LIGHTBAR_POWER_SAVE		BIT(1)
> +#define LIGHTBAR_S0_OFF			BIT(2)
> +#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
> +#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
> +
> +#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
> +
> +#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
> +
> +#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
> +
> +#define EC_ADDR_BIOS_OEM		0x074E
> +#define FN_LOCK_STATUS			BIT(4)
> +
> +#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
> +#define FAN_LEVEL_MASK			GENMASK(2, 0)
> +#define FAN_MODE_TURBO			BIT(4)
> +#define FAN_MODE_HIGH			BIT(5)
> +#define FAN_MODE_BOOST			BIT(6)
> +#define FAN_MODE_USER			BIT(7)
> +
> +#define EC_ADDR_PWM_1			0x075B
> +
> +#define EC_ADDR_PWM_2			0x075C
> +
> +/* Unreliable */
> +#define EC_ADDR_SUPPORT_1		0x0765
> +#define AIRPLANE_MODE			BIT(0)
> +#define GPS_SWITCH			BIT(1)
> +#define OVERCLOCK			BIT(2)
> +#define MACRO_KEY			BIT(3)
> +#define SHORTCUT_KEY			BIT(4)
> +#define SUPER_KEY_LOCK			BIT(5)
> +#define LIGHTBAR			BIT(6)
> +#define FAN_BOOST			BIT(7)
> +
> +#define EC_ADDR_SUPPORT_2		0x0766
> +#define SILENT_MODE			BIT(0)
> +#define USB_CHARGING			BIT(1)
> +#define RGB_KEYBOARD			BIT(2)
> +#define CHINA_MODE			BIT(5)
> +#define MY_BATTERY			BIT(6)
> +
> +#define EC_ADDR_TRIGGER			0x0767
> +#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
> +#define TRIGGER_LIGHTBAR		BIT(1)
> +#define TRIGGER_FAN_BOOST		BIT(2)
> +#define TRIGGER_SILENT_MODE		BIT(3)
> +#define TRIGGER_USB_CHARGING		BIT(4)
> +#define RGB_APPLY_COLOR			BIT(5)
> +#define RGB_LOGO_EFFECT			BIT(6)
> +#define RGB_RAINBOW_EFFECT		BIT(7)
> +
> +#define EC_ADDR_SWITCH_STATUS		0x0768
> +#define SUPER_KEY_LOCK_STATUS		BIT(0)
> +#define LIGHTBAR_STATUS			BIT(1)
> +#define FAN_BOOST_STATUS		BIT(2)
> +#define MACRO_KEY_STATUS		BIT(3)
> +#define MY_BAT_POWER_BAT_STATUS		BIT(4)
> +
> +#define EC_ADDR_RGB_RED			0x0769
> +
> +#define EC_ADDR_RGB_GREEN		0x076A
> +
> +#define EC_ADDR_RGB_BLUE		0x076B
> +
> +#define EC_ADDR_ROMID_START		0x0770
> +#define ROMID_LENGTH			14
> +
> +#define EC_ADDR_ROMID_EXTRA_1		0x077E
> +
> +#define EC_ADDR_ROMID_EXTRA_2		0x077F
> +
> +#define EC_ADDR_BIOS_OEM_2		0x0782
> +#define FAN_V2_NEW			BIT(0)
> +#define FAN_QKEY			BIT(1)
> +#define FAN_TABLE_OFFICE_MODE		BIT(2)
> +#define FAN_V3				BIT(3)
> +#define DEFAULT_MODE			BIT(4)
> +
> +#define EC_ADDR_PL1_SETTING		0x0783
> +
> +#define EC_ADDR_PL2_SETTING		0x0784
> +
> +#define EC_ADDR_PL4_SETTING		0x0785
> +
> +#define EC_ADDR_FAN_DEFAULT		0x0786
> +#define FAN_CURVE_LENGTH		5
> +
> +#define EC_ADDR_KBD_STATUS		0x078C
> +#define KBD_WHITE_ONLY			BIT(0)	// ~single color
> +#define KBD_SINGLE_COLOR_OFF		BIT(1)
> +#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
> +#define KBD_APPLY			BIT(4)
> +#define KBD_BRIGHTNESS			GENMASK(7, 5)
> +
> +#define EC_ADDR_FAN_CTRL		0x078E
> +#define FAN3P5				BIT(1)
> +#define CHARGING_PROFILE		BIT(3)
> +#define UNIVERSAL_FAN_CTRL		BIT(6)
> +
> +#define EC_ADDR_BIOS_OEM_3		0x07A3
> +#define FAN_REDUCED_DURY_CYCLE		BIT(5)
> +#define FAN_ALWAYS_ON			BIT(6)
> +
> +#define EC_ADDR_BIOS_BYTE		0x07A4
> +#define FN_LOCK_SWITCH			BIT(3)
> +
> +#define EC_ADDR_OEM_3			0x07A5
> +#define POWER_LED_MASK			GENMASK(1, 0)
> +#define POWER_LED_LEFT			0x00
> +#define POWER_LED_BOTH			0x01
> +#define POWER_LED_NONE			0x02
> +#define FAN_QUIET			BIT(2)
> +#define OVERBOOST			BIT(4)
> +#define HIGH_POWER			BIT(7)
> +
> +#define EC_ADDR_OEM_4			0x07A6
> +#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
> +#define TOUCHPAD_TOGGLE_OFF		BIT(6)
> +
> +#define EC_ADDR_CHARGE_CTRL		0x07B9
> +#define CHARGE_CTRL_MASK		GENMASK(6, 0)
> +#define CHARGE_CTRL_REACHED		BIT(7)
> +
> +#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
> +#define SPLIT_TABLES			BIT(7)
> +
> +#define EC_ADDR_AP_OEM_6		0x07C6
> +#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
> +#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
> +#define BATTERY_ERM_STATUS_REACHED	BIT(4)
> +
> +#define EC_ADDR_CHARGE_PRIO		0x07CC
> +#define CHARGING_PERFORMANCE		BIT(7)
> +
> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
> +#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
> +
> +#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
> +
> +#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
> +
> +#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
> +
> +#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
> +
> +#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
> +
> +#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
> +
> +#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
> +
> +#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
> +
> +#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
> +
> +/*
> + * Those two registers technically allow for manual fan control,
> + * but are unstable on some models and are likely not meant to
> + * be used by applications.
> + */
> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
> +
> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
> +
> +#define DRIVER_NAME	"uniwill"
> +#define UNIWILL_GUID	"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
> +
> +#define PWM_MAX			200
> +#define FAN_TABLE_LENGTH	16
> +
> +#define LED_CHANNELS		3
> +#define LED_MAX_BRIGHTNESS	200
> +
> +#define UNIWILL_FEATURE_FN_LOCK		BIT(0)
> +#define UNIWILL_FEATURE_SUPER_KEY_LOCK	BIT(1)
> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
> +#define UNIWILL_FEATURE_LIGHTBAR	BIT(3)
> +#define UNIWILL_FEATURE_BATTERY		BIT(4)
> +#define UNIWILL_FEATURE_HWMON		BIT(5)
> +
> +enum uniwill_method {
> +	UNIWILL_GET_ULONG	= 0x01,
> +	UNIWILL_SET_ULONG	= 0x02,
> +	UNIWILL_FIRE_ULONG	= 0x03,
> +	UNIWILL_GET_SET_ULONG	= 0x04,
> +	UNIWILL_GET_BUTTON	= 0x05,
> +};
> +
> +struct uniwill_method_buffer {
> +	__le16 address;
> +	__le16 data;
> +	__le16 operation;
> +	__le16 reserved;
> +} __packed;
> +
> +struct uniwill_data {
> +	struct wmi_device *wdev;
> +	struct regmap *regmap;
> +	struct acpi_battery_hook hook;
> +	unsigned int last_charge_ctrl;
> +	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
> +	unsigned int last_switch_status;
> +	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
> +	struct list_head batteries;
> +	struct led_classdev_mc led_mc_cdev;
> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +	struct notifier_block nb;
> +};
> +
> +struct uniwill_battery_entry {
> +	struct list_head head;
> +	struct power_supply *battery;
> +};
> +
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force loading without checking for supported devices\n");
Maybe include a warning that this driver write ec registers? I don't know how 
verbose these descriptions are allowed to be.
> +
> +/* Feature bitmask since the associated registers are not reliable */
> +static uintptr_t supported_features;
> +
> +/*
> + * "disable" is placed on index 0 so that the return value of sysfs_match_string()
> + * directly translates into a boolean value.
> + */
> +static const char * const uniwill_enable_disable_strings[] = {
> +	[0] = "disable",
> +	[1] = "enable",
> +};
> +
> +static const char * const uniwill_temp_labels[] = {
> +	"CPU",
> +	"GPU",
> +};
> +
> +static const char * const uniwill_fan_labels[] = {
> +	"Main",
> +	"Secondary",
> +};
> +
> +static int uniwill_get_set_ulong(struct wmi_device *wdev, struct uniwill_method_buffer *input,
> +				 u32 *output)
> +{
> +	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer in = {
> +		.length = sizeof(*input),
> +		.pointer = input,
> +	};
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	status = wmidev_evaluate_method(wdev, 0x0, UNIWILL_GET_SET_ULONG, &in, &out);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = out.pointer;
> +	if (!obj)
> +		return -ENODATA;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -ENOMSG;
> +		goto free_obj;
> +	}
> +
> +	if (obj->buffer.length < sizeof(*output)) {
> +		ret = -EPROTO;
> +		goto free_obj;
> +	}
> +
> +	*output = get_unaligned_le32(obj->buffer.pointer);
> +
> +free_obj:
> +	kfree(obj);
> +
> +	return ret;
> +}
> +
> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct uniwill_method_buffer input = {
> +		.address = cpu_to_le16(reg),
> +		.data = cpu_to_le16(val & U8_MAX),
> +		.operation = 0x0000,
> +	};
> +	struct uniwill_data *data = context;
> +	u32 output;
> +	int ret;
> +
> +	ret = uniwill_get_set_ulong(data->wdev, &input, &output);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (output == 0xFEFEFEFE)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct uniwill_method_buffer input = {
> +		.address = cpu_to_le16(reg),
> +		.data = 0x0000,
> +		.operation = cpu_to_le16(0x0100),
> +	};
> +	struct uniwill_data *data = context;
> +	u32 output;
> +	int ret;
> +
> +	ret = uniwill_get_set_ulong(data->wdev, &input, &output);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (output == 0xFEFEFEFE)
> +		return -ENXIO;
> +
> +	*val = (u8)output;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus uniwill_ec_bus = {
> +	.reg_write = uniwill_ec_reg_write,
> +	.reg_read = uniwill_ec_reg_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PROJECT_ID:
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_CHARGE_CTRL:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config uniwill_ec_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.writeable_reg = uniwill_writeable_reg,
> +	.readable_reg = uniwill_readable_reg,
> +	.volatile_reg = uniwill_volatile_reg,
> +	.can_sleep = true,
> +	.max_register = 0xFFFF,
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			     size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = FN_LOCK_STATUS;
> +	else
> +		value = 0;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & FN_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static ssize_t super_key_lock_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->super_key_lock);
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We can only toggle the super key lock, so we return early if the setting
> +	 * is already in the correct state.
> +	 */
> +	if (ret == !(value & SUPER_KEY_LOCK_STATUS))
> +		return count;
> +
> +	ret = regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				TRIGGER_SUPER_KEY_LOCK);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t super_key_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & SUPER_KEY_LOCK_STATUS)));
> +}
> +
> +static DEVICE_ATTR_RW(super_key_lock);
> +
> +static ssize_t touchpad_toggle_store(struct device *dev, struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = 0;
> +	else
> +		value = TOUCHPAD_TOGGLE_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t touchpad_toggle_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & TOUCHPAD_TOGGLE_OFF)));
> +}
> +
> +static DEVICE_ATTR_RW(touchpad_toggle);
> +
> +static ssize_t rainbow_animation_store(struct device *dev, struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = LIGHTBAR_WELCOME;
> +	else
> +		value = 0;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t rainbow_animation_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & LIGHTBAR_WELCOME));
> +}
> +
> +static DEVICE_ATTR_RW(rainbow_animation);
> +
> +static ssize_t breathing_in_suspend_store(struct device *dev, struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S3_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S3_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & LIGHTBAR_S3_OFF)));
> +}
> +
> +static DEVICE_ATTR_RW(breathing_in_suspend);
> +
> +static struct attribute *uniwill_attrs[] = {
> +	/* Keyboard-related */
> +	&dev_attr_fn_lock.attr,
> +	&dev_attr_super_key_lock.attr,
> +	&dev_attr_touchpad_toggle.attr,
> +	/* Lightbar-related */
> +	&dev_attr_rainbow_animation.attr,
> +	&dev_attr_breathing_in_suspend.attr,
> +	NULL
> +};
> +
> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	if (attr == &dev_attr_fn_lock.attr) {
> +		if (supported_features & UNIWILL_FEATURE_FN_LOCK)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_super_key_lock.attr) {
> +		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_touchpad_toggle.attr) {
> +		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_rainbow_animation.attr ||
> +	    attr == &dev_attr_breathing_in_suspend.attr) {
> +		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +			return attr->mode;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group uniwill_group = {
> +	.is_visible = uniwill_attr_is_visible,
> +	.attrs = uniwill_attrs,
> +};
> +
> +static const struct attribute_group *uniwill_groups[] = {
> +	&uniwill_group,
> +	NULL
> +};
> +
> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			long *val)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	__be16 rpm;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = value * 1000;
> +		return 0;
> +	case hwmon_fan:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));
> +			break;
> +		case 1:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = be16_to_cpu(rpm);
> +		return 0;
> +	case hwmon_pwm:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		*val = fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int uniwill_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			       int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		*str = uniwill_temp_labels[channel];
> +		return 0;
> +	case hwmon_fan:
> +		*str = uniwill_fan_labels[channel];
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops uniwill_ops = {
> +	.visible = 0444,
> +	.read = uniwill_read,
> +	.read_string = uniwill_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const uniwill_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info uniwill_chip_info = {
> +	.ops = &uniwill_ops,
> +	.info = uniwill_info,
> +};
> +
> +static int uniwill_hwmon_init(struct uniwill_data *data)
> +{
> +	struct device *hdev;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +		return 0;
> +
> +	hdev = devm_hwmon_device_register_with_info(&data->wdev->dev, "uniwill", data,
> +						    &uniwill_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hdev);
> +}
> +
> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_BAT_RED,
> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
> +};
> +
> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_AC_RED,
> +	EC_ADDR_LIGHTBAR_AC_GREEN,
> +	EC_ADDR_LIGHTBAR_AC_BLUE,
> +};
> +
> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data = container_of(led_mc_cdev, struct uniwill_data, led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = led_mc_calc_color_components(led_mc_cdev, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		/* Prevent the brightness values from overflowing */
> +		value = min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightness);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (brightness)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S0_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S0_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_S0_OFF, value);
> +}
> +
> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S3_OFF | LIGHTBAR_WELCOME)
> +
> +static int uniwill_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data = {
> +		.devicename = DRIVER_NAME,
> +		.default_label = "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory = true,
> +	};
> +	unsigned int color_indices[3] = {
> +		LED_COLOR_ID_RED,
> +		LED_COLOR_ID_GREEN,
> +		LED_COLOR_ID_BLUE,
> +	};
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +		return 0;
> +
> +	/*
> +	 * The EC has separate lightbar settings for AC and battery mode,
> +	 * so we have to ensure that both settings are the same.
> +	 */
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value |= LIGHTBAR_APP_EXISTS;
> +	ret = regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The breathing animation during suspend is not supported when
> +	 * running on battery power.
> +	 */
> +	value |= LIGHTBAR_S3_OFF;
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_MASK, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> +	data->led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
> +	data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
> +	data->led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_led_brightness_set;
> +
> +	if (value & LIGHTBAR_S0_OFF)
> +		data->led_mc_cdev.led_cdev.brightness = 0;
> +	else
> +		data->led_mc_cdev.led_cdev.brightness = LED_MAX_BRIGHTNESS;
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		data->led_mc_subled_info[i].color_index = color_indices[i];
> +
> +		ret = regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], &value);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Make sure that the initial intensity value is not greater than
> +		 * the maximum brightness.
> +		 */
> +		value = min(LED_MAX_BRIGHTNESS, value);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->led_mc_subled_info[i].intensity = value;
> +		data->led_mc_subled_info[i].channel = i;
> +	}
> +
> +	data->led_mc_cdev.subled_info = data->led_mc_subled_info;
> +	data->led_mc_cdev.num_colors = LED_CHANNELS;
> +
> +	return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, &data->led_mc_cdev,
> +							 &init_data);
> +}
> +
> +static int uniwill_get_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +	union power_supply_propval prop;
> +	unsigned int regval;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_HEALTH:
> +		ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_PRESENT, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!prop.intval) {
> +			val->intval = POWER_SUPPLY_HEALTH_NO_BATTERY;
> +			return 0;
> +		}
> +
> +		ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_STATUS, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (prop.intval == POWER_SUPPLY_STATUS_UNKNOWN) {
> +			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
> +			return 0;
> +		}
> +
> +		ret = regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (regval) {
> +			/* Charging issue */
> +			val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
> +			return 0;
> +		}
> +
> +		val->intval = POWER_SUPPLY_HEALTH_GOOD;
> +		return 0;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_set_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				const union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval < 1 || val->intval > 100)
> +			return -EINVAL;
> +
> +		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +					  val->intval);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_property_is_writeable(struct power_supply *psy,
> +					 const struct power_supply_ext *ext, void *drvdata,
> +					 enum power_supply_property psp)
> +{
> +	if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +		return true;
> +
> +	return false;
> +}
> +
> +static const enum power_supply_property uniwill_properties[] = {
> +	POWER_SUPPLY_PROP_HEALTH,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext uniwill_extension = {
> +	.name = DRIVER_NAME,
> +	.properties = uniwill_properties,
> +	.num_properties = ARRAY_SIZE(uniwill_properties),
> +	.get_property = uniwill_get_property,
> +	.set_property = uniwill_set_property,
> +	.property_is_writeable = uniwill_property_is_writeable,
> +};
> +
> +static int uniwill_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry;
> +	int ret;
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	ret = power_supply_register_extension(battery, &uniwill_extension, &data->wdev->dev, data);
> +	if (ret < 0) {
> +		kfree(entry);
> +		return ret;
> +	}
> +
> +	scoped_guard(mutex, &data->battery_lock) {
> +		entry->battery = battery;
> +		list_add(&entry->head, &data->batteries);
> +	}
> +
> +	return 0;
> +}
> +
> +static int uniwill_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry, *tmp;
> +
> +	scoped_guard(mutex, &data->battery_lock) {
> +		list_for_each_entry_safe(entry, tmp, &data->batteries, head) {
> +			if (entry->battery == battery) {
> +				list_del(&entry->head);
> +				kfree(entry);
> +				break;
> +			}
> +		}
> +	}
> +
> +	power_supply_unregister_extension(battery, &uniwill_extension);
> +
> +	return 0;
> +}
> +
> +static int uniwill_battery_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	ret = devm_mutex_init(&data->wdev->dev, &data->battery_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	INIT_LIST_HEAD(&data->batteries);
> +	data->hook.name = "Uniwill Battery Extension";
> +	data->hook.add_battery = uniwill_add_battery;
> +	data->hook.remove_battery = uniwill_remove_battery;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
> +}
> +
> +static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
> +{
> +	struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
> +	struct uniwill_battery_entry *entry;
> +
> +	switch (action) {
> +	case UNIWILL_OSD_BATTERY_ALERT:
> +		scoped_guard(mutex, &data->battery_lock) {
> +			list_for_each_entry(entry, &data->batteries, head) {
> +				power_supply_changed(entry->battery);
> +			}
> +		}
> +
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int uniwill_notifier_init(struct uniwill_data *data)
> +{
> +	data->nb.notifier_call = uniwill_notifier_call;
> +
> +	return devm_uniwill_wmi_register_notifier(&data->wdev->dev, &data->nb);
> +}
> +
> +static void uniwill_disable_manual_control(void *context)
> +{
> +	struct uniwill_data *data = context;
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_ec_init(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
> +
> +	ret = regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_manual_control, data);
> +}
> +
> +static int uniwill_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct uniwill_data *data;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	regmap = devm_regmap_init(&wdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data->regmap = regmap;
> +	ret = devm_mutex_init(&wdev->dev, &data->super_key_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_ec_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_battery_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_hwmon_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_notifier_init(data);
> +}
> +
> +static void uniwill_shutdown(struct wmi_device *wdev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(&wdev->dev);
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
> +		return 0;
> +
> +	/*
> +	 * The EC_ADDR_SWITCH_STATUS is maked as volatile, so we have to restore it
> +	 * ourself.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	/*
> +	 * Save the current charge limit in order to restore it during resume.
> +	 * We cannot use the regmap code for that since this register needs to
> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge_ctrl);
> +}
> +
> +static int uniwill_suspend(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = uniwill_suspend_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_suspend_battery(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	regcache_cache_only(data->regmap, true);
> +	regcache_mark_dirty(data->regmap);
> +
> +	return 0;
> +}
> +
> +static int uniwill_resume_keyboard(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
> +		return 0;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
> +		return 0;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static int uniwill_resume_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +				  data->last_charge_ctrl);
> +}
> +
> +static int uniwill_resume(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(data->regmap, false);
> +
> +	ret = regcache_sync(data->regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_resume_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_battery(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
> +
> +/*
> + * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
> + * from the Windows driver example, and others probably did the same.
> + *
> + * Because of this we cannot use this WMI GUID for autoloading.
> + */
> +static const struct wmi_device_id uniwill_id_table[] = {
> +	{ UNIWILL_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver uniwill_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.dev_groups = uniwill_groups,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.pm = pm_sleep_ptr(&uniwill_pm_ops),
> +	},
> +	.id_table = uniwill_id_table,
> +	.probe = uniwill_probe,
> +	.shutdown = uniwill_shutdown,
> +	.no_singleton = true,
> +};
> +
> +static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK |
> +					UNIWILL_FEATURE_SUPER_KEY_LOCK |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK |
> +					UNIWILL_FEATURE_SUPER_KEY_LOCK |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_LIGHTBAR |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
> +
> +static int __init uniwill_init(void)
> +{
> +	const struct dmi_system_id *id;
> +
> +	id = dmi_first_match(uniwill_dmi_table);
> +	if (!id) {
> +		if (!force)
> +			return -ENODEV;
> +
> +		/* Assume that the device supports all features */
> +		supported_features = UINTPTR_MAX;
> +		pr_warn("Loading on a potentially unsupported device\n");
> +	} else {
> +		supported_features = (uintptr_t)id->driver_data;
> +	}
> +
> +	return wmi_driver_register(&uniwill_driver);
> +}
> +module_init(uniwill_init);
> +
> +static void __exit uniwill_exit(void)
> +{
> +	wmi_driver_unregister(&uniwill_driver);
> +}
> +module_exit(uniwill_exit);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Uniwill notebook driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("UNIWILL");
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
> index b95a0d68ce6a..759bad155099 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
> @@ -153,7 +153,8 @@ static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context)
>    * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
>    * from the Windows driver example, and others probably did the same.
>    *
> - * Because of this we cannot use this WMI GUID for autoloading.
> + * Because of this we cannot use this WMI GUID for autoloading. The uniwill-laptop
> + * driver will instead load this module as a dependency.
>    */
>   static const struct wmi_device_id uniwill_wmi_id_table[] = {
>   	{ UNIWILL_EVENT_GUID, NULL },
