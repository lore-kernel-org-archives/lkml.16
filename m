Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344BD19F464;
	Fri,  2 May 2025 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200927; cv=none; b=Vxdv17GA53YApcRk6FcDmq7ccPkdNeOZ+uynX3Kd0iYN4plY0hDG+SnAJsYUALZesqflctc1CrzTgrk6tz4DRo/cPt4qsdPkS2u/G7mJZS59J5/4KFSY6uj8rflvb3iIrfGucn8v3AkYFsAPMTN2MKdwus9wwEdGw1BcLHbjAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200927; c=relaxed/simple;
	bh=mP5AS04TcizErRTZJv6rfHissbP7jezQD250An5julU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=he2Gg8pOdUahqkkRQa7ECo///f6LdrP4m+s5uNcoXiLhDI6R4V6bHl3LDds+3R1Uk0ysetQgYPKYJNlc7MmW2+Lv/nLwj+dECR+aV/PSLDrXaJU+4k9oBSipqo7A1HlcUyy1bBIGLOGAVslVtM/Up8dpX7dzvP3y/3wnRLaPjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YodJNQ9p; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YodJNQ9p"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7403f3ece96so3106473b3a.0;
        Fri, 02 May 2025 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746200925; x=1746805725; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk4svxxZUEpAVs1r4kwm1XdNSaKAUXHR5V+kAkQVJAI=;
        b=YodJNQ9pPuLL4OpyfvcdiV4lN0sbFpr6N2Fs84B9o8qxiWtN9HZfLgTlKjEBok4hn6
         IXdzjYoIo9HjFTEbfTfXVLr6o5yc7rktTehM9cXBsJ/gFY96abUfLElPZuRlaNiuZVtp
         FNIjVqmGeDS03nkti+1Br+sI4UM4oQRxKCJX7Mr4qvTwIZyfUMBpG21Kmy8QvCif+y8Z
         ZmwEp4XJytKLUazvFDCTG0vHDY7QHKgDC2wRzDbc92VKX/cHXlaBNWPMu2F3Ul4qwqCD
         Hc/RT52YcAtH6t5CmMxHlkqIfNIqBhGuL8/wKKvt/5afIanxUtpGVEfNFuXeJDI/ypkk
         MlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200925; x=1746805725;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk4svxxZUEpAVs1r4kwm1XdNSaKAUXHR5V+kAkQVJAI=;
        b=bel6RPx8FOFR4+Xc140owN7CC4deK6B8dZF0/mTj09aqbpG1JrM4SDOmnYUHTZrsFU
         4QmrEiXfrLpy/Dk0bnje68csyqOmBT3Drykf+QB6uS/XKKafdtqjfBecD7ukDcFrk5Zv
         Eowx9/38Yw2oWs2TXYCSU5hM9tUjsx1tTX9yiHKX8vH+HjRMytL5QINtj+4voqQE/+c1
         Sl3v2IGhy8ZbuOMmj7AelVO6d35D1IOvGaTZLyogUNx3L8/q9dPb5jXXMJzELicRAbBK
         6QqodPoOSSWd8RDkJhDtgp1M11EI6Bq4jyKPYW073vCAcFaxiYRP5Fi3yoyuwZHI0Ttn
         9sfg==
X-Forwarded-Encrypted: i=1; AJvYcCUIG+0o2298inRHRxiKHEyXzMSDnEVr4zwWqsNVbH7acdOXe026vx9x5rKsm4/g8o3UnCkQg3YCAcb79r7iLqMVQrOZMA==@vger.kernel.org, AJvYcCXj/cF4oYv4ZE+/QZkXHTNXfeWTcSuliDwAP8ngZy/Yt9SreRpEgpkfz9kHpRX/lRsj32EnFFSQBQi+2CA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8q3Rr1oMjoFnB27Z5du57zyMh9Va6x/SYyiPLZcB3JPwl1ezy
	jfYg7Sqneeapw0spjzP2GpC+zJLEZqQjRzunB+CQIgPic2R4emFcyfUS1g==
X-Gm-Gg: ASbGnctsnH4z00cjEkreymjqyKf3gmrDGg/oYBQSMSnFRio9u8b0EiwQkS4ZfanqBpa
	ObJN0OUpwZPK4r7dDVrU8qRYwHXPp2Q4OLdCfHLVrxOq6ZgQ8AsxAYSP4W3s0uh3SQLVM5MlpnE
	tTE+YKGLSYBKCF+F0LKRS6kezg1z/iC3aBH/ojT0nkpuGkZqkL4d3lhCxqWwzDebosPOdMmOZ58
	12oB014eRDzMIZxwT9bOyqh4rgYg7pV/mQYHNAM9/0SVd0Geeh6BM3tiQVJKcxQsUbIEb/OTUvQ
	shguCVnkoUfLX8NsKMcXnEixuZA3wFoUiA==
