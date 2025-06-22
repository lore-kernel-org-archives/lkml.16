Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFC18A6A7;
	Sun, 22 Jun 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750631827; cv=none; b=Lq4p91/SGWjCfM97dzt1VpRzN7lPDWkETpfqV3erqLDEUAN1xyzXx2TD9qI7YgdsLTH3DA290Ef0R4VMXGoXTLUU3klO1GDxZeOk1hEYQCN76n/J/XFqYOmIwbS9Lp3TrTu7MBm6kFBM2HuyiFZmqjg55V3HpQ7N3HEf2KmfJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750631827; c=relaxed/simple;
	bh=UL7scH5J7lveeZwRp/OQ/VtygU0et1+8DUrAesLtu2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKgZG3N9bzrqMqfq6sjQ9l0FEahDlYMk590E1j/JoYFfkJQvBkPw/n2F86c7hsuQMOKFskU2PHh9wxSDBf+apryCcWnOsQBYj1R9fCUNzhJyBh+sEL35R73VnSurf1tXX8wV3+UL/EiTFYqGZBrEzJmRHTW0lPzSXqKb0eSw3ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XKUaG8Vr; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XKUaG8Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750631822; x=1751236622; i=w_armin@gmx.de;
	bh=Oq/HLffwzvcsehR2cbdzAiKmAVESi+0nM4hDB0K6WZw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XKUaG8VrVUJT0DLInPbg4iklp2SARv1GpIj+NEuGEWfrFxkVuXOdgt8/zjJRFp09
	 ClFKx+B9jvxKrk25DaY10P2b/PQBwNeR0MuDMSXCJaLv5xnm0jom9ksokNvM4XXGm
	 IOK0cHaEMN5SXLQxn1d+JOME1k/wYITzRUzv4PozxOab5s5cZSnHRIla3U3axVwLL
	 mwyULBDfJa78yvLiJjiOrts+XVy4auW30DXif8rijk4e/7V7lH0IM2g0vpdvdGr5d
	 P393qjtx9OYZd0wWj7h6gyGd65kDiGJM+gJzftC5RUTTRcBIasuRr+ThIwFTAyCRT
	 9xUSVD21v8sB1Km/LA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dwd-1uqp3o3GBZ-017zRP; Mon, 23
 Jun 2025 00:37:02 +0200
Message-ID: <7b0243fd-15c6-42da-8570-9ad9cd5163af@gmx.de>
Date: Mon, 23 Jun 2025 00:36:59 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <1b79a3c3-c493-471b-aa37-92458b356e8d@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zC1iHrhRx7zhCMvsyJIIM5FR/ENCJ12v2/V9yhFDljELymvFKVd
 TANxKdPvHdFvy2y3JU1hiKjxFbKUNI7T0erKdfrmXdiJJtYmLMvykRbjt3GfkfToLRghaLI
 3SFX+LcP86gjfCuFtNhzY8hK8hd3/7NBt+SxGzaVdfQq+CRABiXCuRJQwi3Jww1SZNL6LY9
 MiWcbmV32IqrUVBu8Dh/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:25lbs0MMO1E=;J1pTzrMpCAUgwuqPCnIV0ZnfTT/
 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
 0NMPFs2

Am 22.06.25 um 23:37 schrieb P=C5=91cze Barnab=C3=A1s:

> Hi
>
>
> 2025. 06. 15. 19:59 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
>> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
>> interface to talk with the embedded controller, but relies on a
>> DMI whitelist for autoloading since Uniwill just copied the WMI
>> GUID from the Windows driver example.
>>
>> The driver is reverse-engineered based on the following information:
>> - OEM software from intel
>> - https://github.com/pobrn/qc71_laptop
> Oh... I suppose an end of an era for me...

I now remember that we interacted on the mailing lists before, sorry for n=
ot CCing
you on this patch series.

