Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B043224893;
	Thu,  8 May 2025 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741236; cv=none; b=mpzCckJNByEuqBs6PM22j6W0OqncmZEkcTHHCib29e0NJYLXqjsafWY5NTZMWV7Nj3lu1fzy0qm0x3XenQxW5kwAjaxG5pRsTHrjSImuPT1HNq+t/5L2VfkO3ZjMjU58b4CXeSBcGV6XhkD7CyoKOLh7jUXBwrjQNEy7RjsIbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741236; c=relaxed/simple;
	bh=8TstHJfVVJia44BPhsIMv3XGy+QhNfo4K77VkKRGC1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzr1aOaghXifmX+Ur+k2eVhP/aZMBnQZxv9BznkkTgovakdArGhP5JDxhBSzsVP+HxSXWPBxCBWFF2TuAci6gc+fKkvu995irk2wc9V0oDTfUQjEkqGA8P8ocoDu94gNPKTF/lGV/FZtnOrbgRrKM7lpVFI86O/vSpd0igX5HbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdtwoJe3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdtwoJe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746741235; x=1778277235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TstHJfVVJia44BPhsIMv3XGy+QhNfo4K77VkKRGC1Y=;
  b=gdtwoJe3uM1DbkNKGO5p1LfMwuuKQ9NUrCaNp79y65L05knDca8AuSoi
   GDowUT+qDptwakvwbhcDh4hS0ElK3613ai69E5V6ykAKhRw8Fgftvzd8n
   qx7je8Vb/ZziAmQ8/NIrzclLEeSu+CbxqfjzIH3ywY3kaytZCbtD6AwLo
   U3e5P5TRRwXu3xebKPAI1i6bMlE9mU9+WvAPdkzpT6HpzZINJ09qNNkQQ
   CNHpBQcQkfGu1MqPT/pFwqwwb9AXSTQIfLIe7k3hoHAGfWugjQAONbTFQ
   ECtGsUhQGAx1faI2ZespjbO4YFF+1loWadSyp4YX9FHrLNrd3vrB5Ott4
   Q==;
X-CSE-ConnectionGUID: f3O4Cy9PTjKYbdEgSZUnSg==
X-CSE-MsgGUID: D+VXh7p3SOGzgymD27jLLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48699953"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48699953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:53:54 -0700
X-CSE-ConnectionGUID: 5lkXgYtJQ/uXfQg9CAH/og==
X-CSE-MsgGUID: Onyfg4KISKauL5JZHoNrnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="167497670"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2025 14:53:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9Bb-000BPD-36;
	Thu, 08 May 2025 21:53:47 +0000
Date: Fri, 9 May 2025 05:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v8 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
Message-ID: <202505090501.4WrdCVBb-lkp@intel.com>
References: <20250505010659.1450984-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505010659.1450984-7-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-Add-lenovo-wmi-driver-Documentation/20250505-123422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20250505010659.1450984-7-derekjohn.clark%40gmail.com
patch subject: [PATCH v8 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
config: i386-randconfig-r133-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090501.4WrdCVBb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090501.4WrdCVBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090501.4WrdCVBb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/lenovo-wmi-gamezone.c:128:38: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/x86/lenovo-wmi-gamezone.c:142:38: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/x86/lenovo-wmi-gamezone.c:155:12: sparse: sparse: context imbalance in 'lwmi_gz_profile_get' - different lock contexts for basic block
   drivers/platform/x86/lenovo-wmi-gamezone.c:206:12: sparse: sparse: context imbalance in 'lwmi_gz_profile_set' - different lock contexts for basic block

vim +128 drivers/platform/x86/lenovo-wmi-gamezone.c

fc3651e7b6ebda Derek J. Clark 2025-05-04  115  
fc3651e7b6ebda Derek J. Clark 2025-05-04  116  /**
fc3651e7b6ebda Derek J. Clark 2025-05-04  117   * lwmi_gz_thermal_mode_supported() - Get the version of the WMI
fc3651e7b6ebda Derek J. Clark 2025-05-04  118   * interface to determine the support level.
fc3651e7b6ebda Derek J. Clark 2025-05-04  119   * @wdev: The Gamezone WMI device.
fc3651e7b6ebda Derek J. Clark 2025-05-04  120   * @supported: Pointer to return the support level with.
fc3651e7b6ebda Derek J. Clark 2025-05-04  121   *
fc3651e7b6ebda Derek J. Clark 2025-05-04  122   * Return: 0 on success, or an error code.
fc3651e7b6ebda Derek J. Clark 2025-05-04  123   */
fc3651e7b6ebda Derek J. Clark 2025-05-04  124  static int lwmi_gz_thermal_mode_supported(struct wmi_device *wdev,
fc3651e7b6ebda Derek J. Clark 2025-05-04  125  					  int *supported)
fc3651e7b6ebda Derek J. Clark 2025-05-04  126  {
fc3651e7b6ebda Derek J. Clark 2025-05-04  127  	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUP,
fc3651e7b6ebda Derek J. Clark 2025-05-04 @128  				     0, 0, supported);
fc3651e7b6ebda Derek J. Clark 2025-05-04  129  }
fc3651e7b6ebda Derek J. Clark 2025-05-04  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
