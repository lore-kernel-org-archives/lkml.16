Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC22AD16
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303960; cv=none; b=QdnxIrKZ/6pwAdUD3CUG2xoRWYkSSQ6DSMuOzpbHf/OBi9CadnfoMyJpye3JgKxW04+XM5i1U46dNnR7o3sMYtHPH2bszzEEH1MaBG18FwxehZv1KEnkIIpdkzE4XDSGFbNTZIz1XN3r4JszN/fnDx51z1Sy/35aRFtn43yLhzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303960; c=relaxed/simple;
	bh=BFZkdsmJppXmE75cs9a4mPl/cbhmI9gq31qatmob1/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvLwCN7HbA97iqeUscPMr+5TN6RxS5aHOWGON94+IzkhrTSQeGj4vFa4T8XdNpsthrVtQtPEpwFa6YU34yeOFQiDFMId6z4cRqkFW7N9phJlS/xFutNU4o+GTetvkzd2ZTeWW6A2uQx69aKa9USOZmAYCOuy77JkdLV2VvEqsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX3VkTLu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX3VkTLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5DCC4AF09
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747303960;
	bh=BFZkdsmJppXmE75cs9a4mPl/cbhmI9gq31qatmob1/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SX3VkTLuaxLJVHMSC/homCkbusG/w3pGKzAaSm44kQeD5+a58QmwbfWDa65Txxyyf
	 rRaHjgUlceVDP/aMdopcH40yqk5Ye+1O+cutyyQR2x2lFi3PjqdZaeloZSzeV3/7Ey
	 pqPbnrNy0mSIk/qnZv0zeTCZPbZpkmPpU4PO7QqL6TeBrx+tE1xocxqNTYlmP5ZsQu
	 JY+NeYbrEj3vGtPiAGlSZGpQdj+1mTQZnrjBjZhf+3J8JhEL9s1H0NOm/r4jc/XFP9
	 IEZKTUKNApZGl0tH2ZokHw4vjfoT4JfETPnZaHqaoyW6eYqTNkHmflFLHNhNq0AhbU
	 NPqj87hLAskAQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-550d4b7a076so811801e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWawnyyFSoHDWYpMC9feFV5uj2o9vDC6uDB+FjitInDO+Ikb+1gEYv7p1VfdcE1RWrVL1Mboq1I7peF+OM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIYfB3hA/9DXQQhGeY4lgWVkHsu7KWq9Y0Qia/Ry2k2fv89mcN
	vVzrSUfd9RRMfivKZSjh+ONgGjDjGcvPVVv7VoGDdCAtIIpQuYgjVCN8vuUIZ32kkNlgmZfyM0S
	xnO5pVPtUgJT0BI05Wjslmfk9tXY=
X-Google-Smtp-Source: AGHT+IE61sdQo7GyUs9d8hghPr5Q4NMwrdM1n9d6VGbPwjR1N5v9LW27JqXPTIbeQjsuEtCyQ/XBowPgb6jQKLUuJN4=
X-Received: by 2002:a05:651c:1607:b0:310:82c6:5f28 with SMTP id
 38308e7fff4ca-327fabce18emr7007991fa.1.1747303958624; Thu, 15 May 2025
 03:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <aCWbsM1qaMsKNkMj@gmail.com>
In-Reply-To: <aCWbsM1qaMsKNkMj@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 11:12:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE7TwZU8_3N8xUGUV+XMxC6LcTMCAC0UKpr6i_Hwx=VfQ@mail.gmail.com>
X-Gm-Features: AX0GCFvZHf0pPhV0RvC7-zcQ20FcYjhVcTivAvkqpvsGmt2WFvAZMsGjiNNO68Y
Message-ID: <CAMj1kXE7TwZU8_3N8xUGUV+XMxC6LcTMCAC0UKpr6i_Hwx=VfQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 15 May 2025 at 08:45, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Currently, the LA57 CPU feature flag is taken to mean two different
> > things at once:
> > - whether the CPU implements the LA57 extension, and is therefore
> >   capable of supporting 5 level paging;
> > - whether 5 level paging is currently in use.
> >
> > This means the LA57 capability of the hardware is hidden when a LA57
> > capable CPU is forced to run with 4 levels of paging. It also means the
> > the ordinary CPU capability detection code will happily set the LA57
> > capability and it needs to be cleared explicitly afterwards to avoid
> > inconsistencies.
> >
> > Separate the two so that the CPU hardware capability can be identified
> > unambigously in all cases.
> >
> > To avoid breaking existing users that might assume that 5 level paging
> > is being used when the "la57" string is visible in /proc/cpuinfo,
> > repurpose that string to mean that 5-level paging is in use, and add a
> > new string la57_capable to indicate that the CPU feature is implemented
> > by the hardware.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/include/asm/cpufeatures.h               |  3 ++-
> >  arch/x86/include/asm/page_64.h                   |  2 +-
> >  arch/x86/include/asm/pgtable_64_types.h          |  2 +-
> >  arch/x86/kernel/cpu/common.c                     | 16 ++--------------
> >  arch/x86/kvm/x86.h                               |  4 ++--
> >  drivers/iommu/amd/init.c                         |  4 ++--
> >  drivers/iommu/intel/svm.c                        |  4 ++--
> >  tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
> >  8 files changed, 13 insertions(+), 24 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/=
cpufeatures.h
> > index f67a93fc9391..d59bee5907e7 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -395,7 +395,7 @@
> >  #define X86_FEATURE_AVX512_BITALG    (16*32+12) /* "avx512_bitalg" Sup=
port for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> >  #define X86_FEATURE_TME                      (16*32+13) /* "tme" Intel=
 Total Memory Encryption */
