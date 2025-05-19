Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5021E50B;
	Mon, 19 May 2025 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747621968; cv=none; b=bqGf/sMczRY0aNXiYfPkw81OKKcdtBqj0OZTIiVZaH/WOoGoEu/YpdWihzekn+t2gynmK4I5T2crPSlaLvqOP4YoZsnbjMDY6R8AfYFyDhXo9ML9PfksCX58KKf0SZ0x+0P8VgS50BBVwWV7YUKlowrGaoX9jeL87RSRT+8Y9bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747621968; c=relaxed/simple;
	bh=0zzX5WHnEKCbgroPGhWp9SnISsRI+pegqOANs4qG158=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KV6u3ofqSgTlYa7tHjGBbbQ6fjrdeOKC6wsglskHYxgsf01+mhF/nD9QJC1xTAhip0vuuOmDn4BHSxwiZeZw5bLAlgI6kNwhLE81dGwa/diBx1Nk4WQy87u0h4EdkMhKi3Vq+v6knRAeZ9/MGGzAmXcOPS/FRwdQZa/yvUTfPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OQCw4IA8; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OQCw4IA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747621944; x=1748226744; i=w_armin@gmx.de;
	bh=JfLwC1/LUNCnmQNAcewtt3UxTnTX3wWFey4wgugPwxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OQCw4IA8JLwDCo88l+Lh7WwOY8Muca2+p3O6McJ0Q9uBlNhhdnfAXNlpcZ8aE/0p
	 VtAxKsM9jrYp1iwJa3Wk6B0oXusQ+MXFsbYekQFS6EPT5D0xGJrbqaPiNOzXmuCPL
	 +RrA966J/lf3S7L64Nfq2X6YFlgyYl9UXNpJ0hgnVRzWX3QzOMsCQRNwv4wJ0/5Tw
	 GbmToPxYl+1TuIAAFuouA4E60WTf8UG6GoxVGj14FOvDIby1RyGA+KREi7RsUBTY0
	 KoGLBBEUBWKuIgoMdlQbInMDtHfBD1qgq1b/WgfttOg76oGg9E/t1mzgYvrHR5p6T
	 9gW4D1uPjqtv9Du9Tw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1ux9bt2qLO-00sRhm; Mon, 19
 May 2025 04:32:23 +0200
