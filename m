Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF6246BB5;
	Tue, 10 Jun 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560956; cv=none; b=aeHkGGuwic/lO6m2qkD+F+vhZ1TQ+4uHMXdHzkDSbsESgJCD8nVYJTDwmfHLZB2n7oWkxuFWOZQe/MaTMFxpHdo7HvXPKh38+sQycaEVaRecpmtNJHIWYte8E0OrCNzI0BQ4xNjNxzFau0hPQ9OM80ntFuOt/ccaLyG8HG434IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560956; c=relaxed/simple;
	bh=QVcowiiZvR1tuHwHb4npYHPPA4GQXkCXQ/JxSsXnLF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhvLVacLXBQaqJyyeAc5IlThe50UcLZ5QCqaYpeqD0sV0rYG7Myb9NSBSCFn3oZ4V/S/j1KeWlJ7iiPpV8YaaOVk+rUXRxl7ZLJk1K/2TrQEgW3JfVwO4JgXkwnHkNKva+anJB+ZoL2CYNMotLsoSJvSi/mOkbw9bpZU67Z5srQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4XECDXi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4XECDXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749560956; x=1781096956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QVcowiiZvR1tuHwHb4npYHPPA4GQXkCXQ/JxSsXnLF4=;
  b=F4XECDXigF9TKrsusRTxXdnb54bUm6TqqKwVq8hBCqbc4/P6qhUyro1p
   LqF2Y0fGUu0sgwjYEn7rCvD8/c7nMHXyPaRyhLeSVsy46/9aiakfrxBAJ
   2KxtkK1F6LoDeL5ROP2CwzjcP3PIqqM99l3L2qqJbNdwgE61X6Ci0Iy2F
   reYlf35+3yRgADcYP/XqtazlFbUAe8DhnD52iblH0iTv9LecsDOq3dOgs
   RPAW+dvITho4lp9QMltXH3ZK07Km0uwZXVKb8f1VMa5qg7Lum8jntNN8I
   aPclfoansMNjYarLWg6LjioxEChJUB8zutqB/qou4CFUeqvo2t6TGUVkQ
   Q==;
X-CSE-ConnectionGUID: hYdRkwFuQpWsKCftYwSz1Q==
X-CSE-MsgGUID: qhKKXrO3SdCjMZvta7YTLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="61942163"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="61942163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:09:15 -0700
X-CSE-ConnectionGUID: MObmwqf1RdeHU+C3YrV9+A==
X-CSE-MsgGUID: mV60+oiHTW2bpEBgRblg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151835217"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2025 06:09:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOyiy-0008FJ-0B;
	Tue, 10 Jun 2025 13:09:08 +0000
Date: Tue, 10 Jun 2025 21:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] rust: math: Add KernelMathExt trait with a mul_div helper
Message-ID: <202506102043.Tvsj0sXM-lkp@intel.com>
References: <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/rust-math-Add-KernelMathExt-trait-with-a-mul_div-helper/20250610-055722
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250609-math-rust-v1-v1-1-285fac00031f%40samsung.com
patch subject: [PATCH] rust: math: Add KernelMathExt trait with a mul_div helper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250610/202506102043.Tvsj0sXM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506102043.Tvsj0sXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102043.Tvsj0sXM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `mul_u64_u64_div_u64` in crate `bindings`
   --> rust/kernel/math.rs:32:33
   |
   32 |         Some(unsafe { bindings::mul_u64_u64_div_u64(self, multiplier, divisor) })
   |                                 ^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
