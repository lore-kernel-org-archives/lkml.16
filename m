Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5801E412A;
	Sun, 29 Jun 2025 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209001; cv=none; b=HFJMSXcm35LRkozbGxNUUSe4Td99vaVqV7jSZYlnPUPmpOiX4XZQQb2wYjGhlJoIfcXF1tIjnwvEKExFtQDQLkcK741XYOxL6mxgACs29+j4dW3OMKGzEc5CkKmHM0gPQuKN91mA/KgGWbAphLMWczvpFf/qKNffBaujNWtU68c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209001; c=relaxed/simple;
	bh=u/4/+SN3xS+ObLD8V7Bx1+EsQs2A4HPAtqNg0o8UzSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQT/NJP+VY9Hy0d3lXof6BPnLwQXbou6g3rqCib4mW2j6thsfnEJaQnHftFWwof2xYxWz3nbQo6MX7ag57xG7L4GKm1FIZ46tcV9pi2hKV8WDIvNaPqGYUwcH/BWC36BZd2Ogn3uiA1clTZqHACDpHrPXFoZSErxib049Sfhu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJuKTEP0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJuKTEP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751208999; x=1782744999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u/4/+SN3xS+ObLD8V7Bx1+EsQs2A4HPAtqNg0o8UzSU=;
  b=HJuKTEP0j+ycw0LPEkhLVk91i5JSwO1X/9EWFHwoy8IlMAMNGDtHjIuP
   f1tcSS1Mq0zdTlSRqt7wYpHUIZoxHDRZU1B9sRECMObT8S50/7j22es8x
   DtwUnTNU8jgu/SrHGpXUQ503OTp2jK0dMyF2jxYyjfIiDG3+9ZBC/s98G
   sXvPV+at5IXOLTYRcIy7CR8LeJus1kf1WxWD2RCtRs/igHWXY1kchzHtI
   W36bBDhMxCe/ZHPWZPXjeWkr7dRYhI9sEJZkLbZoGOW1NER4URIDas+QJ
   GtNYvR7uRzVg97GTJeIfKeQ6RvpXBXBr1mzGF4BGJwzaiGVCDk6/wKoQO
   Q==;
X-CSE-ConnectionGUID: qDXMMt6YQ1yuhUTD8+vY+w==
X-CSE-MsgGUID: 1FJvEWU/TrSlQfK+ErHBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52675765"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="52675765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 07:56:38 -0700
X-CSE-ConnectionGUID: v+A5bqgxSIqB4gL7KQyvIg==
X-CSE-MsgGUID: bEslpo9+SqiizZzXOcxg5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="190415114"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jun 2025 07:56:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVtSK-000Y1K-0F;
	Sun, 29 Jun 2025 14:56:32 +0000
Date: Sun, 29 Jun 2025 22:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] rust: io_pgtable: Add io_pgtable abstraction
Message-ID: <202506300052.VAXOKQxS-lkp@intel.com>
References: <20250623-io_pgtable-v2-1-fd72daac75f1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-io_pgtable-v2-1-fd72daac75f1@collabora.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc35ddcf97e99b18559d0855071030e664aae44d]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-io_pgtable-Add-io_pgtable-abstraction/20250624-053329
base:   dc35ddcf97e99b18559d0855071030e664aae44d
patch link:    https://lore.kernel.org/r/20250623-io_pgtable-v2-1-fd72daac75f1%40collabora.com
patch subject: [PATCH v2] rust: io_pgtable: Add io_pgtable abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250630/202506300052.VAXOKQxS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300052.VAXOKQxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300052.VAXOKQxS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `IOPagetable`
   --> rust/kernel/io_pgtable.rs:55:44
   |
   55 |     /// User-specified type owned by the [`IOPagetable`] that will be passed to TLB
   |                                            ^^^^^^^^^^^ no item named `IOPagetable` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
