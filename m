Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFD1E89C;
	Sun, 15 Jun 2025 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750007613; cv=none; b=HXfC1teOcrp2L8UOFFsKDQKO3QJTnm4vYN5MfgGu/9uhKHEmm0Kzgzgly2+vLu0qrAnKpn5Dv/Mrbx1JUWhzLKKLQpq9dJ4xsUMRyN77EeM4k/TKT8Z2VOrcrS8PWSURoevKUBvAtybtwuhHw0Ai+8SajET9CzYfYllT9pj0aUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750007613; c=relaxed/simple;
	bh=vrQljPMOllr5vZlsWnt4J/4zYmhpqTi5mw4pxd9eh1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOx0CkCkDhMI8wmE6mR5yqODT7JdQk8L/IZKpnHqnKYYsivrtzfDCjD68vhFbfwuGr84gCtfqR9cFz0uHbF5tjJCqe9H2+7foEQErrEuOTN4HKQPoDA18SPX10Wvf6oyu7QHDy5deR1f3wwfTX9UoD1JLSjr/BVUDLwp/CBVkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNCmtF+d; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNCmtF+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750007611; x=1781543611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vrQljPMOllr5vZlsWnt4J/4zYmhpqTi5mw4pxd9eh1I=;
  b=lNCmtF+dwm4iQJitbZglli0RBqzE9vpvXWaBpofsnOoNkPia1tyCMofx
   7jFtPCvlEYclzRwI9xFjZI0C5f59pplgd1QsXJ/RPBHNHchgpGqR5aFp1
   eHf1GDsSTfyUQ2Dlh34Njg4H4DtN8ZfdgI9OXBy6KI9uC0dLA8x9joNHR
   Re+Lrc6xb4Ya6wvtGQgPYOnYia1QUuhy3dqGEe70nteU4d32KQJ7KN09F
   EKB53xeIsKJbI+MZ/Gsp/qI6DsLW5X+4+OqQeKzIJV/2WpMyIH0A3FUhM
   kGq6WFU8gGwzErap9lv6yPXoqraZI00oP/1etLL1GtVoIdY/OFbmY7JD+
   w==;
X-CSE-ConnectionGUID: UIWjRpP6TiiWZ6xaKffOKg==
X-CSE-MsgGUID: le2CK660S92VVqEv9IKEHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63509271"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="63509271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 10:13:30 -0700
X-CSE-ConnectionGUID: AUSKI46lRBSybNwYGbkNpA==
X-CSE-MsgGUID: 2Gje4mo8R5GvOc7o4AqBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="185527297"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2025 10:13:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQqv5-000ERw-2K;
	Sun, 15 Jun 2025 17:13:23 +0000
Date: Mon, 16 Jun 2025 01:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Every2 <christiansantoslima21@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht,
	richard120310@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
Message-ID: <202506160013.MgafgaAm-lkp@intel.com>
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615072042.133290-1-christiansantoslima21@gmail.com>

Hi Every2,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Every2/rust-transmute-Add-methods-for-FromBytes-trait/20250615-152228
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250615072042.133290-1-christiansantoslima21%40gmail.com
patch subject: [PATCH v7] rust: transmute: Add methods for FromBytes trait
config: um-randconfig-001-20250615 (https://download.01.org/0day-ci/archive/20250616/202506160013.MgafgaAm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506160013.MgafgaAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506160013.MgafgaAm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0046]: not all trait items implemented, missing: `from_bytes`, `from_mut_bytes`
   --> rust/doctests_kernel_generated.rs:3156:1
   |
   3156 | unsafe impl kernel::transmute::FromBytes for MyStruct{};
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `from_bytes`, `from_mut_bytes` in implementation
   |
   = help: implement the missing item: `fn from_bytes(_: &[u8]) -> Option<&Self> { todo!() }`
   = help: implement the missing item: `fn from_mut_bytes<Self>(_: &mut [u8]) -> Option<&mut Self> where Self: AsBytes { todo!() }`
--
>> error[E0046]: not all trait items implemented, missing: `from_bytes`, `from_mut_bytes`
   --> rust/doctests_kernel_generated.rs:3221:1
   |
   3221 | unsafe impl kernel::transmute::FromBytes for MyStruct{};
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `from_bytes`, `from_mut_bytes` in implementation
   |
   = help: implement the missing item: `fn from_bytes(_: &[u8]) -> Option<&Self> { todo!() }`
   = help: implement the missing item: `fn from_mut_bytes<Self>(_: &mut [u8]) -> Option<&mut Self> where Self: AsBytes { todo!() }`
--
>> error[E0599]: no function or associated item named `from_bytes` found for type `u32` in the current scope
   --> rust/doctests_kernel_generated.rs:9216:19
   |
   9216 | let result = u32::from_bytes(&arr);
   |                   ^^^^^^^^^^ function or associated item not found in `u32`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `FromBytes` which provides `from_bytes` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_kbox_rs_7::kernel::transmute::FromBytes;
   |
   help: there is an associated function `from_be` with a similar name
   |
   9216 | let result = u32::from_be(&arr);
   |                   ~~~~~~~
--
>> error[E0046]: not all trait items implemented, missing: `from_bytes`, `from_mut_bytes`
   --> samples/rust/rust_dma.rs:35:1
   |
   35 | unsafe impl kernel::transmute::FromBytes for MyStruct {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `from_bytes`, `from_mut_bytes` in implementation
   |
   = help: implement the missing item: `fn from_bytes(_: &[u8]) -> Option<&Self> { todo!() }`
   = help: implement the missing item: `fn from_mut_bytes<Self>(_: &mut [u8]) -> Option<&mut Self> where Self: AsBytes { todo!() }`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
