Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609D258CE0;
	Mon, 12 May 2025 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747088116; cv=none; b=qk94i1OYrdwUf/Esl0r/S7FTASIszBnIvClL8Vf8+jPpZPA7dVgRyZmIGDaL2b/qlbG4MVnuo83M8PydjSuAmWl4UslpqUcaXp+m9wVpueZOGBocFLm+1mbKg5ohrHnmAeO4qbk2L3rQ4DTJaIYfSnDOj/TypgxONLgpfNi5lak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747088116; c=relaxed/simple;
	bh=sZBCrTn+JM7RBkTquYl9mJ56BwskXyOngdAl+9L/zHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPHTT4950SAhpjkabBraMISmHmnpYILxEmVniXvjCy95ZQPFNewGYB4Ds0BlO/YeWUT+1Y5gwQz/8mMV9owUCc6wvjH/gKt0KLXdzIqb4dz+e6NybxXSaD1su/cE3kYG9WWK/+cfmDAitf4WkG9KTDXkz25j6kT6sBsVNru5TUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lJP/KliF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lJP/KliF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747088104; x=1747692904; i=w_armin@gmx.de;
	bh=5calHApYEch3zGn1UjYU6krNVI7Or+OXk1n9piBTcKM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lJP/KliFzTxS5BDY+px8blnQJmViwUWPh7NCAsxXSWLY/5ko3rQyfKavsEEbA7ae
	 Nwzts57cZsKvMQdhBu3NpZSWQrs2Uri62eTVmq9JO8gMLoQ//+rdTJ+Lv/oI/7535
	 luVrtpa4LijOmbRl148Ogop78jhNeNnqmDB7v/vLATw6TDvhGa/cz+1mlqYSNA1Ud
	 ruPDxzUqN9WcJA10I55zpbIgn6nSioenKPg/Um2G6RoiPU3GIdlQ3jZJdbOSEdj3B
	 sxSrMYsL/srbMCU+jMlp8tq5HEFDmMOClvvwRDxqSbDkGF55pa5rJMmWqxX44ZUGm
	 kIrrVncBVoblhvpTuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1uSmkl3aSq-00ZBGW; Tue, 13
 May 2025 00:15:04 +0200
Message-ID: <af4f01e0-32d0-4502-bad9-b763bb4bc44f@gmx.de>
Date: Tue, 13 May 2025 00:14:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250508235217.12256-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250508235217.12256-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XuXvuO5czMsiW0MWaSYq6MtcPirhHfVPCfxx4EgmhlrbZJv6Hcv
 5HcXBsSWQjhueJN+iqaL3D6peZsKCGpj0Y1Z10/YcCaarwrAhWKVDqFHc8NnRWrvUUVSCUZ
 zFtuR4DBgyqNUx9qLD/dS1XCWmpmBtteLQ5yal1M5rVCk6Et/NqQj3Snxzg6Qo5M9fkfgN0
 YlbZIRrDSmtyRrcZK104g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ogMJiDGg1xg=;LxIhkWcm1kSTZPNGewIINK6czui
 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
 oN78YZOBTBlyjBe49T/g4CIiM

Am 09.05.25 um 01:51 schrieb Derek J. Clark:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "Gamezone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in later
> patches.
>
> This driver attempts to standardize the exposed sysfs by mirroring the
> asus-armoury driver currently under review. As such, a lot of
> inspiration has been drawn from that driver.
> https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luke@ljones.dev/#t
>
> The drivers have been tested by me on the Lenovo Legion Go and Legion Go
> S.

Good work, i think this series is ready for the mainline kernel.

Thanks,
Armin Wolf

> Suggested-by: Mario Limonciello <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v8:
> https://lore.kernel.org/platform-driver-x86/20250505010659.1450984-1-derekjohn.clark@gmail.com/
> v7:
> https://lore.kernel.org/platform-driver-x86/20250503000142.1190354-1-derekjohn.clark@gmail.com/
> v6:
> https://lore.kernel.org/platform-driver-x86/20250428012029.970017-1-derekjohn.clark@gmail.com/
> v5:
> https://lore.kernel.org/platform-driver-x86/20250408012815.1032357-1-derekjohn.clark@gmail.com/
> v4:
> https://lore.kernel.org/platform-driver-x86/20250317144326.5850-1-derekjohn.clark@gmail.com/
> v3:
> https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-derekjohn.clark@gmail.com/
> v2:
> https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-derekjohn.clark@gmail.com/
> v1:
> https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-derekjohn.clark@gmail.com/
> Derek J. Clark (6):
>    platform/x86: Add lenovo-wmi-* driver Documentation
>    platform/x86: Add lenovo-wmi-helpers
>    platform/x86: Add Lenovo WMI Events Driver
>    platform/x86: Add Lenovo Capability Data 01 WMI Driver
>    platform/x86: Add Lenovo Gamezone WMI Driver
>    platform/x86: Add Lenovo Other Mode WMI Driver
>
>   .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
>   .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
>   MAINTAINERS                                   |  12 +
>   drivers/platform/x86/Kconfig                  |  41 ++
>   drivers/platform/x86/Makefile                 |   5 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c   | 303 ++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
>   drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
>   drivers/platform/x86/lenovo-wmi-events.h      |  20 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
>   drivers/platform/x86/lenovo-wmi-helpers.c     |  75 ++
>   drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
>   drivers/platform/x86/lenovo-wmi-other.c       | 658 ++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h       |  16 +
>   15 files changed, 2110 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
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
