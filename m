Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B5B27701C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657533; cv=none; b=qdNt0ZI8VID/OYZNueUPM7jQauDDcPDgEBwfk11CHNGxYFzmq/hSgV2X7WHwV82aiF787Y1tESmsyyqHM0bjN7GQtCfTWz/2EgVPRNLs1Uy6Wk8m42+K45GS0YuHCPg5xwFST4q5L7ZjX5z0nEd0GfexIf/L5siFYtlMyzRLKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657533; c=relaxed/simple;
	bh=JZNe0HfZZDhNevSX49ax+j+R7pQymrwQi3kwBBaLzPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9GGeuDDUmuYFrlwJX2F29o2h7owYomrcZQdN1PRDKzyX9KJBCrVzkAiIlF1LUhgdDQjQmeOTSXR29IOrDd1ds8HFVWzLR4nMZvEHUaDvJst5x2ML+3hAL2Asn8x/4g/fJn7TJlL5IWDyVxdzg9wruidIiKt8OLBDCgMDh+lNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a330Qgvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a330Qgvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BEBC4CEEF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747657532;
	bh=JZNe0HfZZDhNevSX49ax+j+R7pQymrwQi3kwBBaLzPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a330QgvvXD0eYbaw94XYPzpNsqvKDEQWdjCQKdCOq87dPz8i6T5kspluYcKawfGne
	 S1SGHr8dNRuhPi63Kr7GHvN0OR6Z2oYA43Tbj41HHaN84fJlygL4xfIlAVBBW9drM8
	 bt6xwlZRi4zhh5KVgC6FawTcnVGyZVQqUoAErxoFc3lgXHPMk8JTzm4MctqxdHugji
	 NWvcoPGFfXHfil3hFm5xHfNqwgZUiFG0eHQrajKldokEbymUWpXnpX6sqtUvLcTwyk
	 JXlFtRtMsGr7dxB2z7ZJ8Nyr0QXa9I3CVp1b/jv8gcId5h/va3Dw8EismSPcFhJqNH
	 N+u0dc4aQ8iJQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso42174041fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU488UXWgI40nZ4d0hBSPDQq/i581rEOMCvfs8O1lTl1veFwZWkzDSKCpPX0Rg9opnhf3iLjWtHhww0eBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWbT64mobXI0T+FJ6FsGa/5K9340TeTuMe6to7ygFJ1T7qgeG
	0YekCSDRhZph+DZ5QVOQpnFy2rPg1DbhB6k4yzqbDCeRtyh9V8JFdQJ+xEZo4NExGB0KFwAZJAq
	9tlHIAxsvnCyWIz2k4r4L1B+L3SPN4OA=
X-Google-Smtp-Source: AGHT+IGGSCRyT9Q6HZYrZXvjQtxF9MgfyYtqR4jy/sjA9LbIN4TF+3YDBWGHQInU0eaxb1ASpBupBn4kbv1+O8ww0p0=
X-Received: by 2002:a05:651c:e18:b0:30c:2590:124c with SMTP id
 38308e7fff4ca-328096b5d66mr32813311fa.11.1747657530639; Mon, 19 May 2025
 05:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local> <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>
 <20250519121541.GAaCsg7YZ3-HDYgiBu@fat_crate.local>
In-Reply-To: <20250519121541.GAaCsg7YZ3-HDYgiBu@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 19 May 2025 14:25:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEr0_hCp7GspR4YcQTuYCo19BRSnM5H_GVb8-z8Zrui=A@mail.gmail.com>
X-Gm-Features: AX0GCFvRvQV-wmClBYA6cUDml9yIx85K9O3bRF3xdTUen3DLlQbOvtNQkY5DNFU
Message-ID: <CAMj1kXEr0_hCp7GspR4YcQTuYCo19BRSnM5H_GVb8-z8Zrui=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 14:16, Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, May 19, 2025 at 11:46:34AM +0200, Ard Biesheuvel wrote:
> > That is what the old code does. It results in the flag transiently
> > being set and cleared again, which is what I am trying to avoid.
>
> Right, something like this clumsy thing ontop. It'll have to be macro-ized
> properly and we had macros for those somewhere - need to grep...
>
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 104944e93902..a6a1892a9215 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -704,7 +704,10 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
>  }
>
>  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> +__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long)) = {
> +       [X86_FEATURE_LA57 / 32] = BIT(X86_FEATURE_LA57 & 0x1f)
> +};
> +
>  __u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
>

Setting the bit in cpu_caps_cleared[] is the easy part. I'd lean
towards something like the below instead, though.

*However*, this will still result in the associated bit in
boot_cpu_data.x86_capability[] to get set and cleared again if the CPU
is LA57 capable but not running with 5 levels of paging. Any code that
evaluates pgtable_l5_enabled() in the meantime will get the wrong
value, which is why we have these KAsan false positives etc. The whole
point of these changes is that pgtable_l5_enabled() is guaranteed to
always produce the correct value.

We could modify the CPU capability detection code to take
cpu_caps_cleared[] into account whenever it sets any bits in
cpu_capability[], but that is going be a lot more intrusive in the
end. Using a fake capability that will only get set or cleared
explicitly much cleaner.

I still think avoiding a CPU capability altogether (and testing
CR4.LA57 directly combined with a ternary alternative) is the better
solution, but that was shot down by Linus on aesthetic grounds.


--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -67,9 +67,10 @@ SYM_CODE_START_NOALIGN(startup_64)
        mov     %cr4, %rax
        btl     $X86_CR4_LA57_BIT, %eax
        jnc     0f
        setup_force_cpu_cap X86_FEATURE_LA57
+       jmp     1f
+0:     setup_clear_cpu_cap X86_FEATURE_LA57
+1:

        /* Set up the stack for verify_cpu() */
        leaq    __top_init_kernel_stack(%rip), %rsp