Do you want a Co-developed-by tag on those patches?

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
>>    .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>>    Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>>    MAINTAINERS                                   |    8 +
>>    drivers/platform/x86/uniwill/Kconfig          |   17 +
>>    drivers/platform/x86/uniwill/Makefile         |    1 +
>>    drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++=
++
>>    drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>>    7 files changed, 1667 insertions(+), 1 deletion(-)
>>    create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-la=
ptop
>>    create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>>    create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/testing/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..a4781a118906
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> [...]
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentati=
on/wmi/devices/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..2be598030a5e
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -0,0 +1,109 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill WMI Notebook driver (uniwill-laptop)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM) pro=
vide an WMI-based
>> +EC interface for controlling various platform settings like sensors an=
d fan control.
>> +This interface is used by the ``uniwill-laptop`` driver to map those f=
eatures onto standard
>> +kernel interfaces.
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>> +
>> +::
>> +
>> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +   Description("Class used to operate methods on a ULong"),
>> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
>> +  class AcpiTest_MULong {
>> +    [key, read] string InstanceName;
>> +    [read] boolean Active;
>> +
>> +    [WmiMethodId(1), Implemented, read, write, Description("Return the=
 contents of a ULong")]
>> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(2), Implemented, read, write, Description("Set the co=
ntents of a ULong")]
>> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
>> +
>> +    [WmiMethodId(3), Implemented, read, write,
>> +     Description("Generate an event containing ULong data")]
>> +    void FireULong([in, Description("WMI requires a parameter")] uint3=
2 Hack);
>> +
>> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Se=
t the contents of a ULong")]
>> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
>> +                     [out, Description("Ulong Data")] uint32 Return);
>> +
>> +    [WmiMethodId(5), Implemented, read, write,
>> +     Description("Get and Set the contents of a ULong for Dollby butto=
n")]
>> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
>> +                   [out, Description("Ulong Data")] uint32 Return);
>> +  };
>> +
>> +Most of the WMI-related code was copied from the Windows driver sample=
s, which unfortunately means
>> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for =
autoloading.
>> +
>> +WMI method GetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method SetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has no =
function.
>> +
>> +WMI method FireULong()
>> +----------------------
>> +
>> +This WMI method allows to inject a WMI event with a 32-bit payload. It=
s primary purpose seems
>> +to be debugging.
>> +
>> +WMI method GetSetULong()
>> +------------------------
>> +
>> +This WMI method is used to communicate with the EC. The ``Data`` argum=
ent hold the following
>> +information (starting with the least significant byte):
>> +
>> +1. 16-bit address
>> +2. 16-bit data (set to ``0x0000`` when reading)
>> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing=
)
>> +4. 16-bit reserved (set to ``0x0000``)
>> +
>> +The first 8 bits of the ``Return`` value contain the data returned by =
the EC when reading.
>> +The special value ``0xFEFEFEFE`` is used to indicate a communication f=
ailure with the EC.
> I think that should be 0xFEFEFEFEFEFEFEFE.

The ACPI firmware itself indeed returns 0xFEFEFEFEFEFEFEFE, but the WMI me=
thod itself only returns
a 32-bit value. This is the reason why i am only checking for 0xFEFEFEFE.

>> +
>> +WMI method GetButton()
>> +----------------------
>> +
>> +This WMI method is not implemented on all machines and has an unknown =
purpose.
>> +
>> +Reverse-Engineering the Uniwill WMI interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. warning:: Randomly poking the EC can potentially cause damage to th=
e machine and other unwanted
>> +             side effects, please be careful.
>> +
>> +The EC behind the ``GetSetULong`` method is used by the OEM software s=
upplied by the manufacturer.
>> +Reverse-engineering of this software is difficult since it uses an obf=
uscator, however some parts
>> +are not obfuscated.
> I used https://github.com/dnSpy/dnSpy to attach to it when running, whic=
h made
> it quite simple to access the underlying byte code. Of course if you don=
't have
> the hardware, then that is difficult to do...

Interesting, i will add that to the documentation as well.

>> +
>> +The EC can be accessed under Windows using powershell (requires admin =
privileges):
>> +
>> +::
>> +
>> +  > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_M=
ULong | Select-Object -First 1
>> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Argume=
nts @{Data =3D <input>}
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which =
this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ =
package which also served as
>> +a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 53876ec2d111..5b12cc498d56 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
>>    S:	Maintained
>>    F:	drivers/ufs/host/ufs-renesas.c
>>
>> +UNIWILL LAPTOP DRIVER
>> +M:	Armin Wolf <W_Armin@gmx.de>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +F:	Documentation/wmi/devices/uniwill-laptop.rst
>> +F:	drivers/platform/x86/uniwill/uniwill-laptop.c
>> +
>>    UNIWILL WMI DRIVER
>>    M:	Armin Wolf <W_Armin@gmx.de>
>>    L:	platform-driver-x86@vger.kernel.org
>> [...]
>> +
>> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS]=
 =3D {
>> +	EC_ADDR_LIGHTBAR_BAT_RED,
>> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
>> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
>> +};
>> +
>> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] =
=3D {
>> +	EC_ADDR_LIGHTBAR_AC_RED,
>> +	EC_ADDR_LIGHTBAR_AC_GREEN,
>> +	EC_ADDR_LIGHTBAR_AC_BLUE,
>> +};
>> +
>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, e=
num led_brightness brightness)
>> +{
>> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
>> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwil=
l_data, led_mc_cdev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +		/* Prevent the brightness values from overflowing */
>> +		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].bright=
ness);
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
> This is interesting. I am not sure which "control center" application yo=
u have looked at,
> but I found many lookup tables based on the exact model, etc. For exampl=
e, on my laptop
> any value larger than 36 will simply turn that color component off. Have=
 you seen
