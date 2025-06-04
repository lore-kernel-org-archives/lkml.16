Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB92111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749066384; cv=none; b=AOSPGQd+5VrHH6X5GR7X1D21cDVA4H7W1upO/AyjpnWnoj/76TM40RUQhc9PATIB1qE04CmOMmew+UVyeF+U60Epu+Rc7S+3sy7+kP7td0RfokcaNzE1CWmw3RmhKXKxp7o+DbL+V/aZPlvUvbpLN0GK2DVEfCXOqgdXQgwld4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749066384; c=relaxed/simple;
	bh=BBIXZ1ZquSCNJ5Y5N5hqdBfbdPzAyp25PcKtUOJCe3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkEzxNPKvNA9yiBXFv+cAdPZE6lmp2mOgnJjNVR+KQFtO/CWdAIShp9fNT7FFcyD2b4nZ/Bbh77FVzg00R9lqN0UF6GT9pqSgdXbA+b95J0Q+NJ+b/FlOh1nFD6jVPIuCxQNvFykDX/Tm+mIsgzISv/cDvtFeDQxd8pVTKUdWQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZCOecYG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZCOecYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749066383; x=1780602383;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BBIXZ1ZquSCNJ5Y5N5hqdBfbdPzAyp25PcKtUOJCe3U=;
  b=GZCOecYG9U3yRGZv1jPEAj2VtnH2+Fy0S5QZoq5TWsTyAguLCZQBUWAv
   5H/zvXyKDQ7xSdFSUjIOBJOR0r1v8THpVuO9koy5pylDjZK0cEapcbFtL
   fqhvejppNo9+zj5OZb/zkrfrP2Fjkqxwtvf1K73Xz1F7x1GHUFemJMcUI
   NXJXzbSJq3bovORIAjC9X3Sbnt7KQHz/Ek4rO6Rq2dgQVNUzjWumP13BA
   W8/srcYgK3TpBv07TfI+TJNbkJHpAxQM5LDUVcpXGzHjNU+iYOyY/5SFa
   b8CKe/doq6f0Vi7LNFqzlR5kVyj7VIaweK9UJ9zPkbiW3KAceIlShpMA6
   w==;
X-CSE-ConnectionGUID: pXEGA7tRS2Gjei5aqo8JOw==
X-CSE-MsgGUID: EcZOgptUTYeFIav9Mh52gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51030486"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51030486"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 12:46:22 -0700
X-CSE-ConnectionGUID: GF3Iq3VDQL237foZcoDxEw==
X-CSE-MsgGUID: E3elG5xfQ0eI6aSPXrhLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150555313"
Received: from puneetse-mobl.amr.corp.intel.com (HELO [10.125.110.229]) ([10.125.110.229])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 12:46:22 -0700
Message-ID: <55e5b3f8-3e17-4962-af2f-75c98ccd414f@intel.com>
Date: Wed, 4 Jun 2025 12:46:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
To: Kai Huang <kai.huang@intel.com>, peterz@infradead.org,
 tglx@linutronix.de, bp@alien8.de, mingo@redhat.com, hpa@zytor.com,
 kirill.shutemov@linux.intel.com
Cc: rick.p.edgecombe@intel.com, x86@kernel.org, samitolvanen@google.com,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
References: <20250604003848.13154-1-kai.huang@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <20250604003848.13154-1-kai.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 17:38, Kai Huang wrote:
> Build warnings about missing ENDBR around making SEAMCALLs[*] were
> observed when using some randconfig[1] to build today's Linus's tree.

What actually caused it? CONFIG_CC_OPTIMIZE_FOR_SIZE?

> In the C code, the low level SEAMCALL assembly functions (__seamcall(),
> __seamcall_ret() and __seamcall_saved_ret()) are indirectly called via
> the common sc_retry() function:
> 
>     static inline u64 sc_retry(sc_func_t func, u64 fn,
> 		    	       struct tdx_module_args *args)
>     { ... }
> 
>     #define seamcall(_fn, _args) sc_retry(__seamcall, (_fn), (_args))
> 
> It turns out compilers may not always be smart enough to figure out how
> to call those assembly functions directly.

So, reading this, it didn't quite click into my brain that you were
referring to "direct call" and "indirect call" *instructions*.

I think I probably would have talked about "function pointers" because
that's what you do in C. A function pointer mostly means an indirect
call. But not always, like was intended here.

> The disassembly of the vmlinux built from the aforementioned config
> confirms that __seamcall*() are indirectly called:
> 
>     <sc_retry>:
> 			       ......
> 
>        4c 89 ee                mov    %r13,%rsi
>        4c 89 e7                mov    %r12,%rdi
>        e8 35 8c 7d 01          call   ffffffff82b3e220 <__pi___x86_indirect_thunk_rbp>
>        4c 39 f0                cmp    %r14,%rax
> 
> In this case ENDBR is needed at the beginning of __seamcall*().
> 
> Change SYM_FUNC_START() to SYM_TYPED_FUNC_START() for __seamcall*() to
> add ENDBR to them.

