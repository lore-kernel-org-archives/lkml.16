Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8871AE00E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186169; cv=none; b=tiQMRo76bFmQ/HMKBGj0DxzlaVnNPy7ndJQDPkahnDFbOvZzqAGCldfSmG672APytX1O+AfFJEibCnREYxE7af1OFwBKA6A4TtN1pjHHD8iLWhd5+aFzt4ngvQ4GiRjOeeYKGR/wleB+dbQR2SHRivduWHa6GtN3atl0Em+gzoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186169; c=relaxed/simple;
	bh=AkEC99uo88xoZdBkphHswzqNaZ7b00UJ8ejtUX3Y6SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlMx59HskVcqIyUmyuImBLltFbx5K+B3cMcu0JDHDJ7tDhfqVMVFVMvHnEsFzLd2BRMmX0ppsi4R+KfAjEoXIVv9oCzrAMf2N/OewEwfIZIdZhroriWnQPZsUrIdKxgd5j/HPCy2zC60XWAD+ninqJoc7/SB+5qK4bQ67pS5lnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBIQYh2w; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBIQYh2w"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47190a013d4so191761cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739186166; x=1739790966; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aiaizxySKQv99eEb2pd6l3voLehByupE/uzXO/LATYo=;
        b=NBIQYh2waUjXbLRGwToNyU4uc9c0eKD3lkB4+7B9ssReDgM7SvWBlTjdTL7l4fAf6N
         fmE7cXhQLHcdU/5Bk2Glk4mbV7g8Ykq8Wt8Fcze5Av2ff4U6LIxFd97E8t92ye6UcSGh
         sRv02oGZ3r1EroGGtoA8blQC2F52057HQAMZcpOFKWvIs3zyUphYuy/MxI7X9g0X5R+V
         mMvoEKJhaoN29gHJDUhTYcZ1RF9u8ffOw5Ix5Ah46Tt5442l10lYZ0EascrWStDlhRsL
         y2rFEC7xd+Jm776NqJn1pUSE3kp9NHeCx5WkU5ZBMl0tUfKH07OeTeSHjZCDYq5jVpjX
         qwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186166; x=1739790966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiaizxySKQv99eEb2pd6l3voLehByupE/uzXO/LATYo=;
        b=kopG0MotuU/jMNuiFkoKT5FhJGVonQvhKrhtEks2+Xw6I/TmjNtqeQ2F5NWkaZuYSY
         XVRUuKl/6WtLI+c9eJDSYjEyLl5zEpYBdghNrG0RUBMXGYhCXgYejtJ5nQogUQum5ObP
         LbVJuKPkuSL14TezZdW1YgMbzdATK19Tw42eme/5Tm281g8VGlIxbLrRNpCElVMjFFE8
         6lD6wW/4YnEwMplZOwqxeYz/OODpHPxqsjV/ww3AelqRtx0IV98FHSt4Eglsav/gm6kw
         dfiMvRCgYPe+BWB6Ajspuwh6/6hIdhXlh3sD16cfM/v/XC3UEfqzSzATEscbug2lUyxO
         eCNw==
X-Forwarded-Encrypted: i=1; AJvYcCXDqjY8pSJYl/kLu1vFZq2/AKDGIDvVnfiYvXhmoQkwuoiHgAmhe3bFsK/UiC8TI64Fy8uw1cj3bIOGe/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LW0DyqA6EM9/9Y2Mch7tbXr6ByLSH+EJ8UZZaew4sLPBr5YE
	uIi1whYYeqvjfeCOaiErqSsuu5pNKVpN2N4fMQ1zZ/NU10vEBYVcGNhyN7Fbqw5KSjjQ6ltgiOi
	BoURqbMLKNtgLwoSVtv1d4uuZN1AAQbtYGS2r
X-Gm-Gg: ASbGnctWCAURbrYnhEZCCr3HT3Mk4I+R5CNTHbmDdaheA6j+I8ZnDCX7QhraWaMDfah
	ubkMQ3ysYoHMgKP9oL5J0xaFKuhCnbThqaAWdovKPoHkR7Nq1HYx8StG6v2tgNjhgkjTU8nGxBq
	2F07LzWnp7evho2AHTH9KOQ26RXoU=
X-Google-Smtp-Source: AGHT+IFuGLNJg10PJmFyoMKxrkIonv996LbUX7yfBM5xz7c59TtQ3nYDUZg66MCfuS/IvA1cbLhSC9h3m87uDT1cJ1M=
X-Received: by 2002:ac8:5b8d:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-47177e86974mr6092741cf.9.1739186166382; Mon, 10 Feb 2025
 03:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-4-riel@surriel.com>
 <CA+i-1C2+Pva55qPEHHS9vc83_vmGJaUzUTPmoE2M3_qvCpcsUQ@mail.gmail.com> <1edea8a714fd1df0734f7fe15bb690e4c3a556dc.camel@surriel.com>
In-Reply-To: <1edea8a714fd1df0734f7fe15bb690e4c3a556dc.camel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 12:15:55 +0100
X-Gm-Features: AWEUYZn3hWD36MO2gHjHYtpqDqJsgNmHP_6nAhOej5-G6whc4kZ0wQRZaGCn3mg
Message-ID: <CA+i-1C3kBZkwikfczSbu8H1T3EaDRref=LFgS_mSJYLQhmFn2g@mail.gmail.com>
Subject: Re: [PATCH v9 03/12] x86/mm: consolidate full flush threshold decision
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Dave Hansen <dave.hansen@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 21:25, Rik van Riel <riel@surriel.com> wrote:
>
> On Fri, 2025-02-07 at 15:50 +0100, Brendan Jackman wrote:
> > On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> > > @@ -1276,7 +1282,7 @@ void arch_tlbbatch_flush(struct
> > > arch_tlbflush_unmap_batch *batch)
> > >
> > >         int cpu = get_cpu();
> > >
> > > -       info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL, 0, false,
> > > +       info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL,
> > > PAGE_SHIFT, false,
> > >                                   TLB_GENERATION_INVALID);
> >
> > [Why] do we need this change? If it's necessary here, why isn't it
> > needed everywhere else that does TLB_FLUSH_ALL too, like
> > flush_tlb_mm()?
> >
> flush_tlb_mm() calls flush_tlb_mm_range(), which
> does also use get_flush_tlb_info().
>
> We pass in PAGE_SHIFT here to ensure that the
> stride shift is specified correctly to the
> INVLPGB instruction later on.

Hm I don't follow your answer here so lemme just state my current
understanding more verbosely...

flush_tlb_mm() indirectly calls get_flush_tlb_info() with
end=TLB_FLUSH_ALL and stride_shift=0. That's an invalid stride shift,
but this doesn't break anything because with TLB_FLUSH_ALL the stride
shift is never used (except to check for values above PMD_SHIFT).

So here I think passing stride_shift=0 would be fine too. Concretely,
here we specifically call invlpgb_flush_all_nonglobals() which doesn't
care about stride_shift, and flush_tlb_func() is the same as before
this patchset in this respect.

I would be quite happy with removing the "it's invalid but it doesn't
matter" thing everywhere but this seems to be localised and I think
the issue is orthogonal to the presence of invlpgb.
