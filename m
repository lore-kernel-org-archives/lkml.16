Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596B2BE7A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749675456; cv=none; b=CoYQWjd8ltwNzrwjf+w0aBPsluRdMCqZVLNObURxkWQg8v6DeD9HJqbgNDz5PLSC0zYju7cjOg0YeRIdjJ6mpNYjEkeJw5unVjffmrDfs/Una5oABiSAHNN42gof4edLjkTHSguGvq74gbiaP02ub0U+361y2mMUc6HLePl+CmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749675456; c=relaxed/simple;
	bh=n17Rl7QknZD0vhOwPLp+wASgTEGOVlW4VwZRElC0+JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqnGq20QCpdSVmpsP+q2o4PJpLpeh2c8/JvYvjKtaCVlfDHm5tWkQ5UnHr7u9K6pUhqCXO0gfAUzSNvbpHRXTepWEZhDQyFNKrHDO6CAwsaidzYJUDhW/N4N0B1cC5n+uzRfCZ0uDri3mnGFAsZ+VdbexrZPtheG92MK0pwkbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hn+ifG3d; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hn+ifG3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749675455; x=1781211455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n17Rl7QknZD0vhOwPLp+wASgTEGOVlW4VwZRElC0+JQ=;
  b=Hn+ifG3dYU5q0RcClqpZ9H1lt1wU95OolHW2PaKAZ25hTxRq3OY0T+vr
   SW04jmA5HoLif27xMVonbBanzwpS6aKlfimzEVJYffacLMCDQhpTh091D
   jdDkNWBwuLnA8gdmnNuxAchpFsM327mrGJgZVFCiBo/2T7Ndy4iLe3C0b
   /CKQiEWpsNXPTCW4lwrvSwUyHSzvJAkTC8wVdHpnCOGZSitJWNxZCfStm
   9jfQFmSgdalk8mmZmoqL4EwALOfVGxGjOTFAPz1k5W7OLgcDv3x7d2VPI
   1xDRaQLV48ljExvJ9m903iiA3YJMLcvhIaT6P3a/gU6gzf82oCqJSbskk
   Q==;
X-CSE-ConnectionGUID: 4+EUBn9DSzybus2jpPei+w==
X-CSE-MsgGUID: L/ZyUuSTSJaiaOOZqeHSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62447047"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="62447047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 13:57:34 -0700
X-CSE-ConnectionGUID: 59Cz5jwVSsCH0vZySUS81Q==
X-CSE-MsgGUID: 8qQ2SGLbShC6UfpW9/FnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="152579699"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2025 13:57:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPSVm-000ArM-23;
	Wed, 11 Jun 2025 20:57:30 +0000
Date: Thu, 12 Jun 2025 04:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Chenghao Duan <duanchenghao@kylinos.cn>,
	George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH v1 3/5] LoongArch: BPF: Add bpf_arch_text_poke support
 for Loongarch
Message-ID: <202506120407.Dqc4kJYr-lkp@intel.com>
References: <20250611053625.352091-4-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611053625.352091-4-duanchenghao@kylinos.cn>

Hi Chenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[also build test WARNING on bpf-next/master bpf/master linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenghao-Duan/LoongArch-Support-fixmap/20250611-133843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20250611053625.352091-4-duanchenghao%40kylinos.cn
patch subject: [PATCH v1 3/5] LoongArch: BPF: Add bpf_arch_text_poke support for Loongarch
config: loongarch-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120407.Dqc4kJYr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120407.Dqc4kJYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120407.Dqc4kJYr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/net/bpf_jit.c: In function 'gen_jump_or_nops':
>> arch/loongarch/net/bpf_jit.c:1380:13: warning: variable 'off' set but not used [-Wunused-but-set-variable]
    1380 |         s64 off = 0;
         |             ^~~


vim +/off +1380 arch/loongarch/net/bpf_jit.c

  1377	
  1378	static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool is_call)
  1379	{
> 1380		s64 off = 0;
  1381		struct jit_ctx ctx;
  1382	
  1383		ctx.idx = 0;
  1384		ctx.image = (union loongarch_instruction *)insns;
  1385	
  1386		if (!target) {
  1387			emit_insn((&ctx), NOP);
  1388			emit_insn((&ctx), NOP);
  1389			return 0;
  1390		}
  1391	
  1392		off = (s64)(target - ip);
  1393		return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T0 : LOONGARCH_GPR_ZERO,
  1394						(unsigned long)ip, (unsigned long)target);
  1395	}
  1396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
