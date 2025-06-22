Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576241A0B08
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628277; cv=none; b=Oi7plPeIfEWfK5RveT4LKiQfEpwUeu34OQzj2b0M36hQIP0N3fSaVs4IH1mGt+318cbKdbgm/f22mFUNvqAJKvBvZY2khGp1LxNobgYNyOo83DYdIPNfG6Tn+WL4E51ogVYo3cc9AWPExi+SgxVrhtLuuxMzx8wbzWvghu/vW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628277; c=relaxed/simple;
	bh=iij5W29S0RnK64VJObl7QuizgCRg7aJRp/hzbO2UItQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmpqTqEmIlJANxpZmeHiAM+jaw+Y9QfiBPpee14MZywy6QBZSFytamFJ70lqZCDzcPHJ4LBzzzOJaCphMuy9rmakQektGIzT+a+Q33pZRkfRtTGDwpEtp5raqwzS8v5KLks+vdPr6IaTzhICia+nTbdEQRPbgrzlUfpKsNeYcDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IU9aUsFX; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IU9aUsFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750628267; x=1750887467;
	bh=Pbmp8HqizDKJzUdTjFRuBdJ5UVOaulxpLYc6roD53AQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IU9aUsFXuEXgD394hmhTMEyB1zmQNVOO+53HMIUfy0T+6PRFkQY+1zFYoIKBdsPV5
	 eNJhgKaKARvEpvivgGWS8CfNtoHIL+KLOFRkC/M3FKQ3N/hh+hKNwsXO0uO1s3Fc92
	 bdIeoYPLdYwJ/t1aOfNq03U9ec0m3r2dbQ6mU7GW3fHiPDc30nwsM6I/R1PVsnnG+m
	 cIomxMVAr0RSmYRQuXKWCikeowOChH2EiF9v59Ui6xjmbmlLHWJltYMjppnE7ugxMI
	 TYnSpTgBvVVxnNZOzd31XkuNIt8w5VIPl6FX8aaY8F8QPl3PEtA7+1+3T4zgUMr59Z
	 JkmirUTQTrHHg==
Date: Sun, 22 Jun 2025 21:37:41 +0000
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com
From: =?utf-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
Message-ID: <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com>
In-Reply-To: <20250615175957.9781-3-W_Armin@gmx.de>
References: <20250615175957.9781-1-W_Armin@gmx.de> <20250615175957.9781-3-W_Armin@gmx.de>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 78d2262276645f2c1bfc7cdbd8e2ea8e225f9d99
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi


2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
> interface to talk with the embedded controller, but relies on a
> DMI whitelist for autoloading since Uniwill just copied the WMI
> GUID from the Windows driver example.
>=20
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://github.com/pobrn/qc71_laptop

Oh... I suppose an end of an era for me...


> - https://github.com/tuxedocomputers/tuxedo-drivers
> - https://github.com/tuxedocomputers/tuxedo-control-center
>=20
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
>=20
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>   MAINTAINERS                                   |    8 +
>   drivers/platform/x86/uniwill/Kconfig          |   17 +
>   drivers/platform/x86/uniwill/Makefile         |    1 +
>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>   7 files changed, 1667 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-lapto=
p
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docu=
mentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..a4781a118906
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> [...]
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation=
/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..2be598030a5e
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Uniwill WMI Notebook driver (uniwill-laptop)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provi=
de an WMI-based
> +EC interface for controlling various platform settings like sensors and =
fan control.
> +This interface is used by the ``uniwill-laptop`` driver to map those fea=
tures onto standard
> +kernel interfaces.
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +The WMI interface description can be decoded from the embedded binary MO=
F (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class used to operate methods on a ULong"),
> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_MULong {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Return the c=
ontents of a ULong")]
> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(2), Implemented, read, write, Description("Set the cont=
ents of a ULong")]
> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(3), Implemented, read, write,
> +     Description("Generate an event containing ULong data")]
> +    void FireULong([in, Description("WMI requires a parameter")] uint32 =
Hack);
> +
> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Set =
the contents of a ULong")]
> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
> +                     [out, Description("Ulong Data")] uint32 Return);
> +
> +    [WmiMethodId(5), Implemented, read, write,
> +     Description("Get and Set the contents of a ULong for Dollby button"=
)]
> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
> +                   [out, Description("Ulong Data")] uint32 Return);
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples,=
 which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for au=
toloading.
> +
> +WMI method GetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no fu=
nction.
> +
> +WMI method SetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no fu=
nction.
> +
> +WMI method FireULong()
> +----------------------
> +
> +This WMI method allows to inject a WMI event with a 32-bit payload. Its =
primary purpose seems
> +to be debugging.
> +
> +WMI method GetSetULong()
> +------------------------
> +
> +This WMI method is used to communicate with the EC. The ``Data`` argumen=
t hold the following
> +information (starting with the least significant byte):
> +
> +1. 16-bit address
> +2. 16-bit data (set to ``0x0000`` when reading)
> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
> +4. 16-bit reserved (set to ``0x0000``)
> +
> +The first 8 bits of the ``Return`` value contain the data returned by th=
e EC when reading.
> +The special value ``0xFEFEFEFE`` is used to indicate a communication fai=
lure with the EC.

