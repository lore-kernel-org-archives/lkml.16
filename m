Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2111553A3;
	Sun,  6 Jul 2025 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833134; cv=none; b=MWeIGmNLMUQNV0sbYm0EMnjx4KK4xuDwWyuwumlmLR+rInPCpATx3o/HqB+JXiZ8zRBwO7RCsLUXIBrCNQ2zQsTxzo5Jr1pHBAMASACoJes4ILfgL5+Ksg66UZ2ShoujmyHooz+kZJY9S00sTO2AO61vrguTSjZfCVzmWdU0AA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833134; c=relaxed/simple;
	bh=Z8CWjjfGBGG9wjRczEq7sR58YYRMWWXBL3ukzuLE25g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=VxXC9jq5OBRM+bDR9kwRohcDdJ+L6oY1plkdyj4X2R50jbtUY5mJghplNTQGF5HhyEla01w9zbHhrY+DgAZ85hGFucv1PexeIZwQJP4OI8smfLcJAYLtun6iDGcNRfMiNfjJFgeWwyoWFcM7MJqu+iATqaVh0gdgHxlf06i0Kf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubxe2127; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubxe2127"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d7cf6efc2fso36638385a.3;
        Sun, 06 Jul 2025 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751833130; x=1752437930; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoZEHKeC/I7Zaq8y5fJOZt1RdBAcqcdGmNLMRCtWJ1Q=;
        b=Ubxe2127FaQslYtUeuzKqanwZegRkeFEocpM2BJgPzVnVsz3ltQXlix6Lw6EleXT2o
         X7onvxf9Hef3HWNOlbjXdbtLFMeEKYkmWjLBn17M4kuxE6nch61lWqVsqBn0dCjfwRzJ
         j5svstF+dhjbsi3WWdh5JKfIiofY+++sq80pE+SeeYxJDLhTtfmrzqP0rRSxxhA0JGGF
         hTVGyz9TyEX0yHGzh+cvaqu2JYOVo3B5aKbkZ+sCLfi2Dub0pg2d67UiDnDUlveSExH0
         7LraVooCtnx3mqszdBPBpvUO7C6ktpOq6Ehwt5gwiOIBwKgCGmPFhJPJDYfPVKNIm9bf
         RFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751833130; x=1752437930;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoZEHKeC/I7Zaq8y5fJOZt1RdBAcqcdGmNLMRCtWJ1Q=;
        b=HsKJ9VpHtr5itEJzHe5gHLHsUADbKUEvD0DYSBMJbNdSnOPxMO6qD+3Yl1r5Kj4xII
         nU+fNkYT2Wgaoz8Qzro+haHV/HPsXPart7OTIoqKeS9JtG4PVgeHvfTUc4r8i2Rve6vl
         9K8/MF3TWr6bIeQb0i0+XZGxBDHEKxQxCdS0F96DQe8BdkvPNTyR+uKBwfjn8SHiVvaS
         Pd919h2uPtNRw4Dp2mExCBDkCfu98+y5NNc2L7/nLjV4/vfF7fbAELGvfXHyxM4bxHpn
         /2Mw/EfYMr72JmspIAnP8uKFTTXMjqYbbbH7eHNdPLOye3zhOH78ptcCG01WHNqPbvYB
         +HVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvOnnWM714MrH+Fy6J8239sh3RgAmeMGmz3w7BXi/8Wo4NZ5xoC8oHd5GeMqr+4S2kjEECIwIJBQrWlGBDxEutwGdGqw==@vger.kernel.org, AJvYcCWEibmwY+LIO/4hvWRG+qFl5Zh1WynZC/ZaEgL687Zf+bpsa7tmora6hmDGErZp9Sb/n0U5LaObZC9OpEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxtl75b3egr8USBUb38kHo4RHRBhR4HmLyAhZfbaOpYKBPu/PQ
	5KKTtUDov0Q1ysbj3zFc4dtyMGW/FhFxq5Zn5cIJg/kM6A7lpGIB/zT6786CpjYQ
X-Gm-Gg: ASbGncv6e7VpP7jI81UrCpLHc2CQoGvixk+odrwvipSRqNSJLLZvs5yfOousLMT6L//
	iha+470oJuhSj51JrqSBcqWJz489MG0v16vOeCFhrXkiblpGmZoPDwsiS5jdXU3FjsH2lbjAu+D
	ErJa62s+g+zf9u8gqFgLLKQVWR0Bxqrz25OZjWGaemUB2zTPaagwamurkqzRgjtNN6f3YAPs5ir
	2lhHKdWMV4xpkOuXDPRwAba+YlcB5nQyx9jgAwpk5Z1c23jE//R+11UShKwcI8JevaUOmnpAzIv
	yevBJUDxnyXJbe3bziTgN4agn4v9T4l1D/5JPajuHTlFyfkhe3DRsYE=
X-Google-Smtp-Source: AGHT+IGdBRjbYAnB1L38boNtCxfDT0DxFkBZ8W8bZ/iODx/4fNJ2Icz1Hhou9zCfZvemrQbEsGU/RQ==
X-Received: by 2002:a05:620a:2b46:b0:7d1:fc53:c6b2 with SMTP id af79cd13be357-7d5f1ad95fcmr905391685a.41.1751833129944;
        Sun, 06 Jul 2025 13:18:49 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd93e10sm508303785a.5.2025.07.06.13.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 13:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Jul 2025 17:18:45 -0300
Message-Id: <DB590JXMNJL9.19BO2R1EIOSRN@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "ALOK TIWARI" <alok.a.tiwari@oracle.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Joshua Grisham" <josh@joshuagrisham.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Jorge
 Lopez" <jorge.lopez2@hp.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v5 2/6] platform/x86: firmware_attributes_class: Add
 high level API for the attributes interface
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>
 <0fafcb83-0b58-4dbd-8c13-7bdec1c78abc@oracle.com>
