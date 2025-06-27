Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C2262D14;
	Fri, 27 Jun 2025 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751065803; cv=none; b=I1X2SSXd2kXJ3kNtceKVSqIFLa8gqiUkW74X+xI0T7PnUvT+cc4K6tY5YUpZiiNXa/sSGkzXVXAKTars45Y6X4vXBhSD8K5QP1cVQdBdkPBLpFeEHhArzafcRCRUn6G3lYQQfYpID3CkOnrOJmgaUP8NL5ytiXlX4DBh2lXvBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751065803; c=relaxed/simple;
	bh=a5qV1ZzUtuWYcwKNjY1yORTn+Gc7HyPk6JoXVBM3RQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mofHwIOiuO/TfF3ZhMHeB5FiQTFhF8nti5XSCPADXR3msT+hZWaRAoys5VwyBACmA6gee3OWnnb7jasF2FogBV7y2WnCK3FWBNNhGg+MICt4fZNkOm8MWmBAwvP8/Ey2bs/gqpjy3HjLR/spQn4RsJxRqSsi5+wf8uVlLHeLJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QDkQ10nz; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QDkQ10nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751065798; x=1751670598; i=w_armin@gmx.de;
	bh=AT7x4FmskyQoSj0E9z7aFB2LxqvJFTIPMIPqwc9K1HM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QDkQ10nzJ4mf6uNC8kOnSVoJK2Gd7SAp/A2u2dyqhlE4+sFCE49mSVsoiLU3RMWS
	 HUETkyz6veLMFRb/6f+/o9yiICm4QQQRh5hv9tFLQWJOa0E9NQY3jR4NozbMpp4RC
	 VAs02yNro3IpY1QvbA+xjUD/i+fiuLbLvX9GJ1iPWcn/ToZMc8/RgJqTGorHsIixv
	 bW1rMJz2Bpszs7mbpsB56Ks4Ayzz73J7DUM/xXkyTWV+2FkqcOiov+7fELsQv66Zv
	 qzmR8zz55q2TE+4V6GthUgdwSoqIoPDI/3IXehmL/fwZJi67AOzUpX6nX67Oe0uAz
	 IbTr6dfM+sPQ8lqObQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1uWNc91nhM-00F3Eq; Sat, 28
 Jun 2025 01:09:58 +0200
