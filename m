Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340D2063D3;
	Tue,  8 Apr 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123024; cv=none; b=rmyjN3Md2BRKVWPvhGVxNlmriDMaqNiDEoIVGhyyotPch3u6o/ddlN/Ekm3KRDdXbLmTyvHbeGzuNnzd0ML/GXuUYvCxVm+oln5mlD6/Ycz3LzPd685XywNEwHJqB1+Kjd5/A13VAClOay8IlUJ0eGyH9agjYPLZE31Fkm6USUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123024; c=relaxed/simple;
	bh=avE+MCCNpKRWbq7W+JC5m0bJnzZ8i3RkHkTCTjJUAKQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EQApYU3ILOBpUGbh2EnZ2hv8yG3nSGVjGUo4QbbiA5YrzZU7t454F8Q5MOYZd35JOCQIMVCKJ5MSxeGmSyp8KcR90A+UwUrVZGb7qp4sWyEZSlEBLOlET4CRB+n9vocR08DB5sIa630Qp6RRAzXQhsiv+dhBZO0k73mZABnhQGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZPBgZXm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZPBgZXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123022; x=1775659022;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=avE+MCCNpKRWbq7W+JC5m0bJnzZ8i3RkHkTCTjJUAKQ=;
  b=gZPBgZXmInbaW9JVqS4tZasMCJb3KXu3Wp9qsaUnxbk2dPlqAlOnaMZv
   avtFVOaAfJ4oPyfDfZYbeRYdbXMTc7CEe0U3MJkIa4rx0KWR20FuQXgag
   3SrkIDkZfdPHmF22XxNCygMG4zDEA1TEv0eSPWWV1JEH5FAHH1bzYI7uM
   OesCUw/pmDC2rVWu3hgUkotSAv23QqSxuYBRd9k3edPRQsgZ25k39yt39
   MjrfEB+S1wzQp/iP2g5ATrU4f5HXpOhVt+eEzVd8jEWq2+MNCzJRCga+0
   N0cQ30TtGVG0UpEHMr3EKprJc7N9s5VqMKeWRKZSGX7zZOVmFa2KoeFeh
   A==;
X-CSE-ConnectionGUID: l+kH17e8R3OYXbaEhg6okQ==
X-CSE-MsgGUID: jA9dTCX0TlK1Y1muNyIfHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48269389"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="48269389"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:36:58 -0700
X-CSE-ConnectionGUID: DrjKlff0RGuNqPjDZdvNzA==
X-CSE-MsgGUID: Kj+sfb1URDuce1HFFuAMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128159864"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:36:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 17:36:52 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com, 
    ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com
Subject: Re: [PATCH v8 5/8] platform/x86: asus-armoury: add core count
 control
In-Reply-To: <20250319065827.53478-6-luke@ljones.dev>
Message-ID: <5078fc78-6b78-eea0-b009-9229fcdd9731@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-6-luke@ljones.dev>
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
> Implement Intel core enablement under the asus-armoury module using the
> fw_attributes class.
> 
> This allows users to enable or disable preformance or efficiency cores
> depending on their requirements. After change a reboot is required.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 257 ++++++++++++++++++++-
>  drivers/platform/x86/asus-armoury.h        |  28 +++
>  include/linux/platform_data/x86/asus-wmi.h |   5 +
>  3 files changed, 289 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index b1d6b0c41669..b36e19b9d2bf 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -39,13 +39,49 @@
>  #define ASUS_MINI_LED_2024_STRONG 0x01
>  #define ASUS_MINI_LED_2024_OFF    0x02
>  
> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)

Align.

