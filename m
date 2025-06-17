Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7B2F5308;
	Tue, 17 Jun 2025 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196479; cv=none; b=cD4uaHyIM4RbTZPozN4SD5/M9T3BUrUkBC+5jo0sa9uaK5XpVQEZSMQ/AGfz6RU6TU3F1BZ3YnHnbbkJxe0QGRVXAs+9o+/0m9R9/VqTQtlfBqy5aRZxPphN2ttdNpGCEB0eFbTZZT8LoisolheoACnk4nk8WxD4yw8ADpV4R4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196479; c=relaxed/simple;
	bh=TvMJ2LFk9pPVPbGpvloByH158WtNRTpEhvebtHDSVi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxqwiYmnuArvg4OdyGWlW76V9FVNFR5vJXqVsl8Mh270+Ug7/2GVVR7IpvLncxetXWp+6DdkCAB6DebEu7j6vjFYaLZlagGJK++eUUfrg0IPJ2iveP7Nv5eKgjOKiz7ONUFOQU5z0m60W69puU/gJJPBkl9971g6KJEk5Vfbrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DSJY6gxg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DSJY6gxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750196456; x=1750801256; i=w_armin@gmx.de;
	bh=BxnI4Jduu7vX18nmc0KhnkDIAP9aWpqLwSWntafh5C4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DSJY6gxglGSCmBcAdbxCBeJorupUII2KHY57bMO9yV+CluiIoWXsGekfX9+g8eIo
	 Pox6bDwyYG2B+A4lNCTsbaKftfTEqvo/SB2tj4E30578YCZUU4rqrHYFc7HIYvCnd
	 yhpfISaXL8trm97u44F8ktMopIkibBgiSUkmqQ8mQPBuKP9pgYRiEGvnoLcTVEZaw
	 jPW9cdlL+235YN/f+2e+DmWcw40t0gJURkz/2Cl0nbctYDGYNPMhjqBGsovd67myN
	 knlMoh7gwpSEd0hR7kBF0EP6NryTBXYZMXSpBM1NFq+GFcrOiqHk3YhSrph8L8HP2
	 q6Ok8GkM4mEMvmhy/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1uiWFK1WE2-00wOkM; Tue, 17
 Jun 2025 23:40:56 +0200
Message-ID: <15d74feb-9a13-4d50-9479-7c0e71302562@gmx.de>
Date: Tue, 17 Jun 2025 23:40:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Randy Dunlap <rdunlap@infradead.org>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <02d7f827-3bfc-4cf8-944b-5ec257a5b22c@infradead.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <02d7f827-3bfc-4cf8-944b-5ec257a5b22c@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gxX0XQST7kQ/RXUkIZsCbG3hJ4RXcMb4qEBbvx9vTF059jl5n0A
 GOKjNkTNkNCfcGQscE+ChAAQvxxOSijIuK2ZaJ4jhGIOn0yrqRm1ChykWyamK28QOE5eZu4
 Xem1S1lQavF+wnK7kJvu3EpYdu/OepMKGNBJzcUaQQQsM0DhabEHVv17t9GId01BE/rpdUX
 jD+dz91zhJexyQbs3uitg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cyzAzfDgfh0=;9oQ28hzJE8B7b6ny6kJs8emAAXp
 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

Am 15.06.25 um 21:00 schrieb Randy Dunlap:

> Hi,
>
> On 6/15/25 10:59 AM, Armin Wolf wrote:
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
> REGMAP is usually selected instead of being a dependency.
> There is one other REGMAP dependency in the kernel tree vs. 131 selects.
> Also, there is no user prompt for the REGMAP symbol so users aren't able
> to enable it directly.
>
> Or maybe you could select a more specific REGMAP_xyz and then it will
> enable REGMAP:
>
> config REGMAP
> 	bool
> 	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || R=
EGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUN=
DWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO |=
| REGMAP_FSI)

Hi,

i am using a custom regmap backend, so i will go with just selecting REGMA=
P directly.

Thanks,
Armin Wolf

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
>
