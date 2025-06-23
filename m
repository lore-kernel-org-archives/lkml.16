Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657723BCE3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695886; cv=none; b=UJu3WJOa+0UoK8yrvkVuVEEnbRBQ21qqVIPn4nQUWs98wpgjIrKKjb36M82PxuK1OKb1MkfcOdF2mux3SApjaeiF24waOFERvESma+shYSNRvws3WvpyuObDSu82F6XBWrGGmBvciMTczn4KfAckjfpv6Gqcm3tsjHfDGhACkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695886; c=relaxed/simple;
	bh=SE0KtjHhXn2herdLMGNKI2XffmCWl8HYOU2TyxZYhlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHJJzQATjR7zT5srvMPO+8PPbURPd02NqM2qS3j18yGTWU7kYrE9VJgxkG2U1tZf+t7imadfSaoIfb8q+LYEgGvP6/XLFZZO9MUPguHYWhk5mdkhf0EaSk2ZuOj7ca6OdYDqLb42FPHaTR0gZmuO3QpRqyDHH7rjaRaeiygSy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUMsVuK4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUMsVuK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750695884; x=1782231884;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SE0KtjHhXn2herdLMGNKI2XffmCWl8HYOU2TyxZYhlU=;
  b=hUMsVuK4YFpfLq5iH1xraj2zlHWfQnIpctOhX6lNfB29iN7QcNa45nSq
   OI7jmN5J9JDxp5MRUPETeB6YZUPJKwi+zRoeGMbReDd2MXxODzHQl8uLu
   EUH1aboF9IpLthUcY7zjAAUH1ue1IgG/qlDtoI1JIX7dyjmi7+vNXfafC
   Io75jTPpbc6qless/DzS3C9gFJGlp7cHKFiwfE+Jt4SywP3ER8xB3Fc4y
   rdxOehDn5uSdkQonhmSLFYW8oS+uCbRtiy+iwoQZGQzNuw7nOidiHhEBR
   0O34mVMkPsFhX8/TVg688LvCNwshKwJtgA1fVqHKKIpeQhO52+DNoFh+v
   A==;
X-CSE-ConnectionGUID: QW8uhT2GSSConYKLHx4crQ==
X-CSE-MsgGUID: wMzyBjzMSES6c5N0KpR30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52782813"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52782813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 09:24:44 -0700
X-CSE-ConnectionGUID: 3AoDh/1UQIiImftMkLXUMg==
X-CSE-MsgGUID: xnzkbZfRQwSTOLWs6lirxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151948477"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 09:24:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTjyJ-000P66-2G;
	Mon, 23 Jun 2025 16:24:39 +0000
Date: Tue, 24 Jun 2025 00:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: arch/s390/kvm/kvm-s390.c:5016:5: warning: stack frame size (1152)
 exceeds limit (1024) in 'kvm_arch_vcpu_ioctl_run'
Message-ID: <202506240041.AuLxoIKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 5ade5be4edf855245955108860d2016af3065a37 s390: Add infrastructure to patch lowcore accesses
date:   11 months ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240041.AuLxoIKn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240041.AuLxoIKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240041.AuLxoIKn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/kvm/kvm-s390.c:22:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kvm/kvm-s390.c:22:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kvm/kvm-s390.c:22:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/s390/kvm/kvm-s390.c:5016:5: warning: stack frame size (1152) exceeds limit (1024) in 'kvm_arch_vcpu_ioctl_run' [-Wframe-larger-than]
    5016 | int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
         |     ^
   13 warnings generated.


vim +/kvm_arch_vcpu_ioctl_run +5016 arch/s390/kvm/kvm-s390.c

