Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902401DE4D8;
	Fri,  9 May 2025 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820617; cv=none; b=G6142c8LS1AW/1rt+GS5bz+TVQEaEa8b+yZM5wtvCbUiINSnCyQogqtGJ3YH+4t0xB1r9bGtvv2p5WuSZe9dkWKr9HIJeqfqeiaORBh3KigYi9W7kxs8CjdHoy/WFNt/+Z/IZoy6hcAQIdKUHZeb8/S85hLDHkXP1cCc/Gtmfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820617; c=relaxed/simple;
	bh=xi6VQFFlJw8/4669cOVCugl4h0pwy/8Dxxm4i7MtEKo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rPCktFE74xZw3zxWmLKlvnhv6MStld0tkij+yaDsiUGMguXwHpXUHmf3774l8BZoZAum9ugd0VOPnCNYlE8wxDokyY3Pa3NoqHWgtkef7Gb+zXIw+l/USTtJWFi9IhzZ0KLIUJRAagYICA73r0/RGRqCyIzt6x9MktY1YnmGLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THs2DzBg; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THs2DzBg"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4deff18d67aso183243137.3;
        Fri, 09 May 2025 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746820614; x=1747425414; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRmTThvT6QZWI6EYKbmtfY0nRVVEac4cck5we3DSUFo=;
        b=THs2DzBg33ryR2N9Rn37FNWA99E6k+UddSoyFQj061HuCVwVRFfdImXMUBw5zBB2Cp
         RmHHrcrNXEGREkEfmF7KafRu25XpTThaJJZTxk3ykYUui+550wiAzS93UZaNH0MqSO8j
         UhHd8pVS89p/cU98kz3HZdTLglY6GtYqHk1GJxhGqqDkUjNZhu0aHkb+YIQW/PhcVkZX
         TvrpAr1HKn/jjGVmcU0cOypxtN7HFDhc9MdyucOyXYIQDyGBdMGKmHkQM217nbAEVZg+
         6RKHhS3hZRD2MdxNR+bA6dGjKyYvpbpWKuX0wkX6+8BwnKFktrELKh7+TZxUAzrZ+gAb
         Er5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820614; x=1747425414;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRmTThvT6QZWI6EYKbmtfY0nRVVEac4cck5we3DSUFo=;
        b=ta4ESX+IOoGXfrWC4fdCj63u652630ESqsj6LXeIscOmAS0xU3Gmw0u2feuzHfdg7i
         28EvaV6Wl+anbp0WP7mAWisU7sBxRfpGnqpa8hM8/cz4cdTLWB/DT4tx1J39VqhAOWVk
         qBCFPfMD1hX7w2wicUi3zpACJ6ViYuxNOdzuKsaFEoNJLW0gRHBDQO5BQDJb3y59j4OX
         TClhYO981Tzc/XA5oJe/VYuprm15ZCiJI7QVGhB6iEZqC9mclljFQLC9tNKwT04eIJfm
         WtmxboF/kKVALwEZ319jVynPutAthE7Rs6jeU8Ple4BgSNt3cX/vGdPYaZjWXHafXyvi
         JlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk87vM4cATtCBdBFfVIUbnGVROajad3ebu877OIaYh20xceGNcQFkzhEfBxQg3crNhaN/jfZZRzrB39/0=@vger.kernel.org, AJvYcCXpBVqWiVlSLBnxB9H/ahAldBxT0JxUQ0Sp+Qor8Oi89m4JKdl6sC1/pPJ4buWEpwj9eeY1X1zlpBuLG705s6RlPBoRrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaIOk2eP6Y4SmKCiRk67GU3AjaJ/TB6u5M6EVH5j2SoRoA1Nx
	taWGiANWQoHxBd9msXuI+o72FfB7zj2yXyaaMXmfbTHJAE0R2xsZ
