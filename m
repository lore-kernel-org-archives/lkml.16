Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CA028FFEE;
	Thu, 26 Jun 2025 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946785; cv=none; b=fyxe9zI2iAGq1M5VDMM2q58m2/4doUCj8+fn8IMCwwiITMG5RMzofEfkqn+hop/aQbu4kWHOp9G1Ot4dXpt0W9QhYw3Fov076QSeoGnmojy3duxDBzl6mgLpGZok5DhqQyyc7akHPYaFrdmbE7Lz/0+tOWftJtPMfPidkDltL8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946785; c=relaxed/simple;
	bh=Mt7BtbJFxS2gqd382zSW9v2VN1COd4VJX/h7bp6PzLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cah5imR3JAR2KdTmVjAS3LDKzxUnBl0U0qNEJOfY4ze6b1VAdzu7ijk6PM2Faua6zn5xVNdZit9kIb41Gd16y30LNpt5bqkXD0Vwn3F6L4P/x0BmGb6TfxmZPOgxrzKAT1NG8GW9eT8GS6514WZt472y7v+azZtRBn2qSXcc78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lon8dk/m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lon8dk/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946784; x=1782482784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mt7BtbJFxS2gqd382zSW9v2VN1COd4VJX/h7bp6PzLY=;
  b=lon8dk/mNm+658l9MeeNZTSelMy9mV3Vq7uT07S62LfEb8jin0w/vEv0
   VMsTlLOuLdNE2luuOVQJoNUbj1y//DVbUlZ7mZS3/VOsDhgYmff6+5sUY
   OMdhHB7990GiH/12XStu+6NRXud2iaMa3+pbKxTJeK48P0qNgKLbRc95x
   J+7AR2zXCz5mva7IYGnkXKO4dbAGEVoSHJK8kVT7J33u2EE5Fu5cN24Hw
   50+hF7G+giJaolGUmmrbzHmaNd1T0Ziok4SuYWw5xq8h844alsbgDRZuo
   xyql/CZUrWezHqPqNncNMpeF4hXg2fkkLVZh1oxiLhpnKcYNrM6gqqKG6
   A==;
X-CSE-ConnectionGUID: 7oLI+08uReCu4P3QuOlzrw==
X-CSE-MsgGUID: h8VJopHxQxybFWQVNuzdqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53185253"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53185253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:06:23 -0700
X-CSE-ConnectionGUID: U6dQu3wtQCqNIW2z0yZ0Qw==
X-CSE-MsgGUID: P7MKnsSGRUeiFIVKUA3rYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="157093519"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jun 2025 07:06:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUnF1-000U7m-2W;
	Thu, 26 Jun 2025 14:06:15 +0000
Date: Thu, 26 Jun 2025 22:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mitchell Levy <levymitchell0@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Mitchell Levy <levymitchell0@gmail.com>
Subject: Re: [PATCH 1/5] rust: percpu: introduce a rust API for per-CPU
 variables
Message-ID: <202506262153.vo9sMbM8-lkp@intel.com>
References: <20250624-rust-percpu-v1-1-9c59b07d2a9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-rust-percpu-v1-1-9c59b07d2a9c@gmail.com>

Hi Mitchell,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitchell-Levy/rust-percpu-introduce-a-rust-API-for-per-CPU-variables/20250625-061219
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-rust-percpu-v1-1-9c59b07d2a9c%40gmail.com
patch subject: [PATCH 1/5] rust: percpu: introduce a rust API for per-CPU variables
config: x86_64-buildonly-randconfig-004-20250626 (https://download.01.org/0day-ci/archive/20250626/202506262153.vo9sMbM8-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506262153.vo9sMbM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506262153.vo9sMbM8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `align_of` in this scope
   --> rust/kernel/percpu.rs:106:65
   |
   106 |         let ptr: *mut T = unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) } as *mut T;
   |                                                                 ^^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   6   + use core::mem::align_of;
   |
--
>> error: use of extern static is unsafe and requires unsafe block (error E0133)
   --> rust/kernel/percpu.rs:71:53
   |
   71 |         let this_cpu_off_pcpu = core::ptr::addr_of!(this_cpu_off);
   |                                                     ^^^^^^^^^^^^ use of extern static
   |
   = note: for more information, see issue #71668 <https://github.com/rust-lang/rust/issues/71668>
   = note: extern statics are not controlled by the Rust type system: invalid data, aliasing violations or data races will cause undefined behavior
   note: an unsafe function restricts its caller, but its body is safe by default
   --> rust/kernel/percpu.rs:70:5
   |
   70 |     pub unsafe fn get_ref(&self) -> &mut T {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: requested on the command line with `-D unsafe-op-in-unsafe-fn`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
