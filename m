Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94123AE84;
	Tue, 17 Jun 2025 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194647; cv=none; b=jJSwHKxDHUFsChjreUBLnnGcG/wwiULZ0TN0FDPN04FYbMdaM8Fsb+//i5O1h/eZGMS3yI33i8z07wmAvK6tjP4LFG7iHqjk6s0lBarDQJ2evLV4sLc6UbwA6BfXtJDvyFx8bIdRBDoUW5qTrT1xLw5HlHicTnGkxeJXxRQJT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194647; c=relaxed/simple;
	bh=XcnXISr+/rFbHWqTVw3yE4sWNkchV00hoDcV2DjFDy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtMXFPu8fg+duKAr2nl8lo928LaYMAesdEFsBo0DiXjOFQ135mLn0ELlNcwVDi+SI9sboFnPDlPYGdqGa2Qpb+htv/mDuN8T1DYaMG6dy5Fp41TzWS9heNrvz+KJa9i6Htsu3t7gmSCQOJdUJsKm8w8+mnKGUyYpo3ac00KsrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BX6Uvblk; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BX6Uvblk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750194624; x=1750799424; i=w_armin@gmx.de;
	bh=+zTso4cAY78WEFU7LYEuf3tk+4t+YhY0W9ZfuFgKooA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BX6UvblksEuMmltdhIHIK61qtGPRNnYApU3OHu/IlPj5fOAAWChoj/P6xI8GffpD
	 WVPDjFc5SpJKj0Ehawi1/BR5MZEON7AojSEBxNL7S3LkZBH4hFhQTwAL8LHPwlDF3
	 hZrCMZaRybXF2qWnAnBO0knEGd28dmUmGPTf0dzVmh2pLqGO1R8baQc4N54EiFDwU
	 KJ4R/naBN0rSwQkSBrbub79qshDdk7Au2+dA2tsiKcFDgf9OCORL17b67kHfAua9g
	 x2ltrSz46L2BdGF4BUyE5QNL7+6kq5pswa+k5LbKMxPTS0HwIe9WBhLhfHNpWPxaq
	 wR3gzV19pPYNroSdLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1uLp4n0ar7-00SZlw; Tue, 17
 Jun 2025 23:10:24 +0200
