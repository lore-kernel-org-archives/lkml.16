Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5319FA93
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747351490; cv=none; b=V9qm+118+1/n73KZCVT9iuGzNX6n1q51YI8dJ32eexUL9xpwYg6nWt9zHERNqKCPmYzp8YGSBrRMYhHQl/RFTSZdRodFqqxmXkuZcuKIBw+dV6W4Tj5LCL2VvRyq/Rtg0SzZkdSnpgxaREIqWF7cv7jlh+IM/hnGpKZwSYJsaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747351490; c=relaxed/simple;
	bh=bo0i9DJzPwoz9vHenZ271ENQU1qEoNgYAYwtlJC2fMU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rU8w64PWWR1uImT3pDX7jVFiOc9dtC9Jm60RkIdLh1NwSBpArNYJ77E+apadgpWnMP2ST1ZTWBwXjznlO5mfPuQ8ibahpETxBgvDjAOM38OWjMQEH1sevgEEq3hRVthoKWUW6W9h2bls4ETuV2c5Agu3k4kmvUYhVOp9hnUw6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3mnw+S0Q; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3mnw+S0Q"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e810d6901so139924a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747351488; x=1747956288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZCFHkqA2i6j4/4pkJv4ewvTLD4n941MqORDvXHuiXI=;
        b=3mnw+S0QGdYSuzVTn0EmawEMgxhEwU0WgiE8RshqcOt7+kUec9+WX8ppP2ArkkgjDD
         j+BXXFZUv4BGmDoPQekO1rRfvQW9gaJoKcZP04tlg+B5AH60eGz/D4gBplVom6XSqWL7
         oIx+VoVnZfGOg2q0+XDFIraHmKhqvvKRQ03v5vWIuZiSi7498r2WmR/APoR6+OAICmnZ
         EqVoexA2RIuVQ16NrcDE7WJ8edEooRVa0jyI2zDmU+1P+kxjdM3t97S+jQHc9/AtjkmV
         QJoiggrDJ4BsAyMQk87aWLYyaeT8DxGFihqjhuqa6IOwJ+X3Tb1LPuGh1nsSN1zqldWj
         qqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747351488; x=1747956288;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZCFHkqA2i6j4/4pkJv4ewvTLD4n941MqORDvXHuiXI=;
        b=EWYw3wopNNSm0A8/QsfergEqVD+TeRv/Jvhon4xTQhi/w1ZqhRE7vDeEqmwQV/wdzx
         BbvTSGVEbu3RAwgqnwS/Tcn2+yDnEXu3MeSqCMwkcTz1tVoQ7wi+eDWBwXzZy1fHnkDk
         lSLCYARw2PJkdufeQ8+olfWO4AiiPqJQye3bsayj4j/QUCktupK51Q/5Pb99JaxwbEpP
         UfnxXyIbmHGHhPKuY7Q0fv2X/3M+3n2Gqld6DBO9j1IJQnh24+XpfLUEsIni4C+hyNHX
         YLlpoZuL8L44SVYxaHLOEHvnEh12rXJZi822re7sjdoCSf2mASvQMZy3s6r6Cz4J4auO
         Dobw==
X-Forwarded-Encrypted: i=1; AJvYcCXi7Hi4GUlAbLxujfsFc1XZyyvBtsSEWAVCa2Cet7ZXmrR0qKOGPhDqIx60WLKOTEy6HoIc3G+d8kgqabs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67+i+GbAypvDVF1zk3BC+QFYSxGaYtYJGChuiqPEA/3gq890R
	rK34WK4L+hgKQGMk+syipL3CbXAY9jPzEKH1GcYx2jWYdvkClvMXKAIWPIm/2mB5xjVTeITBAiR
	Yshbs9A==
