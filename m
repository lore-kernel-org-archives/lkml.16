Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F418E76B;
	Tue,  8 Apr 2025 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122013; cv=none; b=ua11x+1fATE0vFNzWtp9gIVLouzIu36c84ViGWd8aPqq/IHixm91N9YLhMGQuFDjOeZO7H6Ilajpgrl95QMBfkeDxlehqXTiEXEfEAY3120rk+twRdQXWg64MRuqu7engR1INysL/0+uGuEWSj14HwaTEhpga0OyOW3KZEJSt44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122013; c=relaxed/simple;
	bh=k7Mfm0w0xSbJ/AwlZ8WhSRtoVSo4epULalNHQqZi+28=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rmek8ucNdIJMWanVzE5SLgRPmlLTbbr2aOg4xwF74sVhwwt6HfMIZwinMG1VA7GNp/SiGyPUNHSGU4Uy5sTAMeSaYvRYGwkvtf6IJPttsw85kEIh1afG6hBQBAwuYrz6Uvv6FuJKjzCQj1jsLOiT2j36yKEOvmoZw70ajWrTxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwcFj/ec; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwcFj/ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122011; x=1775658011;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k7Mfm0w0xSbJ/AwlZ8WhSRtoVSo4epULalNHQqZi+28=;
  b=TwcFj/ecNnbF3+kBHF9+76mVAUwTlI9Po6hEWahNaj/0w5p+P6lKCFBX
   Ow8NDUeQSTqJ41K99LzXTbPwJDnOP069Qa3Bic2fC2D+6GcG/EbA6IpvB
   P+HhDTkZsuLG2PM6oqBoN6FXUCH+QvdAcMKR9fiZSApO8BstTlgXXVCAl
   Sp+9mnQ4KdHsXy02cwojtaBzlwBlqmmJPSuQqn5vDrJ+8KLykWpdFbJ7A
   1+oqCIo9teKnLC8qwoxNRsaBIeEnKn+2Ka5/Fn8N+YtY0rVcqbbwg23aG
   7OGdyvhfkoc61tFdimj2CES9NuAm7u+tNRkl62gd3K0/Ay+6lHn0juB0K
   g==;
X-CSE-ConnectionGUID: 1wpwSD//Tfy9dzrQoLNGiw==
X-CSE-MsgGUID: MmkQuRlVRSm7txg5Qb2Vlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44807154"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44807154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:20:10 -0700
X-CSE-ConnectionGUID: LV7nR+smSLyo8L8+kdr3Dw==
X-CSE-MsgGUID: bqQQEoutSHKU+iUbk5msRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128804113"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:20:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 17:20:04 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v8 4/8] platform/x86: asus-armoury: add apu-mem control
 support
In-Reply-To: <20250319065827.53478-5-luke@ljones.dev>
Message-ID: <f8b310f6-ebfe-64eb-d62c-28f27c753538@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-5-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Mar 2025, Luke Jones wrote:

> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Implement the APU memory size control under the asus-armoury module using
> the fw_attributes class.
> 
> This allows the APU allocated memory size to be adjusted depending on
> the users priority. A reboot is required after change.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 114 +++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |   2 +
>  2 files changed, 116 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index a299471d78d5..b1d6b0c41669 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -388,6 +388,119 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
>  WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
>  ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
>  
> +/* Device memory available to APU */
> +
> +static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					  char *buf)
> +{
> +	int err;
> +	u32 mem;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
> +	if (err)
> +		return err;
> +
> +	switch (mem) {
> +	case 0x100:
> +		mem = 0;
> +		break;
> +	case 0x102:
> +		mem = 1;
> +		break;
> +	case 0x103:
> +		mem = 2;
> +		break;
> +	case 0x104:
> +		mem = 3;
> +		break;
> +	case 0x105:
> +		mem = 4;
> +		break;
> +	case 0x106:
> +		/* This is out of order and looks wrong but is correct */
> +		mem = 8;
> +		break;
> +	case 0x107:
> +		mem = 5;
> +		break;
> +	case 0x108:
> +		mem = 6;
> +		break;
> +	case 0x109:
> +		mem = 7;
> +		break;
> +	default:
> +		mem = 4;
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%u\n", mem);
> +}
> +
> +static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 requested, mem;
> +
> +	result = kstrtou32(buf, 10, &requested);
> +	if (result)
> +		return result;
> +
> +	switch (requested) {
> +	case 0:
> +		mem = 0x000;
> +		break;
> +	case 1:
> +		mem = 0x102;
> +		break;
> +	case 2:
> +		mem = 0x103;
> +		break;
> +	case 3:
> +		mem = 0x104;
> +		break;
> +	case 4:
> +		mem = 0x105;
> +		break;
> +	case 5:
> +		mem = 0x107;
> +		break;
> +	case 6:
> +		mem = 0x108;
> +		break;
> +	case 7:
> +		mem = 0x109;
> +		break;
> +	case 8:
> +		/* This is out of order and looks wrong but is correct */
> +		mem = 0x106;
> +		break;
> +	default:
> +		return -EIO;
> +	}

Should these switch/cases be just replaced with an array (and loop in one 
of the functions).

> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
> +	if (err) {
> +		pr_warn("Failed to set apu_mem: %d\n", err);
> +		return err;
> +	}
> +
> +	pr_info("APU memory changed to %uGB, reboot required\n", requested);
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +
> +static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");

I you add the array, would be useful to BUILD_BUG_ON() in this if the 
ARRAY_SIZE() differs.

> +}
> +ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
> +
>  /* Simple attribute creation */
>  ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
>  		       "Show the current mode of charging");
> @@ -408,6 +521,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>  	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> +	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>  
>  	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>  	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 62a9adb1af2f..f3494a9efea7 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -137,6 +137,8 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
> +
>  /* gpu mux switch, 0 = dGPU, 1 = Optimus */
>  #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
>  #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
> 

-- 
 i.

