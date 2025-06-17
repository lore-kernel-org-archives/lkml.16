Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB32F532D;
	Tue, 17 Jun 2025 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196861; cv=none; b=jXlCnaaS8fSXv+kxXoU/arxhpyMYLMxYar9f0hpQEhH3BQl7e4lMBAaZrO7F0Iyp0jXrR0hoH/Tp9M2iVZ+9b+EmYIE/U66kftpa1cWMayrtuu+xpyvYCXfovP3gSOCje3hVJMET7sctsp8NzPRoL4iNbwF6EHeqWJx1rtKHV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196861; c=relaxed/simple;
	bh=73ZoSeKxAhOSOjSyXNvyvOqcK99yrmbOID6IUvaSsrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2AAdI8HAsiWoxSnmWyoeWrJb4Ntmj4fvZgY2DlSaV8TP/TY4/rkLqv2vaRvi5rCSTTbS2BitNeUv6H6RnLP1EpKAnZSzAAD6NkMOSMfNTEfm91glW0ti6uloDacLD3bR0NZ5SCxjCxvxS3YPyFBE/qxQCJwYD7UoJzy9NbX+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kwjRF3iV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kwjRF3iV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750196845; x=1750801645; i=w_armin@gmx.de;
	bh=SWmvrjDtEhDHZiOt7aZGJvy/V+s1k4bLg/MyoFJ4jJE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kwjRF3iVHVUiEcJqncp3LooGDel66C8KFDRDRpQm58lJO5zVFbhUv5bjm476yBpQ
	 RTFoDERBq0+iehsKz4F47NltSYLj7w+Yql/ji2ao9wWqOnLVe5FTUZf4DcOGN64d6
	 iaY0Y3lBkwL9jMOspSUCtikCRukpZWk2ofb7B4kwQ9eSbZRdxSVx97sM5SdaLKP6+
	 /3Octl+m6wR33tCBzAtMCRj9Vaa1uGtQHvAgE6fIhbkJwYHl4MskU4HdAQF8EZkra
	 DSJOhumGZS2KfEuP9H3W4jR3ww1992A4jwqDYqQ/VNhup0L+L2ZA2oXL5M04FWSYK
	 HxKjnkJ0PfFHA+09hg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bSj-1us4v12nPX-012Axa; Tue, 17
 Jun 2025 23:47:24 +0200
Message-ID: <0e55da71-5668-4229-be3e-8a67594879cc@gmx.de>
Date: Tue, 17 Jun 2025 23:47:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, chumuzero@gmail.com, corbet@lwn.net,
 cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <961b5d0f-2785-ad42-a096-652a30643c2d@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <961b5d0f-2785-ad42-a096-652a30643c2d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZGH5dBDxSvg/W2N2UWcujony44t2rrGcVgVnXl4+D2qz5Cmq6Kz
 SmKILzB88gCzdcfxZhsKSSVKQU0kLyUAROn0w7ENzhg5MGw3P3J287lc9PlP6JB0YrO9Wfw
 gvF8HkNRu7vYTZVaXjJRzon6n55X/cyzpXbA24R2YSj5W8QNe2pj7VI6wOk+E2tCfWf8iq2
 7sGEpJ5knycoNA7q2q12Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t4Qk19i3upg=;JUQfZqVlItYfTCSlYD9rrjohuMJ
 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
 QU6pRgH

Am 16.06.25 um 10:10 schrieb Ilpo J=C3=A4rvinen:

