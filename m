Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE19B28A419;
	Wed,  7 May 2025 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631629; cv=none; b=q4PbV+ri2l8HhHNYRr4U668AESPLh/++ww+qCS06ebvtYYDmewEgwgoBhGdsDnbt420Fg9PhHTQy9dSZt9io+ErZ8gvhzt7KwiZ7moEZBC2Ihi9u7UuyXYhDGdYv9azxC9nCKfhZyjyY5iuI3aMdsDJY9RoBXmprx2KWIAsF5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631629; c=relaxed/simple;
	bh=dSxWBR6uNnt2Ow5gUL3hqc70/Tl+5eZVriLB2UuGbzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwQYVGTz2Qu0bYuq4AACKyxWyZV19uvqJNZ5sSCil7ljcNqvCXHNPVxa45umDWCHbUoGgPlQZGZz87RYic0H8qiCHnzEgBcwVGRncAxuB/iQYJnTW1jCcD9eDrkfpQ+W2+ROkEQdbjFgbg+MGhi3+4ek3S9uewFFRqYJyzMg4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS2abuPW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS2abuPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746631627; x=1778167627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dSxWBR6uNnt2Ow5gUL3hqc70/Tl+5eZVriLB2UuGbzk=;
  b=WS2abuPWD09HQb2mv/vugQ8xFZOi1n0n7mZDbTVd3urMdEaJ4ixY4OU8
   TcTvrTeuh0c4TPf7XH/vAnNtMM1e67AMexDhWyuU9VAiAgfQ6KFB8xMwa
   vZ8ah7XngCjR3CJBJY3oAWvv0rRo73RSmQuG2IUMb3820yupjddDSvd0r
   EqIIGry4ZPAz3vbPSurgkzcUGImdzH6VTAFDpDsWBMcH9TuNrcFzrWKU9
   meenzAILzUdOwpEypQB1OmaoviAsZdrRoPs5e899twFMOf4I72/+ivpPB
   26+E5+rp1aQ/T0P5CFFJ3kSvCCA7AGDxBEvswCodA2HNI5AYYIBoMQKgS
   Q==;
X-CSE-ConnectionGUID: Cwst8ctLR5++2NRt/fxLEg==
X-CSE-MsgGUID: Wj6LQtNPSQq2lYQ68d2oHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59029009"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59029009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:27:06 -0700
X-CSE-ConnectionGUID: Sjw+UHyMShKKK6dnruuP5w==
X-CSE-MsgGUID: y7H2T2VATtmJOFOhND4f1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166914976"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 08:27:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgfk-00084v-2e;
	Wed, 07 May 2025 15:27:00 +0000
Date: Wed, 7 May 2025 23:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
Message-ID: <202505072334.8gubqjKX-lkp@intel.com>
References: <20250423134344.3888205-6-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-6-bqe@google.com>

Hi Burak,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.15-rc5]
[cannot apply to next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Burak-Emir/rust-add-bindings-for-bitmap-h/20250423-214819
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250423134344.3888205-6-bqe%40google.com
patch subject: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072334.8gubqjKX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072334.8gubqjKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072334.8gubqjKX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `core`
   |
   = note: the `riscv64imac-unknown-none-elf` target may not be installed
   = help: consider downloading the target with `rustup target add riscv64imac-unknown-none-elf`
   = help: consider building the standard library from source with `cargo build -Zbuild-std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