Message-ID: <7b29df39-8146-4913-83ff-d71db26983c8@gmx.de>
Date: Sat, 28 Jun 2025 01:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: =?UTF-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com,
 corbet@lwn.net, cs@tuxedo.de, wse@tuxedocomputers.com,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com>
 <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
 <7a58972f-5256-4598-b729-224f20f3ecd2@protonmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7a58972f-5256-4598-b729-224f20f3ecd2@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s1ijSSP8GwLOpCwObGsCPumlbY7+MfPIOQIc6aCsPh2SLoPMIdc
 ZcDdin0UornAL+IAXIoF3jwc+xdVTHa5h6zmEsKxCmYPtDIjX27ifx3BfSiH1+qFFIEZPCe
 zDhZLtISp8UH9/q6wtNMqtzEKuRKA+fp3gyteqLOI8U6YCB2eU0Nkb8/Z0pJyCH3QhnpNXv
 0Tb0f3NfwAj35u90r5hsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cSeFMgmOx08=;X4UuRTgdGgiv/7LDsnpjBT8U8Bj
 n5K11M1dwHRcRjeSrNjxAr/4ksGgRmkQ3+ddxkaq5M0UBtf+R5Jvlo1MKumd8o/pnr28Pr63I
 1gxFznwdfSU0uxRhiVT3kXgtA2XUYsiyaMz5QM/Q9Z7AYXX0RnzGxM0QeSX4gQQ1E6ThGJ/z9
 +LX0X8nyQ5a81HJUkNDdqL/3H1i2gc21Ve/HpUulaDVWtgFugWXc51bqX1+EaYXBbaDEaxCWl
 rievkfsOaG1rWjL+ATk3e9zNSthuxgpEmfd1eEXIuYhN/KQw6zIM9y3TM9E2x4KIIAbtOuS1p
 1RZLpEyaWk1R811Ig4hTwXsKmfPbeHzKumzMUHsU+M6ELWEzvMslYuXaJdRzdLe2YkT60ixe5
 bflsk+XuZ9yy20AUVmiV7HWCW8Vd9QLiHdFSMTRnWMsIDsinqiA7KOjoMX1GGmPf2iF7kH43r
 DESsdo/38jJtkY/DxpJCYxSxlAaIX7XX1RKGwV8RhHFw/8F3fzw+xQw23Rm/R+3TVoECtqo32
 AJa9KxghPgxyiV7rJx2e8AWIa/JwC9fLHwFOXJe/G/bIhNPMGEkHKdMFQX4StWrFvu9NWXqlS
 t1WbE1V+r+F6GMP3Nhv2EPg/wZ9dE+nX0G75TySz677Gw3OwEkHbfBBxkWufKdXoCwhhdyCZ0
 bJMHhbdS6xkyL3NNBhAI2m+Wt6R4bG742EMmuC9Qle+e/d/zWOzjYGhHchn58BktcBOjZ7Vbo
 0rlgPWGIA2L8SPQcNJNtakqMgdCblVTUIHWO0Sir60Sl3coT9eJxsBrMsFSnxy8qbTDU31/3j
 6YPtBG+nbstERRkllQ8twfXBXaBgd/FhAq9hF5BPCFM+1qsWrsBdyRo1PgjaASHfGHFQcp2fZ
 mA1SlXofvynv0aytfr7KBAyEKK4k+/QCF5x4x5Oldi6hmq8gb2z55cxEX2X1Otm+vGdY1Ez1F
 92tU1CcnguWcFOvnNlXX0jouhtyVPbImmkCMM8miLx33T/NokpRYhGca+ljEV1f+lA0naq18U
 BarZ1UNeL98l7y84voJZcP7ogtOz+chNIXP8CtYvk9clzNkth91F9Rgk89gFrSc4bWciDhTTU
 dMeq3CbD/qHPglMzk9Ivcy1dC9Yl6Ilr2hmTTX1eOcUXkJj0+1pJRCHFTH5QdPMhhDmm6m0ex
 jDj9HYwciJGYo6SRwrlYQvvr80o82uZ11trb8IaVnjV1/91N37MWuHbMcIotPSF8v9NDorAVw
 22mYzmE4v9yMS/gAghivxgnUZtqjvIV65VwwV/fvQzsSn+puGr7ctIjw2aCRSO9eGDCRUDTop
 8baSylvxU4RvkdBez6MIJZVI2LdRzOyWiLoEH7Rzeyk4sPVtsbCBBM3g/0b1mkPqR4g8CecXg
 XDscepmpCjOo9QpFavH9lNCtbuS9C+fSUdjDvOc9tdxOtyXrOdxpCkuMPp9FHZlHf041okUUz
 NfeWqwlR4+wvs/tZKsKS3Kn8aNbbLsymaOKVZ+yfanIruo6ODyzQK39FWM6+IxQGeBqYTQsOc
 vxEB19PkSAGdCY1Y1yshh+MukYjFaTGF3lJ9Ou5LqWywDVt9TcpL8+RK216vqz82vKbxk5CaE
 wLRQNRBUzo8YsbOkWQKkUPy+3nbDmtlDtFzo6JYai02FwKNG/9nmahA4n4LgOqkkV9JHXk1i/
 DPM7yTo6aL371tVibL1B2X+ZRJVnZckCNk+hbQaT2vGyRJMGLG1bBPJFovDiV+/f0JQBnK9tF
 ECLv8mpLs10THJRVyvjCqC1En/q2FWLiXuiJhfbm5J/TESdR2VEYq2ZBTGbue5OvKOhg3MyLS
 OHZcRMjwLnipV4cF4H/BC4/KYVvLCHshueI/S9risMT6vjlBhRJdNrwttSHCAieDuDfHU37qE
 QZUYASCJpJbjT4a37Ar5kRF2TNhdnfRH1KQBO8bDgYcYmxNWYwrxTBy1TZBg/91nGRugo3NDg
 7Wip/TLiqJtPnvnlGTfGWjQy5RKEDxfMA7A7JrorkZx7lBC1aWvgfvuy7Qccq5+QUpvSTjvHQ
 f9O5IgLAAh4mi4HE7IJY1Zz+CgUQQf5dgLJ/1VFpIllFac3i0QGt/y1a2Yiei/iUioWGcdn0f
 dOVPThbNBrhKS+95O9g6pV9GqV0GNh1zMckD7F4LmTpGjzxRBzyHJWzpdbe9/16/Gk393D55f
 wQxA9h74YT0sl3+1uFl+2Xh0GM7tnSr1mthyxhtCyIuY7jOBILQa5doCw1JRoBg9t89fLpQYw
 NmGjLQF5sIB+oaFV5WTsPDTNQPmeZBe4kwuQrzgcbRt8StBquwlAIBaaxsD3sc4dNpqrAMveg
 908wMw+s2FLGa52qZxsdkYgFw+phR9SGaXaMktP7U5Q8/6ayaqUu/bB2gg8uNRViEmQNzIqkf
 NArPVWlRCajqbIMWLxaUQlhPd/t4qUC668hsnS7BMeg/ztSdrFvBKjo9GJGfCu6BiXiQDuo+q
 pcBEkK1hjoTLWg5gkPpTT1EF2q1CrboV0Jl34Eku+bZ1bi91Qkw+IRGtusAozLppUlRXyEDxg
 lwrGes/5ISMIOFLjd+NqyS1FVw4y3KEFjhdI7aSmE+ZOdjX07cc9xYobXQn5LU09mQrEdM4cG
 73Zjzib50GtJNvDip6v7NoVjQLB5oKgMP/1aWeVuvT9NheFGHcJ5SPgIca3IYIuOAvYwZlfeO
 TibE2NE0i/53zG3jGBj1wmOJ5DuyKvLwS7FlE4CddHmjHhGyGVaVzdG71jYLoZhkB3kmBe8xg
 9Szki8fyymHrbvCYmA0i3ilEBKWZzGoybr69AFPip34feHJSVi88KJSoXZQLeiJbu+AIbR7tY
 CMeoZLqayqPeaEUNlXxp6RS6q0EbCbOwI4FvIUUzQ4N/5nyLNroSYrOGTxQvSg/eus4+s4Xy6
 yhUHKdD3hdp9JSvoXg5mcv69GRZcgsxP8IgCrnxccgojXfSj8tT5GRMiHSHim+ZWqfPea3hFC
 F0SlY7b1zONRtC+Ufdgmnoj3RssQ1dysUUDRAig91bY/7bvbR/gnjFIWe3UwRUAixU331G5VW
 WTZD9C7hvgAo/MEsGpT87PkxroHcHJ5pcPuRkPrI8w6UXg0pzCAzD2cxlqrMUCTNYhDJ8ZgwP
 sGqUANAJnT4yCe+V/piAviYSo+CMfyEnNXiKYkipoO8pARv3TI4DR0COa8uAIypNWR2dXUoSe
 Ff9vNZk8+PzMDtPznv+7IQwG1VwvFNd59nL2wzM5SvadryMT1BBXNWrRRaCA/V3BXFrIEpNJh
 /ZRYQYrTwice4Gg1NGczckhp04wSvJXCdVp7PZwA1JJKSSbWjP+tgMWokFn3WlUz2aGw63DBq
 F3H4Z1sR32t902WvdAcGYp3607BVXcbLRkjKHtegSlqFmOTK9R/kha0p2u2st24Mqd83z9UjY
 n8gbkF8FrNxu487rIAHsf7g1pFl3D048fnJzivxyBdqdhOf2Wh+H0CgdiqZoIiEG9BK3Aavq/
 DwB5LROQRExqUfHwoD6KMmWerjMMK0otHjDtNUuslBlOqADOiGmfo+KJE/mwEE1AK6bp8HzQ6
 IQ==

