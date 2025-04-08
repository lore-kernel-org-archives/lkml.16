Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1E2571B2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154652; cv=none; b=hJZDSfrGff0R46h0Eg5jy2+TR67PnNNg4hyrzliJcjnFp78dYBbvIoUuGBQn2ScT85Gn9AmLD54ZkvQLJl/YGiFKCMwFg42LbsGhOwoWly9IS0dQzT1jvW36KdvF5QQOcpoWZhNVKsuWT0ZPNedDG9Lg1eltRJOJFL4LeJsoQHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154652; c=relaxed/simple;
	bh=Z+y+TvvbX6H4MZSWf6kxTQkHX4zoax64bXySg9jfE/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwXwnxj4aKBouUHZnQZLvgqFqPuTSk29AF6bLJSv4VGEau7UyqE6cNg2J6Q9lkJtzuJHcTAfow/UfKr5zuPJR6rbG0+wq3SzE3MXmTSZ9yEev4ViocFheEHRoTbh5kzk53lJU096/I/2IkDWShRBOO6V+B2T6nFcEcr4OuspECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/hvt4AH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/hvt4AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744154651; x=1775690651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+y+TvvbX6H4MZSWf6kxTQkHX4zoax64bXySg9jfE/Q=;
  b=K/hvt4AHJC9svbfBftvfGl+cPuKhf+Hp/JpKFrGfIKkxnZzLQQ5oxUlk
   vGaQ8kpK8k4maPsvvyPqHc7X8/L6kWJbDx+cDVXtK35q1b1lpfkuUiqwi
   f1RJ1AYrPtI055oq+yYkxDvO8cd+j1XbDef0r2DASvoiJVheLixUdDZ85
   q1pmnlTwMqtGqPH4eIBZrFaJqAMN2hk+4S+7TW/Kgc3eiUrv/KmBQyU1f
   mQh6ljBHo0WwC3UuPlldzVyJCldHJ3VGPgRodSYgIX9vBWkRUjTlR5OCA
   ajzFYYPLWzj+9tMzgZs8duopTHq6jg1ozIfbvT+5tMPWH5V5BBRUxn85f
   w==;
X-CSE-ConnectionGUID: TyWG+S7gTKWBVcGshJspeQ==
X-CSE-MsgGUID: Um8OflU6Q22yFfFKVz/Bvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48318155"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="48318155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 16:24:10 -0700
X-CSE-ConnectionGUID: /1fLLVCGSayODjVfxoFgPw==
X-CSE-MsgGUID: OzRJ/k2PQoaIkhLenW6lUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128944671"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2025 16:24:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2IIY-00084V-1P;
	Tue, 08 Apr 2025 23:24:06 +0000
Date: Wed, 9 Apr 2025 07:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/namei.c:232:6: error: unexpected token, expected comma
Message-ID: <202504090937.ZGGFamL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bec7dcbc242c6c087cede1a6fdfaeb5d6eaf25bf
commit: e896474fe4851ffc4dd860c92daa906783090346 getname_maybe_null() - the third variant of pathname copy-in
date:   6 months ago
config: mips-randconfig-r064-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090937.ZGGFamL2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090937.ZGGFamL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090937.ZGGFamL2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/namei.c:232:6: error: unexpected token, expected comma
     232 |         if (get_user(c, pathname))
         |             ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:177:23: note: expanded from macro '__get_user'
     177 |                 __get_data_asm((x), user_lb, __gu_ptr);                 \
         |                                     ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   fs/namei.c:232:6: error: instruction requires a CPU feature not currently enabled
     232 |         if (get_user(c, pathname))
         |             ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:177:23: note: expanded from macro '__get_user'
     177 |                 __get_data_asm((x), user_lb, __gu_ptr);                 \
         |                                     ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         lbe $3, 0($4)
         |         ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +232 fs/namei.c

   225	
   226	struct filename *__getname_maybe_null(const char __user *pathname)
   227	{
   228		struct filename *name;
   229		char c;
   230	
   231		/* try to save on allocations; loss on um, though */
 > 232		if (get_user(c, pathname))
   233			return ERR_PTR(-EFAULT);
   234		if (!c)
   235			return NULL;
   236	
   237		name = getname_flags(pathname, LOOKUP_EMPTY);
   238		if (!IS_ERR(name) && !(name->name[0])) {
   239			putname(name);
   240			name = NULL;
   241		}
   242		return name;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
