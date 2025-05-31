Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8642AA6
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748696137; cv=none; b=MP1CAwW/6wfLVzGuvGusEBEzjrRRX41lr0SS8z9HvNqvF/UVrxuWR/DZasLoq9EB1R2uKMNLkxfIUr9Dl4gw4n28Y8Yx+6LCNBUZWHVzZifoyjDKaVVwSV+b7Fu2xd5fi/YyqoU54UJGPP8NzvmrYPQN+FAbGDl0cFc7c9xWNuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748696137; c=relaxed/simple;
	bh=DbCyxorTZ8S/KCIHRCV0I83HsPxX4olKOvblnRSuDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rEXvtFjELZHYYP7G9c407MsvBn03nMbrZwqJa37rdk46SebectTL9iQWn46XUJnCb1Mk8+s+bEAFptyGTdSUpMeNQ2vW56GPOXvBqIpYb02W5E0ydptQhUYyaxeqLSIRA09YWQ09oE6ex7y42BpO0s8NvsX3uID+Anc7DEDCMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWB81DaZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWB81DaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748696136; x=1780232136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbCyxorTZ8S/KCIHRCV0I83HsPxX4olKOvblnRSuDAA=;
  b=BWB81DaZObm/O+gvO4OFFKLGmC6G4h6fXVJWAdc9xCYB86vwDc2UcugO
   FR1S6SIMWbAijTUqPZsMbuqtcu0y6lxAEF69aQ5HZ0N9mrvr5L8b6R2P6
   z3b+ySjwk/2+b+ktxEETqTkkO74AOhDLUYU+y4ZldYqy9WVMTVDetpiU8
   l5QFJypu0k1wh5YGBYTo+tL6Sr14xKo+uYFh1xG3E/euCMSGZyPyS1Skp
   QYHNmXl6HvIy0oFUFNlKqjytcwaQqR+QF8e14gw0AWLxa45kbqI4P5Qsm
   izJrTkc5jNkfh0EuGnyqT2vnTm4yWY2YwZR+jJLcuBWJENdPjAluSoUhk
   A==;
X-CSE-ConnectionGUID: 2CS1p0KuR1ODN6DwWlCFCQ==
X-CSE-MsgGUID: GapAWLI2TaSQasi63kNHKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="68324522"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="68324522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 05:55:35 -0700
X-CSE-ConnectionGUID: kWKQ4t8hQzOE7tamm/2q3w==
X-CSE-MsgGUID: mNhABQDASf25xEOUrqoTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144026934"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 05:55:34 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLLkJ-000116-1n;
	Sat, 31 May 2025 12:55:31 +0000
Date: Sat, 31 May 2025 20:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: fs/ufs/super.c:1246:15: warning: variable 'ufstype' set but not used
Message-ID: <202505312056.JEiEGBI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f70f5b08a47a3bc1a252e5f451a137cde7c98ce
commit: b70cb459890b7590c6d909da8c1e7ecfaf6535fb ufs: convert ufs to the new mount API
date:   2 weeks ago
config: i386-buildonly-randconfig-2003-20250531 (https://download.01.org/0day-ci/archive/20250531/202505312056.JEiEGBI7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312056.JEiEGBI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312056.JEiEGBI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ufs/super.c:1246:15: warning: variable 'ufstype' set but not used [-Wunused-but-set-variable]
    1246 |         unsigned int ufstype;
         |                      ^
   1 warning generated.


vim +/ufstype +1246 fs/ufs/super.c

  1238	
  1239	static int ufs_reconfigure(struct fs_context *fc)
  1240	{
  1241		struct ufs_sb_private_info * uspi;
  1242		struct ufs_super_block_first * usb1;
  1243		struct ufs_super_block_third * usb3;
  1244		struct ufs_fs_context *ctx = fc->fs_private;
  1245		struct super_block *sb = fc->root->d_sb;
> 1246		unsigned int ufstype;
  1247		unsigned int flags;
  1248	
  1249		sync_filesystem(sb);
  1250		mutex_lock(&UFS_SB(sb)->s_lock);
  1251		uspi = UFS_SB(sb)->s_uspi;
  1252		flags = UFS_SB(sb)->s_flags;
  1253		usb1 = ubh_get_usb_first(uspi);
  1254		usb3 = ubh_get_usb_third(uspi);
  1255		
  1256		ufstype = UFS_SB(sb)->s_flavour;
  1257	
  1258		if ((bool)(fc->sb_flags & SB_RDONLY) == sb_rdonly(sb)) {
  1259			UFS_SB(sb)->s_on_err = ctx->on_err;
  1260			mutex_unlock(&UFS_SB(sb)->s_lock);
  1261			return 0;
  1262		}
  1263		
  1264		/*
  1265		 * fs was mouted as rw, remounting ro
  1266		 */
  1267		if (fc->sb_flags & SB_RDONLY) {
  1268			ufs_put_super_internal(sb);
  1269			usb1->fs_time = ufs_get_seconds(sb);
  1270			if ((flags & UFS_ST_MASK) == UFS_ST_SUN
  1271			  || (flags & UFS_ST_MASK) == UFS_ST_SUNOS
  1272			  || (flags & UFS_ST_MASK) == UFS_ST_SUNx86) 
  1273				ufs_set_fs_state(sb, usb1, usb3,
  1274					UFS_FSOK - fs32_to_cpu(sb, usb1->fs_time));
  1275			ubh_mark_buffer_dirty (USPI_UBH(uspi));
  1276			sb->s_flags |= SB_RDONLY;
  1277		} else {
  1278		/*
  1279		 * fs was mounted as ro, remounting rw
  1280		 */
  1281	#ifndef CONFIG_UFS_FS_WRITE
  1282			pr_err("ufs was compiled with read-only support, can't be mounted as read-write\n");
  1283			mutex_unlock(&UFS_SB(sb)->s_lock);
  1284			return -EINVAL;
  1285	#else
  1286			if (ufstype != UFS_MOUNT_UFSTYPE_SUN && 
  1287			    ufstype != UFS_MOUNT_UFSTYPE_SUNOS &&
  1288			    ufstype != UFS_MOUNT_UFSTYPE_44BSD &&
  1289			    ufstype != UFS_MOUNT_UFSTYPE_SUNx86 &&
  1290			    ufstype != UFS_MOUNT_UFSTYPE_UFS2) {
  1291				pr_err("this ufstype is read-only supported\n");
  1292				mutex_unlock(&UFS_SB(sb)->s_lock);
  1293				return -EINVAL;
  1294			}
  1295			if (!ufs_read_cylinder_structures(sb)) {
  1296				pr_err("failed during remounting\n");
  1297				mutex_unlock(&UFS_SB(sb)->s_lock);
  1298				return -EPERM;
  1299			}
  1300			sb->s_flags &= ~SB_RDONLY;
  1301	#endif
  1302		}
  1303		UFS_SB(sb)->s_on_err = ctx->on_err;
  1304		mutex_unlock(&UFS_SB(sb)->s_lock);
  1305		return 0;
  1306	}
  1307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
