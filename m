Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284651E485;
	Sun, 11 May 2025 23:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006482; cv=none; b=R7dixAQLlGdsKHcZLK0N8H0PGIGk6prPEoV/HhiCC9r/AJNKKZr8sZqG94z7WeJMSIS8EoslYwAwkC7HfUx/Xy3H4yNw9y5k+aZlovAa0bBQaa9VWT785V3mzcx6locinQKycrzmQLZ7a7XGglpvFZXRW4ejWj5cz2h1qRMAlrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006482; c=relaxed/simple;
	bh=45jQST0KWGL1lA3141aIeJqfLQwnDhLIhd2Srrp0Q+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kCgy0o5Ghh6WOOLtOvw27PclTwUwhLuylgzBdsz4VJ/7+IygzFwX1NneBW0ufLknrrsVrPBc5nKplngOkTGCrqdIhpuosWjaL3eIeQ6uTsBfqOBt2761SSV6hE8ijQU/k9euXhb2dDMhvnUW5l0DPY9QxyVb8AX4rA4wLh+tHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEyN/g5B; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEyN/g5B"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5259331b31eso1370169e0c.0;
        Sun, 11 May 2025 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006479; x=1747611279; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odGz0MfcpJ/h0TGFVeVcqEF2o/+hBscssV20Q+X4W5M=;
        b=WEyN/g5BZiH/FITvwIE8tAptFyDpuzyM2nzP7KQTpAFQejHvMRATAEm+DqeV5QofGn
         mDAzGiBoVSX5C9udvuZ+kHmNMiqxJxX48RdZcxuOGMDy6SXQn94csMeCHSv3cgYKytLj
         9zJSGLHAG4wPxneZLrR2qQVFzKhdBn37v3/iQS0xcBkBI4SoChuIce3LmZcBcAZwSwSj
         QPUwYczdMj9CUALjKvRoZXPpq1e0VST/Kq38jixIKfk0jyaUxHdvnigZoRA8Ubo3biT/
         6/kKPuS5WRbpGjImhX/JzaW7j9sw/6lQv6pDxZMnaYFk1ULZCgkuXRSkA4fzw1lxWS1x
         xdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006479; x=1747611279;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=odGz0MfcpJ/h0TGFVeVcqEF2o/+hBscssV20Q+X4W5M=;
        b=SFoSAvex7dI0zuapiiaXBbgykDJgnGi+sg4DaDklf0vUIFxPOR2AbDUiJocVfXVIwY
         0DrGRZ/OVErt2LSwL4bGO9QxUnWntA5xMC0h9rupLbcqMVRTY6fqB24kK3EDEXPONfSm
         N4CRlVXeJY1wYjQuE+ioLshxsx8yY7aRgVyohGtgk2Wspi286nJVeBWlhGMM9hgwycQI
         7ASxXJ5PzFZHkdWfhGRoRZblhhXicZ8uV7pZLNOT1XEWv6h2pj+3585rH7MPRhdXCHKu
         MXzeGugYIcex2PwLDcnhNvYnuVVx+Yxz8NFmYKYTPFiKjrkuMWhH5r0pTwjcf6sktOeP
         zOUA==
X-Forwarded-Encrypted: i=1; AJvYcCUCXVcIY9hc9qv+EqeyHTMQ0RE10gVFALm+d7xEEBx/y8XqcFwcmA/Y/LH8R68YuxhjclaU86I5iaw7jVIDWIYIqMM7vw==@vger.kernel.org, AJvYcCUSxo6vVeMMy/XqItqgGREXZvP28a3sqemv3IYZk0YT8xTZ3k47cCa27Py3gihhf6M6z9RhEqUTgBE=@vger.kernel.org, AJvYcCVM52jse+hU+kKlfV+NrDW4rD+VrAJuqbnFvkAQikTfeZ6Wl4DtS6158gtT2G65o+CUhJXUb8Q5jg6CR70=@vger.kernel.org, AJvYcCXEDSJexQvmSPYpKgiEtQ9a9CE7o9JGS+F0WpUi11NMLPBZXlmUkT2EwjVbfTjO8eHQh0t2OFw6Kvn+rpXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qBaY8hRzGbRPk/yvDBefZjmaXO/IJErBLFvjTe4b6olQvvCW
	3VMqbDcLQzWkDyIFjNlU974TqJpNWH82LDb4z+16AWN8zNnzW+7c
