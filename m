Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42221D58C;
	Sun, 29 Jun 2025 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202691; cv=none; b=QtM9Z/0dN1nn2QqEizUj4+x6obl60Vib7wXhVj2U7jYq3zwX7U1Q8Kml/j2j6kVuuRITMOUIyTV4Eo9lY2h3dIEhDTwnc7xNIYGoF1f3pVA5UJ/MovzbuQSZf0XVfX0W6Zh6HbUq+blyqO5+fZD8418wvtc1/g1RQNLWa5H1qkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202691; c=relaxed/simple;
	bh=MR1VISFu7jm4/kc2C+LWaAtDqZhs7Smfr3Y5UNJzVWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsmbV4CuSvl5MDY4ORKrY1YRa62jasxKxg9QO8CA9gXPZ+OTqSHEucQnhQPm3ktlxpWiyYvkzZzDNzYuPLvPz+q8cBgWN7Tr7bErA4wxDfU9pIX+kTf5QCgXEL4uF3kDNlr0UeK71/0cvm/kSggoq2DBLCGhUTrTYt6O4J48TMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnczPMy1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnczPMy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751202690; x=1782738690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MR1VISFu7jm4/kc2C+LWaAtDqZhs7Smfr3Y5UNJzVWo=;
  b=WnczPMy1/8pRf/7aYhPUUwj6OODNcLUx+CDFh+PxMNGgnNacogbnVUI/
   KafBh5/Hu9dlDWPfSCtM2T0eGDm4CxF2BFLlQMp55vTovUgvSfAXJhcFe
   syXELWs7+Q6BQMgY4wY4sMfApnKgYZet72Uye4AsW4gg+Jlu93C7f8rw2
   dsX4whsDG3rjVykbLXS7MiYsRh6Me645Vw9tTm+797N5T7hb9ayRcMXco
   gd5EU3U6yV2qq0qbrW7P6T0ikyuRgWxTYg0dRRyguNtEuykqiE2kGswQL
   HlwMP3beMo5TYrOJORz93pKRFG3tXWSldwhTKV6A75FvG6K0KE3aMP4bG
   w==;
X-CSE-ConnectionGUID: 8ELNJSloTj+Cb6H4r54XRg==
X-CSE-MsgGUID: EjmKPvDoQIOf7bhT2tI/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53566185"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53566185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 06:11:29 -0700
X-CSE-ConnectionGUID: HDNEwR7aRp2NQgCq1NvX9g==
X-CSE-MsgGUID: 2kYo//lFSYq+b3ZaUIdYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="152847207"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2025 06:11:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVroZ-000XwY-0g;
	Sun, 29 Jun 2025 13:11:23 +0000
Date: Sun, 29 Jun 2025 21:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v6 1/2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <202506292009.nbvCCbAr-lkp@intel.com>
References: <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on edc5e6e019c99b529b3d1f2801d5cce9924ae79b]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-regulator-add-a-bare-minimum-regulator-abstraction/20250628-011418
base:   edc5e6e019c99b529b3d1f2801d5cce9924ae79b
patch link:    https://lore.kernel.org/r/20250627-topics-tyr-regulator-v6-1-1d015219b454%40collabora.com
patch subject: [PATCH v6 1/2] rust: regulator: add a bare minimum regulator abstraction
config: x86_64-randconfig-008-20250629 (https://download.01.org/0day-ci/archive/20250629/202506292009.nbvCCbAr-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292009.nbvCCbAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292009.nbvCCbAr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.7
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> warning: variable does not need to be mutable
   --> rust/kernel/regulator.rs:295:29
   |
   295 |     pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, Error<Disabled>> {
   |                             ----^^^^
   |                             |
   |                             help: remove this `mut`
   |
   = note: `#[warn(unused_mut)]` on by default
--
>> warning: variable does not need to be mutable
   --> rust/kernel/regulator.rs:324:30
   |
   324 |     pub fn try_into_disabled(mut self) -> Result<Regulator<Disabled>, Error<Enabled>> {
   |                              ----^^^^
   |                              |
   |                              help: remove this `mut`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