X-Gm-Gg: ASbGncu2JYyx28Dn86lFDMmZgSmqegZjBwVYALUUiDEabfTjyUs9dMaGrIN9z4Q6dvl
	Uu4ZRN7udMSNHlwXbW/EQPlxK3+hz8ckQJzQji2s1fK8uiM9OcUWOGjUOwBvTxFTXSBgVjAT6Oe
	BX6RICICoPibA2PE210/33PfYO938BvDpobCzqMxo6hT5zBFJSxZ/9R8mUJLF9dsaNq/+KtL7E2
	iu5w2QE4aWJ+nUUZ/N9BPJ+9AXT1yqjvmv0hxGohMZRX4CVlO057eRPwj+gvdABKFqcVoF5qwfS
	1Z0+zQhhO4rpG/fEeImo4HKIEI2xG0/vFiWWRYqhEnxm
X-Google-Smtp-Source: AGHT+IGZitnyTlkOwTl9K7CrWWpJLVem0PcmR5NK4+tTjupgHrQxBHwwssBU3RPxs1Q5fXudJR5fIQ==
X-Received: by 2002:a67:e7cc:0:b0:4dd:ab6c:765a with SMTP id ada2fe7eead31-4deed36dc90mr4918434137.12.1746820614065;
        Fri, 09 May 2025 12:56:54 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea857f6a0sm1693497137.5.2025.05.09.12.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 12:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=95dda5cf434d0e167a653df38332fd61f57a5ae44d4c2accdffee3a46368;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 16:56:33 -0300
Message-Id: <D9RW7Y6IU7Y0.GOM8TXTY9QPA@gmail.com>
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Jorge
 Lopez" <jorge.lopez2@hp.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH RFC 2/5] platform/x86: firmware_attributes_class: Add a
 high level API
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Joshua Grisham" <josh@joshuagrisham.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-2-258afed65bfa@gmail.com>
 <7cbfac66-e7fc-4035-b8ff-b40fe9592085@amd.com>
In-Reply-To: <7cbfac66-e7fc-4035-b8ff-b40fe9592085@amd.com>

--95dda5cf434d0e167a653df38332fd61f57a5ae44d4c2accdffee3a46368
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Mario,

