Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF932BF01D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867204; cv=none; b=hVFH5aa0Pv9Sa3VAgypZ4EsurKpkscHpoM+SqiGA+reeV1jGyomfqTqWTQZRZwGEQYa7P3Md6n3wvR/1hwOC1iXfKMT9mrSQhsb2OTdPure8qEB0RVKjWCnlyTrTIIyzAZfk3toJ0yHV11R6iDlfEIqfxonuOQk5n6p2OXEKN0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867204; c=relaxed/simple;
	bh=su17sUPbTTihtoANSksi5gs2STqWqgFLZmEBIWrX+M0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3Nn1QOR7JhWZVYfxtz/C6jXWtVdmYFqspmqqzIGLhl7ATAV2Hb5Sd4Fek85fea9OuLrIo3/9VLbnHfyo5U0XqCPk9JLx6B4Sx77C8m+jxUZ9dD+AF2TTKeX243jAs1/7QTgLMJboZxY0Q1dgslWPKJ5blmvozVZnmyo+Xx33e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mdHQ3UiX; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mdHQ3UiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750867198; x=1751126398;
	bh=shNZn9CXmtdijSV5B2iTzGkyqE9PqryKjvvVU2SZBJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mdHQ3UiXY6BBi7o7lhPhdQmYS1xVa7BKUue0t3kQx83eso4VAJem0MGLcTvlcy+kT
	 zZYTopNtwQC3vzUL3nGGi3h6wqNCv38VohFQf7WA34eV5H8WVIbjEG8iZGhPLe6ASP
	 o7wivKGO/ViKyvX64RkIMTZLyoVcvO0SibsMnREMGdYuIfri7Bs+g0BE07RP1nxduc
	 p+V0Py6yS4LVCARlZqvVL3uH+vSMC74maH5n6JxkjRIlVxTrtMAV36bqWtyA1skn6H
	 piurlqgf6FpdK6diJjfWgym2SkI6HakqFVQunSlSxor95rZY8MGHcJkpWXOgK1D2m3
	 S42mD3avKxy2g==
Date: Wed, 25 Jun 2025 15:59:52 +0000
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com
From: =?utf-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
Message-ID: <7a58972f-5256-4598-b729-224f20f3ecd2@protonmail.com>
In-Reply-To: <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
References: <20250615175957.9781-1-W_Armin@gmx.de> <20250615175957.9781-3-W_Armin@gmx.de> <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com> <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 08a42992ce2590e2577a89a797fe321dddbfa117
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

2025. 06. 23. 0:36 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
> Am 22.06.25 um 23:37 schrieb P=C5=91cze Barnab=C3=A1s:
>=20
>> Hi
>>
>>
>> 2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>>> interface to talk with the embedded controller, but relies on a
>>> DMI whitelist for autoloading since Uniwill just copied the WMI
>>> GUID from the Windows driver example.
>>>
>>> The driver is reverse-engineered based on the following information:
>>> - OEM software from intel
>>> - https://github.com/pobrn/qc71_laptop
>> Oh... I suppose an end of an era for me...
>=20
> I now remember that we interacted on the mailing lists before, sorry for =
not CCing
> you on this patch series.
>=20
> Do you want a Co-developed-by tag on those patches?

I'll leave it up to you.


>=20
>>> - https://github.com/tuxedocomputers/tuxedo-drivers
>>> - https://github.com/tuxedocomputers/tuxedo-control-center
>>>
>>> The underlying EC supports various features, including hwmon sensors,
>>> battery charge limiting, a RGB lightbar and keyboard-related controls.
>>>
>>> Reported-by: cyear <chumuzero@gmail.com>
>>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>     .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>>     Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>>>     MAINTAINERS                                   |    8 +
>>>     drivers/platform/x86/uniwill/Kconfig          |   17 +
>>>     drivers/platform/x86/uniwill/Makefile         |    1 +
>>>     drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 ++++++++++++++=
+++
>>>     drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>>     7 files changed, 1667 insertions(+), 1 deletion(-)
>>>     create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-l=
aptop
>>>     create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>>     create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>>
> [...]
>>> +
>>> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS]=
 =3D {
>>> +=09EC_ADDR_LIGHTBAR_BAT_RED,
>>> +=09EC_ADDR_LIGHTBAR_BAT_GREEN,
>>> +=09EC_ADDR_LIGHTBAR_BAT_BLUE,
>>> +};
>>> +
>>> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =
=3D {
>>> +=09EC_ADDR_LIGHTBAR_AC_RED,
>>> +=09EC_ADDR_LIGHTBAR_AC_GREEN,
>>> +=09EC_ADDR_LIGHTBAR_AC_BLUE,
>>> +};
>>> +
>>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, e=
num led_brightness brightness)
>>> +{
>>> +=09struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
>>> +=09struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniw=
ill_data, led_mc_cdev);
>>> +=09unsigned int value;
>>> +=09int ret;
>>> +
>>> +=09ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
>>> +=09=09/* Prevent the brightness values from overflowing */
>>> +=09=09value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].br=
ightness);
>>> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg=
[i], value);
>> This is interesting. I am not sure which "control center" application yo=
u have looked at,
>> but I found many lookup tables based on the exact model, etc. For exampl=
e, on my laptop
>> any value larger than 36 will simply turn that color component off. Have=
 you seen
