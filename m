Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F791B87CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234278; cv=none; b=i35T7urIw1QXECCL4eGkupSH1PsjDpi+pNJxi1jy6AAx63qlCccL+f8uenyyLx4lAQ5IGFM0vS6lMX8P04MoOCByw3c8kupyrUQabiOv/R3t6kc/PE+igPRjw8cOefSumiW+uicWDuxs1S712y8yEzEFfAKtf2OfMuTJC4Jfz5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234278; c=relaxed/simple;
	bh=O7WNQrDY8/JOx9yDYkECk6fBdY8kCGDAHOxbGZh8bYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLY8Nm6fZnb9L+lcq1TZ3WUsifChDm+RwQh+Y36+VTJrcr5R1bKAlMZZri1ogDqxZBCF81GEuqwq5fc/nfZ932rNmtYWmsO8HDx9W6bs3G8yGTtaTSNUuXu7pIguG3AkN1A033pWFNvk44yXOQzoQB/osXANDDCGYoja9fh3x0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFONZlvs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFONZlvs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E5C4AF09
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234278;
	bh=O7WNQrDY8/JOx9yDYkECk6fBdY8kCGDAHOxbGZh8bYQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SFONZlvsCwA565BQdFpfDjkcMv253uLGPft7yJjo3pFhivG/KlnAEBVyQRZMCxAMo
	 5SfjfRGRER4rCsWtcmS7lW2ib7ivcQr64SNxH/01LOonjLcfgnkI5ec+4wr8r+vSOF
	 gnwGQ31WlALhmguu2ayOr1r3pmJwRQsEM6iNBvY+YjUo9+t/itz3r5kgkZIkGIry7X
	 HQNd8g1xeR6BWC79gum/Q9olLAuuzOPT19XAbrJhlOAh3U2iJBCLnKcpCnEO8lvXvD
	 PIux9I6AgzE21ffM7frhrnTD9Z1bhNLmotQKoWZ+4KoOZH+jLDrPtcLp8hke8sJJNQ
	 sdVodGXvju8Ww==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fbcd9088a7so2110352a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1nRa8tL80DONgmVbvZwpbVcnc//qtzqwI2Wcwuu86N568qD2hHg+zHz8ulSwG5sNHlzp2hfopo21VuuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJt8hD6zKg88d2iL4KD9K7zb1nxXdAbuGWjbceQciBTBc+K+q/
	EoLmK4CcFoOgOIAgPorSHTSsACpbAGaJO2V+JDYbb9cn/8ZhTWHnTMyNDhRaSZvRR7INcqwIRZl
	S+MTMMe+7TaV0JW0ohDQvki0sJBQ=
X-Google-Smtp-Source: AGHT+IH/ThODmqttSoNzxbWWABbYYF2hu3CS8DS4XL22UFTENLhop6PijzhnzaiTU8loCXoEbpnzWq9hUec6yC+fzhM=
X-Received: by 2002:a05:6402:1e94:b0:5fc:93ff:f2bf with SMTP id
 4fb4d7f45d1cf-5ff95c36519mr2983841a12.15.1747234277282; Wed, 14 May 2025
 07:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513092116.25979-1-yangtiezhu@loongson.cn>
 <20250513092116.25979-3-yangtiezhu@loongson.cn> <CAAhV-H4AgHQs4pMqGqe7WfwCA+u7mO3U+=hcm8ZWk5DQHhsO1w@mail.gmail.com>
 <bbd7e5ad-c353-6916-cf9e-8f3aa3fefda9@loongson.cn>
In-Reply-To: <bbd7e5ad-c353-6916-cf9e-8f3aa3fefda9@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 14 May 2025 22:51:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6HTx3qgoUHKC0nB0LTqN9o9t=P3QuD7PumacaOe8pjEw@mail.gmail.com>
X-Gm-Features: AX0GCFuW0sYon0f2qyf0-wgagLfvseV3bMoL8UCdpvzdkJWXMnyXie5UBp29UXg
Message-ID: <CAAhV-H6HTx3qgoUHKC0nB0LTqN9o9t=P3QuD7PumacaOe8pjEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: uprobe: Remove redundant code about resume_era
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 5:33=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 05/13/2025 11:13 PM, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Tue, May 13, 2025 at 5:21=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> arch_uprobe_skip_sstep() returns true if instruction was emulated,
> >> that is to say, there is no need to single step for the emulated
> >> instructions, it will point to the destination address directly
> >> after the exception, so the resume_era related code is redundant,
> >> just remove them.
> >>
> >> Fixes: 19bc6cb64092 ("LoongArch: Add uprobes support")
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>  arch/loongarch/include/asm/uprobes.h | 1 -
> >>  arch/loongarch/kernel/uprobes.c      | 7 +------
> >>  2 files changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/inc=
lude/asm/uprobes.h
> >> index 99a0d198927f..025fc3f0a102 100644
> >> --- a/arch/loongarch/include/asm/uprobes.h
> >> +++ b/arch/loongarch/include/asm/uprobes.h
> >> @@ -15,7 +15,6 @@ typedef u32 uprobe_opcode_t;
> >>  #define UPROBE_XOLBP_INSN      __emit_break(BRK_UPROBE_XOLBP)
> >>
> >>  struct arch_uprobe {
> >> -       unsigned long   resume_era;
> >>         u32     insn[2];
> >>         u32     ixol[2];
> >>         bool    simulate;
> >> diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/u=
probes.c
> >> index 0ab9d8d631c4..6022eb0f71db 100644
> >> --- a/arch/loongarch/kernel/uprobes.c
> >> +++ b/arch/loongarch/kernel/uprobes.c
> >> @@ -52,11 +52,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprob=
e, struct pt_regs *regs)
> >>
> >>         WARN_ON_ONCE(current->thread.trap_nr !=3D UPROBE_TRAP_NR);
> >>         current->thread.trap_nr =3D utask->autask.saved_trap_nr;
> >> -
> >> -       if (auprobe->simulate)
> >> -               instruction_pointer_set(regs, auprobe->resume_era);
> >> -       else
> >> -               instruction_pointer_set(regs, utask->vaddr + LOONGARCH=
_INSN_SIZE);
> >> +       instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SI=
ZE);
> > This seems wrong. If in the simulate case, regs->csr_era has already
> > pointed to the correct destination address, then here we should only
> > handle the non-simulate case.
>
> What is wrong with this code? AFAICT, the code is right.
>
> Here are the call chains in the generic code of uprobe:
>
> handle_swbp()
>    arch_uprobe_skip_sstep()
>    pre_ssout()
>      arch_uprobe_pre_xol()
> handle_singlestep()
>    arch_uprobe_post_xol()
>
> arch_uprobe_post_xol() only handles the instruction that is not emulated
> because if arch_uprobe_skip_sstep() returns true, arch_uprobe_post_xol()
> will not be called, it will be called only if arch_uprobe_skip_sstep()
> returns false.
OK, I know.

Huacai

>
> Thanks,
> Tiezhu
>
