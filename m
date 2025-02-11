Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8B26BD95;
	Tue, 11 Feb 2025 02:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242192; cv=none; b=GI5joJkfI1Ddvup9bMI/yvZHU3BaxSum9V7qHvlpJA8t5xKOOBNNRJEY1SPB+hfyJuAhnOJa75oNu3Ee+pVsXRu6+RxaCpR3mIH/32kzyD4PgjpWScmTWznAZt5xA4rpSOkE3g8H3wotSx7arcxpYDQZvmPWR3g3gcK1TWZMSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242192; c=relaxed/simple;
	bh=kjJ8O4tjXQdhjj4nFQFkKD2H0A1/8yzdtEHORG1EByA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=akThEQSN6kABMtL76udaSj0nR1+0BddXGZP4zrSC7E3HQAwDJrLGUi/svfC1agt3Ch1MnH100TYEZoZdss6WPG2WnzHVzT727j5x26/bnjtnlBMlmkeFuKWBZw61s32ozVWechvT4M63j6bGV+2EgcyWt83WbewnKK5/0xEkXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xwp3MVVJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xwp3MVVJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B0gRmH031929;
	Tue, 11 Feb 2025 02:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXNbroVvY4hK2pw57Tv9WyrWjbClpwK8hwkZLx6r5PA=; b=Xwp3MVVJzIlbPmZP
	JtTLeaQ/IjQ8RMeQKp+Ev3IVPORTRjmOJVagD+lKcJzJPmM+1hI+qwsL0dpJx6dy
	YXOGecsWvh4W09/eHKbn6uEPy4a1h0XkSiwZX5sw3/Nn97O5C23XNyF5ptWOpIB4
	kqAouaumFiTSWpdLNE0UMemwvOCiHveS1+dRh3GvVipVGQzVV12sHjkD4UCCgJh1
	SFxhUc91pl+Pkhd6yTL5hBMwcTalUQfk9ZMXHU10YLH1e3RLN9SXBeyEvvj7Let/
	k1JVIo7xej1CFgB6vFdfMfmhzqgVTytz5tcE4dgDiDOxKl+e5pePBj8D2JRWVA8G
	5y+Ykw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk23ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:49:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B2nBLZ023148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:49:11 GMT
Received: from [10.133.33.10] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 18:49:07 -0800
Message-ID: <d2cf17f5-cb4f-4b06-b55b-2c7fe9607f01@quicinc.com>
Date: Tue, 11 Feb 2025 10:49:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a simple
 device/bus is needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
        "Rafael J.
 Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
        Mark Brown
	<broonie@kernel.org>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Simona Vetter <simona.vetter@ffwll.ch>, <linux-usb@vger.kernel.org>,
        <rust-for-linux@vger.kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <2025021026-atlantic-gibberish-3f0c@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GadvhTCLW0IX4yzSVhGl7SMrbX8eMBKY
X-Proofpoint-ORIG-GUID: GadvhTCLW0IX4yzSVhGl7SMrbX8eMBKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110014

