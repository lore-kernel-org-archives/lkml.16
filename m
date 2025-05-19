Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD09A11185;
	Mon, 19 May 2025 01:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747619926; cv=none; b=HVXyENo2D1q2m26NFm1SW4H80sfuG2rhliUz61Jea3YkpjYYbMetKx9/2nmHNMxQJ2lzdoU8BQM7vPYwQIwxLvpeugaHzb7TGmg7LVRWe84U5H40EEXqFswUnYs9ur9/Xrtv1E+zVS4Up3+5+gxEhQjN/fkNflKhj6fcgtjaOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747619926; c=relaxed/simple;
	bh=l3Pbiy9NG59MlZ05HGNHVzEjQqZB5+DQqadhHYZ48Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQpi6a7S6dXY+4vM1YsIR8j7TBFoptvrjQQptj6QiBCsZlXUm+kArFDH0L0FwaSVcPtZfCdb1FtB8Yng/F/QZ4S/2jQPmpxiW9yoBBZfWFg02gSyE+nONijQLqRxhHJCOAnTuX7GKzphz6JJ3U0Ic4GtbcAwQmin03XqAKyqMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MSieLx4a; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MSieLx4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747619899; x=1748224699; i=w_armin@gmx.de;
	bh=XfZnzk/ZsSoSM118Nx7smFVgZEQBdxZ3sHIWFXSLccc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MSieLx4a19Kyzdh39L9NLyh04NB5Y5qsdpmnCUlHb2BUp+KAo9HIv7cGb7RbInNj
	 pWfJm8ap9OaACQa5wERmatnuBzslmQtjAtsXIf9TeBuz+lcLXQ2ZkC/JAibl+GK7i
	 eYAy1H5oABqL10WA/aHU5HWgB3z8zot+UfuQ9a2TZqk0bX+ajbr7frjDtGCbMlNJL
	 ab0ftURXZFxUyFWGrrGbUsVeFnxdcYWVnUlb40b3cEZVMQifNxoLg4mWdbW1Sr+mk
	 lqFyU/nq2ky4nn/ZvAVq9es/cEpVkP+ZQkRb96J9zuoijEF+oNT7HoerzZOF8nMMq
	 34QMEAm6XO7xNujzyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQeA2-1udRO90RrK-00Yozy; Mon, 19
 May 2025 03:58:19 +0200