> On Sun, 15 Jun 2025, Armin Wolf wrote:
>
>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>> interface to talk with the embedded controller, but relies on a
>> DMI whitelist for autoloading since Uniwill just copied the WMI
>> GUID from the Windows driver example.
>>
>> The driver is reverse-engineered based on the following information:
>> - OEM software from intel
>> - https://github.com/pobrn/qc71_laptop
>> - https://github.com/tuxedocomputers/tuxedo-drivers
>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>
>> The underlying EC supports various features, including hwmon sensors,
>> battery charge limiting, a RGB lightbar and keyboard-related controls.
>>
>> Reported-by: cyear <chumuzero@gmail.com>
>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>   Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>>   MAINTAINERS                                   |    8 +
>>   drivers/platform/x86/uniwill/Kconfig          |   17 +
>>   drivers/platform/x86/uniwill/Makefile         |    1 +
>>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 ++++++++++++++++=
+
>>   drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>   7 files changed, 1667 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-lap=
top
>>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/testing/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..a4781a118906
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -0,0 +1,53 @@
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/f=
n_lock
>> +Date:		Juni 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the FN lock feature
>> +		of the integrated keyboard by writing "enable"/"disable" into this f=
ile.
>> +
>> +		Reading this file returns the current enable status of the FN lock f=
unctionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/s=
uper_key_lock
>> +Date:		Juni 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +                Allows userspace applications to enable/disable the su=
per key functionality
>> +                of the integrated keyboard by writing "enable"/"disabl=
e" into this file.
>> +
>> +		Reading this file returns the current enable status of the super key=
 functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/t=
ouchpad_toggle
>> +Date:		Juni 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Allows userspace applications to enable/disable the touchpad toggle =
functionality
>> +		of the integrated touchpad by writing "enable"/"disable" into this f=
ile.
>> +
>> +		Reading this file returns the current enable status of the touchpad =
toggle
>> +		functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/r=
ainbow_animation
>> +Date:		Juni 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Forces the integrated lightbar to display a rainbow animation when t=
he machine
>> +		is not suspended. Writing "enable"/"disable" into this file enables/=
disables
>> +		this functionality.
>> +
>> +		Reading this file returns the current status of the rainbow animatio=
n functionality.
>> +
>> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/b=
reathing_in_suspend
>> +Date:		Juni 2025
>> +KernelVersion:	6.17
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Causes the integrated lightbar to display a breathing animation when=
 the machine
