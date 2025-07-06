Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C419882B;
	Sun,  6 Jul 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787663; cv=none; b=okO/8fu3JFEXJ0VenU2RDoc1K2pLeScb+znnr+IbqHBRp+16oo6tIdhYE9iwXJZObQ+P1ePsD/MrmrH8Bia5LcqL9MoKED5MDc867EoZaNBt4ZRetgZxvWXpDzZvgkD5ZaDIBI2EXQ6v6h6ruIDydkUFXnCj2lfd6Rp1/Ta4I/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787663; c=relaxed/simple;
	bh=HqbqUEph0mSm8S6PoWwX5rmc1oMqWaIcAqfLokJYd6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzsAqeI0PLkxCWYGOlgCQuWK54t3FFDcrthmWGsS3hqhmlFNl1qWeiZI5DbJwPtNMF97cqqOBlM1suQTAmhxMjKCTSAwaFgdlCBJFOA1FVSUSOksx2634ZONnceP009hEFElyD3UmOF/0GjPPuFiHQJCu9Cv2mrf/oTbX5l7Lck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PJQS0fT5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PJQS0fT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751787658;
	bh=HqbqUEph0mSm8S6PoWwX5rmc1oMqWaIcAqfLokJYd6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJQS0fT5TeFZ0W0Wb4/v5sBIh0HeFvOUykyyAsF6v49oX1nYw6zyZc8BJeqI2g3vU
	 6BFNMX6CwpgaYPCYwYaaDSQ5/dIkhAW7Sd98Uc5MX5D0zdjo7x7bEUTQRZPWhbJ3He
	 +OGQLcU5Xgx2zdcAJnTDiYQhXCby4y5EtuGwRhX4=
Date: Sun, 6 Jul 2025 09:40:58 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH v5 2/6] platform/x86: firmware_attributes_class: Add high
 level API for the attributes interface
Message-ID: <e628de77-e8b0-4eed-b4df-f8b5ac609f0d@t-8ch.de>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-fw-attrs-api-v5-2-60b6d51d93eb@gmail.com>

On 2025-07-05 00:33:57-0300, Kurt Borja wrote:
> Add high level API to aid in the creation of attribute groups attached
> to the `attrs_kobj` (per ABI specification).
> 
> This new API lets users configure each group, either statically or
> dynamically through a (per type) data struct and then create this group
> through the generic fwat_create_group() macro.

How does this deal with non-standard types and non-standard attribute
"subattributes"?

Did you compare the code sizes of the framework and using drivers before
and after? It looks like it will grow quite a bit.

> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/firmware_attributes_class.c | 532 +++++++++++++++++++++++
>  drivers/platform/x86/firmware_attributes_class.h | 335 ++++++++++++++
>  2 files changed, 867 insertions(+)
> 
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index 290364202cce64bb0e9046e0b2bbb8d85e2cbc6f..96473b3b1a2a87cf21a6e2a9a14d72ae322c94ae 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -10,13 +10,67 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/string_choices.h>
>  #include "firmware_attributes_class.h"
>  
> +#define FWAT_TYPE_NONE				-1

Braces around '-1'.

One the other hand this define is only used in two places and the value
does not matter and is only passed because the macros expect something.
Maybe move the definition to where it is used and do:

__FWAT_TYPE_NONE (-1) /* dummy value, never evaluated */

> +
> +#define to_fwat_bool_data(_c) \
> +	container_of_const(_c, struct fwat_bool_data, group)
> +#define to_fwat_enum_data(_c) \
> +	container_of_const(_c, struct fwat_enum_data, group)
> +#define to_fwat_int_data(_c) \
> +	container_of_const(_c, struct fwat_int_data, group)
> +#define to_fwat_str_data(_c) \
> +	container_of_const(_c, struct fwat_str_data, group)
> +
> +struct fwat_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct kobject *kobj, struct fwat_attribute *attr,

Please make the 'struct fwat_attribute *' argument const.
Somebody (me) is currently working on constifying 'struct attribute'.