Am 25.06.25 um 17:59 schrieb P=C5=91cze Barnab=C3=A1s:

> Hi
>
> 2025. 06. 23. 0:36 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>> Am 22.06.25 um 23:37 schrieb P=C5=91cze Barnab=C3=A1s:
>>
>>> Hi
>>>
>>>
>>> 2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>>>> interface to talk with the embedded controller, but relies on a
>>>> DMI whitelist for autoloading since Uniwill just copied the WMI
>>>> GUID from the Windows driver example.
>>>>
>>>> The driver is reverse-engineered based on the following information:
>>>> - OEM software from intel
>>>> - https://github.com/pobrn/qc71_laptop
>>> Oh... I suppose an end of an era for me...
>> I now remember that we interacted on the mailing lists before, sorry fo=
r not CCing
>> you on this patch series.
>>
>> Do you want a Co-developed-by tag on those patches?
> I'll leave it up to you.
>
>
>>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>>>
>>>> The underlying EC supports various features, including hwmon sensors,
>>>> battery charge limiting, a RGB lightbar and keyboard-related controls=
.
>>>>
>>>> Reported-by: cyear <chumuzero@gmail.com>
>>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>      .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>>>      Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>>>>      MAINTAINERS                                   |    8 +
>>>>      drivers/platform/x86/uniwill/Kconfig          |   17 +
>>>>      drivers/platform/x86/uniwill/Makefile         |    1 +
>>>>      drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++=
++++++
>>>>      drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>>>      7 files changed, 1667 insertions(+), 1 deletion(-)
>>>>      create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwil=
l-laptop
>>>>      create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>>>      create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>>>
>> [...]
>>>> +
>>>> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNEL=
S] =3D {
>>>> +	EC_ADDR_LIGHTBAR_BAT_RED,
>>>> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
>>>> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
>>>> +};
>>>> +
>>>> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS=
] =3D {
>>>> +	EC_ADDR_LIGHTBAR_AC_RED,
>>>> +	EC_ADDR_LIGHTBAR_AC_GREEN,
>>>> +	EC_ADDR_LIGHTBAR_AC_BLUE,
>>>> +};
>>>> +
>>>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev,=
 enum led_brightness brightness)
