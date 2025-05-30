Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A291D7E42;
	Fri, 30 May 2025 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748639756; cv=none; b=OmYCGsABrE+/o+oZacaxjqVhfzk2uKkc6cyWvA/mcRz7lITs8wqJg7Bq5lduLHKiRx3IgpydByxrVg1opDH2+ecPhRdXvW6W+3YzwB6ZuVVxaSt0B3iTzv5nsFi/lWjwD7m4J3lKOupZH3znYTQfKN0FkjTCU2FRufhnFbEgIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748639756; c=relaxed/simple;
	bh=KPnYBb8Fmm4eLWoYE0YgXPFfsxoL5JKszq7coiELEk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2AdiLgSS/gRswG801kTuJmkMvV19psF1VStZ5E36yePKmaoEch6geJ0wEvFTDvEDTigRTIMTnR+4X8wC9QsYG8+AuLOKcD6VlHtO1TIJ7uihC40FZoZTHtBQoL1B5FGWSZkhJwN7xIP7oOi+KOx2AGr74gf3G3+6+fapeixChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uSHXjp1w; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uSHXjp1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748639745; x=1749244545; i=w_armin@gmx.de;
	bh=yY2L7dMNG6mlBkA3MxfEJWPj/I4ef3TZeQe2Q+97bG4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uSHXjp1wU8JvnM2zo0E0Sm9Hd3RDc28y2hMgiNNRHpDI3wCR1FE9+yDyvzpPSb+f
	 Cjl79LxerDp9ak9zHL8LFowCw6acc5ciuJrb3uFEXIC4d5iQJECvvPYA3ccBsSImo
	 iR/OTTW85Rk6ewht8Y4f22Dl3S/ModWw74coGEVWACRDNjmzpTZ33A7+MIt+BVima
	 jW/pF9XnfbmMYUp0Ij0ZpljK5gKuxT/U+pcpG6yVF0Q93J5oDmWbwisV9Oh1N/sDE
	 7NGx2Fu4FiE4kknKNtLvOaZLRh0AfkwH4CDToRn1pYKYyDeSZexaMSbcDOeDUBmU2
	 sRYyUgpo6y47wcBVAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1upWDb1P0s-00dmST; Fri, 30
 May 2025 23:15:45 +0200
Message-ID: <2ea3d887-b9e3-444c-ac79-6f882557bc78@gmx.de>
Date: Fri, 30 May 2025 23:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <3a64d00e-3ca8-4a9f-9d72-e62712dc20b9@gmx.de>
 <CAGwozwE1DECoLnR2Za0UR11abgomBfvTVXV601Ok9hh6CeHjVA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwE1DECoLnR2Za0UR11abgomBfvTVXV601Ok9hh6CeHjVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:T6wZE7LWG9jz4eN2xmzyj+Auw2H/MpMrw0mH6QU96OxFJvsoNOl
 6fj5V0X0f5rFN5sfQCXkqAGBgo04MLcp4/1Ov0sl/kcbv0p0X18uwCdK2DgGJL57xDqs/nP
 ip1nRgq8xoXFYmCwqmzaw6RV/GFXsVwcUz/14xYeUCvoJWiIglZP8n4G8yySO0ugwpyMLcf
 h6WDhGlPby0a1w88wMSRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DwkhuLTJhvE=;v8KfzpDVpC5jIypG/ATYxF//tfP
 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
 0uUd6kD

Am 30.05.25 um 22:50 schrieb Antheas Kapenekakis:

> On Mon, 19 May 2025 at 04:38, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:
>>
>>> This draft patch series brings into parity the msi-wmi-platform driver with
>>> the MSI Center M Windows application for the MSI Claw (all models).
>>> Unfortunately, MSI Center M and this interface do not have a discovery API,
>>> necessitating the introduction of a quirk system.
>>>
>>> While this patch series is fully functional and tested, there are still
>>> some issues that need to be addressed:
>>>     - Armin notes we need to disable fan curve support by default and quirk
>>>       it as well, as it is not supported on all models. However, the way
>>>       PWM enable ops work, this makes it a bit difficult, so I would like
>>>       some suggestions on how to rework this.
>>>     - It turns out that to fully disable the fan curve, we have to restore
>>>       the default fan values. This is also what is done on the OEM software.
>>>       For this, the last patch in the series is used, which is a bit dirty.
>>>
>>> Sleep was tested with all values being preserved during S0iX (platform
>>> profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
>>> least for the Claw devices.
>>>
>>> For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
>>> his new high level interface is merged beforehand, we can use that instead.
>> Overall the patch series looks promising, however the suspend/resume handling
>> and the quirk system still needs some work.
>>
>> If you wish i can provide you with a patch for the EC-based quirk system. You
>> can then structure your exiting patches around that.
> Hi,
> Sorry I have been busy with personal life. I will try to get back to
> this in 1-2 weeks.
>
> I have three minor concerns that mirror each other with using an EC based check.
>
> 1) First is that we use boardname on the userspace side to check for
> the Claw. Therefore, using the EC ID kernel side introduces a failure
> point I am not very fond of. 2) Second is that collecting the IDs from
> users might prove more difficult 3) userspace software from MSI uses
> boardname as well.

Actually the EC ID contains the board name (among other data). I envisioned that we
rely on the board name reported by the EC instead of the board name reported over SMBIOS.
This would allow us to better support model variations that share a common board name.

Maybe we can still expose some data (EC ID, debugfs interface) even if a given board is
not whitelisted. This way users can easily retrieve the EC ID with the board name even
on unknown boards.

Thanks,
Armin Wolf

> Could we use a hybrid approach perhaps? What do you think?
>
> Antheas
>
>> Thanks,
>> Armin Wolf
>>
>>> Antheas Kapenekakis (8):
>>>     platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>>>     platform/x86: msi-wmi-platform: Add quirk system
>>>     platform/x86: msi-wmi-platform: Add platform profile through shift
>>>       mode
>>>     platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>>>       attributes
>>>     platform/x86: msi-wmi-platform: Add charge_threshold support
>>>     platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>>>     platform/x86: msi-wmi-platform: Update header text
>>>     platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>>>       unload
>>>
>>> Armin Wolf (2):
>>>     platform/x86: msi-wmi-platform: Use input buffer for returning result
>>>     platform/x86: msi-wmi-platform: Add support for fan control
>>>
>>>    .../wmi/devices/msi-wmi-platform.rst          |   26 +
>>>    drivers/platform/x86/Kconfig                  |    3 +
>>>    drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
>>>    3 files changed, 1156 insertions(+), 54 deletions(-)
>>>
>>>
>>> base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
