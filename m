Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29F22B8A8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611570; cv=none; b=ExXUKkI0wbEaydD//GT8skUtkYGzEzpwQZMtHVS/8if8nXb6XQ5Lo+TIppq9DzKWadZbcgztyfDyE9avhKehwAUHE3iafVJS2zfMcic+DaxVI4h/0uCpwI5yGVrAlNnL2/ll7bd1/hh1f5oaSGHgIo91rshsusei/jVH1dHpKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611570; c=relaxed/simple;
	bh=K+DxTdJkl9FaZs4zFjrusQOOAB6r3DF/j4YeuC1uLkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KH7KWYyQTY9KKy7tZuyBH/yJWdDmNzhZPs8+2HqChvrig19Gyx/DhwdCo5Kjjc/ZefTPYr8kHekIhu9rZdhYVOb8PmXPTSlTCPmTm5TyrJEzatFIxz95BCS5f/d43G/QD9fKFyJH7npAUPWUi5UeX9L91NkIkpeRluorBZ/N/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNiR5TNu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNiR5TNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748611568; x=1780147568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+DxTdJkl9FaZs4zFjrusQOOAB6r3DF/j4YeuC1uLkk=;
  b=ZNiR5TNuCNj2MTAcj5a8PuRBgLEWVZQsY/z7AQsBAXuaLEYFtaC60E48
   EIy99uZIGc0UESwHWpBudmiYWO9FnjiaXABzk2RPrRkvM09mEQuVc/QFx
   tHoLLg6FRORC5/C85Y0fCooe5eYAMyUot8vJNKPwcAST9CS07JUFiQyxt
   TKiqDzsAdnUYz7ihuaxNKuE947BrTrfH6ehEUpXL3YvrNPdbCh5MKjWD0
   +i2Vj7tqBNB9ov7BswgPK72CaAjZr91qZOuFOrrL8BVZO1anz5LAAlRa3
   N2/nwS7/1vskijYKa+VEJpm8VqDy1Ssn6jwidgVyJJdVJkXaGYahZshrz
   w==;
X-CSE-ConnectionGUID: eFfp+QfpSEmcUd5siWpoOw==
X-CSE-MsgGUID: K+my489HSwOfBldHV8BsAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50708935"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50708935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:26:08 -0700
X-CSE-ConnectionGUID: QnitC1ZcQAi7uTbKLYwUZg==
X-CSE-MsgGUID: 1VKfWvjURRO1zaujVTrheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="167070332"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 06:26:05 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKzkI-0000tm-35;
	Fri, 30 May 2025 13:26:02 +0000
Date: Fri, 30 May 2025 21:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Shaul Triebitz <shaul.triebitz@intel.com>
Subject: ERROR: modpost: "iwl_get_cmd_string"
 [drivers/net/wireless/intel/iwlwifi/mld/tests/iwlmld-tests.ko] undefined!
Message-ID: <202505302159.n8mEtUuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66bc387efbee59978e076ce9bf123ac353b389c
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   3 months ago
config: x86_64-randconfig-2001-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302159.n8mEtUuV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302159.n8mEtUuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302159.n8mEtUuV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "iwl_get_cmd_string" [drivers/net/wireless/intel/iwlwifi/mld/tests/iwlmld-tests.ko] undefined!
>> ERROR: modpost: "__iwl_dbg" [drivers/net/wireless/intel/iwlwifi/mld/tests/iwlmld-tests.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
