Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990801A08B8;
	Sun,  6 Jul 2025 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833060; cv=none; b=qXzp4DwPJStj8JQItZ984Klpk3rgrwr7thXQxwX9nIVhlzkfFjMCj/jNOK9oqRwsM7KVRdgDCSeUfLyCcbe0RHaz7AvePzkmcBOXVmAMy42ZdX8pjgxYn8F6PX07fwP8czMeWNwEkram34U+K2Bo9FpoMzRT/uX0m2tQk8egp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833060; c=relaxed/simple;
	bh=/6/xrhy2VK8rv9Ab2bukLa1NMT3LhP85pjvG7M4Jma4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LNFVxmjxwL0pBW5fevqxPHrGCSTOPXcjaAKlN6AU1u3OXIoTBFFNwYA3QFP1D9z/jinNlJyS4XOSzbL5RLKs7ae62uJZnz7rl35Mg4OLSyKuG3KuxQYRpuRa681fvfUYhLnp38ALnO9IOm6kS+DZKQ2KzmZ5LPxGCJobGViy8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jr7LwRg6; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jr7LwRg6"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6facacf521eso28882756d6.3;
        Sun, 06 Jul 2025 13:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751833055; x=1752437855; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE6BmdmRO4PXdCDMm4uuEMt1ILfGzpW83Ac+bf8q5u0=;
        b=Jr7LwRg6q11kOMyHA68PdZtOaJNzn8N9jHdRuGxqf34NBdjzPdDsGp8RXFBrxfan63
         W5yKNncmXkgX6BzadoWd3m3ufm72YW+t/s3yN/JMQd1T0pYGFGSDr7ABKJLS6mGsZpef
         5p6pbA4IdxZ22r8zWGEZFf1DeVCPbhhYkb4bpOXISLcfCy4neGPYHBZUEKUptAZtKWSj
         lkSkgyLgFqlf+AQ7agjcQjCTZHT0S6dgowVLGR7pL0jDwDWp34jQm+L+M0uiWuaJh75U
         Hye8uBYxgWEBX4KG4pdrYUnzLs/WqtTUedvGNNl0IaGZ5TuKJh9iBok/4D5jC98xfkpj
         NyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751833055; x=1752437855;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KE6BmdmRO4PXdCDMm4uuEMt1ILfGzpW83Ac+bf8q5u0=;
        b=dekx2aO3YthETk6fMTSxP2RSROmI0wmFYsRb+VVRnN05AZ4XxgePQ4BrJl/zYRvl+i
         Xb3KyAGw9/Dpl02TJh03yepOU8+YiF/KS+Txsv4MlIarVYaHKdizSebn3OVtnmUf9OvM
         08Z/VJqwhkYS8ij02u6XB/hzrNn+Av1OaPEDtYaoqt4wnWHSiKmwm1ggO0kNUHuTqon5
         tLtzMsLjHY8YuOG+pVhr+w4y7yccN2gSgIjA/m4U45qRZeUJBYWlsAQjyp9du6yYIpFq
         9LJscNvulDxfXl/Zn7KzgcqxE47KRGUxO9QKp9wHuU4UR/YMZMjjYQA0WXLm2/5d1ts9
         vSTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFS7GWslBSoY5heb+xyzlLlJ3khCaTT/yD0rrH1wJahYm9SSQnfnZppwQadDPEjVlvHJdDgkLn5PwVkrM=@vger.kernel.org, AJvYcCXy+dX2G4GrcYUpp+3ZvTKTT7//82IH/A1RHf5QRUhgZVNAf0+DXEzA3RPeWND5Y6wNdMF6APRR5kRDcqTMkjF8CaIfJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyypeBiswJlt7ZPzficPVQtWfXC4iTSOK1heEEfegLm3qex59SZ
	FBWKA6Pkb3FOXRNA6b/Qkng+G2TNqr8VomVgotx81W/e0s7AokSfVjVxTcTFHeaU
X-Gm-Gg: ASbGnctLlSID+sZ59y3A2WqQO39EoWQU/BfoEoS5jXZ61xbD4R+khSKvOjaXdCmeXvV
	qVHLeDKUJ8yq3WK2hlkOsaQoAHOdsUotYYlfNoPEHVWathkrbTU19vzqIYJSJaUDzk+y9PkDSst
	RddgSbp1G0jXq95fRdPiqNQiqJMxAqZGGXGWMxSOCh+z6UiidTrzoj/XqAPskUMtQmqeNpdyhYf
	fWBvA0/dxyD+MsFNRGrz9ZHwnHDGpnrzkbXeW8jooYd8THWajPxmWS/dkKUlazs7f4q4WZs8f/r
	dnD0WxEHs9L6PlZMD6u3ClHrVUYSoFstLzcW0GupvE3bH9U0DyOJzDY=