In-Reply-To: <0fafcb83-0b58-4dbd-8c13-7bdec1c78abc@oracle.com>

Hi Alok,

On Sun Jul 6, 2025 at 6:28 AM -03, ALOK TIWARI wrote:
>
>
> On 7/5/2025 9:03 AM, Kurt Borja wrote:
>> Add high level API to aid in the creation of attribute groups attached
>> to the `attrs_kobj` (per ABI specification).
>>=20
>> This new API lets users configure each group, either statically or
>> dynamically through a (per type) data struct and then create this group
>> through the generic fwat_create_group() macro.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/firmware_attributes_class.c | 532 +++++++++++++++=
++++++++
>>   drivers/platform/x86/firmware_attributes_class.h | 335 ++++++++++++++
>>   2 files changed, 867 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/=
platform/x86/firmware_attributes_class.c
>> index 290364202cce64bb0e9046e0b2bbb8d85e2cbc6f..96473b3b1a2a87cf21a6e2a9=
a14d72ae322c94ae 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.c
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>> @@ -10,13 +10,67 @@
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>> +#include <linux/string_choices.h>
>>   #include "firmware_attributes_class.h"
>>  =20
>> +#define FWAT_TYPE_NONE				-1
>> +
>> +#define to_fwat_bool_data(_c) \
>> +	container_of_const(_c, struct fwat_bool_data, group)
>> +#define to_fwat_enum_data(_c) \
>> +	container_of_const(_c, struct fwat_enum_data, group)
>> +#define to_fwat_int_data(_c) \
>> +	container_of_const(_c, struct fwat_int_data, group)
>> +#define to_fwat_str_data(_c) \
>> +	container_of_const(_c, struct fwat_str_data, group)
>> +
>> +struct fwat_attribute {
>> +	struct attribute attr;
>> +	ssize_t (*show)(struct kobject *kobj, struct fwat_attribute *attr,
>> +			char *buf);
>> +	ssize_t (*store)(struct kobject *kobj, struct fwat_attribute *attr,
>> +			 const char *buf, size_t count);
>> +	int type;
>> +};
>> +
>> +#define to_fwat_attribute(_a) \
>> +	container_of_const(_a, struct fwat_attribute, attr)
>> +
>> +#define __FWAT_ATTR(_name, _mode, _show, _store, _type) \
>> +	{								\
>> +		.attr =3D { .name =3D __stringify(_name), .mode =3D _mode },	\
>> +		.show =3D _show, .store =3D _store, .type =3D _type,		\
>> +	}
>> +
>> +#define FWAT_ATTR_RO(_prefix, _name, _show, _type) \
>> +	static struct fwat_attribute fwat_##_prefix##_##_name##_attr =3D \
>> +		__FWAT_ATTR(_name, 0444, _show, NULL, _type)
>> +
>> +#define FWAT_ATTR_RW(_prefix, _name, _show, _store, _type) \
>> +	static struct fwat_attribute fwat_##_prefix##_##_name##_attr =3D \
>> +		__FWAT_ATTR(_name, 0644, _show, _store, _type)
>> +
>> +struct fwat_group {
>> +	const struct fwat_group_data *data;
>> +	struct device *dev;
>> +	struct kobject kobj;
>> +};
>> +
>> +#define kobj_to_fwat_group(_k) \
>> +	container_of_const(_k, struct fwat_group, kobj)
>> +
>>   const struct class firmware_attributes_class =3D {
>>   	.name =3D "firmware-attributes",
>>   };
>>   EXPORT_SYMBOL_GPL(firmware_attributes_class);
>>  =20
>> +static const char * const fwat_type_labels[] =3D {
>> +	[fwat_group_boolean]			=3D "boolean",
>> +	[fwat_group_enumeration]		=3D "enumeration",
>> +	[fwat_group_integer]			=3D "integer",
>> +	[fwat_group_string]			=3D "string",
>> +};
>> +
>>   static void fwat_device_release(struct device *dev)
>>   {
>>   	struct fwat_device *fadev =3D to_fwat_device(dev);
>> @@ -24,6 +78,483 @@ static void fwat_device_release(struct device *dev)
>>   	kfree(fadev);
>>   }
>>  =20
>> +static ssize_t
>> +type_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
>> +{
>> +	return sysfs_emit(buf, "%s\n", fwat_type_labels[attr->type]);
>> +}
>> +
>> +static ssize_t
>> +display_name_show(struct kobject *kobj, struct fwat_attribute *attr, ch=
ar *buf)
>> +{
>> +	struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const char *disp_name =3D group->data->display_name;
>> +
>> +	if (!disp_name)
>> +		return -EOPNOTSUPP;
>> +
>> +	return sysfs_emit(buf, "%s\n", disp_name);
>> +}
>> +
>> +static ssize_t
>> +display_name_language_code_show(struct kobject *kobj, struct fwat_attri=
bute *attr,
>> +				char *buf)
>> +{
>> +	struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const char *lang_code =3D group->data->language_code;
>> +
>> +	if (!lang_code)
>> +		return -EOPNOTSUPP;
>> +
>> +	return sysfs_emit(buf, "%s\n", lang_code);
>> +}
>> +
>> +static ssize_t
>> +bool_group_show(struct kobject *kobj, struct fwat_attribute *attr, char=
 *buf)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_bool_data *data =3D to_fwat_bool_data(group->data);
