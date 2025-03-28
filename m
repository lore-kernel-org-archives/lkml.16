Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3E1C9B62;
	Fri, 28 Mar 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178707; cv=none; b=F59vm5+Z0EfUMNCD2k/lcRPdMbjlToJBVrw6sPdq4GClRLsxYVK+bUBwuFJAlZ+iSau870LYGlY6G4n4/XdTHF0JMqiY07VxOGiR/oJWnhCBSn0zN/IjtkRaIEq974+y+EP4CGvJAlmjYBZ6ppzU67pr9PumdOiia0defHMy0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178707; c=relaxed/simple;
	bh=pLTKHD3ngohPgzIXmaLBRC4/WKu4wHLBTdpsSwKx6Ok=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pcq6PFL5Igrjh5SAu24SrgLAhNsicdpiNKDvhX3Kz/+XrWTJj3DUA1vorxidYFu+Mzab+61OH7J0oyynX6c08qDvlonALUmmEg1odgygOo5NRoFXnSmJ0D7VmnGRi2oKgUB6QiHxpQRX5b6aHWx6RbYbDNMKHPgAt7K+FaGTj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akkpTSIj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akkpTSIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743178706; x=1774714706;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pLTKHD3ngohPgzIXmaLBRC4/WKu4wHLBTdpsSwKx6Ok=;
  b=akkpTSIj6PPCAa/0377EufLTnrCm4zon04DiKrhEjN4NssK8Cm/tE/s4
   IWbzJHW+nTrM7uEUmRPVElCmpXZyHHmkTIj40xaMljzt/mpfgFaowpYZc
   y8KmoTSBs+scQ7fYFmzd9tD1U/AKDJAWrK1FsM6ZTeM2nds/68dp1wm88
   M8UEbvhLMmvLInQBWBUj0oppa1s/5ItFFwlAkzNV1tvBvdLC5BOKcCePF
   n9RemAsMUb6XyKlkv6NL9iaXDDrbeX2MW30c5ZSf0bcC6kDJkqc4BTPi5
   7A3yBs/Mp21ywFLN5wanYdm7Insup4IPCTxoHiuNJrrQbN2oS1NoRR6a+
   Q==;
X-CSE-ConnectionGUID: hs4xIvlITRKcuH5saoG19g==
X-CSE-MsgGUID: OPY0yV3GT7SpFT83/fPLsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55208000"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55208000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:18:25 -0700
X-CSE-ConnectionGUID: ttme5oBuS9KxO8XuYgom9g==
X-CSE-MsgGUID: C72/lOYRQPGRp/g/t90X+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="129625691"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:18:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 18:18:19 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/12] platform/x86: alienware-wmi-wmax: Add a DebugFS
 interface
In-Reply-To: <20250313-hwm-v6-9-17b57f787d77@gmail.com>
Message-ID: <09fb8477-9b41-ceb2-4f0c-bc6477a5874f@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-9-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Kurt Borja wrote:

> Add a debugfs interface which exposes thermal private data.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 90 ++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index 823b579260555085ef6ac793b806738a756bb9da..472e6289fec5be0db0a5cb8e76718b750fa558b5 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -11,6 +11,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
>  #include <linux/bits.h>
> +#include <linux/debugfs.h>
>  #include <linux/dmi.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> @@ -19,6 +20,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/platform_profile.h>
>  #include <linux/pm.h>
> +#include <linux/seq_file.h>
>  #include <linux/units.h>
>  #include <linux/wmi.h>
>  #include "alienware-wmi.h"
> @@ -1252,6 +1254,92 @@ static int awcc_platform_profile_init(struct wmi_device *wdev)
>  	return PTR_ERR_OR_ZERO(priv->ppdev);
>  }
>  
> +/*
> + * DebugFS
> + */
> +static int awcc_debugfs_system_description_read(struct seq_file *seq, void *data)
> +{
> +	struct device *dev = seq->private;
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +
> +	seq_printf(seq, "0x%08x\n", priv->system_description);
> +
> +	return 0;
> +}
> +
> +static int awcc_debugfs_hwmon_data_read(struct seq_file *seq, void *data)
> +{
> +	struct device *dev = seq->private;
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +	const struct awcc_fan_data *fan;
> +	unsigned int bit;
> +
> +	seq_printf(seq, "Number of fans: %u\n", priv->fan_count);
> +	seq_printf(seq, "Number of temperature sensors: %u\n\n", priv->temp_count);
> +
> +	for (u32 i = 0; i < priv->fan_count; i++) {
> +		fan = priv->fan_data[i];
> +
> +		seq_printf(seq, "Fan %u:\n", i);
> +		seq_printf(seq, "  ID: 0x%02x\n", fan->id);
> +		seq_printf(seq, "  Related temperature sensors bitmap: %lu\n",
> +			   fan->auto_channels_temp);
> +	}
> +
> +	seq_puts(seq, "\nTemperature sensor IDs:\n");
> +	for_each_set_bit(bit, priv->temp_sensors, AWCC_ID_BITMAP_SIZE)
> +		seq_printf(seq, "  0x%02x\n", bit);
> +
> +	return 0;
> +}
> +
> +static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *data)
> +{
> +	struct device *dev = seq->private;
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +
> +	seq_printf(seq, "Number of thermal profiles: %u\n\n", priv->profile_count);
> +
> +	for (u32 i = 0; i < PLATFORM_PROFILE_LAST; i++) {
> +		if (!priv->supported_profiles[i])
> +			continue;
> +
> +		seq_printf(seq, "Platform profile %u:\n", i);
> +		seq_printf(seq, "  ID: 0x%02x\n", priv->supported_profiles[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static void awcc_debugfs_remove(void *data)
> +{
> +	struct dentry *root = data;
> +
> +	debugfs_remove(root);
> +}
> +
> +static void awcc_debugfs_init(struct wmi_device *wdev)
> +{
> +	struct dentry *root;
> +	char name[64];
> +
> +	scnprintf(name, ARRAY_SIZE(name), "%s-%s", "alienware-wmi", dev_name(&wdev->dev));

You'd need to add include for ARRAY_SIZE() but can't you just use 
sizeof()?

> +	root = debugfs_create_dir(name, NULL);
> +
> +	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
> +				    awcc_debugfs_system_description_read);
> +
> +	if (awcc->hwmon)
> +		debugfs_create_devm_seqfile(&wdev->dev, "hwmon_data", root,
> +					    awcc_debugfs_hwmon_data_read);
> +
> +	if (awcc->pprof)
> +		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
> +					    awcc_debugfs_pprof_data_read);
> +
> +	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
> +}
> +
>  static int alienware_awcc_setup(struct wmi_device *wdev)
>  {
>  	struct awcc_priv *priv;
> @@ -1290,6 +1378,8 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
>  			return ret;
>  	}
>  
> +	awcc_debugfs_init(wdev);
> +
>  	return 0;
>  }
>  
> 
> 

-- 
 i.

