Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DF224227
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726871; cv=none; b=S67gFJgOYw4YrktCin22miPEOnF45XwBt/0m2Kxd0DciJE9W7B7IVA6VZF5vk0u9L16N16xQ5hSpyxs8Z2DjJQ0RqwgTt5osSBnmjnuogvVqSks3mU9HhBc+cRQdV4+GNTA6h+ZH+P83EXhO2pORVeJI7Hn5v4lGl76qd1VYi6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726871; c=relaxed/simple;
	bh=H7ph+7KSkF1AvfD3kGvYdcGc9HaK1kvASqnb63Hl4zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXCvJpnfytPHg96j7vwSzaOxf5X6ivZ/UsJ/vwEQG7o6iiHA8Wgr3eesDHePiaoL0L9Q/+I41lf3AUOJP7/rsJeiag78LWxS/E2s2rkGKMnrgVIn/VVomjYiQxxf8WyKC5mHjwEaCWAWxPL/Dt463ATzmbpI8zxcT6Lp+n/nSFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2PcXyoy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2PcXyoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746726870; x=1778262870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H7ph+7KSkF1AvfD3kGvYdcGc9HaK1kvASqnb63Hl4zc=;
  b=X2PcXyoyPABsOiqVJd7gQ36B+RPoPl1kwv5fIn+AFW6W4yukNaZ4NVVw
   LY1VDKnzQdCxScK6CAzValstKLYKg5nYSK1skKBkf2Xn7ZvMio7Z4z+mt
   D64/702FypmBObtrowsI0J5TcglhhwZPNU3Mr9dbiqLsE4ds0PqYl95Tp
   1Jll02hMnb+W4dXMx5dOXaklLhoNOkPhurq1wsWBcLApGM76iUZlcILvn
   K3GP5gkdXhCcBPHqzs+1K/LkGQknsebFSLUxlDD1kbAdiSrQTMiI+4Znp
   ua6+IeTT/zChC/AP5wQ31ztnuZvKXsu0D+vfhnL+TDZLirX3U64oFxmUe
   g==;
X-CSE-ConnectionGUID: ldBFAaAIQ7S5vUjFC3XLCA==
X-CSE-MsgGUID: Ehcq2BGqRsqW5xXvuPrQew==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48397272"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48397272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 10:54:29 -0700
X-CSE-ConnectionGUID: sXZdAZ6JS5q3u+eHVgAj1Q==
X-CSE-MsgGUID: lZZU7vkxSDqA/tCGJOtAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="159668358"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 10:54:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD5Rx-000BEN-27;
	Thu, 08 May 2025 17:54:25 +0000
Date: Fri, 9 May 2025 01:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <ulin0208@gmail.com>,
	almaz.alexandrovich@paragon-software.com
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rong Zhang <ulin0208@gmail.com>
Subject: Re: [PATCH 2/2] ntfs3: correctly create symlink for relative path
Message-ID: <202505090114.Ejj1rsY0-lkp@intel.com>
References: <20250507073534.11693-1-ulin0208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507073534.11693-1-ulin0208@gmail.com>

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/ntfs3-correctly-create-symlink-for-relative-path/20250507-153624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250507073534.11693-1-ulin0208%40gmail.com
patch subject: [PATCH 2/2] ntfs3: correctly create symlink for relative path
config: i386-randconfig-r133-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090114.Ejj1rsY0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090114.Ejj1rsY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090114.Ejj1rsY0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/inode.c:1124:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] Flags @@     got int @@
   fs/ntfs3/inode.c:1124:19: sparse:     expected restricted __le32 [usertype] Flags
   fs/ntfs3/inode.c:1124:19: sparse:     got int

vim +1124 fs/ntfs3/inode.c

  1068	
  1069	static struct REPARSE_DATA_BUFFER *
  1070	ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
  1071				   u32 size, u16 *nsize)
  1072	{
  1073		int i, err;
  1074		struct REPARSE_DATA_BUFFER *rp;
  1075		__le16 *rp_name;
  1076		typeof(rp->SymbolicLinkReparseBuffer) *rs;
  1077		bool is_absolute;
  1078	
  1079		is_absolute = (strlen(symname) > 1 && symname[1] == ':');
  1080	
  1081		rp = kzalloc(ntfs_reparse_bytes(2 * size + 2, is_absolute), GFP_NOFS);
  1082		if (!rp)
  1083			return ERR_PTR(-ENOMEM);
  1084	
  1085		rs = &rp->SymbolicLinkReparseBuffer;
  1086		rp_name = rs->PathBuffer;
  1087	
  1088		/* Convert link name to UTF-16. */
  1089		err = ntfs_nls_to_utf16(sbi, symname, size,
  1090					(struct cpu_str *)(rp_name - 1), 2 * size,
  1091					UTF16_LITTLE_ENDIAN);
  1092		if (err < 0)
  1093			goto out;
  1094	
  1095		/* err = the length of unicode name of symlink. */
  1096		*nsize = ntfs_reparse_bytes(err, is_absolute);
  1097	
  1098		if (*nsize > sbi->reparse.max_size) {
  1099			err = -EFBIG;
  1100			goto out;
  1101		}
  1102	
  1103		/* Translate Linux '/' into Windows '\'. */
  1104		for (i = 0; i < err; i++) {
  1105			if (rp_name[i] == cpu_to_le16('/'))
  1106				rp_name[i] = cpu_to_le16('\\');
  1107		}
  1108	
  1109		rp->ReparseTag = IO_REPARSE_TAG_SYMLINK;
  1110		rp->ReparseDataLength =
  1111			cpu_to_le16(*nsize - offsetof(struct REPARSE_DATA_BUFFER,
  1112						      SymbolicLinkReparseBuffer));
  1113	
  1114		/* PrintName + SubstituteName. */
  1115		rs->SubstituteNameOffset = cpu_to_le16(sizeof(short) * err);
  1116		rs->SubstituteNameLength = cpu_to_le16(sizeof(short) * err + (is_absolute ? 8 : 0));
  1117		rs->PrintNameLength = rs->SubstituteNameOffset;
  1118	
  1119		/*
  1120		 * TODO: Use relative path if possible to allow Windows to
  1121		 * parse this path.
  1122		 * 0-absolute path 1- relative path (SYMLINK_FLAG_RELATIVE).
  1123		 */
> 1124		rs->Flags = is_absolute ? 0 : SYMLINK_FLAG_RELATIVE;
  1125	
  1126		memmove(rp_name + err + (is_absolute ? 4 : 0), rp_name, sizeof(short) * err);
  1127	
  1128		if (is_absolute) {
  1129			/* Decorate SubstituteName. */
  1130			rp_name += err;
  1131			rp_name[0] = cpu_to_le16('\\');
  1132			rp_name[1] = cpu_to_le16('?');
  1133			rp_name[2] = cpu_to_le16('?');
  1134			rp_name[3] = cpu_to_le16('\\');
  1135		}
  1136	
  1137		return rp;
  1138	out:
  1139		kfree(rp);
  1140		return ERR_PTR(err);
  1141	}
  1142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