>> +	bool val;
>> +	int ret;
>> +
>> +	/* show_override does not affect current_value */
>> +	if (data->group.show_override && attr->type !=3D fwat_bool_current_val=
ue)
>> +		return data->group.show_override(group->dev, attr->type, buf);
>> +
>> +	switch (attr->type) {
>> +	case fwat_bool_current_value:
>> +		ret =3D data->read(group->dev, data->group.id, &val);
>> +		if (ret < 0)
>> +			return ret;
>> +		break;
>> +	case fwat_bool_default_value:
>> +		val =3D data->default_val;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return sysfs_emit(buf, "%s\n", str_yes_no(val));
>> +}
>> +
>> +static ssize_t
>> +bool_group_store(struct kobject *kobj, struct fwat_attribute *attr, con=
st char *buf,
>> +		 size_t count)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_bool_data *data =3D to_fwat_bool_data(group->data);
>> +	bool val;
>> +	int ret;
>> +
>> +	ret =3D kstrtobool(buf, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D data->write(group->dev, data->group.id, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t
>> +enum_group_show(struct kobject *kobj, struct fwat_attribute *attr, char=
 *buf)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_enum_data *data =3D to_fwat_enum_data(group->data);
>> +	int val_idx, sz =3D 0;
>> +	int ret;
>> +
>> +	/* show_override does not affect current_value */
>> +	if (data->group.show_override && attr->type !=3D fwat_enum_current_val=
ue)
>> +		return data->group.show_override(group->dev, attr->type, buf);
>> +
>> +	switch (attr->type) {
>> +	case fwat_enum_current_value:
>> +		ret =3D data->read(group->dev, data->group.id, &val_idx);
>> +		if (ret < 0)
>> +			return ret;
>> +		break;
>> +	case fwat_enum_default_value:
>> +		val_idx =3D data->default_idx;
>> +		break;
>> +	case fwat_enum_possible_values:
>> +		sz +=3D sysfs_emit_at(buf, sz, "%s", data->possible_vals[0]);
>> +		for (unsigned int i =3D 1; data->possible_vals[i]; i++)
>> +			sz +=3D sysfs_emit_at(buf, sz, ";%s", data->possible_vals[i]);
>> +		sz +=3D sysfs_emit_at(buf, sz, "\n");
>> +		return sz;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return sysfs_emit(buf, "%s\n", data->possible_vals[val_idx]);
>> +}
>> +
>> +static ssize_t
>> +enum_group_store(struct kobject *kobj, struct fwat_attribute *attr, con=
st char *buf,
>> +		 size_t count)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_enum_data *data =3D to_fwat_enum_data(group->data);
>> +	int val_idx;
>> +	int ret;
>> +
>> +	val_idx =3D __sysfs_match_string(data->possible_vals, -1, buf);
>> +	if (val_idx < 0)
>> +		return val_idx;
>> +
>> +	ret =3D data->write(group->dev, data->group.id, val_idx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t
>> +int_group_show(struct kobject *kobj, struct fwat_attribute *attr, char =
*buf)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_int_data *data =3D to_fwat_int_data(group->data);
>> +	long val;
>> +	int ret;
>> +
>> +	/* show_override does not affect current_value */
>> +	if (data->group.show_override && attr->type !=3D fwat_int_current_valu=
e)
>> +		return data->group.show_override(group->dev, attr->type, buf);
>> +
>> +	switch (attr->type) {
>> +	case fwat_int_current_value:
>> +		ret =3D data->read(group->dev, data->group.id, &val);
>> +		if (ret < 0)
>> +			return ret;
>> +		break;
>> +	case fwat_int_default_value:
>> +		val =3D data->default_val;
>> +		break;
>> +	case fwat_int_min_value:
>> +		val =3D data->min_val;
>> +		break;
>> +	case fwat_int_max_value:
>> +		val =3D data->max_val;
>> +		break;
>> +	case fwat_int_scalar_increment:
>> +		val =3D data->increment;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return sysfs_emit(buf, "%ld\n", val);
>> +}
>> +
>> +static ssize_t
>> +int_group_store(struct kobject *kobj, struct fwat_attribute *attr, cons=
t char *buf,
>> +		size_t count)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_int_data *data =3D to_fwat_int_data(group->data);
>> +	long val;
>> +	int ret;
>> +
>> +	ret =3D kstrtol(buf, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D data->write(group->dev, data->group.id, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t
>> +str_group_show(struct kobject *kobj, struct fwat_attribute *attr, char =
*buf)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_str_data *data =3D to_fwat_str_data(group->data);
>> +	const char *val;
>> +	long len;
>> +	int ret;
>> +
>> +	/* show_override does not affect current_value */
>> +	if (data->group.show_override && attr->type !=3D fwat_bool_current_val=
ue)
>
> fwat_bool_current_value ? or str
>
>> +		return data->group.show_override(group->dev, attr->type, buf);
>> +
>> +	switch (attr->type) {
>> +	case fwat_str_current_value:
>> +		ret =3D data->read(group->dev, data->group.id, &val);
>> +		if (ret < 0)
>> +			return ret;
>> +		break;
>> +	case fwat_str_default_value:
>> +		val =3D data->default_val;
>> +		break;
>> +	case fwat_str_min_length:
>> +		len =3D data->min_len;
>> +		return sysfs_emit(buf, "%ld\n", len);
>> +	case fwat_str_max_length:
>> +		len =3D data->max_len;
>> +		return sysfs_emit(buf, "%ld\n", len);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return sysfs_emit(buf, "%s\n", val);
>> +}
>> +
>> +static ssize_t
>> +str_group_store(struct kobject *kobj, struct fwat_attribute *attr, cons=
t char *buf,
>> +		size_t count)
>> +{
>> +	const struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_str_data *data =3D to_fwat_str_data(group->data);
>> +	int ret;
>> +
>> +	ret =3D data->write(group->dev, data->group.id, buf);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +FWAT_ATTR_RO(all, display_name, display_name_show, FWAT_TYPE_NONE);
>> +FWAT_ATTR_RO(all, display_name_language_code, display_name_language_cod=
e_show, FWAT_TYPE_NONE);
>> +
>> +FWAT_ATTR_RO(bool, type, type_show, fwat_group_boolean);
>> +FWAT_ATTR_RW(bool, current_value, bool_group_show, bool_group_store, fw=
at_bool_current_value);
>> +FWAT_ATTR_RO(bool, default_value, bool_group_show, fwat_bool_default_va=
lue);
>> +
>> +FWAT_ATTR_RO(enum, type, type_show, fwat_group_enumeration);
>> +FWAT_ATTR_RW(enum, current_value, enum_group_show, enum_group_store, fw=
at_enum_current_value);
>> +FWAT_ATTR_RO(enum, default_value, enum_group_show, fwat_enum_default_va=
lue);
>> +FWAT_ATTR_RO(enum, possible_values, enum_group_show, fwat_enum_possible=
_values);
>> +
>> +FWAT_ATTR_RO(int, type, type_show, fwat_group_integer);
>> +FWAT_ATTR_RW(int, current_value, int_group_show, int_group_store, fwat_=
int_current_value);
>> +FWAT_ATTR_RO(int, default_value, int_group_show, fwat_int_default_value=
);
>> +FWAT_ATTR_RO(int, min_value, int_group_show, fwat_int_min_value);
>> +FWAT_ATTR_RO(int, max_value, int_group_show, fwat_int_max_value);
>> +FWAT_ATTR_RO(int, scalar_increment, int_group_show, fwat_int_scalar_inc=
rement);
>> +
>> +FWAT_ATTR_RO(str, type, type_show, fwat_group_string);
>> +FWAT_ATTR_RW(str, current_value, str_group_show, str_group_store, fwat_=
int_current_value);
>
> wrong enum fwat_int_current_value -> fwat_str_current_value
>
>> +FWAT_ATTR_RO(str, default_value, str_group_show, fwat_str_default_value=
);
>> +FWAT_ATTR_RO(str, min_length, str_group_show, fwat_str_min_length);
>> +FWAT_ATTR_RO(str, max_length, str_group_show, fwat_str_max_length);
>> +
>> +static struct attribute *fwat_bool_attrs[] =3D {
>> +	&fwat_bool_type_attr.attr,
>> +	&fwat_all_display_name_attr.attr,
>> +	&fwat_all_display_name_language_code_attr.attr,
>> +	&fwat_bool_current_value_attr.attr,
>> +	&fwat_bool_default_value_attr.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute *fwat_enum_attrs[] =3D {
>> +	&fwat_enum_type_attr.attr,
>> +	&fwat_all_display_name_attr.attr,
>> +	&fwat_all_display_name_language_code_attr.attr,
>> +	&fwat_enum_current_value_attr.attr,
>> +	&fwat_enum_default_value_attr.attr,
>> +	&fwat_enum_possible_values_attr.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute *fwat_int_attrs[] =3D {
>> +	&fwat_int_type_attr.attr,
>> +	&fwat_all_display_name_attr.attr,
>> +	&fwat_all_display_name_language_code_attr.attr,
>> +	&fwat_int_current_value_attr.attr,
>> +	&fwat_int_default_value_attr.attr,
>> +	&fwat_int_min_value_attr.attr,
>> +	&fwat_int_max_value_attr.attr,
>> +	&fwat_int_scalar_increment_attr.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute *fwat_str_attrs[] =3D {
>> +	&fwat_str_type_attr.attr,
>> +	&fwat_all_display_name_attr.attr,
>> +	&fwat_all_display_name_language_code_attr.attr,
>> +	&fwat_str_current_value_attr.attr,
>> +	&fwat_str_default_value_attr.attr,
>> +	&fwat_str_min_length_attr.attr,
>> +	&fwat_str_max_length_attr.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t fwat_attr_visible(struct kobject *kobj, struct attribute=
 *attr, int n)
>> +{
>> +	struct fwat_attribute *fwat_attr =3D to_fwat_attribute(attr);
>> +	struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +	const struct fwat_group_data *data =3D group->data;
>> +
>> +	/* The `type` attribute is always first */
>> +	if (n =3D=3D 0)
>> +		return attr->mode;
>> +
>> +	if (attr =3D=3D &fwat_all_display_name_attr.attr)
>> +		return data->display_name ? attr->mode : 0;
>> +
>> +	if (attr =3D=3D &fwat_all_display_name_language_code_attr.attr)
>> +		return data->language_code ? attr->mode : 0;
>> +
>> +	/* The `current_value` attribute always has type =3D=3D 0 */
>> +	if (!fwat_attr->type)
>> +		return data->mode;
>> +
>> +	return test_bit(fwat_attr->type, &data->fattrs) ? attr->mode : 0;
>> +}
>> +
>> +static umode_t fwat_group_visible(struct kobject *kobj)
>> +{
>> +	return true;
>> +}
>> +
>> +DEFINE_SYSFS_GROUP_VISIBLE(fwat);
>> +
>> +static const struct attribute_group fwat_bool_group =3D {
>> +	.attrs =3D fwat_bool_attrs,
>> +	.is_visible =3D SYSFS_GROUP_VISIBLE(fwat),
>> +};
>> +__ATTRIBUTE_GROUPS(fwat_bool);
>> +
>> +static const struct attribute_group fwat_enum_group =3D {
>> +	.attrs =3D fwat_enum_attrs,
>> +	.is_visible =3D SYSFS_GROUP_VISIBLE(fwat),
>> +};
>> +__ATTRIBUTE_GROUPS(fwat_enum);
>> +
>> +static const struct attribute_group fwat_int_group =3D {
>> +	.attrs =3D fwat_int_attrs,
>> +	.is_visible =3D SYSFS_GROUP_VISIBLE(fwat),
>> +};
>> +__ATTRIBUTE_GROUPS(fwat_int);
>> +
>> +static const struct attribute_group fwat_str_group =3D {
>> +	.attrs =3D fwat_str_attrs,
>> +	.is_visible =3D SYSFS_GROUP_VISIBLE(fwat),
>> +};
>> +__ATTRIBUTE_GROUPS(fwat_str);
>> +
>> +static ssize_t
>> +fwat_attr_sysfs_show(struct kobject *kobj, struct attribute *attr, char=
 *buf)
>> +{
>> +	struct fwat_attribute *fwat_attr =3D to_fwat_attribute(attr);
>> +
>> +	if (!fwat_attr->show)
>> +		return -EOPNOTSUPP;
>> +
>> +	return fwat_attr->show(kobj, fwat_attr, buf);
>> +}
>> +
>> +static ssize_t
>> +fwat_attr_sysfs_store(struct kobject *kobj, struct attribute *attr, con=
st char *buf,
>> +		      size_t count)
>> +{
>> +	struct fwat_attribute *fwat_attr =3D to_fwat_attribute(attr);
>> +
>> +	if (!fwat_attr->show)
>> +		return -EOPNOTSUPP;
>
> check for fwat_attr->store ?
>
>> +
>> +	return fwat_attr->store(kobj, fwat_attr, buf, count);
>> +}
>> +
>> +static void fwat_group_release(struct kobject *kobj)
>> +{
>> +	struct fwat_group *group =3D kobj_to_fwat_group(kobj);
>> +
>> +	kfree(group);
>> +}
>> +
>> +static const struct sysfs_ops fwat_attr_sysfs_ops =3D {
>> +	.show =3D fwat_attr_sysfs_show,
>> +	.store =3D fwat_attr_sysfs_store,
>> +};
>> +
>> +static const struct kobj_type fwat_boolean_ktype =3D {
>> +	.sysfs_ops =3D &fwat_attr_sysfs_ops,
>> +	.release =3D fwat_group_release,
>> +	.default_groups =3D fwat_bool_groups,
>> +};
>> +
>> +static const struct kobj_type fwat_enumeration_ktype =3D {
>> +	.sysfs_ops =3D &fwat_attr_sysfs_ops,
>> +	.release =3D fwat_group_release,
>> +	.default_groups =3D fwat_enum_groups,
>> +};
>> +
>> +static const struct kobj_type fwat_integer_ktype =3D {
>> +	.sysfs_ops =3D &fwat_attr_sysfs_ops,
>> +	.release =3D fwat_group_release,
>> +	.default_groups =3D fwat_int_groups,
>> +};
>> +
>> +static const struct kobj_type fwat_string_ktype =3D {
>> +	.sysfs_ops =3D &fwat_attr_sysfs_ops,
>> +	.release =3D fwat_group_release,
>> +	.default_groups =3D fwat_str_groups,
>> +};
>> +
>> +static int __fwat_create_group(struct fwat_device *fadev, const struct =
kobj_type *ktype,
>> +			       const struct fwat_group_data *data)
>> +{
>> +	struct fwat_group *group;
>> +	int ret;
>> +
>> +	group =3D kzalloc(sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return -ENOMEM;
>> +
>> +	group->dev =3D &fadev->dev;
>> +	group->data =3D data;
>> +
>> +	group->kobj.kset =3D fadev->attrs_kset;
>> +	ret =3D kobject_init_and_add(&group->kobj, ktype, NULL, "%s", data->na=
me);
>> +	if (ret) {
>> +		kobject_put(&group->kobj);
>> +		return ret;
>> +	}
>> +
>> +	kobject_uevent(&group->kobj, KOBJ_ADD);
>> +
>> +	return 0;
>> +}
>> +
>> +static void fwat_remove_auto_groups(struct fwat_device *fadev)
>> +{
>> +	struct kobject *pos, *n;
>> +
>> +	list_for_each_entry_safe(pos, n, &fadev->attrs_kset->list, entry)
>> +		kobject_put(pos);
>> +}
>> +
>> +int fwat_create_bool_group(struct fwat_device *fadev, const struct fwat=
_bool_data *data)
>> +{
>> +	return __fwat_create_group(fadev, &fwat_boolean_ktype, &data->group);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_create_bool_group);
>> +
>> +int fwat_create_enum_group(struct fwat_device *fadev, const struct fwat=
_enum_data *data)
>> +{
>> +	return __fwat_create_group(fadev, &fwat_enumeration_ktype, &data->grou=
p);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_create_enum_group);
>> +
>> +int fwat_create_int_group(struct fwat_device *fadev, const struct fwat_=
int_data *data)
>> +{
>> +	return __fwat_create_group(fadev, &fwat_integer_ktype, &data->group);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_create_int_group);
>> +
>> +int fwat_create_str_group(struct fwat_device *fadev, const struct fwat_=
str_data *data)
>> +{
>> +	return __fwat_create_group(fadev, &fwat_string_ktype, &data->group);
>> +}
>> +EXPORT_SYMBOL_GPL(fwat_create_str_group);
>> +
>>   /**
>>    * fwat_device_register - Create and register a firmware-attributes cl=
ass
>>    *			  device
>> @@ -89,6 +620,7 @@ void fwat_device_unregister(struct fwat_device *fadev=
)
>>   	if (!fadev)
>>   		return;
>>  =20
>> +	fwat_remove_auto_groups(fadev);
>>   	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
>>   	kset_unregister(fadev->attrs_kset);
>>   	device_unregister(&fadev->dev);
>> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/=
platform/x86/firmware_attributes_class.h
>> index 048fd0904f767357ef856e687ec4cf3260016ec6..e8868ce05b595eda94a98975=
428391b9f9341e3d 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.h
>> +++ b/drivers/platform/x86/firmware_attributes_class.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/device/class.h>
>>   #include <linux/kobject.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/list.h>
>>  =20
>>   extern const struct class firmware_attributes_class;
>>  =20
>> @@ -27,6 +28,340 @@ struct fwat_device {
>>  =20
>>   #define to_fwat_device(_d)	container_of_const(_d, struct fwat_device, =
dev)
>>  =20
>> +enum fwat_group_type {
>> +	fwat_group_boolean,
>> +	fwat_group_enumeration,
>> +	fwat_group_integer,
>> +	fwat_group_string,
>> +};
>> +
>> +enum fwat_bool_attrs {
>> +	fwat_bool_current_value,
>> +	fwat_bool_default_value,
>> +	fwat_bool_attrs_last
>> +};
>> +
>> +#define FWAT_BOOL_CURRENT_VALUE			BIT(fwat_bool_current_value)
>> +#define FWAT_BOOL_DEFAULT_VALUE			BIT(fwat_bool_default_value)
>> +#define FWAT_BOOL_ALL_ATTRS			GENMASK(fwat_bool_attrs_last, 0)
>> +
>> +enum fwat_enum_attrs {
>> +	fwat_enum_current_value,
>> +	fwat_enum_default_value,
>> +	fwat_enum_possible_values,
>> +	fwat_enum_attrs_last
>> +};
>> +
>> +#define FWAT_ENUM_CURRENT_VALUE			BIT(fwat_enum_current_value)
>> +#define FWAT_ENUM_DEFAULT_VALUE			BIT(fwat_enum_default_value)
>> +#define FWAT_ENUM_POSSIBLE_VALUES		BIT(fwat_enum_possible_values)
>> +#define FWAT_ENUM_ALL_ATTRS			GENMASK(fwat_enum_attrs_last, 0)
>> +
>> +enum fwat_int_attrs {
>> +	fwat_int_current_value,
>> +	fwat_int_default_value,
>> +	fwat_int_min_value,
>> +	fwat_int_max_value,
>> +	fwat_int_scalar_increment,
>> +	fwat_int_attrs_last
>> +};
>> +
>> +#define FWAT_INT_CURRENT_VALUE			BIT(fwat_int_current_value)
>> +#define FWAT_INT_DEFAULT_VALUE			BIT(fwat_int_default_value)
>> +#define FWAT_INT_MIN_VALUE			BIT(fwat_int_min_value)
>> +#define FWAT_INT_MAX_VALUE			BIT(fwat_int_max_value)
>> +#define FWAT_INT_SCALAR_INCREMENT		BIT(fwat_int_scalar_increment)
>> +#define FWAT_INT_ALL_ATTRS			GENMASK(fwat_int_attrs_last, 0)
>> +
>> +enum fwat_str_attrs {
>> +	fwat_str_current_value,
>> +	fwat_str_default_value,
>> +	fwat_str_min_length,
>> +	fwat_str_max_length,
>> +	fwat_str_attrs_last
>> +};
>> +
>> +#define FWAT_STR_CURRENT_VALUE			BIT(fwat_str_current_value)
>> +#define FWAT_STR_DEFAULT_VALUE			BIT(fwat_str_default_value)
>> +#define FWAT_STR_MIN_LENGTH			BIT(fwat_str_min_length)
>> +#define FWAT_STR_MAX_LENGTH			BIT(fwat_str_max_length)
>> +#define FWAT_STR_ALL_ATTRS			GENMASK(fwat_str_attrs_last, 0)
>> +
>> +static_assert(fwat_bool_current_value =3D=3D 0);
>> +static_assert(fwat_enum_current_value =3D=3D 0);
>> +static_assert(fwat_int_current_value =3D=3D 0);
>> +static_assert(fwat_str_current_value =3D=3D 0);
>> +
>> +/**
>> + * struct fwat_group_data - Data struct common between group types
>> + * @id: Group ID defined by the user.
>> + * @name: Name of the group.
>> + * @display_name: Name showed in the display_name attribute. (Optional)
>> + * @language_code: Language code showed in the display_name_language_co=
de
>> + *                 attribute. (Optional)
>> + * @mode: Mode for the current_value attribute. All other attributes wi=
ll have
>> + *        0444 permissions.
>> + * @fattrs: Bitmap of selected attributes for this group type.
>> + * @show_override: Custom show method for attributes in this group, exc=
ept for
>> + *		   the current_value attribute, for which the a `read` callback
>> + *		   will still be used. (Optional)
>> + *
>> + * NOTE: This struct is not meant to be defined directly. It is suppose=
d to be
>> + * embedded and defined as part of fwat_[type]_data structs.
>> + */
>> +struct fwat_group_data {
>> +	long id;
>> +	umode_t mode;
>> +	const char *name;
>> +	const char *display_name;
>> +	const char *language_code;
>> +	unsigned long fattrs;
>> +	ssize_t (*show_override)(struct device *dev, int type, char *buf);
>> +};
>> +
>> +/**
>> + * struct fwat_bool_data - Data struct for the boolean group type
>> + * @read: Read callback for the current_value attribute.
>> + * @write: Write callback for the current_value attribute.
>> + * @default_val: Default value.
>> + * @group: Group data.
>> + */
>> +struct fwat_bool_data {
>> +	int (*read)(struct device *dev, long id, bool *val);
>> +	int (*write)(struct device *dev, long id, bool val);
>> +	bool default_val;
>> +	struct fwat_group_data group;
>> +};
>> +
>> +/**
>> + * struct fwat_enum_data - Data struct for the enumeration group type
>> + * @read: Read callback for the current_value attribute.
>> + * @write: Write callback for the current_value attribute.
>> + * @default_idx: Index of the default value in the @possible_vals array=
.
>> + * @possible_vals: Array of possible value strings for this group type.
>> + * @group: Group data.
>> + *
>> + * NOTE: The `val_idx` argument in the @write callback is guaranteed to=
 be a
>> + *       valid (within bounds) index. However, the user is in charge of=
 writing
>> + *       valid indexes to the `*val_idx` argument of the @read callback=
.
>> + *       Failing to do so may result in an OOB access.
>> + */
>> +struct fwat_enum_data {
>> +	int (*read)(struct device *dev, long id, int *val_idx);
>> +	int (*write)(struct device *dev, long id, int val_idx);
>> +	int default_idx;
>> +	const char * const *possible_vals;
>> +	struct fwat_group_data group;
>> +};
>> +
>> +/**
>> + * struct fwat_int_data - Data struct for the integer group type
>> + * @read: Read callback for the current_value attribute.
>> + * @write: Write callback for the current_value attribute.
>> + * @default_val: Default value.
>> + * @min_val: Minimum value.
>> + * @max_val: Maximum value.
>> + * @increment: Scalar increment for this value.
>> + * @group: Group data.
>> + *
>> + * NOTE: The @min_val, @max_val, @increment constraints are merely info=
rmative.
>> + *       These values are not enforced in any of the callbacks.
>> + */
>> +struct fwat_int_data {
>> +	int (*read)(struct device *dev, long id, long *val);
>> +	int (*write)(struct device *dev, long id, long val);
>> +	long default_val;
>> +	long min_val;
>> +	long max_val;
>> +	long increment;
>> +	struct fwat_group_data group;
>> +};
>> +
>> +/**
>> + * struct fwat_str_data - Data struct for the string group type
>> + * @read: Read callback for the current_value attribute.
>> + * @write: Write callback for the current_value attribute.
>> + * @default_val: Default value.
>> + * @min_len: Minimum string length.
>> + * @max_len: Maximum string length.
>> + * @group: Group data.
>> + *
>> + * NOTE: The @min_len, @max_len constraints are merely informative. The=
se
>> + *       values are not enforced in any of the callbacks.
>> + */
>> +struct fwat_str_data {
>> +	int (*read)(struct device *dev, long id, const char **buf);
>> +	int (*write)(struct device *dev, long id, const char *buf);
>> +	const char *default_val;
>> +	long min_len;
>> +	long max_len;
>> +	struct fwat_group_data group;
>> +};
>> +
>> +#define __FWAT_GROUP(_name, _disp_name, _mode, _fattrs) \
>> +	{ .name =3D __stringify(_name), .display_name =3D _disp_name, .mode =
=3D _mode, .fattrs =3D _fattrs }
>> +
>> +/**
>> + * DEFINE_FWAT_BOOL_GROUP - Convenience macro to quickly define an stat=
ic
>
> an static -> a static (all place)
>
>> + *                          struct fwat_bool_data instance
>> + * @_name: Name of the group.
>> + * @_disp_name: Name showed in the display_name attribute. (Optional)
>
> showed -> shown (all place)
>
>> + * @_def_val: Default value.
>> + * @_mode: Mode for the current_value attribute. All other attributes w=
ill have
>> + *         0444 permissions.
>> + * @_fattrs: Bitmap of selected attributes for this group type.
>> + *
>> + * `read` and `write` callbacks are required to be already defined as
>> + * `_name##_read` and `_name##_write` respectively.
>> + */
>> +#define DEFINE_FWAT_BOOL_GROUP(_name, _disp_name, _def_val, _mode, _fat=
trs) \
>> +	static const struct fwat_bool_data _name##_group_data =3D {	\
>> +		.read =3D _name##_read,					\
>> +		.write =3D _name##_write,					\
>> +		.default_val =3D _def_val,				\
>> +		.group =3D __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
>> +	}
>> +
>> +/**
>> + * DEFINE_FWAT_ENUM_GROUP - Convenience macro to quickly define an stat=
ic
>> + *                          struct fwat_enum_data instance
>> + * @_name: Name of the group.
>> + * @_disp_name: Name showed in the display_name attribute. (Optional)
>> + * @_def_idx: Index of the default value in the @_poss_vals array.
>> + * @_poss_vals: Array of possible value strings for this group type.
>> + * @_mode: Mode for the current_value attribute. All other attributes w=
ill have
>> + *         0444 permissions.
>> + * @_fattrs: Bitmap of selected attributes for this group type.
>> + *
>> + * `read` and `write` callbacks are required to be already defined as
>> + * `_name##_read` and `_name##_write` respectively.
>> + *
>> + * NOTE: The `val_idx` argument in the `write` callback is guaranteed t=
o be a
>> + *       valid (within bounds) index. However, the user is in charge of=
 writing
>> + *       valid indexes to the `*val_idx` argument of the `read` callbac=
k.
>> + *       Failing to do so may result in an OOB access.
>> + */
>> +#define DEFINE_FWAT_ENUM_GROUP(_name, _disp_name, _poss_vals, _def_idx,=
 _mode, _fattrs) \
>> +	static const struct fwat_enum_data _name##_group_data =3D {	\
>> +		.read =3D _name##_read,					\
>> +		.write =3D _name##_write,					\
>> +		.default_idx =3D _def_idx,				\
>> +		.possible_vals =3D _poss_vals,				\
>> +		.group =3D __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
>> +	}
>> +
>> +/**
>> + * DEFINE_FWAT_INT_GROUP - Convenience macro to quickly define an stati=
c
>> + *                         struct fwat_int_data instance
>> + * @_name: Name of the group.
>> + * @_disp_name: Name showed in the display_name attribute. (Optional)
>> + * @_def_val: Default value.
>> + * @_min: Minimum value.
>> + * @_max: Maximum value.
>> + * @_inc: Scalar increment for this value.
>> + * @_mode: Mode for the current_value attribute. All other attributes w=
ill have
>> + *         0444 permissions.
>> + * @_fattrs: Bitmap of selected attributes for this group type.
>> + *
>> + * `read` and `write` callbacks are required to be already defined as
>> + * `_name##_read` and `_name##_write` respectively.
>> + *
>> + * NOTE: The @_min, @_max, @_inc constraints are merely informative. Th=
ese
>> + *       values are not enforced in any of the callbacks.
>> + */
>> +#define DEFINE_FWAT_INT_GROUP(_name, _disp_name, _def_val, _min, _max, =
_inc, _mode, _fattrs) \
>> +	static const struct fwat_int_data _name##_group_data =3D {	\
>> +		.read =3D _name##_read,					\
>> +		.write =3D _name##_write,					\
>> +		.default_val =3D _def_val,				\
>> +		.min_val =3D _min,					\
>> +		.max_val =3D _max,					\
>> +		.increment =3D _inc,					\
>> +		.group =3D __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
>> +	}
>> +
>> +/**
>> + * DEFINE_FWAT_STR_GROUP - Convenience macro to quickly define an stati=
c
>> + *                         struct fwat_str_data instance
>> + * @_name: Name of the group.
>> + * @_disp_name: Name showed in the display_name attribute. (Optional)
>> + * @_def_val: Default value.
>> + * @_min: Minimum string length.
>> + * @_max: Maximum string length.
>> + * @_mode: Mode for the current_value attribute. All other attributes w=
ill have
>> + *         0444 permissions.
>> + * @_fattrs: Bitmap of selected attributes for this group type.
>> + *
>> + * `read` and `write` callbacks are required to be already defined as
>> + * `_name##_read` and `_name##_write` respectively.
>> + *
>> + * NOTE: The @_min, @_max constraints are merely informative. These val=
ues are
>> + *       not enforced in any of the callbacks.
>> + */
>> +#define DEFINE_FWAT_STR_GROUP(_name, _disp_name, _def_val, _min, _max, =
_mode, _fattrs) \
>> +	static const struct fwat_str_data _name##_group_data =3D {	\
>> +		.read =3D _name##_read,					\
>> +		.write =3D _name##_write,					\
>> +		.default_val =3D _def_val,				\
>> +		.min_len =3D _min,					\
>> +		.max_len =3D _max,					\
>> +		.group =3D __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
>> +	}
>> +
>> +int fwat_create_bool_group(struct fwat_device *fadev,
>> +			   const struct fwat_bool_data *data);
>> +int fwat_create_enum_group(struct fwat_device *fadev,
>> +			   const struct fwat_enum_data *data);
>> +int fwat_create_int_group(struct fwat_device *fadev,
>> +			  const struct fwat_int_data *data);
>> +int fwat_create_str_group(struct fwat_device *fadev,
>> +			  const struct fwat_str_data *data);
>> +
>> +/**
>> + * fwat_create_group - Convenience generic macro to create a group
>> + * @_dev: fwat_device
>> + * @_data: One of fwat_{bool,enum,int,str}_data instance
>> + *
>> + * This macro (and associated functions) creates a sysfs group under th=
e
>> + * 'attributes' directory, which is located in the class device root di=
rectory.
>> + *
>> + * See Documentation/ABI/testing/sysfs-class-firmware-attributes for de=
tails.
>> + *
>> + * The @_data associated with this group may be created either statical=
ly,
>> + * through DEFINE_FWAT_*_GROUP macros or dynamically, in which case the=
 user
>> + * would have allocate and fill the struct manually. The dynamic approa=
ch should
>> + * be preferred when group constraints and/or visibility is decided dyn=
amically.
>> + *
>> + * Example:
>> + *
>> + * static int stat_read(...){...};
>> + * static int stat_write(...){...};
>> + *
>> + * DEFINE_FWAT_(BOOL|ENUM|INT|STR)_GROUP(stat, ...);
>> + *
>> + * static int create_groups(struct fwat_device *fadev)
>> + * {
>> + *	struct fwat_enum_data *dyn_group_data;
>> + *
>> + *	dyn_group_data =3D kzalloc(...);
>> + *	// Fill the data
>> + *	...
>> + *	fwat_create_group(fadev, &stat_group_data);
>> + *	fwat_create_group(fadev, &dyn_group_data);
>> + *	fwat_create_group(...);
>> + *	...
>> + * }
>> + *
>> + * Return: 0 on success, -errno on failure
>> + */
>> +#define fwat_create_group(_dev, _data) \
>> +	_Generic((_data),							\
>> +		 const struct fwat_bool_data * : fwat_create_bool_group,	\
>> +		 const struct fwat_enum_data * : fwat_create_enum_group,	\
>> +		 const struct fwat_int_data * : fwat_create_int_group,		\
>> +		 const struct fwat_str_data * : fwat_create_str_group)		\
>> +		(_dev, _data)
>> +
>>   struct fwat_device * __must_check
>>   fwat_device_register(struct device *parent, const char *name, void *dr=
vdata,
>>   		     const struct attribute_group **groups);
>>=20
>
> Thanks
> Alok

Ack for everything. Thank you!


--=20
 ~ Kurt

