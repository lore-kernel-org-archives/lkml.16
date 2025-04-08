Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09321DEFEC;
	Tue,  8 Apr 2025 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123182; cv=none; b=M6Ub3fEN4T9/1GuTi9QdYV99WKqVeCnF332NpMuD2zIrix/LBIjm0afQa+stjz5Ko0aqigVcA5OWdxlHMN6M7g34MCuuJ8X2zd4vqG6iebkEIlj9Uks6F31m1tSlhghmbGneMwcCUd8XoIz3xKCdtTTr83zNzUw+21vXG3sVAoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123182; c=relaxed/simple;
	bh=9H+Ib4+rsLrbbYdqWrXXBF5C2nacvziAipgcDeTaPbQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gXC2LLte0c5BUX/+UE08yzrEr2auou56/gbSNUBlU5cMG8nFq++/RWyOvtnxQW7t+IsU+SXgmGM+L/YEHe5+S47Tod+ExohsJ4NJwnGBHr6JBGiPiIS5IdQLe5DfjMkIDgHDwdNunW1p8IEqffCUQWZ7xd28M9pZaHFvpYBnlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPbvgkG9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPbvgkG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123180; x=1775659180;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9H+Ib4+rsLrbbYdqWrXXBF5C2nacvziAipgcDeTaPbQ=;
  b=fPbvgkG9l9mdZYqnRiM9SC8d2MqeFRjK78DCRQCp2wLzYIsz3Tq2dQfd
   PSmGr7y7Vz453fAyq6LhkExA22S7pUI88RXN55B2TA04ul3NU2ulK2u1S
   jYCQiduvhZszfl5+buGfMuAlYQW6JaIa5iIGV5kL3AJwKJubkqwlpcd53
   LuGBcXmma1N3q+iOl0MS9OfjbOSnptxygSw0nJ2tpN5Ur96hUIwetMb6s
   uEl7epfov7ymzIkAqGyZ4MrYXa6LgSVPJH8gfxue50hLtsEzOU2XPfcbP
   NrS4uXFiSAo97q0MUafFZd5rmp2du/thjX6jtpPF+Kals0hSdHnRDwOdG
   A==;
X-CSE-ConnectionGUID: FKb6MSEeS761KGTadtiahA==
X-CSE-MsgGUID: jJQv3AK5SUiVBAG1XOkCAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56929831"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56929831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:39:40 -0700
X-CSE-ConnectionGUID: zQwp82EySTeUQPcautPRvQ==
X-CSE-MsgGUID: 6pWaQVYqR16+NHDTXvKczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128274873"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:39:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 17:39:33 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v8 7/8] platform/x86: asus-wmi: deprecate bios features
In-Reply-To: <20250319065827.53478-8-luke@ljones.dev>
Message-ID: <541182f7-6afc-b7ea-9538-ffb21d78a3dd@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-8-luke@ljones.dev>
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
> With the existence of the asus-armoury module the attributes no-longer

no longer

-- 
 i.

