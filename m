Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958E146D6A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744591465; cv=none; b=Xay+vuVsQfkQ1H403jORQpSxRzyMd0R3RCaZc+szwwsaOhV0NkQMasZH/Tg4vKTaWqnd+QPrj2jQ4lwEt3qk83vof6JaAyw80tn6uKHJQS4z5P2a9LmxAxERNinA9ykh06aoMtB1p/jZvOn09mJ/6SPCaRKcmYjomh83AoGxKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744591465; c=relaxed/simple;
	bh=ImjrcZquA09EjlrwOP6ONMR4FJyZVJbOpLDQejB7b60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq9ghwWdCBiIultnTy8IT0X+6WB/xm1ckbzOPMTMs90PN5tisPvCHV35qf+dEbbhGEdkAmBoLfN7b7X7vJcBSlU1JWJD12jBr0RxZo+tflODgj3mByPPXq0iVBSY7uBww1yEAxlkCjpkUwSZw6MHAtPmCqYSqUS1Ejt8MMFl3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igTiKf+J; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igTiKf+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744591464; x=1776127464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImjrcZquA09EjlrwOP6ONMR4FJyZVJbOpLDQejB7b60=;
  b=igTiKf+JLLwRZIloZfdjfmb3nVltz4hCCpmeH5lY9yEpSxsjAH5J/y40
   fJmsBgAo3fBgyIYdX7Z7TbjTkdE1jcYQZ36Ld0ZOdEo1dokO/2Qi7i5C9
   ges6ng32TNqI75rqgu5TE4HPwQLO8NSrhnLyTRxtDJrXcBZP8Mjc8+H/2
   GYhJ0KopIyE0o21K6Wf89jKejzb6/MTnn+9hj80rOWQwvkOXX3vDMhRCR
   USkrsRfZi5/dY25riRSnW9ZtUTm17kOaf1yPXaEk2lkH1/Wct7ulu7I0G
   bBhV/jaQ/zTeemloAbsVHU30x8pS59iSxNNg8SltEcUS45LufcZowJqJh
   g==;
X-CSE-ConnectionGUID: R+NjH+KQREe0J+XOVywpLg==
X-CSE-MsgGUID: 1V3muhhOQhG9mypPFqEy7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57433296"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57433296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 17:44:23 -0700
X-CSE-ConnectionGUID: OXCEUETXRjy+yll6YURAWg==
X-CSE-MsgGUID: CLnPmBLkQ3C87dZvWpAIWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130220350"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2025 17:44:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u47vu-000Czu-2k;
	Mon, 14 Apr 2025 00:44:18 +0000
Date: Mon, 14 Apr 2025 08:44:05 +0800
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
Message-ID: <202504140823.yn5gtMpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   6 weeks ago
config: i386-randconfig-017-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140823.yn5gtMpM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140823.yn5gtMpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140823.yn5gtMpM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "iwl_get_cmd_string" [drivers/net/wireless/intel/iwlwifi/mld/tests/iwlmld-tests.ko] undefined!
>> ERROR: modpost: "__iwl_dbg" [drivers/net/wireless/intel/iwlwifi/mld/tests/iwlmld-tests.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