X-Google-Smtp-Source: AGHT+IExh66Xq5gX7VZVcd+qzaRb0mfZ4BaVAav5g1nUlQWDbWl17c1j99CeTRAFS07mzycyq+PQE3XopPI=
X-Received: from pjbnt12.prod.google.com ([2002:a17:90b:248c:b0:30e:7f04:f467])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:305:5f28:2d5c
 with SMTP id 98e67ed59e1d1-30e7d558d26mr1533070a91.15.1747351488465; Thu, 15
 May 2025 16:24:48 -0700 (PDT)
Date: Thu, 15 May 2025 16:24:46 -0700
In-Reply-To: <CAMj1kXE7TwZU8_3N8xUGUV+XMxC6LcTMCAC0UKpr6i_Hwx=VfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <aCWbsM1qaMsKNkMj@gmail.com> <CAMj1kXE7TwZU8_3N8xUGUV+XMxC6LcTMCAC0UKpr6i_Hwx=VfQ@mail.gmail.com>
Message-ID: <aCZ3vvKFMcKcc3h-@google.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
From: Sean Christopherson <seanjc@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025, Ard Biesheuvel wrote:
> On Thu, 15 May 2025 at 08:45, Ingo Molnar <mingo@kernel.org> wrote:
> > > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/as=
m/cpufeatures.h
> > > index f67a93fc9391..d59bee5907e7 100644
> > > --- a/arch/x86/include/asm/cpufeatures.h
> > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > @@ -395,7 +395,7 @@
> > >  #define X86_FEATURE_AVX512_BITALG    (16*32+12) /* "avx512_bitalg" S=
upport for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> > >  #define X86_FEATURE_TME                      (16*32+13) /* "tme" Int=
el Total Memory Encryption */
> > >  #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* "avx512_vpopcntdq=
" POPCNT for vectors of DW/QW */
> > > -#define X86_FEATURE_LA57             (16*32+16) /* "la57" 5-level pa=
ge tables */
> > > +#define X86_FEATURE_LA57             (16*32+16) /* "la57_hw" 5-level=
 page tables */
> > >  #define X86_FEATURE_RDPID            (16*32+22) /* "rdpid" RDPID ins=
truction */
> > >  #define X86_FEATURE_BUS_LOCK_DETECT  (16*32+24) /* "bus_lock_detect"=
 Bus Lock detect */
> > >  #define X86_FEATURE_CLDEMOTE         (16*32+25) /* "cldemote" CLDEMO=
TE instruction */
> > > @@ -483,6 +483,7 @@
> > >  #define X86_FEATURE_PREFER_YMM               (21*32+ 8) /* Avoid ZMM=
 registers due to downclocking */
> > >  #define X86_FEATURE_APX                      (21*32+ 9) /* Advanced =
Performance Extensions */
> > >  #define X86_FEATURE_INDIRECT_THUNK_ITS       (21*32+10) /* Use thunk=
 for indirect branches in lower half of cacheline */
> > > +#define X86_FEATURE_5LEVEL_PAGING    (21*32+11) /* "la57" Whether 5 =
levels of page tables are in use */
> >
> > So there's a new complication here, KVM doesn't like the use of
> > synthethic CPU flags, for understandable reasons:
> >
> >   inlined from =E2=80=98intel_pmu_set_msr=E2=80=99 at arch/x86/kvm/vmx/=
pmu_intel.c:369:7:
> >   ...
> >   ./arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro =E2=
=80=98BUILD_BUG_ON=E2=80=99
> >     102 |         BUILD_BUG_ON(x86_leaf =3D=3D CPUID_LNX_5);
> >         |         ^~~~~~~~~~~~
> >
> > (See x86-64 allmodconfig)
> >
> > Even though previously X86_FEATURE_LA57 was effectively a synthethic
> > CPU flag (it got artificially turned off by the Linux kernel if 5-level
> > paging was disabled) ...

KVM doesn't care if the kernel clears CPUID feature flags.  In fact, KVM de=
pends
on it in many cases.  What KVM cares about is that the bit number matches C=
PUID
(hardware defined bit) for features that are exposed to guests.

