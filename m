Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8C1A83E8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623718; cv=none; b=ZAsJ/SxZRN1V7EXljoWQCGSmEDOjRrDwwpLE1cld1BEFiMtrRbIT+RgmYh9GQvcQPnmrCyHVzZ8YQSmV/sqx8DXWOU07yJo59SAt2h9O9O/8dYZLh1jMrZtH1+JpermuDKgDawDTQdhRSog5KEjx3/AjwdeQcceZzJkJQ/OlO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623718; c=relaxed/simple;
	bh=GdQhefI5+oCSBALyDof/jblTMXYLvXJmYT0zE2k1BLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXOP04KYU97yZEoaY4l1ByS/MBd/KGS6msNmep5XsLOEFA6qzL5KrCfqqedKj6qK0pHBhut5rYXspR3SFWJ2f0M6TZg9lXnFxuY9BPkCSD8rupH6StkGpcztZv2OEvUZ3Q/Hf9IDuVP+RUq/kzaeZJxNg8aAIDEv+4zAOoZ3n3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf6SZC9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf6SZC9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B450C4CEE2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744623718;
	bh=GdQhefI5+oCSBALyDof/jblTMXYLvXJmYT0zE2k1BLM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uf6SZC9TBZJIB1PfcaUKoHI/7U+IvCovUWI+UctNMryk6NZ13YIF0KZ4yL8Mg8Obw
	 WSEl95JbEEADMp8JIT8y/9FJt86XsS4mSeirlTQbtHX9I0JI2blr4Xi2I7cq7rXnZr
	 hSbujWCRng92kvPyE/hBcfxC8vG3/i7TG0rEnXxSUsM34QS1+YQ7watYLTR2TaM9ja
	 CAPdlqhN3Dia0JmgWMe7iNDg+rkB29b++1kt2RyarIHD/8H2p9nTekEfF2ALk5THJ8
	 vnVb4/RwqC1Vf5sOfbGScLbsgz4A7XTmI6+R7P7qUe9ouE6gxwjNPCzFrSq2yIUIRo
	 G93mt0e7pdvSA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b1095625dso4401116e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:41:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLJ/tppyqNqzpTXPnlcIZ+JZKx0fjN2uz957WBdxAQ+rWyyNSyHyc6WA1zxnqkKvQkGw4IMXpEsydU1Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDIUnjvMLw5thcXj8VLKDl41WSKxqEgggXmijI93wYFthu+HA
	C4i8NOPE2G2XcS1vXl7UeOxx+wiyufum5p1NEaXio+hhnuTROFaZtS9ulZs8c2RsjjsCyxUBjq1
	AZrrnlvmNYLFBgwW4TUUcUMZo2Js=
X-Google-Smtp-Source: AGHT+IGN+2vl1e9n3k0ai4rr73RoRvHU15tFFhInBSxmBSENpQCtacFhAtCVM2nhqPHVvKR+Ig0uGsOvM7LzRyO2K+I=
X-Received: by 2002:a05:6512:eaa:b0:54a:cc03:693d with SMTP id
 2adb3069b0e04-54d45289cc5mr2765732e87.9.1744623716547; Mon, 14 Apr 2025
 02:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410074024.1545768-1-anshuman.khandual@arm.com> <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
In-Reply-To: <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 11:41:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
X-Gm-Features: ATxdqUG-h7FhdtKqi_-Pzig_Izf956mbmRP4wzK1BT0F8gINixEbIsmfTC8HPxc
Message-ID: <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 10/04/2025 08:40, Anshuman Khandual wrote:
> > mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> > as expected if those macro constants contain some 128 bit layout elements,
> > required for D128 page tables. Fix this problem via first loading up these
> > macro constants into a given memory location and then subsequently setting
> > up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>
> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
> of 128-bit types with shifting and masking, which the assembler can't do? It
> would be good to spell this out.
>
> >
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > This patch applies on v6.15-rc1
> >
> >  arch/arm64/kernel/head.S         | 3 +++
> >  arch/arm64/kernel/pi/map_range.c | 6 ++++++
> >  arch/arm64/kernel/pi/pi.h        | 1 +
> >  arch/arm64/mm/mmu.c              | 1 +
> >  arch/arm64/mm/proc.S             | 5 +++--
> >  5 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index 2ce73525de2c..4950d9cc638a 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
> >        * On return, the CPU will be ready for the MMU to be turned on and
> >        * the TCR will have been set.
> >        */
> > +     adr_l   x0, pir_data
> > +     bl      __pi_load_pir_data
>
> Using C code to pre-calculate the values into global variables that the assembly
> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
> can instead pre-calculate into asm-offsets.h? e.g. add the following to
> asm-offsets.c:
>
> DEFINE(PIE_E0_ASM, PIE_E0);
> DEFINE(PIE_E1_ASM, PIE_E1);
>
> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
> pre-calculated values that you can then use in proc.S?
>

There is another issue, which is that mov_q tries to be smart, and
emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
directive evaluates the argument, which does not work with symbolic
constants.

I wouldn't mind just dropping that, i.e.,

--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -545,17 +545,9 @@ alternative_endif
         *         magnitude and sign of the operand)
         */
        .macro  mov_q, reg, val
-       .if (((\val) >> 31) == 0 || ((\val) >> 31) == 0x1ffffffff)
-       movz    \reg, :abs_g1_s:\val
-       .else
-       .if (((\val) >> 47) == 0 || ((\val) >> 47) == 0x1ffff)
-       movz    \reg, :abs_g2_s:\val
-       .else
        movz    \reg, :abs_g3:\val
        movk    \reg, :abs_g2_nc:\val
-       .endif
        movk    \reg, :abs_g1_nc:\val
-       .endif
        movk    \reg, :abs_g0_nc:\val
        .endm

Then, we can apply Ryan's trick to move these constants into
asm-offsets.c, but you'll need to tweak the PTE_MAYBE macros as well:

--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -182,5 +182,22 @@ int main(void)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   DEFINE(FTRACE_OPS_DIRECT_CALL,       offsetof(struct ftrace_ops,
direct_call));
 #endif
+#undef PTE_MAYBE_NG
+#define PTE_MAYBE_NG           0
+
+#undef PTE_MAYBE_SHARED
+#define PTE_MAYBE_SHARED       0
+
+  DEFINE(PIE_E0_ASM, PIE_E0);
+  DEFINE(PIE_E1_ASM, PIE_E1);
   return 0;
 }

(We should also move the comment from proc.S to asm-offsets.c but I
omitted that here for brevity.)

Then you should be able to use PIE_En_ASM in mov_q instructions without issue.

Alternatively, if changing the implementation of mov_q creates any
problems, we can just add a variant of that macro that lacks the
conditional directives and always emits MOVZ/MOVK/MOVK/MOVK
