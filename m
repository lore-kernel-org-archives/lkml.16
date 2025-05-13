Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596762BEC3E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161471; cv=none; b=OqUO832/a8zVs9YoliRZrshO3+WS9Use+IeZ66M2OSIIaOK3n60PAUcSs1FuQMVmPCrUh73EKA6F6ymEZvAFHH7bSe2RaUKMz7XEe+e8pKFFQBCiwsy8gGKnuAvlrMgLT5//HhlxxvlqtZJyfqGU1mwyGSU4OidkqdevAQCcLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161471; c=relaxed/simple;
	bh=xhOHqDadl3LW0rWnNG5OpTsww3KZcJM8olOpNd4z33U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxEXjvrRmaKP0u1Wk+Xo9eQA7p4Xf/FO+3AJ3gGxzQMbNApEjQiHbe9Pf7JZZ8iIW3dKyweXclGR9xhyOL6Me086AiQNYWPC84Gg+j2EWOXte2IF2BxbMdxygwIahQLU7lFPAmCESgd266DTKZIjyEnjJzE+otQcd788jwovgVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6/D4Gp6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6/D4Gp6"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-326c1795b8bso1536811fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161467; x=1747766267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeFkK9Eb1frxHmzcBKXg/LNxOLVj07fypd7WIzfkFrs=;
        b=X6/D4Gp6PT+RXfX++qyc+JasuP0iNWT4pWG2pnlFQerFr7+H+5/bjGZACqeL6VWnUv
         citzhZeSA78jNmSYBs5VA8qZYs8cCxpEm0dZ6sYyanNXayqEeOwCpJTStUZaPTN3/fG2
         OOzIDGKmZ/Fc9ae+UYB/Qm30qBvhe/DnwQOgVlO3SpuLzjpu1yepw8hd3Bd05S++HIXI
         cgF8eoXEwwicGOOB3sGsCAlVMKo3YKL/QphGdE8IvA6J/tvXRR7fkFSZaoAiGCFtWr8K
         IgNsQ/8jMMcUgGonGDW7wmmwdhc8zTRCtJY0NcGrNTTx2ClNcgRoyS65XghAoksNEi4c
         8xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161467; x=1747766267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeFkK9Eb1frxHmzcBKXg/LNxOLVj07fypd7WIzfkFrs=;
        b=gNS9kIsEYV3CnlyM3RmT/D2EOug6OMomq7+PD9qhHXZAEaMiu7A51PS6KvwP3TrTvP
         oMLs5xzPbS8vXBhhkF44gl2IQXMg9CqIzU8xuaDonTPopCliSJW9XlPGzRqg/kZfAe7f
         /DH3zzL7Q20xuwWRlfihDcrIpDxt2YnBArVxxy1KpbmTxNtGA7sVfrlp9UK+Pb811hfA
         UAtAEMlri/S33MLgo3pM+JkJR//3W9q0Apo0mcB5wvsWaGskdDQV5BKHU9WJBairpccb
         4VUSbDwUvdTtTTeDU/ekT71eUU02lQo+qfp7jK9JyqC8nm/ecZajfB0nMbnMzqoYA0kZ
         b4vg==
X-Gm-Message-State: AOJu0Yz/51r7Xj8yR1SLgxfIXX0JNGKfmRqFkgUnePRTMTR026EHB22V
	YsGCeBHNGSMbt5uSq3UfQrVYL3ZVmHEGfi/UBCQtL7qTfSElTvgpV9s4iLfpd38jl9Wh1pN5tDE
	oHMFixVmgFO5s/mtPzChOIb568Q==
X-Gm-Gg: ASbGncvKaHJ789QZXRFpySpnWeNLSTGNg9CIasb45BnkCehlITSgh+7d8MF3gQgDs5z
	1to7XMiIrvQrc0bQLd7Ofeh86r9TXbkwJNWYVnRF0pWUrK5+H12W6Q+dOUJCmbNq2mKJgOsuuJz
	P8OxfIQJPlABS2PoSUpSGABCLMTbLs79SfgOwIZcgKZSQ6XPU=
X-Google-Smtp-Source: AGHT+IHHsBmgSBYDtrUmQ2OoZ3cvMzdG9GPuskCrDjC0QG07BR6411SP1mq2vdePc9FcLM73AI4XWg7a8pvJoV5c9DM=
X-Received: by 2002:a2e:be11:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-327e1344225mr18562901fa.14.1747161467089; Tue, 13 May 2025
 11:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-11-ardb+git@google.com>
In-Reply-To: <20250513111157.717727-11-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 13 May 2025 14:37:34 -0400
X-Gm-Features: AX0GCFvBcs9L-5ymRcZNgWLDAMnhqO4ZpgZqOJGbdv-v16Gx1T3QJHBGXC1AgsE
Message-ID: <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/6] x86/cpu: Allow caps to be set arbitrarily early
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 7:40=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> cpu_feature_enabled() uses a ternary alternative, where the late variant
> is based on code patching and the early variant accesses the capability
> field in boot_cpu_data directly.
>
> This allows cpu_feature_enabled() to be called quite early, but it still
> requires that the CPU feature detection code runs before being able to
> rely on the return value of cpu_feature_enabled().
>
> This is a problem for the implementation of pgtable_l5_enabled(), which
> is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> called extremely early. Currently, there is a hacky workaround where
> some source files that may execute before (but also after) CPU feature
> detection have a different version of pgtable_l5_enabled(), based on the
> USE_EARLY_PGTABLE_L5 preprocessor macro.
>
> Instead, let's make it possible to set CPU feature arbitrarily early, so
> that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> entering C code.
>
> This involves relying on static initialization of boot_cpu_data and the
> cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> .data. This ensures that they won't be cleared along with the rest of
> BSS.
>
> Note that forcing a capability involves setting it in both
> boot_cpu_data.x86_capability[] and cpu_caps_set[].
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/kernel/cpu/common.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index bbec5c4cd8ed..aaa6d9e51ef1 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_=
x86 *c)
>  }
>
>  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned lo=
ng));
> -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long))=
;
> +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(size=
of(unsigned long));
> +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(u=
nsigned long));

Is there any scenario where capabilities are changed after boot?  If
not, this could possibly be __ro_after_init.

>  #ifdef CONFIG_X86_32
>  /* The 32-bit entry code needs to find cpu_entry_area. */
> @@ -1628,9 +1628,6 @@ static void __init cpu_parse_early_param(void)
>   */
>  static void __init early_identify_cpu(struct cpuinfo_x86 *c)
>  {
> -       memset(&c->x86_capability, 0, sizeof(c->x86_capability));
> -       c->extended_cpuid_level =3D 0;
> -
>         if (!have_cpuid_p())
>                 identify_cpu_without_cpuid(c);
>
> @@ -1842,7 +1839,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
>         c->x86_virt_bits =3D 32;
>  #endif
>         c->x86_cache_alignment =3D c->x86_clflush_size;
> -       memset(&c->x86_capability, 0, sizeof(c->x86_capability));
> +       if (c !=3D &boot_cpu_data)
> +               memset(&c->x86_capability, 0, sizeof(c->x86_capability));

You can move the clearing of the capabilities to the caller
(identify_secondary_cpu()) instead.


Brian Gerst
