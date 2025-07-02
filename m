Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530682EA160
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465767; cv=none; b=UhQawXDcTmE8BPFXvQk7AL78ljKXZ7N70N0HOedawK0VaxCU4Zhvdwy3JeWhHGWDyEuTOP1/LVOUAweZNK46WlElwZ462x58mTiRCPTdhHCEuFFjUAQQHrCSK2m1HWraMyeRqQeTUT9Pc7jkbpOH0FwgWcSB7ctPFIFJhgMxPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465767; c=relaxed/simple;
	bh=DIYuzkdweaBOtoLUxlve79p01Dm36bPtHwaVozKAsZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXLeqHX+JVTYXgjpF7HVm0Vbv9j5ibd8DvzUOGQkD6oi5BhGD8KqqKea+qWQF9d7LMbFCxrxGt41q7kVD9GQePSBWMB0bQ9cUiujcY1R9qfmCzTkbK05Weow7gfERMZ3eF+HBcMzcJIuozVIEtSVzRdxh/uNKSUkDr9tYaDn7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDFAB22C7;
	Wed,  2 Jul 2025 07:15:50 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3193F6A8;
	Wed,  2 Jul 2025 07:16:03 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:16:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>

On Wed, Jul 02, 2025 at 03:24:15PM +0200, Borislav Petkov wrote:
> On Wed, Jul 02, 2025 at 02:16:15PM +0100, Mark Rutland wrote:
> > Sounds like a plan.
> 
> As we figured out on IRC:
> 
> https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
> 
> "clang's integrated assembler only supports concatenating strings with
> '.ascii'. There was discussion of allowing '.string' / '.asciz' but it
> was decided against [1] because it was undesirable to match the behavior
> of released binutils at the time, where"
> 
> and this seems to fix it here:
> 
> ---
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index a185855ab158..46d9eb64bd18 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -9,7 +9,7 @@
>  #else
>  #define __BUGVERBOSE_LOCATION(file, line)			\
>  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> -	10002:	.string file;					\
> +	10002:	.ascii file;					\
>  		.popsection;					\
>  								\
>  		.long 10002b - .;				\
> 

IIUC this also needs a trailing "\0" as per the link above, or this
won't get a NUL-terminator (but will build just fine).

While looking at this I spotted that arm64 doesn't propagate the
cond_str down to __BUGVERBOSE_LOCATION(), which is why we don't
encounter the same problem today.

We should probably fix that, but it looks like it might need some more
header wrangling for ASM_BUG(). I thought we'd split that out to avoid
circular header dependencies, but I could be mistaken.

Mark.

> 
> I leave it to Mr. Z to sort out.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
