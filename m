Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB1286D55;
	Mon, 30 Jun 2025 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287249; cv=none; b=E1P1maR++Vx6PesUEcbsjoBnoEkEukIPTC1IotoA5QeuwTxjgpEuY9ex0BmIhYqaYUiq9TZGAlkLSJObvg1oOl06bOe14qeshqfptpDUZnU9BIn1Ji+UDstspGJDsdsaDkJ4peh3rejiO5X5eqnQSbHU3VMRilZNshAMdsjAvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287249; c=relaxed/simple;
	bh=UnpMmZSh0GuFrhkQtJcvGJOvSG7U4zxLIdwKkWGqEas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipezPe7KAWc7S/MuxagO8vR2mMmb1sPJC7UalP4wyy5g4MYAKH+xFf9UHCCTwz5SyzF3INsRBcb1AB2giAey5oaEKh4qYgJ5EeoYOK9RV67cDZpehVhrSdrBusqSQbXFxo/BqHLLc724B193Pxq6KogOxsikHicPU/FopQpr9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=W6Eb+0/U; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="W6Eb+0/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751287242; x=1751892042; i=w_armin@gmx.de;
	bh=UnpMmZSh0GuFrhkQtJcvGJOvSG7U4zxLIdwKkWGqEas=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=W6Eb+0/UmLdf8yXWINsxyC7q+seofeH3gi5sPZ8S4zPzDAhGKXqVfGfrjIcEXi4v
	 t/5tgfLbmrvDTOSH9nhTre+A0QobEolGIT2BOJgiu8V9JKy4XeBk9l1rgf556GGVi
	 LtJYK7NXXnsYf7sBzmEB0omeTWNCLMkVBpyKWcHCN9SL9ppwA8OEXlW6yxmfc4vvw
	 vONjljlzXV00jHyrIyb+xOTyv7ADJieEvvczuezalQbNVp4zRLqXknRXQE2HNPUmh
	 zSDivVhpiu85nEHBTwadkHoKTlWvrWgxLwJSM4aW/DUdA3DQnoAhhHgkZUttBlDqp
	 sYE96pqjPaAleIKHug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1uadfG1QqO-00G3Q4; Mon, 30
 Jun 2025 14:40:42 +0200
Message-ID: <e167ed33-010d-4cdb-ae53-4afeb3efdea7@gmx.de>
Date: Mon, 30 Jun 2025 14:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>,
 =?UTF-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com,
 corbet@lwn.net, cs@tuxedo.de, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com>
 <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
 <7a58972f-5256-4598-b729-224f20f3ecd2@protonmail.com>
 <7b29df39-8146-4913-83ff-d71db26983c8@gmx.de>
 <c689db31-60cc-4494-b700-88744376f589@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c689db31-60cc-4494-b700-88744376f589@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uu3lV+VGTI/rU6v9vrabT1rRGRXFPJAJjt2Q9w2V/vaNyRrxqzS
 6zHx1SQNU1rDPy5zx161bKZIX0/F0Rkre8sdlSDF6mTyvDmnD82KebZjZbH96qZ5bNmG9t8
 Ez0MgYoNjtMZQcxWOhQZMtMSuHs/W5mmxYT0bvRvWpkhXA9dkYQU1utFlt1DFSQeoTldDEx
 9x1TdkNThvdm33CM62SjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/lrzYg4hDa0=;OrQAWKkl985NpTIrQ4K9FR5WQp8
 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

Am 30.06.25 um 14:32 schrieb Werner Sembach:

> Hi,
>
> Am 28.06.25 um 01:09 schrieb Armin Wolf:
>> Am 25.06.25 um 17:59 schrieb P=C5=91cze Barnab=C3=A1s:
>>
>>> Hi
>>>
>>> 2025. 06. 23. 0:36 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>>> Am 22.06.25 um 23:37 schrieb P=C5=91cze Barnab=C3=A1s:
>>>>
>>>>> Hi
>>>>>
>>>>>
>>>>> 2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>>>>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>>>>>> interface to talk with the embedded controller, but relies on a
>>>>>> DMI whitelist for autoloading since Uniwill just copied the WMI
>>>>>> GUID from the Windows driver example.
>>>>>>
>>>>>> The driver is reverse-engineered based on the following information=
:
>>>>>> - OEM software from intel
>>>>>> - https://github.com/pobrn/qc71_laptop
>>>>> Oh... I suppose an end of an era for me...
>>>> I now remember that we interacted on the mailing lists before,=20
>>>> sorry for not CCing
>>>> you on this patch series.
>>>>
>>>> Do you want a Co-developed-by tag on those patches?
>>> I'll leave it up to you.
>>>
>>>
>>>>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>>>>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>>>>>
>>>>>> The underlying EC supports various features, including hwmon=20
>>>>>> sensors,
>>>>>> battery charge limiting, a RGB lightbar and keyboard-related=20
>>>>>> controls.
>>>>>>
>>>>>> Reported-by: cyear <chumuzero@gmail.com>
>>>>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>>>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>>>> ---
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .../ABI/testing/sysfs-driver-uniwill-lapto=
p=C2=A0=C2=A0 | 53 +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/uniwill-laptop.r=
st=C2=A0 | 109 ++
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/Kconfig=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/Makefile=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-lapto=
p.c | 1477=20
>>>>>> +++++++++++++++++
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c=
=C2=A0=C2=A0=C2=A0 | 3 +-
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 7 files changed, 1667 insertions(+), 1 del=
etion(-)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>> Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644 Documentation/wmi/devic=
es/uniwill-laptop.rst
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>> drivers/platform/x86/uniwill/uniwill-laptop.c
>>>>>>
>>>> [...]
>>>>>> +
>>>>>> +static const unsigned int=20
>>>>>> uniwill_led_channel_to_bat_reg[LED_CHANNELS] =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_RED,
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_GREEN,
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_BLUE,
>>>>>> +};
>>>>>> +
>>>>>> +static const unsigned int=20
>>>>>> uniwill_led_channel_to_ac_reg[LED_CHANNELS] =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_RED,
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_GREEN,
>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_BLUE,
>>>>>> +};
>>>>>> +
>>>>>> +static int uniwill_led_brightness_set(struct led_classdev=20
>>>>>> *led_cdev, enum led_brightness brightness)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *led_mc_cdev =3D=20
>>>>>> lcdev_to_mccdev(led_cdev);
>>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_=
mc_cdev, struct=20
>>>>>> uniwill_data, led_mc_cdev);
>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D led_mc_calc_color_components(led_mc_cde=
v, brightness);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Prevent the brightne=
ss values from overflowing */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX_B=
RIGHTNESS,=20
>>>>>> data->led_mc_subled_info[i].brightness);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(da=
ta->regmap,=20
>>>>>> uniwill_led_channel_to_ac_reg[i], value);
>>>>> This is interesting. I am not sure which "control center"=20
>>>>> application you have looked at,
>>>>> but I found many lookup tables based on the exact model, etc. For=20
>>>>> example, on my laptop
>>>>> any value larger than 36 will simply turn that color component=20
>>>>> off. Have you seen
>>>>> anything like that?
>>>> I was using the Intel NUC studio software application during=20
>>>> reverse-engineering and had a user
>>>> test the resulting code on a Intel NUC notebook. AFAIK the OEM=20
>>>> software did not use a lookup table.
>>>>
>>>> If we extend this driver in the future then we might indeed use the=
=20
>>>> quirk system to change the max.
>>>> LED brightness depending on the model.
>>> I see. So everything up to 200 works. And after that do you know if=20
>>> it turns off or what happens?
>>
>> The user who tested the driver reported that "the brightest lightbar=20
>> setting is 200", so i assume
>> that the lightbar simply clamps the values. However i would not trust=
=20
>> the EC firmware in the slightest,
>> i can definitely imagine that other models react differently.
>
> Iirc at least for keyboard backlight on tf devices there was a value=20
> that could be overwritten to make the values 0-255 instead of 0-200,=20
> maybe this is also true for the lightbar, but i don't know if this=20
> affects the livespan of the leds.
>
> Best regards,
>
> Werner
>
Interesting, do you know the register offset of this value?

Thanks,
Armin Wolf