>> anything like that?
>=20
> I was using the Intel NUC studio software application during reverse-engi=
neering and had a user
> test the resulting code on a Intel NUC notebook. AFAIK the OEM software d=
id not use a lookup table.
>=20
> If we extend this driver in the future then we might indeed use the quirk=
 system to change the max.
> LED brightness depending on the model.

I see. So everything up to 200 works. And after that do you know if it turn=
s off or what happens?



>=20
>>> +=09=09if (ret < 0)
>>> +=09=09=09return ret;
>>> +
>>> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_re=
g[i], value);
>>> +=09=09if (ret < 0)
>>> +=09=09=09return ret;
>>> +=09}
>>> +
>>> +=09if (brightness)
>>> +=09=09value =3D 0;
>>> +=09else
>>> +=09=09value =3D LIGHTBAR_S0_OFF;
>>> +
>>> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, =
LIGHTBAR_S0_OFF, value);
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, =
LIGHTBAR_S0_OFF, value);
>>> +}
>>> +
>>> +#define LIGHTBAR_MASK=09(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHT=
BAR_S3_OFF | LIGHTBAR_WELCOME)
>>> +
>>> +static int uniwill_led_init(struct uniwill_data *data)
>>> +{
>>> +=09struct led_init_data init_data =3D {
>>> +=09=09.devicename =3D DRIVER_NAME,
>>> +=09=09.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
>>> +=09=09.devname_mandatory =3D true,
>>> +=09};
>>> +=09unsigned int color_indices[3] =3D {
>>> +=09=09LED_COLOR_ID_RED,
>>> +=09=09LED_COLOR_ID_GREEN,
>>> +=09=09LED_COLOR_ID_BLUE,
>>> +=09};
>>> +=09unsigned int value;
>>> +=09int ret;
>>> +
>>> +=09if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
>>> +=09=09return 0;
>>> +
>>> +=09/*
>>> +=09 * The EC has separate lightbar settings for AC and battery mode,
>>> +=09 * so we have to ensure that both settings are the same.
>>> +=09 */
>>> +=09ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value)=
;
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09value |=3D LIGHTBAR_APP_EXISTS;
>>> +=09ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value)=
;
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09/*
>>> +=09 * The breathing animation during suspend is not supported when
>>> +=09 * running on battery power.
>>> +=09 */
>>> +=09value |=3D LIGHTBAR_S3_OFF;
>>> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL,=
 LIGHTBAR_MASK, value);
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
>>> +=09data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
>>> +=09data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>>> +=09data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_=
brightness_set;
>>> +
>>> +=09if (value & LIGHTBAR_S0_OFF)
>>> +=09=09data->led_mc_cdev.led_cdev.brightness =3D 0;
>>> +=09else
>>> +=09=09data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
>>> +
>>> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
>>> +=09=09data->led_mc_subled_info[i].color_index =3D color_indices[i];
>>> +
>>> +=09=09ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[=
i], &value);
>>> +=09=09if (ret < 0)
>>> +=09=09=09return ret;
>>> +
>>> +=09=09/*
>>> +=09=09 * Make sure that the initial intensity value is not greater tha=
n
>>> +=09=09 * the maximum brightness.
>>> +=09=09 */
>>> +=09=09value =3D min(LED_MAX_BRIGHTNESS, value);
>>> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg=
[i], value);
>>> +=09=09if (ret < 0)
>>> +=09=09=09return ret;
>>> +
>>> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_re=
g[i], value);
>>> +=09=09if (ret < 0)
>>> +=09=09=09return ret;
>>> +
>>> +=09=09data->led_mc_subled_info[i].intensity =3D value;
>>> +=09=09data->led_mc_subled_info[i].channel =3D i;
>>> +=09}
>>> +
>>> +=09data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
>>> +=09data->led_mc_cdev.num_colors =3D LED_CHANNELS;
>>> +
>>> +=09return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, =
&data->led_mc_cdev,
>>> +=09=09=09=09=09=09=09 &init_data);
>>> +}
>>> [...]
>>> +static const enum power_supply_property uniwill_properties[] =3D {
>>> +=09POWER_SUPPLY_PROP_HEALTH,
>>> +=09POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>>> +};
>>> +
>>> +static const struct power_supply_ext uniwill_extension =3D {
>>> +=09.name =3D DRIVER_NAME,
>>> +=09.properties =3D uniwill_properties,
>>> +=09.num_properties =3D ARRAY_SIZE(uniwill_properties),
>>> +=09.get_property =3D uniwill_get_property,
>>> +=09.set_property =3D uniwill_set_property,
>>> +=09.property_is_writeable =3D uniwill_property_is_writeable,
>>> +};
>>> +
>>> +static int uniwill_add_battery(struct power_supply *battery, struct ac=
pi_battery_hook *hook)
>> What is the motivation for supporting multiple batteries?
>> There is still just a single parameter in the EC/etc.
>=20
> I simply assume that devices using this EC interface will only ever suppo=
rt a single battery anyway,
> as the EC will be unable to handle more than that.

