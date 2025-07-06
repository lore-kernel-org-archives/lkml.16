Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9652E36F7;
	Sun,  6 Jul 2025 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751785979; cv=none; b=qe3utJYV762MVTUu40cxS3vGROj8GRDXxTOUXdB1rR/Y1XvWouql0TKA79WxhQlkgZWRenPS56Zb0DJ13A4AtFKBCIMxxYAILKqE2wR3SrWmYytHnsulDhkcvtrbwxVzxRDDYWbZbgHjplpCvUg/M8jKL+LGglcluEmKEn9ONmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751785979; c=relaxed/simple;
	bh=vhZCarPcpN82QG6RovMGgIK/n2OzdfeEjEp8Ta93YJ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=nEzn8oCE36SuVEh4+MfEL/g99vokzzqlGTW56GGwjax2rmk1lIxGqAGW7NQuvPpmrukgFNls3bIZ13akNDkNwX23Yy1T51i2+udzwR4gsKPRVCakRl2CvLbphca3hNe1OgP+XUT97+X1iM1BXG/CrRWS41OcZOiHNiItuxRJU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQgXw4fq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQgXw4fq"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d7f2600c17so5491085a.0;
        Sun, 06 Jul 2025 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751785974; x=1752390774; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O9NyuALVXk0LiXfMTXwVFOe7OLZ6Lc0+pOH3rb22wY=;
        b=UQgXw4fqMhzAIq1Wwo6liMxDi+Z1mP+RPpwrzqgkTPkTgDg7ZqVtzeuqHeCsHkazcr
         aFCKIBR9HGqjVjIg4MTyX0qa2xAR5c/TOd+HyHgE6NI7cEUVKMN1yJCbV02ECtOn1Og4
         hb40cQ4+6hOQ9RC92nsmRachwOOJqcU55EovKqNpWaNtmDgdvyB1jyP8+Qzl1OHgeJyN
         SXE86VG0GhILDMsKwNMnroiTFBFt3HqakZ0Xfx47JogjuGuqffiPwIgbz4ONezOt5dtc
         /iX5vDnUaOjhh2lNEnuSuQ0gkI2kWHbPuuMkc/oCLnWgbkYbfkpoltDepWPfpMqgtcHP
         UFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751785974; x=1752390774;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6O9NyuALVXk0LiXfMTXwVFOe7OLZ6Lc0+pOH3rb22wY=;
        b=CpfRxPd5sR4z8B9+VVuufk8A0jrFPvUi8961Q/nGnzyBdoQo+pGWqPI4Egpd4tnR9P
         ukvIgn1Brz0FZ5Mlqcp5/R1mK2o52SBqC8gkinlb93BOf75pY0IFd1xbVhTTYhfzLcpE
         Pqi22GkSUH9fARf7x7kSTS21b91kFb2ezhWpUeAWTF5DPkTaPN03zpkFuIJCT5jV+QYU
         3qC3sZXd9fYEHrB9qvaUtg17XP4beueeoefta/aaayYiov2dPMix4UE1hxAXrVDy/k5q
         JZ4NQEXv+CyeG+hOna41kBG3Utz9Cb21unF31Lp7V/AdrQmAwBlEYXCFrTV+47jM8w24
         IrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCULHOtl3dGoWjF7Uk124ILc7LeYUUO4GZilsNotuCrO+jd6IglTMiburgQSY4gIglxRXr6bmIdx4d9QvIo=@vger.kernel.org, AJvYcCWnGgyZIgJzXIPl4ylCp4I71jYIm9pysOK8nbhN7j9j4OnlScGUQ5fa5/pJgCKgkZLm606BU05SIlg4AoOJBpd+CrqQ0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/qM4Z8M1tASc4DhZ44DClniMRAe64Q+N59INyXMZiIt7hPah
	Au0NskDDv2nLy8tvN80VxzAqh/JrNAGbYsSAxEaOQmkmhJ9zHWyF2wf2
