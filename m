Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017662571BA;
	Mon, 30 Jun 2025 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278661; cv=none; b=X3NqW+5twUrETPYW4YAri57yjysba5uZyt2LgJSnn2bPbsIGUPyxxldUAQy0xM6+mi2Cn232/GAC9OzYBCROVm+v5QevsawUzdL7oscmmeUwHactv1DLuFyyxrZeibDihxZ32qaH/D79IZLNnF+AdZz7NQChbPR2K3XeBmfXZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278661; c=relaxed/simple;
	bh=FMzYZdN0CVSDrQcPpDssp4Fk46VjMQYnmJcIyo2Pv88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu92ZPmPir2HlslYZF5J4cIfGGADy1OUESehrbf9lYdgUYAecB46xwqDMkuiYdO6Ib+sBpyBllt9QbBPm6NAXEgWy2mIqwcLY8dlArTgaos9wLQOTCNApAGjjohC5IVcnBvLb5ZBEsAVgB4hYY3BbihlX8Xr2pUbkZpnbxxDFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnwnVxm9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnwnVxm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278660; x=1782814660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FMzYZdN0CVSDrQcPpDssp4Fk46VjMQYnmJcIyo2Pv88=;
  b=bnwnVxm9W33bZuDCymD6QNjbgFoqbjdXlLwaSGiLmr5Rx65ym+MQ/T1V
   kLFiQKxPlGG8xnWx0Lf5xfc44NiUS3/KpZDuF2SXBgUvnaDk0AO1JjBjm
   qJK8wRy+HSAG3hr4wKMWJ/mfP2O0o0T2dxZd2523/WdaGtCgPULwFFlkF
   maAY1HjiXPshFHIr3z8aPE7ZAjvECbHfbIIPyvNST4QwZ8xZ10C7MTxOi
   19yEAI5NkqIHKfzjRJAsjTrCYNuMkHQHMEgSJSVxCvHE7oW7TFlobS1Yo
   Htxc7vjhaV4Tuk8Hja9qX4TLvH8ZGFLUbX8WzYRd66j7vsi/DUOITC56K
   Q==;
X-CSE-ConnectionGUID: MCap1GKzQOW8wA8RZ9gaWw==
X-CSE-MsgGUID: aTwO9DOnT5u2B0I5RDPziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53461291"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53461291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:17:39 -0700
X-CSE-ConnectionGUID: PptX8rtzSfyzmgvDLcTnAg==
X-CSE-MsgGUID: pp065EF/QjetrVvm5H9wVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159149271"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 03:17:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWBZu-000YmQ-1q;
	Mon, 30 Jun 2025 10:17:34 +0000
Date: Mon, 30 Jun 2025 18:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Denis Benato <benato.denis96@gmail.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>
Subject: Re: [PATCH v9 6/8] platform/x86: asus-armoury: add screen
 auto-brightness toggle
Message-ID: <202506301802.LV9RYF0b-lkp@intel.com>
References: <20250629131423.9013-7-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629131423.9013-7-benato.denis96@gmail.com>

Hi Denis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denis-Benato/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20250629-211651
base:   linus/master
patch link:    https://lore.kernel.org/r/20250629131423.9013-7-benato.denis96%40gmail.com
patch subject: [PATCH v9 6/8] platform/x86: asus-armoury: add screen auto-brightness toggle
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250630/202506301802.LV9RYF0b-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301802.LV9RYF0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301802.LV9RYF0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/asus-armoury.c:736:1: warning: unused variable 'screen_auto_brightness_attr_group' [-Wunused-const-variable]
     736 | ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     737 |                    ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     738 |                    "Set the panel brightness to Off<0> or On<1>");
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-armoury.h:128:2: note: expanded from macro 'ATTR_GROUP_BOOL_RW'
     128 |         __ATTR_RW_INT_GROUP_ENUM(_attrname, 0, 1, _wmi, _fsname, "0;1", _dispname)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-armoury.h:102:38: note: expanded from macro '__ATTR_RW_INT_GROUP_ENUM'
     102 |         static const struct attribute_group _attrname##_attr_group = {  \
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:34:1: note: expanded from here
      34 | screen_auto_brightness_attr_group
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/screen_auto_brightness_attr_group +736 drivers/platform/x86/asus-armoury.c

   708	
   709	static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
   710							    struct kobj_attribute *attr, const char *buf,
   711							    size_t count)
   712	{
   713		int err;
   714	
   715		err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
   716		if (err)
   717			return err;
   718	
   719		return count;
   720	}
   721	ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
   722			    "Set the max available efficiency cores");
   723	
   724	/* Simple attribute creation */
   725	ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
   726			       "Show the current mode of charging");
   727	
   728	ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
   729			   "Set the boot POST sound");
   730	ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
   731			   "Set MCU powersaving mode");
   732	ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
   733			   "Set the panel refresh overdrive");
   734	ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
   735			   "Set the panel HD mode to UHD<0> or FHD<1>");
 > 736	ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
   737			   ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
   738			   "Set the panel brightness to Off<0> or On<1>");
   739	ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
   740			   "Show the eGPU connection status");
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