Message-ID: <9dd0f480-a799-418f-bbab-421af8a753b7@gmx.de>
Date: Mon, 19 May 2025 03:58:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/10] platform/x86: msi-wmi-platform: Add platform
 profile through shift mode
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-6-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SAoQY1WPYIekAaytEyzwBcuJP7axri6OUswWKp/Mrm8Er9JQ8Py
 LIiTK20r3hEI5UnwV45J10IF6Mw8wfp5UCLJxFDEzo9TGbdWYjZxQ5cs7vTI2NdKME7Z27W
 MgNIX1SqUyZuj4hAAGmyb0eiZIHBOe8FaqEYLhWQJqzJcwLcPO33nJ03yRC9q7FVJD/aQRw
 9UbuTyeGLSd1O6QKYQDjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W5EKT5dUqBk=;k9ChO3Y3zLVAmYLZgJs9TQQ5/9W
 GPw6bzKnDOplWFnNa2Woq/MmKNcAkzN3F3ljBTI1V1eGAC0blgm8EMGLZxReUu78XjVXOzD/z
 3f/ym8nK5ziSzL/FIHpwUfRF6ktwHDn0AB9fWeJe1lzR7/R9b0ECiQ9gNdwoH/bUahrWgOTpZ
 zpmjXn72vH8XLKJMPC//YSKTlrSvkcbGYkJpmv4i5+p86+BJ7NxaqD+M0IV4v8P8mLb7kapJZ
 quKfbJ8WY1t16R4WkwhrYSyKkNzj7Y57TYWlAq72+lnO+oal9mJrje8Z1da+7Ku83mSTDyR8b
 eae7Fb60v4qKOvfQs7tp7APcUSU21bvjw+KzrHpm1lH8qsSXCpzEl+Go831QSLw/Tn5AqpruC
 B7W3POeO92gQfAFIf8W7oLH+ZTDgFhUKLEiADhGMUV/158iTR0MnXiDAAWx6xooP+CW0kaQEm
 XvLVZI/CWqJwrhssTQeBIA2o5O8edd6yU44CC2St8eXEoJUO5PKcLIP8auOYxm8ctjsj9JXfG
 fB1ZJjyt0Y5/yjC6ZTKhaUqk8hL5fNrFBstckioD8jQdmG8Edtf0k2jla700SbD0M+I2pk6gK
 DiOpoxAvUcLaN1qJrSKqZFZYh4FDcJWmmHxdhD9fxTHF7QXqhq4qbvuLDIfw2u+oWc6vvSP46
 uHcH00mTo1Yq6MHP8VraRyWaASubxnwlvBxb7RiYVfG84+se3eIAPehhTTS5ggq2Jggd9Nc18
 OQ2HdexDQQ1T8OwwEdaMNJRYJfQmqj9tPhJy5XfIVzfa/kIdyC2f6LJMN9jMIkTBf5LJSjNcG
 /l6OIPDE174VoZqTXB63VnbgqgJuPYhOSMhY3zNaBcZCUbsOfU0CImS+6M4/x2nm3vdYAMd/6
 b1ZdMcI4iUAElX8xqLtRJZp/ct72az8mnWtKpeRi6QT3mibwJ94/mf55iNYNZO1gz9g8ZX1Tg
 L9sHqfrjfXtgVyHVW3Md5SXgV3u7ssNWPwGJLYj3vnN7a+XRpBGMqDYPcPkg2qq6a7ATbZ3H7
 MCaAFYv+mv251+3lGm2DIVY3qQqgZ8SMdoNaHnptmAVnxDRtw3xNSEwthIAlBa85GpTIc7Pwx
 9QiJ3z7RSFEf1hDx/9GsAV2aN1VU8qGNZJKB0wgflizLrQoC0Ona60V+zzlJ6ccPL/zvJfjK7
 rhGDWRri/YTamLdkGzhLaWFrqJNysN62ceV9EyLjC79ZJJkhTpy+44188M0DPn63eyhl8+4E4
 5zNDI60ay1+gtZTQEom0gNasNszojA7x/j+AYy5KkQ8yFGb2L4XJA47WRoAaC3RQOP6JWsTZ9
 by1QbHTAq0oFsAS4iUMCXzAbfm3vBBz/ZqQfQ67LvnCsWW8hPZzt05GNFiWWiqrJ+9zKVciP3
 Ku1/3ov1pIfwZTE2yeEp/6JTXiLIUYKPlrDE70cwiAwYMrbIzp1K44ZfT2+iZ/rxGm3LQja9f
 nleJrh0Si1Ex2RaSSbmuziA0+ovE+vGjVreJtqaBJIplibqboI+cyEcMp2uIEHq41CE7qQ7vc
 /qgUWKnsOZ4CZVj6hfn7k4vDxQighmfVRL4g1eYAAiNGrKRUPVTd3TrN21NBrl17Bx0Z1HVoz
 RAqxoFcwlzevRFzrtLIR2feEtb6teypM9WYUZPcJyGFXAJfldbg8yojkjdlHE02009rfy0RXp
 QZ1JaERIlYBchLHDFpRLOxpmPyTdH8XmEsDANAw6JiTIcCzHW3LL2E6M+Rh6Cro1TzuMH1dH8
 Y7ymcuGoln55jUREBdPUkPSlmPH3eLejINb+1iEG9WxgjFBArgc4KlhMb7uEW50iM31ivu0nT
 HyZOV9vZM1PHOsQoD1JzCrr1V/HL3ETP4SKe1od5xfQYDfWSa2L4+5EoLS+mMEO7d5pxR9RhN
 nDsuLl04pIz6iy20NZ2Fy1bllG7oEkTRD+Z4IKu2UkfN6yeBADrdtqThGdnf3535GLBgdDSBO
 imyEmssrt9zguPhMsKdenZiNKMN2J1/bxtjo+Ymzc0LnpZT4nFnFx9gg3/EcxC/4MROrVbqm1
 os2syakahHshfTT1qZDYMb55mA/v1PZ57rcACVc6spiDnw7GhHN89DO7+2rKUDM8mkJaCYtpC
 CvuNg2MvyNm8mHJgHoysvqm89bZPKQxcKKEgpb+oElEl8J4DKPbei0lE4e4Eh8GzAA56JLaSh
 qr/ilSpDSxRm4Ne/j2l/r6IUamVk3dcrUWlYRW6R7lkP/eQWaj1HFU7aNWSNJ+OzH+CxNArJV
 VDtYxVToLRc3jCNRx6rktBLyH0br6Fv23ccR+qzIXftCGe/fTTkv7iJMLZXi8MQuWLI5epaSb
 mrZjrKZP1oyu+V9ZIoEf6XROdf/P216u6dGjCNyZDmrDGPeAdP67llJYfsojbNM9dhPKsS6kH
 t+UqVyD5gDcz6yPtp3AeIvP1DhoKgJG5v9B7A+S9WF1huetX4hRGc2X9OAJ1zZ6Etvg25eSwo
 5UNJpBo3bC73BILL8gKAB0zAtP0GpZqtVGAzzYbuyQsJZV7/rxYCOj53phBkUFyrw3V5b9S+V
 fW3am7+4PSHfqeBkScix62nWbEYEe6FTGvaYMIsNrdyYRLUUfzW4x7zI9q9YG/u19f0SjNWPt
 klbvfR3fNhHI70MRAVMtHpfY2diC61j9mRNaImdyQm7N9kUCzbL+KusJNZ5D8YfehMFq+Juw2
 q8SXcbJRRKk2xtqPfMu0rh6f3VEBw6K6Bu9J7dBToHqG8byR4G5ztTX74jHjYkly93j8cfyX/
 FaRfOxargzdXzOrmJJxfLADADlVOKRqXTprffiECZ37m1j6AUf6tgEtum2ALsKDpDYyvCYh7p
 4G2Rf4WcbMtMzRmHXVmane6CuPzbUbCNkRXo7ca5vnbAxCqrxgrhmGiPwd7VB40llEcE6uNYp
 dkB4snJAjDExB/s2h7krJc73ZGhFtZmutOgqSwljdPeOn0Ga0KSpEuYFQqN0E1Pa+pyc/V/0j
 E/+Iehoc2zqfn851V9u0WTFn78OXBgTNG+60epY8vxaPM1U8N6gCPWMDHg4dm0NrMakMq0hyE
 y178pds3Lb0PhfBTK4Y6DP8uwnnTh4dIqOMvRCFkI6f6I0K6bAOSQ0rnLcVpAQqGQ==

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> MSI's version of platform profile in Windows is called shift mode.
> Introduce it here, and add a profile handler to it.
>
> It has 5 modes: sport, comfort, green, eco, and user.
> Confusingly, for the Claw, MSI only uses sport, green, and eco,
> where they correspond to performance, balanced, and low-power.
> Therefore, comfort is mapped to balanced-performance, and user to
> custom.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/Kconfig            |   1 +
>   drivers/platform/x86/msi-wmi-platform.c | 117 ++++++++++++++++++++++++
>   2 files changed, 118 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bee98251b8f0b..57a48910c8fd4 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -746,6 +746,7 @@ config MSI_WMI_PLATFORM
>   	tristate "MSI WMI Platform features"
>   	depends on ACPI_WMI
>   	depends on HWMON
> +	select ACPI_PLATFORM_PROFILE
>   	help
>   	  Say Y here if you want to have support for WMI-based platform featu=
res
>   	  like fan sensor access on MSI machines.
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index 9ac3c6f1b3f1d..c0b577c95c079 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -17,6 +17,7 @@
>   #include <linux/dmi.h>
>   #include <linux/errno.h>
>   #include <linux/fixp-arith.h>
> +#include <linux/platform_profile.h>
>   #include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/kernel.h>
> @@ -63,6 +64,16 @@
>   #define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET	1
>   #define MSI_PLATFORM_AP_ENABLE_FAN_TABLES	BIT(7)
>  =20
> +/* Get_Data() and Set_Data() Shift Mode Register */
> +#define MSI_PLATFORM_SHIFT_ADDR		0xd2
> +#define MSI_PLATFORM_SHIFT_DISABLE	BIT(7)
> +#define MSI_PLATFORM_SHIFT_ENABLE	(BIT(7) | BIT(6))
> +#define MSI_PLATFORM_SHIFT_SPORT	(MSI_PLATFORM_SHIFT_ENABLE + 4)
> +#define MSI_PLATFORM_SHIFT_COMFORT	(MSI_PLATFORM_SHIFT_ENABLE + 0)
> +#define MSI_PLATFORM_SHIFT_GREEN	(MSI_PLATFORM_SHIFT_ENABLE + 1)
> +#define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
> +#define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
> +

