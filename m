Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93EF2BF017
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027703; cv=none; b=Gx9eiKH9HNeT4HGbicFeZxyR6+6WnRn9rm6LuytAKTbSbRJUgep7xNnsVkcSCQkW3E5GEVQme7z0Fh85KSUgXKWLeDIR9MV0WX15xH/ZCKv33dM3Qo4uNhuw+69pccwSayFJKR5rYPI+tfm1CETXMpOzAK0PIYPmouvXO9D6ioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027703; c=relaxed/simple;
	bh=giKwvD9FmkObc/sVBDj9Rpevs1csotbjyPiB76fVtXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoO3z+nyidPxZ7QyS+YTa72HcCBSHHUBO6LahwF7jU67HLGVFNZYZODI0modiCJnSH/YAmq1sZ1zHVpK8tS9xgIPH7nbpYLlHA6gtG/HbBO6YBgLvQNPjqz8SKEpcyH8zTrWTnLWJGos55GOROoPmazvQBOfH2HpioXbKLdlk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRnWzedT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRnWzedT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751027700; x=1782563700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=giKwvD9FmkObc/sVBDj9Rpevs1csotbjyPiB76fVtXY=;
  b=CRnWzedT3DFuJkAB6uSNvdhD1KTkRSZLLrQIVM0eXuko9j1/jYdfTZH0
   NYhhGIxnabsU8cm3Dkk0KutFc55gnA9BjFUoqPn3hy8pUKHCyMbkh7nii
   McQ39RNe7lr+JHLb/OvGGAFyYvX8WxrVOU5L33FXcnNXZa6AIPuCW7FOS
   BypUNwbuOk9w/Cmt79jQxHLHJn949tLFAukWuZG2hxaPcb1EOWDPht7hj
   sfrmZOjsGPLhZZmUOU434CvJ6AKRatVcrkmyyklo7bZKREF87A1hXQIxn
   jJtauoD5tVKdetet68Vbcda6xPXI4hq7JujfHURvP0dVqmJDTpiCgmdAo
   g==;
X-CSE-ConnectionGUID: TAZj540UQyqg5EXdd+gOdw==
X-CSE-MsgGUID: JM8qp2OOTrWhlxUDtxCJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52458912"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52458912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:34:59 -0700
X-CSE-ConnectionGUID: ZNFs/MgxT9OLevTvP6QapQ==
X-CSE-MsgGUID: 1ADOusCdQ1qRjOeOPZRvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157176714"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2025 05:34:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV8IB-000WA6-19;
	Fri, 27 Jun 2025 12:34:55 +0000
