Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BEF26AA93;
	Wed, 23 Apr 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395543; cv=none; b=SGkuQVTHNK5jBxrbkwWn4JiGjXTjtr1cXwQBxMNB4oogP/M11GswwRP0z59gmDzFbSqQK1klxZvqEzMvG0/OPmE1NuZ6f4X2Jfbp8vTfny1Z+8iamnfPSPj4F3ekavWp8J+JjVYdwt7Ij/XRxCa07V3oSqKgIeVQlXCSbLtMdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395543; c=relaxed/simple;
	bh=KUyrRN8NjKL+c1I9SS/fI/oehCmKuyGz2I/+FaYF3oc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JTIz6k1bCsH3Rc9bsbe5Yo2JnrwnQ6vkXXWa6UPO0hWnhbS89Cf+TaCaLcEqiKJYqc2Onzlu67Qis5KiW2t6Jk1rGBJD24Ieo7l47zZQJ0LCH8ctWXprpX9mS0S89ZmvPmnTPLPASCXny99F6As76narIqlP6pU6Ea10VYyeQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG/+WCnG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG/+WCnG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22435603572so65443345ad.1;
        Wed, 23 Apr 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745395539; x=1746000339; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpZG8w/6yabmuOISJ5IM1b+4kVX8LAERzuJkJnF5eAE=;
        b=iG/+WCnGiQwysYQlD+nBqDkJBsroKFDuXDTSuBrguWSMfHOAH4OZeJFZ5BiBQSPXmA
         3LkB8MFcQXCFSxYYankolYCVLG6w2cgrvnOfuaksVg91nwe8O70mNLxVjK3AOx3Hshb3
         JVEy+xslBOBIxKo606EgGbBGOs27pqDFHuOJjiY5SIQ9KRNRfuWK5DEj2PpeYVdIQelF
         xQKSE3+Tj/c/k4BZ/Nks+3j+qIX9ctlwrU1Fmntar1EZefg7nRdS90be5OKDecKZAWkL
         L0MWVpaXBbFT7YDvCw7ZqdkED8kKwoxAH91uD565fwg8mUGzwIGhMoB8jn9ss4rxsNpa
         DT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395539; x=1746000339;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qpZG8w/6yabmuOISJ5IM1b+4kVX8LAERzuJkJnF5eAE=;
        b=FjUa2tb2ePfiEuZUnozUJ+OBk0yI1gijoL3tzskmDjcQegEOvVK8lBZSg6xcqk3TUI
         VnMMEzBIfBOvFpIALkl16UlZBgYjTECOBCiBBkbO4M7o2cNM9uFeq8bVGxnaM2vskLff
         adDkL8dK6JpyUigtMxGKQFKGQ+iAmYeTkTjcYEgJ+4Kqj6zMyl2vgVEeKv6dox3wjxZe
         RAB2Lcj1YELLI+sJ5TPCY2XWpwkwK2p1zazFjQvzI3zavZ0ZMe1vVSzm8x3Lv00tfPp2
         pZyk8C5ETgUmQXUuKX1nEbuB6ss2xAZrFism2Sfix/HtjcImgSrFoMD35NpDsQaM2gAu
         ZWUA==
X-Forwarded-Encrypted: i=1; AJvYcCWN7/+kxzLU2kQVymu9opK8HJ4FMibSSzGzgONDLwO7b5H+IfxmHTK2M2DkkRwQ1qSVBaeGo+pTTuFf1NU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxk/0TUcJxYg5dUHxCpolI9S0kvqp5fx9TCc64nrO7fzm+qssU
	rlw9P6GHG4inckQShB0tWHNvWqxlRvUXy8tDWsC1BKDFHNlcWZEI