Message-ID: <8126f0b8-c12e-4917-8f3e-f7b4a620aea2@gmx.de>
Date: Tue, 17 Jun 2025 23:10:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
 <77da5151-ddbd-409f-8b48-28029a96d5d8@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <77da5151-ddbd-409f-8b48-28029a96d5d8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EHfJzrJOLzDLKFtA2LxhOZsE2g2SiJtx5VJYezR07/OQSwsm89i
 b2HsWa6PkTTU9jH7fO+SbwMtEXdSiAXEQ9jyYO6eW7xG6Qrb8mfB/LGxK+32Wk7+/JIiHE6
 OCJcu/BMOZuJIkY7aTvbZlNU5dvvLK901qn1IAsUxpmgsuBBEPWXkNRE3LOHZixTv7fmkjy
 9cQ9IvgW49CBbcLv306mQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZMU8xnX0mso=;tmX32TEIaFedqglnG0yJdD8WtWT
 HHiR0ZRYtP3Lhv9ciP9dWaWVE+lhl3ppflcHb2O5Qrpdmz7HT8Q2z8pJrAw0MUdeUYw9yWqSO
 pbUSwJWmPUcnzN4r6JA8Yds0w7JGkDy46diItJkSsMh91I5ijj/+2YMgJfb9/cKIWbCThXnlt
 D+DoNUstUpjmk/aemBNqhs7s/3aXHHp27obUeBTdeNvcCHnX8RtyCdCWAp8svoUZYxnAu3PAZ
 ylrgA5E4YteFyu7U9odON7Vedr9A0prkvE7WXi5ayMpiK8G8wlbLJExliFzDk1rPEAec5qMvg
 ElNnYOjRfd0SSqgKDh/2FIaEFkW7mNoZUvWuPt6Yjm5uXHRvJqyjUBpaaq2QuXlvS8QgPcRH7
 gTLtKpEYPX6I3oK6PymPJol4CaykfvimKz+VXuc8N6IVQ+WBMPvYDIoKwp3xca0WWr4k3u7a+
 IIqHbd0dKD9wH4Z16X6OW6TzuJZyTApGGu0nbIaWpJ11pQswPoZjrDWjAPFuEATWDQEg/fUDB
 AIXl0uI41TjwbzNw/t7xA4B1l8nEZ7A4qQk1pEQZBRstjmWH4VP7wl4FfhWHqiNw8itz5FvJN
 0vJAfWxiDN1ay+ag3Z/jTVQFtWxgY247qwESGJnhMUSflkOafM1JALbTFY8jlq8Xpt05SbPar
 7S6lbgdWRFZeWUVSk/cJhbTcyaQfGupiU0j8KB5RoAuiA//M7LPrGamFBCJ9sCJyvusHeh3gD
 GlEeYqdRKo/e3Y5lw9qKOxchYrLRAKqa9CG8s+epj5LNRI75iy4sBVtmvpxuCt1fK4+Pl1PAZ
 R+H+6Q2TkTwOgcZgNoXvGKxTRMiXUiwJKoyaI8E/DDp4mq+VdjgTfkGAvH9GXACLBFNrtfO65
 fQIl558PGDA3NpycJhXZ88A4nnIpd9HFzlmB5YIljNW8+TcIpJNRTXOgA6kMnyZYrky3uCZ4n
 LEyiVho6VjYyfazdN17TQOjVgEGxpDZ1PDTkktLNNVNxF3IbmChwpab7o29E3tONbkUNW3ErD
 fAkVaf9SDDnu6TLzwOXsfAoxa0MLjcCVTjrQ/6JgHsTsVBgClr6gYEcE3paJhk9vfLXrdbXRf
 KhdbfnH/rj2R09AekTe0Sjw5MzXcxzjv2wdHbMm4zp3OoQivHKiBwzVfypnFlIg1HOKUYinOZ
 oplj9UFpMVqscgawOh7H4j/twYJzswu5kxKPlp+F05sj8dnbEupIobL06O8luRsXP01oU5PDI
 vruHbW4P4N1Z7P42pRMybDxXbYaJJh6hNGYWJL4uD5YnlRdBCyTeKEImVqLAx3ykZpduCO2Cv
 mLSIzwtRMwXajsV3ucVw0aWWsfhC9fkMv90xeGpX6KWsN/LlxxjD+HL3K5hVOAOSMylS63IUL
 8jAdtrqtl7UyfNVLKdFSS9hf9givRC7GNayu5OFoktPGMS5X16YEGz/I6PCohToIlg0ZTXine
 q0agwJsZsf+aTBQzxyhCSV3Xx26XgUqEKljBqpt+Uvj5yLttd0qHZdEpgTyS0BBCi7+fD52ee
 sdTPUDG5ymgUZ/oibo60Mr9KnCgmniPI2/wUYTBqEvxuzyKHuSBUSHj6eWVzcKl+jPKCOl9uy
 fRU9lwGIQBgplTC5V2kw+fBpBI3S9AE5bt1ziEXTX0ioKfDblmQaK6dtCfusORgKf/u3wu4kw
 I6AzcNSAvz4Mun+IH7rW931PaPS+rtPWg68eAfL8o/08O7riDZTYI/CxoC6Q8k9a2ahtbq8ld
 tnZRR11HMCd9BRaxHVnjLyQvSeUgxO3vk8Mto0YPtL7+bvkSUZpLTh40gKtyOK+VHQLis/oz5
 wckcboUfkqotWMMKovdzt30jNpFLqmhYb5GH87gPTPsuiipOlC0VlC2V3w3rAd3mCoCuo+KQZ
 1FgoONmzNvgtBQJzoFvBap0TTGChFwZtY7UplkHs+IIRDK55rAwGVZGHD9zpvUshhLFRdFXrl
 iRxdYhzs3YYYsbJsXTI8RBfJsyFkRqgVf9bv/HAP+M67MsMTw+6KqQKooRC4L10eGjbYsa9Np
 Z9rVhUY1mXNf32pXezqU0V4untTSMBCxg8Ib6BOpe9+MnTGkuc9Fo2VcHgOKl3ViAzEWO0117
 TOmZUenAPpjgzl0sn9afmqzUO1EGsssRafDKy+/52CYhxgjG9tEW8XEVQ3fc4O+U/vx9U3c5s
 dH1+3MJHvCmLtmA9cCIfbVtFZZxyEPL+lUpddTQftcB4Dz17huQ16lvD064BM97AkgwT8Ci3y
 fUe1eDOEcSzy471y9FEr9uzKPhEe0DQsOUn81q+0lgVOt5o1xnfH4uVSF8UtlUxxVABMkSjnN
 l5NMSg0QdxjsaAFPjmC570tgYpPE72yjU9zqcFZCKl94BHQfU6yIbZ4ykT42Ivwbec7Sf43EA
 knQFYD6WKU0KWtoer2ifSph6Vi8ZamrZiifXymVBrc76lSCEPQVLh8N9w9R4rzbDyTHRDonQV
 UUghG27+kP7/KqxCirOctI2sO8uTwh+v9BaO2/LizLjkZ54y9e/w6K+OnpeQGt9pZQbdGvtU7
 /7KnX66tK/0bv/vpsTBbB8xwCoMvFa48XyP1BgKFy/K4XEWsfvUNBXQoBnKqreEDt8QyFQUxG
 5R3GtbXA/u5Moh6oXTYMLNIOzEbYY+tNJrmSZrkWCgza39JMqxNe2wo7WibcPaxzDQgKI8Euz
 dQj4wKMdC7AxGIKBA1Hbg8YD8OAPNN/kFCqMxe9C/UOBlJ+IcwXfFZ3/tQ7XrI7EVx+2BDNev
 PDILRwdAh7FEEyVRIbDyigIeShj+xxxL6Xpzug547N2rV7G0yEMJwLSJNjSWRpOZqFcu/gjvq
 m0wXEuLErXnuTv1Dnb922x7z5nC1vssu/yBW7wQ6GOIqtb0M/4AbcUHWQBBslRbcRYif17E0a
 0gAc+Js+3xMM2JxBFpez6/y1k3kag8u+Zp9yWfxjI65iJcJxixfndzeyulYCd0miUmgMUnxu/
 kUVAZCtRA8g/O2rpeyUgkECzX5ApgmlLurwIcGGv1QZT6BE3phPWAD6R0+Zazi55HFgvA/2dq
 CYDXn0yyUAXgGHWUKysdDb6rt4RcIaTIoOplwoFGH9XXp46G3MzJDAuWkWEw/01/OdhEwrxpZ
 fDDAQ8D1mRwl2lEyJ7MiULLg4199XklMfZ/7eSO9rYTVILNgkTkhf6Z5OYDK3Xhz7UKMcU6yI
 BuQLv67kEK5JsQXQybHcqjKf1Tbbhlj7+BDLi+2nlYolZIY4fywTReeYn6VSDryaoplHaFQRb
 L7jGxDr8nShWh5NZ