X-Gm-Gg: ASbGncsJUhbApdwz+ufTqdXahMlZSMehyckozNv/5fGuLtXZ/XBP4Q55+1s0Utfqbky
	nxS6RaYJG8YLZIYSUpCh+u+WL3dinBJyCBWsojpepky84h/kgfZkmxirTwdHAblNjK14SEzSPTN
	YABYUJ4ZNJW0kzmDF5Ja92SxwJEgxadIyKtclygdvw6e4iBkc7MO00cXyvXv/HqLuPMBfS8soRk
	rX1cImvQclrwiw8gwfUxz8e+8b22cDj5GFyRQGTVhkoax77M1M4tXWRUt/NydbYwRCjUllJBhe7
	yshogRM+BQLViHvzvmUD5PuR3BB4qdsKzFf2EP9fZ6VE
X-Google-Smtp-Source: AGHT+IHAhS/IpZAzAiOdt/Pe/KPXbULUcKJHhDnCx5wcG/XNQYwl2NRrYmWfknstWW49e018lqovwA==
X-Received: by 2002:a05:6102:5e97:b0:4c5:8d52:af3 with SMTP id ada2fe7eead31-4deed3cf755mr9301581137.20.1747006479014;
        Sun, 11 May 2025 16:34:39 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb2016d30sm4275965137.21.2025.05.11.16.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=da0217b6c71c9aca9fb49796ac8c341f2f895fba35a632f42f2aa68d50cf;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:34:34 -0300
Message-Id: <D9TQ3YPQDD4W.3JQOYGQB5GS7P@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 06/10] platform/x86: msi-wmi-platform: Add PL1/PL2
 support via firmware attributes
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-7-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-7-lkml@antheas.dev>

