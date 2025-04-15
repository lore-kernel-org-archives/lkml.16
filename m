Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C797111BF;
	Tue, 15 Apr 2025 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744677026; cv=none; b=BY/RAKnyVmY+vIMDuxm/8Tiiti9jMadcr9pCab0kc0GACK5xzXyTJm2Is9zhS84osxjzVRA1g7hgl4ZK6Cyq4EBN7PSdDScO20MX1+MGeZIbAymlTsXA1ms4MTdb0Esv0yZe1zBjt44YafPpgrzWR0pBbz8Ks2EIhLRssrqL5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744677026; c=relaxed/simple;
	bh=R/jA1CbfZlsUN+WRI+vx0KtRdgdrUf5aF4FWtf0ZaTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmtzeP1xgnNjQwDtYWeYYLvto3atjPHsFr+TM1P/fVJ0SsQkXg/QpMK3JE6RyfZI1Tiy0bl3YO0X0tb+b2wcUfRyYS4wG9EMTiMc8IcujkjHh+hdOXbGU5K1bcdCIpM0ESwhDA7v8rI1Kg1ZLNvmIWbloA2mxMbSO85u3sn4Cnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PexqHRZJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PexqHRZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3661BC4CEE2;
	Tue, 15 Apr 2025 00:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744677025;
	bh=R/jA1CbfZlsUN+WRI+vx0KtRdgdrUf5aF4FWtf0ZaTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PexqHRZJc7Tnw2QojVij8F8fLCRAhspDhuggp8+c+8s0OfzMlcFGCogeTt/5jI6tO
	 LlsdCYpvaRzcdcTppFqvqbEfp8eQW/+XTV0vDjKQu60WoC4LNtOLuC4lBNhEJX2+MJ
	 K5UXwijAvQAAEPFRQLprsQ0ayd6x4DyQxLsqCz+ugFUwLd/Wo6DzKmdI4qNSgnBiyl
	 +/VxMpI3lytwGILWpZHIvosIEnKaRDg5ftbUvLct9wN+KI+Wp26U/gpsCuEY1IfxQC
	 jOmHIBCMWJ0N2NeWlazBpy7f7kBT5TuTfrBnFaXcOm8Ivdnb8uxlKVbwWPmnJra3FJ
	 4+a/bZeHBHJBg==
Date: Mon, 14 Apr 2025 17:30:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: drivers/bluetooth/hci_vhci.o: error: objtool:
 vhci_coredump_hdr(): STT_FUNC at end of section
Message-ID: <20250415003021.GA4163917@ax162>
References: <202504130652.o7UWcPMe-lkp@intel.com>
 <lvkw74yzzsqh2jnt267wdqir43leq35jehy6spcblwv2havo7w@pwqle5eer2h3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lvkw74yzzsqh2jnt267wdqir43leq35jehy6spcblwv2havo7w@pwqle5eer2h3>

Hi Josh,

On Mon, Apr 14, 2025 at 05:18:08PM -0700, Josh Poimboeuf wrote:
> On Sun, Apr 13, 2025 at 06:16:42AM +0800, kernel test robot wrote:
> > :::::: 
> > :::::: Manual check reason: "only suspicious fbc files changed"
> > :::::: 
> > 
> > BCC: lkp@intel.com
> > CC: llvm@lists.linux.dev
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Josh Poimboeuf <jpoimboe@kernel.org>
> > CC: Ingo Molnar <mingo@kernel.org>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b676ac484f847bbe5c7d29603f41475b64fefe55
> > commit: 3e7be635937d19b91bab70695328214a3d789d51 objtool: Change "warning:" to "error: " for fatal errors
> > date:   12 days ago
> > :::::: branch date: 2 hours ago
> > :::::: commit date: 12 days ago
> > config: x86_64-buildonly-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202504130652.o7UWcPMe-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/bluetooth/hci_vhci.o: error: objtool: vhci_coredump_hdr(): STT_FUNC at end of section
> 
> This is looking like a Clang bug to me.  .text.vhci_coredump_hdr has
> zero bytes, and its zero-length vhci_coredump_hdr() function is
> referenced by force_devcd_write() as a function pointer.  I wasn't able
> to find any undefined behavior that might trigger that somehow.

Indeed, this is https://github.com/ClangBuiltLinux/linux/issues/2073,
which does have a fix in LLVM 21 now:
https://github.com/llvm/llvm-project/commit/ea2e66aa8b6e363b89df66dc44275a0d7ecd70ce

I forgot to request a backport for LLVM 20 but I am not really sure I
want to draw more attention to the patch (since the Clang folks will be
asked to ack a backport) since it had some contention in the LLVM issue
after it was merged:
https://github.com/llvm/llvm-project/issues/130649#issuecomment-2719119408

Kees, do you have any thoughts on requesting a backport for that?

Regardless of it being fixed in LLVM 20, the warning impacts all
supported clang versions IIRC, so we should probably submit Kees's patch
to just use a 'const char *' with the string literals instead of calling
snprintf() on the 80 character array.

Cheers,
Nathan
