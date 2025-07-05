Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D531BF58
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751681358; cv=none; b=exwwZEW17bqRQXYUXXAyrSYDoFswlsv7cKsR6AF19b8qI/dayjakwI8s60b2X0ZASToyY5PG1BUBO41gncZNuY8yLgpGqYg8ar2A+eyFYy4ne8JdCiF5HSVuNXiWMGOt/DudeV7wYoJDodhNlmfFMfUqCR1szNYf6O27uPG5Iy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751681358; c=relaxed/simple;
	bh=BQwmKsA3I9+RYP2xkti8aYYVkl/QM2yFlc6xhfV2f4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hjqn0rbgZGZN0YmXqU/WrF+4B9y85wUjfw2c8MVNowzJP1DL8TDEC2Zdpp0NxwoKE+OGGOmpNYyguJbz2ZOIO4sZjJKoUpLOCoDBq0HE0stZ+HBVofY3jjHY536YyegBrTF2BxJiFr2qlcE88DWIL1zQJ9jBAm5pKwNWUdXM8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvbIbDEb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvbIbDEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751681357; x=1783217357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQwmKsA3I9+RYP2xkti8aYYVkl/QM2yFlc6xhfV2f4Y=;
  b=UvbIbDEbozKyBr43GRiB0RvPAu+hFBF50hB06IVzuvcshJaDFkCEhGP7
   9I6HBpCXGJ7pU7BlywFyV7NLDqADcgfunQ/H/UVdiXGcZfbEAV4eYthFU
   qszNiL5ck3X7pyR2Z25mCSSmK4JSIQqq8jHvgmWfpsQ42OJHXj3woa6qQ
   5QBevOf3/4hSo3wqMtl0WvbQRrK74LPM/Iadt8UwI3Pt6RP59lNea4Vut
   nC4pjjU9xZQc2OO90yDDU07ASeRQRU2eCwkjLsh8YB3bVXNqaWg8oJrBM
   6v/5lpTJPI6FpXzvO4uwbrnfw2aFiOOnXkO8vE/qJdz/pM6Y5D2Z1IHH+
   g==;
X-CSE-ConnectionGUID: 6DOR3K4LThqZ++1HVb2/kQ==
X-CSE-MsgGUID: RLe3e2TpTYuIXMzllRn1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53864953"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53864953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 19:09:16 -0700
X-CSE-ConnectionGUID: ud1gR3FrTiuV8Bg+0VD38g==
X-CSE-MsgGUID: qJZ3Ry3iTayEgCrIdEZk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154496499"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2025 19:09:16 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXsL2-0000kn-35;
	Sat, 05 Jul 2025 02:09:12 +0000
Date: Sat, 5 Jul 2025 04:08:33 +0200
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt1318.c:1149:34: warning: unused variable
 'rt1318_of_match'
Message-ID: <202507050416.elP8eSZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jack,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: fe1ff61487ace69cd4e680e36169c90667eb9624 ASoC: rt1318: Add RT1318 audio amplifier driver
date:   1 year, 1 month ago
config: x86_64-buildonly-randconfig-2001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507050416.elP8eSZp-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050416.elP8eSZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050416.elP8eSZp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/rt1318.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/codecs/rt1318.c:1149:34: warning: unused variable 'rt1318_of_match' [-Wunused-const-variable]
    1149 | static const struct of_device_id rt1318_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/rt1318_of_match +1149 sound/soc/codecs/rt1318.c

  1148	
> 1149	static const struct of_device_id rt1318_of_match[] = {
  1150		{ .compatible = "realtek,rt1318", },
  1151		{},
  1152	};
  1153	MODULE_DEVICE_TABLE(of, rt1318_of_match);
  1154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
