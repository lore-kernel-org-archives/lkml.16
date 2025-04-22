Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCF717A2F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287779; cv=none; b=VySxsA7VlXLJWIv9BDQ4nM/LYWmDE94QmCJb/v9aG6uCK3AHzroEqyxiUGCI6P4ldkCIMeUSz8IKKpIyvD+usMi4mbQ1AoVFKDOjcubLcTXuNA7pRBHwIkjm8FC72WSNA+k75nBXO76RrBa6fi5mOnzX0SDTmxIwf7Mcf/OqQLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287779; c=relaxed/simple;
	bh=0u4uoLsMjYerEVVmDnM3bctHcBt3Bs6ixTgEn44HZII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EHdIMgtWuhbHNQ+n+tIl1Tc+1TQIcY5Y4Aej+nwca/zBUZ0sQoscEmmE6irhcn6Tds2CRVeEblWisgfjyNfNIav1K5Y73GDlKkfAaaNx+sEu4SCH/Q9JZrpRxv69dg2nGhHxgQ6z8tYxk14pHvKmpgngQCDXcJY8q/v58jiJvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwoudBVQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwoudBVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745287776; x=1776823776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0u4uoLsMjYerEVVmDnM3bctHcBt3Bs6ixTgEn44HZII=;
  b=ZwoudBVQfub3vAIGYbHo5hEjmfHWskNA8NjhM3QgpnF9A8zyXCUeHaaN
   fF8U3+3YyCj+EYflL3qBVY+5USEVNx4bbBekhjWs4Rd8Jz7v8glxUOF3X
   ZTV9eWgR9OrMn/5s1tRYl7obErJU45m5nv364yUG+cjgrEXQBGpJKt27D
   9YvyqFGFKbjQLxMGb56glhUD/Fc+bGgGn1UHy2YgwI+EdDnYm8xbtfiOP
   7WzsHzsnNGQCEpAPykK1IIOCvKM/PgQQQkI8H785bVVbJsgTqD+ZI+GWL
   MPCu26xXRbLR+DLNQVZzW8pkXLa/PCkzpPoPKRBuLnqSB/HXzU54N6rmp
   A==;
X-CSE-ConnectionGUID: q5/dr6XdSIO8n5LG9DXomw==
X-CSE-MsgGUID: QDuyFs+gQ6yN24hMonbxGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72226421"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="72226421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 19:09:36 -0700
X-CSE-ConnectionGUID: SK5yHXx1Rza6fZHbF94jkw==
X-CSE-MsgGUID: qNOkQWmMSGGw508eX2pw6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132835552"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2025 19:09:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u734l-0000Wb-2C;
	Tue, 22 Apr 2025 02:09:31 +0000
Date: Tue, 22 Apr 2025 10:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: /usr/bin/ld: main.c:undefined reference to
 `__ubsan_handle_sub_overflow'
Message-ID: <202504221019.7ZvJLdr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d7a0577c9db35c4cc52db90bc415ea248446472
commit: ed2b548f1017586c44f50654ef9febb42d491f31 ubsan/overflow: Rework integer overflow sanitizer option to turn on everything
date:   6 weeks ago
config: um-randconfig-r063-20250422 (https://download.01.org/0day-ci/archive/20250422/202504221019.7ZvJLdr1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504221019.7ZvJLdr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504221019.7ZvJLdr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: init/main.o: in function `__traceiter_initcall_level':
>> main.c:(.ltext+0xc5): undefined reference to `__ubsan_handle_add_overflow'
>> /usr/bin/ld: main.c:(.ltext+0xf2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o: in function `__traceiter_initcall_start':
   main.c:(.ltext+0x245): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0x272): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o: in function `__traceiter_initcall_finish':
   main.c:(.ltext+0x3d6): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.ltext+0x403): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.ltext+0x885): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: main.c:(.ltext+0x8b0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0x8e6): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0x913): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0x940): undefined reference to `__ubsan_handle_add_overflow'
