Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4721CC51;
	Wed, 21 May 2025 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863328; cv=none; b=ahxfSGa/cx/evfh/OwHLpFEWzGqpaeeHiF25SLxyeuqGHGQqQSrgdS3jfU5m/jasFLySUu0RHiAAqvJQKHwUi1++sxAHduu3vZACSuRX36U7zUm8ZXTim9IirN/BLZUm8v2gIvKpqrR5uSnxuTu9qL8oPuYk8OJCNAIK4WXa9xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863328; c=relaxed/simple;
	bh=YZLxa21Ar6q84YL0TrLgO1kJWRoUTzRZEIr+JUaZ3Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5Sx5wRW5dRNjPFw9PrGjQL1VTHjfjN7M6cMG5tV/W2SHBOn6dpg1oKEErdQ3dXpdICN2BSfemTw7tJAEtHH3q7U3n65QYT3TXUANxUy+wbg02JyqlI3BWba22PsycggPnXd0PaNPx3K937Q5cV85mkf+GfeUvbrqfRtOUdqBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYlEmkw+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYlEmkw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863327; x=1779399327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZLxa21Ar6q84YL0TrLgO1kJWRoUTzRZEIr+JUaZ3Iw=;
  b=PYlEmkw+2aveZn5WP1pXtbRVRSr1CRnVV5/W1RB2nekd6zMZH+z+vgPN
   dnGkaqHrYm2bV5WUs5DWgGWQ7KBbyC9EjBxoNunzeu8Owr9mYwX2bMB5Y
   UZhMQGFikPCwl4vGOSeXbahGcUgoXXZjf2yiffE7k44dHeEBq51JOGKQl
   dfzdXO4v2cKhPEOPlHc+fFs9ZQQ/Zfr54MSRnSsWWWzpyXptnyLe4PojO
   A/173SmaYHVUTbxIknM4HbG30FKyafxcx99ovMkOpexZ2giJgCrozy1sr
   DOA5Zdk5LfrtwajtqYXbCybNRRuESbEK/IyHlaIQD15DzHOkWvGKHGmMg
   g==;
X-CSE-ConnectionGUID: cCOK04uaTJKtizwcEqUekA==
X-CSE-MsgGUID: 8yZmZJhSTPCMvI1LHjDDAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61208572"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61208572"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:35:23 -0700
X-CSE-ConnectionGUID: r3/OdqIXRo6HroqyBfm0bQ==
X-CSE-MsgGUID: Oc+ST89ATLKOARaVVf9qTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145393225"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2025 14:35:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHr5n-000Oeg-2k;
	Wed, 21 May 2025 21:35:15 +0000
Date: Thu, 22 May 2025 05:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 6/9] rust: device: Implement accessors for firmware
 properties
Message-ID: <202505220521.EPHBSqQg-lkp@intel.com>
References: <20250520200024.268655-7-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520200024.268655-7-remo@buenzli.dev>

Hi Remo,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Remo-Senekowitsch/rust-device-Create-FwNode-abstraction-for-accessing-device-properties/20250521-040612
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250520200024.268655-7-remo%40buenzli.dev
patch subject: [PATCH v5 6/9] rust: device: Implement accessors for firmware properties
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505220521.EPHBSqQg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220521.EPHBSqQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220521.EPHBSqQg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::private`
   --> rust/kernel/device/property.rs:14:5
   |
   14 |     private::Sealed,
   |     ^^^^^^^
   |     |
   |     unresolved import
   |     help: a similar path exists: `crate::device::private`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