> +
> +enum cpu_core_type {
> +	CPU_CORE_PERF = 0,
> +	CPU_CORE_POWER,
> +};
> +
> +enum cpu_core_value {
> +	CPU_CORE_DEFAULT = 0,
> +	CPU_CORE_MIN,
> +	CPU_CORE_MAX,
> +	CPU_CORE_CURRENT,
> +};
> +
> +#define CPU_PERF_CORE_COUNT_MIN 4
> +#define CPU_POWR_CORE_COUNT_MIN 0
> +
> +/* Tunables provided by ASUS for gaming laptops */
> +struct cpu_cores {
> +	u32 cur_perf_cores;
> +	u32 min_perf_cores;
> +	u32 max_perf_cores;
> +	u32 cur_power_cores;
> +	u32 min_power_cores;
> +	u32 max_power_cores;
> +};
> +
>  static struct asus_armoury_priv {
>  	struct device *fw_attr_dev;
>  	struct kset *fw_attr_kset;
>  
> +	struct cpu_cores *cpu_cores;
>  	u32 mini_led_dev_id;
>  	u32 gpu_mux_dev_id;
> -} asus_armoury;
> +	/*
> +	 * Mutex to prevent big/little core count changes writing to same
> +	 * endpoint at the same time. Must lock during attr store.
> +	 */
> +	struct mutex cpu_core_mutex;
> +} asus_armoury = {
> +	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex)
> +};
>  
>  struct fw_attrs_group {
>  	bool pending_reboot;
> @@ -87,6 +123,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>  static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>  {
>  	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +	       !strcmp(attr->attr.name, "cores_performance") ||
> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>  	       !strcmp(attr->attr.name, "panel_hd_mode");
>  }
>  
> @@ -165,6 +203,12 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>  	return sysfs_emit(buf, "enumeration\n");
>  }
>  
> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
>  /* Mini-LED mode **************************************************************/
>  static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>  						struct kobj_attribute *attr, char *buf)
> @@ -501,6 +545,201 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>  }
>  ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>  
> +static int init_max_cpu_cores(void)
> +{
> +	u32 cores;
> +	int err;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
> +	if (err)
> +		return err;
> +
> +	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;

Looks unnecessary?

I've a faint memory I've commented this line as well (relatively long time 
ago), I'm starting to wonder if have you perhaps missed some of my comments.

> +	asus_armoury.cpu_cores->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +	asus_armoury.cpu_cores->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
> +	if (err) {
> +		pr_err("Could not get CPU core count: error %d", err);
> +		return err;
> +	}
> +
> +	asus_armoury.cpu_cores->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +	asus_armoury.cpu_cores->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +
> +	asus_armoury.cpu_cores->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
> +	asus_armoury.cpu_cores->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
> +{
> +	u32 cores;
> +
> +	switch (core_value) {
> +	case CPU_CORE_DEFAULT:
> +	case CPU_CORE_MAX:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n",

Please use %u with u32.

> +					  asus_armoury.cpu_cores->max_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.cpu_cores->max_power_cores);
> +	case CPU_CORE_MIN:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.cpu_cores->min_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.cpu_cores->min_power_cores);
> +	default:
> +		break;
> +	}
> +
> +	if (core_type == CPU_CORE_PERF)
> +		cores = asus_armoury.cpu_cores->cur_perf_cores;
> +	else
> +		cores = asus_armoury.cpu_cores->cur_power_cores;
> +
> +	return sysfs_emit(buf, "%d\n", cores);
> +}
> +
> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					 const char *buf, enum cpu_core_type core_type)
> +{
> +	u32 new_cores, perf_cores, power_cores, out_val, min, max;
> +	int result, err;
> +
> +	result = kstrtou32(buf, 10, &new_cores);
> +	if (result)
> +		return result;
> +
> +	mutex_lock(&asus_armoury.cpu_core_mutex);
> +
> +	if (core_type == CPU_CORE_PERF) {
> +		perf_cores = new_cores;
> +		power_cores = out_val = asus_armoury.cpu_cores->cur_power_cores;

Please assign out_val separately, perhaps as the last line of this block.

> +		min = asus_armoury.cpu_cores->min_perf_cores;
> +		max = asus_armoury.cpu_cores->max_perf_cores;
> +	} else {
> +		perf_cores = asus_armoury.cpu_cores->cur_perf_cores;
> +		power_cores = out_val = new_cores;

Ditto.

> +		min = asus_armoury.cpu_cores->min_power_cores;
> +		max = asus_armoury.cpu_cores->max_power_cores;
> +	}
> +
> +	if (new_cores < min || new_cores > max) {
> +		mutex_unlock(&asus_armoury.cpu_core_mutex);
> +		return -EINVAL;
> +	}

All the above do is to read into local variables and perform some checks, 
so why they need to be protected by yhe mutex?

> +
> +	out_val = 0;

Eh, you're overwriting out_val here so why it was set above?

> +	out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
> +	out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);

