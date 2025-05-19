Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A04B1E6B;
	Mon, 19 May 2025 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620568; cv=none; b=BQnP3oNdW/dFkjJmX+N5Xl9Xq3jkb5Yh1pGM8WcLH/zG61WPLIP4slidxApWW0WjWv1eMhnYXcpGK46iAlNiXpFlrXnoVeapwaEJbWpb8YZng/T7nJYN0fOglimXkLuXfTyS290kdjVETLJQ3X/kg4MlaI7lJw677Oom4rJRH1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620568; c=relaxed/simple;
	bh=o3t9aP/OLqtf2lFeu3LPlbWNHya14Flh9EjIUsYUJ3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYdx2BjW0pN9f2qZ5ZdDKwx6QRKMTOJSR5b7DBeSbGfe7YbOpwHYxfhNixbc7WQHL/o0I2oifq/8F6RJEK55M25Yy3xH+6CKz5f73VZDzcFB1amfqe6Zxj0VaF/nplUiqW+i+4jt0N77zuMBfWq2u3KS79Ki9NkXlhhJLvmphYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aEnqKXHW; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aEnqKXHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747620539; x=1748225339; i=w_armin@gmx.de;
	bh=ZfH/VhX828orQAjxUloJeuW1uAZeu/EPlnmyRkVJ+j4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aEnqKXHWXLS1L2mXZHgQlLL+Wu9MpqixRq0cpGOrBDsgM+0XoZhmSyk9Hak+p5zT
	 F8xM0+9CMPQs60gNSUHpSMdy5IajhYeBeXSoUQqsZxhDkl0Z4AzugTz8V9LFzPS4a
	 e5nEhvSUBqNPut46A9uR+KE/LTdsb/Aqb/2ZMlqu/Tm27gN/jdrElkMcjFJ+E3P0k
	 zv1uFgszZl4HWvrYJSwDacdHPV+FA/UxxmoGDYpVa4wVISySJXzEunSZNBHzN6rZZ
	 ZyaWGQc8n5p6Hk32uASRgDACgWd3VgpUdKoyHZPUJYepRxC5PvU1mIPPHu4Wv2B/o
	 DO3AmPXKfAM0/FH2Bg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1u8Lbn2fdR-002hgJ; Mon, 19
 May 2025 04:08:58 +0200