> >  #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* "avx512_vpopcntdq" =
POPCNT for vectors of DW/QW */
> > -#define X86_FEATURE_LA57             (16*32+16) /* "la57" 5-level page=
 tables */
> > +#define X86_FEATURE_LA57             (16*32+16) /* "la57_hw" 5-level p=
age tables */
> >  #define X86_FEATURE_RDPID            (16*32+22) /* "rdpid" RDPID instr=
uction */
> >  #define X86_FEATURE_BUS_LOCK_DETECT  (16*32+24) /* "bus_lock_detect" B=
us Lock detect */
> >  #define X86_FEATURE_CLDEMOTE         (16*32+25) /* "cldemote" CLDEMOTE=
 instruction */
> > @@ -483,6 +483,7 @@
> >  #define X86_FEATURE_PREFER_YMM               (21*32+ 8) /* Avoid ZMM r=
egisters due to downclocking */
> >  #define X86_FEATURE_APX                      (21*32+ 9) /* Advanced Pe=
rformance Extensions */
> >  #define X86_FEATURE_INDIRECT_THUNK_ITS       (21*32+10) /* Use thunk f=
or indirect branches in lower half of cacheline */
> > +#define X86_FEATURE_5LEVEL_PAGING    (21*32+11) /* "la57" Whether 5 le=
vels of page tables are in use */
>
> So there's a new complication here, KVM doesn't like the use of
> synthethic CPU flags, for understandable reasons:
>
>   inlined from =E2=80=98intel_pmu_set_msr=E2=80=99 at arch/x86/kvm/vmx/pm=
u_intel.c:369:7:
>   ...
>   ./arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro =E2=
=80=98BUILD_BUG_ON=E2=80=99
>     102 |         BUILD_BUG_ON(x86_leaf =3D=3D CPUID_LNX_5);
>         |         ^~~~~~~~~~~~
>
> (See x86-64 allmodconfig)
>
> Even though previously X86_FEATURE_LA57 was effectively a synthethic
> CPU flag (it got artificially turned off by the Linux kernel if 5-level
> paging was disabled) ...
>
> So I think the most straightforward solution would be to do the change
> below, and pass through LA57 flag if 5-level paging is enabled in the
> host kernel. This is similar to as if the firmware turned off LA57, and
> it doesn't bring in all the early-boot complications bare metal has. It
> should also match the previous behavior I think.
>
> Thoughts?
>
> Thanks,
>
>         Ingo
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
>
>  arch/x86/kvm/cpuid.c | 6 ++++++
>  arch/x86/kvm/x86.h   | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 571c906ffcbf..d951d71aea3b 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -1221,6 +1221,12 @@ void kvm_set_cpu_caps(void)
>                 kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
>                 kvm_cpu_cap_clear(X86_FEATURE_RDPID);
>         }
> +       /*
> +        * Clear the LA57 flag in the guest if the host kernel
> +        * does not have 5-level paging support:
> +        */
> +       if (kvm_cpu_cap_has(X86_FEATURE_LA57) && !pgtable_l5_enabled())
> +               kvm_cpu_cap_clear(X86_FEATURE_LA57);
>  }
>  EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
>
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index d2c093f17ae5..9dc32a409076 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -243,7 +243,7 @@ static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu =
*vcpu)
>
>  static inline u8 max_host_virt_addr_bits(void)
>  {
> -       return kvm_cpu_cap_has(X86_FEATURE_5LEVEL_PAGING) ? 57 : 48;
> +       return kvm_cpu_cap_has(X86_FEATURE_LA57) ? 57 : 48;

Based on the comment that documents is_noncanonical_address(), it
seems to me that this should be using cpu_has(X86_FEATURE_LA57) rather
than kvm_cpu_cap_has(X86_FEATURE_LA57). Whether the host actually runs
with 5-level paging should be irrelevant, it only matters whether it
is capable of doing so.

>  }
>
>  /*
> @@ -603,7 +603,7 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vcpu=
 *vcpu, unsigned long cr4)
>                 __reserved_bits |=3D X86_CR4_FSGSBASE;    \
>         if (!__cpu_has(__c, X86_FEATURE_PKU))           \
>                 __reserved_bits |=3D X86_CR4_PKE;         \
> -       if (!__cpu_has(__c, X86_FEATURE_5LEVEL_PAGING))          \
> +       if (!__cpu_has(__c, X86_FEATURE_LA57))          \
>                 __reserved_bits |=3D X86_CR4_LA57;        \

This could be

if (!__cpu_has(__c, X86_FEATURE_LA57) || !pgtable_l5_enabled())
    __reserved_bits |=3D X86_CR4_LA57;

>         if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
>                 __reserved_bits |=3D X86_CR4_UMIP;        \
