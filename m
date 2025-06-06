Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581621EDA16;
	Fri,  6 Jun 2025 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236248; cv=none; b=UqyQ3BODJB9jBReHDOmiSd2n0oNIm5zHF14xClDXQqZPQIvuf3xgwcdABSrjC+Mq1RzCVR+3ziC4NYmR/Zdw/vyoQLfUVN9QXiR3nttkO9yrV6rie3/9X9v/FSV59va5FkL6PIrEvhAMOo96nHCKEQkQdS3cZ6rBPd1KmBo/pZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236248; c=relaxed/simple;
	bh=b5AmpCo1kMui/WXfal3d4wLBANr1weUX6ZU1bk956tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxeicFl5PbcYbG9mW5xDj/ey6G4sZw/79ebMVPXPYcfxcbhMPV//iXo8dZjtRnQZAtW+X/lI2qmbWRWbd1uaSU8qjCmAVOyk2f7H02zQJjOnCH7pHeLTbbSLYojvJCqGUrI5dvrt8Zs3ruRooG9eItki4rKGnUtvtjptLwvj65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9lmz4U7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9lmz4U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749236246; x=1780772246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5AmpCo1kMui/WXfal3d4wLBANr1weUX6ZU1bk956tk=;
  b=m9lmz4U7AmW60DK2pwYGF0AuExWkNvaE5enavIHCUtdvMDqFhOJ5zknY
   zQ/HgRYmwnARbsEPPXmw4Ps8Ei27ygo8ho6IPiMbIzlP6DN/T9gFc7BcP
   ymri/mcNLDc19PvTg1i5pJW8NSwaJjZrTCN/ceS1Ej1W5/5tD+3p4UHtM
   Kz/2PbI1sJjn5llGAENCNRGno+3Q14MyfMLcOqCG2H/zNb7v0MLJiA7+5
   8x4X/FDzhKCmbRG/IwdmsEJW19SDNpgB/Nu1zote3BKOB6Im8UgGpWrKp
   6rBr8m/vdg7I6vGA080oT7f9iXLSQu5kDOnEPssv0gl+uj5AKTH0tDjPY
   g==;
X-CSE-ConnectionGUID: mEMY9nV9SceN6F6eySsY3w==
X-CSE-MsgGUID: FZN26L1AR0ihGmEwSwfumg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62053469"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="62053469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:57:25 -0700
X-CSE-ConnectionGUID: /W+N2OtEQr2YuJrYP4Vf9g==
X-CSE-MsgGUID: 7zWk+uBlTPm38LVnfrr8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="176850699"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:57:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNcFh-00000004HrB-1PO2;
	Fri, 06 Jun 2025 21:57:17 +0300
Date: Fri, 6 Jun 2025 21:57:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEM6Da6CZ0DI3x8w@smile.fi.intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <202506062319.F0IpDxF6-lkp@intel.com>
 <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jun 06, 2025 at 01:30:25PM -0400, Mark Pearson wrote:
> On Fri, Jun 6, 2025, at 11:58 AM, kernel test robot wrote:
> > Hi Mark,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on next-20250606]
> > [cannot apply to v6.15]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    
> > https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Move-Lenovo-files-into-lenovo-subdir/20250605-013934
> > base:   linus/master
> > patch link:    
> > https://lore.kernel.org/r/20250604173702.3025074-1-mpearson-lenovo%40squebb.ca
> > patch subject: [PATCH v2] platform/x86: Move Lenovo files into lenovo 
> > subdir
> > config: x86_64-randconfig-078-20250606 
> > (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): 
> > (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new 
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: 
> > https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/platform/x86/lenovo/think-lmi.c: In function 'certificate_store':
> >>> drivers/platform/x86/lenovo/think-lmi.c:661:47: warning: '%s' directive argument is null [-Wformat-overflow=]
> >      661 |                 return kasprintf(GFP_KERNEL, "%s,%s", arg1, 
> > arg2);
> >          |                                               ^~
> >    drivers/platform/x86/lenovo/think-lmi.c:657:50: warning: '%s' 
> > directive argument is null [-Wformat-overflow=]
> >      657 |                 return kasprintf(GFP_KERNEL, "%s,%s,%s",
> >          |                                                  ^~
> >
> >
> > vim +661 drivers/platform/x86/lenovo/think-lmi.c
> >
> > 640a5fa50a42b9 drivers/platform/x86/think-lmi.c Mark Pearson 2021-11-17 
> >  652  
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  653  static char *cert_command(struct tlmi_pwd_setting *setting, const 
> > char *arg1, const char *arg2)
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  654  {
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  655  	/* Prepend with SVC or SMC if multicert supported */
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  656  	if (tlmi_priv.pwdcfg.core.password_mode >= 
> > TLMI_PWDCFG_MODE_MULTICERT)
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  657  		return kasprintf(GFP_KERNEL, "%s,%s,%s",
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  658  				 setting == tlmi_priv.pwd_admin ? "SVC" : "SMC",
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  659  				 arg1, arg2);
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  660  	else
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> > @661  		return kasprintf(GFP_KERNEL, "%s,%s", arg1, arg2);
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  662  }
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  663  
> >
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> I'm unable to reproduce this issue with a W=1 build

Do you have GCC-12?

> and I think it's a false positive.

I think the problematic line is in certificate_store().
You need to check the value of dmi_get_system_info().
Or make sure the DMI is always selected (depend on DMI
in Kconfig, perhaps).

> Am I safe to ignore this report?

Please, try to fix it.

-- 
With Best Regards,
Andy Shevchenko


