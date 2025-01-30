Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE41BB6BC;
	Thu, 30 Jan 2025 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248303; cv=none; b=fRoxDLjmGP/RnNZMBWQTu712gbg57gQ/G9VDT5T/3757V/Vkacgh/40QXdO6BnjZ3T274S65GroYfIrbBDrXRFcmocG2EHCuBo7PRR69lOIybNeI02+oeeq5PyLQKox65pXmqPQWOqYEvGW0sIhlDVVNCwHY2iYHB6mz+s2m5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248303; c=relaxed/simple;
	bh=AZPmeMpWTs/FvCNVmUDUjDmiufPBvdZlrjwaesT1MXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTsS06yPiXZqADHdyCkX/+xsBvW0WVoQdBUrFJnNZADck1CWDLw+StOrsfuoDWXXDJdf47O+gR7xqx3Z3Mje3/y2xLARQ6HTWeGW3V6gwKlYLfZXs3eu1kIExC6pwK4RNJ266IHYBeTD3lmJ/RAjhsv5pcgiFpFhJRthPRnDpaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klAJWsNn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klAJWsNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738248301; x=1769784301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZPmeMpWTs/FvCNVmUDUjDmiufPBvdZlrjwaesT1MXc=;
  b=klAJWsNnvN7DLNKxpU9wn5V0sC715Y4GVQONQ6BWNcMma2pM1SY3pMz7
   HTJkCh3aORXvkA/RKMTzsUwhEGHL8O4+G9uebdwdntjCsRti65nGqDDjT
   dlns2n/1TJPZVuIduh08HDMa7qr8rHR0JjaobcFJSexVDnBN7Nrmn8wPj
   9ynAwxR2mUaLB358ho+ZV+JQdVc+SvGD2mGGoRpV5I3EQDYYO0u+TyWFG
   TqDuVPceeLM7/ebSAxI+vPp/VrPlQqS71oDioUCjx1qqE5J74PE9lCLE+
   KYb7qxNIU966x4ZHAsa30JJZ+MMoatyvRDJgcr9vlToLdr73ZjWwyZ9c8
   g==;
X-CSE-ConnectionGUID: 9KhUKodNQOO1hKCltY8ogg==
X-CSE-MsgGUID: ZNUv8aysQses/Qldjwb2FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42546430"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42546430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 06:45:01 -0800
X-CSE-ConnectionGUID: 542qaY2lTQ2arFXf8h9Wbg==
X-CSE-MsgGUID: H1elkPQiRbSd4gNjC/DyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146537060"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2025 06:44:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdVmo-000kZX-07;
	Thu, 30 Jan 2025 14:44:54 +0000
Date: Thu, 30 Jan 2025 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Fiona Behrens <me@kloenk.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH v2] rust: io: move offset_valid and io_addr(_assert) to
 IoRaw
Message-ID: <202501302233.VecDQamx-lkp@intel.com>
References: <20250128-rust-io-offset-v2-1-222de7c96a34@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-rust-io-offset-v2-1-222de7c96a34@kloenk.dev>

Hi Fiona,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01b3cb620815fc3feb90ee117d9445a5b608a9f7]

url:    https://github.com/intel-lab-lkp/linux/commits/Fiona-Behrens/rust-io-move-offset_valid-and-io_addr-_assert-to-IoRaw/20250128-204724
base:   01b3cb620815fc3feb90ee117d9445a5b608a9f7
patch link:    https://lore.kernel.org/r/20250128-rust-io-offset-v2-1-222de7c96a34%40kloenk.dev
patch subject: [PATCH v2] rust: io: move offset_valid and io_addr(_assert) to IoRaw
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250130/202501302233.VecDQamx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302233.VecDQamx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302233.VecDQamx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>> error[E0658]: use of unstable library feature 'unchecked_math': niche optimization path
   --> rust/kernel/io.rs:82:33
   |
   82 |         Ok(unsafe { self.addr().unchecked_add(offset) })
   |                                 ^^^^^^^^^^^^^
   |
   = note: see issue #85122 <https://github.com/rust-lang/rust/issues/85122> for more information
   = help: add `#![feature(unchecked_math)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'unchecked_math': niche optimization path
   --> rust/kernel/io.rs:99:30
   |
   99 |         unsafe { self.addr().unchecked_add(offset) }
   |                              ^^^^^^^^^^^^^
   |
   = note: see issue #85122 <https://github.com/rust-lang/rust/issues/85122> for more information
   = help: add `#![feature(unchecked_math)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
