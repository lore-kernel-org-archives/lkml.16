Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11201E5B60;
	Wed, 18 Jun 2025 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750225868; cv=none; b=kNfAGqYleai+lYQwiXVhBWv9DmyO0ybEn4mcJWv9W6g090Mw4ZKnrFDZ5Z8IplF7cdd++XdB59uHNb8Iv+spu0NO6pat+WAJCqgcqApo5KxZ/E9RIk+Hpsh38/13suSIZ+Y4ZEXB4iJRI8tlshkeIb5PNuG2ufOjDt1bYXIQWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750225868; c=relaxed/simple;
	bh=Tdgx2liwsIplwezdt/eFKC4vMNxOqHp4aQ+BcUH8kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrcECnvIT4oCG/DyeKaQe+NIqqTJ1bewiu383BV2epA1ezJFHY620DmfvpI5Spq4C1D4YmWBeOCJ+e5yGvHSjpPLO7/fxuH0JY3TGA3uldpPewEqXjz5IYWfcSk0rTn0QoO0Hmg2ipq+YRnAIUSfcWT31oS58k3LWW9bG6SpVRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juhs/ZzI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juhs/ZzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750225865; x=1781761865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tdgx2liwsIplwezdt/eFKC4vMNxOqHp4aQ+BcUH8kBQ=;
  b=juhs/ZzI6BKbAIj5jkdRhNNc3+zU2jJcjqKOVaAz1lvvQ5zvPrLnRipj
   YVkK/x0wrOQjPezVNNXK403LClM2PswchZBuwbcur677Cvsd3fyPRETf7
   /bmuPUgBH66JlFTGOXAgjo+k88GtBlwr3cstKOzhTS/4Nf7xWAtZ0aO9R
   ISwcGJwbw/Hc7zsmOQtW1D3MXTVCqOtpXE7mCBY1Rz4ZDp7rf5d2nFJBY
   fEMrCgAsaU8Jywwr0q4HX2dFGaf7R1SQyiHOC8Tn6YleNFzyu2qUGd28D
   otDfew0UQf0vMny9eCYPvMFFy3aZAwFXE+2g7i2QcKbuwjkqYK6qU77xG
   Q==;
X-CSE-ConnectionGUID: 73ha6hyuSe2Y48IgQDIw0Q==
X-CSE-MsgGUID: dt38bHOMSMSq/0tlhUzRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52129818"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52129818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 22:51:05 -0700
X-CSE-ConnectionGUID: y++iQIilS0CcpPuztu0urw==
X-CSE-MsgGUID: A71+k8qsTsWnOtKAkWParg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149202854"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 22:51:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRlhM-000JRS-26;
	Wed, 18 Jun 2025 05:51:00 +0000
Date: Wed, 18 Jun 2025 13:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Gomez <guillaume1.gomez@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] Use new `--output-format=doctest` rustdoc command
 line flag to improve doctest handling
Message-ID: <202506181334.f0STx6ta-lkp@intel.com>
References: <20250617140032.1133337-2-guillaume1.gomez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617140032.1133337-2-guillaume1.gomez@gmail.com>

Hi Guillaume,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on shuah-kselftest/kunit shuah-kselftest/kunit-fixes linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Gomez/Use-new-output-format-doctest-rustdoc-command-line-flag-to-improve-doctest-handling/20250617-220502
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250617140032.1133337-2-guillaume1.gomez%40gmail.com
patch subject: [PATCH 1/1] Use new `--output-format=doctest` rustdoc command line flag to improve doctest handling
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250618/202506181334.f0STx6ta-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181334.f0STx6ta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181334.f0STx6ta-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in scripts/rustdoc_test_builder.rs at line 16:
    //! the `gen` script (done there since we need to be aware of all the tests in a given file).
    
    use std::collections::HashMap;
   -use std::io::Read;
    use std::fs::create_dir_all;
   +use std::io::Read;
    
    use json::JsonValue;
    
   Diff in scripts/rustdoc_test_builder.rs at line 25:
    
    fn generate_doctest(file: &str, line: i32, doctest_code: &HashMap<String, JsonValue>) -> bool {
        // FIXME: Once let chain feature is stable, please use it instead.
   -    let Some(JsonValue::Object(wrapper)) = doctest_code.get("wrapper") else { return false };
   -    let Some(JsonValue::String(before)) = wrapper.get("before") else { return false };
   -    let Some(JsonValue::String(after)) = wrapper.get("after") else { return false };
   -    let Some(JsonValue::String(code)) = doctest_code.get("code") else { return false };
   -    let Some(JsonValue::String(crate_level_code)) = doctest_code.get("crate_level") else { return false };
   +    let Some(JsonValue::Object(wrapper)) = doctest_code.get("wrapper") else {
   +        return false;
   +    };
   +    let Some(JsonValue::String(before)) = wrapper.get("before") else {
   +        return false;
   +    };
   +    let Some(JsonValue::String(after)) = wrapper.get("after") else {
   +        return false;
   +    };
   +    let Some(JsonValue::String(code)) = doctest_code.get("code") else {
   +        return false;
   +    };
   +    let Some(JsonValue::String(crate_level_code)) = doctest_code.get("crate_level") else {
   +        return false;
   +    };
    
        // For tests that get generated with `Result`, `rustdoc` generates an `unwrap()` on
        // the return value to check there were no returned errors. Instead, we use our assert macro
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1825: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
