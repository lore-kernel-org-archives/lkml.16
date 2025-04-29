Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638924A07B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745946131; cv=none; b=GpWuG43k1je7vx9fNIEXOqGSTUhhFuKt4hcSMa43FyPvfdu05pGLKOyBncQo/VihL9UqjHWm6G9SbOWJmDVzzU0ewV3B5uMvfNeqNSWDKd4gDY1UT1FVE0IpUKAwycI09G3tPuOvoUxDSyhyOs2ICQehslRUArtA+ErH3OhUswY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745946131; c=relaxed/simple;
	bh=tX07ibvubTNZuG4eWUqG+QU03556YHXhSrXwyBwZdPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2QMIdCnY3uuLiDJIBYQjd+0yyvC6Ciq/hOzdJndgHZV6K0sOkrWg56ikplZyLRA4XjrZpuyR6IsvqOLzh70z84t/5XfW9XBpx7CCmwCNDTErV2Ni9oT9pk4ca1NEZM3CEdqLa3nvfOYlyrTtR0yP2g3fqix62JvRInHs4i5LwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O20Q4UWy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O20Q4UWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745946130; x=1777482130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tX07ibvubTNZuG4eWUqG+QU03556YHXhSrXwyBwZdPI=;
  b=O20Q4UWyBwYHCneGSfJbS5pehpdqDamG5ruu1BR/jGwTE6Lqeeu1OKKz
   4dDeOsHEwtwDGbarCkBmjkKCx+mI0NvxrFdJLzkcO7S+6v+5mktH4PFFC
   +1gX8A/ZueOL0q0sduQLCzLTmDVcwRquoKFIZ7FeY6vZlA2PO9fuyxG5E
   mFOr2afIbJGJ+TN8AGX3sua0sE6mrK/4q3mftXjtaGfPw7G7gp9JV5hj/
   DOtg4An8RMqglmXPqOWRtuQToSRuibxMnKU4sQySUSya1voev7wecHxfG
   RSJI78RRTVFoeOUmy4GL2USRdkf+NM/ZHfnaybBuAmyIwz4oR2GcVqMG3
   g==;
X-CSE-ConnectionGUID: q0X2XIDISTuGcZ1Noey9nA==
X-CSE-MsgGUID: TObTB87PT/+UCi98DCAZ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="70084322"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="70084322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:02:09 -0700
X-CSE-ConnectionGUID: 9s6T2LBeSban2xPiVXaiGw==
X-CSE-MsgGUID: U4UqeuqLQEuiIBqhX13hcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133825211"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 10:02:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9oLK-0001Br-2Z;
	Tue, 29 Apr 2025 17:02:02 +0000
Date: Wed, 30 Apr 2025 01:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <202504300024.YxAyenLy-lkp@intel.com>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>

Hi Donet,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/driver-base-Remove-unused-functions/20250429-010442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom%40linux.ibm.com
patch subject: [PATCH v2 1/2] driver/base: Optimize memory block registration to reduce boot time
config: x86_64-buildonly-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300024.YxAyenLy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300024.YxAyenLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300024.YxAyenLy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/swap.h:11,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: security/keys/encrypted-keys/masterkey_trusted.o: in function `register_memory_blocks_under_node_early':
>> security/keys/encrypted-keys/masterkey_trusted.c:125: multiple definition of `register_memory_blocks_under_node_early'; security/keys/encrypted-keys/encrypted.o:include/linux/node.h:125: first defined here
--
   In file included from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/tlb.h:9,
                    from arch/x86/include/asm/mmu_context.h:9,
                    from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from include/linux/sched/isolation.h:5,
                    from kernel/sched/build_policy.c:19:
>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
--
   ld: drivers/usb/host/xhci-mem.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
   ld: drivers/usb/host/xhci-ring.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
   ld: drivers/usb/host/xhci-hub.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
   ld: drivers/usb/host/xhci-trace.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
   ld: drivers/usb/host/xhci-dbgcap.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
--
   In file included from include/linux/acpi.h:18,
                    from include/linux/i2c.h:13,
                    from drivers/power/supply/sbs-battery.c:13:
>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sbs-battery.c: In function 'sbs_get_property':
   drivers/power/supply/sbs-battery.c:834:30: warning: '%04x' directive writing between 4 and 8 bytes into a region of size 5 [-Wformat-overflow=]
     834 |         sprintf(sbs_serial, "%04x", ret);
         |                              ^~~~
   In function 'sbs_get_battery_serial_number',
       inlined from 'sbs_get_property' at drivers/power/supply/sbs-battery.c:965:9:
   drivers/power/supply/sbs-battery.c:834:29: note: directive argument in the range [0, 2147483647]
     834 |         sprintf(sbs_serial, "%04x", ret);
         |                             ^~~~~~
   drivers/power/supply/sbs-battery.c:834:9: note: 'sprintf' output between 5 and 9 bytes into a destination of size 5
     834 |         sprintf(sbs_serial, "%04x", ret);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/swap.h:11,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/phy/phy.h:17,
                    from include/linux/usb/otg.h:13,
                    from include/linux/usb/of.h:11,
                    from drivers/usb/core/usb.c:41:
>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/usb.c: In function 'usb_alloc_dev':
   drivers/usb/core/usb.c:706:37: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                     ^~
   drivers/usb/core/usb.c:706:33: note: using the range [-2147483648, 2147483647] for directive argument
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                 ^~~~~~~
   drivers/usb/core/usb.c:705:25: note: 'snprintf' output between 3 and 28 bytes into a destination of size 16
     705 |                         snprintf(dev->devpath, sizeof dev->devpath,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/i3c/master.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/device.o:include/linux/node.h:125: first defined here
--
   ld: drivers/i3c/master/mipi-i3c-hci/ext_caps.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/pio.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/dma.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/cmd_v1.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/cmd_v2.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/dat_v1.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/dct_v1.o: in function `register_memory_blocks_under_node_early':
   drivers/i3c/master/mipi-i3c-hci/dct_v1.c:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
   ld: drivers/i3c/master/mipi-i3c-hci/hci_quirks.o: in function `register_memory_blocks_under_node_early':
   drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
--
   In file included from include/linux/acpi.h:18,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/pmbus/ibm-cffps.c:11:
>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c: In function 'ibm_cffps_debugfs_read':
   drivers/hwmon/pmbus/ibm-cffps.c:169:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:169:59: note: directive argument in the range [0, 2147483647]
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:169:33: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:60: warning: '%04X' directive output may be truncated writing between 4 and 8 bytes into a region of size 5 [-Wformat-truncation=]
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:59: note: directive argument in the range [0, 2147483647]
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:33: note: 'snprintf' output between 5 and 9 bytes into a destination of size 5
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/usb/typec/tipd/trace.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/typec/tipd/core.o:include/linux/node.h:125: first defined here
--
   ld: drivers/usb/cdns3/drd.o: in function `register_memory_blocks_under_node_early':
>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/cdns3/core.o:include/linux/node.h:125: first defined here
..


vim +125 security/keys/encrypted-keys/masterkey_trusted.c

b886d83c5b621a Thomas Gleixner     2019-06-01   1  // SPDX-License-Identifier: GPL-2.0-only
982e617a313b57 Mimi Zohar          2011-08-27   2  /*
982e617a313b57 Mimi Zohar          2011-08-27   3   * Copyright (C) 2010 IBM Corporation
982e617a313b57 Mimi Zohar          2011-08-27   4   * Copyright (C) 2010 Politecnico di Torino, Italy
c9fecf505a3421 Alexander A. Klimov 2020-07-05   5   *                    TORSEC group -- https://security.polito.it
982e617a313b57 Mimi Zohar          2011-08-27   6   *
982e617a313b57 Mimi Zohar          2011-08-27   7   * Authors:
982e617a313b57 Mimi Zohar          2011-08-27   8   * Mimi Zohar <zohar@us.ibm.com>
982e617a313b57 Mimi Zohar          2011-08-27   9   * Roberto Sassu <roberto.sassu@polito.it>
982e617a313b57 Mimi Zohar          2011-08-27  10   *
5395d312dff00d Kees Cook           2017-05-13  11   * See Documentation/security/keys/trusted-encrypted.rst
982e617a313b57 Mimi Zohar          2011-08-27  12   */
982e617a313b57 Mimi Zohar          2011-08-27  13  
982e617a313b57 Mimi Zohar          2011-08-27  14  #include <linux/uaccess.h>
cc100551b4d92f Stephen Rothwell    2011-09-15  15  #include <linux/err.h>
982e617a313b57 Mimi Zohar          2011-08-27  16  #include <keys/trusted-type.h>
ee0b31a25a0101 Mimi Zohar          2012-01-17  17  #include <keys/encrypted-type.h>
ee0b31a25a0101 Mimi Zohar          2012-01-17  18  #include "encrypted.h"
982e617a313b57 Mimi Zohar          2011-08-27  19  
982e617a313b57 Mimi Zohar          2011-08-27  20  /*
982e617a313b57 Mimi Zohar          2011-08-27  21   * request_trusted_key - request the trusted key
982e617a313b57 Mimi Zohar          2011-08-27  22   *
982e617a313b57 Mimi Zohar          2011-08-27  23   * Trusted keys are sealed to PCRs and other metadata. Although userspace
982e617a313b57 Mimi Zohar          2011-08-27  24   * manages both trusted/encrypted key-types, like the encrypted key type
982e617a313b57 Mimi Zohar          2011-08-27  25   * data, trusted key type data is not visible decrypted from userspace.
982e617a313b57 Mimi Zohar          2011-08-27  26   */
982e617a313b57 Mimi Zohar          2011-08-27  27  struct key *request_trusted_key(const char *trusted_desc,
146aa8b1453bd8 David Howells       2015-10-21  28  				const u8 **master_key, size_t *master_keylen)
982e617a313b57 Mimi Zohar          2011-08-27  29  {
982e617a313b57 Mimi Zohar          2011-08-27  30  	struct trusted_key_payload *tpayload;
982e617a313b57 Mimi Zohar          2011-08-27  31  	struct key *tkey;
982e617a313b57 Mimi Zohar          2011-08-27  32  
028db3e290f15a Linus Torvalds      2019-07-10  33  	tkey = request_key(&key_type_trusted, trusted_desc, NULL);
982e617a313b57 Mimi Zohar          2011-08-27  34  	if (IS_ERR(tkey))
982e617a313b57 Mimi Zohar          2011-08-27  35  		goto error;
982e617a313b57 Mimi Zohar          2011-08-27  36  
982e617a313b57 Mimi Zohar          2011-08-27  37  	down_read(&tkey->sem);
146aa8b1453bd8 David Howells       2015-10-21  38  	tpayload = tkey->payload.data[0];
982e617a313b57 Mimi Zohar          2011-08-27  39  	*master_key = tpayload->key;
982e617a313b57 Mimi Zohar          2011-08-27  40  	*master_keylen = tpayload->key_len;
982e617a313b57 Mimi Zohar          2011-08-27  41  error:
982e617a313b57 Mimi Zohar          2011-08-27  42  	return tkey;
982e617a313b57 Mimi Zohar          2011-08-27  43  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
