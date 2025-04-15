Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCFB1CA81;
	Tue, 15 Apr 2025 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676292; cv=none; b=OIihIgnJTxz80dABCu+IJivJ41JxXeNk+BcxQtRW1gZS6+4wlheoASGGdjlRjE1cHTHQL/5FM7ubEv0mL+L8KeB5HiET+MuvM4U5cVDg5BBgtaHEsd/RgQP9MQNRrnQCC4buLqkmdi18ahA10WHYnywsCKf9az/iZBpy827tf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676292; c=relaxed/simple;
	bh=En+g8/MYoY3+vHqrlspwzisTuuyIQjqOggN9YUEOg8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMVzUYHzGv8WGmrai/hjeeGNc/swKI0akZMtDrM9ZRaCcyO10IpMyEUo89rWtzyY93B5YTZY3ZIU61EPzeiZhoOhVn/e2ujaWM0rPL/NWGUyGYpTFJtUxdbM3g+/m1e3jMXhM6+QeeX8Z0gPBM5j44Jgw+vQ9eDhnJXvXGmVo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg+vgASn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg+vgASn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F69C4CEE2;
	Tue, 15 Apr 2025 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676290;
	bh=En+g8/MYoY3+vHqrlspwzisTuuyIQjqOggN9YUEOg8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hg+vgASn1CLUWwEYOx1nDjG/CuaQUGKdSLQsZQydi6tPdHfrEtfntlwNvPTnNi92n
	 B6dXBcFA6UQwS8JXAWq+wu5uzPKV/E0aNxX67wHMgmjq5eGmTbP3hu1FUArr8f5Jnc
	 4PaZP8IcW1iomq176t58lC8WyqSYApU4aKdCCeFX3YG9Dgl+ingFbJWHYC0NrZl9fO
	 c3tqkEqMBIcYVV4AOYvFHo0zMGZbR9FHsTjUvoVu90tai9b4M25xW/nKUiaE3qQ4vH
	 UMd5nbgvaL8h94V+HM7jk1gEHt7UpyXR5Aocyvj5id+ng+qHDOeNOhDWe/LqiCR5Z5
	 s3hpeNOsSMsPw==
Date: Mon, 14 Apr 2025 17:18:08 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: kernel test robot <lkp@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: drivers/bluetooth/hci_vhci.o: error: objtool:
 vhci_coredump_hdr(): STT_FUNC at end of section
Message-ID: <lvkw74yzzsqh2jnt267wdqir43leq35jehy6spcblwv2havo7w@pwqle5eer2h3>
References: <202504130652.o7UWcPMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202504130652.o7UWcPMe-lkp@intel.com>

On Sun, Apr 13, 2025 at 06:16:42AM +0800, kernel test robot wrote:
> :::::: 
> :::::: Manual check reason: "only suspicious fbc files changed"
> :::::: 
> 
> BCC: lkp@intel.com
> CC: llvm@lists.linux.dev
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Josh Poimboeuf <jpoimboe@kernel.org>
> CC: Ingo Molnar <mingo@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b676ac484f847bbe5c7d29603f41475b64fefe55
> commit: 3e7be635937d19b91bab70695328214a3d789d51 objtool: Change "warning:" to "error: " for fatal errors
> date:   12 days ago
> :::::: branch date: 2 hours ago
> :::::: commit date: 12 days ago
> config: x86_64-buildonly-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202504130652.o7UWcPMe-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/bluetooth/hci_vhci.o: error: objtool: vhci_coredump_hdr(): STT_FUNC at end of section

Hi Nathan,

This is looking like a Clang bug to me.  .text.vhci_coredump_hdr has
zero bytes, and its zero-length vhci_coredump_hdr() function is
referenced by force_devcd_write() as a function pointer.  I wasn't able
to find any undefined behavior that might trigger that somehow.

-- 
Josh
