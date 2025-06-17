Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBA28D8EA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143841; cv=none; b=TMkH8I+WZCMXMql8YXnxcyH1Z7tyzVaS0taIEprfRAaDBWawozzRvlLuHFXKkQL64Wkm/79wWQivASeD1/qSyO1AMpR2TbBPAVg8QMUzWKO49r037ostj3hk3H9WiCrnR77dVWakT2deM6X0vRPWjtZ2pBdkqu3grdbHM9PH8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143841; c=relaxed/simple;
	bh=HQ8YwPXH3tjWKjgG77C8MtR06NMh+4CK2/PrreWPfkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml3CQXWUcei0WbBwonvz1mdUmZxIfaEt4RVMY5fE5rKqTHZzDU/stjXswMse1XQNNIdGSZtFcsLMpxqR9jpvQlh8fT3xzFDwXNPRS0MSeInphhQ/CIvybUoKUlffcGyQroGWi4Zu9CebT/A6tW8UoRqJXk74OZ9dL/RokaIVeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaOsY0Of; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaOsY0Of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750143839; x=1781679839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQ8YwPXH3tjWKjgG77C8MtR06NMh+4CK2/PrreWPfkg=;
  b=TaOsY0OfqwvxBN2UeJPOCBCha22r+Mbuozuzy303YqZr1KkC8oxs6bkE
   fKbyeydgYWa92WFAmGQVah/vZ8yQp8v4t9SXsTVtSMUarCveYb7VskeMx
   NwMhieuO91fwUl9VueFwbWPlaXJeUssPGxVjt6/lZq/ZdFpIt5ssmTYud
   oTaQEn7eHS5XojYUkyZAKIuuA92GfYnZDgNNYAPzUHjcmwgfqVNG2dAbu
   rdRKWpmRalm+e3BfwL4+jiwHdqKml8jh5a0xmu9ZxFC7EVFIhVKcCfDiR
   yMaTAdSlkOcJPYHo1ioQO4HIt7XCQI1AwJmYr6sqOgMrwkYUz7Kh1vhMp
   Q==;
X-CSE-ConnectionGUID: gXMCNoY+QEmSI8wSTNaj9w==
X-CSE-MsgGUID: t7H62jx+R1CpfcvXOQzmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74838592"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="74838592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 00:03:58 -0700
X-CSE-ConnectionGUID: tKCvDGCtRgy6dUU/aEpmzQ==
X-CSE-MsgGUID: wktvsOXqSDOYdlPPEud21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="185945975"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2025 00:03:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRQMM-000FhQ-0M;
	Tue, 17 Jun 2025 07:03:54 +0000
Date: Tue, 17 Jun 2025 15:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: onur-ozkan <work@onurozkan.dev>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	boqun.feng@gmail.com, onur-ozkan <work@onurozkan.dev>,
	thatslyude@gmail.com
Subject: Re: [PATCH] Add `ww_mutex` support & abstraction for Rust tree
Message-ID: <202506171422.JVA1Gpbc-lkp@intel.com>
References: <20250616162448.31641-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616162448.31641-1-work@onurozkan.dev>

Hi onur-ozkan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.16-rc2 next-20250616]
[cannot apply to tip/locking/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/onur-ozkan/Add-ww_mutex-support-abstraction-for-Rust-tree/20250617-003523
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250616162448.31641-1-work%40onurozkan.dev
patch subject: [PATCH] Add `ww_mutex` support & abstraction for Rust tree
config: x86_64-randconfig-074-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171422.JVA1Gpbc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171422.JVA1Gpbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171422.JVA1Gpbc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.2
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0063]: missing field `__bindgen_anon_1` in initializer of `bindings::lock_class_key`
   --> rust/kernel/sync/lock/ww_mutex.rs:52:26
   |
   52 |             acquire_key: bindings::lock_class_key {},
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^ missing `__bindgen_anon_1`
--
>> error[E0063]: missing field `__bindgen_anon_1` in initializer of `bindings::lock_class_key`
   --> rust/kernel/sync/lock/ww_mutex.rs:53:24
   |
   53 |             mutex_key: bindings::lock_class_key {},
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^ missing `__bindgen_anon_1`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
