Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D657263A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653476; cv=none; b=MmTXbA95Rsntp8Zcy1YEj6SDInyVUxv0mfN5/c7uJNCuM2UGJhZm8MsGsDJtfyEPYOrEWqMUhvdrY6BNuMjKobsoCkX/t8zT3jWhllq9978ArMwx03iyJKYcJmZo1oR91uIyKm4ejI8+GFQuX+yRLIVDTiiTJwsErof0R3DK5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653476; c=relaxed/simple;
	bh=cdFWbRl9PO6cLcf9MqS2Pt4g5fsVMqf0PCvkd+ePZ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTJk6O0Cg9QiOaR2H//pjudpc2Eur4VUi2LsRPVZDRkokn7lWU97XxpOfXWTtUx2pzo+hFWkNW149upzdBoaMYF7WC+jHqLDEHfJjrdXPJCmUdq+8+IGwkCtyb1c9Gk40SQa0SKDH/IAOx1FVnt12e+ohEQF1cwE82Kq6DTgmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SI7rpSCQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SI7rpSCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751653474; x=1783189474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdFWbRl9PO6cLcf9MqS2Pt4g5fsVMqf0PCvkd+ePZ3Y=;
  b=SI7rpSCQkRt1IzKe5QQdJGUNX5CD7b5zE+JGUSOsm9U/t5DISFdcyED8
   d+zaxqAid95fal5StwrHMsaLHdMyTRzBOT0ISct1TKNc+OicuZew8N7Y7
   ZUBv09vzsUhCrIXIMshCLjN0D+zdyGFm9SnSmtNJYmyy1080tYZJSVtA8
   NxuPtUxsedNVJH4XeWCGWh0tAHKthsEfA6aBbKWV6bgPJFonOaDiTG4lZ
   UnGGNzMXq6cpVgCPDOI2PAcrgYY92NInTDgXqq4/SgeWlyyibmvVQsii1
   jSnFmSW3t5afJSmcfOf5AModfXKfsNZ5ADnJBZNCrjzT4WhSjh2Fuq7EE
   Q==;
X-CSE-ConnectionGUID: e7QYud+MTLG1jn/FlWYMsQ==
X-CSE-MsgGUID: 5MwFg8ULQvirfNU9aTRVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65333437"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="65333437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:24:34 -0700
X-CSE-ConnectionGUID: zcFLwJMvTESjSQpS0K93dQ==
X-CSE-MsgGUID: Mv0esvI6QuSmcklZj0Z9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155175792"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 04 Jul 2025 11:24:33 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXl5F-0000gz-1H;
	Fri, 04 Jul 2025 18:24:25 +0000
Date: Fri, 4 Jul 2025 20:24:11 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: fs/ufs/super.c:1246:22: warning: variable 'ufstype' set but not used
Message-ID: <202507042051.zr33LMmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4c06e63b92038fadb566b652ec3ec04e228931e8
commit: b70cb459890b7590c6d909da8c1e7ecfaf6535fb ufs: convert ufs to the new mount API
date:   7 weeks ago
config: i386-buildonly-randconfig-2002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507042051.zr33LMmW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042051.zr33LMmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042051.zr33LMmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ufs/super.c: In function 'ufs_reconfigure':
>> fs/ufs/super.c:1246:22: warning: variable 'ufstype' set but not used [-Wunused-but-set-variable]
    1246 |         unsigned int ufstype;
         |                      ^~~~~~~


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
