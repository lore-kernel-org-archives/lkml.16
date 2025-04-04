Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9020A5E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785538; cv=none; b=KromiD4wBv9ztczq74Xy6gVqKvzHb5heA7DEmTZa7ZMam6QCQpnCmU+6fmZiLrLur7llDPP3udlvz1WHoAF5OAuPjNXlslPTVweGbjRMZK81ceiehjjrVGkwUf8wz/JU74dFn6q4mZX1gHRXAhpopWOXjZ1Ct8v1NCvSfMije8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785538; c=relaxed/simple;
	bh=XZ4p3dyMPjI8KzdK6UZBzSYUinH6HrPMC954K8FV8Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuffCv96IP9jfW757/XotYYBkpkJD3LtYhnaGVX4XC5wd31Xn3Ol+c82nSTSjhRHnL0x9Yw3q9Wl/NvAFw2qL7pvTLO1i3UK7XEMxtDk8oZV2ItbYAlraHLby3l/pBKf4FayUN7vSGviBkGhgxlwDiio2L0wkhSUIPgMffuFcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FiKG21Ig; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FiKG21Ig"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so3221575a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743785533; x=1744390333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcaHckNUalgvuK38rDNnG2eFvol8+c/qkWl70UacdGo=;
        b=FiKG21IgUoWEvwZAIqBYgRlOFYS9N9dgEC1Oo1rboFVXq664hXPHhskHEnIWmnpFf+
         PYcFGlYKfbSrrKdjfc043MOgl8YdX307FHo2NSjUyS05ivH0ITIzF20ZzldWMYKaDSuu
         OMOiRNeXQq3Gai1lIys+57piEGRBt4X6JM1BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785533; x=1744390333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcaHckNUalgvuK38rDNnG2eFvol8+c/qkWl70UacdGo=;
        b=SydBCNJnvgtG1umjsgIAhJht0sIkAPbDaVkgFukBHADA2TaJUrQvI97mX3ADlTIOmV
         /3NtxbhHysP66vBZ1em2FcFnu+peUAefx2dqclMqcFMZ+FnNamTcjjZsVdWTgD9LjeFS
         aaGj7pxpK7RkNQfuwHlvjdZ8drIsnghOiVpAWXt5M0SnbgnjragiRUMsFAI5k8fCbaXk
         K0gKJ+N/xkXfq4SQ8gT9ibTZ5MJPAi8d4tfceoQd5MPmutKi9u9OpmNE1diuhdKLYklL
         8y1PdSUZU7tsFoWa2wXYUlSYcLfZA1BZfNd5IG4hpUCseYNSg2qZBnCtddoM0+DGCnYG
         RT0A==
X-Forwarded-Encrypted: i=1; AJvYcCU5JSd+4V91tA84SB8UM8qANvHcYko/50Xih7qAkrRt5hdEv0pAlZK17KhQwWZTmjHf33SKwLYuTnSdnoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNw+WL77D+NfxrsUchry4XZPZWjCJ70TU9WkOGvrOpNY74YJUT
	vkkWLatf6iYBztbvlQzKQBm1OJcWc4Yyo6uMkIuQynWorq8zfydc41bHbBkuj1iDggJDidQR7eq
	ISR8=
X-Gm-Gg: ASbGnctK0yc6x2HSHuArayY8UVYS3S8qUN3VKUSjo7kKykviJC2RDAZOhmQyf6B+vyc
	NovTCFl4Hq2X1537u9vbJff1jpw/z9ZYuA789O5zuhXrsxdH3dQohVfVmHRuryZukRcequZD3wE
	iUPTtvegsP3o/ez9cyA1jSG+09gstsIiBSb1IBKynR6N/IjaooY3nPiQycXz0AXFt3kgMvOC5A4
	VAxvu4X6nDSN9ZaGMryA1CoyWg6jgx981Zifh/WZxygG5U3B20WveBNyCSH1bPaN3BE4ufGTxPp
	8ZpDBV1Km2mD6yGYjj9eGzjIG9LnzH6PHljAo20HGVtPNtenNlr+VcZAv7XFY1iUjK8mFGfKBKJ
	EB7MlO6On3mBKLqLdz54=
X-Google-Smtp-Source: AGHT+IHhhM2dWgfCkQ9okwfo/bp82XcjCHTO9qhlYtR7XT/DA0+zNECyzd2g/a75jgA1VYAbjS+KNw==
X-Received: by 2002:a05:6402:5193:b0:5ed:76b0:a688 with SMTP id 4fb4d7f45d1cf-5f0b4716ce4mr3164736a12.21.1743785532826;
        Fri, 04 Apr 2025 09:52:12 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0d6bbsm2722282a12.46.2025.04.04.09.52.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:52:12 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so409712466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOYFN7HHeeRBgz/iJ1nUmcM4HXT7b162lDKHRu3HR6MrZTERt8X4dO/vIfULnW4royLuHsJtMyVWTYDXk=@vger.kernel.org
X-Received: by 2002:a17:907:a05:b0:ac3:8988:deda with SMTP id
 a640c23a62f3a-ac7e7626e41mr24401266b.40.1743785531540; Fri, 04 Apr 2025
 09:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Apr 2025 09:51:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWHfgVaGodMi+UecXXbo2t1At-cVUMH0e8kS6Pacqwsg@mail.gmail.com>
X-Gm-Features: ATxdqUGi3Juiu86MXhM0XWazcK8DDHPfVGFinP8mcRY6eeaAhkWCP85ngtPW-Fo
Message-ID: <CAHk-=whWHfgVaGodMi+UecXXbo2t1At-cVUMH0e8kS6Pacqwsg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 08:58, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -192,10 +192,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>                 struct mm_struct *mm, unsigned long start, unsigned long end)
>  {
> -       unsigned long start = uaddr & PAGE_MASK;
> -
>         cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> -       mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
> +       mmu_notifier_arch_invalidate_secondary_tlbs(mm, start & PAGE_MASK,
> +                                                   (end & PAGE_MASK) + PAGE_SIZE);
>  }

That just seems wrong.

All the PAGE_MASK and PAGE_SIZE games look entirely wrong and pointless.

As far as I can tell, the code should just call
mmu_notifier_arch_invalidate_secondary_tlbs() with the completely
unmodified start and end values. They should already be page-aligned,
and 'end' is already the 'one past' thing, not the final byte.

And maybe I'm missing something and my resolution is wrong, but that's
what I did.

Somebody should obviously test it.

            Linus