> +			char *buf);
> +	ssize_t (*store)(struct kobject *kobj, struct fwat_attribute *attr,
> +			 const char *buf, size_t count);
> +	int type;
> +};
> +
> +#define to_fwat_attribute(_a) \
> +	container_of_const(_a, struct fwat_attribute, attr)
> +
> +#define __FWAT_ATTR(_name, _mode, _show, _store, _type) \
> +	{								\

Move the opening brace to the line above.

> +		.attr = { .name = __stringify(_name), .mode = _mode },	\
> +		.show = _show, .store = _store, .type = _type,		\
> +	}
> +

<snip>

> +static ssize_t
> +enum_group_show(struct kobject *kobj, struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_enum_data *data = to_fwat_enum_data(group->data);
> +	int val_idx, sz = 0;
> +	int ret;
> +
> +	/* show_override does not affect current_value */
> +	if (data->group.show_override && attr->type != fwat_enum_current_value)
> +		return data->group.show_override(group->dev, attr->type, buf);
> +
> +	switch (attr->type) {
> +	case fwat_enum_current_value:
> +		ret = data->read(group->dev, data->group.id, &val_idx);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case fwat_enum_default_value:
> +		val_idx = data->default_idx;
> +		break;
> +	case fwat_enum_possible_values:
> +		sz += sysfs_emit_at(buf, sz, "%s", data->possible_vals[0]);

Slightly easier to read if the line above is:

	sz = sysfs_emit_at(buf, 0, "%s", data->possible_vals[0]);

And drop the initialization of sz.


> +		for (unsigned int i = 1; data->possible_vals[i]; i++)
> +			sz += sysfs_emit_at(buf, sz, ";%s", data->possible_vals[i]);
> +		sz += sysfs_emit_at(buf, sz, "\n");
> +		return sz;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", data->possible_vals[val_idx]);
> +}

<snip>

> +static umode_t fwat_attr_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	struct fwat_attribute *fwat_attr = to_fwat_attribute(attr);

const

> +	struct fwat_group *group = kobj_to_fwat_group(kobj);
> +	const struct fwat_group_data *data = group->data;
> +
> +	/* The `type` attribute is always first */
> +	if (n == 0)
> +		return attr->mode;
> +
> +	if (attr == &fwat_all_display_name_attr.attr)
> +		return data->display_name ? attr->mode : 0;
> +
> +	if (attr == &fwat_all_display_name_language_code_attr.attr)
> +		return data->language_code ? attr->mode : 0;
> +
> +	/* The `current_value` attribute always has type == 0 */
> +	if (!fwat_attr->type)
> +		return data->mode;
> +
> +	return test_bit(fwat_attr->type, &data->fattrs) ? attr->mode : 0;
> +}
> +
> +static umode_t fwat_group_visible(struct kobject *kobj)
> +{
> +	return true;
> +}
> +
> +DEFINE_SYSFS_GROUP_VISIBLE(fwat);

Why DEFINE_SYSFS_GROUP_VISIBLE() if the per-group callback doesn't do
anything?

> +
> +static const struct attribute_group fwat_bool_group = {
> +	.attrs = fwat_bool_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fwat),
> +};
> +__ATTRIBUTE_GROUPS(fwat_bool);

<snip>

