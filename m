Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A2C28A402;
	Mon, 30 Jun 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289700; cv=none; b=p50J/I/UBs4+aXUxgQQiwyNKWXAg2GobZjwtAJL7byXlg+vY60uRFrVAbnOO8lXmNaSp49aFWjuyXey3PkXXJSEHULeSskBIUBMq6d5Wl0c1eI/o0K555uKhAwjL/H9E31yXJnWzGKlExvLFhbQA+El+Yu/vP3id0ACL17WEd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289700; c=relaxed/simple;
	bh=qoifFRTdXQ1VfvptCwVZPFW26hQLaxhap8hXgy445L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCVWlgjltwVbnw+loahg7IUsX8bchBuSOb4WUmb+Eg0anxrKxbhvU9pVRndvKyeRmIB07JzYAwqSoBpTRWMEp4LJR9rqkBtEyYWaU6cHWKAa7n3xa49sC0hUYXY/ZqsprVX3ZqGw31bX7Qsu2xLEZR+qS9cjjFB//vOQfAeMy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RoW9Ay/U; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RoW9Ay/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751289689; x=1751894489; i=w_armin@gmx.de;
	bh=qoifFRTdXQ1VfvptCwVZPFW26hQLaxhap8hXgy445L8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RoW9Ay/UpnyCuI/SEQsONnlYC2AcsNKqI4jgmHbCffW9E/oGsYr2by+fNqrRu371
	 /cHVfGmtw0Iv/yXLDHFs/7aUi09ogTjlFXKxEfWX1p0f9ZZSwjkvmfkZatcQ94JC2
	 nxap3/ZMYJXdhO4RSsMDuRCFzZoeZbB5Pk/Zx+CMkGdm3D0w0ZYGk8/QniF2G0A2H
	 NBjrENPRuY3V5hw//bi7DNhiai9h9FdLI3E9tOKNEK9cuQktGiEL1ZXUiPD78Yrbt
	 UwK23BB1Qvni8gAwb7oGRwdfl9jjgqyLvT5g73haM+7oQPbj/YTRUqHarcMz9QlA7
	 YwZLHvVn67pQ4CDBjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK4f-1uo2Jd3n4T-01158U; Mon, 30
 Jun 2025 15:21:29 +0200
Message-ID: <645bc973-bc0e-4e2f-9df1-6670892e7f32@gmx.de>
Date: Mon, 30 Jun 2025 15:21:26 +0200
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
 <e167ed33-010d-4cdb-ae53-4afeb3efdea7@gmx.de>
 <13ae680f-7384-4261-8555-d77ba94ecd3c@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <13ae680f-7384-4261-8555-d77ba94ecd3c@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ROE7w0Ych+6zVkQeom8PUtMx6C7RXrivvufLXDyCkLl8Fk5YAc
 cpaEYIDwkmUZDmPXNr2ZW49ba2OPcrICc19D9FhIGT4FG3OGp+RpbK9/4hMRzMNyMNEiUgi
 vNAtnlGwxkSKqxCWCrNTMhC3uFfFSHluJjA9Jq7Ccupr7nVl78gD0z06yjvEK9WaQ/lA/q2
 PCGWnqhdlyYOFqVfD98Ng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WCmzND2Ck+s=;F0QT1N2Gr9tqrq39aNarWTECV6V
 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

Am 30.06.25 um 14:55 schrieb Werner Sembach:

>
> Am 30.06.25 um 14:40 schrieb Armin Wolf:
>> Am 30.06.25 um 14:32 schrieb Werner Sembach:
>>
>>> Hi,
>>>
>>> Am 28.06.25 um 01:09 schrieb Armin Wolf:
>>>> Am 25.06.25 um 17:59 schrieb P=C5=91cze Barnab=C3=A1s:
>>>>
>>>>> Hi
>>>>>
>>>>> 2025. 06. 23. 0:36 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>>>>> Am 22.06.25 um 23:37 schrieb P=C5=91cze Barnab=C3=A1s:
>>>>>>
>>>>>>> Hi
>>>>>>>
>>>>>>>
>>>>>>> 2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>>>>>>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>>>>>>>> interface to talk with the embedded controller, but relies on a
>>>>>>>> DMI whitelist for autoloading since Uniwill just copied the WMI
>>>>>>>> GUID from the Windows driver example.
>>>>>>>>
>>>>>>>> The driver is reverse-engineered based on the following=20
>>>>>>>> information:
>>>>>>>> - OEM software from intel
>>>>>>>> - https://github.com/pobrn/qc71_laptop
>>>>>>> Oh... I suppose an end of an era for me...
>>>>>> I now remember that we interacted on the mailing lists before,=20
>>>>>> sorry for not CCing
>>>>>> you on this patch series.
>>>>>>
>>>>>> Do you want a Co-developed-by tag on those patches?
>>>>> I'll leave it up to you.
>>>>>
>>>>>
>>>>>>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>>>>>>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>>>>>>>
>>>>>>>> The underlying EC supports various features, including hwmon=20
>>>>>>>> sensors,
>>>>>>>> battery charge limiting, a RGB lightbar and keyboard-related=20
>>>>>>>> controls.
>>>>>>>>
>>>>>>>> Reported-by: cyear <chumuzero@gmail.com>
>>>>>>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>>>>>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>>>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>>>>>> ---
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .../ABI/testing/sysfs-driver-uniwill-lap=
top=C2=A0=C2=A0 | 53 +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/uniwill-laptop=
.rst=C2=A0 | 109 ++
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/Kconfig=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/Makefile=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-lap=
top.c | 1477=20
>>>>>>>> +++++++++++++++++
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-wmi=
.c=C2=A0=C2=A0=C2=A0 | 3 +-
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 7 files changed, 1667 insertions(+), 1 d=
eletion(-)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>> Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>> Documentation/wmi/devices/uniwill-laptop.rst
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 create mode 100644=20
>>>>>>>> drivers/platform/x86/uniwill/uniwill-laptop.c
>>>>>>>>
>>>>>> [...]
>>>>>>>> +
>>>>>>>> +static const unsigned int=20
>>>>>>>> uniwill_led_channel_to_bat_reg[LED_CHANNELS] =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_RED,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_GREEN,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_BLUE,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static const unsigned int=20
>>>>>>>> uniwill_led_channel_to_ac_reg[LED_CHANNELS] =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_RED,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_GREEN,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_BLUE,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static int uniwill_led_brightness_set(struct led_classdev=20
>>>>>>>> *led_cdev, enum led_brightness brightness)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *led_mc_cdev =3D=20
>>>>>>>> lcdev_to_mccdev(led_cdev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(le=
d_mc_cdev,=20
>>>>>>>> struct uniwill_data, led_mc_cdev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D led_mc_calc_color_components(led_mc_c=
dev, brightness);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Prevent the bright=
ness values from overflowing */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX=
_BRIGHTNESS,=20
>>>>>>>> data->led_mc_subled_info[i].brightness);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(=
data->regmap,=20
>>>>>>>> uniwill_led_channel_to_ac_reg[i], value);
>>>>>>> This is interesting. I am not sure which "control center"=20
>>>>>>> application you have looked at,
>>>>>>> but I found many lookup tables based on the exact model, etc.=20
>>>>>>> For example, on my laptop
>>>>>>> any value larger than 36 will simply turn that color component=20
>>>>>>> off. Have you seen
>>>>>>> anything like that?
>>>>>> I was using the Intel NUC studio software application during=20
>>>>>> reverse-engineering and had a user
>>>>>> test the resulting code on a Intel NUC notebook. AFAIK the OEM=20
>>>>>> software did not use a lookup table.
>>>>>>
>>>>>> If we extend this driver in the future then we might indeed use=20
>>>>>> the quirk system to change the max.
>>>>>> LED brightness depending on the model.
>>>>> I see. So everything up to 200 works. And after that do you know=20
>>>>> if it turns off or what happens?
>>>>
>>>> The user who tested the driver reported that "the brightest=20
>>>> lightbar setting is 200", so i assume
>>>> that the lightbar simply clamps the values. However i would not=20
>>>> trust the EC firmware in the slightest,
>>>> i can definitely imagine that other models react differently.
>>>
>>> Iirc at least for keyboard backlight on tf devices there was a value=
=20
>>> that could be overwritten to make the values 0-255 instead of 0-200,=
=20
>>> maybe this is also true for the lightbar, but i don't know if this=20
>>> affects the livespan of the leds.
>>>
>>> Best regards,
>>>
>>> Werner
>>>
>> Interesting, do you know the register offset of this value?
>
> Not out of my head, would have to dig for it again or even re reverse=20
> engineer it again as I'm not sure if I wrote it down ...
>
> So if it is not required I would like to leave it at that and only do=20
> the work if it turns out to be needed.
>
Fine with me.

>>
>> Thanks,
>> Armin Wolf
>>
>