Am 16.06.25 um 11:21 schrieb Hans de Goede:

> On 15-Jun-25 19:59, Armin Wolf wrote:
>> Add a new driver for handling WMI events on Uniwill laptops.
>> The driver sadly cannot use the WMI GUID for autoloading since Uniwill
>> just copied it from the Windows driver example.
>>
>> The driver is reverse-engineered based on the following information:
>> - https://github.com/pobrn/qc71_laptop
>> - https://github.com/tuxedocomputers/tuxedo-drivers
>> - various OEM software
>>
>> Reported-by: cyear <chumuzero@gmail.com>
>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/wmi/devices/uniwill-wmi.rst  |  52 ++++++
>>   MAINTAINERS                                |   8 +
>>   drivers/platform/x86/Kconfig               |   2 +
>>   drivers/platform/x86/Makefile              |   3 +
>>   drivers/platform/x86/uniwill/Kconfig       |  32 ++++
>>   drivers/platform/x86/uniwill/Makefile      |   7 +
>>   drivers/platform/x86/uniwill/uniwill-wmi.c | 177 ++++++++++++++++++++=
+
>>   drivers/platform/x86/uniwill/uniwill-wmi.h | 122 ++++++++++++++
>>   8 files changed, 403 insertions(+)
>>   create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
>>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>>
>> diff --git a/Documentation/wmi/devices/uniwill-wmi.rst b/Documentation/=
wmi/devices/uniwill-wmi.rst
>> new file mode 100644
>> index 000000000000..232fa8349611
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-wmi.rst
>> @@ -0,0 +1,52 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill WMI event driver (uniwill-wmi)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM) pro=
vide an WMI-based
>> +event interface for various platform events like hotkeys. This interfa=
ce is used by the
>> +``uniwill-wmi`` driver to react to hotkey presses.
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
>> +   Description("Class containing event generated ULong data"),
>> +   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
>> +  class AcpiTest_EventULong : WmiEvent {
>> +    [key, read] string InstanceName;
>> +    [read] boolean Active;
>> +
>> +    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULon=
g;
>> +  };
>> +
>> +Most of the WMI-related code was copied from the Windows driver sample=
s, which unfortunately means
>> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for =
autoloading.
>> +
>> +WMI event data
>> +--------------
>> +
>> +The WMI event data contains a single 32-bit value which is used to ind=
icate various platform events.
>> +Many non-hotkey events are not directly consumed by the driver itself,=
 but are instead handled by