>  /**
>   * fwat_device_register - Create and register a firmware-attributes class
>   *			  device
> @@ -89,6 +620,7 @@ void fwat_device_unregister(struct fwat_device *fadev)
>  	if (!fadev)
>  		return;
>  
> +	fwat_remove_auto_groups(fadev);

As before, the groups are children of the device so should be removed
automatically.

>  	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
>  	kset_unregister(fadev->attrs_kset);
>  	device_unregister(&fadev->dev);
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> index 048fd0904f767357ef856e687ec4cf3260016ec6..e8868ce05b595eda94a98975428391b9f9341e3d 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -10,6 +10,7 @@
>  #include <linux/device/class.h>
>  #include <linux/kobject.h>
>  #include <linux/sysfs.h>
> +#include <linux/list.h>

Unnecessary for public header.

>  
>  extern const struct class firmware_attributes_class;
>  
> @@ -27,6 +28,340 @@ struct fwat_device {
>  
>  #define to_fwat_device(_d)	container_of_const(_d, struct fwat_device, dev)
>  
> +enum fwat_group_type {
> +	fwat_group_boolean,

I have a slight preference for "fwat_group_type_boolean".

> +	fwat_group_enumeration,
> +	fwat_group_integer,
> +	fwat_group_string,
> +};
> +
> +enum fwat_bool_attrs {
> +	fwat_bool_current_value,
> +	fwat_bool_default_value,
> +	fwat_bool_attrs_last
> +};
> +
> +#define FWAT_BOOL_CURRENT_VALUE			BIT(fwat_bool_current_value)
> +#define FWAT_BOOL_DEFAULT_VALUE			BIT(fwat_bool_default_value)
> +#define FWAT_BOOL_ALL_ATTRS			GENMASK(fwat_bool_attrs_last, 0)

Is the ALL_ATTRS really necessary? It could lead to issues when new
optional attributes are added to the core.

> +
> +enum fwat_enum_attrs {
> +	fwat_enum_current_value,
> +	fwat_enum_default_value,
> +	fwat_enum_possible_values,
> +	fwat_enum_attrs_last
> +};
> +
> +#define FWAT_ENUM_CURRENT_VALUE			BIT(fwat_enum_current_value)
> +#define FWAT_ENUM_DEFAULT_VALUE			BIT(fwat_enum_default_value)
> +#define FWAT_ENUM_POSSIBLE_VALUES		BIT(fwat_enum_possible_values)
> +#define FWAT_ENUM_ALL_ATTRS			GENMASK(fwat_enum_attrs_last, 0)
> +
> +enum fwat_int_attrs {
> +	fwat_int_current_value,
> +	fwat_int_default_value,
> +	fwat_int_min_value,
> +	fwat_int_max_value,
> +	fwat_int_scalar_increment,
> +	fwat_int_attrs_last
> +};
> +
> +#define FWAT_INT_CURRENT_VALUE			BIT(fwat_int_current_value)
> +#define FWAT_INT_DEFAULT_VALUE			BIT(fwat_int_default_value)
> +#define FWAT_INT_MIN_VALUE			BIT(fwat_int_min_value)
> +#define FWAT_INT_MAX_VALUE			BIT(fwat_int_max_value)
> +#define FWAT_INT_SCALAR_INCREMENT		BIT(fwat_int_scalar_increment)
> +#define FWAT_INT_ALL_ATTRS			GENMASK(fwat_int_attrs_last, 0)
> +
> +enum fwat_str_attrs {
> +	fwat_str_current_value,
> +	fwat_str_default_value,
> +	fwat_str_min_length,
> +	fwat_str_max_length,
> +	fwat_str_attrs_last
> +};
> +
> +#define FWAT_STR_CURRENT_VALUE			BIT(fwat_str_current_value)
> +#define FWAT_STR_DEFAULT_VALUE			BIT(fwat_str_default_value)
> +#define FWAT_STR_MIN_LENGTH			BIT(fwat_str_min_length)
> +#define FWAT_STR_MAX_LENGTH			BIT(fwat_str_max_length)
> +#define FWAT_STR_ALL_ATTRS			GENMASK(fwat_str_attrs_last, 0)
> +
> +static_assert(fwat_bool_current_value == 0);
> +static_assert(fwat_enum_current_value == 0);
> +static_assert(fwat_int_current_value == 0);
> +static_assert(fwat_str_current_value == 0);

Move this into the the .c file right next to the code relying on this
invariant.

<snip>

> +/**
> + * DEFINE_FWAT_ENUM_GROUP - Convenience macro to quickly define an static
> + *                          struct fwat_enum_data instance
> + * @_name: Name of the group.
> + * @_disp_name: Name showed in the display_name attribute. (Optional)
> + * @_def_idx: Index of the default value in the @_poss_vals array.
> + * @_poss_vals: Array of possible value strings for this group type.
> + * @_mode: Mode for the current_value attribute. All other attributes will have
> + *         0444 permissions.
> + * @_fattrs: Bitmap of selected attributes for this group type.
> + *
> + * `read` and `write` callbacks are required to be already defined as
> + * `_name##_read` and `_name##_write` respectively.
> + *
> + * NOTE: The `val_idx` argument in the `write` callback is guaranteed to be a
> + *       valid (within bounds) index. However, the user is in charge of writing
> + *       valid indexes to the `*val_idx` argument of the `read` callback.
> + *       Failing to do so may result in an OOB access.
> + */
> +#define DEFINE_FWAT_ENUM_GROUP(_name, _disp_name, _poss_vals, _def_idx, _mode, _fattrs) \
> +	static const struct fwat_enum_data _name##_group_data = {	\