Message-ID: <a68dd95a-14d7-410c-9aae-d8c55b77a3e2@gmx.de>
Date: Mon, 19 May 2025 04:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/10] platform/x86: msi-wmi-platform: Add
 charge_threshold support
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-8-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-8-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6YdGIOw7BVwOX0Cr40Z/pZq5E8znJx0eP7MezSP1mcv02UJPKmz
 yDOmdN6pm/edJbgs7axTE68xI7rXq0UK8IKe1SDhcqyjUhEhzijVziRi2l752Cr50HsOcEy
 oiEjJ+b9jiIi0kh4JV77G44Fuo3ZWRMaNpFY1yoHGJ9bBbE70Uz7F/bnSQKQFrW8753dUux
 BkkNcAfFS+7xWNItuHkCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xyv97hVEQX4=;o54aQNHxn8ZZing/ecBU5Rofu9I
 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

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> The battery of MSI laptops supports charge threshold. Add support for it=
.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/Kconfig            |   1 +
>   drivers/platform/x86/msi-wmi-platform.c | 110 ++++++++++++++++++++++++
>   2 files changed, 111 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index fd3da718731e7..51a34ab476ffc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -744,6 +744,7 @@ config MSI_WMI
>  =20
>   config MSI_WMI_PLATFORM
>   	tristate "MSI WMI Platform features"
> +	depends on ACPI_BATTERY
>   	depends on ACPI_WMI
>   	depends on HWMON
>   	select ACPI_PLATFORM_PROFILE
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index 6498f4b44fe53..46928fb4da8a6 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -31,6 +31,7 @@
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
> +#include <acpi/battery.h>
>  =20
>   #include <linux/unaligned.h>
>  =20
> @@ -79,6 +80,7 @@
>   /* Get_Data() and Set_Data() Params */
>   #define MSI_PLATFORM_PL1_ADDR	0x50
>   #define MSI_PLATFORM_PL2_ADDR	0x51
> +#define MSI_PLATFORM_BAT_ADDR	0xd7
>  =20
>   static bool force;
>   module_param_unsafe(force, bool, 0);
> @@ -118,6 +120,7 @@ enum msi_wmi_platform_method {
>  =20
>   struct msi_wmi_platform_quirk {
>   	bool shift_mode;	/* Shift mode is supported */
> +	bool charge_threshold;	/* Charge threshold is supported */
>   	int pl_min;		/* Minimum PLx value */
>   	int pl1_max;		/* Maximum PL1 value */
>   	int pl2_max;		/* Maximum PL2 value */
> @@ -128,6 +131,7 @@ struct msi_wmi_platform_data {
>   	struct msi_wmi_platform_quirk *quirks;
>   	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>   	struct device *ppdev;
> +	struct acpi_battery_hook battery_hook;
>   	struct device *fw_attrs_dev;
>   	struct kset *fw_attrs_kset;
>   };
> @@ -211,12 +215,14 @@ static const char * const msi_wmi_platform_debugfs=
_names[] =3D {
>   static struct msi_wmi_platform_quirk quirk_default =3D {};
>   static struct msi_wmi_platform_quirk quirk_gen1 =3D {
>   	.shift_mode =3D true,
> +	.charge_threshold =3D true,
>   	.pl_min =3D 8,
>   	.pl1_max =3D 43,
>   	.pl2_max =3D 45
>   };
>   static struct msi_wmi_platform_quirk quirk_gen2 =3D {
>   	.shift_mode =3D true,
> +	.charge_threshold =3D true,
>   	.pl_min =3D 8,
>   	.pl1_max =3D 30,
>   	.pl2_max =3D 37
> @@ -1013,6 +1019,94 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_p=
latform_data *data)
>   	return 0;
>   }
>  =20
> +static int msi_platform_psy_ext_get_prop(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *data,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct msi_wmi_platform_data *msi =3D data;
> +	u8 buffer[32] =3D { 0 };
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		buffer[0] =3D MSI_PLATFORM_BAT_ADDR;
> +		ret =3D msi_wmi_platform_query(msi, MSI_PLATFORM_GET_DATA,
> +					     buffer, sizeof(buffer));
> +		if (ret)
> +			return ret;
> +
> +		val->intval =3D buffer[1] & ~BIT(7);
> +		if (val->intval > 100)
> +			return -EINVAL;
> +
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msi_platform_psy_ext_set_prop(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *data,
> +					 enum power_supply_property psp,
> +					 const union power_supply_propval *val)
> +{
> +	struct msi_wmi_platform_data *msi =3D data;
> +	u8 buffer[32] =3D { 0 };
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval > 100)
> +			return -EINVAL;
> +		buffer[0] =3D MSI_PLATFORM_BAT_ADDR;
> +		buffer[1] =3D val->intval | BIT(7);
> +		return msi_wmi_platform_query(msi, MSI_PLATFORM_SET_DATA,
> +					      buffer, sizeof(buffer));
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int
> +msi_platform_psy_prop_is_writeable(struct power_supply *psy,
> +				   const struct power_supply_ext *ext,
> +				   void *data, enum power_supply_property psp)
> +{
> +	return true;
> +}
> +
> +static const enum power_supply_property oxp_psy_ext_props[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext msi_platform_psy_ext =3D {
> +	.name			=3D "msi-platform-charge-control",
> +	.properties		=3D oxp_psy_ext_props,
> +	.num_properties		=3D ARRAY_SIZE(oxp_psy_ext_props),
> +	.get_property		=3D msi_platform_psy_ext_get_prop,
> +	.set_property		=3D msi_platform_psy_ext_set_prop,
> +	.property_is_writeable	=3D msi_platform_psy_prop_is_writeable,
> +};
> +
> +static int msi_wmi_platform_battery_add(struct power_supply *battery,
> +					struct acpi_battery_hook *hook)
> +{
> +	struct msi_wmi_platform_data *data =3D
> +		container_of(hook, struct msi_wmi_platform_data, battery_hook);
> +
> +	return power_supply_register_extension(battery, &msi_platform_psy_ext,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int msi_wmi_platform_battery_remove(struct power_supply *battery=
,
> +					   struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &msi_platform_psy_ext);
> +	return 0;
> +}
> +
>   static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const c=
har __user *input,
>   					      size_t length, loff_t *offset)
>   {
> @@ -1245,6 +1339,13 @@ static int msi_wmi_platform_probe(struct wmi_devi=
ce *wdev, const void *context)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	if (data->quirks->charge_threshold) {
> +		data->battery_hook.name =3D "MSI Battery";
> +		data->battery_hook.add_battery =3D msi_wmi_platform_battery_add;
> +		data->battery_hook.remove_battery =3D msi_wmi_platform_battery_remove=
;
> +		battery_hook_register(&data->battery_hook);

Please use devm_battery_hook_reigister()

Thanks,
Armin Wolf

> +	}
> +
>   	msi_wmi_platform_debugfs_init(data);
>  =20
>   	msi_wmi_platform_profile_setup(data);
> @@ -1252,6 +1353,14 @@ static int msi_wmi_platform_probe(struct wmi_devi=
ce *wdev, const void *context)
>   	return msi_wmi_platform_hwmon_init(data);
>   }
>  =20
> +static void msi_wmi_platform_remove(struct wmi_device *wdev)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(&wdev->dev);
> +
> +	if (data->quirks->charge_threshold)
> +		battery_hook_unregister(&data->battery_hook);
> +}
> +
>   static const struct wmi_device_id msi_wmi_platform_id_table[] =3D {
>   	{ MSI_PLATFORM_GUID, NULL },
>   	{ }
> @@ -1265,6 +1374,7 @@ static struct wmi_driver msi_wmi_platform_driver =
=3D {
>   	},
>   	.id_table =3D msi_wmi_platform_id_table,
>   	.probe =3D msi_wmi_platform_probe,
> +	.remove =3D msi_wmi_platform_remove,
>   	.no_singleton =3D true,
>   };
>   module_wmi_driver(msi_wmi_platform_driver);