> anything like that?

I was using the Intel NUC studio software application during reverse-engin=
eering and had a user
test the resulting code on a Intel NUC notebook. AFAIK the OEM software di=
d not use a lookup table.

If we extend this driver in the future then we might indeed use the quirk =
system to change the max.
LED brightness depending on the model.

>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i]=
, value);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	if (brightness)
>> +		value =3D 0;
>> +	else
>> +		value =3D LIGHTBAR_S0_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_S0_OFF, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LI=
GHTBAR_S0_OFF, value);
>> +}
>> +
>> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBA=
R_S3_OFF | LIGHTBAR_WELCOME)
>> +
>> +static int uniwill_led_init(struct uniwill_data *data)
>> +{
>> +	struct led_init_data init_data =3D {
>> +		.devicename =3D DRIVER_NAME,
>> +		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
>> +		.devname_mandatory =3D true,
>> +	};
>> +	unsigned int color_indices[3] =3D {
>> +		LED_COLOR_ID_RED,
>> +		LED_COLOR_ID_GREEN,
>> +		LED_COLOR_ID_BLUE,
>> +	};
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
>> +		return 0;
>> +
>> +	/*
>> +	 * The EC has separate lightbar settings for AC and battery mode,
>> +	 * so we have to ensure that both settings are the same.
>> +	 */
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	value |=3D LIGHTBAR_APP_EXISTS;
>> +	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/*
>> +	 * The breathing animation during suspend is not supported when
>> +	 * running on battery power.
>> +	 */
>> +	value |=3D LIGHTBAR_S3_OFF;
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_MASK, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
>> +	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
>> +	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>> +	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
>> +
>> +	if (value & LIGHTBAR_S0_OFF)
>> +		data->led_mc_cdev.led_cdev.brightness =3D 0;
>> +	else
>> +		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
>> +
>> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +		data->led_mc_subled_info[i].color_index =3D color_indices[i];
>> +
>> +		ret =3D regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], =
&value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/*
>> +		 * Make sure that the initial intensity value is not greater than
>> +		 * the maximum brightness.
>> +		 */
>> +		value =3D min(LED_MAX_BRIGHTNESS, value);
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i]=
, value);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		data->led_mc_subled_info[i].intensity =3D value;
>> +		data->led_mc_subled_info[i].channel =3D i;
>> +	}
>> +
>> +	data->led_mc_cdev.subled_info =3D data->led_mc_subled_info;
>> +	data->led_mc_cdev.num_colors =3D LED_CHANNELS;
>> +
>> +	return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, &d=
ata->led_mc_cdev,
>> +							 &init_data);
>> +}
>> [...]
>> +static const enum power_supply_property uniwill_properties[] =3D {
>> +	POWER_SUPPLY_PROP_HEALTH,
>> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +};
>> +
>> +static const struct power_supply_ext uniwill_extension =3D {
>> +	.name =3D DRIVER_NAME,
>> +	.properties =3D uniwill_properties,
>> +	.num_properties =3D ARRAY_SIZE(uniwill_properties),
>> +	.get_property =3D uniwill_get_property,
>> +	.set_property =3D uniwill_set_property,
>> +	.property_is_writeable =3D uniwill_property_is_writeable,
>> +};
>> +
>> +static int uniwill_add_battery(struct power_supply *battery, struct ac=
pi_battery_hook *hook)
> What is the motivation for supporting multiple batteries?
> There is still just a single parameter in the EC/etc.