X-Google-Smtp-Source: AGHT+IEpwvOVCuVWiYXlWYRp3tCadcUCKaI8F9pfqzXMq8eEdoBOoVaJ/1U7XrW3MtPC+S2TZFskDw==
X-Received: by 2002:a05:6a00:32ca:b0:736:3be3:3d76 with SMTP id d2e1a72fcca58-74058aedda8mr4206271b3a.17.1746200925179;
        Fri, 02 May 2025 08:48:45 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbafesm1788537b3a.54.2025.05.02.08.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2142283f20f7abef593b3d7efbed664fd04997633010f80d36cd4224e616;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 02 May 2025 12:48:30 -0300
Message-Id: <D9LSK7PPIU4V.1Q5FXYODQ170H@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Gabriel Marcano" <gabemarcano@yahoo.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO
 debug methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
 <20250502-awcc-gpio-v3-1-ea9a932d1124@gmail.com>
 <aab2237f-d32e-b335-56d3-144274849edf@linux.intel.com>
In-Reply-To: <aab2237f-d32e-b335-56d3-144274849edf@linux.intel.com>

--2142283f20f7abef593b3d7efbed664fd04997633010f80d36cd4224e616
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 2, 2025 at 9:45 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Fri, 2 May 2025, Kurt Borja via B4 Relay wrote:
>
>> From: Kurt Borja <kuurtb@gmail.com>
>>=20
>> Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
>> which has two GPIO pins with debug capabilities:
>>=20
>>  - Device Firmware Update mode (DFU)
>>  - Negative Reset (NRST)
>>=20
>> The WMAX device has methods to toggle or read the state of these GPIO
>> pins. Expose these methods through DebugFS, hidden behind an unsafe
>> module parameter to avoid common users from toying with these without
>> consideration.
>>=20
>> Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
>>  drivers/platform/x86/dell/alienware-wmi-wmax.c  | 105 +++++++++++++++++=
++++++-
>>  2 files changed, 123 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documenta=
tion/ABI/testing/debugfs-alienware-wmi
>> index 48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5..c7f525d6baac962be8278060=
8f8da5c0368600cc 100644
>> --- a/Documentation/ABI/testing/debugfs-alienware-wmi
>> +++ b/Documentation/ABI/testing/debugfs-alienware-wmi
>> @@ -42,3 +42,23 @@ Description:
>>  		details.
>> =20
>>  		RO
>> +
>> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/total=
_gpios
>> +Date:		May 2025
>> +KernelVersion:	6.16
>> +Contact:	Kurt Borja <kuurtb@gmail.com>
>> +Description:
>> +		Total number of GPIO pins reported by the device.
>> +
>> +		RO
>> +
>> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/pinX
>> +Date:		May 2025
>> +KernelVersion:	6.16
>> +Contact:	Kurt Borja <kuurtb@gmail.com>
>> +Description:
>> +		This file controls GPIO pin X status.
>> +
>> +		See Documentation/wmi/devices/alienware-wmi.rst for details.
>> +
>> +		RW
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2bf9d85426b8f2cc5482be48=
050c81f9b6a30d00 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -38,6 +38,9 @@
>>  #define AWCC_METHOD_GET_FAN_SENSORS		0x13
>>  #define AWCC_METHOD_THERMAL_INFORMATION		0x14
>>  #define AWCC_METHOD_THERMAL_CONTROL		0x15
>> +#define AWCC_METHOD_FWUP_GPIO_CONTROL		0x20
>> +#define AWCC_METHOD_READ_TOTAL_GPIOS		0x21
>> +#define AWCC_METHOD_READ_GPIO_STATUS		0x22
>>  #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
>> =20
>>  #define AWCC_FAILURE_CODE			0xFFFFFFFF
>> @@ -281,6 +284,8 @@ struct awcc_priv {
>>  	struct device *hwdev;
>>  	struct awcc_fan_data **fan_data;
>>  	unsigned long temp_sensors[AWCC_ID_BITMAP_LONGS];
>> +
>> +	u32 gpio_count;
>>  };
>> =20
>>  static const enum platform_profile_option awcc_mode_to_platform_profile=
[AWCC_PROFILE_LAST] =3D {
>> @@ -571,6 +576,38 @@ static int awcc_thermal_information(struct wmi_devi=
ce *wdev, u8 operation, u8 ar
>>  	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, =
out);
>>  }
>> =20
>> +static int awcc_fwup_gpio_control(struct wmi_device *wdev, u8 pin, u8 s=
tatus)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D pin,
>> +		.arg1 =3D status,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +	u32 out;
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_FWUP_GPIO_CONTROL, &args, &o=
ut);
>> +}
>> +
>> +static int awcc_read_total_gpios(struct wmi_device *wdev, u32 *count)
>> +{
>> +	struct wmax_u32_args args =3D {};
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_TOTAL_GPIOS, &args, cou=
nt);
>> +}
>> +
>> +static int awcc_read_gpio_status(struct wmi_device *wdev, u8 pin, u32 *=
status)
>> +{
>> +	struct wmax_u32_args args =3D {
>> +		.operation =3D pin,
>> +		.arg1 =3D 0,
>> +		.arg2 =3D 0,
>> +		.arg3 =3D 0,
>> +	};
>> +
>> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_GPIO_STATUS, &args, sta=
tus);
>> +}
>> +
>>  static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation=
,
>>  				  u32 *out)
>>  {
>> @@ -1318,6 +1355,47 @@ static int awcc_debugfs_pprof_data_read(struct se=
q_file *seq, void *data)
>>  	return 0;
>>  }
>> =20
>> +static int awcc_gpio_pin_show(struct seq_file *seq, void *data)
>> +{
>> +	unsigned long pin =3D debugfs_get_aux_num(seq->file);
>> +	struct wmi_device *wdev =3D seq->private;
>> +	u32 status;
>> +	int ret;
>> +
>> +	ret =3D awcc_read_gpio_status(wdev, pin, &status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	seq_printf(seq, "%u\n", status);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t awcc_gpio_pin_write(struct file *file, const char __user=
 *buf,
>> +				   size_t count, loff_t *ppos)
>> +{
>> +	unsigned long pin =3D debugfs_get_aux_num(file);
>> +	struct seq_file *seq =3D file->private_data;
>> +	struct wmi_device *wdev =3D seq->private;
>> +	bool status;
>> +	int ret;
>> +
>> +	if (!ppos || *ppos)
>> +		return -EINVAL;
>> +
>> +	ret =3D kstrtobool_from_user(buf, count, &status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D awcc_fwup_gpio_control(wdev, pin, status);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +DEFINE_SHOW_STORE_ATTRIBUTE(awcc_gpio_pin);
>> +
>>  static void awcc_debugfs_remove(void *data)
>>  {
>>  	struct dentry *root =3D data;
>> @@ -1327,11 +1405,15 @@ static void awcc_debugfs_remove(void *data)
>> =20
>>  static void awcc_debugfs_init(struct wmi_device *wdev)
>>  {
>> -	struct dentry *root;
>> -	char name[64];
>> +	struct awcc_priv *priv =3D dev_get_drvdata(&wdev->dev);
>> +	struct dentry *root, *gpio_ctl;
>> +	char pin_name[8], name[64];
>> +	u32 gpio_count;
>> +	int ret;
>> =20
>>  	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wdev=
->dev));
>>  	root =3D debugfs_create_dir(name, NULL);
>> +	gpio_ctl =3D debugfs_create_dir("gpio_ctl", root);
>> =20
>>  	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
>>  				    awcc_debugfs_system_description_read);
>> @@ -1344,6 +1426,25 @@ static void awcc_debugfs_init(struct wmi_device *=
wdev)
>>  		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>>  					    awcc_debugfs_pprof_data_read);
>> =20
>> +	ret =3D awcc_read_total_gpios(wdev, &gpio_count);
>> +	if (ret) {
>> +		dev_dbg(&wdev->dev, "Failed to get total GPIO Pin count\n");
>> +		goto out_add_action;
>> +	} else if (gpio_count > AWCC_MAX_RES_COUNT) {
>> +		dev_dbg(&wdev->dev, "Reported GPIO Pin count may be corrupted: %u\n",=
 gpio_count);
>> +		goto out_add_action;
>> +	}
>> +
>> +	priv->gpio_count =3D gpio_count;
>> +	debugfs_create_u32("total_gpios", 0444, gpio_ctl, &priv->gpio_count);
>> +
>> +	for (unsigned int i =3D 0; i < gpio_count; i++) {
>> +		scnprintf(pin_name, sizeof(pin_name), "pin%u", i);
>
> Hi,
>
> This might trigger a warning from the compiler that the resulting string=
=20
> might not fit into pin_name. Did you check the warnings?

Hi Ilpo,

W=3D1 currently throws no warnings.

gpio_count does not exceed AWCC_MAX_RES_COUNT (16) so it should fit into
`pin_name` right?

Anyway, to avoid this we can reuse `name[]` here instead.

--=20
 ~ Kurt

>
>> +		debugfs_create_file_aux_num(pin_name, 0644, gpio_ctl, wdev, i,
>> +					    &awcc_gpio_pin_fops);
>> +	}
>> +
>> +out_add_action:
>>  	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>>  }
>> =20
>>=20
>>=20


--2142283f20f7abef593b3d7efbed664fd04997633010f80d36cd4224e616
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaBTpUAAKCRAWYEM49J/U
ZqoIAQCv01mmsojPgQITXeQ0yZXK+Ut0wHt8bUQ7YwkBhv+sEwD4nA6RixZlAJS4
MZd2bP9Ps2wypq66mDNVH6JbN+ClCw==
=Umvk
-----END PGP SIGNATURE-----

--2142283f20f7abef593b3d7efbed664fd04997633010f80d36cd4224e616--
