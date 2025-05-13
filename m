Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153D2BE7C3
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149228; cv=none; b=QwbPr3DKXSLsV3YoqWYxDYbbjAHJRrh0ceYD+BO1a4yySSlAerRWocoj3cOpG6wzFBtZo8T8TfksIeqT3s2fAuyMqSQi+L3u2/L+ibGiUrTzQQniAkQKyv+stOr/NEYO43QNY3/mhOZPOJDn1/0rKZTPjznbb/AHy1nxi4yC8gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149228; c=relaxed/simple;
	bh=0V1M6KuFop81SJ8+EHB3ZWjFOFBi21Xwe5ztjsvCLko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR3OL9h5el/6BNP5o29ub3gFcWiNlotYnWOgeA1LAEt8n9WVuE2H7S8eIp/1FG3XM/2YMft/1WO6xx17QXupmsg73O5uCSdAFTQjuVFToR/ODwh4WZ5KR5X5OgBULmbsRzJM2/CRdaDAsAOjOQ6+7hRhqyTU3UbY0X7GR271I44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efCJ6K5l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efCJ6K5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ED9C4CEE9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747149227;
	bh=0V1M6KuFop81SJ8+EHB3ZWjFOFBi21Xwe5ztjsvCLko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=efCJ6K5lAN3R/XIUVc1rW0Y1khuBuf/Jx3SUFznVs4uwb6WGePdGR5oSP50hJBRRK
	 V+jH0e5CFXVHttL6NVXuMAGsU5DiqnWp+mUN4v2ignIO04+wakS57oy5L5yKisKPk0
	 Rg9lZIdfuc1sMWAo2K7ZNuvHBPTVcEG5JIwv32HgI/FFunCbj70+QX1+NhruRqe/0S
	 BM2UGZcYOGWaDBhQ3lgHS8oFttvWBkRqGP9VNfMJYMUQxTz+f218vtyT05wcqX6FfA
	 6nXIPZzqxGl/gNguAAFb99eg8Id7pQm6jLSkNdEYxQ40FR4aKcglUdCShyQJb5jabg
	 btORsg4w9r77g==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so11593385a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfX4wOR6JMKKWIOIgG2VrjmtmIfykLL2ovDxUnHU72vUzFHUe7MZyE7PjKSATv0KDcCVgB+vtLmGgCrWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMdfQ4lpw5jBIIVFYb8LgT1+tqn/708hWTdD955Wpn6ntOEEz
	L8wp1QHtvKJJpMaZWMQ97MP9h/QflpWc96g/HFA9w2wMeBwIRhxd/zyM2hw3kGBev4roJLF70C/
	e6+l+9ldVAIRQHj8JNAuXrnHyxxs=
X-Google-Smtp-Source: AGHT+IHaD7lU1YCxRBoo95f7oQlI76x/yV7S8UFkaFpH7WJO+fktLU7TSXceHUVVZiDmF0sbJfwV9GmZ9lL1a0YH3xg=
X-Received: by 2002:a05:6402:3603:b0:5ff:8b36:f3fb with SMTP id
 4fb4d7f45d1cf-5ff8b36f9b9mr1226436a12.11.1747149226014; Tue, 13 May 2025
 08:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513092116.25979-1-yangtiezhu@loongson.cn> <20250513092116.25979-3-yangtiezhu@loongson.cn>
In-Reply-To: <20250513092116.25979-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 13 May 2025 23:13:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4AgHQs4pMqGqe7WfwCA+u7mO3U+=hcm8ZWk5DQHhsO1w@mail.gmail.com>
X-Gm-Features: AX0GCFtoeZ9Hy0PeIDQU_MUPstbhRADp9w_YmUK1vV3ob9gBtP8Rhi6fDltdOtk
Message-ID: <CAAhV-H4AgHQs4pMqGqe7WfwCA+u7mO3U+=hcm8ZWk5DQHhsO1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: uprobe: Remove redundant code about resume_era
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, May 13, 2025 at 5:21=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> arch_uprobe_skip_sstep() returns true if instruction was emulated,
> that is to say, there is no need to single step for the emulated
> instructions, it will point to the destination address directly
> after the exception, so the resume_era related code is redundant,
> just remove them.
>
> Fixes: 19bc6cb64092 ("LoongArch: Add uprobes support")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/uprobes.h | 1 -
>  arch/loongarch/kernel/uprobes.c      | 7 +------
>  2 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/includ=
e/asm/uprobes.h
> index 99a0d198927f..025fc3f0a102 100644
> --- a/arch/loongarch/include/asm/uprobes.h
> +++ b/arch/loongarch/include/asm/uprobes.h
> @@ -15,7 +15,6 @@ typedef u32 uprobe_opcode_t;
>  #define UPROBE_XOLBP_INSN      __emit_break(BRK_UPROBE_XOLBP)
>
>  struct arch_uprobe {
> -       unsigned long   resume_era;
>         u32     insn[2];
>         u32     ixol[2];
>         bool    simulate;
> diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/upro=
bes.c
> index 0ab9d8d631c4..6022eb0f71db 100644
> --- a/arch/loongarch/kernel/uprobes.c
> +++ b/arch/loongarch/kernel/uprobes.c
> @@ -52,11 +52,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, =
struct pt_regs *regs)
>
>         WARN_ON_ONCE(current->thread.trap_nr !=3D UPROBE_TRAP_NR);
>         current->thread.trap_nr =3D utask->autask.saved_trap_nr;
> -
> -       if (auprobe->simulate)
> -               instruction_pointer_set(regs, auprobe->resume_era);
> -       else
> -               instruction_pointer_set(regs, utask->vaddr + LOONGARCH_IN=
SN_SIZE);
> +       instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE)=
;
This seems wrong. If in the simulate case, regs->csr_era has already
pointed to the correct destination address, then here we should only
handle the non-simulate case.

Huacai

>
>         return 0;
>  }
> @@ -86,7 +82,6 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe=
, struct pt_regs *regs)
>
>         insn.word =3D auprobe->insn[0];
>         arch_simulate_insn(insn, regs);
> -       auprobe->resume_era =3D regs->csr_era;
>
>         return true;
>  }
> --
> 2.42.0
>
>
