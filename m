Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCE1B4F0A;
	Wed, 25 Jun 2025 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750819182; cv=none; b=K9TsR3L6TYdl/2e9zvQ1kcDnncE/AvBs+vXpixekpRE7k3GOjEEWFsTrNH/EU/eiNkUpMamDS0Ql576fGGVZAcqGgYG69d9t3UFrI6jFN/RykbspnFHNBYaYIwlJylRmVioZpiweg1MXRRQ2Qpy5/87quum6SWSzuE9V+tsSt9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750819182; c=relaxed/simple;
	bh=WAerYuAXgqsAgcla018iotDoPRumUCAOOHyW2IVFyXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kopL4lXWGR8gOWDY/ONaQpTl0HTffFuAnVNg/8n80gLKerrMvHPAvcEvT4Kh5jJ19OIo3ZmD/eqjR9qdBnfwN28s47CpGAN7ycC8HKbUmdmYlPzjTSGiu0lxeAkAV+461lSgUqQpiZwB65Hh0+jdvM0vXAUTlNlSwFASD+3AWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IW5Z1A32; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW5Z1A32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750819180; x=1782355180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAerYuAXgqsAgcla018iotDoPRumUCAOOHyW2IVFyXk=;
  b=IW5Z1A322VM+NyF7LmrxhMrpGwr20V5eG2J8VfD/dDJGuIVMVns/9Ah3
   QXjVf0CqWOEf5sFVjePcXMun0rwHlT//w9WitYU3W9ujE767UPx0q1L3y
   9WNS+VNKMZSkxKujdinQ+EUJJzNW2UD3Nipmj3/jX3hS8lOz7MHGUfiyI
   SeRTfiPnORDwdkiuLJLZpS9MhM91zvYq2Lz11oJuKkVcUPjo3smHg5Lxl
   jE7whNCLdOVhiGGo3GDzvPayUDt7jIWLRFTkniZ5VnYTd0ugrnMc56noA
   VOBMCaicvaO4/mLTRKxpTJnsvVATOUlsPKBjUDXvUPd10ig0em0rJdVOR
   w==;
X-CSE-ConnectionGUID: r6/sbV+HSfW1IIJq0ySZLw==
X-CSE-MsgGUID: ng7y4UbYTbiAONABew7nfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53143018"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53143018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 19:39:39 -0700
X-CSE-ConnectionGUID: A5XXVkmVQDKrUq5PVqT0tQ==
X-CSE-MsgGUID: mI7++jFoSCSUNFPwrZwNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="183124331"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 19:39:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUG2v-000ShS-1A;
	Wed, 25 Jun 2025 02:39:33 +0000
Date: Wed, 25 Jun 2025 10:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>,
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
Subject: Re: [PATCH v8] rust: transmute: Add methods for FromBytes trait
Message-ID: <202506251052.onsnGcvR-lkp@intel.com>
References: <20250624042802.105623-1-christiansantoslima21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624042802.105623-1-christiansantoslima21@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-S-Lima/rust-transmute-Add-methods-for-FromBytes-trait/20250624-123012
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250624042802.105623-1-christiansantoslima21%40gmail.com
patch subject: [PATCH v8] rust: transmute: Add methods for FromBytes trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250625/202506251052.onsnGcvR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251052.onsnGcvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251052.onsnGcvR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: use of unstable library feature 'pointer_is_aligned'
   --> rust/kernel/transmute.rs:74:68
   |
   74 |         if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
   |                                                                    ^^^^^^^^^^
   |
   = note: see issue #96284 <https://github.com/rust-lang/rust/issues/96284> for more information
   = help: add `#![feature(pointer_is_aligned)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'pointer_is_aligned'
   --> rust/kernel/transmute.rs:87:68
   |
   87 |         if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
   |                                                                    ^^^^^^^^^^
   |
   = note: see issue #96284 <https://github.com/rust-lang/rust/issues/96284> for more information
   = help: add `#![feature(pointer_is_aligned)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'pointer_is_aligned'
   --> rust/kernel/transmute.rs:101:72
   |
   101 |         if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
   |                                                                        ^^^^^^^^^^
   |
   = note: see issue #96284 <https://github.com/rust-lang/rust/issues/96284> for more information
   = help: add `#![feature(pointer_is_aligned)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'pointer_is_aligned'
   --> rust/kernel/transmute.rs:114:72
   |
   114 |         if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
   |                                                                        ^^^^^^^^^^
   |
   = note: see issue #96284 <https://github.com/rust-lang/rust/issues/96284> for more information
   = help: add `#![feature(pointer_is_aligned)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
