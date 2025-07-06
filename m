Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA325145355;
	Sun,  6 Jul 2025 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751784135; cv=none; b=Vtvy964QW4c5DnBFpnJ3xAieVlcDzGmFM35L61yfs9bYZvIG2x5QoGmGf/4anf8Tu1Pg3gU6MvcHhFdT1aB//0fpV2KkXOvjq2mBn8n1Wl235wYa8Yx9SjamfTgoMD2RKPFYQuamv3Sjpg3yZj7s7pp8lkjlo8YTidhZvV5G1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751784135; c=relaxed/simple;
	bh=JGoxqYa/JFYXWNg4+wRryNCN34sjiJyC14fsFDCLigY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUzpBHwknqFO+cE/YpRAtF+8SFW1OKjxQmChM/qIk2uHukfEzu6g60U4Ze0nGDo/1HyJv0kq9L+l1HICVq8AhnP3G+7g1pDoBNcDCBgrDbm8SLoQAnuHFYMwwNFDcdWzRdVkfn0Oa8Xefb6MhCnslzgpG9wUJ/SL9vZ/G4sLOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qX9sm5mf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qX9sm5mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751784122;
	bh=JGoxqYa/JFYXWNg4+wRryNCN34sjiJyC14fsFDCLigY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qX9sm5mf1rD1MJgH2vLM7Aq3UdgMmmZenxbCuFuGPZh8OPoGTJELAZ9TAeUd7t393
	 t1d4EwgIZEsmRVIONCA7E2D7J0PmDtyLMr8QyAma9f+aUtvCXkgaLajDioKR005vyc
	 jWnLzB062gjLObX1FC41SpFTTyfN/ZClqsVdQX5I=
Date: Sun, 6 Jul 2025 08:42:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH v5 1/6] platform/x86: firmware_attributes_class: Add
 device initialization methods
Message-ID: <05563b0c-861f-4046-9d50-87296d1bf6a2@t-8ch.de>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-1-60b6d51d93eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250705-fw-attrs-api-v5-1-60b6d51d93eb@gmail.com>

On 2025-07-05 00:33:56-0300, Kurt Borja wrote:
> From: Thomas Weißschuh <linux@weissschuh.net>
> 
> Currently each user of firmware_attributes_class has to manually set up
> kobjects, devices, etc.
> 
> Provide this infrastructure out-of-the-box through the newly introduced
> fwat_device_register().
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Co-developed-by: Kurt Borja <kuurtb@gmail.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/firmware_attributes_class.c | 125 +++++++++++++++++++++++
>  drivers/platform/x86/firmware_attributes_class.h |  28 +++++
>  2 files changed, 153 insertions(+)
> 
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index 736e96c186d9dc6d945517f090e9af903e93bbf4..290364202cce64bb0e9046e0b2bbb8d85e2cbc6f 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -2,7 +2,14 @@
>  
>  /* Firmware attributes class helper module */
>  
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/device/class.h>
> +#include <linux/kdev_t.h>
> +#include <linux/kobject.h>
>  #include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
>  #include "firmware_attributes_class.h"
>  
>  const struct class firmware_attributes_class = {
> @@ -10,6 +17,122 @@ const struct class firmware_attributes_class = {
>  };
>  EXPORT_SYMBOL_GPL(firmware_attributes_class);
>  
> +static void fwat_device_release(struct device *dev)
> +{
> +	struct fwat_device *fadev = to_fwat_device(dev);
> +
> +	kfree(fadev);
> +}
> +
> +/**
> + * fwat_device_register - Create and register a firmware-attributes class
> + *			  device
> + * @parent: Parent device
> + * @name: Name of the class device
> + * @drvdata: Drvdata of the class device
> + * @groups: Extra groups for the "attributes" directory
> + *
> + * Return: pointer to the new fwat_device on success, ERR_PTR on failure
> + */
> +struct fwat_device *
> +fwat_device_register(struct device *parent, const char *name, void *drvdata,
> +		     const struct attribute_group **groups)
> +{
> +	struct fwat_device *fadev;
> +	int ret;
> +
> +	if (!parent || !name)
> +		return ERR_PTR(-EINVAL);
> +
> +	fadev = kzalloc(sizeof(*fadev), GFP_KERNEL);
> +	if (!fadev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fadev->groups = groups;
> +	fadev->dev.class = &firmware_attributes_class;
> +	fadev->dev.parent = parent;
> +	fadev->dev.release = fwat_device_release;
> +	dev_set_drvdata(&fadev->dev, drvdata);
> +	ret = dev_set_name(&fadev->dev, "%s", name);
> +	if (ret) {
> +		kfree(fadev);
> +		return ERR_PTR(ret);
> +	}
> +	ret = device_register(&fadev->dev);
> +	if (ret)
> +		return ERR_PTR(ret);

I think we need a put_device() here.

> +
> +	fadev->attrs_kset = kset_create_and_add("attributes", NULL, &fadev->dev.kobj);
> +	if (!fadev->attrs_kset) {
> +		ret = -ENOMEM;
> +		goto out_device_unregister;
> +	}
> +
> +	ret = sysfs_create_groups(&fadev->attrs_kset->kobj, groups);
> +	if (ret)
> +		goto out_kset_unregister;

It would be nicer for userspace to add the device to the hierarchy
only when it is set up fully.
Replacing device_register() with a device_initialize() above and
device_add() down here.

> +
> +	return fadev;
> +
> +out_kset_unregister:
> +	kset_unregister(fadev->attrs_kset);

I *think* the driver core should clean up any child objects
automatically, so this is unnecessary.

> +
> +out_device_unregister:
> +	device_unregister(&fadev->dev);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(fwat_device_register);
> +
> +void fwat_device_unregister(struct fwat_device *fadev)
> +{
> +	if (!fadev)
> +		return;
> +
> +	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
> +	kset_unregister(fadev->attrs_kset);

The also the two lines above would be unnecessary.

> +	device_unregister(&fadev->dev);
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
> + * @groups: Extra groups for the class device (Optional)
> + *
> + * Device managed version of fwat_device_register().
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

... and also all of the devm stuff.

> +
>  static __init int fw_attributes_class_init(void)
>  {
>  	return class_register(&firmware_attributes_class);
> @@ -23,5 +146,7 @@ static __exit void fw_attributes_class_exit(void)
>  module_exit(fw_attributes_class_exit);
>  
>  MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>  MODULE_DESCRIPTION("Firmware attributes class helper module");
>  MODULE_LICENSE("GPL");

<snip>