Message-ID: <b1cde7c1-98b9-40ea-a500-c90d18e15868@gmx.de>
Date: Mon, 19 May 2025 04:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] platform/x86: msi-wmi-platform: Add PL1/PL2
 support via firmware attributes
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-7-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oWdNZAjIX7THM5N348AxZtcRDIeLrq3aRRo6vgNnoEmBSyA9eZ+
 mQjyYXq1nCJpWR/udV0R4QrUr4K+W08Fkm8z3tCIeVIygwoOy59J7CbNBVLI0zkJ3fanJ7p
 ocrvWLAth+YAsYcl9o26fjFr6QyBfoN5D/3IRygH1SmoPxLVkpyQm3vGfFPnjXEM2H1T4XS
 SbbTQgD1cLuSzizw1AcnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AkRTQH0vntA=;+R/fUBuq0fa/0BX+OMnU7gfoyax
 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

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> Adds PL1, and PL2 support through the firmware attributes interface.
> The min and max values are quirked, and the attributes are only defined
> if they are set to a non-zero value. These values are meant to be set
> in conjunction with shift mode, where shift mode automatically sets
> an upper bound on PL1/PL2 (e.g., low-power would be used with 8W).
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/Kconfig            |   1 +
>   drivers/platform/x86/msi-wmi-platform.c | 361 +++++++++++++++++++++++-
>   2 files changed, 360 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 57a48910c8fd4..fd3da718731e7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -747,6 +747,7 @@ config MSI_WMI_PLATFORM
>   	depends on ACPI_WMI
>   	depends on HWMON
>   	select ACPI_PLATFORM_PROFILE
> +	select FW_ATTR_CLASS
>   	help
>   	  Say Y here if you want to have support for WMI-based platform featu=
res
>   	  like fan sensor access on MSI machines.
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index c0b577c95c079..6498f4b44fe53 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -34,6 +34,8 @@
>  =20
>   #include <linux/unaligned.h>
>  =20
> +#include "firmware_attributes_class.h"
> +
>   #define DRIVER_NAME	"msi-wmi-platform"
>  =20
>   #define MSI_PLATFORM_GUID	"ABBC0F6E-8EA1-11d1-00A0-C90629100000"
> @@ -74,6 +76,10 @@
>   #define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
>   #define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
>  =20
> +/* Get_Data() and Set_Data() Params */
> +#define MSI_PLATFORM_PL1_ADDR	0x50
> +#define MSI_PLATFORM_PL2_ADDR	0x51
> +
>   static bool force;
>   module_param_unsafe(force, bool, 0);
>   MODULE_PARM_DESC(force, "Force loading without checking for supported =
WMI interface versions");
> @@ -112,6 +118,9 @@ enum msi_wmi_platform_method {
>  =20
>   struct msi_wmi_platform_quirk {
>   	bool shift_mode;	/* Shift mode is supported */
> +	int pl_min;		/* Minimum PLx value */
> +	int pl1_max;		/* Maximum PL1 value */
> +	int pl2_max;		/* Maximum PL2 value */
>   };
>  =20
>   struct msi_wmi_platform_data {
> @@ -119,6 +128,44 @@ struct msi_wmi_platform_data {
>   	struct msi_wmi_platform_quirk *quirks;
>   	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>   	struct device *ppdev;
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
>   };
>  =20
>   struct msi_wmi_platform_debugfs_data {
> @@ -163,10 +210,16 @@ static const char * const msi_wmi_platform_debugfs=
_names[] =3D {
>  =20
>   static struct msi_wmi_platform_quirk quirk_default =3D {};
>   static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> -	.shift_mode =3D true
> +	.shift_mode =3D true,
> +	.pl_min =3D 8,
> +	.pl1_max =3D 43,
> +	.pl2_max =3D 45
>   };
>   static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> -	.shift_mode =3D true
> +	.shift_mode =3D true,
> +	.pl_min =3D 8,
> +	.pl1_max =3D 30,
> +	.pl2_max =3D 37
>   };
>  =20
>   static const struct dmi_system_id msi_quirks[] =3D {
> @@ -660,6 +713,306 @@ static const struct platform_profile_ops msi_wmi_p=
latform_profile_ops =3D {
>   	.profile_set =3D msi_wmi_platform_profile_set,
>   };
>  =20
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

Would it be possible to remove the check for min and max being 0 and inste=
ad only
register the associated attributes if this condition is met during probe?

> +
> +	buffer[0] =3D fwid;
> +	put_unaligned_le32(value, &buffer[1]);
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, si=
zeof(buffer));
> +	if (ret) {
> +		pr_warn("Failed to set_data with id %d: %d\n",
> +			fw_attr->fw_attr_id, ret);

Please remove this error message.

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
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, si=
zeof(buffer));
> +	if (ret) {
> +		pr_warn("Failed to show set_data for id %d: %d\n",
> +			fw_attr->fw_attr_id, ret);

Same as above.

> +		return ret;
> +	}
> +
> +	value =3D get_unaligned_le32(&buffer[1]);
> +
> +	return sysfs_emit(buf, "%d\n", value);
> +}
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj, st=
ruct kobj_attribute *attr,
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
> +static struct kobj_attribute fw_attr_pending_reboot =3D __ATTR_RO(pendi=
ng_reboot);
> +
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, display_name);
> +
> +	return sysfs_emit(buf, "%s\n", msi_fw_attr_desc[fw_attr->fw_attr_id]);
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_att=
ribute *attr, char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, current_value);
> +
> +	return fw_attr->get_value(fw_attr->data, fw_attr, buf);
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj, struct kobj_at=
tribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, current_value);
> +
> +	return fw_attr->set_value(fw_attr->data, fw_attr, buf, count);
> +}
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +static struct kobj_attribute fw_attr_type_int =3D {
> +	.attr =3D { .name =3D "type", .mode =3D 0444 },
> +	.show =3D type_show,
> +};
> +
> +static ssize_t min_value_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
> +			      char *buf)
> +{
> +	struct msi_fw_attr *fw_attr =3D
> +		container_of(attr, struct msi_fw_attr, min_value);
> +
> +	return sysfs_emit(buf, "%d\n", fw_attr->min);
> +}
> +
> +static ssize_t max_value_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
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
> +	fw_attr =3D devm_kzalloc(&data->wdev->dev, sizeof(*fw_attr), GFP_KERNE=
L);
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

Would it be possible to require but min and max limits to be present when
registering the firmware attributes?

> +
> +	attrs[idx] =3D NULL;
> +	return sysfs_create_group(&data->fw_attrs_kset->kobj, &fw_attr->attr_g=
roup);
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
> +	data->fw_attrs_dev =3D device_create(&firmware_attributes_class, NULL,=
 MKDEV(0, 0),
> +						 NULL, "%s", DRIVER_NAME);

Please make sure that the device name has an id in it to avoid naming coll=
ision should this driver
probe more than once.

Thanks,
Armin Wolf

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
> +	if (err) {
> +		kset_unregister(data->fw_attrs_kset);
> +		return err;
> +	}
> +
> +	err =3D devm_add_action_or_reset(&data->wdev->dev, msi_kset_unregister=
,
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
>   static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const c=
har __user *input,
>   					      size_t length, loff_t *offset)
>   {
> @@ -888,6 +1241,10 @@ static int msi_wmi_platform_probe(struct wmi_devic=
e *wdev, const void *context)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D msi_wmi_fw_attrs_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	msi_wmi_platform_debugfs_init(data);
>  =20
>   	msi_wmi_platform_profile_setup(data);
