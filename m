Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9018B495;
	Thu, 19 Jun 2025 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750302971; cv=none; b=saR24W8yD9Pj47JHBeFe1HgKubF4elGOQw0lImOaL6jNEnyo66q8+qzdYgNaTIrhCyrNIHKfaHG42yK3Yrq3eJMnCycPIjikigo9fzwvAfTCP4naqFCKK+bzAAUwg4RETz3Y7r0GtaiM9FoazkEI/OQtfyac0qglJr9tZ3KlUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750302971; c=relaxed/simple;
	bh=+qKbg3X99aXwFswPHKFL5fUn+HrMm8W2484ukQ9POlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCcJhtgAQkVviQJ09csvwKYFjRgbeUOzuKjh+ckfNBLxWPdDSYRogWrQsJLpQj+iuG3SUmtJdREIkyLZH65ldqfh0V/KtQEhZZF/yGZ7Doq6yO/ansBALoEfnGQnp4LjerZGvLJGi+Htvcz7Jfbp7aAbJIpv57MXoYxFfUpk12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImEKXKQ7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImEKXKQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750302969; x=1781838969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+qKbg3X99aXwFswPHKFL5fUn+HrMm8W2484ukQ9POlc=;
  b=ImEKXKQ7OTPu+85IvBpvOWqqbIOkJAre/WPfhY6loI2tz/vtUbk1AFdP
   hT2WOQOzoQ0+42lUW5IT6EVdyLk95GyIl4vhD8K4Dl2NNaCLlFmak0rQr
   RAJCDuHL7IjEJQ0T3A+HpEhKUJh4tXlzmtyToyIh5gQjY1XZkvQbGM+dS
   gKlG3qqc19yz0cAGxAFDCdqw9p04lPj2Fs3pk2Dgw3UzgrY8iRBsOWA62
   RWQLveQUFhHTJnukCYoac2it2kkh+PfylYZJUTF4K0mgL4/JLhiSbdo19
   aZ2n86MX267Xzaca2sru2ZfZsVJbpBy9s0gvoagts94bWsxUKiu70z4C3
   g==;
X-CSE-ConnectionGUID: dlgkuAJMSISryoFbfN983Q==
X-CSE-MsgGUID: MBPjmiQ2RNeovvNZuTysFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52411225"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52411225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 20:16:07 -0700
X-CSE-ConnectionGUID: 5Y2Rv39FSX6mr218PWMtYQ==
X-CSE-MsgGUID: gXYm6CJrSJycghKffG51bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154345808"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 20:16:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS5kw-000KMi-0a;
	Thu, 19 Jun 2025 03:16:02 +0000
Date: Thu, 19 Jun 2025 11:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>,
	Asahi Lina <lina+kernel@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: Re: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
Message-ID: <202506191023.smOZ1Mpy-lkp@intel.com>
References: <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on e04c78d86a9699d136910cfc0bdcf01087e3267e]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Mangold/rust-types-Add-Ownable-Owned-types/20250618-203524
base:   e04c78d86a9699d136910cfc0bdcf01087e3267e
patch link:    https://lore.kernel.org/r/20250618-unique-ref-v11-2-49eadcdc0aa6%40pm.me
patch subject: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250619/202506191023.smOZ1Mpy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191023.smOZ1Mpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191023.smOZ1Mpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/mm/mmput_async.rs at line 48:
        }
    }
    
   -
    // SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an `ARef<MmWithUserAsync>`
    // from a `&MmWithUserAsync`.
    unsafe impl AlwaysRefCounted for MmWithUserAsync {}
>> Diff in rust/kernel/mm/mmput_async.rs at line 48:
        }
    }
    
   -
    // SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an `ARef<MmWithUserAsync>`
    // from a `&MmWithUserAsync`.
    unsafe impl AlwaysRefCounted for MmWithUserAsync {}
>> Diff in rust/kernel/mm/mmput_async.rs at line 48:
        }
    }
    
   -
    // SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an `ARef<MmWithUserAsync>`
    // from a `&MmWithUserAsync`.
    unsafe impl AlwaysRefCounted for MmWithUserAsync {}
   make[2]: *** [Makefile:1825: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> error[E0277]: the trait bound `auxiliary::Device: types::RefCounted` is not satisfied
   --> rust/kernel/device.rs:329:56
   |
   329 |         impl ::core::convert::From<&$device<$src>> for $crate::types::ARef<$device> {
   |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `types::RefCounted` is not implemented for `auxiliary::Device`
   |
   ::: rust/kernel/auxiliary.rs:250:1
   |
   250 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `types::RefCounted`:
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   fs::file::File
   fs::file::LocalFile
   mm::mmput_async::MmWithUserAsync
   mm::Mm
   mm::MmWithUser
   and 4 others
   note: required by a bound in `types::ARef`
   --> rust/kernel/types.rs:478:20
   |
   478 | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `auxiliary::Device: types::RefCounted` is not satisfied
   --> rust/kernel/auxiliary.rs:253:48
   |
   253 | unsafe impl crate::types::AlwaysRefCounted for Device {
   |                                                ^^^^^^ the trait `types::RefCounted` is not implemented for `auxiliary::Device`
   |
   = help: the following other types implement trait `types::RefCounted`:
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   fs::file::File
   fs::file::LocalFile
   mm::mmput_async::MmWithUserAsync
   mm::Mm
   mm::MmWithUser
   and 4 others
   note: required by a bound in `types::AlwaysRefCounted`
   --> rust/kernel/types.rs:466:36
   |
   466 | pub unsafe trait AlwaysRefCounted: RefCounted {}
   |                                    ^^^^^^^^^^ required by this bound in `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `auxiliary::Device: types::RefCounted` is not satisfied
   --> rust/kernel/device.rs:330:45
   |
   330 |             fn from(dev: &$device<$src>) -> Self {
   |                                             ^^^^ the trait `types::RefCounted` is not implemented for `auxiliary::Device`
   |
   ::: rust/kernel/auxiliary.rs:250:1
   |
   250 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `types::RefCounted`:
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   fs::file::File
   fs::file::LocalFile
   mm::mmput_async::MmWithUserAsync
   mm::Mm
   mm::MmWithUser
   and 4 others
   note: required by a bound in `types::ARef`
   --> rust/kernel/types.rs:478:20
   |
   478 | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `auxiliary::Device: types::RefCounted` is not satisfied
   --> rust/kernel/device.rs:331:17
   |
   331 |                 (&**dev).into()
   |                 ^^^^^^^^^^^^^^^ the trait `types::RefCounted` is not implemented for `auxiliary::Device`
   |
   ::: rust/kernel/auxiliary.rs:250:1
   |
   250 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `types::RefCounted`:
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   fs::file::File
   fs::file::LocalFile
   mm::mmput_async::MmWithUserAsync
   mm::Mm
   mm::MmWithUser
   and 4 others
   note: required by a bound in `types::ARef`
   --> rust/kernel/types.rs:478:20
   |
   478 | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
