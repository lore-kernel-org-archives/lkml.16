Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE123C516;
	Fri,  2 May 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189935; cv=none; b=kmunF9il5+TLfVI0t61LqafFnLedktJ0JxASXkzbbNsaW4L936niBZPIVvFhYWn/QGYtP5ryCHPTEVzw3vKWg9uOl7wiv6qR1L8W/MNjnPULX6B950r9auxv+wtCF5y5mCD6MIWgF8ML54KomIRtdBMi7eJdgahhFGrXXjtXE2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189935; c=relaxed/simple;
	bh=rvGTV49aI2YiafdoRghKqRXgSYuXQpEWq3KW9cXmhcI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sci+h3/rEUwQsWC6WwEqrMe0ogxT/9mQ5HnUGXJWKqycdBzDlBXuS9q02fp15+ABA0/aKK6lgIB8c1NagxBOH35ri4NMUBGNaeo1s16rtxQGOJt5yXbx07sMLMLBp7HSNUSkHb1lQLqxVhO3c/rmtux/yxNR1Pr8ggCd+ImMGFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBijDFFv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBijDFFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189934; x=1777725934;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rvGTV49aI2YiafdoRghKqRXgSYuXQpEWq3KW9cXmhcI=;
  b=nBijDFFve9aIzJ+X5TgZ6i595N7Lbe23E3V3shfiqI8Q9PcmDUebOw/Q
   ZnYyz0C5gF5g5cSECL630vg7/JWPtA/TzP8SwsF9Vp8xxUjPSoCffVriR
   iXD7C3yYun782Pu2dZfFjsyWHSBD5Z8/2YlgLwG8OrNmGuc3PKJfGbRBN
   qd0FCOrN2RY3+4p3v3hf9UpMh7hI4DMf8i12w+sJ34qX+Yr4mHCtwFTuo
   +qHpPB21sppAOKrh+z/9RU16cT1WdKdMJ1gEA/IKS/i4SGaayDhBf6i+A
   CbEg3PhGCJ+UqX6zqwpz/h8QCYfnCTTTYe7Qa3MMyhzp7HJWVUI27jQld
   A==;
X-CSE-ConnectionGUID: zPlcoQCYRDy8ihyiIHLhlw==
X-CSE-MsgGUID: O6v+LnVGQiCPbOzAQtc4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48011563"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="48011563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:45:32 -0700
X-CSE-ConnectionGUID: /2curoZjRjC+62Yibig87w==
X-CSE-MsgGUID: N/e++z11RC6cg8Q2/9ZKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134590267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.135])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:45:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 2 May 2025 15:45:25 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Gabriel Marcano <gabemarcano@yahoo.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO
 debug methods
In-Reply-To: <20250502-awcc-gpio-v3-1-ea9a932d1124@gmail.com>
Message-ID: <aab2237f-d32e-b335-56d3-144274849edf@linux.intel.com>
References: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com> <20250502-awcc-gpio-v3-1-ea9a932d1124@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, Kurt Borja via B4 Relay wrote:

