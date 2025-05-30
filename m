Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B927CCF8;
	Fri, 30 May 2025 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748642428; cv=none; b=fih1pFsB/s8aF8Xry7YCZKhk2DDLEyvmJUOW1dtMPWXx8IxjDNAMNXpE1YUmtooT0f378G0WLN+efNaCAABg7Yv4Kak+omGMw4++5QkyePZuHPde/SI7mnstzP4GzzMJG8vYayHBajeRdXud2rw3++WD1yatCewO8vU02pDoYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748642428; c=relaxed/simple;
	bh=60jo9c1/KJbiBFiaH0W+Z2xgkL+pPZ9Z144vepNxc48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlY5werurrFphdAkeR4FQ/RElFEG07vdS+Z5z/6hWzPoL3hPI7WF8fn/4z+gVDvJVr+qzn2SdbJnRkNhrvcyGELkAkTgLwpLMPV4uuXpeSzNJM9W0ot/efxKVY9vvyOv7ADnXR5KjJ5qaMYPWc9akDdMMh1GMknvRMYjVgddFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GxM9IFwT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GxM9IFwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748642421; x=1749247221; i=w_armin@gmx.de;
	bh=C5GdPM6eJ4rzvNN4hsizjGbi/udHEvyIOAkKYjErcCg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GxM9IFwTKllWXfmt5E3PC5wf7+ZvJJlwWWHvKGhMlToiU4xbNG9ZyxwpkJ0u0/ws
	 GTXgHQwEqcWLu1IYWbWFpnXH/Za8P/AlsNshuR0zGakZDj4oPg2sqFYHcz+kf70b3
	 vbq6R/Qy5BRLRh+JHw4ppUMq6XcKrqswqiJaWEY5DKHUUPOOanCbz6gifwtZdbMYD
	 Pn980yj9GBulKmu1sEyqoO8EWzPW5CMTl4MXuHGRtOk9xoVKbUyrjRNq36ZtiOx9D
	 qWMrmu0r9/u8WnkzdlEhL7npkk+KMEPZeJlyEGMxL3TgGj54oQRdz9pVVcEeJJzZD
	 O9V6FSUVFstYEN3aSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1uaJ712mEt-00Mek1; Sat, 31
 May 2025 00:00:20 +0200
Message-ID: <c133ad92-f772-4d40-8abd-ac6b43fc186f@gmx.de>
Date: Sat, 31 May 2025 00:00:18 +0200
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
 <2ea3d887-b9e3-444c-ac79-6f882557bc78@gmx.de>
 <CAGwozwG8rGwwcNVwxC7zP+-pg2x=7ZA2VMTGKY6XF1arEAZhBA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwG8rGwwcNVwxC7zP+-pg2x=7ZA2VMTGKY6XF1arEAZhBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ygi+rRN4BrYn6/sGRF5DwlXhHhG4BqdER3W21zcxjoXKqdfYLlO
 74SneUrgP87Ggf+cti5CQaFUf2/PDnKBAhyXMNMPWraaoBMa1aurZ2yN67wNOcT6vNA8gLJ
 R8jTtLv5NLWZvbn4RQUqUMFO9BVcL/lemhsunGO8HUsXGR9a1mGolSV1n/U4Htm+mVt0OdW
 nBaolg6nmlKG9oh2DjJNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bfc9eCNP4hI=;NAlE/TAjpeG5U0C2DSLH7Aaxir6
 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
 yqKgrlu

Am 30.05.25 um 23:28 schrieb Antheas Kapenekakis:

> On Fri, 30 May 2025 at 23:16, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 30.05.25 um 22:50 schrieb Antheas Kapenekakis:
>>
>>> On Mon, 19 May 2025 at 04:38, Armin Wolf <W_Armin@gmx.de> wrote:
>>>> Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:
>>>>
>>>>> This draft patch series brings into parity the msi-wmi-platform driver with
>>>>> the MSI Center M Windows application for the MSI Claw (all models).
>>>>> Unfortunately, MSI Center M and this interface do not have a discovery API,
>>>>> necessitating the introduction of a quirk system.
>>>>>
>>>>> While this patch series is fully functional and tested, there are still
>>>>> some issues that need to be addressed:
>>>>>      - Armin notes we need to disable fan curve support by default and quirk
>>>>>        it as well, as it is not supported on all models. However, the way
>>>>>        PWM enable ops work, this makes it a bit difficult, so I would like
>>>>>        some suggestions on how to rework this.
>>>>>      - It turns out that to fully disable the fan curve, we have to restore
>>>>>        the default fan values. This is also what is done on the OEM software.
>>>>>        For this, the last patch in the series is used, which is a bit dirty.
>>>>>
>>>>> Sleep was tested with all values being preserved during S0iX (platform
>>>>> profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
>>>>> least for the Claw devices.
>>>>>
>>>>> For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
>>>>> his new high level interface is merged beforehand, we can use that instead.
>>>> Overall the patch series looks promising, however the suspend/resume handling
>>>> and the quirk system still needs some work.
>>>>
>>>> If you wish i can provide you with a patch for the EC-based quirk system. You
>>>> can then structure your exiting patches around that.
>>> Hi,
>>> Sorry I have been busy with personal life. I will try to get back to
>>> this in 1-2 weeks.
>>>
>>> I have three minor concerns that mirror each other with using an EC based check.
>>>
>>> 1) First is that we use boardname on the userspace side to check for
>>> the Claw. Therefore, using the EC ID kernel side introduces a failure
>>> point I am not very fond of. 2) Second is that collecting the IDs from
>>> users might prove more difficult 3) userspace software from MSI uses
>>> boardname as well.
>> Actually the EC ID contains the board name (among other data). I envisioned that we
>> rely on the board name reported by the EC instead of the board name reported over SMBIOS.
>> This would allow us to better support model variations that share a common board name.
>>
>> Maybe we can still expose some data (EC ID, debugfs interface) even if a given board is
>> not whitelisted. This way users can easily retrieve the EC ID with the board name even
>> on unknown boards.
> Would a hybrid approach be an option perhaps?
>
> In my mind, Id say an info message in dmesg if the board is not
> supported should be enough. That's what MSI-EC does. Are there any
> other platform drivers that bind to EC ID?
>
> Antheas

How would such an hybrid approach work? AFAIK the board name inside the EC ID is the same as
the board name reported over DMI, so checking both seems unnecessary to me.

I know that msi-ec uses the full EC ID to match supported boards, but i think we only need the
four-character board name.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> Could we use a hybrid approach perhaps? What do you think?
>>>
>>> Antheas
>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Antheas Kapenekakis (8):
>>>>>      platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>>>>>      platform/x86: msi-wmi-platform: Add quirk system
>>>>>      platform/x86: msi-wmi-platform: Add platform profile through shift
>>>>>        mode
>>>>>      platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>>>>>        attributes
>>>>>      platform/x86: msi-wmi-platform: Add charge_threshold support
>>>>>      platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>>>>>      platform/x86: msi-wmi-platform: Update header text
>>>>>      platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>>>>>        unload
>>>>>
>>>>> Armin Wolf (2):
>>>>>      platform/x86: msi-wmi-platform: Use input buffer for returning result
>>>>>      platform/x86: msi-wmi-platform: Add support for fan control
>>>>>
>>>>>     .../wmi/devices/msi-wmi-platform.rst          |   26 +
>>>>>     drivers/platform/x86/Kconfig                  |    3 +
>>>>>     drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
>>>>>     3 files changed, 1156 insertions(+), 54 deletions(-)
>>>>>
>>>>>
>>>>> base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
