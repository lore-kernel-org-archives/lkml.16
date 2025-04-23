Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0D72820AC;
	Wed, 23 Apr 2025 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427477; cv=none; b=kitNbR9XdCqOlooDyf6Lg3R315e2qVGzNvZgiXZ3T7IqJ8lCVT1+ryZAOmrgJUkdIZDptkQasqzaiuERWSkQaYWrwYzd7XcksWAEPZPD+5V6Brsd3a8um6wSCNINh8sVO3fTPQBG0GjSPnLuyG+1yCsbBKqs6/MxqUmKGrJgGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427477; c=relaxed/simple;
	bh=VI/0rT4b/nT7aVlwZ0WnoXG/A3PTAml6a3GO7pb7GT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEu96N6Vkk855Ke3PR5J8PMPYHYhP8f987UQtS0+a1SbUfd9eAJuMpYQZaRUdabjDTNQ+/BI4Y3cEgKVCiIHiQBOBLLyDBbWCXu0UdaVbwugKNo82mJR+ZFfQnwBLsvq60Havt1tdFmnIPQqpZxXe6MkHDijpy0W3HCRdSF0rqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V+6LOvH2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V+6LOvH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745427468;
	bh=VI/0rT4b/nT7aVlwZ0WnoXG/A3PTAml6a3GO7pb7GT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+6LOvH2G9akMLvBJqZm+t6vNNRwbZRsycMRZVLlBb77NG7+cIqHaWbrMa1560pAw
	 n3iYyb/2p6GwO0k2o1V7zf8v+Wmq0y6ixprxXkgknaCOMN180xNnAbQVJY2r8d+G1t
	 V2xSQs22Xl75/CGiHR7rTxR21A4qtHFKlFyJHuq0=
Date: Wed, 23 Apr 2025 18:57:47 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH 1/2] platform/x86: firmware_attributes_class: Provide a
 highlevel interface
Message-ID: <386c1272-774d-4f3f-ae42-a45dac285339@t-8ch.de>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-1-9d75c04a3b52@weissschuh.net>
 <D9DV2VOCWEK3.TQ96Z41CV0P4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9DV2VOCWEK3.TQ96Z41CV0P4@gmail.com>

