Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1E285053;
	Mon, 30 Jun 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286767; cv=none; b=fYYtlMXsoOp+wHZ+spjNICsRiJuqLEm/FpZhIu8VRcwBswAEXXlJxO0XRRRDD+5fahzXxRjUQE7N59Bqn7b8Gjik4KgbsVfoC6v2+a6ZmtcDTALPoaoRXgPFF8LjQzH9ltvVuZY9xvDTV+yemwYNa2eiev1SBStUxCte3UpCeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286767; c=relaxed/simple;
	bh=FeNoAyq3jHM1qlXEr+ML3rMIo5zE1+yRsauys3cNdX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP6kQmzG3LXtOVgg6Rzm51JjlU8JyxpmNd55z8ty7NxiE1UR89q5CYM1QZArc5h2MAQ2qJ2U34qq+FNg+S8TmfomnaKb25UBPC1NUGJYEYcaAk9+ZLQVt/MkMeHs7dUXjPBNQjuopODC8hje/GWfcMREc93bEgyQkkj2VQAerDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=O+DuHUGU; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="O+DuHUGU"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 92C972FC0063;
	Mon, 30 Jun 2025 14:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1751286755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhGvoqdOe7yh094iGUBaDkhOeEpKHo5Q7tP3mz6Y7TY=;
	b=O+DuHUGU8tARnh31Jhg3jTbQ7yNEHDPavXA2Vx/rA6SbSiKs6BIpehVConpn1rDs0hMnWa
	Riixjy7R1yRhFStDw6097B4a7hDob7ZRdIT9Zz3Ud5XDEnWepcFx+7unAkmGKTHR+HYd12
	d7kWx11IBF2/9nYXGfuv7+hpIKq7r4Y=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c689db31-60cc-4494-b700-88744376f589@tuxedocomputers.com>
Date: Mon, 30 Jun 2025 14:32:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?P=C5=91cze_Barnab=C3=A1s?=
 <pobrn@protonmail.com>, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com>
 <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
 <7a58972f-5256-4598-b729-224f20f3ecd2@protonmail.com>
 <7b29df39-8146-4913-83ff-d71db26983c8@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <7b29df39-8146-4913-83ff-d71db26983c8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 28.06.25 um 01:09 schrieb Armin Wolf:
> Am 25.06.25 um 17:59 schrieb Pőcze Barnabás:
>
>> Hi
>>
>> 2025. 06. 23. 0:36 keltezéssel, Armin Wolf írta:
>>> Am 22.06.25 um 23:37 schrieb Pőcze Barnabás:
>>>
>>>> Hi
>>>>
>>>>
>>>> 2025. 06. 15. 19:59 keltezéssel, Armin Wolf írta:
>>>>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>>>>> interface to talk with the embedded controller, but relies on a
>>>>> DMI whitelist for autoloading since Uniwill just copied the WMI
>>>>> GUID from the Windows driver example.
>>>>>
>>>>> The driver is reverse-engineered based on the following information:
>>>>> - OEM software from intel
>>>>> - https://github.com/pobrn/qc71_laptop
>>>> Oh... I suppose an end of an era for me...
>>> I now remember that we interacted on the mailing lists before, sorry for not 
>>> CCing
>>> you on this patch series.
>>>
>>> Do you want a Co-developed-by tag on those patches?
>> I'll leave it up to you.
>>
>>
>>>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>>>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>>>>
>>>>> The underlying EC supports various features, including hwmon sensors,
>>>>> battery charge limiting, a RGB lightbar and keyboard-related controls.
>>>>>
>>>>> Reported-by: cyear <chumuzero@gmail.com>
>>>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>>> ---
>>>>>      .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>>>>      Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>>>>>      MAINTAINERS                                   |    8 +
>>>>>      drivers/platform/x86/uniwill/Kconfig          |   17 +
>>>>>      drivers/platform/x86/uniwill/Makefile         |    1 +
>>>>>      drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++++
>>>>>      drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>>>>      7 files changed, 1667 insertions(+), 1 deletion(-)
>>>>>      create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>>>>>      create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>>>>      create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>>>>
>>> [...]
>>>>> +
>>>>> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] = {
>>>>> +    EC_ADDR_LIGHTBAR_BAT_RED,
>>>>> +    EC_ADDR_LIGHTBAR_BAT_GREEN,
>>>>> +    EC_ADDR_LIGHTBAR_BAT_BLUE,
>>>>> +};
>>>>> +
>>>>> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] = {
>>>>> +    EC_ADDR_LIGHTBAR_AC_RED,
>>>>> +    EC_ADDR_LIGHTBAR_AC_GREEN,
>>>>> +    EC_ADDR_LIGHTBAR_AC_BLUE,
>>>>> +};
>>>>> +
>>>>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum 
>>>>> led_brightness brightness)
>>>>> +{
>>>>> +    struct led_classdev_mc *led_mc_cdev = lcdev_to_mccdev(led_cdev);
>>>>> +    struct uniwill_data *data = container_of(led_mc_cdev, struct 
>>>>> uniwill_data, led_mc_cdev);
>>>>> +    unsigned int value;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = led_mc_calc_color_components(led_mc_cdev, brightness);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    for (int i = 0; i < LED_CHANNELS; i++) {
>>>>> +        /* Prevent the brightness values from overflowing */
>>>>> +        value = min(LED_MAX_BRIGHTNESS, 
>>>>> data->led_mc_subled_info[i].brightness);
>>>>> +        ret = regmap_write(data->regmap, 
>>>>> uniwill_led_channel_to_ac_reg[i], value);
>>>> This is interesting. I am not sure which "control center" application you 
>>>> have looked at,
>>>> but I found many lookup tables based on the exact model, etc. For example, 
>>>> on my laptop
>>>> any value larger than 36 will simply turn that color component off. Have 
>>>> you seen
>>>> anything like that?
>>> I was using the Intel NUC studio software application during 
>>> reverse-engineering and had a user
>>> test the resulting code on a Intel NUC notebook. AFAIK the OEM software did 
>>> not use a lookup table.
>>>
>>> If we extend this driver in the future then we might indeed use the quirk 
>>> system to change the max.
>>> LED brightness depending on the model.
>> I see. So everything up to 200 works. And after that do you know if it turns 
>> off or what happens?
>
> The user who tested the driver reported that "the brightest lightbar setting 
> is 200", so i assume
> that the lightbar simply clamps the values. However i would not trust the EC 
> firmware in the slightest,
> i can definitely imagine that other models react differently.

Iirc at least for keyboard backlight on tf devices there was a value that could 
be overwritten to make the values 0-255 instead of 0-200, maybe this is also 
true for the lightbar, but i don't know if this affects the livespan of the leds.

Best regards,

Werner