X-Google-Smtp-Source: AGHT+IGseLTj/S3NtLyNjdMjidQUwXSVVQ6PFBxGDVnklU49Z8luPPK/eHizXeLACveVnhM6Gk8ZXg==
X-Received: by 2002:a05:6214:268f:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-702d169429dmr87455606d6.29.1751833055281;
        Sun, 06 Jul 2025 13:17:35 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd94237sm498215185a.17.2025.07.06.13.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 13:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Jul 2025 17:17:30 -0300
Message-Id: <DB58ZL4QV1G7.H32DMUGWCUIB@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Joshua Grisham" <josh@joshuagrisham.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Antheas Kapenekakis"
 <lkml@antheas.dev>, "Derek J. Clark" <derekjohn.clark@gmail.com>, "Prasanth
 Ksr" <prasanth.ksr@dell.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v5 2/6] platform/x86: firmware_attributes_class: Add
 high level API for the attributes interface
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>
 <e628de77-e8b0-4eed-b4df-f8b5ac609f0d@t-8ch.de>
In-Reply-To: <e628de77-e8b0-4eed-b4df-f8b5ac609f0d@t-8ch.de>

On Sun Jul 6, 2025 at 4:40 AM -03, Thomas Wei=C3=9Fschuh wrote:
> On 2025-07-05 00:33:57-0300, Kurt Borja wrote:
>> Add high level API to aid in the creation of attribute groups attached
>> to the `attrs_kobj` (per ABI specification).
>>=20
>> This new API lets users configure each group, either statically or
>> dynamically through a (per type) data struct and then create this group
>> through the generic fwat_create_group() macro.
>
> How does this deal with non-standard types and non-standard attribute
> "subattributes"?

IMO non-standard types aren't priority right now. Even if we accomodate
something for those, it would be rarely used, if ever. Also the
attrs_kset is exposed to users, so they can add custom kobjects to it
(with some consideration about ownership ofc).

Non-standard "subattributes" are easy to accomodate for. We can take
extra groups in fwat_create_group().

>
> Did you compare the code sizes of the framework and using drivers before
> and after? It looks like it will grow quite a bit.

I'll work a comparison for the next version.

By looking at users of the class (think-lmi for example). Drivers
already use some kind of fwat_group_data structure, which stores values
for the static properties of each "firmware attribute". These are also
dynamically allocated in most cases because FW provides enumeration
methods.

This makes me think that total used memory (static and dynamic) should
be fairly similar, in most cases.

>
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/firmware_attributes_class.c | 532 ++++++++++++++++=
+++++++
>>  drivers/platform/x86/firmware_attributes_class.h | 335 ++++++++++++++
>>  2 files changed, 867 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/=
platform/x86/firmware_attributes_class.c
>> index 290364202cce64bb0e9046e0b2bbb8d85e2cbc6f..96473b3b1a2a87cf21a6e2a9=
a14d72ae322c94ae 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.c
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>> @@ -10,13 +10,67 @@
>>  #include <linux/module.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>> +#include <linux/string_choices.h>
>>  #include "firmware_attributes_class.h"
>> =20
>> +#define FWAT_TYPE_NONE				-1
>
> Braces around '-1'.
>
> One the other hand this define is only used in two places and the value
> does not matter and is only passed because the macros expect something.
> Maybe move the definition to where it is used and do:
>
> __FWAT_TYPE_NONE (-1) /* dummy value, never evaluated */
>
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
>
> Please make the 'struct fwat_attribute *' argument const.
> Somebody (me) is currently working on constifying 'struct attribute'.
>
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
>
> Move the opening brace to the line above.
>
>> +		.attr =3D { .name =3D __stringify(_name), .mode =3D _mode },	\
>> +		.show =3D _show, .store =3D _store, .type =3D _type,		\
>> +	}
>> +
>
> <snip>
>
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
>
> Slightly easier to read if the line above is:
>
> 	sz =3D sysfs_emit_at(buf, 0, "%s", data->possible_vals[0]);
>
> And drop the initialization of sz.
>
>
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
>
> <snip>
>
>> +static umode_t fwat_attr_visible(struct kobject *kobj, struct attribute=
 *attr, int n)