>>>> +{
>>>> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
>>>> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniw=
ill_data, led_mc_cdev);
>>>> +	unsigned int value;
>>>> +	int ret;
>>>> +
>>>> +	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>>>> +		/* Prevent the brightness values from overflowing */
>>>> +		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brig=
htness);
>>>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
>>> This is interesting. I am not sure which "control center" application =
you have looked at,
>>> but I found many lookup tables based on the exact model, etc. For exam=
ple, on my laptop
>>> any value larger than 36 will simply turn that color component off. Ha=
ve you seen
>>> anything like that?
>> I was using the Intel NUC studio software application during reverse-en=
gineering and had a user
>> test the resulting code on a Intel NUC notebook. AFAIK the OEM software=
 did not use a lookup table.
>>
>> If we extend this driver in the future then we might indeed use the qui=
rk system to change the max.
>> LED brightness depending on the model.
> I see. So everything up to 200 works. And after that do you know if it t=
urns off or what happens?

The user who tested the driver reported that "the brightest lightbar setti=
ng is 200", so i assume
that the lightbar simply clamps the values. However i would not trust the =
EC firmware in the slightest,
i can definitely imagine that other models react differently.

>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	if (brightness)
>>>> +		value =3D 0;
>>>> +	else
>>>> +		value =3D LIGHTBAR_S0_OFF;
>>>> +
>>>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, =
LIGHTBAR_S0_OFF, value);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, =
LIGHTBAR_S0_OFF, value);
>>>> +}
>>>> +
>>>> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHT=
BAR_S3_OFF | LIGHTBAR_WELCOME)
>>>> +
>>>> +static int uniwill_led_init(struct uniwill_data *data)
>>>> +{
>>>> +	struct led_init_data init_data =3D {
>>>> +		.devicename =3D DRIVER_NAME,
>>>> +		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
>>>> +		.devname_mandatory =3D true,
>>>> +	};
>>>> +	unsigned int color_indices[3] =3D {
>>>> +		LED_COLOR_ID_RED,
>>>> +		LED_COLOR_ID_GREEN,
>>>> +		LED_COLOR_ID_BLUE,
>>>> +	};
>>>> +	unsigned int value;
>>>> +	int ret;
>>>> +
>>>> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
>>>> +		return 0;
>>>> +
>>>> +	/*
>>>> +	 * The EC has separate lightbar settings for AC and battery mode,
>>>> +	 * so we have to ensure that both settings are the same.
>>>> +	 */
>>>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value)=
;
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	value |=3D LIGHTBAR_APP_EXISTS;
>>>> +	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value)=
;
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	/*
>>>> +	 * The breathing animation during suspend is not supported when
>>>> +	 * running on battery power.
>>>> +	 */
>>>> +	value |=3D LIGHTBAR_S3_OFF;
>>>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL,=
 LIGHTBAR_MASK, value);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