X-Gm-Gg: ASbGncswZyAsNZXikyYseBOQGDcxXMnFdvfAo6127yyEd4HJfFmoKD7k7Sa2vT9NG1Z
	JUZG5MrEQm421UeqEdRptUxmuUZyeXQiqqMOKe2iKNAwmVBZ5diMh1d63so4UL0rr1eFYvgcPKo
	bmecICpYEBw4kXo+lzEdyDQFKzZz9eea2qMV7j1sIUJEYE+sA/ut9LEhTYCfIRZelpPmAlceHGc
	HArce6z+JmrTalPcdu2N2gtUmUzc16fhuC1XK5uROxE1r/qz86p9nT7BxNskHeCdSanvASm0egt
	t4RrXcberZ8HZ5hlQt3I1/yhMQKB0vHq5w==
X-Google-Smtp-Source: AGHT+IHaLJhz40kitf1dYKxTtQaOLc9OHtiq3tVK1R7dXUzLw86SAuLeMwfNyJbH6EnFurdvEogCog==
X-Received: by 2002:a17:903:3c6b:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22c535ac9bfmr292361185ad.28.1745395539370;
        Wed, 23 Apr 2025 01:05:39 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdf1f1sm97881165ad.237.2025.04.23.01.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 01:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 05:05:35 -0300
Message-Id: <D9DV2VOCWEK3.TQ96Z41CV0P4@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Joshua Grisham" <josh@joshuagrisham.com>
Subject: Re: [PATCH 1/2] platform/x86: firmware_attributes_class: Provide a
 highlevel interface
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Hans de
 Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net> <20250107-pdx86-firmware-attributes-v1-1-9d75c04a3b52@weissschuh.net>
In-Reply-To: <20250107-pdx86-firmware-attributes-v1-1-9d75c04a3b52@weissschuh.net>