Please use a enum for the shift modes and built the final value later usin=
g FIELD_PREP().
Also please update the documentation to include the new WMI methods.

>   static bool force;
>   module_param_unsafe(force, bool, 0);
>   MODULE_PARM_DESC(force, "Force loading without checking for supported =
WMI interface versions");
> @@ -100,12 +111,14 @@ enum msi_wmi_platform_method {
>   };
>  =20
>   struct msi_wmi_platform_quirk {
> +	bool shift_mode;	/* Shift mode is supported */
>   };
>  =20
>   struct msi_wmi_platform_data {
>   	struct wmi_device *wdev;
>   	struct msi_wmi_platform_quirk *quirks;
>   	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
> +	struct device *ppdev;
>   };
>  =20
>   struct msi_wmi_platform_debugfs_data {
> @@ -150,8 +163,10 @@ static const char * const msi_wmi_platform_debugfs_=
names[] =3D {
>  =20
>   static struct msi_wmi_platform_quirk quirk_default =3D {};
>   static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> +	.shift_mode =3D true
>   };
>   static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> +	.shift_mode =3D true
>   };
>  =20
>   static const struct dmi_system_id msi_quirks[] =3D {
> @@ -561,6 +576,90 @@ static const struct hwmon_chip_info msi_wmi_platfor=
m_chip_info =3D {
>   	.info =3D msi_wmi_platform_info,
>   };
>  =20
> +static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long =
*choices)
> +{
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	return 0;
> +}
> +
> +static int msi_wmi_platform_profile_get(struct device *dev,
> +					enum platform_profile_option *profile)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	u8 buffer[32] =3D { };
> +
> +	buffer[0] =3D MSI_PLATFORM_SHIFT_ADDR;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, si=
zeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (buffer[0] !=3D 1)
> +		return -EINVAL;

Please omit this check, msi_wmi_platform_parse_buffer() already takes care=
 of that.
Also could it be that the OEM application uses the Get_AP() WMI method for=
 getting
this value? If yes when please follow this behavior to maximize compatibil=
ity.

> +
> +	switch (buffer[1]) {
> +	case MSI_PLATFORM_SHIFT_SPORT:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_COMFORT:
> +		*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_GREEN:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_ECO:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_USER:
> +		*profile =3D PLATFORM_PROFILE_CUSTOM;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msi_wmi_platform_profile_set(struct device *dev,
> +					enum platform_profile_option profile)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { };
> +
> +	buffer[0] =3D MSI_PLATFORM_SHIFT_ADDR;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_SPORT;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_COMFORT;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_GREEN;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_ECO;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_USER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, siz=
eof(buffer));
> +}
> +
> +static const struct platform_profile_ops msi_wmi_platform_profile_ops =
=3D {
> +	.probe =3D msi_wmi_platform_profile_probe,
> +	.profile_get =3D msi_wmi_platform_profile_get,
> +	.profile_set =3D msi_wmi_platform_profile_set,
> +};
> +
>   static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const c=
har __user *input,
>   					      size_t length, loff_t *offset)
>   {
> @@ -742,6 +841,22 @@ static int msi_wmi_platform_init(struct msi_wmi_pla=
tform_data *data)
>   	return 0;
>   }
>  =20
> +static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data =
*data)

Please rename this function to msi_wmi_platform_profile_init().

> +{
> +	int err;
> +
> +	if (!data->quirks->shift_mode)
> +		return 0;
> +
> +	data->ppdev =3D devm_platform_profile_register(
> +		&data->wdev->dev, "msi-wmi-platform", data,
> +		&msi_wmi_platform_profile_ops);

Please turn ppdev into a local variable. Also please remove the err variab=
le.

Thanks,
Armin Wolf

> +	if (err)
> +		return err;
> +
> +	return PTR_ERR_OR_ZERO(data->ppdev);
> +}
> +
>   static int msi_wmi_platform_probe(struct wmi_device *wdev, const void =
*context)
>   {
>   	struct msi_wmi_platform_data *data;
> @@ -775,6 +890,8 @@ static int msi_wmi_platform_probe(struct wmi_device =
*wdev, const void *context)
>  =20
>   	msi_wmi_platform_debugfs_init(data);
>  =20
> +	msi_wmi_platform_profile_setup(data);
> +
>   	return msi_wmi_platform_hwmon_init(data);
>   }
>  =20