>> +{
>> +	struct fwat_attribute *fwat_attr =3D to_fwat_attribute(attr);
>
> const
>
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
>
> Why DEFINE_SYSFS_GROUP_VISIBLE() if the per-group callback doesn't do
> anything?
>
>> +
>> +static const struct attribute_group fwat_bool_group =3D {
>> +	.attrs =3D fwat_bool_attrs,
>> +	.is_visible =3D SYSFS_GROUP_VISIBLE(fwat),
>> +};
>> +__ATTRIBUTE_GROUPS(fwat_bool);
>
> <snip>
>
>>  /**
>>   * fwat_device_register - Create and register a firmware-attributes cla=
ss
>>   *			  device
>> @@ -89,6 +620,7 @@ void fwat_device_unregister(struct fwat_device *fadev=
)
>>  	if (!fadev)
>>  		return;
>> =20
>> +	fwat_remove_auto_groups(fadev);
>
> As before, the groups are children of the device so should be removed
> automatically.

I'm pretty sure that would leak the fwat_group memory allocated in
__fwat_create_group(). Filesystem should be fine, but we still need to
put down kobject references.

>
>>  	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
>>  	kset_unregister(fadev->attrs_kset);
>>  	device_unregister(&fadev->dev);
>> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/=
platform/x86/firmware_attributes_class.h
>> index 048fd0904f767357ef856e687ec4cf3260016ec6..e8868ce05b595eda94a98975=
428391b9f9341e3d 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.h
>> +++ b/drivers/platform/x86/firmware_attributes_class.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/device/class.h>
>>  #include <linux/kobject.h>
>>  #include <linux/sysfs.h>
>> +#include <linux/list.h>
>
> Unnecessary for public header.
>
>> =20
>>  extern const struct class firmware_attributes_class;
>> =20
>> @@ -27,6 +28,340 @@ struct fwat_device {
>> =20
>>  #define to_fwat_device(_d)	container_of_const(_d, struct fwat_device, d=
ev)
>> =20
>> +enum fwat_group_type {
>> +	fwat_group_boolean,
>
> I have a slight preference for "fwat_group_type_boolean".

Ack.

>
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
>
> Is the ALL_ATTRS really necessary? It could lead to issues when new
> optional attributes are added to the core.

Most drivers end up using all sub-attrs so I included it to avoid
seeing this every time:=20

FWAT_INT_DEFAULT_VALUE | FWAT_INT_MIN_VALUE | FWAT_INT_MIN_VALUE | ...

>
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
>
> Move this into the the .c file right next to the code relying on this
> invariant.
>
> <snip>
>
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
>
> Align all backslashes of the definition.
>
>> +		.read =3D _name##_read,					\
>> +		.write =3D _name##_write,					\
>> +		.default_idx =3D _def_idx,				\
>> +		.possible_vals =3D _poss_vals,				\
>> +		.group =3D __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
>> +	}
>
> <snip>
>
>> +int fwat_create_bool_group(struct fwat_device *fadev,
>> +			   const struct fwat_bool_data *data);
>> +int fwat_create_enum_group(struct fwat_device *fadev,
>> +			   const struct fwat_enum_data *data);
>> +int fwat_create_int_group(struct fwat_device *fadev,
>> +			  const struct fwat_int_data *data);
>> +int fwat_create_str_group(struct fwat_device *fadev,
>> +			  const struct fwat_str_data *data);
>
> If these are not meant to be used by users, give them a leading
> underscore?

Ack.

>
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
>
> I'd prefer if users don't need dynamic data allocations if possible.
> Let's see how it works out with the existing drivers.

That would be ideal ofc. But, as I said above, most drivers dynamically
enumerate and allocate "firmware attributes" so I think we need to
accomodate for this.

Most new drivers on the other hand know all these values beforehand so
in the end the user can decide how to define this data structs.

>
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
>>  struct fwat_device * __must_check
>>  fwat_device_register(struct device *parent, const char *name, void *drv=
data,
>>  		     const struct attribute_group **groups);
>>=20
>> --=20
>> 2.50.0
>>=20

Ack to the rest of comments. Thank you for your feedback!


--=20
 ~ Kurt

