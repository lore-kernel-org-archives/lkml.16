Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A07263A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608484; cv=none; b=m+1HmRDV2h7v1gDgj1dI/PQ1XKmXlWfyfxYHjNteplpB4OlES8LsSiImfYXymM+1WaMs/I0jEXas+INxz55L8ImPu72oZ4jnvfK3k96zPSqiJeRVdhJLiGj7/C0DpI0M5pj27/RpXyc3yjTvPddfGLCvSXbPYcIra6Il02OykEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608484; c=relaxed/simple;
	bh=92zK43JKrNURrOQyhvSQDoyLlgYqzYkxOJINs9dvBrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPKNe/fnA0f2e/QhHPKa4/06GQuAqSsGH9kFez+rFB6BKC97TJQ7Rf8ft2HBCyRijqZ3swGV3m39YMeu45itFHZPwd4wPq5lUE/TznbDlwkJvzHvUUeDc0xpD4tml6IOps5RMDWfLG1VcQsXKCgW0PlBTp7xWeODnot92/aUDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWsf0f4Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWsf0f4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746608482; x=1778144482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92zK43JKrNURrOQyhvSQDoyLlgYqzYkxOJINs9dvBrE=;
  b=iWsf0f4Qt+OJCmAq5Lh8SiUg60wWIgXPekW3xKq8DX9eURStzqovC40V
   eVvWc/Uuyh6kNIJbSSr75yCFc5bLup1FKYcN2skFKszt6LyZREWacMl9m
   9FL6SZtuR4EyLvqFCuDy+28uTLLW7wM/Ryy5m01dbQjYHsmNkF/Fso7C2
   HMP6+PL5V5IJ57NCLF671YkwbcJaJ18TYISd+zCa72vOuNbeAii9/ghSS
   Ts0IZRG2j+jI3xm3w2rXTXmh9BqWpjSym3U/hAKYxnc7O+DfCGTD2vnHP
   Qo0LFWlK4hjMIZJ3cCKADNHlOEdlelhGTCSWC3VdtmvfuHKAn0c2fyhdy
   A==;
X-CSE-ConnectionGUID: 1vmZ1YGvRmK52EQCdZ/34w==
X-CSE-MsgGUID: eW56YEIVRRygsfc534TVxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73716009"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="73716009"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:01:22 -0700
X-CSE-ConnectionGUID: 8WQe1olIQBWUw6YcxHy67A==
X-CSE-MsgGUID: e8OWlXHRT1qne2vq3HgY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135797169"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 02:01:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaeT-0007SG-1i;
	Wed, 07 May 2025 09:01:17 +0000
Date: Wed, 7 May 2025 17:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>, dhowells@redhat.com,
	netfs@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Max Kellermann <max.kellermann@ionos.com>
Subject: Re: [PATCH 1/4] fs/netfs: convert `netfs_io_request.error` to a
 `short
Message-ID: <202505071602.yJrZsTiu-lkp@intel.com>
References: <20250428154859.3228933-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428154859.3228933-1-max.kellermann@ionos.com>

Hi Max,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Kellermann/fs-netfs-reorderd-struct-fields-to-eliminate-holes/20250428-235058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250428154859.3228933-1-max.kellermann%40ionos.com
patch subject: [PATCH 1/4] fs/netfs: convert `netfs_io_request.error` to a `short
config: sparc-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250507/202505071602.yJrZsTiu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071602.yJrZsTiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071602.yJrZsTiu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__cmpxchg_called_with_bad_pointer" [fs/netfs/netfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
