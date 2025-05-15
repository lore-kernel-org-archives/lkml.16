Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FD4B1E5A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295157; cv=none; b=EZJ5fzHa33qVxBPnnyxlYRZgj0aF8H6bLVmrNYKNaI0jOdzjWylmD7ITfeaOEDbnWQNqZgxCLtrEyRNgGelHrBT3mfIPe4yz3OT4fjqOjjqvM7uriA65UKg3ZQBunouCbZH/gYdJRBWKSoYoqVIzqM0xpyPHluJHttK8NetM59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295157; c=relaxed/simple;
	bh=RU53/Z1F+B+WEi8f7Ubcx4/pZKWYgwxZ+EqnCJDGVaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXZ3TbSoof4O+xDa37uRDQQ+sRPK4Ph2ib9z/7oQjD5Rgi+Czj9AIrSB2uaZ/grGZFrjGsTaH3HUIkb+ttFR9LYZlNU4N3uDccf4HL6/lC89W84aFn5x0AtwpixBJlj9VbTYUZBih0VqkjjcdRWYjlIreMsLWnc7DcwXF91S++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aof8px4M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aof8px4M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AA3C4CEE7;
	Thu, 15 May 2025 07:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747295156;
	bh=RU53/Z1F+B+WEi8f7Ubcx4/pZKWYgwxZ+EqnCJDGVaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aof8px4MKaKWrEFkiHNS3Pbb2MSDHdKdy/J7KhEnb64VXkJeyBS4TPZ29rOArt5OJ
	 3UoHpsmNRhnGC6WHrc72mjkqBFgbq0WgLuK2Ts4rWj0fM0zqlj7dQ6rQgg2a+uMIAh
	 JPc/G8TvWh6ZOpIeJUmJrR7V5wFmI6rxC+sTMGDd5Dr4jJ94KRcLx8EnVUbeGxLADN
	 L60DOrFRuJ89hObmTCzwFUeGC/z72XvgF7AowMCbhkLoWOlofxLzbGGiGo5b2jkOz8
	 mH8dWJHxsJ1KcjAltzT9gWrJYtxtKxgZ+DEGmKGyto9wZyNgF/glnTB4FtR1EaR21x
	 nVgy1dgl3QGYA==
Date: Thu, 15 May 2025 09:45:52 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <aCWbsM1qaMsKNkMj@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514104242.1275040-10-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the LA57 CPU feature flag is taken to mean two different
> things at once:
> - whether the CPU implements the LA57 extension, and is therefore
>   capable of supporting 5 level paging;
> - whether 5 level paging is currently in use.
> 
> This means the LA57 capability of the hardware is hidden when a LA57
> capable CPU is forced to run with 4 levels of paging. It also means the
> the ordinary CPU capability detection code will happily set the LA57
> capability and it needs to be cleared explicitly afterwards to avoid
> inconsistencies.
> 
> Separate the two so that the CPU hardware capability can be identified
> unambigously in all cases.
> 
> To avoid breaking existing users that might assume that 5 level paging
> is being used when the "la57" string is visible in /proc/cpuinfo,
> repurpose that string to mean that 5-level paging is in use, and add a
> new string la57_capable to indicate that the CPU feature is implemented
> by the hardware.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/include/asm/cpufeatures.h               |  3 ++-
>  arch/x86/include/asm/page_64.h                   |  2 +-
>  arch/x86/include/asm/pgtable_64_types.h          |  2 +-
>  arch/x86/kernel/cpu/common.c                     | 16 ++--------------
>  arch/x86/kvm/x86.h                               |  4 ++--
>  drivers/iommu/amd/init.c                         |  4 ++--
>  drivers/iommu/intel/svm.c                        |  4 ++--
>  tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
>  8 files changed, 13 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index f67a93fc9391..d59bee5907e7 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -395,7 +395,7 @@
>  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
>  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
>  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> +#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */
>  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
>  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
>  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> @@ -483,6 +483,7 @@
>  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
>  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
>  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */

So there's a new complication here, KVM doesn't like the use of 
synthethic CPU flags, for understandable reasons:

  inlined from ‘intel_pmu_set_msr’ at arch/x86/kvm/vmx/pmu_intel.c:369:7:
  ...
  ./arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro ‘BUILD_BUG_ON’
    102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
        |         ^~~~~~~~~~~~

(See x86-64 allmodconfig)

Even though previously X86_FEATURE_LA57 was effectively a synthethic 
CPU flag (it got artificially turned off by the Linux kernel if 5-level 
paging was disabled) ...

So I think the most straightforward solution would be to do the change 
below, and pass through LA57 flag if 5-level paging is enabled in the 
host kernel. This is similar to as if the firmware turned off LA57, and 
it doesn't bring in all the early-boot complications bare metal has. It 
should also match the previous behavior I think.

Thoughts?

Thanks,

	Ingo

=================>

 arch/x86/kvm/cpuid.c | 6 ++++++
 arch/x86/kvm/x86.h   | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 571c906ffcbf..d951d71aea3b 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1221,6 +1221,12 @@ void kvm_set_cpu_caps(void)
 		kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
 		kvm_cpu_cap_clear(X86_FEATURE_RDPID);
 	}
+	/*
+	 * Clear the LA57 flag in the guest if the host kernel
+	 * does not have 5-level paging support:
+	 */
+	if (kvm_cpu_cap_has(X86_FEATURE_LA57) && !pgtable_l5_enabled())
+		kvm_cpu_cap_clear(X86_FEATURE_LA57);
 }
 EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
 
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index d2c093f17ae5..9dc32a409076 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -243,7 +243,7 @@ static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu *vcpu)
 
 static inline u8 max_host_virt_addr_bits(void)
 {
-	return kvm_cpu_cap_has(X86_FEATURE_5LEVEL_PAGING) ? 57 : 48;
+	return kvm_cpu_cap_has(X86_FEATURE_LA57) ? 57 : 48;
 }
 
 /*
@@ -603,7 +603,7 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 		__reserved_bits |= X86_CR4_FSGSBASE;    \
 	if (!__cpu_has(__c, X86_FEATURE_PKU))           \
 		__reserved_bits |= X86_CR4_PKE;         \
-	if (!__cpu_has(__c, X86_FEATURE_5LEVEL_PAGING))          \
+	if (!__cpu_has(__c, X86_FEATURE_LA57))          \
 		__reserved_bits |= X86_CR4_LA57;        \
 	if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
 		__reserved_bits |= X86_CR4_UMIP;        \
