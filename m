Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F04A3E;
	Sun,  6 Jul 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751815204; cv=none; b=UXp17Gc0kRPq+lde61BQpHvA4F5A2JStyLP+OP+HdlxOwHGmpNLbhQooyeIZ80RasUcpOLYHNK4Cgldy33K8kxiKTQbWrL7iXV8tsExaV8GnKHSp8sCPTIGDLgX/zXO51x1a9nPUMcjRsB0560a9NJFGdN6WTGvXNIdwEVbAWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751815204; c=relaxed/simple;
	bh=rRlIVBAtFf1QpBmX0FDu8fSBrvpcpNmcc/tPcQIikPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfl47HFRYf7hqdQ7wj8eex16SGnLVW8guHQe3V+7M6foM8lQMCZiRAJWydgC0FnZXXpfC91pNRyp084gp3VGTPi9cyEhYtpr7Fs4dFCsLdxgA9m5ziSwGZCPk1EwWKK+G+wI37yXR4y1oY46EW1CLd2wZMWIWnynAJ8U2A9y9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuJ88t5l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuJ88t5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751815202; x=1783351202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRlIVBAtFf1QpBmX0FDu8fSBrvpcpNmcc/tPcQIikPY=;
  b=PuJ88t5lUIQ3ZQhcf78R9T+XegfUkBmiwOlhbP7tOovpjv1BSuNPPrZC
   N4YSQ/yjx+cEawPoJytfcvkaU4ByFQ+fPOi5jGFkkpbOzwmfjXcrTMniZ
   FQNAS2E0DrSIRFDHjgIvKOGzE2PjZFNh30HL0xCl7tn9SRSA3Jv7nOhma
   0tYe3pMrX85smutmtqzPyuv2JAygpSOKzSh6wT/tp2qpp5tdoTgeXrPhr
   VQO2FjinFhVBT6PehwBwhyZGafD9vFYiDGHQRYt/L62voxyVx+5fIUKWa
   QH7Lr9W3jjjhhwDp1RICZKlGNtvCGelsyP8s15KVCEgKar4qvZuu+HMHq
   g==;
X-CSE-ConnectionGUID: 4A3QKvnxSCOXWxTIUftpqQ==
X-CSE-MsgGUID: dm6pjphvSGOXHjFBf0RBoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71485533"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="71485533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 08:20:01 -0700
X-CSE-ConnectionGUID: bahLTSSdQtu9b/81V2d4+Q==
X-CSE-MsgGUID: L5gboo2DQuyeGUbY+Da46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="192196154"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 08:19:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYR9o-000575-1G;
	Sun, 06 Jul 2025 15:19:56 +0000
Date: Sun, 6 Jul 2025 23:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
Message-ID: <202507062327.TsP3JVhL-lkp@intel.com>
References: <20250702160910.3610134-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702160910.3610134-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on rust/rust-next linus/master v6.16-rc4 next-20250704]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-vmalloc-allow-to-set-node-and-align-in-vrealloc/20250703-001116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250702160910.3610134-1-vitaly.wool%40konsulko.se
patch subject: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250706/202507062327.TsP3JVhL-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062327.TsP3JVhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507062327.TsP3JVhL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for an associated constant
   --> rust/kernel/alloc.rs:139:5
   |
   139 |     pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
