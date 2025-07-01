Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495226FD95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 23:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751413226; cv=none; b=a7D64toyPtDq6Kf0ljXCGi/40836u1I+8Ee7/IafvJ7HCdzeOSng66OWxDauderBn2ZppWctJKVmVT5KOoBJ5zFB3fk18zkgqxyfwQa/SOuADeSYPr9HsXcy5usMOb/uyU3TVBXXON98TuHHoIRlI//4xBkWRXrkPiXO4m0/INc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751413226; c=relaxed/simple;
	bh=mYN0e13r8Tr4QR++0z5LQgS7dD6UVpTD1lDqF/tl5vA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXM5C0uC2xMXaBvIJ4+ogD8rfd6qLNEgHv8bNkqpYmeos/6xJF0+hNfQFIurIVW0d092tCs2Rjqfq+LMv92GyjWy927mHJ2ConNs0a0s6g0+lRrn5F/AngEb5nalVUiPcMAMYZAks6mXdiMUmyV0dzkoyRU/ZenzbEB0gUjHZ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moUkqfUl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moUkqfUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751413225; x=1782949225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYN0e13r8Tr4QR++0z5LQgS7dD6UVpTD1lDqF/tl5vA=;
  b=moUkqfUlsVjbkaAfu5AU8ZC21g/aDBi9qQ4046XGymY2AGXvIjv10yVt
   Kq1C35R9OSHNSwPCe2vvTocm+WjGJPcAbqMG24rQgjBcn1N1kN0vW90Xs
   yjuSHU7gfy0ydOL0a0gchoUcXsSQ/S/z3+BdKUEe1bj0eoMVvuJm2CNBU
   mGB5ahUnna53ygVKtm6f5f9k4bL0qOjglsLqxIYOX6H+Isbe3++Mktkg4
   INpM/HtAlBnjvhJe0J1ghxZ5xkv/H+LuS41EZF1uOhLaHfhPOZo1uC+pq
   f+HtDBkUlN+i6uPDAkKiU+E5rEHStQKaEpKtgNVV+dODgxUuukJ11+aqZ
   w==;
X-CSE-ConnectionGUID: k9DHYHm3RzqoXWwBX9jozw==
X-CSE-MsgGUID: 0lahEin1QhmEwysqxMKjTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53565991"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53565991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 16:40:24 -0700
X-CSE-ConnectionGUID: 6PmHdZQoQoW9vOlZhP3lvQ==
X-CSE-MsgGUID: IZDvPB5uS8eoLgMNZzDgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="177580345"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 16:40:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWkaJ-000ame-1p;
	Tue, 01 Jul 2025 23:40:19 +0000
Date: Wed, 2 Jul 2025 07:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/verifier.c:22283:5: warning: stack frame size (1128)
 exceeds limit (1024) in 'bpf_check'
Message-ID: <202507020700.GNYcaFbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66701750d5565c574af42bef0b789ce0203e3071
commit: 7dd34d7b7dcf9309fc6224caf4dd5b35bedddcb7 bpf: Fix a sdiv overflow issue
date:   10 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250702/202507020700.GNYcaFbV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020700.GNYcaFbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020700.GNYcaFbV-lkp@intel.com/

All warnings (new ones prefixed by >>):

          |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:11652:21: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11652 |         case PTR_TO_BTF_ID | MEM_ALLOC:
          |              ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12148:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12148 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12153:43: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12153 |                         } else if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC | MEM_PERCPU)) {
          |                                                  ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12187:25: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12187 |                                    (dynptr_arg_type & MEM_UNINIT)) {
          |                                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:12207:26: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12207 |                         if (!(dynptr_arg_type & MEM_UNINIT)) {
          |                               ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:12234:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12234 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12238:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12238 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12248:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12248 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12252:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12252 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12261:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12261 |                         if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12284:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12284 |                                 if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                                   ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12556:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12556 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:494:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     494 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12556:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12556 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:499:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     499 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12736:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12736 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12746:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12746 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12765:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12765 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/verifier.c:12777:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12777 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12794:39: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12794 |                                 regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
          |                                                        ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12865:24: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12865 |                                 if (cur_iter->type & MEM_RCU) /* KF_RCU_PROTECTED */
          |                                     ~~~~~~~~~~~~~~ ^ ~~~~~~~
   kernel/bpf/verifier.c:13325:20: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13325 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
          |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:18302:31: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18302 |                         *prev_type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:18767:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18767 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:18786:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18786 |                 aux->btf_var.reg_type = PTR_TO_BTF_ID | MEM_PERCPU;
          |                                         ~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:18803:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18803 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:19841:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19841 |                 case PTR_TO_BTF_ID | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:19848:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19848 |                 case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:21576:51: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21576 |                         } else if (arg->arg_type == (ARG_PTR_TO_DYNPTR | MEM_RDONLY)) {
          |                                                      ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:21581:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21581 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21588:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21588 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21590:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21590 |                                 if (arg->arg_type & PTR_UNTRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21592:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21592 |                                 if (arg->arg_type & PTR_TRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
>> kernel/bpf/verifier.c:22283:5: warning: stack frame size (1128) exceeds limit (1024) in 'bpf_check' [-Wframe-larger-than]
    22283 | int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u32 uattr_size)
          |     ^
   105 warnings generated.


vim +/bpf_check +22283 kernel/bpf/verifier.c

76654e67f3a01c Alan Maguire    2020-09-28  22282  
47a71c1f9af0a3 Andrii Nakryiko 2023-04-06 @22283  int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u32 uattr_size)

:::::: The code at line 22283 was first introduced by commit
:::::: 47a71c1f9af0a334c9dfa97633c41de4feda4287 bpf: Add log_true_size output field to return necessary log buffer size

:::::: TO: Andrii Nakryiko <andrii@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