X-Gm-Gg: ASbGnctwiW9ylDIq6CR6VbCW1QF5AIZJTxhyQHZMvmX1eR+dfihIA7GLZx5Uz/6uJok
	RL5uGEYTTs1LmVwV0lFhb0zgsx2aeowBtkAx5qUWpEtgy/qAz6LsLm6l9yM8iFNEhTWsNtRj1FW
	K25zfwzlq8vhyh0kCWfX4fHjzgP/fNM+Co/HVZC+0dYs1bl5uuVBbxskNs0sDAm82aPGWeVWUkO
	mK1MpRJL+45I29MGMprD3nQYi98g8q9W/dNIqfMfehbPSmgb2dL3PbqM1b5lb7rINCnNVuIArhZ
	KcxExl3VNcyH/S11mhXXzzOiy8ctO8WlPUx24praxsETb8E8vsdXeew=
X-Google-Smtp-Source: AGHT+IEs8Q0XdueU1n6OSf6SknGimWnZBzNY2W6IT4EMGK3pBWC9+aZp2aeImldSN5p0k+7XrJAwSA==
X-Received: by 2002:a05:620a:3946:b0:7d4:4af2:6401 with SMTP id af79cd13be357-7d5efbb44f0mr614026585a.22.1751785974195;
        Sun, 06 Jul 2025 00:12:54 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd95d3asm420302685a.10.2025.07.06.00.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 00:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Jul 2025 04:12:49 -0300
Message-Id: <DB4SASRMA77T.JY8INTVOV1CW@gmail.com>
Subject: Re: [PATCH v5 1/6] platform/x86: firmware_attributes_class: Add
 device initialization methods
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Joshua Grisham" <josh@joshuagrisham.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Antheas Kapenekakis"
 <lkml@antheas.dev>, "Derek J. Clark" <derekjohn.clark@gmail.com>, "Prasanth
 Ksr" <prasanth.ksr@dell.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-1-60b6d51d93eb@gmail.com>
 <05563b0c-861f-4046-9d50-87296d1bf6a2@t-8ch.de>
In-Reply-To: <05563b0c-861f-4046-9d50-87296d1bf6a2@t-8ch.de>

Hi Thomas,

