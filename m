Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318621B90B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142874; cv=none; b=EuctPEEdhreUXiUJ82pDtplw9O3LC/9svDjZihT6zbMwzXXm77tKDqAMws/QHlwqsc6oK24Y5fwfugxtEChgH19KOsS7agZHhdMu+8pwRB5wHhuU0VbTgz5vXkxa4syEKfvxy3p0Him50CXiv/yNoigJqYxwoOSJWWnK9nK2z7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142874; c=relaxed/simple;
	bh=O1p8exRu3VMRQ2hGBvCPd1h54+d+kCb4Jo0XlGndlr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhAjvnzLjMRrUS4z3/sBNuywg/sLVQy92I2qG4wIrFaAbfjUPJOOzYeGRIlFarIlHvq1+HMb/+DQ4DZrGyAMvlC8pWxjG4u87+LiKMD13ZAq3wRYIb5IaxwUjHIJaynHyX47XPUj9ZBU/h2U+STT/sO0Wy9U0MsjLEAZsTPB/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xlqy66UA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xlqy66UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746142872; x=1777678872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1p8exRu3VMRQ2hGBvCPd1h54+d+kCb4Jo0XlGndlr0=;
  b=Xlqy66UAKFDS8Q7XDAY8/COfLJsi81Wc4CqZioCsUN/jIlaw2hBPiVqN
   ZecLclJztWfA5yQcO7+ECYGp7ACRvNOUSrx8Im3zeHIsNfnyRM4Y4wnlw
   ONqFJhMFwXF1DcdLt4sOrnihcPO88Lws0sH00ORFHjUE/YefxmkV9De38
   g0SEt0Q3Z5JvXa6dqIapRh8u0upTTnB5/ckQQ3GW6eM+lcyR87fJ9olq8
   IBVy1oHy/gNJ61kU1x9sueiGUHsqNh0AfIFaJP59FMJp+VRSrlZHnLvag
   Oa89y5J2ZMS12JzSDoeKcVYVg3M2gOXOQdmg0eeazyJD9z/3ykwTE+fZb
   w==;
X-CSE-ConnectionGUID: jGdZaCJmSRGTNNZ69cyhHQ==
X-CSE-MsgGUID: txBi2aq5Rg+NheUh53L4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="70330474"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="70330474"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:41:12 -0700
X-CSE-ConnectionGUID: IalpYmibQ7uRIph/Tsmd1w==
X-CSE-MsgGUID: 8iVtwPZeQqikCjsdfO/j2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="135035341"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2025 16:41:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAdWd-0004Rb-2Q;
	Thu, 01 May 2025 23:41:07 +0000
Date: Fri, 2 May 2025 07:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/kvm/book3s_xive.c:357:41: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202505020704.ohBUEBYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
commit: 0305292f17bc1f4fc66a24a8dd1a5e047673c02d powerpc/io: Use generic raw accessors
date:   9 weeks ago
config: powerpc64-randconfig-r122-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020704.ohBUEBYk-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250502/202505020704.ohBUEBYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020704.ohBUEBYk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/kvm/book3s_xive.c:51:15: sparse: sparse: cast to restricted __be16
>> arch/powerpc/kvm/book3s_xive.c:357:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be64 [usertype] qw1 @@     got unsigned long long @@
   arch/powerpc/kvm/book3s_xive.c:357:41: sparse:     expected restricted __be64 [usertype] qw1
   arch/powerpc/kvm/book3s_xive.c:357:41: sparse:     got unsigned long long
>> arch/powerpc/kvm/book3s_xive.c:701:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] value @@     got restricted __be64 [usertype] w01 @@
   arch/powerpc/kvm/book3s_xive.c:701:57: sparse:     expected unsigned long long [usertype] value
   arch/powerpc/kvm/book3s_xive.c:701:57: sparse:     got restricted __be64 [usertype] w01
>> arch/powerpc/kvm/book3s_xive.c:702:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] xive_cam_word @@
   arch/powerpc/kvm/book3s_xive.c:702:32: sparse:     expected unsigned int [usertype] value
   arch/powerpc/kvm/book3s_xive.c:702:32: sparse:     got restricted __be32 [usertype] xive_cam_word
>> arch/powerpc/kvm/book3s_xive.c:774:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] w01 @@     got unsigned long long @@
   arch/powerpc/kvm/book3s_xive.c:774:49: sparse:     expected restricted __be64 [usertype] w01
   arch/powerpc/kvm/book3s_xive.c:774:49: sparse:     got unsigned long long

vim +357 arch/powerpc/kvm/book3s_xive.c

5af50993850a48b Benjamin Herrenschmidt 2017-04-05  335  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  336  static unsigned long xive_vm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server)
b22af9041927075 Alexey Kardashevskiy   2022-05-09  337  {
b22af9041927075 Alexey Kardashevskiy   2022-05-09  338  	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  339  	u8 pending = xc->pending;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  340  	u32 hirq;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  341  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  342  	pr_devel("H_IPOLL(server=%ld)\n", server);
b22af9041927075 Alexey Kardashevskiy   2022-05-09  343  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  344  	xc->stat_vm_h_ipoll++;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  345  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  346  	/* Grab the target VCPU if not the current one */
b22af9041927075 Alexey Kardashevskiy   2022-05-09  347  	if (xc->server_num != server) {
b22af9041927075 Alexey Kardashevskiy   2022-05-09  348  		vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
b22af9041927075 Alexey Kardashevskiy   2022-05-09  349  		if (!vcpu)
b22af9041927075 Alexey Kardashevskiy   2022-05-09  350  			return H_PARAMETER;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  351  		xc = vcpu->arch.xive_vcpu;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  352  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  353  		/* Scan all priorities */
b22af9041927075 Alexey Kardashevskiy   2022-05-09  354  		pending = 0xff;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  355  	} else {
b22af9041927075 Alexey Kardashevskiy   2022-05-09  356  		/* Grab pending interrupt if any */
b22af9041927075 Alexey Kardashevskiy   2022-05-09 @357  		__be64 qw1 = __raw_readq(xive_tima + TM_QW1_OS);
b22af9041927075 Alexey Kardashevskiy   2022-05-09  358  		u8 pipr = be64_to_cpu(qw1) & 0xff;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  359  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  360  		if (pipr < 8)
b22af9041927075 Alexey Kardashevskiy   2022-05-09  361  			pending |= 1 << pipr;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  362  	}
b22af9041927075 Alexey Kardashevskiy   2022-05-09  363  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  364  	hirq = xive_vm_scan_interrupts(xc, pending, scan_poll);
b22af9041927075 Alexey Kardashevskiy   2022-05-09  365  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  366  	/* Return interrupt and old CPPR in GPR4 */
0e85b7df9cb0c65 Jordan Niethe          2023-09-14  367  	kvmppc_set_gpr(vcpu, 4, hirq | (xc->cppr << 24));
b22af9041927075 Alexey Kardashevskiy   2022-05-09  368  
b22af9041927075 Alexey Kardashevskiy   2022-05-09  369  	return H_SUCCESS;
b22af9041927075 Alexey Kardashevskiy   2022-05-09  370  }
b22af9041927075 Alexey Kardashevskiy   2022-05-09  371  

:::::: The code at line 357 was first introduced by commit
:::::: b22af9041927075b82bcaf4b6c7a354688198d47 KVM: PPC: Book3s: Remove real mode interrupt controller hcalls handlers

:::::: TO: Alexey Kardashevskiy <aik@ozlabs.ru>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