>> /usr/bin/ld: main.c:(.ltext+0x977): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: main.c:(.ltext+0x9aa): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0x9d7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0xa04): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0xa31): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ltext+0xa5e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.ltext+0xa8b): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x14ae): undefined reference to `__ubsan_handle_implicit_conversion'
>> /usr/bin/ld: main.c:(.init.text+0x14d9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1506): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1533): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1566): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x159d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x15ca): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `start_kernel':
>> main.c:(.init.text+0x17ef): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: main.c:(.init.text+0x181b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1848): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: init/main.o: in function `setup_boot_config':
>> main.c:(.init.text+0x1d7d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1daa): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1dd7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1e04): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x1e31): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x1e5e): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `setup_command_line':
   main.c:(.init.text+0x25b9): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: main.c:(.init.text+0x25e4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x2614): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x2645): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x2675): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x26a2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x26cf): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `setup_command_line':
   main.c:(.init.text+0x2734): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: main.c:(.init.text+0x2764): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x27a4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x27d1): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x27fe): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x282b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x2858): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `get_boot_config_from_initrd':
   main.c:(.init.text+0x4d20): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: main.c:(.init.text+0x4d4d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x4d7a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x4da7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x4dd4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x4e01): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x4ee7): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `xbc_calc_checksum':
   main.c:(.init.text+0x53ce): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: init/main.o: in function `xbc_snprint_cmdline':
   main.c:(.init.text+0x545f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x5606): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x56b8): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x572b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x5758): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x578f): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `xbc_snprint_cmdline':
   main.c:(.init.text+0x58cc): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: main.c:(.init.text+0x58fc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x594d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o: in function `repair_env_string':
   main.c:(.init.text+0x5b0a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x5b37): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x5bc4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x5bf1): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `obsolete_checksetup':
   main.c:(.init.text+0x5f64): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: main.c:(.init.text+0x5f91): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x5fcb): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x6005): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x6035): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.init.text+0x6065): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.init.text+0x6092): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/main.o: in function `do_initcall_level':
   main.c:(.init.text+0x6cba): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: init/main.o: in function `trace_initcall_finish_cb':
   main.c:(.init.text+0x6e9a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o: in function `kernel_init':
   main.c:(.ref.text+0x524): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ref.text+0x6fd): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ref.text+0x748): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: main.c:(.ref.text+0x793): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/main.o:main.c:(.ref.text+0x7c0): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/do_mounts.o: in function `root_delay_setup':
   do_mounts.c:(.init.text+0x695): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: init/do_mounts.o: in function `mount_root_generic':
   do_mounts.c:(.init.text+0x9bc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x9e9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0xa16): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0xa8d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0xb79): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/do_mounts.o:do_mounts.c:(.init.text+0xd32): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/do_mounts.o: in function `prepare_namespace':
   do_mounts.c:(.init.text+0x2099): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x20c6): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x20f3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x2120): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x214d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x217a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/do_mounts.o:do_mounts.c:(.init.text+0x21a7): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/do_mounts.o: in function `wait_for_root':
   do_mounts.c:(.init.text+0x2a83): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x2ab0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x2ae3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x2b10): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/do_mounts.o: in function `fs_is_nodev':
   do_mounts.c:(.init.text+0x2c37): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: do_mounts.c:(.init.text+0x2c64): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/do_mounts.o:do_mounts.c:(.ltext+0x2ba): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `reserve_initrd_mem':
