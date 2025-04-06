Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6C204C28;
	Sun,  6 Apr 2025 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743940811; cv=none; b=IeENIf/yxbW2JBkJ75KmJwteaEwuLKKnXYjm5Z1179nBEEloa7jYn7sA970H0yovRDpZK7Vx8lhfTmUKusC7wvCBTswIMUIR0Hw9quuAykQA+ye+bFHaPleu3M0FJm+Z6D38beydd5WBfLPqh2tSDJidB63V4SjJ6Jp8eNfh0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743940811; c=relaxed/simple;
	bh=e34UQPwgoaLbxbO0d1Z3Vpvdu/N7oezyi3BKw6TVUEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BitKrtpxAlaKVaLuo4UHI/fPM5EeywvmBmcYgkEctsjertINQtqd5dtYQcnVgxP3vVSBAh9Y4QTB1kENXXtzRO1rZC7uuhvRCT5radFrN0f5W1M22KtvE/HivgI9mzWs7xhOJTVgBXXEBFah/q9Hb2XL+ySjf5PBz/YHd7wN/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tq4plMZ9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq4plMZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743940809; x=1775476809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e34UQPwgoaLbxbO0d1Z3Vpvdu/N7oezyi3BKw6TVUEI=;
  b=Tq4plMZ9da8okdLJQZWQBWpqnSyiMHyMCAQrOhmeacphrpb/zkeB0IVv
   rqe+MgAuOQyBnzhk3Dyx33Sqc2o5YfqFN7EpbD0oMVEgpNOxIzZ2ighlK
   J+ss27hy0B9zmk4QGv5IXfKTB8KB4CumzyoPSfcssN2W11769VsUJE113
   DWTvhfP7RN/W+vkT+Gj4qZ833M5CWxNFPj9bzT5Vcej61YRnzaNMQk6B/
   f5KCZGEbE6gTfXlf8q6fXXNflm/5+JNz6kAczBI7AT+gfjl5n0D7pVz+J
   bBsraMS0PBcDpcp2oj1lA46+mbBUbO7NQt2T6YwNOI/Woe9FBmzCgUqHF
   w==;
X-CSE-ConnectionGUID: XaLraHhkSH2j2qzZkFdOUw==
X-CSE-MsgGUID: /LzzVoUHRgi5PpqZYlh29A==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="70704211"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="70704211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:00:08 -0700
X-CSE-ConnectionGUID: Cr/JKSWvSwGOYAVHkQi2fg==
X-CSE-MsgGUID: Hgfyj8b1RNaWDkouvkjcug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132842866"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2025 05:00:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1OfT-0002Zr-0L;
	Sun, 06 Apr 2025 12:00:03 +0000
Date: Sun, 6 Apr 2025 19:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2] rust: alloc: implement `extend` for `Vec`
Message-ID: <202504061937.dH9ikiZo-lkp@intel.com>
References: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/rust-alloc-implement-extend-for-Vec/20250405-215300
base:   a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
patch link:    https://lore.kernel.org/r/20250405-vec_extend-v2-1-e4a85af43cb3%40nvidia.com
patch subject: [PATCH v2] rust: alloc: implement `extend` for `Vec`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250406/202504061937.dH9ikiZo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061937.dH9ikiZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061937.dH9ikiZo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this `.into_iter()` call is equivalent to `.iter_mut()` and will not consume the `slice`
   --> rust/kernel/alloc/kvec.rs:486:18
   |
   486 |                 .into_iter()
   |                  ^^^^^^^^^ help: call directly: `iter_mut`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#into_iter_on_ref
   = note: `-W clippy::into-iter-on-ref` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::into_iter_on_ref)]`
--
>> warning: this `.into_iter()` call is equivalent to `.iter()` and will not consume the `slice`
   --> rust/kernel/alloc/kvec.rs:533:27
   |
   533 |         self.extend(other.into_iter().cloned(), flags)
   |                           ^^^^^^^^^ help: call directly: `iter`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#into_iter_on_ref

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
