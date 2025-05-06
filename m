Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A4264A6D;
	Tue,  6 May 2025 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522759; cv=none; b=lsSmwpVwYj0uRFYCGvkRRx3U7lwZBJLnVpWKJoabHkToHPx/1HKYR9K+mCd6ibvWb6LN7MOLSIluA139oD9D8pbEXHbEoUvVNL+SaEHwWsSlEz9HpI1M/EYbjxHKvwRLw8x532Mcd3wwiHBtIqplyuroiM2dOWmFY6+IAP3Pjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522759; c=relaxed/simple;
	bh=MFyvTZiB5IiYHFdjR1e+he6kmSbNDWDGhar7CH/s4rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfJ5doblzAqKVFG4NPVt1ANrtyIv6gb3y2zZwkPrhToecR4yVGeGM2sBvttvPW3PxpNkMoUCgrPm8ctnwLvIsNJFn6OndqlXQfULCXl+Hp7ZUybZaRcOuMpOHKIxH+1NUGrP6R56N9ccwBQCEB+98CT4NNQX5qQ8JmcIGfCD/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJME86Yo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJME86Yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EC2C4CEE4;
	Tue,  6 May 2025 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746522759;
	bh=MFyvTZiB5IiYHFdjR1e+he6kmSbNDWDGhar7CH/s4rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJME86YoX5APk74j+p+0KNyT2AAz0eKb7egbN8XvPhq9tqvhUPW6QZbGpwc1fr2/y
	 FYmOcsR/hlex6SJJmcBM1jeSc0roTxUsd3EJOdTdjhgIexo64ZBxJv1DRBSAdI9Rnl
	 4ZkdrCLkqAr9F2wJj9OO0EASd0k6GviAIA8GlxdNQRc600+o60TUm6tLbNtdYGGpxO
	 j56CHekwL4T8wh/f0cBESmiBPB4T409D3jF45XmZajIg9U8NSG3ZbjSRKIUuYQJibb
	 LgOpHRfphH/UhCLVrz2qYQAY+wjfH3doi4ePK0Wje0IzdJiNgQRwPOlXYeaaP0N8W1
	 Dt4mvt/XHCxzA==
Date: Tue, 6 May 2025 11:12:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aBnSgu_JyEi8fvog@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

>  MAINTAINERS                               |    1 +
>  arch/x86/include/asm/cpu.h                |    6 +
>  arch/x86/include/asm/cpuid.h              |    1 +
>  arch/x86/include/asm/cpuid/internal_api.h |   62 +
>  arch/x86/include/asm/cpuid/leaf_0x2_api.h |   57 +-
>  arch/x86/include/asm/cpuid/leaves.h       | 2055 +++++++++++++++++++++
>  arch/x86/include/asm/cpuid/table_api.h    |  120 ++
>  arch/x86/include/asm/cpuid/types.h        |   74 +
>  arch/x86/include/asm/processor.h          |    1 +
>  arch/x86/kernel/cpu/Makefile              |    2 +
>  arch/x86/kernel/cpu/cacheinfo.c           |  280 +--
>  arch/x86/kernel/cpu/common.c              |   65 +-
>  arch/x86/kernel/cpu/cpuid_debugfs.c       |   98 +
>  arch/x86/kernel/cpu/cpuid_scanner.c       |  209 +++
>  arch/x86/kernel/cpu/cpuid_scanner.h       |  117 ++
>  arch/x86/kernel/cpu/intel.c               |   17 +-
>  arch/x86/lib/cpu.c                        |   41 +-
>  tools/arch/x86/kcpuid/cpuid.csv           |    4 +-
>  18 files changed, 2926 insertions(+), 284 deletions(-)
>  create mode 100644 arch/x86/include/asm/cpuid/internal_api.h
>  create mode 100644 arch/x86/include/asm/cpuid/leaves.h
>  create mode 100644 arch/x86/include/asm/cpuid/table_api.h
>  create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c
>  create mode 100644 arch/x86/kernel/cpu/cpuid_scanner.c
>  create mode 100644 arch/x86/kernel/cpu/cpuid_scanner.h