> need to live under the /sys/devices/platform/asus-nb-wmi/ path.
> 
> Deprecate all those that were implemented in asus-bioscfg with the goal
> of removing them fully in the next LTS cycle.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       |  17 +++
>  drivers/platform/x86/Kconfig                  |  11 ++
>  drivers/platform/x86/asus-wmi.c               | 121 ++++++++++++++----
>  3 files changed, 124 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 28144371a0f1..765d50b0d9df 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -63,6 +63,7 @@ Date:		Aug 2022
>  KernelVersion:	6.1
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Switch the GPU hardware MUX mode. Laptops with this feature can
>  		can be toggled to boot with only the dGPU (discrete mode) or in
>  		standard Optimus/Hybrid mode. On switch a reboot is required:
> @@ -75,6 +76,7 @@ Date:		Aug 2022
>  KernelVersion:	5.17
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Disable discrete GPU:
>  			* 0 - Enable dGPU,
>  			* 1 - Disable dGPU
> @@ -84,6 +86,7 @@ Date:		Aug 2022
>  KernelVersion:	5.17
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Enable the external GPU paired with ROG X-Flow laptops.
>  		Toggling this setting will also trigger ACPI to disable the dGPU:
>  
> @@ -95,6 +98,7 @@ Date:		Aug 2022
>  KernelVersion:	5.17
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Enable an LCD response-time boost to reduce or remove ghosting:
>  			* 0 - Disable,
>  			* 1 - Enable
> @@ -104,6 +108,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Get the current charging mode being used:
>  			* 1 - Barrel connected charger,
>  			* 2 - USB-C charging
> @@ -114,6 +119,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Show if the egpu (XG Mobile) is correctly connected:
>  			* 0 - False,
>  			* 1 - True
> @@ -123,6 +129,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Change the mini-LED mode:
>  			* 0 - Single-zone,
>  			* 1 - Multi-zone
> @@ -133,6 +140,7 @@ Date:		Apr 2024
>  KernelVersion:	6.10
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		List the available mini-led modes.
>  
>  What:		/sys/devices/platform/<platform>/ppt_pl1_spl
> @@ -140,6 +148,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the Package Power Target total of CPU: PL1 on Intel, SPL on AMD.
>  		Shown on Intel+Nvidia or AMD+Nvidia based systems:
>  
> @@ -150,6 +159,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the Slow Package Power Tracking Limit of CPU: PL2 on Intel, SPPT,
>  		on AMD. Shown on Intel+Nvidia or AMD+Nvidia based systems:
>  
> @@ -160,6 +170,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the Fast Package Power Tracking Limit of CPU. AMD+Nvidia only:
>  			* min=5, max=250
>  
> @@ -168,6 +179,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the APU SPPT limit. Shown on full AMD systems only:
>  			* min=5, max=130
>  
> @@ -176,6 +188,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the platform SPPT limit. Shown on full AMD systems only:
>  			* min=5, max=130
>  
> @@ -184,6 +197,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the dynamic boost limit of the Nvidia dGPU:
>  			* min=5, max=25
>  
> @@ -192,6 +206,7 @@ Date:		Jun 2023
>  KernelVersion:	6.5
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set the target temperature limit of the Nvidia dGPU:
>  			* min=75, max=87
>  
> @@ -200,6 +215,7 @@ Date:		Apr 2024
>  KernelVersion:	6.10
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set if the BIOS POST sound is played on boot.
>  			* 0 - False,
>  			* 1 - True
> @@ -209,6 +225,7 @@ Date:		Apr 2024
>  KernelVersion:	6.10
>  Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
> +        DEPRECATED, WILL BE REMOVED SOON
>  		Set if the MCU can go in to low-power mode on system sleep
>  			* 0 - False,
>  			* 1 - True
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 294364cc7478..7edab99d3ae9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -301,6 +301,17 @@ config ASUS_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called asus-wmi.
>  
> +config ASUS_WMI_DEPRECATED_ATTRS
> +	bool "BIOS option support in WMI platform (DEPRECATED)"
> +	depends on ASUS_WMI
> +	default y
> +	help
> +	  Say Y to expose the configurable BIOS options through the asus-wmi
> +	  driver.
> +
> +	  This can be used with or without the asus-armoury driver which
> +	  has the same attributes, but more, and better features.
> +
>  config ASUS_NB_WMI
>  	tristate "Asus Notebook WMI Driver"
>  	depends on ASUS_WMI
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e2ac3f20760a..ccaa06352d53 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -335,6 +335,13 @@ struct asus_wmi {
>  /* Global to allow setting externally without requiring driver data */
>  static bool use_ally_mcu_hack;
>  
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> +static void asus_wmi_show_deprecated(void)
> +{
> +	pr_notice_once("Accessing attributes through /sys/bus/platform/asus_wmi is deprecated and will be removed in a future release. Please switch over to /sys/class/firmware_attributes.\n");
> +}
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> +
>  /* WMI ************************************************************************/
>  
>  static int asus_wmi_evaluate_method3(u32 method_id,
> @@ -726,6 +733,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  }
>  
>  /* Charging mode, 1=Barrel, 2=USB ******************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t charge_mode_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -736,12 +744,16 @@ static ssize_t charge_mode_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", value & 0xff);
>  }
>  
>  static DEVICE_ATTR_RO(charge_mode);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* dGPU ********************************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t dgpu_disable_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -752,6 +764,8 @@ static ssize_t dgpu_disable_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -805,8 +819,10 @@ static ssize_t dgpu_disable_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(dgpu_disable);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* eGPU ********************************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t egpu_enable_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -817,6 +833,8 @@ static ssize_t egpu_enable_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -873,8 +891,10 @@ static ssize_t egpu_enable_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(egpu_enable);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Is eGPU connected? *********************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t egpu_connected_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -885,12 +905,16 @@ static ssize_t egpu_connected_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
>  static DEVICE_ATTR_RO(egpu_connected);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* gpu mux switch *************************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t gpu_mux_mode_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> @@ -901,6 +925,8 @@ static ssize_t gpu_mux_mode_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -959,6 +985,7 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(gpu_mux_mode);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* TUF Laptop Keyboard RGB Modes **********************************************/
>  static ssize_t kbd_rgb_mode_store(struct device *dev,
> @@ -1082,6 +1109,7 @@ static const struct attribute_group *kbd_rgb_mode_groups[] = {
>  };
>  
>  /* Tunable: PPT: Intel=PL1, AMD=SPPT *****************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t ppt_pl2_sppt_store(struct device *dev,
>  				    struct device_attribute *attr,
>  				    const char *buf, size_t count)
> @@ -1120,6 +1148,8 @@ static ssize_t ppt_pl2_sppt_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->ppt_pl2_sppt);
>  }
>  static DEVICE_ATTR_RW(ppt_pl2_sppt);
> @@ -1162,6 +1192,8 @@ static ssize_t ppt_pl1_spl_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->ppt_pl1_spl);
>  }
>  static DEVICE_ATTR_RW(ppt_pl1_spl);
> @@ -1205,6 +1237,8 @@ static ssize_t ppt_fppt_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->ppt_fppt);
>  }
>  static DEVICE_ATTR_RW(ppt_fppt);
> @@ -1248,6 +1282,8 @@ static ssize_t ppt_apu_sppt_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->ppt_apu_sppt);
>  }
>  static DEVICE_ATTR_RW(ppt_apu_sppt);
> @@ -1291,6 +1327,8 @@ static ssize_t ppt_platform_sppt_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->ppt_platform_sppt);
>  }
>  static DEVICE_ATTR_RW(ppt_platform_sppt);
> @@ -1334,6 +1372,8 @@ static ssize_t nv_dynamic_boost_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->nv_dynamic_boost);
>  }
>  static DEVICE_ATTR_RW(nv_dynamic_boost);
> @@ -1377,9 +1417,12 @@ static ssize_t nv_temp_target_show(struct device *dev,
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%u\n", asus->nv_temp_target);
>  }
>  static DEVICE_ATTR_RW(nv_temp_target);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Ally MCU Powersave ********************************************************/
>  
> @@ -1420,6 +1463,7 @@ void set_ally_mcu_powersave(bool enabled)
>  }
>  EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
>  
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t mcu_powersave_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -1430,6 +1474,8 @@ static ssize_t mcu_powersave_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -1465,6 +1511,7 @@ static ssize_t mcu_powersave_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(mcu_powersave);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Battery ********************************************************************/
>  
> @@ -2338,6 +2385,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  }
>  
>  /* Panel Overdrive ************************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t panel_od_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -2348,6 +2396,8 @@ static ssize_t panel_od_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -2384,9 +2434,10 @@ static ssize_t panel_od_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(panel_od);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Bootup sound ***************************************************************/
> -
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t boot_sound_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -2397,6 +2448,8 @@ static ssize_t boot_sound_show(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", result);
>  }
>  
> @@ -2432,8 +2485,10 @@ static ssize_t boot_sound_store(struct device *dev,
>  	return count;
>  }
>  static DEVICE_ATTR_RW(boot_sound);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Mini-LED mode **************************************************************/
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t mini_led_mode_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -2464,6 +2519,8 @@ static ssize_t mini_led_mode_show(struct device *dev,
>  		}
>  	}
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
> @@ -2534,10 +2591,13 @@ static ssize_t available_mini_led_mode_show(struct device *dev,
>  		return sysfs_emit(buf, "0 1 2\n");
>  	}
>  
> +	asus_wmi_show_deprecated();
> +
>  	return sysfs_emit(buf, "0\n");
>  }
>  
>  static DEVICE_ATTR_RO(available_mini_led_mode);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Quirks *********************************************************************/
>  
> @@ -3825,6 +3885,7 @@ static int throttle_thermal_policy_set_default(struct asus_wmi *asus)
>  	return throttle_thermal_policy_write(asus);
>  }
>  
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t throttle_thermal_policy_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -3868,6 +3929,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
>   * Throttle thermal policy: 0 - default, 1 - overboost, 2 - silent
>   */
>  static DEVICE_ATTR_RW(throttle_thermal_policy);
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* Platform profile ***********************************************************/
>  static int asus_wmi_platform_profile_get(struct device *dev,
> @@ -4469,27 +4531,29 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_camera.attr,
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
> -	&dev_attr_charge_mode.attr,
> -	&dev_attr_egpu_enable.attr,
> -	&dev_attr_egpu_connected.attr,
> -	&dev_attr_dgpu_disable.attr,
> -	&dev_attr_gpu_mux_mode.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
> -	&dev_attr_throttle_thermal_policy.attr,
> -	&dev_attr_ppt_pl2_sppt.attr,
> -	&dev_attr_ppt_pl1_spl.attr,
> -	&dev_attr_ppt_fppt.attr,
> -	&dev_attr_ppt_apu_sppt.attr,
> -	&dev_attr_ppt_platform_sppt.attr,
> -	&dev_attr_nv_dynamic_boost.attr,
> -	&dev_attr_nv_temp_target.attr,
> -	&dev_attr_mcu_powersave.attr,
> -	&dev_attr_boot_sound.attr,
> -	&dev_attr_panel_od.attr,
> -	&dev_attr_mini_led_mode.attr,
> -	&dev_attr_available_mini_led_mode.attr,
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> +		&dev_attr_charge_mode.attr,
> +		&dev_attr_egpu_enable.attr,
> +		&dev_attr_egpu_connected.attr,
> +		&dev_attr_dgpu_disable.attr,
> +		&dev_attr_gpu_mux_mode.attr,
> +		&dev_attr_ppt_pl2_sppt.attr,
> +		&dev_attr_ppt_pl1_spl.attr,
> +		&dev_attr_ppt_fppt.attr,
> +		&dev_attr_ppt_apu_sppt.attr,
> +		&dev_attr_ppt_platform_sppt.attr,
> +		&dev_attr_nv_dynamic_boost.attr,
> +		&dev_attr_nv_temp_target.attr,
> +		&dev_attr_mcu_powersave.attr,
> +		&dev_attr_boot_sound.attr,
> +		&dev_attr_panel_od.attr,
> +		&dev_attr_mini_led_mode.attr,
> +		&dev_attr_available_mini_led_mode.attr,
> +		&dev_attr_throttle_thermal_policy.attr,
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  	NULL
>  };
>  
> @@ -4511,7 +4575,11 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
>  	else if (attr == &dev_attr_als_enable.attr)
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
> -	else if (attr == &dev_attr_charge_mode.attr)
> +	else if (attr == &dev_attr_fan_boost_mode.attr)
> +		ok = asus->fan_boost_mode_available;
> +
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> +	if (attr == &dev_attr_charge_mode.attr)
>  		devid = ASUS_WMI_DEVID_CHARGE_MODE;
>  	else if (attr == &dev_attr_egpu_enable.attr)
>  		ok = asus->egpu_enable_available;
> @@ -4549,6 +4617,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->mini_led_dev_id != 0;
>  	else if (attr == &dev_attr_available_mini_led_mode.attr)
>  		ok = asus->mini_led_dev_id != 0;
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  	if (devid != -1) {
>  		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> @@ -4801,6 +4870,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	}
>  
>  	/* ensure defaults for tunables */
> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  	asus->ppt_pl2_sppt = 5;
>  	asus->ppt_pl1_spl = 5;
>  	asus->ppt_apu_sppt = 5;
> @@ -4822,17 +4892,18 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX;
>  	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX_VIVO))
>  		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
> -
> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
> -		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
> -	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
> -		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
>  		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
>  	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
>  		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
>  
> +	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
> +		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
> +	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
> +		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
> +
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
>  		goto fail_fan_boost_mode;
> 