>>>> +	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
>>>> +	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>>>> +	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_=
brightness_set;
>>>> +
>>>> +	if (value & LIGHTBAR_S0_OFF)
>>>> +		data->led_mc_cdev.led_cdev.brightness =3D 0;
>>>> +	else
>>>> +		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
>>>> +
>>>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>>>> +		data->led_mc_subled_info[i].color_index =3D color_indices[i];
>>>> +
>>>> +		ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i]=
, &value);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		/*
>>>> +		 * Make sure that the initial intensity value is not greater than
>>>> +		 * the maximum brightness.
>>>> +		 */
>>>> +		value =3D min(LED_MAX_BRIGHTNESS, value);
>>>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		data->led_mc_subled_info[i].intensity =3D value;
>>>> +		data->led_mc_subled_info[i].channel =3D i;
>>>> +	}
>>>> +
>>>> +	data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
>>>> +	data->led_mc_cdev.num_colors =3D LED_CHANNELS;
>>>> +
>>>> +	return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, =
&data->led_mc_cdev,
>>>> +							 &init_data);
>>>> +}
>>>> [...]
>>>> +static const enum power_supply_property uniwill_properties[] =3D {
>>>> +	POWER_SUPPLY_PROP_HEALTH,
>>>> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>>>> +};
>>>> +
>>>> +static const struct power_supply_ext uniwill_extension =3D {
>>>> +	.name =3D DRIVER_NAME,
>>>> +	.properties =3D uniwill_properties,
>>>> +	.num_properties =3D ARRAY_SIZE(uniwill_properties),
>>>> +	.get_property =3D uniwill_get_property,
>>>> +	.set_property =3D uniwill_set_property,
>>>> +	.property_is_writeable =3D uniwill_property_is_writeable,
>>>> +};
>>>> +
>>>> +static int uniwill_add_battery(struct power_supply *battery, struct =
acpi_battery_hook *hook)
>>> What is the motivation for supporting multiple batteries?
>>> There is still just a single parameter in the EC/etc.
>> I simply assume that devices using this EC interface will only ever sup=
port a single battery anyway,
>> as the EC will be unable to handle more than that.
> I see, I was just wondering if all this code is needed. But I suppose
> you can't remove much more.
>
>
>>>> +{
>>>> +	struct uniwill_data *data =3D container_of(hook, struct uniwill_dat=
a, hook);
>>>> +	struct uniwill_battery_entry *entry;
>>>> +	int ret;
>>>> +
>>>> +	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
>>>> +	if (!entry)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	ret =3D power_supply_register_extension(battery, &uniwill_extension=
, &data->wdev->dev, data);
>>>> +	if (ret < 0) {
>>>> +		kfree(entry);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	scoped_guard(mutex, &data->battery_lock) {
>>>> +		entry->battery =3D battery;
>>>> +		list_add(&entry->head, &data->batteries);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> [...]
>>>> +static int uniwill_ec_init(struct uniwill_data *data)
>>>> +{
>>>> +	unsigned int value;
>>>> +	int ret;
>>>> +
>>>> +	ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
>>>> +
>>>> +	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL=
_CTRL);
>>> I think this might turn out to be problematic. If this is enabled, the=
n multiple
>>> things are not handled automatically. For example, keyboard backlight =
is not handled
>>> and as far as I can see, no `KEY_KBDILLUM{DOWN,UP}` are sent (events 0=
xb1, 0xb2). The
>>> other thing is the "performance mode" button (event 0xb0). I don't see=
 that these two
>>> things would be handled in the driver.
>> On the intel NUC notebooks the keyboard backlight is controlled by a se=
parate USB device,
>> so the driver only has to forward the KEY_KBDILLUMTOGGLE event to users=
pace (the
>> KEY_KBDILLUM{DOWN,UP} events are not supported on those devices). This =
happens inside the
>> uniwill-wmi driver.
> An USB HID device controls the keyboard backlight on my laptop as well, =
but the brightness
> up/down requests arrive via this WMI mechanism.

Alright, i will add support for those two events as well. Maybe this helps=
 when adding new devices
to this driver in the future.

Thanks,
Armin Wolf

>> Once we add support for devices where the EC also controls the keyboard=
 backlight i will
>> add support for those events. I am also planning to add support for the=
 performance mode
>> event later. Currently the EC does not change the performance mode itse=
lf even when in
>> automatic mode (at least on intel NUC notebooks).
> Interesting, it does on mine...
>
>
>> Since this driver relies on a DMI whitelist i think that we can safely =
add support for those
>> feature later when new devices are added to those list.
>>
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_m=
anual_control, data);
>>>> +}
>>>> +
>> [...]
>>>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>>>> +{
>>>> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>>> +		return 0;
>>>> +
>>>> +	/*
>>>> +	 * Save the current charge limit in order to restore it during resu=
me.
>>>> +	 * We cannot use the regmap code for that since this register needs=
 to
>>>> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
>>>> +	 */
>>> What is the motivation for this? I found that this is not needed, I fo=
und that
>>> the value is persistent.
>> The OEM application i reverse-engineered did restore this value after a=
 resume, so
>> i decided to replicate this behavior.
> I suppose it can't hurt.
>
>
>> [...]
> Regards,
> Barnab=C3=A1s P=C5=91cze
>
>
