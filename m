Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE546B8;
	Thu, 27 Mar 2025 03:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743047546; cv=none; b=LyV2lejVYYPi5pTXehoQI/loRcLq934KZ59SoBql09BAWjAemjQhGHgEpca14PyDl8TBYRyV08aW1TIl6kJC7KbymoQhHjmwWIY2YvYf//IsbcWPsfVFcS8tEUkMJtal6bs3KaQv04TObIgg7a7mWIT6/kG9drSblfbS4IacVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743047546; c=relaxed/simple;
	bh=ZVJqOgLKlNyUIyUPzJseYlk7TJXmEISk5XVBHxfYX7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfyiQr8Y6j76y36D5UsPUG44fBlfD1yZHu7NmRih6PmJIyq+TQeDudhwj3meAxZ2/Y86yATzsv5Xt5r3W8RIBPDLXIsxKhEP6QhI7sbU9WvLmc70kyDuxa82lhKqSIP9JRGD1RK1nDw3yl3NBG0I3A2orfVJ2jLTxfniHJAw7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bCFHIFV0; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bCFHIFV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743047538; x=1743652338; i=w_armin@gmx.de;
	bh=ui/LYdsgrXEyHzK2tn3VLBADi3wcb4ZOHJfpGmsL8/M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bCFHIFV0URAP5BkBB36qASdUjBXNY2rt9TRLBi9T04UT5nhAn1YnDb5pdXo4Xfy/
	 hL7qj8LYI7QumXNYVr0+nNfNJFOHpifdRZoKmJxbXYbeFXwQwGEWbMEDR3yrmGKHR
	 H0PhDjSmJaff9iUbAaHpNSN5Smm7yyGuiBGaJ1+Dlvm3i/bztZpXaosCx+B6Zb5n2
	 +nYr9YTIZ3TF6Vxs88Uhaiz2O8W+Vr/R7IiYvv4kcggFzJRZA4jESAWIpPuAMkRbR
	 xv7JM+IrysK85NOvU/KHQs2+HVSBm5YtaRaEWMjmBaWxGHenG2xN1ND7tHfitunas
	 0JRhp/tSODu1twZy0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1u4Fzd4BXE-002jMe; Thu, 27
 Mar 2025 04:52:18 +0100
Message-ID: <dea2be3a-7e56-449b-8c9e-ac2e333d6a9e@gmx.de>
Date: Thu, 27 Mar 2025 04:52:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6 RESEND] platform/x86: Add Lenovo Gaming Series WMI
 Drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4QoLYDMcQRglT/3QizwS2Sh30yLAr97yTgkXikxkoNs4IzeB+fs
 W5J1mHVSpgPXqc0r66P3eTpMnML5+2PnuKOolV+j3W6PGgK0BoO9wfW2M/qxZdCI81XLIia
 6GgpMCUN3IQwQ/Ks3PRjx9WwCEj5n1edzgWFztitxp0lIu4JXmloTSJezBk5nCN15BL/mX9
 RQmtU/CsX/Nc/9O09wJAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DaICcINOos4=;DtFblJv43szqUT+qpxz6soV2y+p
 cYLHXopDwT/HhQq9FpOfXDjhf62PAVa1/j7VY05kfPFKivFOJQXqC+GFuNQuud0W5TNXL3KYt
 ej5PYEFrBJVVwlOq/UXCQszB6uFu76Ti3IJPUCGM0Ch6GUoSS8Q3VCrWHYNex2WIIxjNc6DIC
 wJGJiO/JfhpNmH3OE7oopo7WVu3ds0L3cr5YizBKBX3nqWRrTchLhr0UDuDRmT6KBXQ6gXynf
 /FbKIzgiQpBbYe1JCvx/pImj0sa40q9NSUEGQBg9l6Sx6GupwFS9vcMJ6i9gDlbU14VcBcT6v
 8c4OqqPTQiGHLYU06/7ouuGXTeal3YbZsveq3Twm0Uvm+LnwfOSjRhuLLv3SMiqIFm1k30JLu
 dHHvdfOKtxi+JLFBfnw5BzHxMe9hqQZKdhv1XKCAKoObkHFPagJJxKrwLa3ICYj2otU/rzl8h
 TW0Ot64xxasSF19xdrr/EXwV/yErdtKjVsrHfE+ukz8dhr4eFfgTJGrrhze/Tglsfuf06Z4zD
 wXTCOkelsoWzmYWLPngwAuFaDcsnxBCyByjMjlKfK+q6vDRE908UV9snrA2jfU6tHmQLZF3Nq
 DqoWAytspus7pzCVkt9vVd/0tiOXg/X9ldF9mZjRmrAyP+sYRkVnwKTPQgyh6lXhzVUhT4xhF
 9jXciuVvN4ny17nJS1wga/NMqk7TOj6aSiv1KkpktO72m+9ddTKkhNIlg7+8HvMIWNDCF2R/T
 LzI7TwQkjE37yL3Cdh6V6YSxQ3NUc9u0Rh6/K728ln9dIBPQ17n3agyjlqRfIKCr5iZPruJox
 bkSTJhsMR3AtCmZnXxDoJ/k1VWVFoDF/paKe6DUKNgO/zZwVbC2iK8bvgLqmVJGyNB9yRfIyK
 12u5gSY10te6WLYeS8g+4dRurEgsw0evf2PAUsHnb4zwGJyZU38KFazXtPF4ElDVy8vi3zuNu
 pksiYLLfcsjODaFFLFN++OgLxrzsmccnqXsIKxqxYsRUTJz8kZO0/wR+PEGDLf+5Wlm2l77Mg
 awXTB3pWdPT0OxsuoYd3GdCjRJWv1L/qnHgVkKPZtiHiS1yzuG6zmPcDyIduXNsyaG4zTcAP5
 ggSSubMtNqhBOSIv2prcLzmkoJU0gr4y+qCxpifATdRZqR133t/ksBXISPb8zIaX5ufG1R6A2
 TgcQAIBcvvyXBhrI/Q3tEuT2Kceex/Js3u5ly/BfHtvEAh2rhz1Fh5oYrA0KoYK+yfIXONHuA
 nlgaXwaUXkRiA2vWDizncsbiMzhUX7qW/JxwpKgb42U3bhLKI4b4NJRFgv6uNOUHtmiX8HrLL
 uH8R19fthjWZ3S7XiAIflHyCS/8LeeZdHAsD+plykiR9k58U4AevqVVY81ltMKSmDh1icOsG3
 cKaYZzzuACSmCeJccDc+CLvEV/7hldbby5Zi+pxJ/4OdONgewjrYIpUSVY1xpowFfzrY5ZPIC
 dfQef6lQlSAMEwCIiCZ+iffpJvNc=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "Gamezone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in a later
