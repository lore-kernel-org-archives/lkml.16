Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECAA171C9;
	Sun,  6 Jul 2025 00:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751762398; cv=none; b=DFZiv/QRPFmStuxlCuIZbDAygjPbYaF+MWN7iyE72AkY+hDnERN3suBpbg34JtyzJQliUt6KSJ5hCMBrUq8UgBzHHMT24uxADG9v6LfE2HMuxGNADk5q27CI+xcr14MLnqM21o2XcaZv/rHSaygv4KcTRUPQ3nM1q8CeaNvEshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751762398; c=relaxed/simple;
	bh=k5Q8CAwOKFNOsPElv+8SUntbshG34ohpUNhd1JdxujA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU1lNsgriQ9STCSYnNTgVgCQ+O7QkTLqNUiQNfuleOU3JFvEqFWbEwpvvuepAaqwnVJmWdzVqKDI1pqgwrXwJM7EvueeMULdl/ffYJXfcsf7KuAeF1SY7zYH10BH31HKSWnUWBFCWW5LB1SyMD+tndkJtNVNzCZDcAfNbfGZavQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dtc+Z/HU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dtc+Z/HU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751762398; x=1783298398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k5Q8CAwOKFNOsPElv+8SUntbshG34ohpUNhd1JdxujA=;
  b=Dtc+Z/HUfeAXxH+9O449mERow4uYoazCfqtTBmHGgYd5SICfsL+Xlmhg
   jwBKBp70olrPxKD+gRjsjl8Qia93hfaacyBPCadoum1YzGCGCiv63rJ1p
   JZcyLrgpBVUWSCll0I/v1C/RDeQJrzQjD8LQZJGYk+Z8h4sCFQUGHWJJm
   4AIBdjWfJoV5BLGeJPLjWUdKZlGUVF57QDNyT/amseQI63pyEAkfVdCsA
   9yYT1pI+h8wDFaoTzZdq5F5YFTkvRYGP3p85h7q5KNqwSLNYpPBtfic+6
   CbQntslreEp9q7O7HUUbjjVmWr0pqje2Nwv5woNChxSS6svdEoOetAkL6
   Q==;
X-CSE-ConnectionGUID: i7VtxurzQRKWj2Q4OTrp1w==
X-CSE-MsgGUID: cXKAI/RGSc+eBZPJ/7JHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="76573367"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="76573367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 17:39:57 -0700
X-CSE-ConnectionGUID: P1JUXQxVSwaB1oDYr25lqA==
X-CSE-MsgGUID: KeKRc6SFStiPqE0L1FBWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154642095"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2025 17:39:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYDQ5-0004mt-2m;
	Sun, 06 Jul 2025 00:39:49 +0000
Date: Sun, 6 Jul 2025 08:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v7 1/2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <202507060837.ziqhqXVk-lkp@intel.com>
References: <20250704-topics-tyr-regulator-v7-1-77bfca2e22dc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-topics-tyr-regulator-v7-1-77bfca2e22dc@collabora.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2009a2d5696944d85c34d75e691a6f3884e787c0]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-regulator-add-a-bare-minimum-regulator-abstraction/20250705-024526
base:   2009a2d5696944d85c34d75e691a6f3884e787c0
patch link:    https://lore.kernel.org/r/20250704-topics-tyr-regulator-v7-1-77bfca2e22dc%40collabora.com
patch subject: [PATCH v7 1/2] rust: regulator: add a bare minimum regulator abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250706/202507060837.ziqhqXVk-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060837.ziqhqXVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060837.ziqhqXVk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `regulator_set_voltage` in crate `bindings`
   --> rust/kernel/regulator.rs:258:23
   |
   258 |             bindings::regulator_set_voltage(self.inner.as_ptr(), min_uv.0, max_uv.0)
   |                       ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_get_voltage` in crate `bindings`
   --> rust/kernel/regulator.rs:265:42
   |
   265 |         let voltage = unsafe { bindings::regulator_get_voltage(self.inner.as_ptr()) };
   |                                          ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_get` in crate `bindings`
   --> rust/kernel/regulator.rs:276:53
   |
   276 |         let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
   |                                                     ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_enable` in crate `bindings`
   --> rust/kernel/regulator.rs:290:38
   |
   290 |         to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
   |                                      ^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_disable` in crate `bindings`
   --> rust/kernel/regulator.rs:295:38
   |
   295 |         to_result(unsafe { bindings::regulator_disable(self.inner.as_ptr()) })
   |                                      ^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_is_enabled` in crate `bindings`
   --> rust/kernel/regulator.rs:379:28
   |
   379 |         unsafe { bindings::regulator_is_enabled(self.inner.as_ptr()) != 0 }
   |                            ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_disable` in crate `bindings`
   --> rust/kernel/regulator.rs:389:32
   |
   389 |             unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
   |                                ^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `regulator_put` in crate `bindings`
   --> rust/kernel/regulator.rs:393:28
   |
   393 |         unsafe { bindings::regulator_put(self.inner.as_ptr()) };
   |                            ^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