>> initramfs.c:(.init.text+0x40c): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x437): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x465): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x495): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4c5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4f2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x51f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x54c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x579): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `do_populate_rootfs':
   initramfs.c:(.init.text+0xc72): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xc9d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xcca): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xcf7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xd27): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xd52): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xd7f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xdaf): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0xddc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o: in function `unpack_to_rootfs':
   initramfs.c:(.init.text+0x1792): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x17c9): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `unpack_to_rootfs':
   initramfs.c:(.init.text+0x1846): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x187d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x18be): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x18f5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1936): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x196d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x19a4): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `unpack_to_rootfs':
   initramfs.c:(.init.text+0x1acc): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1af9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1b30): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1c31): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1c5e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x1c8b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x1cb8): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `write_buffer':
   initramfs.c:(.init.text+0x1e32): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: init/initramfs.o: in function `flush_buffer':
   initramfs.c:(.init.text+0x20e1): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x211c): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2156): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x219f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x21d8): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2208): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2242): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x226f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o: in function `error':
   initramfs.c:(.init.text+0x235c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2386): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x2511): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `do_collect':
   initramfs.c:(.init.text+0x2710): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x273b): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2766): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x2793): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x27c3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x27f0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o: in function `do_header':
   initramfs.c:(.init.text+0x2d82): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x2daf): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `do_header':
   initramfs.c:(.init.text+0x3117): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: init/initramfs.o: in function `do_skip':
   initramfs.c:(.init.text+0x3286): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x32ae): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x32d6): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3305): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x3330): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3375): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: init/initramfs.o: in function `do_name':
   initramfs.c:(.init.text+0x369b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x397a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3bae): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3bdb): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3c08): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3c35): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3c62): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3c8f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x3cbc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x3ced): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `do_copy':
   initramfs.c:(.init.text+0x430a): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x433a): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4367): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4392): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x43bf): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x43ec): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4419): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4446): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x4473): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `do_symlink':
   initramfs.c:(.init.text+0x46cc): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x46f9): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4726): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4753): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x4780): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x47ab): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x47db): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x4920): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `eat':
   initramfs.c:(.init.text+0x4b7f): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: init/initramfs.o: in function `parse_header':
   initramfs.c:(.init.text+0x4dbf): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4dec): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4e19): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4e46): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x4e73): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: init/initramfs.o: in function `clean_path':
   initramfs.c:(.init.text+0x50b5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x50e2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x5114): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x5141): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o: in function `maybe_link':
   initramfs.c:(.init.text+0x5334): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x5361): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `maybe_link':
   initramfs.c:(.init.text+0x5390): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x53be): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x53ec): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: initramfs.c:(.init.text+0x5417): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x5444): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o: in function `dir_add':
   initramfs.c:(.init.text+0x566c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x569c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x56c9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x56f9): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/initramfs.o: in function `xwrite':
   initramfs.c:(.init.text+0x6449): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x6476): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x64ad): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x64de): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x650b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: initramfs.c:(.init.text+0x65f8): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/initramfs.o:initramfs.c:(.init.text+0x6625): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/calibrate.o: in function `calibrate_delay':
   calibrate.c:(.ltext+0x838): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0x8fc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0x932): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0x975): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0x9c3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xa0c): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xa47): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xa7a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xb07): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xb38): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xb65): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: init/calibrate.o:calibrate.c:(.ltext+0xb92): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: init/calibrate.o: in function `calibrate_delay':
   calibrate.c:(.ltext+0xda1): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xdce): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xdf6): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: calibrate.c:(.ltext+0xe23): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/irq.o: in function `sigio_handler':
   irq.c:(.ltext+0x4b5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: irq.c:(.ltext+0x4f1): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/irq.o:irq.c:(.ltext+0x528): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/mem.o: in function `mem_init':
   mem.c:(.init.text+0x193): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mem.c:(.init.text+0x1c3): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mem.c:(.init.text+0x1f5): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mem.c:(.init.text+0x21d): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: arch/um/kernel/mem.o: in function `paging_init':
   mem.c:(.init.text+0x365): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.init.text+0x392): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/mem.o: in function `pgd_alloc':
>> mem.c:(.ltext+0x651): undefined reference to `__ubsan_handle_add_overflow'
>> /usr/bin/ld: mem.c:(.ltext+0x687): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x6b4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x6e7): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mem.c:(.ltext+0x71b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x74e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x77b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x7b5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x7f2): undefined reference to `__ubsan_handle_add_overflow'
>> /usr/bin/ld: mem.c:(.ltext+0x81d): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x84d): undefined reference to `__ubsan_handle_mul_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x892): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x8bf): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x8ec): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x919): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mem.c:(.ltext+0x94c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/mem.o:mem.c:(.ltext+0x97f): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `setup_physmem':
   physmem.c:(.init.text+0x33a): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x36d): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x3aa): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x3d2): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x3fd): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o:physmem.c:(.init.text+0x428): more undefined references to `__ubsan_handle_sub_overflow' follow
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `setup_physmem':
   physmem.c:(.init.text+0x450): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x480): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x4b0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x4dd): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x50f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.init.text+0x53c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `map_memory':
   physmem.c:(.ltext+0x166): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o:physmem.c:(.ltext+0x201): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `phys_mapping':
   physmem.c:(.ltext+0x641): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0x6b9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0x6f9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0x75c): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `find_iomem':
   physmem.c:(.ltext+0x81a): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0x8a7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `setup_iomem':
   physmem.c:(.ltext+0xa3b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0xa69): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0xa96): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/physmem.o:physmem.c:(.ltext+0xac6): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/physmem.o: in function `setup_iomem':
   physmem.c:(.ltext+0xaf4): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: physmem.c:(.ltext+0xb31): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/time.o: in function `timer_handler':
   time.c:(.ltext+0x148): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: time.c:(.ltext+0x175): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/time.o: in function `um_timer':
   time.c:(.ltext+0x31e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: time.c:(.ltext+0x352): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/time.o:time.c:(.ltext+0x3fb): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/um_arch.o: in function `linux_main':
   um_arch.c:(.init.text+0xb80): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xbb0): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xbe3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xc16): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xc56): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xc89): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xcc5): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xcff): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xd2c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xd5c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xd89): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xdb9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xde6): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xe1d): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: um_arch.c:(.init.text+0xe4b): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xe77): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xea2): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xed2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xefa): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xf25): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xf55): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xf84): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xfaf): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0xfde): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: um_arch.c:(.init.text+0x1009): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x1036): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x1063): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x1090): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x10bd): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/um_arch.o:um_arch.c:(.init.text+0x10ea): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/um_arch.o: in function `linux_main':
   um_arch.c:(.init.text+0x117f): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x11c3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x11fa): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x1234): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x126c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x12a1): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x12d4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x1301): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x132e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/um_arch.o:um_arch.c:(.init.text+0x135b): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/um_arch.o: in function `parse_cache_line':
   um_arch.c:(.init.text+0x1ef6): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: arch/um/kernel/um_arch.o: in function `setup_arch':
