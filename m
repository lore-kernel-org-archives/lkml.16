Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D717E4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749261592; cv=none; b=YvJjcArzzmZqyaIidTDmMWRWhwgm4Rhk+yAtcJqdmSRn5g1F167nxFig4rw36dzjbxVosd29jgKEbNO74Wk79Q7dDcWQn+9Uy7r/+J1kuz4cZjseQTtsVqZGY3REw4b+QlFG31jow1nx9pkDLVV2LY7h7KjHOgmL9GI6a29xmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749261592; c=relaxed/simple;
	bh=V+B0Q7AYqYfuVBQ1dmrmPh2y+a5r6BWJhwLd3ttn8F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZDD3i0k9Rm+APYBM6QwlLNaDzT3Rkm8XvMHZd1v3akYroyX4vEqhnx/7PO5pTARn2PotsnqyB18sfszLXGBsm0wKorVyX4pXr/Vb4xemmzpdBnBIavybNytLP3jKewPSYHSAXsUPyPdfqXgCGcOM3QlAMta5G35jCjtd2MdAvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kru0FQh6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kru0FQh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749261591; x=1780797591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+B0Q7AYqYfuVBQ1dmrmPh2y+a5r6BWJhwLd3ttn8F8=;
  b=kru0FQh6/ez/VAJvGnh5ls79FMIlFYGzcWUfp6P5iEpw6+Yyl/1UNNTY
   nKBRfbxDsOA4Zk7EqLl16KOXX4hgAsLEyu8Rsu9c5psmueCMQ2TEeAF0Z
   EZRN7HsdyuwdhKfXCJDeGKmMnBX/l4IXeCuVp14Fj0fXVkgDYcPTkAmqP
   oSlCvG6IN2EoqqlLv5dsswt0KeOpdOqdbG50GdbnzGyJkQGVcCP+3JHip
   5XkwVtg2LO7aY0JaDXG/UUNEXu1UbLFboJ5bylt2Kts6M7ty9+R4QsFcq
   9I2HvwjuXIpE/P4Sh0NEd7cjzZQRchQWlQfi1zm2gn5dYyuVN1KpeH2LJ
   A==;
X-CSE-ConnectionGUID: eT4PNExJSIeAUJopUW26JQ==
X-CSE-MsgGUID: GGO2QxKQRsyIL5k8ODbbdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51558561"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="51558561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 18:59:50 -0700
X-CSE-ConnectionGUID: 6E3HmmnWQaaMXMTFORRs6A==
X-CSE-MsgGUID: oU8EgnXkRWy97aJieUvznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="176863548"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jun 2025 18:59:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNiqZ-0005P1-09;
	Sat, 07 Jun 2025 01:59:47 +0000
Date: Sat, 7 Jun 2025 09:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250606 16/16]
 kernel/sched/ext.c:3748:24: error: returning 'struct cgroup_hdr *' from a
 function with incompatible return type 'struct cgroup *'
Message-ID: <202506070954.D6Eg0juq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250606
head:   2aebeb5c325881159c6896f61fa4b16f2af46067
commit: 2aebeb5c325881159c6896f61fa4b16f2af46067 [16/16] cgroup: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-006-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070954.D6Eg0juq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070954.D6Eg0juq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070954.D6Eg0juq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c: In function 'tg_cgrp':
>> kernel/sched/ext.c:3748:24: error: returning 'struct cgroup_hdr *' from a function with incompatible return type 'struct cgroup *' [-Werror=incompatible-pointer-types]
    3748 |                 return &cgrp_dfl_root.cgrp;
         |                        ^~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5361:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5361 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function '__bstr_format':
   kernel/sched/ext.c:7150:27: warning: function '__bstr_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7150 |                           bprintf_data.bin_args);
         |                           ^~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_bpf_task_cgroup':
>> kernel/sched/ext.c:7445:31: error: initialization of 'struct cgroup *' from incompatible pointer type 'struct cgroup_hdr *' [-Werror=incompatible-pointer-types]
    7445 |         struct cgroup *cgrp = &cgrp_dfl_root.cgrp;
         |                               ^
   cc1: some warnings being treated as errors


vim +3748 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  3736  
8195136669661f Tejun Heo 2024-09-04  3737  #ifdef CONFIG_EXT_GROUP_SCHED
8195136669661f Tejun Heo 2024-09-04  3738  static struct cgroup *tg_cgrp(struct task_group *tg)
8195136669661f Tejun Heo 2024-09-04  3739  {
8195136669661f Tejun Heo 2024-09-04  3740  	/*
8195136669661f Tejun Heo 2024-09-04  3741  	 * If CGROUP_SCHED is disabled, @tg is NULL. If @tg is an autogroup,
8195136669661f Tejun Heo 2024-09-04  3742  	 * @tg->css.cgroup is NULL. In both cases, @tg can be treated as the
8195136669661f Tejun Heo 2024-09-04  3743  	 * root cgroup.
8195136669661f Tejun Heo 2024-09-04  3744  	 */
8195136669661f Tejun Heo 2024-09-04  3745  	if (tg && tg->css.cgroup)
8195136669661f Tejun Heo 2024-09-04  3746  		return tg->css.cgroup;
8195136669661f Tejun Heo 2024-09-04  3747  	else
8195136669661f Tejun Heo 2024-09-04 @3748  		return &cgrp_dfl_root.cgrp;
8195136669661f Tejun Heo 2024-09-04  3749  }
8195136669661f Tejun Heo 2024-09-04  3750  

:::::: The code at line 3748 was first introduced by commit
:::::: 8195136669661fdfe54e9a8923c33b31c92fc1da sched_ext: Add cgroup support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