I see, I was just wondering if all this code is needed. But I suppose
you can't remove much more.


>=20
>>> +{
>>> +=09struct uniwill_data *data =3D container_of(hook, struct uniwill_dat=
a, hook);
>>> +=09struct uniwill_battery_entry *entry;
>>> +=09int ret;
>>> +
>>> +=09entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
>>> +=09if (!entry)
>>> +=09=09return -ENOMEM;
>>> +
>>> +=09ret =3D power_supply_register_extension(battery, &uniwill_extension=
, &data->wdev->dev, data);
>>> +=09if (ret < 0) {
>>> +=09=09kfree(entry);
>>> +=09=09return ret;
>>> +=09}
>>> +
>>> +=09scoped_guard(mutex, &data->battery_lock) {
>>> +=09=09entry->battery =3D battery;
>>> +=09=09list_add(&entry->head, &data->batteries);
>>> +=09}
>>> +
>>> +=09return 0;
>>> +}
>>> [...]
>>> +static int uniwill_ec_init(struct uniwill_data *data)
>>> +{
>>> +=09unsigned int value;
>>> +=09int ret;
>>> +
>>> +=09ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
>>> +
>>> +=09ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL=
_CTRL);
>> I think this might turn out to be problematic. If this is enabled, then =
multiple
>> things are not handled automatically. For example, keyboard backlight is=
 not handled
>> and as far as I can see, no `KEY_KBDILLUM{DOWN,UP}` are sent (events 0xb=
1, 0xb2). The
>> other thing is the "performance mode" button (event 0xb0). I don't see t=
hat these two
>> things would be handled in the driver.
>=20
> On the intel NUC notebooks the keyboard backlight is controlled by a sepa=
rate USB device,
> so the driver only has to forward the KEY_KBDILLUMTOGGLE event to userspa=
ce (the
> KEY_KBDILLUM{DOWN,UP} events are not supported on those devices). This ha=
ppens inside the
> uniwill-wmi driver.

An USB HID device controls the keyboard backlight on my laptop as well, but=
 the brightness
up/down requests arrive via this WMI mechanism.


>=20
> Once we add support for devices where the EC also controls the keyboard b=
acklight i will
> add support for those events. I am also planning to add support for the p=
erformance mode
> event later. Currently the EC does not change the performance mode itself=
 even when in
> automatic mode (at least on intel NUC notebooks).

Interesting, it does on mine...


>=20
> Since this driver relies on a DMI whitelist i think that we can safely ad=
d support for those
> feature later when new devices are added to those list.
>=20
>>> +=09if (ret < 0)
>>> +=09=09return ret;
>>> +
>>> +=09return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_m=
anual_control, data);
>>> +}
>>> +
> [...]
>>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>>> +{
>>> +=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>>> +=09=09return 0;
>>> +
>>> +=09/*
>>> +=09 * Save the current charge limit in order to restore it during resu=
me.
>>> +=09 * We cannot use the regmap code for that since this register needs=
 to
>>> +=09 * be declared as volatile due to CHARGE_CTRL_REACHED.
>>> +=09 */
>> What is the motivation for this? I found that this is not needed, I foun=
d that
>> the value is persistent.
>=20
> The OEM application i reverse-engineered did restore this value after a r=
esume, so
> i decided to replicate this behavior.

I suppose it can't hurt.


> [...]

Regards,
Barnab=C3=A1s P=C5=91cze