Regarding CPUID header organization:

 - Please move <asm/cpuid/internal_api.h> into <asm/cpuid/table_api.h>. 

   There's not really much point to making it 'internal' AFAICS, as the 
   main <asm/cpuid.h> header already includes <asm/cpuid/table_api.h> 
   and <asm/cpuid/internal_api.h> respectively, so it's not all so much 
   internal anymore.

 - Please just use a single central API header: <asm/cpuid/api.h>, and 
   remove <asm/cpuid.h>. It's confusing to have both <asm/cpuid.h> and 
   a proper <asm/cpuid/> header hierarchy.

   ( I wanted to point to <asm/fpu/api.h> as the shining example to 
     follow, but then I noticed that somehow we grew a <asm/fpu.h> wart 
     last year via b0b8a15bb89e. Will fix that ... )

 - Is there a strong reason to keep <asm/cpuid/leaf_0x2_api.h>? I think 
   for_each_leaf_0x2_entry() could just be moved into 
   <asm/cpuid/api.h>, it's one of the accessors.

 - In a similar vein, I don't see much point of keeping 
   <asm/cpuid/table_api.h> header separate either. <asm/cpuid/api.h> 
   won't be overly large I think.

 - Could we rename <asm/cpuid/leaves.h> to <asm/cpuid/leaf_types.h> or 
   so? It's really a sub-header of <asm/cpuid/types.h> and should thus 
   share the nomenclature.

 - After all this we'll only have 3 headers left:

	<asm/cpuid/types.h>
	<asm/cpuid/leaf_types.h>

	<asm/cpuid/api.h>

   And <asm/cpuid/leaf_types.h> is only a separate header because it's 
   autogenerated by an external project.

 - Wrt. <asm/cpuid/api.h>, we'll need a few followup cleanups there too 
   I think, such as migrating to the cpuid_*() namespace:

     - Rename have_cpuid_p() to cpuid_feature() or so.

     - I find the cpudata_cpuid_ namespace a bit confusing:

		__cpudata_cpuid_subleaf_idx(__table, __leaf, __subleaf, __idx)
		__cpudata_cpuid_subleaf(__table, __leaf, __subleaf)
		cpudata_cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
		cpudata_cpuid(_cpuinfo, _leaf)
		cpudata_cpuid_nr_entries(_cpuinfo, _leaf)
		cpudata_cpuid_index(_cpuinfo, _leaf, _idx)
		cpudata_cpuid_regs(_cpuinfo, _leaf)
		cpudata_cpuid_index_regs(_cpuinfo, _leaf, _idx)

       All of CPUID processing is related to 'data', and we don't 
       really have any 'cpudata' primitives, so the cpudata_ prefix is 
       confusing to me.

       It's particularly confusing for methods like cpudata_cpuid(), 
       which sounds like a generic method, while in reality it accesses 
       subleaf 0, right? Why not name it cpuid_subleaf_0() or so?

       My suggestion would be to use a structure like this:

		__cpuid_subleaf_idx(__table, __leaf, __subleaf, __idx)
		__cpuid_subleaf(__table, __leaf, __subleaf)
		cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
		cpuid_subleaf_0(_cpuinfo, _leaf)
		cpuid_leaf_nr_entries(_cpuinfo, _leaf)
		cpuid_leaf_index(_cpuinfo, _leaf, _idx)
		cpuid_leaf_regs(_cpuinfo, _leaf)
		cpuid_leaf_index_regs(_cpuinfo, _leaf, _idx)

        Or so? In my book it's a nice bonus that they thus become part 
        of the overall cpuid_*() API family. Note how these accessors 
        still are all still either cpuid_leaf_ or cpuid_subleaf_ 
        prefixed.

Thanks,

	Ingo
