Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9B256C8C;
	Sun, 11 May 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746965806; cv=none; b=XVp3Fxkv0V0tmpO/ESpSZM7e8tTxIova136tE47SiT0iR3Q/g+0BcOKNQp8u4vJ2Mig95DcbbOjFigs+CdJ+X066LvtZocXNOUX1e+ju/KULsGVHPufiEofnI1MU6AjiTsP/mjOEbK9mPgzE1PEJaUH3VD5bqHDJQyzUuaeoKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746965806; c=relaxed/simple;
	bh=wftDMjtzW8rN7nLd3WUBpBEtoE+MVGxiJ707Gbrl6L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiY+N79hQ9q0xxK2kXGVA7KTFJ6i+Qup3UEh4NvJ1rAF4hJBxbmOB3uyBM80b35HbyCIvoZPI723uC+c/m1bmrHJRwu7yKS7sP2rhZOseQstBzKzgvIJni3PzmErot28QoBuURyulZDGzjfZeGTUMYTewJD6HZ4a7WCJg7llXB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5KnpD+z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5KnpD+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746965804; x=1778501804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wftDMjtzW8rN7nLd3WUBpBEtoE+MVGxiJ707Gbrl6L0=;
  b=f5KnpD+zfGbnKwCIzfJlRLSADJgK4QnRqYrlcAgB9TImfgaYuLCRysvW
   oxaMxbuCZe2z9tWqHBM51N17YmiZJ9H/aT1gtId/bLti63b7JX7sDxIHW
   EGf/q2l8QeUmAaEr5BFhb79o/NH+VZIryKF4mItRYgrXTHxNDNCqgnz6M
   3JkFGOLpVLCEN0PcRqq9HXXaK1KYY1virsA2hRbaK8YrGPv4Nf/rue+jU
   ObMkWBsnHLV7vZzjS1M+BhmZ6L7V1NWiEzWnWzx2CoeEAxrDmT8fur42/
   4LXxAEJwnk7RLETCsba8c9iSzHt1NBzLTllTujw9gNZL19+qe+29zuHyq
   w==;
X-CSE-ConnectionGUID: TA8SRNFYSwqBks6uJUJeOw==
X-CSE-MsgGUID: Ck9Y/+L0STiNgSDouWUgrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="74151060"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="74151060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 05:16:41 -0700
X-CSE-ConnectionGUID: dwGziZdxRlWZOOvoLGw2jQ==
X-CSE-MsgGUID: M5A026x7SUGsYKtlwFn+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="142223778"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2025 05:16:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE5be-000Dkf-1z;
	Sun, 11 May 2025 12:16:34 +0000
Date: Sun, 11 May 2025 20:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>, Sky <sky@sky9.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add UnsafePinned type
Message-ID: <202505112005.CDR6Xi0o-lkp@intel.com>
References: <20250510-rust_unsafe_pinned-v3-1-57ce151123f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510-rust_unsafe_pinned-v3-1-57ce151123f9@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9de1a293c8ece00d226b21a35751ec178be2a9fa]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Schrefl/rust-add-UnsafePinned-type/20250510-173533
base:   9de1a293c8ece00d226b21a35751ec178be2a9fa
patch link:    https://lore.kernel.org/r/20250510-rust_unsafe_pinned-v3-1-57ce151123f9%40gmail.com
patch subject: [PATCH v3 1/3] rust: add UnsafePinned type
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505112005.CDR6Xi0o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505112005.CDR6Xi0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505112005.CDR6Xi0o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `get_mut_unchecked` found for struct `UnsafePinned` in the current scope
   --> rust/doctests_kernel_generated.rs:7770:7
   |
   7770 |     x.get_mut_unchecked().write(1);
   |       ^^^^^^^^^^^^^^^^^ method not found in `UnsafePinned<{integer}>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