> > So I think the most straightforward solution would be to do the change
> > below, and pass through LA57 flag if 5-level paging is enabled in the
> > host kernel. This is similar to as if the firmware turned off LA57, and
> > it doesn't bring in all the early-boot complications bare metal has. It
> > should also match the previous behavior I think.
> >
> > Thoughts?
> >
> > Thanks,
> >
> >         Ingo
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> >
> >  arch/x86/kvm/cpuid.c | 6 ++++++
> >  arch/x86/kvm/x86.h   | 4 ++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> > index 571c906ffcbf..d951d71aea3b 100644
> > --- a/arch/x86/kvm/cpuid.c
> > +++ b/arch/x86/kvm/cpuid.c
> > @@ -1221,6 +1221,12 @@ void kvm_set_cpu_caps(void)
> >                 kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
> >                 kvm_cpu_cap_clear(X86_FEATURE_RDPID);
> >         }
> > +       /*
> > +        * Clear the LA57 flag in the guest if the host kernel
> > +        * does not have 5-level paging support:

No, KVM very intentionally goes out of it's way to support LA57 in the gues=
t
irrespective of host kernel support.  I.e. KVM already looks at CPUID direc=
tly
and supports virtualizing LA57 if it's supported in hardware, the kernel's
feature flags are ignored (for LA57).

> > +        */
> > +       if (kvm_cpu_cap_has(X86_FEATURE_LA57) && !pgtable_l5_enabled())
> > +               kvm_cpu_cap_clear(X86_FEATURE_LA57);
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
> >
> > diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> > index d2c093f17ae5..9dc32a409076 100644
> > --- a/arch/x86/kvm/x86.h
> > +++ b/arch/x86/kvm/x86.h
> > @@ -243,7 +243,7 @@ static inline u8 vcpu_virt_addr_bits(struct kvm_vcp=
u *vcpu)
> >
> >  static inline u8 max_host_virt_addr_bits(void)
> >  {
> > -       return kvm_cpu_cap_has(X86_FEATURE_5LEVEL_PAGING) ? 57 : 48;
> > +       return kvm_cpu_cap_has(X86_FEATURE_LA57) ? 57 : 48;
>=20
> Based on the comment that documents is_noncanonical_address(), it
> seems to me that this should be using cpu_has(X86_FEATURE_LA57) rather
> than kvm_cpu_cap_has(X86_FEATURE_LA57). Whether the host actually runs
> with 5-level paging should be irrelevant, it only matters whether it
> is capable of doing so.

Ard's patches are completely wrong for KVM, and amusingly, completely unece=
ssary.

Simply drop all of the KVM changes, including the selftest change.  And if =
you
want to save yourselves some time in the future, use scripts/get_maintainer=
.pl.

> >  }
> >
> >  /*
> > @@ -603,7 +603,7 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vc=
pu *vcpu, unsigned long cr4)
> >                 __reserved_bits |=3D X86_CR4_FSGSBASE;    \
> >         if (!__cpu_has(__c, X86_FEATURE_PKU))           \
> >                 __reserved_bits |=3D X86_CR4_PKE;         \
> > -       if (!__cpu_has(__c, X86_FEATURE_5LEVEL_PAGING))          \
> > +       if (!__cpu_has(__c, X86_FEATURE_LA57))          \
> >                 __reserved_bits |=3D X86_CR4_LA57;        \
>=20
> This could be
>=20
> if (!__cpu_has(__c, X86_FEATURE_LA57) || !pgtable_l5_enabled())
>     __reserved_bits |=3D X86_CR4_LA57;

No, all of this is wrong.  __kvm_is_valid_cr4() is used check guest CR4 aga=
inst
KVM's supported set of features CPUID, and also to check guest CR4 against =
the
vCPU's supported set of features.

>=20
> >         if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
> >                 __reserved_bits |=3D X86_CR4_UMIP;        \
