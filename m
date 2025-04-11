Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835B718B47E;
	Fri, 11 Apr 2025 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379637; cv=none; b=FwkOd6WlsKuxJqTqzm2hi1Dvfno+4vvVjk/qKruMF9CzFTOTiLIicTkIrZ6vOw7a+1ivKjhsSl+CoCMZ7TT+5JWeZgTQQvtlohaf4SmPTd48Rp7cvJBmPfHeMKCDPfV5M/f73j0rlFWJw+UUMcm4GiuBymxs4R+/+8+pUbdcLAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379637; c=relaxed/simple;
	bh=G2aORv4sPutEFFsmlG+GmeknJQ1rL6Tp3gdtZBWdH5k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VBLEMjg3oxKZRIpsFGovGsSYlvU9rm4s1OK2wbGQ2ltW+Zc41rTWqNMPOpesUuM2+rHiGAgVOJ1PVRdLrO6pzuebAQrK1QkshRl6Mta+KEh6b/hpSfYbFqCui2n1asI4OZ1vOXNxH44Q0DD+4B+nGUefODgcDj0K2kr0Huea80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMdeAnyK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMdeAnyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744379635; x=1775915635;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G2aORv4sPutEFFsmlG+GmeknJQ1rL6Tp3gdtZBWdH5k=;
  b=LMdeAnyKqIZ23AiDmrlwgSBG2q7WYrmejJYYROBp+Q8NlWmSOwDGHlUG
   GfwIEzO1ud4xW5bHg+hdZT0VLrdBTRWop6KrWlXMwIS3HyVcSnteCq1e2
   yeCvaiYdQfFMnfI9akBf7g1UEkWrzIUBoCQVQlGle8/VfvmxKfihyFL8z
   FYtC3MOfm0ROOnOLoljeMNsX9jKKHFb/Ura8ArfRCkTkxVZkpi5XHQZKJ
   T9MH0zs1w5mOffw/yDoAiEkkkuCuhY/EsfRWq5Apxdt4u1Doou1e3YViK
   FrxSSSnHxkC2gNqDX+DBeha/xqO7p1l61RPsJffC/rZeXw5lUNSKRy/0f
   w==;
X-CSE-ConnectionGUID: m27YQ840RheBKYy8QThvfQ==
X-CSE-MsgGUID: 0hv1ZZThRaK+NZaWKhbbJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49584062"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="49584062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 06:53:54 -0700
X-CSE-ConnectionGUID: 29EgruG4SL+jyivaTCzc8Q==
X-CSE-MsgGUID: KVqtDRwpR1CxMGsy7rpBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="129149130"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 06:53:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Apr 2025 16:53:48 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hdegoede@redhat.com>, lkml@antheas.dev, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: msi-wmi-platform: Workaround a ACPI firmware
 bug
In-Reply-To: <20250410212853.334891-1-W_Armin@gmx.de>
Message-ID: <60a6574f-d6cd-671c-89d8-0307b440937e@linux.intel.com>
References: <20250410212853.334891-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Armin Wolf wrote:

> The ACPI byte code inside the ACPI control method responsible for
> handling the WMI method calls uses a global buffer for constructing
> the return value, yet the ACPI control method itself is not marked
> as "Serialized".
> This means that calling WMI methods on this WMI device is not
> thread-safe, as concurrent WMI method calls will corrupt the global
> buffer.

Please avoid non-full lines in middle of a paragraph. Either make things 
truly own paragraphs or reflow the text in the paragraph.

