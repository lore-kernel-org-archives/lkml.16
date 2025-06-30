Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C5292B24
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309063; cv=none; b=pi8d58tLc4NHXPEHzCDKooV8gg5GDkAVeP5bBs4PiIpWqL2Gxx3PJUyIt4kndBsomydBIAckvGGdwM94au7s2pbTuZI71pm112DAvhTpRhlAEayEkdxgh68LZVlv25EQkO1ffUab+H6YDeXzrw2tjI9a267Eu4hTNot4Ied9AXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309063; c=relaxed/simple;
	bh=pq/ZW+I7hMd3v5+Szli/mXCBn1EiT0wClMfSvoilDe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y26yH/Ikw/rOhOHpXoyX4y+csIwtcTjjpLUw3dF7Jo9VxlcFZFtbJam9hb72kt6hM6HDxXBEAacuZL3Fl6iToni8/uXx8BVZHdbx+jyjHJGTFgnSci7U1yussvOhBbWWQO94S2PCRCzh8SzhgmmOAyo3qFdB/3u8b5mGavf3Qys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGAE5eJ7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGAE5eJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751309062; x=1782845062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pq/ZW+I7hMd3v5+Szli/mXCBn1EiT0wClMfSvoilDe8=;
  b=UGAE5eJ7G58DlypOJ9MZjT6005A1YPTPAQbUqu7jIlfPVGQCCzfexcS/
   H5INODK6/j9R11u7XFA3MqVjN08PKmWwbPzmtGN/OEd9wJpH7QORnKqF0
   tgJDVcsbFlFQeUURrBffa9OCXD6KPkInp6u3/AjI99QryNtRJyyTrOe5F
   i0NWfzHr4E23lsxOyVWJUfbPvZwBzaT5jcW10l0Er4C+nX4Zc4Q0ErKrK
   1cXQUkkreLl6cSIAD9wvggFbQqLcB3EoMPIpL0usY0dvKJPC4IbjpdbeU
   zW9ZUk7g5+uZI/hkVUYSggjOuuAGIw+Pgjsan3+UfnyyksPesJZHsNZHr
   w==;
X-CSE-ConnectionGUID: EdiTPPDuQh2ka8Ci2/QRXg==
X-CSE-MsgGUID: 06/cuKU/TayUJ6QhmZjIaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52661199"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52661199"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 11:44:21 -0700
X-CSE-ConnectionGUID: VD025VZnRnG/DW0NFqvo5A==
X-CSE-MsgGUID: 6+r+ffOMRxuOJRz1YKbUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153167280"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 11:44:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWJUH-000ZGs-0c;
	Mon, 30 Jun 2025 18:44:17 +0000
Date: Tue, 1 Jul 2025 02:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [tip:x86/urgent 1/1] arch/x86/coco/sev/core.c:2170:30: warning:
 variable 'dummy' set but not used
Message-ID: <202507010218.3O5Ge0Xt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
head:   4a35d2b5254af89595fd90dae9ee0c8f990a148d
commit: 4a35d2b5254af89595fd90dae9ee0c8f990a148d [1/1] x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010218.3O5Ge0Xt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/sev/core.c:2170:30: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]
    2170 |         unsigned long tsc_freq_mhz, dummy;
         |                                     ^
   1 warning generated.


vim +/dummy +2170 arch/x86/coco/sev/core.c

  2167	
  2168	void __init snp_secure_tsc_init(void)
  2169	{
> 2170		unsigned long tsc_freq_mhz, dummy;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
