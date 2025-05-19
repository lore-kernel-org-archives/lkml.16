Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FF26F476
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648008; cv=none; b=B3qidFE0t00CMaBnZd5IODS2UfxO5RJOvDeWF0K7S1xf6ptzuBNt1OEvaK31CA2zemDMv9aLM/6VQ0Lbf4Rqr0xWvJ1HDkZ1QLjiMSXQnJWbqWlR++NPbtrmlY4xK7gzRDjg5KNQM+IohLIGnp0RAqrOpyzkY1+wpabLDx4OI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648008; c=relaxed/simple;
	bh=0u8ogeRxRSDh3NFo8oyAdKpDEInEANCluWNSHrLUU+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhtSBUrYuIxrJOj6NgqAsT1iYsrgDQtwB5+tXfaLptOR8aE/S4tfwcmhqPcAqLqNnAnP1e5Q7V+YHlWIgmgqrdkWvCQXCEdrT5GMK8/UtgHOb2Y4ZhebqGRmqFfSG9VFQUu4g/UmDSDewav/Q7Dm9BK9XVQAenfjFn2C1atVcb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaVBUBEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaVBUBEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB53C4CEF1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648007;
	bh=0u8ogeRxRSDh3NFo8oyAdKpDEInEANCluWNSHrLUU+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TaVBUBEbMJLC5ggbHQ/b+OpW6Vk9XR9LaONrmlb0scO4xil29MEvb0MATsXeiPRVC
	 9z7LiqG5OgC7VA/n+NbjoegbXZ93oAdWQwWt4yLSyp5FWdneGo9FMf+5U/wX4l3Ft9
	 omw2dOVBuHaBgUcMcvxvetKrBV1n7mZB1JyR4PlrHIjqK1jzGynHkHRAL3t/aGTvMW
	 G/Jh5Vcd25zNP+Qj4GrHB4tWr6phYaKlX06KaAQ9R4jx0f/Mj6p0mG4SGD0NjyvZYQ
	 kZ6MrtyixFEhVBEirKmHrHrtO503CGlPJraMxUHH9IcpI3lTxOcDZK1zDLp2dYAQOk
	 EeYVFhvtMzQCw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551f00720cfso1231792e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPaErsG/PSwEzBG3sfafoF3/Zoja/CRqVB9WXrfFOdfhddASe6J2Bpo8NLdVK/oyt6aWk/ONTZxXTAHvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJqhiX5ybH1yqg8Yz3HrlIGTHGJk9s/UmFTPzQeZEx6kzxZVY
	2/GQlk+qSAKYQPPpAOfMxQy7K2630uSONTmDm9qn02fZPEMXg2BvstJ3vOW3vc1u3vxcZlosTag
	YcS6gvwV0Ex0OsHN/H9glDndHaEV0Yco=
X-Google-Smtp-Source: AGHT+IEsfrxMJlY8VR6uLHRe4StJlVBbD8J6F7QXEZaujsRBClRAYH/6jw92RYcwzZSn/j/izpTLLmzfKIaDd4CyfMw=
X-Received: by 2002:a05:6512:6614:b0:550:e608:410b with SMTP id
 2adb3069b0e04-550e71e9968mr2978430e87.33.1747648006115; Mon, 19 May 2025
 02:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
In-Reply-To: <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 19 May 2025 11:46:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>
X-Gm-Features: AX0GCFskD-h72YKL6c-zBWjPPNbm_KArgeLXtMYA3tsluGmXjpiBUBZLg452Pjc
Message-ID: <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 11:41, Borislav Petkov <bp@alien8.de> wrote:
>
> On Sat, May 17, 2025 at 11:16:41AM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index f67a93fc9391..5c19bee0af11 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -395,7 +395,7 @@
> >  #define X86_FEATURE_AVX512_BITALG    (16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> >  #define X86_FEATURE_TME                      (16*32+13) /* "tme" Intel Total Memory Encryption */
> >  #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> > -#define X86_FEATURE_LA57             (16*32+16) /* "la57" 5-level page tables */
> > +#define X86_FEATURE_LA57             (16*32+16) /* 57-bit linear addressing */
> >  #define X86_FEATURE_RDPID            (16*32+22) /* "rdpid" RDPID instruction */
> >  #define X86_FEATURE_BUS_LOCK_DETECT  (16*32+24) /* "bus_lock_detect" Bus Lock detect */
> >  #define X86_FEATURE_CLDEMOTE         (16*32+25) /* "cldemote" CLDEMOTE instruction */
> > @@ -483,6 +483,7 @@
> >  #define X86_FEATURE_PREFER_YMM               (21*32+ 8) /* Avoid ZMM registers due to downclocking */
> >  #define X86_FEATURE_APX                      (21*32+ 9) /* Advanced Performance Extensions */
> >  #define X86_FEATURE_INDIRECT_THUNK_ITS       (21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> > +#define X86_FEATURE_5LEVEL_PAGING    (21*32+11) /* "la57" Whether 5 levels of page tables are in use */
>
> I don't think we need this second flag - you can simply clear the existing
> one.

That is what the old code does. It results in the flag transiently
being set and cleared again, which is what I am trying to avoid.

> Diff ontop below:
>

How is that not just a revert?
