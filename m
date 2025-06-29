Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC5E49641;
	Sun, 29 Jun 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216956; cv=none; b=VgGrjOVHoge0I9QQD7g2MgJqcs2QZJzaQMNdehpEjJyFLJ+MvMbzRztOYlLWaQuKOQnavIuUx4xgAkPTck4LaxisdUDQTxy2IGy1FtL0iPPI8ujeChJWdbKobCgBv3N+QQKiXUMO6REG/1hsmUU1rphN1iPD6/B1YEN5fz2Jtuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216956; c=relaxed/simple;
	bh=0E+UMIuKXNPoSO37m3+8g502FY/EXrwdo5prtjLg+Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG7ID1cyXqMcMqkh7Eu0Cjj5MDtT3/3xd4BCieNQEcXFdISZCrsnEHPGN2tuCliINUJYPm4a/0+VPryNbxdc2iTNFmvEo1Pd/6bqOiA6EW6ZY0dH5Wq1GtMCpbrRcOfY8Atbqr80fnit9cGckEFd7kFtF2GQLVTUgWFEMvZJzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/WzF1o7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/WzF1o7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751216955; x=1782752955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0E+UMIuKXNPoSO37m3+8g502FY/EXrwdo5prtjLg+Wo=;
  b=X/WzF1o7IuagE4b9cS577/cr9A13bRRriJbhAuDajEy7BMqB8rJTrUXY
   UeuoFfUpHo1sy52+y+VON9UFQWZNQGCmga8aCvtIB+BtWwr7EFC0fPl4I
   zHSutyYCjr/2/uNtcrIuWHUUww1eo2IeUxBZ8UfI21aC9jC9KdFoYKmJg
   FnKOH8HpqOmAqe4hStqJ2i9oNHrLS5G1019VCBHpCJuks5QBb4nZMVqjM
   oeZ/jqONnAEi/rgcow52Fw8iSRjYForrZSoyEHSHSej48hmhdholfh4s6
   OLlwWVaQcejcxOyX70Ux6Sqxw9TXKWHrZnne2UyR8xM8KUO/44d26++DE
   Q==;
X-CSE-ConnectionGUID: tbqkR0ZKQ9CEhY1R+Byk5g==
X-CSE-MsgGUID: qd8NCyHPQqKR5emi4rC0RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52566308"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="52566308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 10:09:14 -0700
X-CSE-ConnectionGUID: /o9zEQE9RyWsc0hi/0remg==
X-CSE-MsgGUID: tQPXDiLWT6SQaNdN1si9Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="153441399"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2025 10:09:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVvWf-000Y6E-2Z;
	Sun, 29 Jun 2025 17:09:09 +0000
Date: Mon, 30 Jun 2025 01:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Denis Benato <benato.denis96@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com, "Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v9 1/8] platform/x86: asus-wmi: export symbols used for
 read/write WMI
Message-ID: <202506300004.OWO7f60c-lkp@intel.com>
References: <20250629131423.9013-2-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629131423.9013-2-benato.denis96@gmail.com>

Hi Denis,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denis-Benato/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20250629-211651
base:   linus/master
patch link:    https://lore.kernel.org/r/20250629131423.9013-2-benato.denis96%40gmail.com
patch subject: [PATCH v9 1/8] platform/x86: asus-wmi: export symbols used for read/write WMI
config: arc-randconfig-002-20250629 (https://download.01.org/0day-ci/archive/20250630/202506300004.OWO7f60c-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300004.OWO7f60c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300004.OWO7f60c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-asus.c:29:
>> include/linux/platform_data/x86/asus-wmi.h:187:19: error: redefinition of 'asus_wmi_set_devstate'
     187 | static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_data/x86/asus-wmi.h:179:19: note: previous definition of 'asus_wmi_set_devstate' with type 'int(u32,  u32,  u32 *)' {aka 'int(unsigned int,  unsigned int,  unsigned int *)'}
     179 | static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
         |                   ^~~~~~~~~~~~~~~~~~~~~


vim +/asus_wmi_set_devstate +187 include/linux/platform_data/x86/asus-wmi.h

   165	
   166	#if IS_REACHABLE(CONFIG_ASUS_WMI)
   167	void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
   168	void set_ally_mcu_powersave(bool enabled);
   169	int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
   170	int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
   171	int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
   172	#else
   173	static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
   174	{
   175	}
   176	static inline void set_ally_mcu_powersave(bool enabled)
   177	{
   178	}
   179	static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
   180	{
   181		return -ENODEV;
   182	}
   183	static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
   184	{
   185		return -ENODEV;
   186	}
 > 187	static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
   188	{
   189		return -ENODEV;
   190	}
   191	static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
   192						   u32 *retval)
   193	{
   194		return -ENODEV;
   195	}
   196	#endif
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
