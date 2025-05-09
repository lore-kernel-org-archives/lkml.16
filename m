Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936C2367BB;
	Fri,  9 May 2025 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806385; cv=none; b=S4wapvAS85gWrMgJV+401yL6Hdx7jOygM63jXdOBhtzgplFWdML9gE+lUtf3QfVEkPIhU/9iv24pnq0Bapa3HGbciEg8VoJeg1yP/4exB10Fgo27bgs1bYihzQvPHsq/G+Ua9dn1S+DUiJiMChYfpJgv2y+LrHMKVgmUXoZ8GAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806385; c=relaxed/simple;
	bh=9DlzSx8QMm27dtWqYI6REOjt9N0R9jD4zaWWUdJN1i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jl5BpyVMPtEuaBmmNEGpkYmNVc/b/rSUXQEU2YJ198Us9UkzqfXAuumkXHZic1kSfDZMGx4a8aloxMIiDbFmExzkFog4NKc4e5JUbZhbddXRqKyYEGNXENfH/wqpw+NWvprXKPzxnXEMZECZ1Hyc3Kq7CdsuJchmEAI4R7qX8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdcMPo6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdcMPo6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB4FC4CEE4;
	Fri,  9 May 2025 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806385;
	bh=9DlzSx8QMm27dtWqYI6REOjt9N0R9jD4zaWWUdJN1i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EdcMPo6JjEe+4DHAvKWIH8ZEIFFjFwW2qtcO1FnOoN3HCaduj33BHJ1ew37EIrlPj
	 Scnom6jsDPekAhY9gCOzqdPt0v0INs2Wi4xY9E16TUPsONhiYitmnc/tlWAVWXXmKp
	 0uiQ6L7pnAFXoNIjjKpfceXfyG1lQSDi3IwtRbjwwhJN1ekIyRMyvxtSChDpXUnB2u
	 J66a5QSX2sJDV/QtrpbtAYIi1wOIsD5NbRf7jy0xVhMPGvmWTsEl8e8E93C9dYE9q3
	 cfUU+PTqQv4wLqJ5Mb++iGnVFQM4SAFk5oO+FQ+dSJJim/eXtdJxQ60GXlaDiJzpC3
	 0rja7JrjwPvRg==