I simply assume that devices using this EC interface will only ever suppor=
t a single battery anyway,
as the EC will be unable to handle more than that.

>> +{
>> +	struct uniwill_data *data =3D container_of(hook, struct uniwill_data,=
 hook);
>> +	struct uniwill_battery_entry *entry;
>> +	int ret;
>> +
>> +	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
>> +	if (!entry)
>> +		return -ENOMEM;
>> +
>> +	ret =3D power_supply_register_extension(battery, &uniwill_extension, =
&data->wdev->dev, data);
>> +	if (ret < 0) {
>> +		kfree(entry);
>> +		return ret;
>> +	}
>> +
>> +	scoped_guard(mutex, &data->battery_lock) {
>> +		entry->battery =3D battery;
>> +		list_add(&entry->head, &data->batteries);
>> +	}
>> +
>> +	return 0;
>> +}
>> [...]
>> +static int uniwill_ec_init(struct uniwill_data *data)
>> +{
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
>> +
>> +	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_C=
TRL);
> I think this might turn out to be problematic. If this is enabled, then =
multiple
> things are not handled automatically. For example, keyboard backlight is=
 not handled
> and as far as I can see, no `KEY_KBDILLUM{DOWN,UP}` are sent (events 0xb=
1, 0xb2). The
> other thing is the "performance mode" button (event 0xb0). I don't see t=
hat these two
> things would be handled in the driver.

On the intel NUC notebooks the keyboard backlight is controlled by a separ=
ate USB device,
so the driver only has to forward the KEY_KBDILLUMTOGGLE event to userspac=
e (the
KEY_KBDILLUM{DOWN,UP} events are not supported on those devices). This hap=
pens inside the
uniwill-wmi driver.

Once we add support for devices where the EC also controls the keyboard ba=
cklight i will
add support for those events. I am also planning to add support for the pe=
rformance mode
event later. Currently the EC does not change the performance mode itself =
even when in
automatic mode (at least on intel NUC notebooks).

Since this driver relies on a DMI whitelist i think that we can safely add=
 support for those
feature later when new devices are added to those list.

>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_man=
ual_control, data);
>> +}
>> +
>> +static int uniwill_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	struct uniwill_data *data;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->wdev =3D wdev;
>> +	dev_set_drvdata(&wdev->dev, data);
>> +
>> +	regmap =3D devm_regmap_init(&wdev->dev, &uniwill_ec_bus, data, &uniwi=
ll_ec_config);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	data->regmap =3D regmap;
>> +	ret =3D devm_mutex_init(&wdev->dev, &data->super_key_lock);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D uniwill_ec_init(data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D uniwill_battery_init(data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D uniwill_led_init(data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D uniwill_hwmon_init(data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return uniwill_notifier_init(data);
>> +}
>> +
>> +static void uniwill_shutdown(struct wmi_device *wdev)
>> +{
>> +	struct uniwill_data *data =3D dev_get_drvdata(&wdev->dev);
>> +
>> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
>> +}
>> +
>> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
>> +{
>> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
>> +		return 0;
>> +
>> +	/*
>> +	 * The EC_ADDR_SWITCH_STATUS is maked as volatile, so we have to rest=
ore it
>> +	 * ourself.
>> +	 */
>> +	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_s=
witch_status);
>> +}
>> +
>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>> +{
>> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
>> +		return 0;
>> +
>> +	/*
>> +	 * Save the current charge limit in order to restore it during resume=
.
>> +	 * We cannot use the regmap code for that since this register needs t=
o
>> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
>> +	 */
> What is the motivation for this? I found that this is not needed, I foun=
d that
> the value is persistent.

The OEM application i reverse-engineered did restore this value after a re=
sume, so
i decided to replicate this behavior.

Thanks,
Armin Wolf

>> +	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_cha=
rge_ctrl);
>> +}
>> [...]
>>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze
>