> From: Kurt Borja <kuurtb@gmail.com>
> 
> Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
> which has two GPIO pins with debug capabilities:
> 
>  - Device Firmware Update mode (DFU)
>  - Negative Reset (NRST)
> 
> The WMAX device has methods to toggle or read the state of these GPIO
> pins. Expose these methods through DebugFS, hidden behind an unsafe
> module parameter to avoid common users from toying with these without
> consideration.
> 
> Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
>  drivers/platform/x86/dell/alienware-wmi-wmax.c  | 105 +++++++++++++++++++++++-
>  2 files changed, 123 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documentation/ABI/testing/debugfs-alienware-wmi
> index 48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5..c7f525d6baac962be82780608f8da5c0368600cc 100644
> --- a/Documentation/ABI/testing/debugfs-alienware-wmi
> +++ b/Documentation/ABI/testing/debugfs-alienware-wmi
> @@ -42,3 +42,23 @@ Description:
>  		details.
>  
>  		RO
> +
> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/total_gpios
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Kurt Borja <kuurtb@gmail.com>
> +Description:
> +		Total number of GPIO pins reported by the device.
> +
> +		RO
> +
> +What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/pinX
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Kurt Borja <kuurtb@gmail.com>
> +Description:
> +		This file controls GPIO pin X status.
> +
> +		See Documentation/wmi/devices/alienware-wmi.rst for details.
> +
> +		RW
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2bf9d85426b8f2cc5482be48050c81f9b6a30d00 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -38,6 +38,9 @@
>  #define AWCC_METHOD_GET_FAN_SENSORS		0x13
>  #define AWCC_METHOD_THERMAL_INFORMATION		0x14
>  #define AWCC_METHOD_THERMAL_CONTROL		0x15
> +#define AWCC_METHOD_FWUP_GPIO_CONTROL		0x20
> +#define AWCC_METHOD_READ_TOTAL_GPIOS		0x21
> +#define AWCC_METHOD_READ_GPIO_STATUS		0x22
>  #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
>  
>  #define AWCC_FAILURE_CODE			0xFFFFFFFF
> @@ -281,6 +284,8 @@ struct awcc_priv {
>  	struct device *hwdev;
>  	struct awcc_fan_data **fan_data;
>  	unsigned long temp_sensors[AWCC_ID_BITMAP_LONGS];
> +
> +	u32 gpio_count;
>  };
>  
>  static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
> @@ -571,6 +576,38 @@ static int awcc_thermal_information(struct wmi_device *wdev, u8 operation, u8 ar
>  	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
>  }
>  
> +static int awcc_fwup_gpio_control(struct wmi_device *wdev, u8 pin, u8 status)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = pin,
> +		.arg1 = status,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +	u32 out;
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_FWUP_GPIO_CONTROL, &args, &out);
> +}
> +
> +static int awcc_read_total_gpios(struct wmi_device *wdev, u32 *count)
> +{
> +	struct wmax_u32_args args = {};
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_TOTAL_GPIOS, &args, count);
> +}
> +
> +static int awcc_read_gpio_status(struct wmi_device *wdev, u8 pin, u32 *status)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = pin,
> +		.arg1 = 0,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +
> +	return awcc_wmi_command(wdev, AWCC_METHOD_READ_GPIO_STATUS, &args, status);
> +}
> +
>  static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
>  				  u32 *out)
>  {
> @@ -1318,6 +1355,47 @@ static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *data)
>  	return 0;
>  }
>  
> +static int awcc_gpio_pin_show(struct seq_file *seq, void *data)
> +{
> +	unsigned long pin = debugfs_get_aux_num(seq->file);
> +	struct wmi_device *wdev = seq->private;
> +	u32 status;
> +	int ret;
> +
> +	ret = awcc_read_gpio_status(wdev, pin, &status);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(seq, "%u\n", status);
> +
> +	return 0;
> +}
> +
> +static ssize_t awcc_gpio_pin_write(struct file *file, const char __user *buf,
> +				   size_t count, loff_t *ppos)
> +{
> +	unsigned long pin = debugfs_get_aux_num(file);
> +	struct seq_file *seq = file->private_data;
> +	struct wmi_device *wdev = seq->private;
> +	bool status;
> +	int ret;
> +
> +	if (!ppos || *ppos)
> +		return -EINVAL;
> +
> +	ret = kstrtobool_from_user(buf, count, &status);
> +	if (ret)
> +		return ret;
> +
> +	ret = awcc_fwup_gpio_control(wdev, pin, status);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(awcc_gpio_pin);
> +
>  static void awcc_debugfs_remove(void *data)
>  {
>  	struct dentry *root = data;
> @@ -1327,11 +1405,15 @@ static void awcc_debugfs_remove(void *data)
>  
>  static void awcc_debugfs_init(struct wmi_device *wdev)
>  {
> -	struct dentry *root;
> -	char name[64];
> +	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
> +	struct dentry *root, *gpio_ctl;
> +	char pin_name[8], name[64];
> +	u32 gpio_count;
> +	int ret;
>  
>  	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wdev->dev));
>  	root = debugfs_create_dir(name, NULL);
> +	gpio_ctl = debugfs_create_dir("gpio_ctl", root);
>  
>  	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
>  				    awcc_debugfs_system_description_read);
> @@ -1344,6 +1426,25 @@ static void awcc_debugfs_init(struct wmi_device *wdev)
>  		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>  					    awcc_debugfs_pprof_data_read);
>  
> +	ret = awcc_read_total_gpios(wdev, &gpio_count);
> +	if (ret) {
> +		dev_dbg(&wdev->dev, "Failed to get total GPIO Pin count\n");
> +		goto out_add_action;
> +	} else if (gpio_count > AWCC_MAX_RES_COUNT) {
> +		dev_dbg(&wdev->dev, "Reported GPIO Pin count may be corrupted: %u\n", gpio_count);
> +		goto out_add_action;
> +	}
> +
> +	priv->gpio_count = gpio_count;
> +	debugfs_create_u32("total_gpios", 0444, gpio_ctl, &priv->gpio_count);
> +
> +	for (unsigned int i = 0; i < gpio_count; i++) {
> +		scnprintf(pin_name, sizeof(pin_name), "pin%u", i);

Hi,

This might trigger a warning from the compiler that the resulting string 
might not fit into pin_name. Did you check the warnings?

> +		debugfs_create_file_aux_num(pin_name, 0644, gpio_ctl, wdev, i,
> +					    &awcc_gpio_pin_fops);
> +	}
> +
> +out_add_action:
>  	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>  }
>  
> 
> 

-- 
 i.