... and why is this? How do we know this is the correct fix? Show your
work, please.

> When the compiler can generate direct call for __seamcall*(), the
> additional ENDBR is safe since it has no impact to directly called
> functions.

Right. Direct calls are always OK. Indirect call targets need to be
handled specially.

> When kernel IBT was added to the kernel, initially the SYM_FUNC_START()
> had the ENDBR added in commit
> 
>   c4691712b546 ("x86/linkage: Add ENDBR to SYM_FUNC_START*()")
> 
> However when the commit
> 
>   582077c94052 ("x86/cfi: Clean up linkage")
> 
> removed the ENDBR from the SYM_FUNC_START() and added it to the
> SYM_TYPED_FUNC_START(), it didn't touch the SEAMCALL assembly.

I'm not sure why we need the history lesson here.

> [*] Aforementioned build warning:
> 
> vmlinux.o: warning: objtool: try_init_module_global+0x5d: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: read_sys_metadata_field+0x4a: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: do_global_key_config+0x36: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_phymem_page_reclaim+0x71: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_phymem_cache_wb+0x41: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_phymem_page_wbinvd_tdr+0x95: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdx_cpu_enable+0x7b: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: init_tdmr+0x59: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: config_tdx_module.constprop.0+0x19d: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_vp_addcx+0x91: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_vp_init+0x76: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_vp_wr+0x87: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_vp_rd+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_vp_flush+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_vp_create+0x85: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mng_create+0x73: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mem_page_aug+0xb4: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mem_sept_add+0xb4: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mem_page_add+0xce: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mng_addcx+0x91: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mem_page_remove+0x7e: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mem_track+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mng_init+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mng_key_freeid+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mng_vpflushdone+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mr_finalize+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mr_extend+0x77: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mng_rd+0x6d: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_mng_key_config+0x4c: relocation to !ENDBR: __seamcall+0x0
> vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to !ENDBR: __seamcall_ret+0x0
> vmlinux.o: warning: objtool: tdh_phymem_page_wbinvd_hkid+0x7d: relocation to !ENDBR: __seamcall+0x0

One or two of those would have sufficed...

> diff --git a/arch/x86/virt/vmx/tdx/seamcall.S b/arch/x86/virt/vmx/tdx/seamcall.S
> index 6854c52c374b..637226ae935d 100644
> --- a/arch/x86/virt/vmx/tdx/seamcall.S
> +++ b/arch/x86/virt/vmx/tdx/seamcall.S
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #include <linux/linkage.h>
> +#include <linux/cfi_types.h>
>  #include <asm/frame.h>
>  
>  #include "tdxcall.S"
> @@ -18,7 +19,7 @@
>   * Return (via RAX) TDX_SEAMCALL_VMFAILINVALID if the SEAMCALL itself
>   * fails, or the completion status of the SEAMCALL leaf function.
>   */
> -SYM_FUNC_START(__seamcall)
> +SYM_TYPED_FUNC_START(__seamcall)
>  	TDX_MODULE_CALL host=1
>  SYM_FUNC_END(__seamcall)
Personally, I'd add a _bit_ to these comments to mention that these
functions can be called via an indirect call.

Circling back around now that I've divined out what is happening here...
Is this even really about ENDBR at all? I thought that clang has some
CFI checking that's completely independent from CET/IBT and thus ENDBR.
Wouldn't this also break with that?

At the risk of giving a man a fish... Isn't this a much more coherent
changelog at about 1/4 the size?

--

Subject: x86/virt/tdx: Annotate TDX assembly to allow indirect calls

A TDX helper function (sc_retry()) passes around function pointers to
assembly functions. Normally, the compiler realizes that the function
pointer targets are completely static, can be resolved at compile time,
and generates direct call instructions.

But, other times (like when CONFIG_CC_OPTIMIZE_FOR_SIZE=y), the compiler
will instead generate indirect call instructions.

Indirect calls to assembly functions require special annotation so that
both hardware and software implementations of Control Flow Integrity
mechanisms can work correctly.

The TDX functions are declared as if they are only called directly (via
SYM_FUNC_START). Move them over to another macro (SYM_TYPED_FUNC_START)
which will annotate them as being called indirectly (see
include/linux/cfi_types.h).

This was found through randconfig testing, presumably setting
CONFIG_CC_OPTIMIZE_FOR_SIZE=1 when objtool spewed a bunch of these:

vmlinux.o: warning: objtool: tdh_mem_range_block+0x7e: relocation to
!ENDBR: __seamcall_ret+0x0


