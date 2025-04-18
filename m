Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDA4268FF2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744959714; cv=none; b=tEngmyOA7O3AWdY+iVQ4R2yLOHauV6wakkGlkFgMCUFNz41SWGgm3SsMi45as6nOcKsixmp85bcsEYuh2lsM53ilWLZaaM1yQf8R9imiDLjz0VwUHN1pKojPE4fuNrB713svXiLtytUjSroVANAu0HnpqEK8ZSXxQwdJK5BeXIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744959714; c=relaxed/simple;
	bh=SbxhvwW/dI2cwkKwqXns6VqYn5IUb1s1Pg95tBOSVRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpEm/reHjBVlMAcZzWAkyo20esUwhSGgrSZmt5+lKkMtA0amoSfvg8HfkUK26OOOTAONfaI0w/ce4LrIf9J8aIWH1ij6uO0SaQMO2ogrw3bCgfMtvE6Q5kVh9y3Kni4BXF1dMUWs3rIlT2Qs1VS6VjVfh9/FmWKjo0dTYKb8Tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faTowbcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faTowbcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E74C4CEE2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744959714;
	bh=SbxhvwW/dI2cwkKwqXns6VqYn5IUb1s1Pg95tBOSVRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=faTowbcCXfekvtxTs5wDEv+FPToczT88KM1QepQ3DlFozwDJiz69/AT8bQircR1Am
	 P4TBruU9R32eJPYNSKRPiIq+DlvvsslSaGNzBwEc6yY2Vzg/FxGuHZrkEgJBvUQ/q7
	 LEapjdmD6u+I33rdbiE6KkWCePu3qLP0IxDxSHEm0Ag8AI/sYhafrzUwKcBq6CAqUM
	 RF0Bw2mYHFLU7OoEa7fVPOkD7inCjOYl8Ghhq3ctPHslYmHmJJoGJrGvr2SIH4M2lO
	 mvYdcF3z6k+YCH7reyHG2n2NaEVbM3sJSMxWrSV8g/brPfNTPW2i0PhJOOOns9MPs5
	 FcYuDU8c9yalA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so15344831fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGaITFqTJdJV6D37qs4zwR5jyaWY89r5LJaOkTjBQ5dopn4Ipet/GtXp8Rq4QaolJQWz33Oha4vah3zuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8hm4HxBKkeH3nDD0tmmZS6JIkMh0i9NA1edaLdN7EaMMOZYp
	oX0wuued7wa/OiH4WXWY0X28HBwK24GEWINiPORzunMg/zde9NmlOksoKYavozzonR2LDkuy5y7
	k8z1BQhVvLqVUg2AdDdMdTL21Bh4=
X-Google-Smtp-Source: AGHT+IGQK4ZLrqBwmxUgeBqAOhDO8nVJNTTnpza7A5c9ARC3B7hZoNQyqaunqOT+wxFz9n2VblnRB0s5lfrbFJxX5Vk=
X-Received: by 2002:a05:651c:510:b0:30b:c96a:74c with SMTP id
 38308e7fff4ca-310904b8523mr5819201fa.1.1744959712354; Fri, 18 Apr 2025
 00:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416035604.2717188-1-anshuman.khandual@arm.com>
In-Reply-To: <20250416035604.2717188-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 09:01:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGbJ4q1rchCbDp35rdWRyzuG-nZnQ2KgE46FtkPUg-+SQ@mail.gmail.com>
X-Gm-Features: ATxdqUFTI04jZnPSrI5f53pfqrNAWo1abGiP_x_hkRRGXb35DQgpl2R0nSQWmIE
Message-ID: <CAMj1kXGbJ4q1rchCbDp35rdWRyzuG-nZnQ2KgE46FtkPUg-+SQ@mail.gmail.com>
Subject: Re: [PATCH V2] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 05:56, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> that are required for D128 page tables. The primary issue is that for D128,
> PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
> which the assembler can't accommodate.
>
> Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
> based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.
>
> While here also move PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides into
> arch/arm64/kernel/asm-offsets.c to ensure PIRE0_EL1/PIR_EL1 are calculated
> in assembly without arm64_use_ng_mappings and lpa2_is_enabled() symbols
> being accessible. Also move the corresponding comment as well.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
>
> Changes in V2:
>
> - Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
> - Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
>   along with the corresponding comment as per Ard
>
> Changes in V1:
>
> https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/
>
>  arch/arm64/kernel/asm-offsets.c | 16 ++++++++++++++++
>  arch/arm64/mm/proc.S            | 19 ++-----------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