> Fix this by serializing the WMI method calls using a mutex.
> 
> Fixes: 9c0beb6b29e7 ("platform/x86: wmi: Add MSI WMI Platform driver")
> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../wmi/devices/msi-wmi-platform.rst          |  4 +
>  drivers/platform/x86/msi-wmi-platform.c       | 99 ++++++++++++-------
>  2 files changed, 67 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
> index 31a136942892..73197b31926a 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -138,6 +138,10 @@ input data, the meaning of which depends on the subfeature being accessed.
>  The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
>  and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
> 
> +.. note::
> +   The ACPI control method responsible for handling the WMI method calls is not thread-safe.
> +   This is a firmware bug that needs to be handled inside the driver itself.
> +
>  WMI method Get_EC()
>  -------------------
> 
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
> index 9b5c7f8c79b0..dc5e9878cb68 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -10,6 +10,7 @@
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/device/driver.h>
> @@ -17,6 +18,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/printk.h>
>  #include <linux/rwsem.h>
>  #include <linux/types.h>
> @@ -76,8 +78,13 @@ enum msi_wmi_platform_method {
>  	MSI_PLATFORM_GET_WMI		= 0x1d,
>  };
> 
> -struct msi_wmi_platform_debugfs_data {
> +struct msi_wmi_platform_data {
>  	struct wmi_device *wdev;
> +	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
> +};
> +
> +struct msi_wmi_platform_debugfs_data {
> +	struct msi_wmi_platform_data *data;
>  	enum msi_wmi_platform_method method;
>  	struct rw_semaphore buffer_lock;	/* Protects debugfs buffer */
>  	size_t length;
> @@ -132,8 +139,9 @@ static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, siz
>  	return 0;
>  }
> 
> -static int msi_wmi_platform_query(struct wmi_device *wdev, enum msi_wmi_platform_method method,
> -				  u8 *input, size_t input_length, u8 *output, size_t output_length)
> +static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
> +				  enum msi_wmi_platform_method method, u8 *input,
> +				  size_t input_length, u8 *output, size_t output_length)
>  {
>  	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_buffer in = {
> @@ -147,9 +155,15 @@ static int msi_wmi_platform_query(struct wmi_device *wdev, enum msi_wmi_platform
>  	if (!input_length || !output_length)
>  		return -EINVAL;
> 
> -	status = wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	/*
> +	 * The ACPI control method responsible for handling the WMI method calls
> +	 * is not thread-safe. Because of this we have to do the locking ourself.
> +	 */
> +	scoped_guard(mutex, &data->wmi_lock) {
> +		status = wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out);
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +	}
> 
>  	obj = out.pointer;
>  	if (!obj)
> @@ -170,22 +184,22 @@ static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwmon_senso
>  static int msi_wmi_platform_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  				 int channel, long *val)
>  {
> -	struct wmi_device *wdev = dev_get_drvdata(dev);
> +	struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
>  	u8 input[32] = { 0 };
>  	u8 output[32];
> -	u16 data;
> +	u16 value;
>  	int ret;
> 
> -	ret = msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, sizeof(input), output,
> +	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeof(input), output,
>  				     sizeof(output));
>  	if (ret < 0)
>  		return ret;
> 
> -	data = get_unaligned_be16(&output[channel * 2 + 1]);
> -	if (!data)
> +	value = get_unaligned_be16(&output[channel * 2 + 1]);
> +	if (!value)
>  		*val = 0;
>  	else
> -		*val = 480000 / data;
> +		*val = 480000 / value;

Please put this variable rename into own patch before the actual fix.

--
 i.

>  	return 0;
>  }
> @@ -231,7 +245,7 @@ static ssize_t msi_wmi_platform_write(struct file *fp, const char __user *input,
>  		return ret;
> 
>  	down_write(&data->buffer_lock);
> -	ret = msi_wmi_platform_query(data->wdev, data->method, payload, data->length, data->buffer,
> +	ret = msi_wmi_platform_query(data->data, data->method, payload, data->length, data->buffer,
>  				     data->length);
>  	up_write(&data->buffer_lock);
> 
> @@ -277,17 +291,17 @@ static void msi_wmi_platform_debugfs_remove(void *data)
>  	debugfs_remove_recursive(dir);
>  }
> 
> -static void msi_wmi_platform_debugfs_add(struct wmi_device *wdev, struct dentry *dir,
> +static void msi_wmi_platform_debugfs_add(struct msi_wmi_platform_data *drvdata, struct dentry *dir,
>  					 const char *name, enum msi_wmi_platform_method method)
>  {
>  	struct msi_wmi_platform_debugfs_data *data;
>  	struct dentry *entry;
> 
> -	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(&drvdata->wdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return;
> 
> -	data->wdev = wdev;
> +	data->data = drvdata;
>  	data->method = method;
>  	init_rwsem(&data->buffer_lock);
> 
> @@ -298,82 +312,82 @@ static void msi_wmi_platform_debugfs_add(struct wmi_device *wdev, struct dentry
> 
>  	entry = debugfs_create_file(name, 0600, dir, data, &msi_wmi_platform_debugfs_fops);
>  	if (IS_ERR(entry))
> -		devm_kfree(&wdev->dev, data);
> +		devm_kfree(&drvdata->wdev->dev, data);
>  }
> 
> -static void msi_wmi_platform_debugfs_init(struct wmi_device *wdev)
> +static void msi_wmi_platform_debugfs_init(struct msi_wmi_platform_data *data)
>  {
>  	struct dentry *dir;
>  	char dir_name[64];
>  	int ret, method;
> 
> -	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_name(&wdev->dev));
> +	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_name(&data->wdev->dev));
> 
>  	dir = debugfs_create_dir(dir_name, NULL);
>  	if (IS_ERR(dir))
>  		return;
> 
> -	ret = devm_add_action_or_reset(&wdev->dev, msi_wmi_platform_debugfs_remove, dir);
> +	ret = devm_add_action_or_reset(&data->wdev->dev, msi_wmi_platform_debugfs_remove, dir);
>  	if (ret < 0)
>  		return;
> 
>  	for (method = MSI_PLATFORM_GET_PACKAGE; method <= MSI_PLATFORM_GET_WMI; method++)
> -		msi_wmi_platform_debugfs_add(wdev, dir, msi_wmi_platform_debugfs_names[method - 1],
> +		msi_wmi_platform_debugfs_add(data, dir, msi_wmi_platform_debugfs_names[method - 1],
>  					     method);
>  }
> 
> -static int msi_wmi_platform_hwmon_init(struct wmi_device *wdev)
> +static int msi_wmi_platform_hwmon_init(struct msi_wmi_platform_data *data)
>  {
>  	struct device *hdev;
> 
> -	hdev = devm_hwmon_device_register_with_info(&wdev->dev, "msi_wmi_platform", wdev,
> +	hdev = devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_wmi_platform", data,
>  						    &msi_wmi_platform_chip_info, NULL);
> 
>  	return PTR_ERR_OR_ZERO(hdev);
>  }
> 
> -static int msi_wmi_platform_ec_init(struct wmi_device *wdev)
> +static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data)
>  {
>  	u8 input[32] = { 0 };
>  	u8 output[32];
>  	u8 flags;
>  	int ret;
> 
> -	ret = msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_EC, input, sizeof(input), output,
> +	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, input, sizeof(input), output,
>  				     sizeof(output));
>  	if (ret < 0)
>  		return ret;
> 
>  	flags = output[MSI_PLATFORM_EC_FLAGS_OFFSET];
> 
> -	dev_dbg(&wdev->dev, "EC RAM version %lu.%lu\n",
> +	dev_dbg(&data->wdev->dev, "EC RAM version %lu.%lu\n",
>  		FIELD_GET(MSI_PLATFORM_EC_MAJOR_MASK, flags),
>  		FIELD_GET(MSI_PLATFORM_EC_MINOR_MASK, flags));
> -	dev_dbg(&wdev->dev, "EC firmware version %.28s\n",
> +	dev_dbg(&data->wdev->dev, "EC firmware version %.28s\n",
>  		&output[MSI_PLATFORM_EC_VERSION_OFFSET]);
> 
>  	if (!(flags & MSI_PLATFORM_EC_IS_TIGERLAKE)) {
>  		if (!force)
>  			return -ENODEV;
> 
> -		dev_warn(&wdev->dev, "Loading on a non-Tigerlake platform\n");
> +		dev_warn(&data->wdev->dev, "Loading on a non-Tigerlake platform\n");
>  	}
> 
>  	return 0;
>  }
> 
> -static int msi_wmi_platform_init(struct wmi_device *wdev)
> +static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
>  {
>  	u8 input[32] = { 0 };
>  	u8 output[32];
>  	int ret;
> 
> -	ret = msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_WMI, input, sizeof(input), output,
> +	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, input, sizeof(input), output,
>  				     sizeof(output));
>  	if (ret < 0)
>  		return ret;
> 
> -	dev_dbg(&wdev->dev, "WMI interface version %u.%u\n",
> +	dev_dbg(&data->wdev->dev, "WMI interface version %u.%u\n",
>  		output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
>  		output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
> 
> @@ -381,7 +395,8 @@ static int msi_wmi_platform_init(struct wmi_device *wdev)
>  		if (!force)
>  			return -ENODEV;
> 
> -		dev_warn(&wdev->dev, "Loading despite unsupported WMI interface version (%u.%u)\n",
> +		dev_warn(&data->wdev->dev,
> +			 "Loading despite unsupported WMI interface version (%u.%u)\n",
>  			 output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
>  			 output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
>  	}
> @@ -391,19 +406,31 @@ static int msi_wmi_platform_init(struct wmi_device *wdev)
> 
>  static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
>  {
> +	struct msi_wmi_platform_data *data;
>  	int ret;
> 
> -	ret = msi_wmi_platform_init(wdev);
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	ret = devm_mutex_init(&wdev->dev, &data->wmi_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = msi_wmi_platform_init(data);
>  	if (ret < 0)
>  		return ret;
> 
> -	ret = msi_wmi_platform_ec_init(wdev);
> +	ret = msi_wmi_platform_ec_init(data);
>  	if (ret < 0)
>  		return ret;
> 
> -	msi_wmi_platform_debugfs_init(wdev);
> +	msi_wmi_platform_debugfs_init(data);
> 
> -	return msi_wmi_platform_hwmon_init(wdev);
> +	return msi_wmi_platform_hwmon_init(data);
>  }
> 
>  static const struct wmi_device_id msi_wmi_platform_id_table[] = {
> --
> 2.39.5
> 