>> +the ``uniwill-laptop`` driver.
>> +
>> +Reverse-Engineering the Uniwill WMI event interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +The driver logs debug messages when receiving a WMI event. Thus enabli=
ng debug messages will be
>> +useful for finding unknown event codes.
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ =
package which also served as
>> +a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c14614613377..53876ec2d111 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/ufs/host/ufs-renesas.c
>>  =20
>> +UNIWILL WMI DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/wmi/devices/uniwill-wmi.rst
>> +F:	drivers/platform/x86/uniwill/uniwill-wmi.c
>> +F:	drivers/platform/x86/uniwill/uniwill-wmi.h
>> +
>>   UNSORTED BLOCK IMAGES (UBI)
>>   M:	Richard Weinberger <richard@nod.at>
>>   R:	Zhihao Cheng <chengzhihao1@huawei.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index 43055df44827..ba9d65f01332 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -65,6 +65,8 @@ config HUAWEI_WMI
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called huawei-wmi.
>>  =20
>> +source "drivers/platform/x86/uniwill/Kconfig"
>> +
>>   config UV_SYSFS
>>   	tristate "Sysfs structure for UV systems"
>>   	depends on X86_UV
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
>> index 0530a224bebd..1549c56ced91 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -107,6 +107,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+=3D toshiba-wmi.o
>>   # before toshiba_acpi initializes
>>   obj-$(CONFIG_ACPI_TOSHIBA)	+=3D toshiba_acpi.o
>>  =20
>> +# Uniwill
>> +obj-y				+=3D uniwill/
>> +
>>   # Inspur
>>   obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+=3D inspur_platform_profile.o
>>  =20
>> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x8=
6/uniwill/Kconfig
>> new file mode 100644
>> index 000000000000..5f1ea3e9e72f
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>> +	bool "Uniwill X86 Platform Specific Device Drivers"
>> +	depends on X86_PLATFORM_DEVICES
>> +	help
>> +	  Say Y here to get to see options for device drivers for various
>> +	  Uniwill X86 platforms, including many OEM laptops originally
>> +	  manufactured by Uniwill.
>> +	  This option alone does not add any kernel code.
>> +
>> +	  If you say N, all options in this submenu will be skipped and disab=
led.
>> +
>> +if X86_PLATFORM_DRIVERS_UNIWILL
>> +
>> +config UNIWILL_WMI
>> +	tristate "Uniwill WMI Event Driver"
>> +	default m
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	select INPUT_SPARSEKMAP
>> +	help
>> +	  This driver adds support for various hotkey events on Uniwill lapto=
ps,
>> +	  like rfkill and other special buttons. It also supports many OEM la=
ptops
>> +	  originally manufactured by Uniwill.
>> +
>> +	  If you have such a laptop, say Y or M here.
>> +
>> +endif
>> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x=
86/uniwill/Makefile
>> new file mode 100644
>> index 000000000000..a5a300be63f3
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Makefile for linux/drivers/platform/x86/uniwill
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +obj-$(CONFIG_UNIWILL_WMI)	+=3D uniwill-wmi.o
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platf=
orm/x86/uniwill/uniwill-wmi.c
>> new file mode 100644
>> index 000000000000..b95a0d68ce6a
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux hotkey driver for Uniwill notebooks.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/export.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/notifier.h>
>> +#include <linux/printk.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "uniwill-wmi.h"
>> +
>> +#define DRIVER_NAME		"uniwill-wmi"
>> +#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
>> +
>> +struct uniwill_wmi_data {
>> +	struct mutex input_lock;	/* Protects input sequence during notify */
>> +	struct input_dev *input_device;
>> +};
>> +
>> +static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
>> +
>> +static const struct key_entry uniwill_wmi_keymap[] =3D {
>> +	/* Reported via keyboard controller */
>> +	{ KE_IGNORE,	UNIWILL_OSD_CAPSLOCK,			{ KEY_CAPSLOCK }},
>> +	{ KE_IGNORE,	UNIWILL_OSD_NUMLOCK,			{ KEY_NUMLOCK }},
>> +
>> +	/* Reported when the user locks/unlocks the super key */
>> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,	{ KEY_UNKNOWN }},
>> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,	{ KEY_UNKNOWN }},
>> +
>> +	/* Reported in manual mode when toggling the airplane mode status */
>> +	{ KE_KEY,	UNIWILL_OSD_RFKILL,			{ KEY_RFKILL }},
>> +
>> +	/* Reported when user wants to cycle the platform profile */
>> +	{ KE_IGNORE,	UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,	{ KEY_UNKNOWN }},
>> +
>> +	/* Reported when the user wants to toggle the microphone mute status =
*/
>> +	{ KE_KEY,	UNIWILL_OSD_MIC_MUTE,			{ KEY_MICMUTE }},
>> +
>> +	/* Reported when the user locks/unlocks the Fn key */
>> +	{ KE_IGNORE,	UNIWILL_OSD_FN_LOCK,			{ KEY_FN_ESC }},
>> +
>> +	/* Reported when the user wants to toggle the brightness of the keybo=
ard */
>> +	{ KE_KEY,	UNIWILL_OSD_KBDILLUMTOGGLE,		{ KEY_KBDILLUMTOGGLE }},
>> +
>> +	/* FIXME: find out the exact meaning of those events */
>> +	{ KE_IGNORE,	UNIWILL_OSD_BAT_CHARGE_FULL_24_H,	{ KEY_UNKNOWN }},
>> +	{ KE_IGNORE,	UNIWILL_OSD_BAT_ERM_UPDATE,		{ KEY_UNKNOWN }},
>> +
>> +	/* Reported when the user wants to toggle the benchmark mode status *=
/
>> +	{ KE_IGNORE,	UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,	{ KEY_UNKNOWN }},
>> +
>> +	{ KE_END }
>> +};
>> +
>> +int uniwill_wmi_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(uniwill_wmi_register_notifier, "UNIWILL");
>> +
>> +int uniwill_wmi_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb=
);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(uniwill_wmi_unregister_notifier, "UNIWILL");
>> +
>> +static void devm_uniwill_wmi_unregister_notifier(void *data)
>> +{
>> +	struct notifier_block *nb =3D data;
>> +
>> +	uniwill_wmi_unregister_notifier(nb);
>> +}
>> +
>> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct noti=
fier_block *nb)
>> +{
>> +	int ret;
>> +
>> +	ret =3D uniwill_wmi_register_notifier(nb);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_noti=
fier, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(devm_uniwill_wmi_register_notifier, "UNIWILL");
>> +
>> +static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_obj=
ect *obj)
>> +{
>> +	struct uniwill_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
>> +	u32 value;
>> +	int ret;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_INTEGER)
>> +		return;
>> +
>> +	value =3D obj->integer.value;
>> +
>> +	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
>> +
>> +	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, =
NULL);
>> +	if (ret =3D=3D NOTIFY_BAD)
>> +		return;
>> +
>> +	mutex_lock(&data->input_lock);
>> +	sparse_keymap_report_event(data->input_device, value, 1, true);
>> +	mutex_unlock(&data->input_lock);
>> +}
>> +
>> +static int uniwill_wmi_probe(struct wmi_device *wdev, const void *cont=
ext)
>> +{
>> +	struct uniwill_wmi_data *data;
>> +	int ret;
> Hmm, if someone manually modprobe-s this because they think it will
> help it will still load despite the generic GUID thing.
>
> I think this should the same DMI allow-list as the -laptop driver?
>
> Or maybe just export the driver as a symbol and have -laptop do
> the actual registering of the driver ? Then if e.g. a force module
> option gets added to the -laptop driver that will not need to
> be duplicated here ...
>
> Regards,
>
> Hans

I do not think that a allow-list is necessary here, because the driver
cannot cause any hardware damage. The driver only listens to firmware
events, it does not access the underlying hardware in any way.

If someone really does load this driver manually on an unsupported device
then the worst things that will happen are random hotkey presses. In most
cases nothing will happen.

I can of course modify the driver to only send input events when can consu=
mer
(uniwill-laptop) is registered.

Thanks,
Armin Wolf

>> +
>> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_mutex_init(&wdev->dev, &data->input_lock);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	dev_set_drvdata(&wdev->dev, data);
>> +
>> +	data->input_device =3D devm_input_allocate_device(&wdev->dev);
>> +	if (!data->input_device)
>> +		return -ENOMEM;
>> +
>> +	ret =3D sparse_keymap_setup(data->input_device, uniwill_wmi_keymap, N=
ULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	data->input_device->name =3D "Uniwill WMI hotkeys";
>> +	data->input_device->phys =3D "wmi/input0";
>> +	data->input_device->id.bustype =3D BUS_HOST;
>> +
>> +	return input_register_device(data->input_device);
>> +}
>> +
>> +/*
>> + * We cannot fully trust this GUID since Uniwill just copied the WMI G=
UID
>> + * from the Windows driver example, and others probably did the same.
>> + *
>> + * Because of this we cannot use this WMI GUID for autoloading.
>> + */
>> +static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
>> +	{ UNIWILL_EVENT_GUID, NULL },
>> +	{ }
>> +};
>> +
>> +static struct wmi_driver uniwill_wmi_driver =3D {
>> +	.driver =3D {
>> +		.name =3D DRIVER_NAME,
>> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	.id_table =3D uniwill_wmi_id_table,
>> +	.probe =3D uniwill_wmi_probe,
>> +	.notify =3D uniwill_wmi_notify,
>> +	.no_singleton =3D true,
>> +};
>> +module_wmi_driver(uniwill_wmi_driver);
>> +
>> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
>> +MODULE_DESCRIPTION("Uniwill notebook hotkey driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platf=
orm/x86/uniwill/uniwill-wmi.h
>> new file mode 100644
>> index 000000000000..41662ece0675
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Linux hotkey driver for Uniwill notebooks.
>> + *
>> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
>> + */
>> +
>> +#ifndef UNIWILL_WMI_H
>> +#define UNIWILL_WMI_H
>> +
>> +#define UNIWILL_OSD_CAPSLOCK			0x01
>> +#define UNIWILL_OSD_NUMLOCK			0x02
>> +#define UNIWILL_OSD_SCROLLLOCK			0x03
>> +
>> +#define UNIWILL_OSD_TOUCHPAD_ON			0x04
>> +#define UNIWILL_OSD_TOUCHPAD_OFF		0x05
>> +
>> +#define UNIWILL_OSD_SILENT_MODE_ON		0x06
>> +#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
>> +
>> +#define UNIWILL_OSD_WLAN_ON			0x08
>> +#define UNIWILL_OSD_WLAN_OFF			0x09
>> +
>> +#define UNIWILL_OSD_WIMAX_ON			0x0A
>> +#define UNIWILL_OSD_WIMAX_OFF			0x0B
>> +
>> +#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
>> +#define UNIWILL_KEY_BLUETOOTH_OFF		0x0D
>> +
>> +#define UNIWILL_OSD_RF_ON			0x0E
>> +#define UNIWILL_OSD_RF_OFF			0x0F
>> +
>> +#define UNIWILL_OSD_3G_ON			0x10
>> +#define UNIWILL_OSD_3G_OFF			0x11
>> +
>> +#define UNIWILL_OSD_WEBCAM_ON			0x12
>> +#define UNIWILL_OSD_WEBCAM_OFF			0x13
>> +
>> +#define UNIWILL_OSD_BRIGHTNESSUP		0x14
>> +#define UNIWILL_OSD_BRIGHTNESSDOWN		0x15
>> +
>> +#define UNIWILL_OSD_RADIOON			0x1A
>> +#define UNIWILL_OSD_RADIOOFF			0x1B
>> +
>> +#define UNIWILL_OSD_POWERSAVE_ON		0x31
>> +#define UNIWILL_OSD_POWERSAVE_OFF		0x32
>> +
>> +#define UNIWILL_OSD_MENU			0x34
>> +
>> +#define UNIWILL_OSD_MUTE			0x35
>> +#define UNIWILL_OSD_VOLUMEDOWN			0x36
>> +#define UNIWILL_OSD_VOLUMEUP			0x37
>> +
>> +#define UNIWILL_OSD_MENU_2			0x38
>> +
>> +#define UNIWILL_OSD_LIGHTBAR_ON			0x39
>> +#define UNIWILL_OSD_LIGHTBAR_OFF		0x3A
>> +
>> +#define UNIWILL_OSD_KB_LED_LEVEL0		0x3B
>> +#define UNIWILL_OSD_KB_LED_LEVEL1		0x3C
>> +#define UNIWILL_OSD_KB_LED_LEVEL2		0x3D
>> +#define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
>> +#define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
>> +
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
>> +
>> +#define UNIWILL_OSD_MENU_JP			0x42
>> +
>> +#define UNIWILL_OSD_CAMERA_ON			0x90
>> +#define UNIWILL_OSD_CAMERA_OFF			0x91
>> +
>> +#define UNIWILL_OSD_RFKILL			0xA4
>> +
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
>> +
>> +#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
>> +
>> +#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED	0xA7
>> +
>> +#define UNIWILL_OSD_LCD_SW			0xA9
>> +
>> +#define UNIWILL_OSD_FAN_OVERTEMP		0xAA
>> +
>> +#define UNIWILL_OSD_DC_ADAPTER_CHANGED		0xAB
>> +
>> +#define UNIWILL_OSD_BAT_HP_OFF			0xAC
>> +
>> +#define UNIWILL_OSD_FAN_DOWN_TEMP		0xAD
>> +
>> +#define UNIWILL_OSD_BATTERY_ALERT		0xAE
>> +
>> +#define UNIWILL_OSD_TIMAP_HAIERLB_SW		0xAF
>> +
>> +#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE	0xB0
>> +
>> +#define UNIWILL_OSD_KBDILLUMDOWN		0xB1
>> +#define UNIWILL_OSD_KBDILLUMUP			0xB2
>> +
>> +#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE	0xB3
>> +#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE	0xB4
>> +
>> +#define UNIWILL_OSD_MIC_MUTE			0xB7
>> +
>> +#define UNIWILL_OSD_FN_LOCK			0xB8
>> +#define UNIWILL_OSD_KBDILLUMTOGGLE		0xB9
>> +
>> +#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H	0xBE
>> +
>> +#define UNIWILL_OSD_BAT_ERM_UPDATE		0xBF
>> +
>> +#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
>> +
>> +#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
>> +
>> +struct notifier_block;
>> +
>> +int uniwill_wmi_register_notifier(struct notifier_block *nb);
>> +int uniwill_wmi_unregister_notifier(struct notifier_block *nb);
>> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct noti=
fier_block *nb);
>> +
>> +#endif /* UNIWILL_WMI_H */
