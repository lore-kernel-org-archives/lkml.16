Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF025FA2D;
	Wed, 25 Jun 2025 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855543; cv=none; b=R2Z45zSCHEGN3SMKQkaG8+eZWxgpBqAImI0J22Y1iHsFIVicod73MaVLRoYyoJz/CuWcic7n8JY4VVJvzxBCAa4jK+qhmgfD0LREFZBxjwfG+ZMiAXYJcjOVDXW1JWNuJ9ksaLUO1uhoO9rhBXMRmvPqR9qxw8Je3a6lIgGJyFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855543; c=relaxed/simple;
	bh=JM1dsCTTMKSVO7veZW6xF7seieqF91knIU3zOqPtYe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNtfDGsebbhlKrI9dh2I8kpErPVKOWHZVqO3ii6kW5m0DZFquQwhivhtSwMZhiZ5VR26jHE0Jm7HHI3Zjz2TkAfxNPXWJDVe0+CDR//IaKdOb0vQUTBxlUXAGIqrhXLuiyx+N0l/QFqbDP/fpJoFwF2puR9mNeeM/n+iaLFT4oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dz9D+ahs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dz9D+ahs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750855543; x=1782391543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JM1dsCTTMKSVO7veZW6xF7seieqF91knIU3zOqPtYe4=;
  b=Dz9D+ahsTKH9Wrk61jAyLgHUVjcQ9rgL4a7Go3zxy0NmHk0DEywciJQY
   w6aXmcM3dgWVOhDZpJDPFHcFXGpRuame7SpTEmRyom6kMOCGy0vDTK0on
   4YRgxZjrFsbwAmiiVXdPCdS6rkZkr9eIRtJeKOQI9Wqk9srSu4DblEB3Q
   a1hfOC+0WuZ82h4154y0HKNFPfcZAPKDhE/Hz0giONN2XxG015GAfDvbD
   R2ZcD3/oEsBzu5Wmr2p8LI8qJ7ynzweQVLKj7/wlKcUFJMkx2cec5FsKa
   iN9nzcDCmSY5v3zWeDIrOMzICRU+6lhRVXuasvEXb7uOQnb30UTmhvPXd
   A==;
X-CSE-ConnectionGUID: eZVsgBlGQu+QuDiGXtRQVQ==
X-CSE-MsgGUID: jOGHF8I1RpOZ77ekxx51gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75661888"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="75661888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:45:42 -0700
X-CSE-ConnectionGUID: cW31pKh0S+KsTFQLo7x2ZQ==
X-CSE-MsgGUID: saZoJ8aRTkmSx/Qs3ISaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="183245285"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jun 2025 05:45:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUPVP-000T6o-0L;
	Wed, 25 Jun 2025 12:45:35 +0000
Date: Wed, 25 Jun 2025 20:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
Message-ID: <202506252207.uYOBf8SU-lkp@intel.com>
References: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-types-add-Opaque-cast_from/20250624-232939
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-opaque-from-raw-v2-2-e4da40bdc59c%40google.com
patch subject: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250625/202506252207.uYOBf8SU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252207.uYOBf8SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252207.uYOBf8SU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `cast_into` found for struct `HrTimer` in the current scope
   --> rust/kernel/time/hrtimer.rs:175:45
   |
   96  | #[pin_data]
   | ----------- function or associated item `cast_into` not found for this struct
   ...
   175 |         let c_timer_ptr = unsafe { HrTimer::cast_into(this) };
   |                                             ^^^^^^^^^ function or associated item not found in `HrTimer<_>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