Message-ID: <907d0022-0512-4a60-9d57-26b48c986df0@kernel.org>
Date: Fri, 9 May 2025 10:59:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] platform/x86: firmware_attributes_class: Add
 device initialization methods
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-1-258afed65bfa@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250509-fw-attrs-api-v1-1-258afed65bfa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/2025 2:48 AM, Kurt Borja wrote:
> From: Thomas Weißschuh <linux@weissschuh.net>
> 
> Currently each user of firmware_attributes_class has to manually set up
> kobjects, devices, etc.
> 
> Provide this infrastructure out-of-the-box through the newly introduced
> fwat_device_register().
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Co-developed-by: Kurt Borja <kuurtb@gmail.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/firmware_attributes_class.c | 165 +++++++++++++++++++++++
>   drivers/platform/x86/firmware_attributes_class.h |  44 ++++++
>   2 files changed, 209 insertions(+)
> 
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index 736e96c186d9dc6d945517f090e9af903e93bbf4..58ab1495ba3bd449cfe17de2827a57a0c5937788 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -2,7 +2,12 @@
>   
>   /* Firmware attributes class helper module */
>   
> +#include <linux/device.h>
> +#include <linux/device/class.h>
> +#include <linux/kobject.h>
>   #include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
>   #include "firmware_attributes_class.h"
>   
>   const struct class firmware_attributes_class = {
> @@ -10,6 +15,164 @@ const struct class firmware_attributes_class = {
>   };
>   EXPORT_SYMBOL_GPL(firmware_attributes_class);
>   
> +static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
> +				    char *buf)
> +{
> +	const struct fwat_attribute *fattr = to_fwat_attribute(attr);
> +	struct fwat_device *fadev = to_fwat_device(kobj);
> +
> +	if (!fattr->show)
> +		return -ENOENT;
> +
> +	return fattr->show(fadev->dev, fattr, buf);
> +}
> +
> +static ssize_t fwat_attrs_kobj_store(struct kobject *kobj, struct attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	const struct fwat_attribute *fattr = to_fwat_attribute(attr);
> +	struct fwat_device *fadev = to_fwat_device(kobj);
> +
> +	if (!fattr->store)
> +		return -ENOENT;
> +
> +	return fattr->store(fadev->dev, fattr, buf, count);
> +}
> +
> +static const struct sysfs_ops fwat_attrs_kobj_ops = {
> +	.show	= fwat_attrs_kobj_show,
> +	.store	= fwat_attrs_kobj_store,
> +};
> +
> +static void fwat_attrs_kobj_release(struct kobject *kobj)
> +{
> +	struct fwat_device *fadev = to_fwat_device(kobj);
> +
> +	kfree(fadev);
> +}
> +
> +static const struct kobj_type fwat_attrs_ktype = {
> +	.sysfs_ops	= &fwat_attrs_kobj_ops,
> +	.release	= fwat_attrs_kobj_release,
> +};
> +
> +/**
> + * fwat_device_register - Create and register a firmware-attributes class
> + *			  device
> + * @parent: Parent device
> + * @name: Name of the class device
> + * @data: Drvdata of the class device
> + * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
> + *
> + * NOTE: @groups are attached to the .attrs_kobj of the new fwat_device which
> + * has a custom ktype, which makes use of `struct fwat_attribute` to embed
> + * attributes.
> + *
> + * Return: pointer to the new fwat_device on success, ERR_PTR on failure
> + */
> +struct fwat_device *
> +fwat_device_register(struct device *parent, const char *name, void *data,
> +		     const struct attribute_group **groups)
> +{
> +	struct fwat_device *fadev;
> +	struct device *dev;
> +	int ret;
> +
> +	if (!parent || !name)
> +		return ERR_PTR(-EINVAL);
> +
> +	fadev = kzalloc(sizeof(*fadev), GFP_KERNEL);
> +	if (!fadev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0),
> +			    data, "%s", name);
> +	if (IS_ERR(dev)) {
> +		kfree(fadev);
> +		return ERR_CAST(dev);
> +	}
> +
> +	ret = kobject_init_and_add(&fadev->attrs_kobj, &fwat_attrs_ktype, &dev->kobj,
> +				   "attributes");
> +	if (ret)
> +		goto out_kobj_put;
> +
> +	if (groups) {
> +		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
> +		if (ret)
> +			goto out_kobj_unregister;
> +	}
> +
> +	fadev->dev = dev;
> +	fadev->groups = groups;
> +
> +	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
> +
> +	return fadev;
> +
> +out_kobj_unregister:
> +	kobject_del(&fadev->attrs_kobj);
> +
> +out_kobj_put:
> +	kobject_put(&fadev->attrs_kobj);
> +	device_unregister(dev);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(fwat_device_register);
> +
> +void fwat_device_unregister(struct fwat_device *fwadev)
> +{
> +	if (fwadev->groups)
> +		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
> +	kobject_del(&fwadev->attrs_kobj);
> +	kobject_put(&fwadev->attrs_kobj);
> +	device_unregister(fwadev->dev);
> +}
> +EXPORT_SYMBOL_GPL(fwat_device_unregister);
> +
> +static void devm_fwat_device_release(void *data)
> +{
> +	struct fwat_device *fadev = data;
> +
> +	fwat_device_unregister(fadev);
> +}
> +
> +/**
> + * devm_fwat_device_register - Create and register a firmware-attributes class
> + *			       device
> + * @parent: Parent device
> + * @name: Name of the class device
> + * @data: Drvdata of the class device
> + * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
> + *
> + * Device managed version of fwat_device_register().
> + *
> + * NOTE: @groups are attached to the .attrs_kobj of the new fwat_device which
> + * has a custom ktype, which makes use of `struct fwat_attribute` to embed
> + * attributes.
> + *
> + * Return: pointer to the new fwat_device on success, ERR_PTR on failure
> + */
> +struct fwat_device *
> +devm_fwat_device_register(struct device *parent, const char *name, void *data,
> +			  const struct attribute_group **groups)
> +{
> +	struct fwat_device *fadev;
> +	int ret;
> +
> +	fadev = fwat_device_register(parent, name, data, groups);
> +	if (IS_ERR(fadev))
> +		return fadev;
> +
> +	ret = devm_add_action_or_reset(parent, devm_fwat_device_release, fadev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return fadev;
> +}
> +EXPORT_SYMBOL_GPL(devm_fwat_device_register);
> +
>   static __init int fw_attributes_class_init(void)
>   {
>   	return class_register(&firmware_attributes_class);
> @@ -23,5 +186,7 @@ static __exit void fw_attributes_class_exit(void)
>   module_exit(fw_attributes_class_exit);
>   
>   MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>   MODULE_DESCRIPTION("Firmware attributes class helper module");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..ad94bf91e5af30a2b8feb9abf224ee6f0d17600a 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -5,8 +5,52 @@
>   #ifndef FW_ATTR_CLASS_H
>   #define FW_ATTR_CLASS_H
>   
> +#include <linux/container_of.h>
> +#include <linux/device.h>
>   #include <linux/device/class.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
>   
>   extern const struct class firmware_attributes_class;
>   
> +/**
> + * struct fwat_device - The firmware-attributes device
> + * @dev: The class device.
> + * @attrs_kobj: The "attributes" root kobject.
> + * @groups: Sysfs groups attached to the @attrs_kobj.
> + */
> +struct fwat_device {
> +	struct device *dev;
> +	struct kobject attrs_kobj;
> +	const struct attribute_group **groups;
> +};
> +
> +#define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
> +
> +/**
> + * struct fwat_attribute - The firmware-attributes's custom attribute
> + * @attr: Embedded struct attribute.
> + * @show: Show method called by the "attributes" kobject's ktype.
> + * @store: Store method called by the "attributes" kobject's ktype.
> + */
> +struct fwat_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
> +			char *buf);
> +	ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
> +			 const char *buf, size_t count);
> +};
> +
> +#define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
> +
> +struct fwat_device * __must_check
> +fwat_device_register(struct device *parent, const char *name, void *data,
> +		     const struct attribute_group **groups);
> +
> +void fwat_device_unregister(struct fwat_device *fwadev);
> +
> +struct fwat_device * __must_check
> +devm_fwat_device_register(struct device *parent, const char *name, void *data,
> +			  const struct attribute_group **groups);
> +
>   #endif /* FW_ATTR_CLASS_H */
> 

