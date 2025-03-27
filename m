Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4E3FC3;
	Thu, 27 Mar 2025 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743052011; cv=none; b=Hy+aEEetMYuOFO+4rPpM8G5pJe7weeiGIEd545Cwa8uPQlJ47kL618Zc8Dp0AsaDqyjcYWmlppMv0lwb8gcCvspFma/cPCnNipydw/luVHpNTpa9dKrXpgAJCXKr4bDCdlFmVppOvX8NSU8yl2+YgKYh7IzuKnHBQBDQ75lUoZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743052011; c=relaxed/simple;
	bh=QZLA+YWmkUgWaU8UO4CO8t8Sl4UJJ33oXkNapqZpkSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAltjkQ427goO4Xz7Ex6E69Y/zQzG9nC8m1MJOmsj5KhUqvNEg8R09gvcNNIaJsOVbLa7FRz4XkmYlxntlYDdiKhvgYupscbS2/Gf2FE3202LA2zpX3CTBUV2s1sElzwFU3AWqqgZ+z7iIVY6tpbtwxyULiYZD3gQxfPkbiH1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDw3Xafn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDw3Xafn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743052009; x=1774588009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZLA+YWmkUgWaU8UO4CO8t8Sl4UJJ33oXkNapqZpkSY=;
  b=VDw3Xafnf3mHZsgskTgkLibo5HjiPKKrXx8lEnOLcldN0eELurDFkNAa
   Jx8qKhaLzamhOFZJYd/lzPw5ncg0eOw8MXXQ3UtVhEoz3V76DIR8L92GT
   4UcQSvDNVx/E7GpvxlhJXxJRcBXOaAFC+mcdBHKLVJmJGI58tOvN+XVBv
   s2OHz85PCnxmzO2qDSPhNwD9GJia6FQO1xIG9DVc9o2WxGl4gmNSQ2tT0
   VFV7n02ZdWVs+5uf4UteduHx8ypZ3TQ/E6K4hf7yVRIoQ5GWuh0f33Waz
   AaGRfbsjYdHUtoB/eKRZoUYCcT+m5LErU4feAdXXOu9vYpMvirPRmvkyI
   Q==;
X-CSE-ConnectionGUID: ImTQNK+gS0y/1ez1cnV1dw==
X-CSE-MsgGUID: oyIN9g8oRS6UvIH/mj4yQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48241850"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48241850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 22:06:48 -0700
X-CSE-ConnectionGUID: Z0QRF+MaQFmANCuRmqa1jw==
X-CSE-MsgGUID: u8PPwCnlRmGXX1fBkKmIHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="130140137"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2025 22:06:43 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txfRx-0006NX-20;
	Thu, 27 Mar 2025 05:06:41 +0000
Date: Thu, 27 Mar 2025 13:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, felipe_life@live.com,
	linux-kernel@vger.kernel.org,
	Filipe Xavier <felipeaggger@gmail.com>,
	Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2] rust: add new macro for common bitmap operations
Message-ID: <202503271256.KMMeri1M-lkp@intel.com>
References: <20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com>

Hi Filipe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d]

url:    https://github.com/intel-lab-lkp/linux/commits/Filipe-Xavier/rust-add-new-macro-for-common-bitmap-operations/20250325-213139
base:   beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
patch link:    https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f%40gmail.com
patch subject: [PATCH v2] rust: add new macro for common bitmap operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503271256.KMMeri1M-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271256.KMMeri1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271256.KMMeri1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `BitOr`
   --> rust/kernel/impl_flags.rs:8:55
   |
   8 | /// - Implementations of common bitmask operations ([`BitOr`], [`BitAnd`], etc.).
   |                                                       ^^^^^ no item named `BitOr` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `BitAnd`
   --> rust/kernel/impl_flags.rs:8:66
   |
   8 | /// - Implementations of common bitmask operations ([`BitOr`], [`BitAnd`], etc.).
   |                                                                  ^^^^^^ no item named `BitAnd` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