--da0217b6c71c9aca9fb49796ac8c341f2f895fba35a632f42f2aa68d50cf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> Adds PL1, and PL2 support through the firmware attributes interface.
> The min and max values are quirked, and the attributes are only defined
> if they are set to a non-zero value. These values are meant to be set
> in conjunction with shift mode, where shift mode automatically sets
> an upper bound on PL1/PL2 (e.g., low-power would be used with 8W).
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/Kconfig            |   1 +
>  drivers/platform/x86/msi-wmi-platform.c | 361 +++++++++++++++++++++++-
>  2 files changed, 360 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 57a48910c8fd4..fd3da718731e7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -747,6 +747,7 @@ config MSI_WMI_PLATFORM
>  	depends on ACPI_WMI
>  	depends on HWMON
>  	select ACPI_PLATFORM_PROFILE
> +	select FW_ATTR_CLASS
>  	help
>  	  Say Y here if you want to have support for WMI-based platform feature=
s
>  	  like fan sensor access on MSI machines.
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index c0b577c95c079..6498f4b44fe53 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -34,6 +34,8 @@
> =20
>  #include <linux/unaligned.h>
> =20
> +#include "firmware_attributes_class.h"
> +
>  #define DRIVER_NAME	"msi-wmi-platform"
> =20
>  #define MSI_PLATFORM_GUID	"ABBC0F6E-8EA1-11d1-00A0-C90629100000"
> @@ -74,6 +76,10 @@
>  #define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
>  #define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
> =20
> +/* Get_Data() and Set_Data() Params */
> +#define MSI_PLATFORM_PL1_ADDR	0x50
> +#define MSI_PLATFORM_PL2_ADDR	0x51
> +
>  static bool force;
>  module_param_unsafe(force, bool, 0);
>  MODULE_PARM_DESC(force, "Force loading without checking for supported WM=
I interface versions");
> @@ -112,6 +118,9 @@ enum msi_wmi_platform_method {
> =20
>  struct msi_wmi_platform_quirk {
>  	bool shift_mode;	/* Shift mode is supported */
> +	int pl_min;		/* Minimum PLx value */
> +	int pl1_max;		/* Maximum PL1 value */
> +	int pl2_max;		/* Maximum PL2 value */
>  };
> =20
>  struct msi_wmi_platform_data {
> @@ -119,6 +128,44 @@ struct msi_wmi_platform_data {
>  	struct msi_wmi_platform_quirk *quirks;
>  	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>  	struct device *ppdev;
> +	struct device *fw_attrs_dev;
> +	struct kset *fw_attrs_kset;
> +};
> +
> +enum msi_fw_attr_id {
> +	MSI_ATTR_PPT_PL1_SPL,
> +	MSI_ATTR_PPT_PL2_SPPT,
> +};
> +
> +static const char *const msi_fw_attr_name[] =3D {
> +	[MSI_ATTR_PPT_PL1_SPL] =3D "ppt_pl1_spl",
> +	[MSI_ATTR_PPT_PL2_SPPT] =3D "ppt_pl2_sppt",
> +};
> +
> +static const char *const msi_fw_attr_desc[] =3D {
> +	[MSI_ATTR_PPT_PL1_SPL] =3D "CPU Steady package limit (PL1/SPL)",
> +	[MSI_ATTR_PPT_PL2_SPPT] =3D "CPU Boost slow package limit (PL2/SPPT)",
> +};
> +
> +#define MSI_ATTR_LANGUAGE_CODE "en_US.UTF-8"
> +
> +struct msi_fw_attr {
> +	struct msi_wmi_platform_data *data;
> +	enum msi_fw_attr_id fw_attr_id;
> +	struct attribute_group attr_group;
> +	struct kobj_attribute display_name;
> +	struct kobj_attribute current_value;
> +	struct kobj_attribute min_value;
> +	struct kobj_attribute max_value;
> +
> +	u32 min;
> +	u32 max;
> +
> +	int (*get_value)(struct msi_wmi_platform_data *data,
> +			 struct msi_fw_attr *fw_attr, char *buf);
> +	ssize_t (*set_value)(struct msi_wmi_platform_data *data,
> +			     struct msi_fw_attr *fw_attr, const char *buf,
> +			     size_t count);
>  };
> =20
>  struct msi_wmi_platform_debugfs_data {
> @@ -163,10 +210,16 @@ static const char * const msi_wmi_platform_debugfs_=
names[] =3D {
> =20
>  static struct msi_wmi_platform_quirk quirk_default =3D {};
>  static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> -	.shift_mode =3D true
> +	.shift_mode =3D true,
> +	.pl_min =3D 8,
> +	.pl1_max =3D 43,
> +	.pl2_max =3D 45
>  };
>  static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> -	.shift_mode =3D true
> +	.shift_mode =3D true,
> +	.pl_min =3D 8,
> +	.pl1_max =3D 30,
> +	.pl2_max =3D 37
>  };
> =20
>  static const struct dmi_system_id msi_quirks[] =3D {
> @@ -660,6 +713,306 @@ static const struct platform_profile_ops msi_wmi_pl=
atform_profile_ops =3D {
>  	.profile_set =3D msi_wmi_platform_profile_set,
>  };
> =20
> +/* Firmware Attributes setup */
> +static int data_get_addr(struct msi_wmi_platform_data *data,
> +			 const enum msi_fw_attr_id id)
> +{
> +	switch (id) {
> +	case MSI_ATTR_PPT_PL1_SPL:
> +		return MSI_PLATFORM_PL1_ADDR;
> +	case MSI_ATTR_PPT_PL2_SPPT:
> +		return MSI_PLATFORM_PL2_ADDR;
> +	default:
> +		pr_warn("Invalid attribute id %d\n", id);
> +		return -EINVAL;
> +	}
> +}
> +
> +static ssize_t data_set_value(struct msi_wmi_platform_data *data,
> +			      struct msi_fw_attr *fw_attr, const char *buf,
> +			      size_t count)
> +{
> +	u8 buffer[32] =3D { 0 };
> +	int ret, fwid;
> +	u32 value;
> +
> +	fwid =3D data_get_addr(data, fw_attr->fw_attr_id);
> +	if (fwid < 0)
> +		return fwid;
> +
> +	ret =3D kstrtou32(buf, 10, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (fw_attr->min >=3D 0 && value < fw_attr->min)
> +		return -EINVAL;
> +	if (fw_attr->max >=3D 0 && value > fw_attr->max)
> +		return -EINVAL;

Maybe clamp instead of failing?

> +
> +	buffer[0] =3D fwid;
> +	put_unaligned_le32(value, &buffer[1]);
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, siz=
eof(buffer));
> +	if (ret) {
> +		pr_warn("Failed to set_data with id %d: %d\n",
> +			fw_attr->fw_attr_id, ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static int data_get_value(struct msi_wmi_platform_data *data,
> +			  struct msi_fw_attr *fw_attr, char *buf)
> +{
> +	u8 buffer[32] =3D { 0 };
> +	u32 value;
> +	int ret, addr;
> +
> +	addr =3D data_get_addr(data, fw_attr->fw_attr_id);
> +	if (addr < 0)
> +		return addr;
> +
> +	buffer[0] =3D addr;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, siz=
eof(buffer));
> +	if (ret) {
> +		pr_warn("Failed to show set_data for id %d: %d\n",
> +			fw_attr->fw_attr_id, ret);
> +		return ret;
> +	}
> +
> +	value =3D get_unaligned_le32(&buffer[1]);
> +
> +	return sysfs_emit(buf, "%d\n", value);
> +}
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj, str=
uct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", MSI_ATTR_LANGUAGE_CODE);
> +}
> +
> +static struct kobj_attribute fw_attr_display_name_language_code =3D
> +	__ATTR_RO(display_name_language_code);
> +
> +static ssize_t scalar_increment_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute fw_attr_scalar_increment =3D
> +	__ATTR_RO(scalar_increment);
> +
> +static ssize_t pending_reboot_show(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static struct kobj_attribute fw_attr_pending_reboot =3D __ATTR_RO(pendin=
g_reboot);
> +
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, display_name);
> +
> +	return sysfs_emit(buf, "%s\n", msi_fw_attr_desc[fw_attr->fw_attr_id]);
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, current_value);
> +
> +	return fw_attr->get_value(fw_attr->data, fw_attr, buf);
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj, struct kobj_att=
ribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, current_value);
> +
> +	return fw_attr->set_value(fw_attr->data, fw_attr, buf, count);
> +}
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *at=
tr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +static struct kobj_attribute fw_attr_type_int =3D {
> +	.attr =3D { .name =3D "type", .mode =3D 0444 },
> +	.show =3D type_show,
> +};

Use __ATTR_RO().

> +
> +static ssize_t min_value_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +			      char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, min_value);
> +
> +	return sysfs_emit(buf, "%d\n", fw_attr->min);
> +}
> +
> +static ssize_t max_value_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +			      char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, max_value);
> +
> +	return sysfs_emit(buf, "%d\n", fw_attr->max);
> +}
> +
> +#define FW_ATTR_ENUM_MAX_ATTRS  7
> +
> +static int
> +msi_fw_attr_init(struct msi_wmi_platform_data *data,
> +		 const enum msi_fw_attr_id fw_attr_id,
> +		 struct kobj_attribute *fw_attr_type, const s32 min,
> +		 const s32 max,
> +		 int (*get_value)(struct msi_wmi_platform_data *data,
> +				  struct msi_fw_attr *fw_attr, char *buf),
> +		 ssize_t (*set_value)(struct msi_wmi_platform_data *data,
> +				      struct msi_fw_attr *fw_attr,
> +				      const char *buf, size_t count))
> +{
> +	struct msi_fw_attr *fw_attr;
> +	struct attribute **attrs;
> +	int idx =3D 0;
> +
> +	fw_attr =3D devm_kzalloc(&data->wdev->dev, sizeof(*fw_attr), GFP_KERNEL=
);
> +	if (!fw_attr)
> +		return -ENOMEM;
> +
> +	attrs =3D devm_kcalloc(&data->wdev->dev, FW_ATTR_ENUM_MAX_ATTRS + 1,
> +			     sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	fw_attr->data =3D data;
> +	fw_attr->fw_attr_id =3D fw_attr_id;
> +	fw_attr->attr_group.name =3D msi_fw_attr_name[fw_attr_id];
> +	fw_attr->attr_group.attrs =3D attrs;
> +	fw_attr->get_value =3D get_value;
> +	fw_attr->set_value =3D set_value;
> +
> +	attrs[idx++] =3D &fw_attr_type->attr;
> +	if (fw_attr_type =3D=3D &fw_attr_type_int)
> +		attrs[idx++] =3D &fw_attr_scalar_increment.attr;
> +	attrs[idx++] =3D &fw_attr_display_name_language_code.attr;
> +
> +	sysfs_attr_init(&fw_attr->display_name.attr);
> +	fw_attr->display_name.attr.name =3D "display_name";
> +	fw_attr->display_name.attr.mode =3D 0444;
> +	fw_attr->display_name.show =3D display_name_show;
> +	attrs[idx++] =3D &fw_attr->display_name.attr;
> +
> +	sysfs_attr_init(&fw_attr->current_value.attr);
> +	fw_attr->current_value.attr.name =3D "current_value";
> +	fw_attr->current_value.attr.mode =3D 0644;
> +	fw_attr->current_value.show =3D current_value_show;
> +	fw_attr->current_value.store =3D current_value_store;
> +	attrs[idx++] =3D &fw_attr->current_value.attr;
> +
> +	if (min >=3D 0) {
> +		fw_attr->min =3D min;
> +		sysfs_attr_init(&fw_attr->min_value.attr);
> +		fw_attr->min_value.attr.name =3D "min_value";
> +		fw_attr->min_value.attr.mode =3D 0444;
> +		fw_attr->min_value.show =3D min_value_show;
> +		attrs[idx++] =3D &fw_attr->min_value.attr;
> +	} else {
> +		fw_attr->min =3D -1;
> +	}
> +
> +	if (max >=3D 0) {
> +		fw_attr->max =3D max;
> +		sysfs_attr_init(&fw_attr->max_value.attr);
> +		fw_attr->max_value.attr.name =3D "max_value";
> +		fw_attr->max_value.attr.mode =3D 0444;
> +		fw_attr->max_value.show =3D max_value_show;
> +		attrs[idx++] =3D &fw_attr->max_value.attr;
> +	} else {
> +		fw_attr->max =3D -1;
> +	}
> +
> +	attrs[idx] =3D NULL;

kcalloc already sets this to 0.

> +	return sysfs_create_group(&data->fw_attrs_kset->kobj, &fw_attr->attr_gr=
oup);

This group is never removed.

I think it's not that big of a deal? But you should probably do it
anyway.

> +}
> +
> +static void msi_kset_unregister(void *data)
> +{
> +	struct kset *kset =3D data;
> +
> +	sysfs_remove_file(&kset->kobj, &fw_attr_pending_reboot.attr);
> +	kset_unregister(kset);
> +}
> +
> +static void msi_fw_attrs_dev_unregister(void *data)
> +{
> +	struct device *fw_attrs_dev =3D data;
> +
> +	device_unregister(fw_attrs_dev);
> +}
> +
> +static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
> +{
> +	int err;
> +
> +	data->fw_attrs_dev =3D device_create(&firmware_attributes_class, NULL, =
MKDEV(0, 0),
> +						 NULL, "%s", DRIVER_NAME);

Set the wmi device as the parent.

> +	if (IS_ERR(data->fw_attrs_dev))
> +		return PTR_ERR(data->fw_attrs_dev);
> +
> +	err =3D devm_add_action_or_reset(&data->wdev->dev,
> +				       msi_fw_attrs_dev_unregister,
> +				       data->fw_attrs_dev);
> +	if (err)
> +		return err;
> +
> +	data->fw_attrs_kset =3D kset_create_and_add("attributes", NULL,
> +						  &data->fw_attrs_dev->kobj);
> +	if (!data->fw_attrs_kset)
> +		return -ENOMEM;
> +
> +	err =3D sysfs_create_file(&data->fw_attrs_kset->kobj,
> +				&fw_attr_pending_reboot.attr);

If it's always 0 why include it? It's not mandatory anyway.

--=20
 ~ Kurt

> +	if (err) {
> +		kset_unregister(data->fw_attrs_kset);
> +		return err;
> +	}
> +
> +	err =3D devm_add_action_or_reset(&data->wdev->dev, msi_kset_unregister,
> +				       data->fw_attrs_kset);
> +	if (err)
> +		return err;
> +
> +	if (data->quirks->pl1_max) {
> +		err =3D msi_fw_attr_init(data, MSI_ATTR_PPT_PL1_SPL,
> +					&fw_attr_type_int, data->quirks->pl_min,
> +					data->quirks->pl1_max, &data_get_value,
> +					&data_set_value);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (data->quirks->pl2_max) {
> +		err =3D msi_fw_attr_init(data, MSI_ATTR_PPT_PL2_SPPT,
> +				       &fw_attr_type_int, data->quirks->pl_min,
> +				       data->quirks->pl2_max, &data_get_value,
> +				       &data_set_value);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const cha=
r __user *input,
>  					      size_t length, loff_t *offset)
>  {
> @@ -888,6 +1241,10 @@ static int msi_wmi_platform_probe(struct wmi_device=
 *wdev, const void *context)
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D msi_wmi_fw_attrs_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>  	msi_wmi_platform_debugfs_init(data);
> =20
>  	msi_wmi_platform_profile_setup(data);


--da0217b6c71c9aca9fb49796ac8c341f2f895fba35a632f42f2aa68d50cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCE0DgAKCRAWYEM49J/U
Zu/QAQC7qxKdQaDNsCEC18Fp9aKhzLee3FBQdIH1YUW2LkdBhgD/dZlEsrhfAfu9
fa1ChUusngFbImI1l/hCQXrUnCdtzAY=
=SP1s
-----END PGP SIGNATURE-----

--da0217b6c71c9aca9fb49796ac8c341f2f895fba35a632f42f2aa68d50cf--