>> um_arch.c:(.init.text+0x214e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: um_arch.c:(.init.text+0x217b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/skas/process.o: in function `current_stub_stack':
   process.c:(.ltext+0xc4): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: process.c:(.ltext+0xf8): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/skas/process.o: in function `current_mm_id':
   process.c:(.ltext+0x204): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/skas/process.o:process.c:(.ltext+0x238): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/kernel/load_file.o: in function `uml_load_file':
   load_file.c:(.init.text+0x344): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: load_file.c:(.init.text+0x36f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: load_file.c:(.init.text+0x39c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/load_file.o: in function `__uml_load_file':
   load_file.c:(.init.text+0x52e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: load_file.c:(.init.text+0x55b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: load_file.c:(.init.text+0x588): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/kernel/load_file.o:load_file.c:(.init.text+0x5b5): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_log':
   mconsole_kern.c:(.ltext+0x1cf): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_proc':
   mconsole_kern.c:(.ltext+0x761): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x78e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x7c5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x7fc): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x91f): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x958): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o:mconsole_kern.c:(.ltext+0x985): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mem_config':
   mconsole_kern.c:(.ltext+0x41f6): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x422d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4271): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x42b7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x42f8): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4343): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o:mconsole_kern.c:(.ltext+0x437a): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mem_get_config':
   mconsole_kern.c:(.ltext+0x48b6): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4968): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4995): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x49c2): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x49ef): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `console_write':
   mconsole_kern.c:(.ltext+0x4c41): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4ca9): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x4cda): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_interrupt':
   mconsole_kern.c:(.ltext+0x514c): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x5179): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x51b0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x51e7): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x521e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x524b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o:mconsole_kern.c:(.ltext+0x528c): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_proc_write':
   mconsole_kern.c:(.ltext+0x5911): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `notify_panic':
   mconsole_kern.c:(.ltext+0x5a27): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x5a57): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x5a8a): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.ltext+0x5ab5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mem_mc_init':
   mconsole_kern.c:(.init.text+0xb3): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0xe0): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_init':
   mconsole_kern.c:(.init.text+0x540): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x56d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o:mconsole_kern.c:(.init.text+0x59a): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mconsole_init':
   mconsole_kern.c:(.init.text+0x73b): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x766): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x793): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mconsole_kern.o: in function `mount_proc':
   mconsole_kern.c:(.init.text+0x8cf): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x96e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x99b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x9c8): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mconsole_kern.c:(.init.text+0x9f5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mmapper_kern.o: in function `mmapper_init':
   mmapper_kern.c:(.init.text+0x194): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.init.text+0x1c4): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mmapper_kern.c:(.init.text+0x1ef): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.init.text+0x21c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.init.text+0x249): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mmapper_kern.o: in function `mmapper_mmap':
   mmapper_kern.c:(.ltext+0x22d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x29e): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mmapper_kern.o:mmapper_kern.c:(.ltext+0x2cb): more undefined references to `__ubsan_handle_add_overflow' follow
   /usr/bin/ld: arch/um/drivers/mmapper_kern.o: in function `mmapper_mmap':
   mmapper_kern.c:(.ltext+0x301): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x334): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x36b): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x398): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x3d5): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/um/drivers/mmapper_kern.o: in function `mmapper_write':
   mmapper_kern.c:(.ltext+0x4df): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: mmapper_kern.c:(.ltext+0x50c): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: arch/x86/um/ptrace.o: in function `genregs_get':
   ptrace.c:(.ltext+0x1d2): undefined reference to `__ubsan_handle_implicit_conversion'
   /usr/bin/ld: ptrace.c:(.ltext+0x200): undefined reference to `__ubsan_handle_sub_overflow'
   /usr/bin/ld: ptrace.c:(.ltext+0x22d): undefined reference to `__ubsan_handle_add_overflow'
   /usr/bin/ld: ptrace.c:(.ltext+0x25a): undefined reference to `__ubsan_handle_add_overflow'
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