On 2025-04-23 05:05:35-0300, Kurt Borja wrote:
> On Tue Jan 7, 2025 at 2:05 PM -03, Thomas Weißschuh wrote:
> > Currently each user of firmware_attributes_class has to manually set up
> > kobjects, devices, etc.
> > Provide a higher level API which takes care of the low-level details.
> >
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/platform/x86/firmware_attributes_class.c | 146 +++++++++++++++++++++++
> >  drivers/platform/x86/firmware_attributes_class.h |  37 ++++++
> >  2 files changed, 183 insertions(+)
> >
> > diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> > index 736e96c186d9dc6d945517f090e9af903e93bbf4..70ceae5215820098b017bfda991a3c2a7824c98e 100644
> > --- a/drivers/platform/x86/firmware_attributes_class.c
> > +++ b/drivers/platform/x86/firmware_attributes_class.c
> > @@ -2,6 +2,9 @@
> >  
> >  /* Firmware attributes class helper module */
> >  
> > +#include <linux/device/class.h>
> > +#include <linux/device.h>
> > +#include <linux/kobject.h>
> >  #include <linux/module.h>
> >  #include "firmware_attributes_class.h"
> >  
> > @@ -22,6 +25,149 @@ static __exit void fw_attributes_class_exit(void)
> >  }
> >  module_exit(fw_attributes_class_exit);
> >  
> > +static ssize_t fw_attributes_sysfs_show(struct kobject *kobj, struct attribute *attr, char *buf)
> > +{
> > +	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
> > +	const struct firmware_attribute *fw_attr = to_firmware_attribute(attr);
> > +
> > +	if (!fw_attr->show)
> > +		return -EIO;
> > +
> > +	return fw_attr->show(fwadev, fw_attr, buf);
> > +}
> > +
> > +static ssize_t fw_attributes_sysfs_store(struct kobject *kobj, struct attribute *attr,
> > +					 const char *buf, size_t count)
> > +{
> > +	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
> > +	const struct firmware_attribute *fw_attr = to_firmware_attribute(attr);
> > +
> > +	if (!fw_attr->store)
> > +		return -EIO;
> > +
> > +	return fw_attr->store(fwadev, fw_attr, buf, count);
> > +}
> > +
> > +static const struct sysfs_ops fw_attributes_sysfs_ops = {
> > +	.show	= fw_attributes_sysfs_show,
> > +	.store	= fw_attributes_sysfs_store,
> > +};
> > +
> > +static void fw_attributes_attr_release(struct kobject *kobj)
> > +{
> > +	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
> > +	struct device *cdev;
> > +
> > +	cdev = fwadev->dev;
> > +
> > +	kfree(fwadev);
> > +	device_unregister(cdev);
> > +}
> > +
> > +static const struct kobj_type fw_attributes_attr_type = {
> > +	.sysfs_ops	= &fw_attributes_sysfs_ops,
> > +	.release	= fw_attributes_attr_release,
> > +};
> > +
> > +DEFINE_FREE(firmware_attributes_device_unregister, struct firmware_attributes_device *,
> > +	    if (_T) firmware_attributes_device_unregister(_T))
> > +
> > +struct firmware_attributes_device *
> > +firmware_attributes_device_register(struct device *parent, const char *name,
> > +				    const struct attribute_group **groups, void *data)
> > +{
> > +	struct firmware_attributes_device *fwadev = NULL;
> > +	struct device *cdev = NULL;
> > +	int ret;
> > +
> > +	fwadev = kzalloc(sizeof(*fwadev), GFP_KERNEL);
> > +	if (!fwadev)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	cdev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0), "%s", name);
> > +	if (IS_ERR(cdev))
> > +		return ERR_CAST(cdev);
> > +
> > +	fwadev->data = data;
> > +	fwadev->dev = cdev;
> > +
> > +	ret = kobject_init_and_add(&fwadev->attributes, &fw_attributes_attr_type, &cdev->kobj,
> > +				   "attributes");
> > +	if (ret) {
> > +		device_del(cdev);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	if (groups) {
> > +		ret = sysfs_create_groups(&fwadev->attributes, groups);
> > +		if (ret) {
> > +			firmware_attributes_device_unregister(fwadev);
> > +			return ERR_PTR(ret);
> > +		}
> > +
> > +		kobject_uevent(&fwadev->dev->kobj, KOBJ_CHANGE);
> > +	}
> > +
> > +	return fwadev;
> > +}
> > +EXPORT_SYMBOL_GPL(firmware_attributes_device_register);
> > +
> > +void firmware_attributes_device_unregister(struct firmware_attributes_device *fwadev)
> > +{
> > +	kobject_del(&fwadev->attributes);
> > +	kobject_put(&fwadev->attributes);
> > +}
> > +EXPORT_SYMBOL_GPL(firmware_attributes_device_unregister);
> > +
> > +static void devm_firmware_attributes_device_release(void *data)
> > +{
> > +	struct firmware_attributes_device *fwadev = data;
> > +
> > +	firmware_attributes_device_unregister(fwadev);
> > +}
> > +
> > +struct firmware_attributes_device *
> > +devm_firmware_attributes_device_register(struct device *parent, const char *name,
> > +					 const struct attribute_group **groups, void *data)
> > +{
> > +	struct firmware_attributes_device *fwadev;
> > +	int ret;
> > +
> > +	fwadev = firmware_attributes_device_register(parent, name, groups, data);
> > +	if (IS_ERR(fwadev))
> > +		return fwadev;
> > +
> > +	ret = devm_add_action_or_reset(parent, devm_firmware_attributes_device_release, fwadev);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return fwadev;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_firmware_attributes_device_register);
> > +
> > +static ssize_t firmware_attributes_type_show(struct firmware_attributes_device *fwadev,
> > +					     const struct firmware_attribute *attr, char *buf)
> > +{
> > +	if (attr == &_firmware_attribute_type_string)
> > +		return sysfs_emit(buf, "string\n");
> > +	else if (attr == &_firmware_attribute_type_enumeration)
> > +		return sysfs_emit(buf, "enumeration\n");
> > +	else if (attr == &_firmware_attribute_type_integer)
> > +		return sysfs_emit(buf, "integer\n");
> > +	else
> > +		return -EIO;
> > +}
> > +
> > +#define __FW_TYPE_ATTR	__ATTR(type, 0444, firmware_attributes_type_show, NULL)
> > +
> > +const struct firmware_attribute _firmware_attribute_type_string = __FW_TYPE_ATTR;
> > +EXPORT_SYMBOL_GPL(_firmware_attribute_type_string);
> > +const struct firmware_attribute _firmware_attribute_type_enumeration = __FW_TYPE_ATTR;
> > +EXPORT_SYMBOL_GPL(_firmware_attribute_type_enumeration);
> > +const struct firmware_attribute _firmware_attribute_type_integer = __FW_TYPE_ATTR;
> > +EXPORT_SYMBOL_GPL(_firmware_attribute_type_integer);
> > +
> >  MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> > +MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
> >  MODULE_DESCRIPTION("Firmware attributes class helper module");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> > index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..66837ad9f65b8ca501dee73f48c01f2710d86bf5 100644
> > --- a/drivers/platform/x86/firmware_attributes_class.h
> > +++ b/drivers/platform/x86/firmware_attributes_class.h
> > @@ -5,8 +5,45 @@
> >  #ifndef FW_ATTR_CLASS_H
> >  #define FW_ATTR_CLASS_H
> >  
> > +#include <linux/device.h>
> >  #include <linux/device/class.h>
> > +#include <linux/sysfs.h>
> >  
> >  extern const struct class firmware_attributes_class;
> >  
> > +struct firmware_attributes_device {
> > +	struct device *dev;
> > +	struct kobject attributes;
> > +	void *data;
> > +};
> > +
> > +struct firmware_attribute {
> > +	struct attribute attr;
> > +	ssize_t (*show)(struct firmware_attributes_device *fwadev,
> > +			const struct firmware_attribute *attr, char *buf);
> > +	ssize_t (*store)(struct firmware_attributes_device *fwadev,
> > +			 const struct firmware_attribute *attr, const char *buf, size_t count);
> > +};
> > +
> > +#define to_firmware_attribute(_a) container_of_const(_a, struct firmware_attribute, attr)
> > +#define to_firmware_attribute_device(_s) \
> > +	container_of_const(_s, struct firmware_attributes_device, attributes)
> > +
> > +extern const struct firmware_attribute _firmware_attribute_type_string;
> > +#define firmware_attribute_type_string ((struct attribute *)&_firmware_attribute_type_string.attr)
> > +extern const struct firmware_attribute _firmware_attribute_type_enumeration;
> > +#define firmware_attribute_type_enumeration ((struct attribute *)&_firmware_attribute_type_enumeration.attr)
> > +extern const struct firmware_attribute _firmware_attribute_type_integer;
> > +#define firmware_attribute_type_integer ((struct attribute *)&_firmware_attribute_type_integer.attr)
> > +
> > +struct firmware_attributes_device * __must_check
> > +firmware_attributes_device_register(struct device *parent, const char *name,
> > +				    const struct attribute_group **groups, void *data);
> > +
> > +void firmware_attributes_device_unregister(struct firmware_attributes_device *fwadev);
> > +
> > +struct firmware_attributes_device * __must_check
> > +devm_firmware_attributes_device_register(struct device *parent, const char *name,
> > +					 const struct attribute_group **groups, void *data);
> > +
> >  #endif /* FW_ATTR_CLASS_H */
> 
> Hi Thomas,

Hi Kurt,

> Are you still working on this patchset?

I did some more work on this patchset, adding higher-level
functionality. But so far I was not satisfied with the result.

> If you don't mind I can take it from here. I'm planning on fixing a
> couple memory leaks of this patch and extend it a bit more with some
> helper macros for ABI compliant drivers. I might drop the test driver
> though.

You're welcome to take over.
 
> I ask this because I want to use this class in another series I'm
> to do, and I think this patch is a great starting point.

Nice to hear :-)

> Let me know what you think!

Please go ahead!


Thomas