On Fri May 9, 2025 at 12:58 PM -03, Mario Limonciello wrote:
> On 5/9/2025 2:48 AM, Kurt Borja wrote:
>> Add an attribute configuration mechanism through the newly introduced
>> `struct fwat_dev_config`, which makes use of other documented structs
>> and callbacks.
>>=20
>> This API aims to be simple, yet flexible. In order to accomplish this,
>> the following features were taken into account:
>>=20
>> * Ability to statically define attributes
>> * Custom read/write callbacks for each attribute type
>> * Ability to map attributes to numbers in order to differentiate them in
>>    callbacks (`aux` number)
>> * Ability to reuse read/write callbacks in different attributes
>> * Ability to reuse property selection in different attributes
>> * Optional visibility callback for dynamic attribute visibility
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/firmware_attributes_class.c | 249 +++++++++++++++=
+++++++-
>>   drivers/platform/x86/firmware_attributes_class.h | 228 +++++++++++++++=
++++++
>>   2 files changed, 474 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/=
platform/x86/firmware_attributes_class.c
>> index 58ab1495ba3bd449cfe17de2827a57a0c5937788..7cfb0f49f235728c7450a82a=
7e9d00b8963d3dea 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.c
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>> @@ -7,14 +7,233 @@
>>   #include <linux/kobject.h>
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>> +#include <linux/sysfs.h>
>>   #include <linux/types.h>
>>   #include "firmware_attributes_class.h"
>>  =20
>> +#define to_fwat_attribute_ext(_a) container_of_const(_a, struct fwat_at=
tribute_ext, attr)
>> +
>> +struct fwat_attribute_ext {
>> +	struct fwat_attribute attr;
>> +	enum fwat_property prop;
>> +	const struct fwat_attr_config *config;
>> +};
>> +
>>   const struct class firmware_attributes_class =3D {
>>   	.name =3D "firmware-attributes",
>>   };
>>   EXPORT_SYMBOL_GPL(firmware_attributes_class);
>>  =20
>> +static const char * const fwat_type_labels[] =3D {
>> +	[fwat_type_integer]		=3D "integer",
>> +	[fwat_type_string]		=3D "string",
>> +	[fwat_type_enumeration]		=3D "enumeration",
>> +};
>> +
>> +static const char * const fwat_prop_labels[] =3D {
>> +	[FWAT_PROP_DISPLAY_NAME]		=3D "display_name",
>> +	[FWAT_PROP_LANGUAGE_CODE]		=3D "display_name_language_code",
>> +	[FWAT_PROP_DEFAULT]			=3D "default",
>> +
>> +	[FWAT_INT_PROP_MIN]			=3D "min_value",
>> +	[FWAT_INT_PROP_MAX]			=3D "max_value",
>> +	[FWAT_INT_PROP_INCREMENT]		=3D "scalar_increment",
>> +
>> +	[FWAT_STR_PROP_MIN]			=3D "min_length",
>> +	[FWAT_STR_PROP_MAX]			=3D "max_length",
>> +
>> +	[FWAT_ENUM_PROP_POSSIBLE_VALUES]	=3D "possible_values",
>> +};
>> +
>> +static ssize_t
>> +fwat_type_show(struct device *dev, const struct fwat_attribute *attr, c=
har *buf)
>> +{
>> +	const struct fwat_attribute_ext *ext =3D to_fwat_attribute_ext(attr);
>> +	const struct fwat_attr_config *config =3D ext->config;
>> +
>> +	return sysfs_emit(buf, "%s\n", fwat_type_labels[config->type]);
>> +}
>> +
>> +static ssize_t
>> +fwat_property_show(struct device *dev, const struct fwat_attribute *att=
r, char *buf)
>> +{
>> +	const struct fwat_attribute_ext *ext =3D to_fwat_attribute_ext(attr);
>> +	const struct fwat_attr_config *config =3D ext->config;
>> +
>> +	if (!config->ops->prop_read)
>> +		return -EOPNOTSUPP;
>> +
>> +	return config->ops->prop_read(dev, config->aux, ext->prop, buf);
>> +}
>> +
>> +static ssize_t
>> +fwat_current_value_show(struct device *dev, const struct fwat_attribute=
 *attr, char *buf)
