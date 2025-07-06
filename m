Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6D1F463F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840093; cv=none; b=V/a9asNQShB/6aMbUOhV4iri0zAcOc+uS+u9cmImc67CKjsfdyfLVRy6YDfJ5p1qLuDeI7ej5Q+HrsCbXDvO05mj+0suUR+mdfg+bblzZxUSIVWFa/ItEl+tNs9bMV8qjrichsH8N6ktFZFIdmFU7K5zIpAf9a6xg93WeRzJf40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840093; c=relaxed/simple;
	bh=MtU/STv5lLCBKGTtU3uo02nW4S6JlUsV/HAUHGpREEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLUphLcGcsAk7p8M0zHYiSMNdw46Ov0gqlBoEUnXylIPc2/mU7s9bdgCHAg73i05uXeGQ29BX28ACHuK825/unBjQ2bn8Vo9mQWeCAf9l2ozNmn1cKeCU9VNFD3ShP5sPDtrSR1d6zoY7IlZCT7oSsMAvp6pLm/uzZEfV9ZacJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwonQz3G; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwonQz3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840093; x=1783376093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MtU/STv5lLCBKGTtU3uo02nW4S6JlUsV/HAUHGpREEc=;
  b=fwonQz3Gsbao0mLhsCCb/IDVZZwQsAdlukfYz+zfO1D9loDOFZgjgitr
   1+Zr6v1L29MCiajGYZDkrjhhANaJJIkO/JhVFdEjsUkdhyDwlULyuMx/T
   rD3HoLZLuL0JTOntUBheRwjJzkHobLIWwSHvSW05VS93neBs+/me/aXS9
   7i/lgaA0fXJWyLNeVlFUj571+2wwMpcRchJjwoin4jBiWmrT4jJ4foRrk
   dqqmlUxD2xjjnCSpI50DbQqWPwETfRWSrj5Ux8DboquvNi72VFlPMdkSr
   QW+GgCR+3WG4aeZbwbmqbbV1fiJeZhgcpB0QaWwzNAcan77NKEPqu6QF7
   g==;
X-CSE-ConnectionGUID: lAT7XL2DQvC7CrKv6LmH6g==
X-CSE-MsgGUID: /Tabqy1cRXWiFK5oePOAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65123387"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="65123387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:52 -0700
X-CSE-ConnectionGUID: Kag5lUd5RK68Xn7R+yi/Lw==
X-CSE-MsgGUID: pSoGQotZQe+OPdIMs6VwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154802325"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdI-00001V-04;
	Sun, 06 Jul 2025 22:14:48 +0000
Date: Mon, 7 Jul 2025 06:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: block/bfq.o: warning: objtool: bfq_bfqq_expire+0x3a8: sibling call
 from callable instruction with modified stack frame
Message-ID: <202507070332.OZWZVjr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f988d0788f50d8464f957e793fab356e2937369
commit: e20ab7d454ee8d1e0e8b9ff73a7c87e84c666b2f LoongArch: Enable jump table for objtool
date:   4 months ago
config: loongarch-randconfig-001-20250707 (https://download.01.org/0day-ci/archive/20250707/202507070332.OZWZVjr0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070332.OZWZVjr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070332.OZWZVjr0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bfq.o: warning: objtool: bfq_bfqq_expire+0x3a8: sibling call from callable instruction with modified stack frame
>> block/bfq.o: warning: objtool: bfq_set_next_ioprio_data+0x54: sibling call from callable instruction with modified stack frame
>> block/bfq.o: warning: objtool: bfq_get_queue+0xbc: sibling call from callable instruction with modified stack frame
--
   drivers/media/i2c/adv7842.c:396:19: warning: unused function 'cec_write_clr_set' [-Wunused-function]
     396 | static inline int cec_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask, u8 val)
         |                   ^~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/media/i2c/adv7842.o: warning: objtool: adv7842_g_register+0x48: sibling call from callable instruction with modified stack frame