I think that should be 0xFEFEFEFEFEFEFEFE.


> +
> +WMI method GetButton()
> +----------------------
> +
> +This WMI method is not implemented on all machines and has an unknown pu=
rpose.
> +
> +Reverse-Engineering the Uniwill WMI interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. warning:: Randomly poking the EC can potentially cause damage to the =
machine and other unwanted
> +             side effects, please be careful.
> +
> +The EC behind the ``GetSetULong`` method is used by the OEM software sup=
plied by the manufacturer.
> +Reverse-engineering of this software is difficult since it uses an obfus=
cator, however some parts
> +are not obfuscated.

I used https://github.com/dnSpy/dnSpy to attach to it when running, which m=
ade
it quite simple to access the underlying byte code. Of course if you don't =
have
the hardware, then that is difficult to do...


> +
> +The EC can be accessed under Windows using powershell (requires admin pr=
ivileges):
> +
> +::
> +
> +  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MUL=
ong | Select-Object -First 1
> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Argument=
s @{Data =3D <input>}
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which th=
is driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ pa=
ckage which also served as
> +a foundation for this driver.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 53876ec2d111..5b12cc498d56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25496,6 +25496,14 @@ L:=09linux-scsi@vger.kernel.org
>   S:=09Maintained
>   F:=09drivers/ufs/host/ufs-renesas.c
>=20
> +UNIWILL LAPTOP DRIVER
> +M:=09Armin Wolf <W_Armin@gmx.de>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:=09Documentation/wmi/devices/uniwill-laptop.rst
> +F:=09drivers/platform/x86/uniwill/uniwill-laptop.c
> +
>   UNIWILL WMI DRIVER
>   M:=09Armin Wolf <W_Armin@gmx.de>
>   L:=09platform-driver-x86@vger.kernel.org
> [...]
> +
> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] =
=3D {
> +=09EC_ADDR_LIGHTBAR_BAT_RED,
> +=09EC_ADDR_LIGHTBAR_BAT_GREEN,
> +=09EC_ADDR_LIGHTBAR_BAT_BLUE,
> +};
> +
> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =
=3D {
> +=09EC_ADDR_LIGHTBAR_AC_RED,
> +=09EC_ADDR_LIGHTBAR_AC_GREEN,
> +=09EC_ADDR_LIGHTBAR_AC_BLUE,
> +};
> +
> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enu=
m led_brightness brightness)
> +{
> +=09struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +=09struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwil=
l_data, led_mc_cdev);
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
> +=09=09/* Prevent the brightness values from overflowing */
> +=09=09value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brig=
htness);
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);

This is interesting. I am not sure which "control center" application you h=
ave looked at,
but I found many lookup tables based on the exact model, etc. For example, =
on my laptop
any value larger than 36 will simply turn that color component off. Have yo=
u seen
anything like that?


> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}
> +
> +=09if (brightness)
> +=09=09value =3D 0;
> +=09else
> +=09=09value =3D LIGHTBAR_S0_OFF;
> +
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S0_OFF, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LI=
GHTBAR_S0_OFF, value);
> +}
> +
> +#define LIGHTBAR_MASK=09(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBA=
R_S3_OFF | LIGHTBAR_WELCOME)
> +
> +static int uniwill_led_init(struct uniwill_data *data)
> +{
> +=09struct led_init_data init_data =3D {
> +=09=09.devicename =3D DRIVER_NAME,
> +=09=09.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
> +=09=09.devname_mandatory =3D true,
> +=09};
> +=09unsigned int color_indices[3] =3D {
> +=09=09LED_COLOR_ID_RED,
> +=09=09LED_COLOR_ID_GREEN,
> +=09=09LED_COLOR_ID_BLUE,
> +=09};
> +=09unsigned int value;
> +=09int ret;
> +
> +=09if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +=09=09return 0;
> +
> +=09/*
> +=09 * The EC has separate lightbar settings for AC and battery mode,
> +=09 * so we have to ensure that both settings are the same.
> +=09 */
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09value |=3D LIGHTBAR_APP_EXISTS;
> +=09ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09/*
> +=09 * The breathing animation during suspend is not supported when
> +=09 * running on battery power.
> +=09 */
> +=09value |=3D LIGHTBAR_S3_OFF;
> +=09ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_MASK, value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
> +=09data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
> +=09data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
> +=09data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
> +
> +=09if (value & LIGHTBAR_S0_OFF)
> +=09=09data->led_mc_cdev.led_cdev.brightness =3D 0;
> +=09else
> +=09=09data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
> +
> +=09for (int i =3D 0; i < LED_CHANNELS; i++) {
> +=09=09data->led_mc_subled_info[i].color_index =3D color_indices[i];
> +
> +=09=09ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i]=
, &value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09/*
> +=09=09 * Make sure that the initial intensity value is not greater than
> +=09=09 * the maximum brightness.
> +=09=09 */
> +=09=09value =3D min(LED_MAX_BRIGHTNESS, value);
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[=
i], value);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09data->led_mc_subled_info[i].intensity =3D value;
> +=09=09data->led_mc_subled_info[i].channel =3D i;
> +=09}
> +
> +=09data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
> +=09data->led_mc_cdev.num_colors =3D LED_CHANNELS;
> +
> +=09return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, &d=
ata->led_mc_cdev,
> +=09=09=09=09=09=09=09 &init_data);
> +}
> [...]
> +static const enum power_supply_property uniwill_properties[] =3D {
> +=09POWER_SUPPLY_PROP_HEALTH,
> +=09POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext uniwill_extension =3D {
> +=09.name =3D DRIVER_NAME,
> +=09.properties =3D uniwill_properties,
> +=09.num_properties =3D ARRAY_SIZE(uniwill_properties),
> +=09.get_property =3D uniwill_get_property,
> +=09.set_property =3D uniwill_set_property,
> +=09.property_is_writeable =3D uniwill_property_is_writeable,
> +};
> +
> +static int uniwill_add_battery(struct power_supply *battery, struct acpi=
_battery_hook *hook)

What is the motivation for supporting multiple batteries?
There is still just a single parameter in the EC/etc.


> +{
> +=09struct uniwill_data *data =3D container_of(hook, struct uniwill_data,=
 hook);
> +=09struct uniwill_battery_entry *entry;
> +=09int ret;
> +
> +=09entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> +=09if (!entry)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D power_supply_register_extension(battery, &uniwill_extension, =
&data->wdev->dev, data);
> +=09if (ret < 0) {
> +=09=09kfree(entry);
> +=09=09return ret;
> +=09}
> +
> +=09scoped_guard(mutex, &data->battery_lock) {
> +=09=09entry->battery =3D battery;
> +=09=09list_add(&entry->head, &data->batteries);
> +=09}
> +
> +=09return 0;
> +}
> [...]
> +static int uniwill_ec_init(struct uniwill_data *data)
> +{
> +=09unsigned int value;
> +=09int ret;
> +
> +=09ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
> +
> +=09ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_C=
TRL);

I think this might turn out to be problematic. If this is enabled, then mul=
tiple
things are not handled automatically. For example, keyboard backlight is no=
t handled
and as far as I can see, no `KEY_KBDILLUM{DOWN,UP}` are sent (events 0xb1, =
0xb2). The
other thing is the "performance mode" button (event 0xb0). I don't see that=
 these two
things would be handled in the driver.


> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_man=
ual_control, data);
> +}
> +
> +static int uniwill_probe(struct wmi_device *wdev, const void *context)
> +{
> +=09struct uniwill_data *data;
> +=09struct regmap *regmap;
> +=09int ret;
> +
> +=09data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09data->wdev =3D wdev;
> +=09dev_set_drvdata(&wdev->dev, data);
> +
> +=09regmap =3D devm_regmap_init(&wdev->dev, &uniwill_ec_bus, data, &uniwi=
ll_ec_config);
> +=09if (IS_ERR(regmap))
> +=09=09return PTR_ERR(regmap);
> +
> +=09data->regmap =3D regmap;
> +=09ret =3D devm_mutex_init(&wdev->dev, &data->super_key_lock);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_ec_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_battery_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_led_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D uniwill_hwmon_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return uniwill_notifier_init(data);
> +}
> +
> +static void uniwill_shutdown(struct wmi_device *wdev)
> +{
> +=09struct uniwill_data *data =3D dev_get_drvdata(&wdev->dev);
> +
> +=09regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +=09if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
> +=09=09return 0;
> +
> +=09/*
> +=09 * The EC_ADDR_SWITCH_STATUS is maked as volatile, so we have to rest=
ore it
> +=09 * ourself.
> +=09 */
> +=09return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_s=
witch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +=09=09return 0;
> +
> +=09/*
> +=09 * Save the current charge limit in order to restore it during resume=
.
> +=09 * We cannot use the regmap code for that since this register needs t=
o
> +=09 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +=09 */

What is the motivation for this? I found that this is not needed, I found t=
hat
the value is persistent.



> +=09return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_cha=
rge_ctrl);
> +}
> [...]
>=20


Regards,
Barnab=C3=A1s P=C5=91cze