> patches.
>
> This driver is distinct from, but should be considered a replacement for
> this patch:
> https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/
>
> This driver attempts to standardize the exposed sysfs by mirroring the
> asus-armoury driver currently under review. As such, a lot of
> inspiration has been drawn from that driver.
> https://lore.kernel.org/platform-driver-x86/20250316230724.100165-1-luke@ljones.dev/
>
> The drivers have been tested by me on the Lenovo Legion Go and Legion Go
> S.

So far the patch series looks promising. The basic architecture seems to be finished by
now, only some implementation details need to be fleshed out.

Thanks,
Armin Wolf

>
> Suggested-by: Mario Limonciello <superm1@kernel.org>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Added lenovo-wmi-events driver
>   - Added headers for every driver
>   - Fixes requested from v3 review
> v3:
> https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-derekjohn.clark@gmail.com/
> v2:
> https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-derekjohn.clark@gmail.com/
> v1:
> https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-derekjohn.clark@gmail.com/
>
> Derek J. Clark (6):
>    platform/x86: Add lenovo-wmi-* driver Documentation
>    platform/x86: Add lenovo-wmi-helpers
>    platform/x86: Add Lenovo WMI Events Driver
>    platform/x86: Add Lenovo Capability Data 01 WMI Driver
>    platform/x86: Add Lenovo Other Mode WMI Driver
>    platform/x86: Add Lenovo Gamezone WMI Driver
>
>   .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
>   .../wmi/devices/lenovo-wmi-other-method.rst   | 108 +++
>   MAINTAINERS                                   |  17 +
>   drivers/platform/x86/Kconfig                  |  40 ++
>   drivers/platform/x86/Makefile                 |   5 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c   | 136 ++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h   |  29 +
>   drivers/platform/x86/lenovo-wmi-events.c      | 132 ++++
>   drivers/platform/x86/lenovo-wmi-events.h      |  21 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c    | 380 +++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h    |  18 +
>   drivers/platform/x86/lenovo-wmi-helpers.c     |  64 ++
>   drivers/platform/x86/lenovo-wmi-helpers.h     |  24 +
>   drivers/platform/x86/lenovo-wmi-other.c       | 626 ++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h       |  19 +
>   15 files changed, 1822 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-other-method.rst
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>