>> drivers/media/i2c/adv7842.o: warning: objtool: adv7842_s_register+0x44: sibling call from callable instruction with modified stack frame
   drivers/media/i2c/adv7842.o: warning: objtool: adv7842_query_dv_timings+0x254: sibling call from callable instruction with modified stack frame
   drivers/media/i2c/adv7842.o: warning: objtool: select_input+0x3c: sibling call from callable instruction with modified stack frame
>> drivers/media/i2c/adv7842.o: warning: objtool: enable_input+0x3c: sibling call from callable instruction with modified stack frame
   drivers/media/i2c/adv7842.o: warning: objtool: adv7842_s_routing+0x48: sibling call from callable instruction with modified stack frame
   drivers/media/i2c/adv7842.o: warning: objtool: adv7842_querystd+0xc0: sibling call from callable instruction with modified stack frame
>> drivers/media/i2c/adv7842.o: warning: objtool: adv7842_set_format+0x70: sibling call from callable instruction with modified stack frame
>> drivers/media/i2c/adv7842.o: warning: objtool: adv7842_debugfs_if_read+0x84: sibling call from callable instruction with modified stack frame
   drivers/media/i2c/adv7842.o: warning: objtool: adv7842_s_ctrl+0x6c: sibling call from callable instruction with modified stack frame
--
   drivers/staging/gpib/ines/ines_gpib.c:29:23: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
      29 |         struct nec7210_priv *nec_priv;
         |                              ^
   drivers/staging/gpib/ines/ines_gpib.c:1123:21: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1123 |         struct local_info *dev;
         |                            ^
   2 warnings generated.
>> drivers/staging/gpib/ines/ines_gpib.o: warning: objtool: ines_common_pci_attach+0x2ac: sibling call from callable instruction with modified stack frame
--
   drivers/staging/gpib/cb7210/cb7210.c:383:23: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     383 |         struct nec7210_priv *nec_priv;
         |                              ^
   drivers/staging/gpib/cb7210/cb7210.c:1264:24: warning: variable 'handle' set but not used [-Wunused-but-set-variable]
    1264 |         struct pcmcia_device *handle;
         |                               ^
   drivers/staging/gpib/cb7210/cb7210.c:1265:21: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1265 |         struct local_info *dev;
         |                            ^
   3 warnings generated.
>> drivers/staging/gpib/cb7210/cb7210.o: warning: objtool: cb7210_accel_read+0x39c: sibling call from callable instruction with modified stack frame
>> drivers/staging/gpib/cb7210/cb7210.o: warning: objtool: cb7210_accel_write+0x15c: sibling call from callable instruction with modified stack frame
>> drivers/staging/gpib/cb7210/cb7210.o: warning: objtool: cb7210_init+0x80: sibling call from callable instruction with modified stack frame
>> drivers/staging/gpib/cb7210/cb7210.o: warning: objtool: cb_isa_attach+0xb0: sibling call from callable instruction with modified stack frame
--
   drivers/video/fbdev/aty/aty128fb.c:534:18: warning: unused function '_aty_ld_8' [-Wunused-function]
     534 | static inline u8 _aty_ld_8(unsigned int regindex,
         |                  ^~~~~~~~~
   1 warning generated.
>> drivers/video/fbdev/aty/aty128fb.o: warning: objtool: aty128_timings+0x1a8: sibling call from callable instruction with modified stack frame
   drivers/video/fbdev/aty/aty128fb.o: warning: objtool: aty128fb_check_var+0xa4: sibling call from callable instruction with modified stack frame
>> drivers/video/fbdev/aty/aty128fb.o: warning: objtool: aty128fb_setcolreg+0xb4: sibling call from callable instruction with modified stack frame
>> drivers/video/fbdev/aty/aty128fb.o: warning: objtool: aty128fb_blank+0x5c: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