>> +{
>> +	const struct fwat_attribute_ext *ext =3D to_fwat_attribute_ext(attr);
>> +	const struct fwat_attr_config *config =3D ext->config;
>> +	const char *str;
>> +	long int_val;
>> +	int ret;
>> +
>> +	switch (config->type) {
>> +	case fwat_type_integer:
>> +		ret =3D config->ops->integer_read(dev, config->aux, &int_val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return sysfs_emit(buf, "%ld\n", int_val);
>> +	case fwat_type_string:
>> +		ret =3D config->ops->string_read(dev, config->aux, &str);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return sysfs_emit(buf, "%s\n", str);
>> +	case fwat_type_enumeration:
>> +		ret =3D config->ops->enumeration_read(dev, config->aux, &str);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return sysfs_emit(buf, "%s\n", str);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static ssize_t
>> +fwat_current_value_store(struct device *dev, const struct fwat_attribut=
e *attr,
>> +			 const char *buf, size_t count)
>> +{
>> +	const struct fwat_attribute_ext *ext =3D to_fwat_attribute_ext(attr);
>> +	const struct fwat_attr_config *config =3D ext->config;
>> +	long int_val;
>> +	int ret;
>> +
>> +	switch (config->type) {
>> +	case fwat_type_integer:
>> +		ret =3D kstrtol(buf, 0, &int_val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret =3D config->ops->integer_write(dev, config->aux, int_val);
>> +		break;
>> +	case fwat_type_string:
>> +		ret =3D config->ops->string_write(dev, config->aux, buf);
>> +		break;
>> +	case fwat_type_enumeration:
>> +		ret =3D config->ops->enumeration_write(dev, config->aux, buf);
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return ret ? ret : count;
>> +}
>> +
>> +static struct attribute *
>> +fwat_alloc_attr(struct device *dev, const struct fwat_attr_config *conf=
ig,
>> +		const char *attr_name, umode_t mode, enum fwat_property prop,
>> +		ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr=
,
>> +				char *buf),
>> +		ssize_t (*store)(struct device *dev, const struct fwat_attribute *att=
r,
>> +				 const char *buf, size_t count))
>> +{
>> +	struct fwat_attribute_ext *fattr;
>> +
>> +	fattr =3D devm_kzalloc(dev, sizeof(*fattr), GFP_KERNEL);
>> +	if (!fattr)
>> +		return NULL;
>> +
>> +	fattr->attr.attr.name =3D attr_name;
>> +	fattr->attr.attr.mode =3D mode;
>> +	fattr->attr.show =3D show;
>> +	fattr->attr.store =3D store;
>> +	fattr->prop =3D prop;
>> +	fattr->config =3D config;
>> +	sysfs_attr_init(&fattr->attr.attr);
>> +
>> +	return &fattr->attr.attr;
>> +}
>> +
>> +static struct attribute **
>> +fwat_create_attrs(struct device *dev, const struct fwat_attr_config *co=
nfig)
>> +{
>> +	struct attribute **attrs;
>> +	enum fwat_property prop;
>> +	unsigned int index =3D 0;
>> +
>> +	attrs =3D devm_kcalloc(dev, config->num_props + 3, sizeof(*attrs), GFP=
_KERNEL);
>> +	if (!attrs)
>> +		return NULL;
>> +
>> +	/*
>> +	 * Create optional attributes
>> +	 */
> Just a nit here; this probably doesn't need to be a multiline comment.=20
> a single line like this is fine:
>
> /* optional attributes */
>
>> +	for (; index < config->num_props; index++) {
>> +		prop =3D config->props[index];
>> +		attrs[index] =3D fwat_alloc_attr(dev, config, fwat_prop_labels[prop],
>> +					       0444, prop, fwat_property_show, NULL);
>> +	}
>> +
>> +	/*
>> +	 * Create mandatory attributes
>> +	 */
>
> Same as above

Ack for these two.

>
>> +	attrs[index++] =3D fwat_alloc_attr(dev, config, "type", 0444, 0, fwat_=
type_show, NULL);
>> +	attrs[index++] =3D fwat_alloc_attr(dev, config, "current_value", 0644,=
 0,
>
> Is this permission right?  Some attributes could be considered more=20
> sensitive can't they?

You are right. I assumed most drivers would want 0644 but think-lmi and
dell sysman use 0600.

I can add a mode_t mask to fwat_attr_config and use that for
current_value, while other properties would be masked by it, i.e.
`0444 & config->mode`

What do you think?

--=20
 ~ Kurt

>
>> +					 fwat_current_value_show, fwat_current_value_store);
>> +
>> +	return attrs;
>> +}
>> +
>> +static const struct attribute_group *
>> +fwat_create_group(struct device *dev, const struct fwat_attr_config *co=
nfig)
>> +{
>> +	struct attribute_group *group;
>> +	struct attribute **attrs;
>> +
>> +	group =3D devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return NULL;
>> +
>> +	attrs =3D fwat_create_attrs(dev, config);
>> +	if (!attrs)
>> +		return NULL;
>> +
>> +	group->name =3D config->name;
>> +	group->attrs =3D attrs;
>> +
>> +	return group;
>> +}
>> +
>> +static const struct attribute_group **
>> +fwat_create_auto_groups(struct device *dev, const struct fwat_dev_confi=
g *config)
>> +{
>> +	const struct attribute_group **groups;
>> +	const struct attribute_group *grp;
>> +	unsigned int index =3D 0;
>> +	size_t ngroups =3D 0;
>> +
>> +	while (config->attrs_config[ngroups])
>> +		ngroups++;
>> +
>> +	groups =3D devm_kcalloc(dev, ngroups + 1, sizeof(*groups), GFP_KERNEL)=
;
>> +	if (!groups)
>> +		return NULL;
>> +
>> +	for (unsigned int i =3D 0; i < ngroups; i++) {
>> +		if (config->is_visible &&
>> +		    !config->is_visible(dev, config->attrs_config[i]))
>> +			continue;
>> +
>> +		grp =3D fwat_create_group(dev, config->attrs_config[i]);
>> +		if (!grp)
>> +			return NULL;
>> +
>> +		groups[index++] =3D grp;
>> +	}
>> +
>> +	return groups;
>> +}
>> +
>>   static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attri=
bute *attr,
>>   				    char *buf)
>>   {
>> @@ -61,6 +280,7 @@ static const struct kobj_type fwat_attrs_ktype =3D {
>>    *			  device
>>    * @parent: Parent device
>>    * @name: Name of the class device
>> + * @config: Device configuration
>>    * @data: Drvdata of the class device
>>    * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
>>    *
>> @@ -72,8 +292,10 @@ static const struct kobj_type fwat_attrs_ktype =3D {
>>    */
>>   struct fwat_device *
>>   fwat_device_register(struct device *parent, const char *name, void *da=
ta,
>> +		     const struct fwat_dev_config *config,
>>   		     const struct attribute_group **groups)
>>   {
>> +	const struct attribute_group **auto_groups;
>>   	struct fwat_device *fadev;
>>   	struct device *dev;
>>   	int ret;
>> @@ -97,19 +319,36 @@ fwat_device_register(struct device *parent, const c=
har *name, void *data,
>>   	if (ret)
>>   		goto out_kobj_put;
>>  =20
>> -	if (groups) {
>> -		ret =3D sysfs_create_groups(&fadev->attrs_kobj, groups);
>> +	if (config) {
>> +		auto_groups =3D fwat_create_auto_groups(dev, config);
>> +		if (!auto_groups) {
>> +			ret =3D -ENOMEM;
>> +			goto out_kobj_unregister;
>> +		}
>> +
>> +		ret =3D sysfs_create_groups(&fadev->attrs_kobj, auto_groups);
>>   		if (ret)
>>   			goto out_kobj_unregister;
>>   	}
>>  =20
>> +	if (groups) {
>> +		ret =3D sysfs_create_groups(&fadev->attrs_kobj, groups);
>> +		if (ret)
>> +			goto out_remove_auto_groups;
>> +	}
>> +
>>   	fadev->dev =3D dev;
>>   	fadev->groups =3D groups;
>> +	fadev->auto_groups =3D groups;
>>  =20
>>   	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
>>  =20
>>   	return fadev;
>>  =20
>> +out_remove_auto_groups:
>> +	if (config)
>> +		sysfs_remove_groups(&fadev->attrs_kobj, auto_groups);
>> +
>>   out_kobj_unregister:
>>   	kobject_del(&fadev->attrs_kobj);
>>  =20
>> @@ -125,6 +364,8 @@ void fwat_device_unregister(struct fwat_device *fwad=
ev)
>>   {
>>   	if (fwadev->groups)
>>   		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
>> +	if (fwadev->auto_groups)
>> +		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->auto_groups);
>>   	kobject_del(&fwadev->attrs_kobj);
>>   	kobject_put(&fwadev->attrs_kobj);
>>   	device_unregister(fwadev->dev);
>> @@ -143,6 +384,7 @@ static void devm_fwat_device_release(void *data)
>>    *			       device
>>    * @parent: Parent device
>>    * @name: Name of the class device
>> + * @config: Device configuration
>>    * @data: Drvdata of the class device
>>    * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
>>    *
>> @@ -156,12 +398,13 @@ static void devm_fwat_device_release(void *data)
>>    */
>>   struct fwat_device *
>>   devm_fwat_device_register(struct device *parent, const char *name, voi=
d *data,
>> +			  const struct fwat_dev_config *config,
>>   			  const struct attribute_group **groups)
>>   {
>>   	struct fwat_device *fadev;
>>   	int ret;
>>  =20
>> -	fadev =3D fwat_device_register(parent, name, data, groups);
>> +	fadev =3D fwat_device_register(parent, name, data, config, groups);
>>   	if (IS_ERR(fadev))
>>   		return fadev;
>>  =20
>> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/=
platform/x86/firmware_attributes_class.h
>> index ad94bf91e5af30a2b8feb9abf224ee6f0d17600a..f250875d785c3439682c43c6=
93f98e1c20e9ff54 100644
>> --- a/drivers/platform/x86/firmware_attributes_class.h
>> +++ b/drivers/platform/x86/firmware_attributes_class.h
>> @@ -18,11 +18,14 @@ extern const struct class firmware_attributes_class;
>>    * @dev: The class device.
>>    * @attrs_kobj: The "attributes" root kobject.
>>    * @groups: Sysfs groups attached to the @attrs_kobj.
>> + * @auto_groups: Sysgs groups generated from &struct fwat_attr_config a=
ttached.
>> + * to the @attrs_kobj
>>    */
>>   struct fwat_device {
>>   	struct device *dev;
>>   	struct kobject attrs_kobj;
>>   	const struct attribute_group **groups;
>> +	const struct attribute_group **auto_groups;
>>   };
>>  =20
>>   #define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, =
attrs_kobj)
>> @@ -30,6 +33,7 @@ struct fwat_device {
>>   /**
>>    * struct fwat_attribute - The firmware-attributes's custom attribute
>>    * @attr: Embedded struct attribute.
>> + * @aux: Auxiliary number defined by the user.
>>    * @show: Show method called by the "attributes" kobject's ktype.
>>    * @store: Store method called by the "attributes" kobject's ktype.
>>    */
>> @@ -43,14 +47,238 @@ struct fwat_attribute {
>>  =20
>>   #define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attri=
bute, attr)
>>  =20
>> +enum fwat_attr_type {
>> +	fwat_type_integer,
>> +	fwat_type_string,
>> +	fwat_type_enumeration,
>> +};
>> +
>> +enum fwat_property {
>> +	FWAT_PROP_DISPLAY_NAME,
>> +	FWAT_PROP_LANGUAGE_CODE,
>> +	FWAT_PROP_DEFAULT,
>> +
>> +	FWAT_INT_PROP_MIN,
>> +	FWAT_INT_PROP_MAX,
>> +	FWAT_INT_PROP_INCREMENT,
>> +
>> +	FWAT_STR_PROP_MIN,
>> +	FWAT_STR_PROP_MAX,
>> +
>> +	FWAT_ENUM_PROP_POSSIBLE_VALUES,
>> +};
>> +
>> +struct fwat_attr_config;
>> +
>> +/**
>> + * struct fwat_attr_ops - Operations for a firmware *attribute*
>> + * @prop_read: Callback for retrieving each configured property of an a=
ttribute.
>> + * @integer_read: Callback for reading the current_value of an attribut=
e of
>> + *                type *integer*.
>> + * @integer_write: Callback for writing the current_value of an attribu=
te of
>> + *                 type *integer*.
>> + * @string_read: Callback for reading the current_value of an attribute=
 of type
>> + *               *string*.
>> + * @string_write: Callback for writing the current_value of an attribut=
e of type
>> + *                *string*.
>> + * @enumeration_read: Callback for reading the current_value of an attr=
ibute of
>> + *                    type *enumeration*.
>> + * @enumeration_write: Callback for writing the current_value of an att=
ribute
>> + *                     of type *enumeration*.
>> + */
>> +struct fwat_attr_ops {
>> +	ssize_t (*prop_read)(struct device *dev, long aux,
>> +			     enum fwat_property prop, const char *buf);
>> +	union {
>> +		struct {
>> +			int (*integer_read)(struct device *dev, long aux,
>> +					    long *val);
>> +			int (*integer_write)(struct device *dev, long aux,
>> +					     long val);
>> +		};
>> +		struct {
>> +			int (*string_read)(struct device *dev, long aux,
>> +					   const char **str);
>> +			int (*string_write)(struct device *dev, long aux,
>> +					    const char *str);
>> +		};
>> +		struct {
>> +			int (*enumeration_read)(struct device *dev, long aux,
>> +						const char **str);
>> +			int (*enumeration_write)(struct device *dev, long aux,
>> +						 const char *str);
>> +		};
>> +	};
>> +};
>> +
>> +/**
>> + * struct fwat_attr_config - Configuration for a single firmware *attri=
bute*
>> + * @name: Name of the sysfs group associated with this *attribute*.
>> + * @type: Type of this *attribute*.
>> + * @aux: Auxiliary number defined by the user, which will be passed to
>> + *       read/write callbacks.
>> + * @ops: Operations for this *attribute*.
>> + * @props: Array of properties of this *attribute*.
>> + * @num_props: Size of the props array.
>> + */
>> +struct fwat_attr_config {
>> +	const char *name;
>> +	enum fwat_attr_type type;
>> +	long aux;
>> +	const struct fwat_attr_ops *ops;
>> +	const enum fwat_property *props;
>> +	size_t num_props;
>> +};
>> +
>> +/**
>> + * DEFINE_SIMPLE_FWAT_OPS() - Define static &struct fwat_attr_ops for a=
 simple
>> + *                            *attribute* with no properties, i.e. No
>> + *                            &fwat_attr_ops.read_prop callback
>> + * @_name: Prefix of the `read` and `write` callbacks.
>> + * @_type: Firmware *attribute* type.
>> + *
>> + * Example:
>> + *
>> + * static int example_read(...) {...}
>> + * static int example_write(...) {...}
>> + *
>> + * DEFINE_SIMPLE_FWAT_OPS(example, ...);
>> + */
>> +#define DEFINE_SIMPLE_FWAT_OPS(_name, _type)		\
>> +	static const struct fwat_attr_ops _name##_ops =3D { \
>> +		._type##_read =3D _name##_read,		\
>> +		._type##_write =3D _name##_write,		\
>> +	}
>> +
>> +/**
>> + * DEFINE_FWAT_OPS() - Define static &struct fwat_attr_ops with all cal=
lbacks.
>> + * @_name: Prefix of the `read` and `write` callbacks.
>> + * @_type: Firmware *attribute* type.
>> + *
>> + * Example:
>> + *
>> + * static int example_read(...) {...}
>> + * static int example_write(...) {...}
>> + * static int example_prop_read(...) {...}
>> + *
>> + * DEFINE_FWAT_OPS(example, ...);
>> + */
>> +#define DEFINE_FWAT_OPS(_name, _type)			\
>> +	static const struct fwat_attr_ops _name##_ops =3D { \
>> +		.prop_read =3D _name##_prop_read,		\
>> +		._type##_read =3D _name##_read,		\
>> +		._type##_write =3D _name##_write,		\
>> +	}
>> +
>> +/**
>> + * FWAT_CONFIG() - Configuration pointer for a single firmware *attribu=
te*.
>> + * @_name: String name of this *attribute*.
>> + * @_type: Firmware *attribute* type.
>> + * @_ops: Pointer to &struct fwat_attr_ops.
>> + * @_props: Pointer to a enum fwat_property array.
>> + * @_num_props: Size of the @_props array.
>> + *
>> + * This is a convenience macro to quickly construct a &struct fwat_attr=
_config
>> + * array, which will be passed to &struct fwat_dev_config.
>> + *
>> + * Example:
>> + *
>> + * static int example_read(...) {...}
>> + * static int example_write(...) {...}
>> + * static int example_prop_read(...) {...}
>> + *
>> + * DEFINE_FWAT_OPS(example, ...);
>> + *
>> + * static const enum fwat_property props[] =3D {...};
>> + *
>> + * static const struct fwat_attr_config * const attrs_config[] =3D {
>> + *	FWAT_CONFIG(example, ..., &example_fwat_ops, props,
>> + *		    ARRAY_SIZE(props)),
>> + *	...
>> + *	NULL
>> + * };
>> + *
>> + * static const struct fwat_dev_config fdev_config =3D {
>> + *	.attrs_config =3D attrs_config,
>> + *	...
>> + * }
>> + */
>> +#define FWAT_CONFIG(_name, _type, _ops, _props, _num_props) \
>> +	(&(const struct fwat_attr_config) {	\
>> +		.name =3D _name,				\
>> +		.type =3D fwat_type_##_type,		\
>> +		.ops =3D _ops,				\
>> +		.num_props =3D _num_props,		\
>> +		.props =3D _props,			\
>> +	})
>> +
>> +/**
>> + * FWAT_CONFIG_AUX() - Configuration pointer for a single firmware *att=
ribute*
>> + *                     with an auxiliary number defined by the user
>> + * @_name: String name of this *attribute*.
>> + * @_type: Firmware *attribute* type.
>> + * @_aux: Auxiliary number defined by the user.
>> + * @_ops: Pointer to &struct fwat_attr_ops.
>> + * @_props: Pointer to a enum fwat_property array.
>> + * @_num_props: Size of the @_props array.
>> + *
>> + * This is a convenience macro to quickly construct a &struct fwat_attr=
_config
>> + * array, which will be passed to &struct fwat_dev_config.
>> + *
>> + * Example:
>> + *
>> + * static int example_read(...) {...}
>> + * static int example_write(...) {...}
>> + * static int example_prop_read(...) {...}
>> + *
>> + * DEFINE_FWAT_OPS(example, ...);
>> + *
>> + * static const enum fwat_property props[] =3D {...};
>> + *
>> + * static const struct fwat_attr_config * const config[] =3D {
>> + *	FWAT_CONFIG_AUX(example, ..., n, &example_fwat_ops, props,
>> + *			ARRAY_SIZE(props)),
>> + *	...
>> + *	NULL
>> + * };
>> + *
>> + * static const struct fwat_dev_config fdev_config =3D {
>> + *	.attrs_config =3D attrs_config,
>> + *	...
>> + * }
>> + */
>> +#define FWAT_CONFIG_AUX(_name, _type, _aux, _ops, _props, _num_props) \
>> +	(&(const struct fwat_attr_config) {		\
>> +		.name =3D _name,				\
>> +		.type =3D fwat_type_##_type,		\
>> +		.aux =3D _aux,				\
>> +		.ops =3D _ops,				\
>> +		.num_props =3D _num_props,		\
>> +		.props =3D _props,			\
>> +	})
>> +
>> +/**
>> + * struct fwat_dev_config - Configuration for this devices's
>> + *                          &fwat_device.auto_groups
>> + * @attrs_config: NULL terminated &struct fwat_attr_config array.
>> + * @is_visible: Optional visibility callback to determine the visibilit=
y
>> + *              of each auto_group.
>> + */
>> +struct fwat_dev_config {
>> +	const struct fwat_attr_config *const *attrs_config;
>> +	bool (*is_visible)(struct device *dev, const struct fwat_attr_config *=
config);
>> +};
>> +
>>   struct fwat_device * __must_check
>>   fwat_device_register(struct device *parent, const char *name, void *da=
ta,
>> +		     const struct fwat_dev_config *config,
>>   		     const struct attribute_group **groups);
>>  =20
>>   void fwat_device_unregister(struct fwat_device *fwadev);
>>  =20
>>   struct fwat_device * __must_check
>>   devm_fwat_device_register(struct device *parent, const char *name, voi=
d *data,
>> +			  const struct fwat_dev_config *config,
>>   			  const struct attribute_group **groups);
>>  =20
>>   #endif /* FW_ATTR_CLASS_H */
>>=20


--95dda5cf434d0e167a653df38332fd61f57a5ae44d4c2accdffee3a46368
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaB5d9QAKCRAWYEM49J/U
Zjz3AP9h2RJlkEFYFzS+MnU7UClhLg/VgBT61RbDXOCzdQhoywEAga20RkWqnPzI
XVdMUgebtwsJP3HvQP8zBFF3lFRhhAs=
=ZbkI
-----END PGP SIGNATURE-----

--95dda5cf434d0e167a653df38332fd61f57a5ae44d4c2accdffee3a46368--