Align all backslashes of the definition.

> +		.read = _name##_read,					\
> +		.write = _name##_write,					\
> +		.default_idx = _def_idx,				\
> +		.possible_vals = _poss_vals,				\
> +		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
> +	}

<snip>

> +int fwat_create_bool_group(struct fwat_device *fadev,
> +			   const struct fwat_bool_data *data);
> +int fwat_create_enum_group(struct fwat_device *fadev,
> +			   const struct fwat_enum_data *data);
> +int fwat_create_int_group(struct fwat_device *fadev,
> +			  const struct fwat_int_data *data);
> +int fwat_create_str_group(struct fwat_device *fadev,
> +			  const struct fwat_str_data *data);

If these are not meant to be used by users, give them a leading
underscore?

> +
> +/**
> + * fwat_create_group - Convenience generic macro to create a group
> + * @_dev: fwat_device
> + * @_data: One of fwat_{bool,enum,int,str}_data instance
> + *
> + * This macro (and associated functions) creates a sysfs group under the
> + * 'attributes' directory, which is located in the class device root directory.
> + *
> + * See Documentation/ABI/testing/sysfs-class-firmware-attributes for details.
> + *
> + * The @_data associated with this group may be created either statically,
> + * through DEFINE_FWAT_*_GROUP macros or dynamically, in which case the user
> + * would have allocate and fill the struct manually. The dynamic approach should
> + * be preferred when group constraints and/or visibility is decided dynamically.

I'd prefer if users don't need dynamic data allocations if possible.
Let's see how it works out with the existing drivers.

> + *
> + * Example:
> + *
> + * static int stat_read(...){...};
> + * static int stat_write(...){...};
> + *
> + * DEFINE_FWAT_(BOOL|ENUM|INT|STR)_GROUP(stat, ...);
> + *
> + * static int create_groups(struct fwat_device *fadev)
> + * {
> + *	struct fwat_enum_data *dyn_group_data;
> + *
> + *	dyn_group_data = kzalloc(...);
> + *	// Fill the data
> + *	...
> + *	fwat_create_group(fadev, &stat_group_data);
> + *	fwat_create_group(fadev, &dyn_group_data);
> + *	fwat_create_group(...);
> + *	...
> + * }
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +#define fwat_create_group(_dev, _data) \
> +	_Generic((_data),							\
> +		 const struct fwat_bool_data * : fwat_create_bool_group,	\
> +		 const struct fwat_enum_data * : fwat_create_enum_group,	\
> +		 const struct fwat_int_data * : fwat_create_int_group,		\
> +		 const struct fwat_str_data * : fwat_create_str_group)		\
> +		(_dev, _data)
> +
>  struct fwat_device * __must_check
>  fwat_device_register(struct device *parent, const char *name, void *drvdata,
>  		     const struct attribute_group **groups);
> 
> -- 
> 2.50.0
> 