>> +		has been suspended and is running on AC power. Writing "enable"/"dis=
able" into
>> +		this file enables/disables this functionality.
>> +
>> +		Reading this file returns the current status of the breathing animat=
ion
>> +		functionality.
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentati=
on/wmi/devices/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..2be598030a5e
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -0,0 +1,109 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill WMI Notebook driver (uniwill-laptop)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM) pro=
vide an WMI-based
>> +EC interface for controlling various platform settings like sensors an=
d fan control.
>> +This interface is used by the ``uniwill-laptop`` driver to map those f=
eatures onto standard
>> +kernel interfaces.
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>> +
>> +::
>> +
>> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +   Description("Class used to operate methods on a ULong"),
>> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
>> +  class AcpiTest_MULong {
>> +    [key, read] string InstanceName;
>> +    [read] boolean Active;
>> +
>> +    [WmiMethodId(1), Implemented, read, write, Description("Return the=
 contents of a ULong")]
>> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(2), Implemented, read, write, Description("Set the co=
ntents of a ULong")]
>> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(3), Implemented, read, write,
>> +     Description("Generate an event containing ULong data")]
>> +    void FireULong([in, Description("WMI requires a parameter")] uint3=
2 Hack);
>> +
>> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Se=
t the contents of a ULong")]
>> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
>> +                     [out, Description("Ulong Data")] uint32 Return);
>> +
>> +    [WmiMethodId(5), Implemented, read, write,
>> +     Description("Get and Set the contents of a ULong for Dollby butto=
n")]
>> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
>> +                   [out, Description("Ulong Data")] uint32 Return);
>> +  };
>> +
>> +Most of the WMI-related code was copied from the Windows driver sample=
s, which unfortunately means
>> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for =
autoloading.
>> +
>> +WMI method GetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method SetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method FireULong()
>> +----------------------
>> +
>> +This WMI method allows to inject a WMI event with a 32-bit payload. It=
s primary purpose seems
>> +to be debugging.
>> +
>> +WMI method GetSetULong()
>> +------------------------
>> +
>> +This WMI method is used to communicate with the EC. The ``Data`` argum=
ent hold the following
>> +information (starting with the least significant byte):
>> +
>> +1. 16-bit address
>> +2. 16-bit data (set to ``0x0000`` when reading)
>> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing=
)
>> +4. 16-bit reserved (set to ``0x0000``)
>> +
>> +The first 8 bits of the ``Return`` value contain the data returned by =
the EC when reading.
>> +The special value ``0xFEFEFEFE`` is used to indicate a communication f=
ailure with the EC.
>> +
>> +WMI method GetButton()
>> +----------------------
>> +
>> +This WMI method is not implemented on all machines and has an unknown =
purpose.
>> +
>> +Reverse-Engineering the Uniwill WMI interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. warning:: Randomly poking the EC can potentially cause damage to th=
e machine and other unwanted
>> +             side effects, please be careful.
>> +
>> +The EC behind the ``GetSetULong`` method is used by the OEM software s=
upplied by the manufacturer.
>> +Reverse-engineering of this software is difficult since it uses an obf=
uscator, however some parts
>> +are not obfuscated.
>> +
>> +The EC can be accessed under Windows using powershell (requires admin =
privileges):
>> +
>> +::
>> +
>> +  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_M=
ULong | Select-Object -First 1
>> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Argume=
nts @{Data =3D <input>}
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ =
package which also served as
>> +a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 53876ec2d111..5b12cc498d56 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/ufs/host/ufs-renesas.c
>>  =20
>> +UNIWILL LAPTOP DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +F:	Documentation/wmi/devices/uniwill-laptop.rst
>> +F:	drivers/platform/x86/uniwill/uniwill-laptop.c
>> +
>>   UNIWILL WMI DRIVER
>>   M:	Armin Wolf <W_Armin@gmx.de>
>>   L:	platform-driver-x86@vger.kernel.org
>> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x8=
6/uniwill/Kconfig
>> index 5f1ea3e9e72f..57f9f88c757c 100644
>> --- a/drivers/platform/x86/uniwill/Kconfig
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>>  =20
>>   if X86_PLATFORM_DRIVERS_UNIWILL
>>  =20
>> +config UNIWILL_LAPTOP
>> +	tristate "Uniwill Laptop Extras"
>> +	default m
>> +	depends on ACPI_WMI
>> +	depends on ACPI_BATTERY
>> +	depends on UNIWILL_WMI
>> +	depends on REGMAP
>> +	depends on HWMON
>> +	depends on LEDS_CLASS_MULTICOLOR
>> +	depends on DMI
>> +	help
>> +	  This driver adds support for various extra features found on Uniwil=
l laptops,
>> +	  like the lightbar and hwmon sensors. It also supports many OEM lapt=
ops
>> +	  originally manufactured by Uniwill.
>> +
>> +	  If you have such a laptop, say Y or M here.
>> +
>>   config UNIWILL_WMI
>>   	tristate "Uniwill WMI Event Driver"
>>   	default m
>> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x=
86/uniwill/Makefile
>> index a5a300be63f3..b55169a49e1e 100644
>> --- a/drivers/platform/x86/uniwill/Makefile
>> +++ b/drivers/platform/x86/uniwill/Makefile
>> @@ -4,4 +4,5 @@
>>   # Uniwill X86 Platform Specific Drivers
>>   #
>>  =20
>> +obj-$(CONFIG_UNIWILL_LAPTOP)	+=3D uniwill-laptop.o
>>   obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
>> diff --git a/drivers/platform/x86/uniwill/uniwill-laptop.c b/drivers/pl=
atform/x86/uniwill/uniwill-laptop.c
>> new file mode 100644
>> index 000000000000..7dc630ea0d74
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-laptop.c
>> @@ -0,0 +1,1477 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux driver for Uniwill notebooks.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#define pr_format(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/fixp-arith.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kstrtox.h>
>> +#include <linux/leds.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/limits.h>
>> +#include <linux/list.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/notifier.h>
>> +#include <linux/pm.h>
>> +#include <linux/printk.h>
>> +#include <linux/regmap.h>
>> +#include <linux/string.h>
>> +#include <linux/string_choices.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +#include <linux/unaligned.h>
>> +#include <linux/units.h>
>> +#include <linux/wmi.h>
>> +
>> +#include <acpi/battery.h>
>> +
>> +#include "uniwill-wmi.h"
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
>> +
>> +#define EC_ADDR_BAT_STATUS_1		0x0432
>> +#define BAT_DISCHARGING			BIT(0)
>> +
>> +#define EC_ADDR_BAT_STATUS_2		0x0433
>> +
>> +#define EC_ADDR_BAT_CURRENT_1		0x0434
>> +
>> +#define EC_ADDR_BAT_CURRENT_2		0x0435
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_1		0x0438
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_2		0x0439
>> +
>> +#define EC_ADDR_CPU_TEMP		0x043E
>> +
>> +#define EC_ADDR_GPU_TEMP		0x044F
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
>> +
>> +#define EC_ADDR_DEVICE_STATUS		0x047B
>> +#define WIFI_STATUS_ON			BIT(7)
>> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
>> +
>> +#define EC_ADDR_BAT_ALERT		0x0494
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
>> +
>> +#define EC_ADDR_PROJECT_ID		0x0740
>> +
>> +#define EC_ADDR_AP_OEM			0x0741
>> +#define	ENABLE_MANUAL_CTRL		BIT(0)
>> +#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
>> +#define FAN_ABNORMAL			BIT(5)
>> +
>> +#define EC_ADDR_SUPPORT_5		0x0742
>> +#define FAN_TURBO_SUPPORTED		BIT(4)
>> +#define FAN_SUPPORT			BIT(5)
>> +
>> +#define EC_ADDR_CTGP_DB_CTRL		0x0743
>> +#define CTGP_DB_GENERAL_ENABLE		BIT(0)
>> +#define CTGP_DB_DB_ENABLE		BIT(1)
>> +#define CTGP_DB_CTGP_ENABLE		BIT(2)
>> +
>> +#define EC_ADDR_CTGP_OFFSET		0x0744
>> +
>> +#define EC_ADDR_TPP_OFFSET		0x0745
>> +
>> +#define EC_ADDR_MAX_TGP			0x0746
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
>> +#define LIGHTBAR_APP_EXISTS		BIT(0)
>> +#define LIGHTBAR_POWER_SAVE		BIT(1)
>> +#define LIGHTBAR_S0_OFF			BIT(2)
>> +#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
>> +#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
>> +
>> +#define EC_ADDR_BIOS_OEM		0x074E
>> +#define FN_LOCK_STATUS			BIT(4)
>> +
>> +#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
>> +#define FAN_LEVEL_MASK			GENMASK(2, 0)
>> +#define FAN_MODE_TURBO			BIT(4)
>> +#define FAN_MODE_HIGH			BIT(5)
>> +#define FAN_MODE_BOOST			BIT(6)
>> +#define FAN_MODE_USER			BIT(7)
>> +
>> +#define EC_ADDR_PWM_1			0x075B
>> +
>> +#define EC_ADDR_PWM_2			0x075C
>> +
>> +/* Unreliable */
>> +#define EC_ADDR_SUPPORT_1		0x0765
>> +#define AIRPLANE_MODE			BIT(0)
>> +#define GPS_SWITCH			BIT(1)
>> +#define OVERCLOCK			BIT(2)
>> +#define MACRO_KEY			BIT(3)
>> +#define SHORTCUT_KEY			BIT(4)
>> +#define SUPER_KEY_LOCK			BIT(5)
>> +#define LIGHTBAR			BIT(6)
>> +#define FAN_BOOST			BIT(7)
>> +
>> +#define EC_ADDR_SUPPORT_2		0x0766
>> +#define SILENT_MODE			BIT(0)
>> +#define USB_CHARGING			BIT(1)
>> +#define RGB_KEYBOARD			BIT(2)
>> +#define CHINA_MODE			BIT(5)
>> +#define MY_BATTERY			BIT(6)
>> +
>> +#define EC_ADDR_TRIGGER			0x0767
>> +#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
>> +#define TRIGGER_LIGHTBAR		BIT(1)
>> +#define TRIGGER_FAN_BOOST		BIT(2)
>> +#define TRIGGER_SILENT_MODE		BIT(3)
>> +#define TRIGGER_USB_CHARGING		BIT(4)
>> +#define RGB_APPLY_COLOR			BIT(5)
>> +#define RGB_LOGO_EFFECT			BIT(6)
>> +#define RGB_RAINBOW_EFFECT		BIT(7)
>> +
>> +#define EC_ADDR_SWITCH_STATUS		0x0768
>> +#define SUPER_KEY_LOCK_STATUS		BIT(0)
>> +#define LIGHTBAR_STATUS			BIT(1)
>> +#define FAN_BOOST_STATUS		BIT(2)
>> +#define MACRO_KEY_STATUS		BIT(3)
>> +#define MY_BAT_POWER_BAT_STATUS		BIT(4)
>> +
>> +#define EC_ADDR_RGB_RED			0x0769
>> +
>> +#define EC_ADDR_RGB_GREEN		0x076A
>> +
>> +#define EC_ADDR_RGB_BLUE		0x076B
>> +
>> +#define EC_ADDR_ROMID_START		0x0770
>> +#define ROMID_LENGTH			14
>> +
>> +#define EC_ADDR_ROMID_EXTRA_1		0x077E
>> +
>> +#define EC_ADDR_ROMID_EXTRA_2		0x077F
>> +
>> +#define EC_ADDR_BIOS_OEM_2		0x0782
>> +#define FAN_V2_NEW			BIT(0)
>> +#define FAN_QKEY			BIT(1)
>> +#define FAN_TABLE_OFFICE_MODE		BIT(2)
>> +#define FAN_V3				BIT(3)
>> +#define DEFAULT_MODE			BIT(4)
>> +
>> +#define EC_ADDR_PL1_SETTING		0x0783
>> +
>> +#define EC_ADDR_PL2_SETTING		0x0784
>> +
>> +#define EC_ADDR_PL4_SETTING		0x0785
>> +
>> +#define EC_ADDR_FAN_DEFAULT		0x0786
>> +#define FAN_CURVE_LENGTH		5
>> +
>> +#define EC_ADDR_KBD_STATUS		0x078C
>> +#define KBD_WHITE_ONLY			BIT(0)	// ~single color
>> +#define KBD_SINGLE_COLOR_OFF		BIT(1)
>> +#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
>> +#define KBD_APPLY			BIT(4)
>> +#define KBD_BRIGHTNESS			GENMASK(7, 5)
>> +
>> +#define EC_ADDR_FAN_CTRL		0x078E
>> +#define FAN3P5				BIT(1)
>> +#define CHARGING_PROFILE		BIT(3)
>> +#define UNIVERSAL_FAN_CTRL		BIT(6)
>> +
>> +#define EC_ADDR_BIOS_OEM_3		0x07A3
>> +#define FAN_REDUCED_DURY_CYCLE		BIT(5)
>> +#define FAN_ALWAYS_ON			BIT(6)
>> +
>> +#define EC_ADDR_BIOS_BYTE		0x07A4
>> +#define FN_LOCK_SWITCH			BIT(3)
>> +
>> +#define EC_ADDR_OEM_3			0x07A5
>> +#define POWER_LED_MASK			GENMASK(1, 0)
>> +#define POWER_LED_LEFT			0x00
>> +#define POWER_LED_BOTH			0x01
>> +#define POWER_LED_NONE			0x02
>> +#define FAN_QUIET			BIT(2)
>> +#define OVERBOOST			BIT(4)
>> +#define HIGH_POWER			BIT(7)
>> +
>> +#define EC_ADDR_OEM_4			0x07A6
>> +#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
>> +#define TOUCHPAD_TOGGLE_OFF		BIT(6)
>> +
>> +#define EC_ADDR_CHARGE_CTRL		0x07B9
>> +#define CHARGE_CTRL_MASK		GENMASK(6, 0)
>> +#define CHARGE_CTRL_REACHED		BIT(7)
>> +
>> +#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
>> +#define SPLIT_TABLES			BIT(7)
>> +
>> +#define EC_ADDR_AP_OEM_6		0x07C6
>> +#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
>> +#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
>> +#define BATTERY_ERM_STATUS_REACHED	BIT(4)
>> +
>> +#define EC_ADDR_CHARGE_PRIO		0x07CC
>> +#define CHARGING_PERFORMANCE		BIT(7)
>> +
>> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>> +#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
>> +
>> +#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
>> +
>> +#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
>> +
>> +#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
>> +
>> +#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
>> +
>> +#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
>> +
>> +#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
>> +
>> +/*
>> + * Those two registers technically allow for manual fan control,
>> + * but are unstable on some models and are likely not meant to
>> + * be used by applications.
>> + */
>> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
>> +
>> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
>> +
>> +#define DRIVER_NAME	"uniwill"
>> +#define UNIWILL_GUID	"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
>> +
>> +#define PWM_MAX			200
>> +#define FAN_TABLE_LENGTH	16
>> +
>> +#define LED_CHANNELS		3
>> +#define LED_MAX_BRIGHTNESS	200
>> +
>> +#define UNIWILL_FEATURE_FN_LOCK		BIT(0)
>> +#define UNIWILL_FEATURE_SUPER_KEY_LOCK	BIT(1)
>> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
>> +#define UNIWILL_FEATURE_LIGHTBAR	BIT(3)
>> +#define UNIWILL_FEATURE_BATTERY		BIT(4)
>> +#define UNIWILL_FEATURE_HWMON		BIT(5)
>> +
>> +enum uniwill_method {
>> +	UNIWILL_GET_ULONG	=3D 0x01,
>> +	UNIWILL_SET_ULONG	=3D 0x02,
>> +	UNIWILL_FIRE_ULONG	=3D 0x03,
>> +	UNIWILL_GET_SET_ULONG	=3D 0x04,
>> +	UNIWILL_GET_BUTTON	=3D 0x05,
>> +};
>> +
>> +struct uniwill_method_buffer {
>> +	__le16 address;
>> +	__le16 data;
>> +	__le16 operation;
>> +	__le16 reserved;
>> +} __packed;
>> +
>> +struct uniwill_data {
>> +	struct wmi_device *wdev;
>> +	struct regmap *regmap;
>> +	struct acpi_battery_hook hook;
>> +	unsigned int last_charge_ctrl;
>> +	struct mutex battery_lock;	/* Protects the list of currently register=
ed batteries */
>> +	unsigned int last_switch_status;
>> +	struct mutex super_key_lock;	/* Protects the toggling of the super ke=
y lock state */
>> +	struct list_head batteries;
>> +	struct led_classdev_mc led_mc_cdev;
>> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>> +	struct notifier_block nb;
>> +};
>> +
>> +struct uniwill_battery_entry {
>> +	struct list_head head;
>> +	struct power_supply *battery;
>> +};
>> +
>> +static bool force;
>> +module_param_unsafe(force, bool, 0);
>> +MODULE_PARM_DESC(force, "Force loading without checking for supported =
devices\n");
>> +
>> +/* Feature bitmask since the associated registers are not reliable */
>> +static uintptr_t supported_features;
>> +
>> +/*
>> + * "disable" is placed on index 0 so that the return value of sysfs_ma=
tch_string()
>> + * directly translates into a boolean value.
>> + */
>> +static const char * const uniwill_enable_disable_strings[] =3D {
>> +	[0] =3D "disable",
>> +	[1] =3D "enable",
>> +};
>> +
>> +static const char * const uniwill_temp_labels[] =3D {
>> +	"CPU",
>> +	"GPU",
>> +};
>> +
>> +static const char * const uniwill_fan_labels[] =3D {
>> +	"Main",
>> +	"Secondary",
>> +};
>> +
>> +static int uniwill_get_set_ulong(struct wmi_device *wdev, struct uniwi=
ll_method_buffer *input,
>> +				 u32 *output)
>> +{
>> +	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +	struct acpi_buffer in =3D {
>> +		.length =3D sizeof(*input),
>> +		.pointer =3D input,
>> +	};
>> +	union acpi_object *obj;
>> +	acpi_status status;
>> +	int ret =3D 0;
>> +
>> +	status =3D wmidev_evaluate_method(wdev, 0x0, UNIWILL_GET_SET_ULONG, &=
in, &out);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	obj =3D out.pointer;
>> +	if (!obj)
>> +		return -ENODATA;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> +		ret =3D -ENOMSG;
>> +		goto free_obj;
>> +	}
>> +
>> +	if (obj->buffer.length < sizeof(*output)) {
>> +		ret =3D -EPROTO;
>> +		goto free_obj;
>> +	}
>> +
>> +	*output =3D get_unaligned_le32(obj->buffer.pointer);
>> +
>> +free_obj:
>> +	kfree(obj);
>> +
>> +	return ret;
>> +}
>> +
>> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsig=
ned int val)
>> +{
>> +	struct uniwill_method_buffer input =3D {
>> +		.address =3D cpu_to_le16(reg),
>> +		.data =3D cpu_to_le16(val & U8_MAX),
>> +		.operation =3D 0x0000,
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	u32 output;
>> +	int ret;
>> +
>> +	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (output =3D=3D 0xFEFEFEFE)
>> +		return -ENXIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsign=
ed int *val)
>> +{
>> +	struct uniwill_method_buffer input =3D {
>> +		.address =3D cpu_to_le16(reg),
>> +		.data =3D 0x0000,
>> +		.operation =3D cpu_to_le16(0x0100),
>> +	};
>> +	struct uniwill_data *data =3D context;
>> +	u32 output;
>> +	int ret;
>> +
>> +	ret =3D uniwill_get_set_ulong(data->wdev, &input, &output);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (output =3D=3D 0xFEFEFEFE)
>> +		return -ENXIO;
>> +
>> +	*val =3D (u8)output;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct regmap_bus uniwill_ec_bus =3D {
>> +	.reg_write =3D uniwill_ec_reg_write,
>> +	.reg_read =3D uniwill_ec_reg_read,
>> +	.reg_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
>> +	.val_format_endian_default =3D REGMAP_ENDIAN_LITTLE,
>> +};
>> +
>> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg=
)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_AP_OEM:
>> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +	case EC_ADDR_LIGHTBAR_AC_RED:
>> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +	case EC_ADDR_BIOS_OEM:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_OEM_4:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_RED:
>> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_CPU_TEMP:
>> +	case EC_ADDR_GPU_TEMP:
>> +	case EC_ADDR_MAIN_FAN_RPM_1:
>> +	case EC_ADDR_MAIN_FAN_RPM_2:
>> +	case EC_ADDR_SECOND_FAN_RPM_1:
>> +	case EC_ADDR_SECOND_FAN_RPM_2:
>> +	case EC_ADDR_BAT_ALERT:
>> +	case EC_ADDR_PROJECT_ID:
>> +	case EC_ADDR_AP_OEM:
>> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +	case EC_ADDR_LIGHTBAR_AC_RED:
>> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +	case EC_ADDR_BIOS_OEM:
>> +	case EC_ADDR_PWM_1:
>> +	case EC_ADDR_PWM_2:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_SWITCH_STATUS:
>> +	case EC_ADDR_OEM_4:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +	case EC_ADDR_LIGHTBAR_BAT_RED:
>> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case EC_ADDR_CPU_TEMP:
>> +	case EC_ADDR_GPU_TEMP:
>> +	case EC_ADDR_MAIN_FAN_RPM_1:
>> +	case EC_ADDR_MAIN_FAN_RPM_2:
>> +	case EC_ADDR_SECOND_FAN_RPM_1:
>> +	case EC_ADDR_SECOND_FAN_RPM_2:
>> +	case EC_ADDR_BAT_ALERT:
>> +	case EC_ADDR_PWM_1:
>> +	case EC_ADDR_PWM_2:
>> +	case EC_ADDR_TRIGGER:
>> +	case EC_ADDR_SWITCH_STATUS:
>> +	case EC_ADDR_CHARGE_CTRL:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static const struct regmap_config uniwill_ec_config =3D {
>> +	.reg_bits =3D 16,
>> +	.val_bits =3D 8,
>> +	.writeable_reg =3D uniwill_writeable_reg,
>> +	.readable_reg =3D uniwill_readable_reg,
>> +	.volatile_reg =3D uniwill_volatile_reg,
>> +	.can_sleep =3D true,
>> +	.max_register =3D 0xFFFF,
>> +	.cache_type =3D REGCACHE_MAPLE,
>> +	.use_single_read =3D true,
>> +	.use_single_write =3D true,
>> +};
>> +
>> +static ssize_t fn_lock_store(struct device *dev, struct device_attribu=
te *attr, const char *buf,
>> +			     size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret)
>> +		value =3D FN_LOCK_STATUS;
>> +	else
>> +		value =3D 0;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_ST=
ATUS, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t fn_lock_show(struct device *dev, struct device_attribut=
e *attr, char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & FN_LOCK_STA=
TUS));
>> +}
>> +
>> +static DEVICE_ATTR_RW(fn_lock);
>> +
>> +static ssize_t super_key_lock_store(struct device *dev, struct device_=
attribute *attr,
>> +				    const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	guard(mutex)(&data->super_key_lock);
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * We can only toggle the super key lock, so we return early if the s=
etting
>> +	 * is already in the correct state.
>> +	 */
>> +	if (ret =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
>> +		return count;
>> +
>> +	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPE=
R_KEY_LOCK,
>> +				TRIGGER_SUPER_KEY_LOCK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t super_key_lock_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & SUPER_KEY=
_LOCK_STATUS)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(super_key_lock);
>> +
>> +static ssize_t touchpad_toggle_store(struct device *dev, struct device=
_attribute *attr,
>> +				     const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret)
>> +		value =3D 0;
>> +	else
>> +		value =3D TOUCHPAD_TOGGLE_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGG=
LE_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t touchpad_toggle_show(struct device *dev, struct device_=
attribute *attr, char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & TOUCHPAD_=
TOGGLE_OFF)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(touchpad_toggle);
>> +
>> +static ssize_t rainbow_animation_store(struct device *dev, struct devi=
ce_attribute *attr,
>> +				       const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret)
>> +		value =3D LIGHTBAR_WELCOME;
>> +	else
>> +		value =3D 0;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t rainbow_animation_show(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & LIGHTBAR_WE=
LCOME));
>> +}
>> +
>> +static DEVICE_ATTR_RW(rainbow_animation);
>> +
>> +static ssize_t breathing_in_suspend_store(struct device *dev, struct d=
evice_attribute *attr,
>> +					  const char *buf, size_t count)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D sysfs_match_string(uniwill_enable_disable_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret)
>> +		value =3D 0;
>> +	else
>> +		value =3D LIGHTBAR_S3_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S3_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t breathing_in_suspend_show(struct device *dev, struct de=
vice_attribute *attr,
>> +					 char *buf)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & LIGHTBAR_=
S3_OFF)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(breathing_in_suspend);
>> +
>> +static struct attribute *uniwill_attrs[] =3D {
>> +	/* Keyboard-related */
>> +	&dev_attr_fn_lock.attr,
>> +	&dev_attr_super_key_lock.attr,
>> +	&dev_attr_touchpad_toggle.attr,
>> +	/* Lightbar-related */
>> +	&dev_attr_rainbow_animation.attr,
>> +	&dev_attr_breathing_in_suspend.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct at=
tribute *attr, int n)
>> +{
>> +	if (attr =3D=3D &dev_attr_fn_lock.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_FN_LOCK)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_super_key_lock.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_touchpad_toggle.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
>> +			return attr->mode;
>> +	}
>> +
>> +	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>> +	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>> +		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
>> +			return attr->mode;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct attribute_group uniwill_group =3D {
>> +	.is_visible =3D uniwill_attr_is_visible,
>> +	.attrs =3D uniwill_attrs,
>> +};
>> +
>> +static const struct attribute_group *uniwill_groups[] =3D {
>> +	&uniwill_group,
>> +	NULL
>> +};
>> +
>> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types ty=
pe, u32 attr, int channel,
>> +			long *val)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +	unsigned int value;
>> +	__be16 rpm;
>> +	int ret;
>> +
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		switch (channel) {
>> +		case 0:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
>> +			break;
>> +		case 1:
>> +			ret =3D regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		*val =3D value * 1000;
> Something available in linux/units.h for that 1000 ?

Indeed, i will go with MILLIDEGREE_PER_DEGREE.

Thanks,
Armin Wolf