b028ee3edd54d3 David Hildenbrand     2014-07-17  5015  
1b94f6f81007b4 Tianjia Zhang         2020-04-16 @5016  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
b0c632db637d68 Heiko Carstens        2008-03-25  5017  {
1b94f6f81007b4 Tianjia Zhang         2020-04-16  5018  	struct kvm_run *kvm_run = vcpu->run;
066c40918bb495 Heiko Carstens        2024-02-03  5019  	DECLARE_KERNEL_FPU_ONSTACK32(fpu);
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5020  	int rc;
b0c632db637d68 Heiko Carstens        2008-03-25  5021  
0460eb35b443f7 Janosch Frank         2022-05-17  5022  	/*
0460eb35b443f7 Janosch Frank         2022-05-17  5023  	 * Running a VM while dumping always has the potential to
0460eb35b443f7 Janosch Frank         2022-05-17  5024  	 * produce inconsistent dump data. But for PV vcpus a SIE
0460eb35b443f7 Janosch Frank         2022-05-17  5025  	 * entry while dumping could also lead to a fatal validity
0460eb35b443f7 Janosch Frank         2022-05-17  5026  	 * intercept which we absolutely want to avoid.
0460eb35b443f7 Janosch Frank         2022-05-17  5027  	 */
0460eb35b443f7 Janosch Frank         2022-05-17  5028  	if (vcpu->kvm->arch.pv.dumping)
0460eb35b443f7 Janosch Frank         2022-05-17  5029  		return -EINVAL;
0460eb35b443f7 Janosch Frank         2022-05-17  5030  
a6816314af5749 David Matlack         2024-05-03  5031  	if (!vcpu->wants_to_run)
460df4c1fc7c00 Paolo Bonzini         2017-02-08  5032  		return -EINTR;
460df4c1fc7c00 Paolo Bonzini         2017-02-08  5033  
200824f55eef40 Thomas Huth           2019-09-04  5034  	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
200824f55eef40 Thomas Huth           2019-09-04  5035  	    kvm_run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
200824f55eef40 Thomas Huth           2019-09-04  5036  		return -EINVAL;
200824f55eef40 Thomas Huth           2019-09-04  5037  
accb757d798c9b Christoffer Dall      2017-12-04  5038  	vcpu_load(vcpu);
accb757d798c9b Christoffer Dall      2017-12-04  5039  
27291e2165b6de David Hildenbrand     2014-01-23  5040  	if (guestdbg_exit_pending(vcpu)) {
27291e2165b6de David Hildenbrand     2014-01-23  5041  		kvm_s390_prepare_debug_exit(vcpu);
accb757d798c9b Christoffer Dall      2017-12-04  5042  		rc = 0;
accb757d798c9b Christoffer Dall      2017-12-04  5043  		goto out;
27291e2165b6de David Hildenbrand     2014-01-23  5044  	}
27291e2165b6de David Hildenbrand     2014-01-23  5045  
20b7035c66bacc Jan H. Schönherr      2017-11-24  5046  	kvm_sigset_activate(vcpu);
b0c632db637d68 Heiko Carstens        2008-03-25  5047  
fe28c7868f68b8 Janosch Frank         2019-05-15  5048  	/*
fe28c7868f68b8 Janosch Frank         2019-05-15  5049  	 * no need to check the return value of vcpu_start as it can only have
fe28c7868f68b8 Janosch Frank         2019-05-15  5050  	 * an error for protvirt, but protvirt means user cpu state
fe28c7868f68b8 Janosch Frank         2019-05-15  5051  	 */
6352e4d2dd9a34 David Hildenbrand     2014-04-10  5052  	if (!kvm_s390_user_cpu_state_ctrl(vcpu->kvm)) {
6852d7b69b4949 David Hildenbrand     2014-03-14  5053  		kvm_s390_vcpu_start(vcpu);
6352e4d2dd9a34 David Hildenbrand     2014-04-10  5054  	} else if (is_vcpu_stopped(vcpu)) {
ea2cdd27dce66d David Hildenbrand     2015-05-20  5055  		pr_err_ratelimited("can't run stopped vcpu %d\n",
6352e4d2dd9a34 David Hildenbrand     2014-04-10  5056  				   vcpu->vcpu_id);
accb757d798c9b Christoffer Dall      2017-12-04  5057  		rc = -EINVAL;
accb757d798c9b Christoffer Dall      2017-12-04  5058  		goto out;
6352e4d2dd9a34 David Hildenbrand     2014-04-10  5059  	}
b0c632db637d68 Heiko Carstens        2008-03-25  5060  
ed3a0a011a9c33 Heiko Carstens        2024-02-03  5061  	kernel_fpu_begin(&fpu, KERNEL_FPC | KERNEL_VXR);
2f0a83bece1e75 Tianjia Zhang         2020-06-23  5062  	sync_regs(vcpu);
db0758b2970981 David Hildenbrand     2016-02-15  5063  	enable_cpu_timer_accounting(vcpu);
d7b0b5eb3000c6 Carsten Otte          2009-11-19  5064  
dab4079d5b5ac4 Heiko Carstens        2009-06-12  5065  	might_fault();
e168bf8de33e16 Carsten Otte          2012-01-04  5066  	rc = __vcpu_run(vcpu);
9ace903d171db7 Christian Ehrhardt    2009-05-20  5067  
b1d16c495d9e6f Christian Ehrhardt    2009-05-20  5068  	if (signal_pending(current) && !rc) {
b1d16c495d9e6f Christian Ehrhardt    2009-05-20  5069  		kvm_run->exit_reason = KVM_EXIT_INTR;
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5070  		rc = -EINTR;
b1d16c495d9e6f Christian Ehrhardt    2009-05-20  5071  	}
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5072  
27291e2165b6de David Hildenbrand     2014-01-23  5073  	if (guestdbg_exit_pending(vcpu) && !rc)  {
27291e2165b6de David Hildenbrand     2014-01-23  5074  		kvm_s390_prepare_debug_exit(vcpu);
27291e2165b6de David Hildenbrand     2014-01-23  5075  		rc = 0;
27291e2165b6de David Hildenbrand     2014-01-23  5076  	}
27291e2165b6de David Hildenbrand     2014-01-23  5077  
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5078  	if (rc == -EREMOTE) {
71f116bfedfdd6 David Hildenbrand     2015-10-19  5079  		/* userspace support is needed, kvm_run has been prepared */
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5080  		rc = 0;
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5081  	}
8f2abe6a1e525e Christian Borntraeger 2008-03-25  5082  
db0758b2970981 David Hildenbrand     2016-02-15  5083  	disable_cpu_timer_accounting(vcpu);
2f0a83bece1e75 Tianjia Zhang         2020-06-23  5084  	store_regs(vcpu);
ed3a0a011a9c33 Heiko Carstens        2024-02-03  5085  	kernel_fpu_end(&fpu, KERNEL_FPC | KERNEL_VXR);
d7b0b5eb3000c6 Carsten Otte          2009-11-19  5086  
20b7035c66bacc Jan H. Schönherr      2017-11-24  5087  	kvm_sigset_deactivate(vcpu);
b0c632db637d68 Heiko Carstens        2008-03-25  5088  
b0c632db637d68 Heiko Carstens        2008-03-25  5089  	vcpu->stat.exit_userspace++;
accb757d798c9b Christoffer Dall      2017-12-04  5090  out:
accb757d798c9b Christoffer Dall      2017-12-04  5091  	vcpu_put(vcpu);
7e8e6ab48d7814 Heiko Carstens        2008-04-04  5092  	return rc;
b0c632db637d68 Heiko Carstens        2008-03-25  5093  }
b0c632db637d68 Heiko Carstens        2008-03-25  5094  

:::::: The code at line 5016 was first introduced by commit
:::::: 1b94f6f81007b4afaea3480ec018bc9236148961 KVM: Remove redundant argument to kvm_arch_vcpu_ioctl_run

:::::: TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