On Tue Jan 7, 2025 at 2:05 PM -03, Thomas Wei=C3=9Fschuh wrote:
> Currently each user of firmware_attributes_class has to manually set up
> kobjects, devices, etc.
> Provide a higher level API which takes care of the low-level details.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/platform/x86/firmware_attributes_class.c | 146 +++++++++++++++++=
++++++
>  drivers/platform/x86/firmware_attributes_class.h |  37 ++++++
>  2 files changed, 183 insertions(+)
>
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/p=
latform/x86/firmware_attributes_class.c
> index 736e96c186d9dc6d945517f090e9af903e93bbf4..70ceae5215820098b017bfda9=
91a3c2a7824c98e 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -2,6 +2,9 @@
> =20
>  /* Firmware attributes class helper module */
> =20
> +#include <linux/device/class.h>
> +#include <linux/device.h>
> +#include <linux/kobject.h>
>  #include <linux/module.h>
>  #include "firmware_attributes_class.h"
> =20
> @@ -22,6 +25,149 @@ static __exit void fw_attributes_class_exit(void)
>  }
>  module_exit(fw_attributes_class_exit);
> =20
> +static ssize_t fw_attributes_sysfs_show(struct kobject *kobj, struct att=
ribute *attr, char *buf)
> +{
> +	struct firmware_attributes_device *fwadev =3D to_firmware_attribute_dev=
ice(kobj);
> +	const struct firmware_attribute *fw_attr =3D to_firmware_attribute(attr=
);
> +
> +	if (!fw_attr->show)
> +		return -EIO;
> +
> +	return fw_attr->show(fwadev, fw_attr, buf);
> +}
> +
> +static ssize_t fw_attributes_sysfs_store(struct kobject *kobj, struct at=
tribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct firmware_attributes_device *fwadev =3D to_firmware_attribute_dev=
ice(kobj);
> +	const struct firmware_attribute *fw_attr =3D to_firmware_attribute(attr=
);
> +
> +	if (!fw_attr->store)
> +		return -EIO;
> +
> +	return fw_attr->store(fwadev, fw_attr, buf, count);
> +}
> +
> +static const struct sysfs_ops fw_attributes_sysfs_ops =3D {
> +	.show	=3D fw_attributes_sysfs_show,
> +	.store	=3D fw_attributes_sysfs_store,
> +};
> +
> +static void fw_attributes_attr_release(struct kobject *kobj)
> +{
> +	struct firmware_attributes_device *fwadev =3D to_firmware_attribute_dev=
ice(kobj);
> +	struct device *cdev;
> +
> +	cdev =3D fwadev->dev;
> +
> +	kfree(fwadev);
> +	device_unregister(cdev);
> +}
> +
> +static const struct kobj_type fw_attributes_attr_type =3D {
> +	.sysfs_ops	=3D &fw_attributes_sysfs_ops,
> +	.release	=3D fw_attributes_attr_release,
> +};
> +
> +DEFINE_FREE(firmware_attributes_device_unregister, struct firmware_attri=
butes_device *,
> +	    if (_T) firmware_attributes_device_unregister(_T))
> +
> +struct firmware_attributes_device *
> +firmware_attributes_device_register(struct device *parent, const char *n=
ame,
> +				    const struct attribute_group **groups, void *data)
> +{
> +	struct firmware_attributes_device *fwadev =3D NULL;
> +	struct device *cdev =3D NULL;
> +	int ret;
> +
> +	fwadev =3D kzalloc(sizeof(*fwadev), GFP_KERNEL);
> +	if (!fwadev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cdev =3D device_create(&firmware_attributes_class, parent, MKDEV(0, 0),=
 "%s", name);
> +	if (IS_ERR(cdev))
> +		return ERR_CAST(cdev);
> +
> +	fwadev->data =3D data;
> +	fwadev->dev =3D cdev;
> +
> +	ret =3D kobject_init_and_add(&fwadev->attributes, &fw_attributes_attr_t=
ype, &cdev->kobj,
> +				   "attributes");
> +	if (ret) {
> +		device_del(cdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	if (groups) {
> +		ret =3D sysfs_create_groups(&fwadev->attributes, groups);
> +		if (ret) {
> +			firmware_attributes_device_unregister(fwadev);
> +			return ERR_PTR(ret);
> +		}
> +
> +		kobject_uevent(&fwadev->dev->kobj, KOBJ_CHANGE);
> +	}
> +
> +	return fwadev;
> +}
> +EXPORT_SYMBOL_GPL(firmware_attributes_device_register);
> +
> +void firmware_attributes_device_unregister(struct firmware_attributes_de=
vice *fwadev)
> +{
> +	kobject_del(&fwadev->attributes);
> +	kobject_put(&fwadev->attributes);
> +}
> +EXPORT_SYMBOL_GPL(firmware_attributes_device_unregister);
> +
> +static void devm_firmware_attributes_device_release(void *data)
> +{
> +	struct firmware_attributes_device *fwadev =3D data;
> +
> +	firmware_attributes_device_unregister(fwadev);
> +}
> +
> +struct firmware_attributes_device *
> +devm_firmware_attributes_device_register(struct device *parent, const ch=
ar *name,
> +					 const struct attribute_group **groups, void *data)
> +{
> +	struct firmware_attributes_device *fwadev;
> +	int ret;
> +
> +	fwadev =3D firmware_attributes_device_register(parent, name, groups, da=
ta);
> +	if (IS_ERR(fwadev))
> +		return fwadev;
> +
> +	ret =3D devm_add_action_or_reset(parent, devm_firmware_attributes_devic=
e_release, fwadev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return fwadev;
> +}
> +EXPORT_SYMBOL_GPL(devm_firmware_attributes_device_register);
> +
> +static ssize_t firmware_attributes_type_show(struct firmware_attributes_=
device *fwadev,
> +					     const struct firmware_attribute *attr, char *buf)
> +{
> +	if (attr =3D=3D &_firmware_attribute_type_string)
> +		return sysfs_emit(buf, "string\n");
> +	else if (attr =3D=3D &_firmware_attribute_type_enumeration)
> +		return sysfs_emit(buf, "enumeration\n");
> +	else if (attr =3D=3D &_firmware_attribute_type_integer)
> +		return sysfs_emit(buf, "integer\n");
> +	else
> +		return -EIO;
> +}
> +
> +#define __FW_TYPE_ATTR	__ATTR(type, 0444, firmware_attributes_type_show,=
 NULL)
> +
> +const struct firmware_attribute _firmware_attribute_type_string =3D __FW=
_TYPE_ATTR;
> +EXPORT_SYMBOL_GPL(_firmware_attribute_type_string);
> +const struct firmware_attribute _firmware_attribute_type_enumeration =3D=
 __FW_TYPE_ATTR;
> +EXPORT_SYMBOL_GPL(_firmware_attribute_type_enumeration);
> +const struct firmware_attribute _firmware_attribute_type_integer =3D __F=
W_TYPE_ATTR;
> +EXPORT_SYMBOL_GPL(_firmware_attribute_type_integer);
> +
>  MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_AUTHOR("Thomas Wei=C3=9Fschuh <linux@weissschuh.net>");
>  MODULE_DESCRIPTION("Firmware attributes class helper module");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/p=
latform/x86/firmware_attributes_class.h
> index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..66837ad9f65b8ca501dee73f4=
8c01f2710d86bf5 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -5,8 +5,45 @@
>  #ifndef FW_ATTR_CLASS_H
>  #define FW_ATTR_CLASS_H
> =20
> +#include <linux/device.h>
>  #include <linux/device/class.h>
> +#include <linux/sysfs.h>
> =20
>  extern const struct class firmware_attributes_class;
> =20
> +struct firmware_attributes_device {
> +	struct device *dev;
> +	struct kobject attributes;
> +	void *data;
> +};
> +
> +struct firmware_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct firmware_attributes_device *fwadev,
> +			const struct firmware_attribute *attr, char *buf);
> +	ssize_t (*store)(struct firmware_attributes_device *fwadev,
> +			 const struct firmware_attribute *attr, const char *buf, size_t count=
);
> +};
> +
> +#define to_firmware_attribute(_a) container_of_const(_a, struct firmware=
_attribute, attr)
> +#define to_firmware_attribute_device(_s) \
> +	container_of_const(_s, struct firmware_attributes_device, attributes)
> +
> +extern const struct firmware_attribute _firmware_attribute_type_string;
> +#define firmware_attribute_type_string ((struct attribute *)&_firmware_a=
ttribute_type_string.attr)
> +extern const struct firmware_attribute _firmware_attribute_type_enumerat=
ion;
> +#define firmware_attribute_type_enumeration ((struct attribute *)&_firmw=
are_attribute_type_enumeration.attr)
> +extern const struct firmware_attribute _firmware_attribute_type_integer;
> +#define firmware_attribute_type_integer ((struct attribute *)&_firmware_=
attribute_type_integer.attr)
> +
> +struct firmware_attributes_device * __must_check
> +firmware_attributes_device_register(struct device *parent, const char *n=
ame,
> +				    const struct attribute_group **groups, void *data);
> +
> +void firmware_attributes_device_unregister(struct firmware_attributes_de=
vice *fwadev);
> +
> +struct firmware_attributes_device * __must_check
> +devm_firmware_attributes_device_register(struct device *parent, const ch=
ar *name,
> +					 const struct attribute_group **groups, void *data);
> +
>  #endif /* FW_ATTR_CLASS_H */

Hi Thomas,

Are you still working on this patchset?

If you don't mind I can take it from here. I'm planning on fixing a
couple memory leaks of this patch and extend it a bit more with some
helper macros for ABI compliant drivers. I might drop the test driver
though.

I ask this because I want to use this class in another series I'm
to do, and I think this patch is a great starting point.

Let me know what you think!

--=20
 ~ Kurt