On 2/10/2025 8:30 PM, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v4: - really removed the name logic
>     - added #include <linux/container_of.h> to faux.h
>     - added parent pointer to api call
>     - minor documentation updates
>     - made probe synchronous
> v3: - loads of documentation updates and rewrites
>     - added to the documentation build
>     - removed name[] array as it's no longer needed
>     - added faux_device_create_with_groups()
>     - added functions to get/set devdata
>     - renamed faux_driver_ops -> faux_device_ops
>     - made faux_device_ops a const *
>     - minor cleanups
>     - tested it, again.
> 
> v2: - renamed bus and root device to just "faux" thanks to Thomas
>     - removed the one-driver-per-device and now just have one driver
>       entirely thanks to Danilo
>     - kerneldoc fixups and additions and string handling bounds checks
>       thanks to Andy
>     - coding style fix thanks to Jonathan
>     - tested that the destroy path actually works
>  Documentation/driver-api/infrastructure.rst |   6 +
>  drivers/base/Makefile                       |   2 +-
>  drivers/base/base.h                         |   1 +
>  drivers/base/faux.c                         | 232 ++++++++++++++++++++
>  drivers/base/init.c                         |   1 +
>  include/linux/device/faux.h                 |  69 ++++++
>  6 files changed, 310 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h
> 
> diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
> index 3d52dfdfa9fd..35e36fee4238 100644
> --- a/Documentation/driver-api/infrastructure.rst
> +++ b/Documentation/driver-api/infrastructure.rst
> @@ -41,6 +41,12 @@ Device Drivers Base
>  .. kernel-doc:: drivers/base/class.c
>     :export:
>  
> +.. kernel-doc:: include/linux/device/faux.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/base/faux.c
> +   :export:
> +
>  .. kernel-doc:: drivers/base/node.c
>     :internal:
>  
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 7fb21768ca36..8074a10183dc 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>  			   cpu.o firmware.o init.o map.o devres.o \
>  			   attribute_container.o transport_class.o \
>  			   topology.o container.o property.o cacheinfo.o \
> -			   swnode.o
> +			   swnode.o faux.o
>  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>  obj-y			+= power/
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 8cf04a557bdb..0042e4774b0c 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -137,6 +137,7 @@ int hypervisor_init(void);
>  static inline int hypervisor_init(void) { return 0; }
>  #endif
>  int platform_bus_init(void);
> +int faux_bus_init(void);
>  void cpu_dev_init(void);
>  void container_dev_init(void);
>  #ifdef CONFIG_AUXILIARY_BUS
> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> new file mode 100644
> index 000000000000..531e9d789ee0
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  This is to be used whenever you need to create a
> + * device that is not associated with any "real" system resources, and do
> + * not want to have to deal with a bus/driver binding logic.  It is
> + * intended to be very simple, with only a create and a destroy function
> + * available.
> + */
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/container_of.h>
> +#include <linux/device/faux.h>
> +#include "base.h"
> +
> +/*
> + * Internal wrapper structure so we can hold a pointer to the
> + * faux_device_ops for this device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	const struct faux_device_ops *faux_ops;
> +};
> +#define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
> +
> +static struct device faux_bus_root = {
> +	.init_name	= "faux",
> +};
> +
> +static int faux_match(struct device *dev, const struct device_driver *drv)
> +{
> +	/* Match always succeeds, we only have one driver */
> +	return 1;
> +}
> +
> +static int faux_probe(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> +	int ret = 0;
> +
> +	if (faux_ops && faux_ops->probe)
> +		ret = faux_ops->probe(faux_dev);
> +
> +	return ret;
> +}
> +
> +static void faux_remove(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> +
> +	if (faux_ops && faux_ops->remove)
> +		faux_ops->remove(faux_dev);
> +}
> +
> +static const struct bus_type faux_bus_type = {
> +	.name		= "faux",
> +	.match		= faux_match,
> +	.probe		= faux_probe,
> +	.remove		= faux_remove,
> +};
> +
> +static struct device_driver faux_driver = {
> +	.name		= "faux_driver",
> +	.bus		= &faux_bus_type,
> +	.probe_type	= PROBE_FORCE_SYNCHRONOUS,
> +};
> +
> +static void faux_device_release(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +
> +	kfree(faux_obj);
> +}
> +
> +/**
> + * faux_device_create_with_groups - Create and register with the driver
> + *		core a faux device and populate the device with an initial
> + *		set of sysfs attributes.
> + * @name:	The name of the device we are adding, must be unique for
> + *		all faux devices.
> + * @parent:	Pointer to a potential parent struct device.  If set to
> + *		NULL, the device will be created in the "root" of the faux
> + *		device tree in sysfs.
> + * @faux_ops:	struct faux_device_ops that the new device will call back
> + *		into, can be NULL.
> + * @groups:	The set of sysfs attributes that will be created for this
> + *		device when it is registered with the driver core.
> + *
> + * Create a new faux device and register it in the driver core properly.
> + * If present, callbacks in @faux_ops will be called with the device that
> + * for the caller to do something with at the proper time given the
> + * device's lifecycle.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops can be called before the function returns, so be prepared for
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create_with_groups(const char *name,
> +						   struct device *parent,
> +						   const struct faux_device_ops *faux_ops,
> +						   const struct attribute_group **groups)
> +{
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	struct device *dev;
> +	int ret;
> +
> +	faux_obj = kzalloc(sizeof(*faux_obj), GFP_KERNEL);
> +	if (!faux_obj)
> +		return NULL;
> +
> +	/* Save off the callbacks so we can use them in the future */
> +	faux_obj->faux_ops = faux_ops;
> +
> +	/* Initialize the device portion and register it with the driver core */
> +	faux_dev = &faux_obj->faux_dev;
> +	dev = &faux_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release = faux_device_release;
> +	if (parent)
> +		dev->parent = parent;
> +	else
> +		dev->parent = &faux_bus_root;
> +	dev->bus = &faux_bus_type;
> +	dev->groups = groups;
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	return faux_dev;
> +}
> +EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
> +
> +/**
> + * faux_device_create - create and register with the driver core a faux device
> + * @name:	The name of the device we are adding, must be unique for all
> + *		faux devices.
> + * @parent:	Pointer to a potential parent struct device.  If set to
> + *		NULL, the device will be created in the "root" of the faux
> + *		device tree in sysfs.
> + * @faux_ops:	struct faux_device_ops that the new device will call back
> + *		into, can be NULL.
> + *
> + * Create a new faux device and register it in the driver core properly.
> + * If present, callbacks in @faux_ops will be called with the device that
> + * for the caller to do something with at the proper time given the
> + * device's lifecycle.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops can be called before the function returns, so be prepared for
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create(const char *name,
> +				       struct device *parent,
> +				       const struct faux_device_ops *faux_ops)
> +{
> +	return faux_device_create_with_groups(name, parent, faux_ops, NULL);
> +}
> +EXPORT_SYMBOL_GPL(faux_device_create);
> +
> +/**
> + * faux_device_destroy - destroy a faux device
> + * @faux_dev:	faux device to destroy
> + *
> + * Unregisters and cleans up a device that was created with a call to
> + * faux_device_create()
> + */
> +void faux_device_destroy(struct faux_device *faux_dev)
> +{
> +	struct device *dev = &faux_dev->dev;
> +
> +	if (!faux_dev)
> +		return;
> +
> +	device_del(dev);
> +
> +	/* The final put_device() will clean up the memory we allocated for this device. */
> +	put_device(dev);
> +}
> +EXPORT_SYMBOL_GPL(faux_device_destroy);
> +
> +int __init faux_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = device_register(&faux_bus_root);
> +	if (ret) {
> +		put_device(&faux_bus_root);
> +		return ret;
> +	}
> +
> +	ret = bus_register(&faux_bus_type);
> +	if (ret)
> +		goto error_bus;
> +
> +	ret = driver_register(&faux_driver);
> +	if (ret)
> +		goto error_driver;
> +
> +	return ret;
> +
> +error_driver:
> +	bus_unregister(&faux_bus_type);
> +
> +error_bus:
> +	device_unregister(&faux_bus_root);
> +	return ret;
> +}
> diff --git a/drivers/base/init.c b/drivers/base/init.c
> index c4954835128c..9d2b06d65dfc 100644
> --- a/drivers/base/init.c
> +++ b/drivers/base/init.c
> @@ -32,6 +32,7 @@ void __init driver_init(void)
>  	/* These are also core pieces, but must come after the
>  	 * core core pieces.
>  	 */
> +	faux_bus_init();
>  	of_core_init();
>  	platform_bus_init();
>  	auxiliary_bus_init();
> diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
> new file mode 100644
> index 000000000000..9f43c0e46aa4
> --- /dev/null
> +++ b/include/linux/device/faux.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  This is to be used whenever you need to create a
> + * device that is not associated with any "real" system resources, and do
> + * not want to have to deal with a bus/driver binding logic.  It is
> + * intended to be very simple, with only a create and a destroy function
> + * available.
> + */
> +#ifndef _FAUX_DEVICE_H_
> +#define _FAUX_DEVICE_H_
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +
> +/**
> + * struct faux_device - a "faux" device
> + * @dev:	internal struct device of the object
> + *
> + * A simple faux device that can be created/destroyed.  To be used when a
> + * driver only needs to have a device to "hang" something off.  This can be
> + * used for downloading firmware or other basic tasks.  Use this instead of
> + * a struct platform_device if the device has no resources assigned to
> + * it at all.
> + */
> +struct faux_device {
> +	struct device dev;
> +};
> +#define to_faux_device(x) container_of_const((x), struct faux_device, dev)
> +
> +/**
> + * struct faux_device_ops - a set of callbacks for a struct faux_device
> + * @probe:	called when a faux device is probed by the driver core
> + *		before the device is fully bound to the internal faux bus
> + *		code.  If probe succeeds, return 0, otherwise return a
> + *		negative error number to stop the probe sequence from
> + *		succeeding.
> + * @remove:	called when a faux device is removed from the system
> + *
> + * Both @probe and @remove are optional, if not needed, set to NULL.
> + */
> +struct faux_device_ops {
> +	int (*probe)(struct faux_device *faux_dev);
> +	void (*remove)(struct faux_device *faux_dev);
> +};
> +
> +struct faux_device *faux_device_create(const char *name,
> +				       struct device *parent,
> +				       const struct faux_device_ops *faux_ops);
> +struct faux_device *faux_device_create_with_groups(const char *name,
> +						   struct device *parent,
> +						   const struct faux_device_ops *faux_ops,
> +						   const struct attribute_group **groups);
> +void faux_device_destroy(struct faux_device *faux_dev);
> +
> +static inline void *faux_device_get_drvdata(const struct faux_device *faux_dev)
> +{
> +	return dev_get_drvdata(&faux_dev->dev);
> +}
> +
> +static inline void faux_device_set_drvdata(struct faux_device *faux_dev, void *data)
> +{
> +	dev_set_drvdata(&faux_dev->dev, data);
> +}
> +
> +#endif /* _FAUX_DEVICE_H_ */

Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>
