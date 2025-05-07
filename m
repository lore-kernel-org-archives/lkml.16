Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BEBA38;
	Wed,  7 May 2025 02:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584814; cv=none; b=LgovH1RMiIsSWu7cscWDieXRQnyT/RXTbxpWM0H1cQYRHe8ftd/M+skUfEu5kR7W3OFfUAsuSneb/HxzRHqxDYav+FMvuiSJm8BHGJodR2xgve7K6Rm3EO+raNQzgVgkzlFsEo9A5EDiBYFPPJlw8W+kC6m40PMMjdCOQLbeCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584814; c=relaxed/simple;
	bh=9O0zUCr+PtnPFBrs+m4E7esrzXv5EOi0g1Cj9zzAH88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr2b0FSYk6mgoMMWnt9YFAMUtOZCkQxP/amZ7+fqhA2FJ5SLGnkAZPV6ARWBhaeS2GZ9cKW0a++7fGwtdNrx9OhIcpFRON36X0nUOcDYy1DDlVHg9uvOJNxELUbyZszuTfStfAvzPckszHrL6Qy2l6pPSdZR+0jiFHDzWxPgGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYkV+pvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYkV+pvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755FEC4CEE4;
	Wed,  7 May 2025 02:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746584814;
	bh=9O0zUCr+PtnPFBrs+m4E7esrzXv5EOi0g1Cj9zzAH88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYkV+pvfBrXXXMs9PFqvY/3WeNwU2T5foeWcI9XbWMDJk6PGjUjaghUfitNCwgLvV
	 tps8SfMwbBktPjrwozZF6vwvRjpG14DxAM7f3IkjmWr6v29P4kkmZ/FQGtlWfvW3Z/
	 5b9eomhd/zpWh22u3gT3NGODYMSaPr8JD5A9GynyNO8udh1ecw2c6BmCrlFWiaK/vm
	 P4dn4VSBbulJvDjfnaux/V79FaIMtPIpIAikM0FNQCnin/GbTgWrudBEreIJibBEFQ
	 Mng3MuLhgpEvHB1n2WCVmHK/xNUcg87dfysi2IiiNs/3gMw+A3Ctz2LxPptmWQOfst
	 zLAYJfhmT5faw==
Date: Tue, 6 May 2025 19:26:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>, arnd@arndb.de
Subject: Re: error: arch/x86/include/asm/mshyperv.h:108:2: ran out of
 registers during register allocation in function
 'hyperv_flush_guest_mapping'
Message-ID: <20250507022649.GA1984217@ax162>
References: <202505070733.osOoFQSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505070733.osOoFQSe-lkp@intel.com>

+ Arnd

On Wed, May 07, 2025 at 07:43:06AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
> commit: cacd22ce69585a91c386243cd662ada962431e63 kbuild: make all file references relative to source root
> date:   6 weeks ago
> config: i386-buildonly-randconfig-006-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070733.osOoFQSe-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070733.osOoFQSe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505070733.osOoFQSe-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping'
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping_range'
>    2 errors generated.
> --
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_get_partition_id'
>    1 error generated.
> --
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_unmap_ioapic_interrupt'
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_map_ioapic_interrupt'
>    2 errors generated.
> --
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_tlb_multi'
>    1 error generated.
> --
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_post_message'
>    1 error generated.
> --
> >> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_query_ext_cap'
>    1 error generated.

This configuration has CONFIG_MATOM=y, which does not really work well
with clang for this reason and some others that have come up in the
past. Given it is likely that nobody will care enough to fix this on the
LLVM side (since it is 32-bit), we should probably just block using
MATOM with CC_IS_CLANG, which Arnd and I had talked about at the last
ClangBuiltLinux meeting.

Cheers,
Nathan