Date: Fri, 27 Jun 2025 20:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, phillip@squashfs.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] Squashfs: add page cache share support
Message-ID: <202506272051.Ho8GUiyW-lkp@intel.com>
References: <20250626003644.3675-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626003644.3675-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16-rc3]
[also build test ERROR on linus/master next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/Squashfs-add-page-cache-share-support/20250626-084010
base:   v6.16-rc3
patch link:    https://lore.kernel.org/r/20250626003644.3675-1-liubo03%40inspur.com
patch subject: [PATCH] Squashfs: add page cache share support
config: sparc64-randconfig-r054-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272051.Ho8GUiyW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506272051.Ho8GUiyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272051.Ho8GUiyW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/squashfs/pagecache_share.c:16:
   fs/squashfs/xattr.h: In function 'squashfs_read_xattr_id_table':
   fs/squashfs/xattr.h:22:13: error: implicit declaration of function 'squashfs_read_table'; did you mean 'squashfs_read_xattr_id_table'? [-Werror=implicit-function-declaration]
     id_table = squashfs_read_table(sb, start, sizeof(*id_table));
                ^~~~~~~~~~~~~~~~~~~
                squashfs_read_xattr_id_table
>> fs/squashfs/xattr.h:22:51: error: dereferencing pointer to incomplete type 'struct squashfs_xattr_id_table'
     id_table = squashfs_read_table(sb, start, sizeof(*id_table));
                                                      ^~~~~~~~~
   fs/squashfs/xattr.h:29:2: error: implicit declaration of function 'ERROR'; did you mean 'ERR_PTR'? [-Werror=implicit-function-declaration]
     ERROR("Xattrs in filesystem, these will be ignored\n");
     ^~~~~
     ERR_PTR
   In file included from fs/squashfs/pagecache_share.c:18:
   fs/squashfs/squashfs.h: At top level:
   fs/squashfs/squashfs.h:25:12: warning: 'struct squashfs_page_actor' declared inside parameter list will not be visible outside of this definition or declaration
        struct squashfs_page_actor *);
               ^~~~~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:40:14: error: conflicting types for 'squashfs_read_table'
    extern void *squashfs_read_table(struct super_block *, u64, int);
                 ^~~~~~~~~~~~~~~~~~~
   In file included from fs/squashfs/pagecache_share.c:16:
   fs/squashfs/xattr.h:22:13: note: previous implicit declaration of 'squashfs_read_table' was here
     id_table = squashfs_read_table(sb, start, sizeof(*id_table));
                ^~~~~~~~~~~~~~~~~~~
   In file included from fs/squashfs/pagecache_share.c:18:
   fs/squashfs/squashfs.h:49:26: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
     void * (*create)(struct squashfs_sb_info *msblk, void *comp_opts);
                             ^~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:50:25: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
     void (*destroy)(struct squashfs_sb_info *msblk);
                            ^~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:52:37: warning: 'struct squashfs_page_actor' declared inside parameter list will not be visible outside of this definition or declaration
         int offset, int length, struct squashfs_page_actor *output);
                                        ^~~~~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:51:27: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
     int (*decompress)(struct squashfs_sb_info *msblk, struct bio *bio,
                              ^~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:32,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from include/linux/xarray.h:12,
                    from fs/squashfs/pagecache_share.c:5:
   include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
    #define NULL ((void *)0)
                   ^~~~
   fs/squashfs/xattr.h:39:28: note: in expansion of macro 'NULL'
    #define squashfs_listxattr NULL
                               ^~~~
   fs/squashfs/squashfs.h:93:16: note: in expansion of macro 'squashfs_listxattr'
    extern ssize_t squashfs_listxattr(struct dentry *, char *, size_t);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:23: error: expected ')' before numeric constant
    #define NULL ((void *)0)
                          ^
   fs/squashfs/xattr.h:39:28: note: in expansion of macro 'NULL'
    #define squashfs_listxattr NULL
                               ^~~~
   fs/squashfs/squashfs.h:93:16: note: in expansion of macro 'squashfs_listxattr'
    extern ssize_t squashfs_listxattr(struct dentry *, char *, size_t);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
    #define NULL ((void *)0)
                   ^~~~
   fs/squashfs/xattr.h:40:33: note: in expansion of macro 'NULL'
    #define squashfs_xattr_handlers NULL
                                    ^~~~
   fs/squashfs/squashfs.h:119:43: note: in expansion of macro 'squashfs_xattr_handlers'
    extern const struct xattr_handler * const squashfs_xattr_handlers[];
                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:23: error: expected ')' before numeric constant
    #define NULL ((void *)0)
                          ^
   fs/squashfs/xattr.h:40:33: note: in expansion of macro 'NULL'
    #define squashfs_xattr_handlers NULL
                                    ^~~~
   fs/squashfs/squashfs.h:119:43: note: in expansion of macro 'squashfs_xattr_handlers'
    extern const struct xattr_handler * const squashfs_xattr_handlers[];
                                              ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +22 fs/squashfs/xattr.h

f37aa4c7366e23f Phillip Lougher 2021-02-09 @22  	id_table = squashfs_read_table(sb, start, sizeof(*id_table));
f37aa4c7366e23f Phillip Lougher 2021-02-09  23  	if (IS_ERR(id_table))
f37aa4c7366e23f Phillip Lougher 2021-02-09  24  		return (__le64 *) id_table;
f37aa4c7366e23f Phillip Lougher 2021-02-09  25  
f37aa4c7366e23f Phillip Lougher 2021-02-09  26  	*xattr_table_start = le64_to_cpu(id_table->xattr_table_start);
f37aa4c7366e23f Phillip Lougher 2021-02-09  27  	kfree(id_table);
f37aa4c7366e23f Phillip Lougher 2021-02-09  28  
01e5b4e4e897fce Phillip Lougher 2010-05-17  29  	ERROR("Xattrs in filesystem, these will be ignored\n");
01e5b4e4e897fce Phillip Lougher 2010-05-17  30  	return ERR_PTR(-ENOTSUPP);
01e5b4e4e897fce Phillip Lougher 2010-05-17  31  }
01e5b4e4e897fce Phillip Lougher 2010-05-17  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
