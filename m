Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE881E505
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633704; cv=none; b=RH91OmZvjMOijsLZyfmfHyRjcOxWLfQAvMpIc2wj3Ork5g1D7TKzbpm+j4nJSyaxX6J3jKcn89Zf1r5sjWNWQSHu8rAX1ngnOa3aj9UcfrPtGv7AdYlr4YmoQ7GO9Xty85JIyoC5WdDeA5EHfUKDDogW0jGAPl/TX2wZMh99xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633704; c=relaxed/simple;
	bh=ixX+aTSMxs21n/o59hXTar0t+IatGCpyamxq2gI482w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5wHiTgwhls/zC1DU/zrdh8xDuq4gqpkiUdyX4dnKT5MmoMJwbLFIVOKyUTR0bF0xhUD6pIS/DZetugVnvVYyl0JPgQbWJX/JzMEeMqePf1tGXk43QCITHM/womQ0TOfUhwS/+jj5sSfCNcl2sigYwDGn5RkPp5Hz38wBQUd/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYnvjh6Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYnvjh6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA715C4CEEB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744633703;
	bh=ixX+aTSMxs21n/o59hXTar0t+IatGCpyamxq2gI482w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TYnvjh6ZJJh9llFKwpdi2rKgaw/aYoo/5OTh8b2NPrW4idCos5cdlcW6JKzc6gVkK
	 GD6Kj0Jsu8JgDDZw399RmmKxlbPqVW5x3QyZ89JPIKCHueDRjPG7n0AUWtXk85FqBU
	 CKhI3RZg1+Ugqlv86MFOU3Rcd+IZuWWtA5+sR8ld9tamF0FNWyAssny1J+653Lat6F
	 s8soQWMXqWpNn8mV6CahGrV01EWubZy4mTyyvB2fr6aPO8Nwsk6Bwc7unU/1bHhOYu
	 88O3uOWfjRhk2YgSJcAZfm2XIJ6TfumCAAUqnX4eG9QbtC3+Y6n1GkkFs1d9MyZWkS
	 63wQQH8UvzORw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499c5d9691so4536153e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhT3VFhEZPL5AsCKcOIjfPKaUBQAgL6CDG7x1tWTUuQ3TX3b89uqHXPi0JYCl+aiDSBDlF5CPd32RttrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5l+zKLdaqE/3jZ/j0h3oPOfqRrW2bqdTMe3/nJDEH6CpHRL4
	gd65IHTkOviPVDRFR1OhO5+YgpW4RmPx7Cn5F92O2v3PfQ76FxTsCxYEGBqC1ge34UTi+j/79fn
	tvxWTN9hpon4Xg0kFS64L2hN867A=
X-Google-Smtp-Source: AGHT+IFzhIt2ejuDXn9Okk3Y8KB1rg/VBUn0uGKtytenAj+wyPYEIJ32ztqV+LpBKmoYT2VlQX5UZH28uiPnUCd19IA=
X-Received: by 2002:a05:6512:1310:b0:54a:cc11:a94c with SMTP id
 2adb3069b0e04-54d4528e98bmr4369914e87.3.1744633702098; Mon, 14 Apr 2025
 05:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com> <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
 <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
In-Reply-To: <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 14:28:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
X-Gm-Features: ATxdqUGG3syj4r4Drcn8JQR1d7j0A7RWn7_D18-LehW_FREU0x2VqOAPU1pcR_k
Message-ID: <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 14:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 14/04/2025 10:41, Ard Biesheuvel wrote:
> > On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 10/04/2025 08:40, Anshuman Khandual wrote:
> >>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> >>> as expected if those macro constants contain some 128 bit layout elements,
> >>> required for D128 page tables. Fix this problem via first loading up these
> >>> macro constants into a given memory location and then subsequently setting
> >>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
> >>
> >> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
> >> of 128-bit types with shifting and masking, which the assembler can't do? It
> >> would be good to spell this out.
> >>
> >>>
> >>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >>> Cc: Will Deacon <will@kernel.org>
> >>> Cc: Mark Rutland <mark.rutland@arm.com>
> >>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >>> ---
> >>> This patch applies on v6.15-rc1
> >>>
> >>>  arch/arm64/kernel/head.S         | 3 +++
> >>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
> >>>  arch/arm64/kernel/pi/pi.h        | 1 +
> >>>  arch/arm64/mm/mmu.c              | 1 +
> >>>  arch/arm64/mm/proc.S             | 5 +++--
> >>>  5 files changed, 14 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> >>> index 2ce73525de2c..4950d9cc638a 100644
> >>> --- a/arch/arm64/kernel/head.S
> >>> +++ b/arch/arm64/kernel/head.S
> >>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
> >>>        * On return, the CPU will be ready for the MMU to be turned on and
> >>>        * the TCR will have been set.
> >>>        */
> >>> +     adr_l   x0, pir_data
> >>> +     bl      __pi_load_pir_data
> >>
> >> Using C code to pre-calculate the values into global variables that the assembly
> >> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
> >> can instead pre-calculate into asm-offsets.h? e.g. add the following to
> >> asm-offsets.c:
> >>
> >> DEFINE(PIE_E0_ASM, PIE_E0);
> >> DEFINE(PIE_E1_ASM, PIE_E1);
> >>
> >> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
> >> pre-calculated values that you can then use in proc.S?
> >>
> >
> > There is another issue, which is that mov_q tries to be smart, and
> > emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
> > directive evaluates the argument, which does not work with symbolic
> > constants.
>
> I'm not quite understanding the detail here; what do you mean by "symbolic
> constants"? asm-offsets.h will provide something like:
>
> #define PIE_E0_ASM 1234567890
>
> The current code is using a hash-define and that's working fine:
>
> mov_q   x0, PIE_E0
>
>
> Won't the C preprocessor just substitute and everything will work out?
>

Yeah, you're right. I was experimenting with something like

.set .Lpie_e0, PIE_E0_ASM
mov_q xN, .Lpie_e0

where this problem does exist, but we can just use PIE_E0_ASM directly
and things should work as expected.