You can just combine all these into:

	outval = FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) |
		 FIELD_PREP(...);

> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
> +
> +	if (err) {

No empty lines in between func and its error handling.

> +		pr_warn("Failed to set CPU core count: %d\n", err);
> +		mutex_unlock(&asus_armoury.cpu_core_mutex);

If you ever need to do separate unlocks while handling errors, it's very 
strong hint you should use guard() or scoped_guard() instead. So please 
use scoped_guard().

> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
> +		mutex_unlock(&asus_armoury.cpu_core_mutex);
> +		return -EIO;
> +	}
> +
> +	pr_info("CPU core count changed, reboot required\n");
> +	mutex_unlock(&asus_armoury.cpu_core_mutex);

No need to protect pr_info() with the mutex.

What is expected after this on the show side for current values? Should 
they be updated too so that the show function shows the updated value for 
current # of cores?

> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +	asus_set_reboot_and_signal_event();
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
> +						    struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
> +						    struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
> +						     struct kobj_attribute *attr,
> +						     const char *buf, size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> +		    "Set the max available performance cores");
> +
> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
> +						    struct kobj_attribute *attr, const char *buf,
> +						    size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> +		    "Set the max available efficiency cores");
> +
>  /* Simple attribute creation */
>  ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
>  		       "Show the current mode of charging");
> @@ -522,6 +761,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>  	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>  
>  	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>  	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> @@ -625,6 +866,7 @@ static int asus_fw_attr_add(void)
>  static int __init asus_fw_init(void)
>  {
>  	char *wmi_uid;
> +	int err;
>  
>  	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>  	if (!wmi_uid)
> @@ -637,6 +879,19 @@ static int __init asus_fw_init(void)
>  	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>  		return -ENODEV;
>  
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX)) {
> +		asus_armoury.cpu_cores = kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
> +		if (!asus_armoury.cpu_cores)
> +			return -ENOMEM;
> +
> +		err = init_max_cpu_cores();
> +		if (err) {
> +			kfree(asus_armoury.cpu_cores);

Why is the alloc/freeing handled here, and not in init_max_cpu_cores() ?

> +			pr_err("Could not initialise CPU core control %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	return asus_fw_attr_add();
>  }
>  
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 42c8171e5d8a..584a75df113d 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -162,4 +162,32 @@
>  		.name = _fsname, .attrs = _attrname##_attrs			\
>  	}
>  
> +/* CPU core attributes need a little different in setup */
> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
> +	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
> +	static struct kobj_attribute attr_##_attrname##_current_value =	\
> +		__ASUS_ATTR_RW(_attrname, current_value);		\
> +	static struct kobj_attribute attr_##_attrname##_default_value = \
> +		__ASUS_ATTR_RO(_attrname, default_value);		\
> +	static struct kobj_attribute attr_##_attrname##_min_value =	\
> +		__ASUS_ATTR_RO(_attrname, min_value);			\
> +	static struct kobj_attribute attr_##_attrname##_max_value =	\
> +		__ASUS_ATTR_RO(_attrname, max_value);			\
> +	static struct kobj_attribute attr_##_attrname##_type =		\
> +		__ASUS_ATTR_RO_AS(type, int_type_show);			\
> +	static struct attribute *_attrname##_attrs[] = {		\
> +		&attr_##_attrname##_current_value.attr,			\
> +		&attr_##_attrname##_default_value.attr,			\
> +		&attr_##_attrname##_min_value.attr,			\
> +		&attr_##_attrname##_max_value.attr,			\
> +		&attr_##_attrname##_scalar_increment.attr,		\
> +		&attr_##_attrname##_display_name.attr,			\
> +		&attr_##_attrname##_type.attr,				\
> +		NULL							\
> +	};								\
> +	static const struct attribute_group _attrname##_attr_group = {	\
> +		.name = _fsname, .attrs = _attrname##_attrs		\
> +	}
> +
>  #endif /* _ASUS_ARMOURY_H_ */
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index f3494a9efea7..e735f35b423c 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -137,6 +137,11 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> +#define ASUS_WMI_DEVID_CORES		0x001200D2
> + /* Maximum Intel E-core and P-core availability */
> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
> +
>  #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>  
>  /* gpu mux switch, 0 = dGPU, 1 = Optimus */
> 

-- 
 i.