On Sun Jul 6, 2025 at 3:42 AM -03, Thomas Wei=C3=9Fschuh wrote:
> On 2025-07-05 00:33:56-0300, Kurt Borja wrote:
>> From: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>=20
>> Currently each user of firmware_attributes_class has to manually set up
>> kobjects, devices, etc.
>>=20
>> Provide this infrastructure out-of-the-box through the newly introduced
>> fwat_device_register().
>>=20
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>> Co-developed-by: Kurt Borja <kuurtb@gmail.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/firmware_attributes_class.c | 125 ++++++++++++++++=
+++++++
>>  drivers/platform/x86/firmware_attributes_class.h |  28 +++++
>>  2 files changed, 153 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/=
platform/x86/firmware_attributes_class.c
>> index 736e96c186d9dc6d945517f090e9af903e93bbf4..290364202cce64bb0e9046e0=
b2bbb8d85e2cbc6f 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.c
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>> @@ -2,7 +2,14 @@
>> =20
>>  /* Firmware attributes class helper module */
>> =20
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/device/class.h>
>> +#include <linux/kdev_t.h>
>> +#include <linux/kobject.h>
>>  #include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>>  #include "firmware_attributes_class.h"
>> =20
>>  const struct class firmware_attributes_class =3D {
>> @@ -10,6 +17,122 @@ const struct class firmware_attributes_class =3D {
>>  };
>>  EXPORT_SYMBOL_GPL(firmware_attributes_class);
>> =20
>> +static void fwat_device_release(struct device *dev)
>> +{
>> +	struct fwat_device *fadev =3D to_fwat_device(dev);
>> +
>> +	kfree(fadev);
>> +}
>> +
>> +/**
>> + * fwat_device_register - Create and register a firmware-attributes cla=
ss
>> + *			  device
>> + * @parent: Parent device
>> + * @name: Name of the class device
>> + * @drvdata: Drvdata of the class device
>> + * @groups: Extra groups for the "attributes" directory
>> + *
>> + * Return: pointer to the new fwat_device on success, ERR_PTR on failur=
e
>> + */
>> +struct fwat_device *
>> +fwat_device_register(struct device *parent, const char *name, void *drv=
data,
>> +		     const struct attribute_group **groups)
>> +{
>> +	struct fwat_device *fadev;
>> +	int ret;
>> +
>> +	if (!parent || !name)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	fadev =3D kzalloc(sizeof(*fadev), GFP_KERNEL);
>> +	if (!fadev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	fadev->groups =3D groups;
>> +	fadev->dev.class =3D &firmware_attributes_class;
>> +	fadev->dev.parent =3D parent;
>> +	fadev->dev.release =3D fwat_device_release;
>> +	dev_set_drvdata(&fadev->dev, drvdata);
>> +	ret =3D dev_set_name(&fadev->dev, "%s", name);
>> +	if (ret) {
>> +		kfree(fadev);
>> +		return ERR_PTR(ret);
>> +	}
>> +	ret =3D device_register(&fadev->dev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>
> I think we need a put_device() here.

Indeed. I'll fix it.

>
>> +
>> +	fadev->attrs_kset =3D kset_create_and_add("attributes", NULL, &fadev->=
dev.kobj);
>> +	if (!fadev->attrs_kset) {
>> +		ret =3D -ENOMEM;
>> +		goto out_device_unregister;
>> +	}
>> +
>> +	ret =3D sysfs_create_groups(&fadev->attrs_kset->kobj, groups);
>> +	if (ret)
>> +		goto out_kset_unregister;
>
> It would be nicer for userspace to add the device to the hierarchy
> only when it is set up fully.
> Replacing device_register() with a device_initialize() above and
> device_add() down here.

Sure!

In the end however, children kobjects corresponding to "firmware
attributes" will still be added after device_add(), with
fwat_create_group().

Obviously, that only applies if we can all agree on the approach of
Patch 2. If you could take a look I would be very grateful!

>
>> +
>> +	return fadev;
>> +
>> +out_kset_unregister:
>> +	kset_unregister(fadev->attrs_kset);
>
> I *think* the driver core should clean up any child objects
> automatically, so this is unnecessary.

Hmm - I think filesystem is automatically cleaned up. But not putting
down the kset ref would leak it's allocated memory.

I'll verify this.

>
>> +
>> +out_device_unregister:
>> +	device_unregister(&fadev->dev);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_device_register);
>> +
>> +void fwat_device_unregister(struct fwat_device *fadev)
>> +{
>> +	if (!fadev)
>> +		return;
>> +
>> +	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
>> +	kset_unregister(fadev->attrs_kset);
>
> The also the two lines above would be unnecessary.

For the reason above I think kset_unregister() is still required.

Removing groups manually, on the other hand, is not required (I think).
I can remove that call.

>
>> +	device_unregister(&fadev->dev);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_device_unregister);
>> +
>> +static void devm_fwat_device_release(void *data)
>> +{
>> +	struct fwat_device *fadev =3D data;
>> +
>> +	fwat_device_unregister(fadev);
>> +}
>> +
>> +/**
>> + * devm_fwat_device_register - Create and register a firmware-attribute=
s class
>> + *			       device
>> + * @parent: Parent device
>> + * @name: Name of the class device
>> + * @data: Drvdata of the class device
>> + * @groups: Extra groups for the class device (Optional)
>> + *
>> + * Device managed version of fwat_device_register().
>> + *
>> + * Return: pointer to the new fwat_device on success, ERR_PTR on failur=
e
>> + */
>> +struct fwat_device *
>> +devm_fwat_device_register(struct device *parent, const char *name, void=
 *data,
>> +			  const struct attribute_group **groups)
>> +{
>> +	struct fwat_device *fadev;
>> +	int ret;
>> +
>> +	fadev =3D fwat_device_register(parent, name, data, groups);
>> +	if (IS_ERR(fadev))
>> +		return fadev;
>> +
>> +	ret =3D devm_add_action_or_reset(parent, devm_fwat_device_release, fad=
ev);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return fadev;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_fwat_device_register);
>
> ... and also all of the devm stuff.

Could you elaborate on this?

>
>> +
>>  static __init int fw_attributes_class_init(void)
>>  {
>>  	return class_register(&firmware_attributes_class);
>> @@ -23,5 +146,7 @@ static __exit void fw_attributes_class_exit(void)
>>  module_exit(fw_attributes_class_exit);
>> =20
>>  MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
>> +MODULE_AUTHOR("Thomas Wei=C3=9Fschuh <linux@weissschuh.net>");
>> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>>  MODULE_DESCRIPTION("Firmware attributes class helper module");
>>  MODULE_LICENSE("GPL");
>
> <snip>

Thanks for reviewing this!


--=20
 ~ Kurt

