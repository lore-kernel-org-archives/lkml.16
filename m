Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF419ABD1
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271733; cv=none; b=rPVh7txufFxKqcLTWL/bxZJE5z8VBXrAf6clQT1qE/zPqjd5DCPvxhRM4ZERN6kCBGPzIdKfmYsbUY/mYExFX6vEoVl1tqdOKZ41ywjVRkijO+FK1vhxC1y+4g6DD1fVjXK0SQxgYFOdGMnWmaVE3LtN2sn0NL0YKnZTNeTRcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271733; c=relaxed/simple;
	bh=Td7Q6iRRCzPGbE1V9qO9rxXlsU90ebvGvLA0TcrLZDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=ZLexYcTetWpXkhMsAkPojjS/5f32rRS4IIDa4Hi+URzMGRQkY3F1KpG0g3WmkkvnpCG359kd8+VQZGHKCuD/YorllanU0g/vgICxoW3wvMMCiyaUPoVgU5X6DbmxxEiVbmCaB0WFW2o/sttkk9cN8v1gcljLY32jcBBHFVcMsZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBAA/NgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBAA/NgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6EEC4CEEB
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746271732;
	bh=Td7Q6iRRCzPGbE1V9qO9rxXlsU90ebvGvLA0TcrLZDs=;
	h=References:In-Reply-To:From:Date:Subject:Cc:From;
	b=jBAA/NgVcSCwa4d91CxRJNziUngQEJ3+vLiGm6Uft3ofxBPr6bgWtm8MBVJumzLff
	 D86BThAyfnAZUOswVNfQTnbpHHJK87w5BBiV3lQ9+/FoaMY9JbXgtlYeOOngnubCmP
	 PQ6FPcMLnNZ7ohtZ2XG5CvfivC4K718fwjfwch03U6sf7Z2ELuL3scJTQKGbrzN/gL
	 63DJD56j0ahOT0Z49jadzeF77EscZOHN1ptNmu7ZgqsK0MIg1w9n/t3VY2v2F2VES9
	 0fyAC3LDzdKSMXn0q9CO3mJSH2m3DiG7kQ61T3mUwSYnl5Lk7GFzGkMEXgnAQtrkLN
	 aWWZRiXCbFDyQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so3011105e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4eM41nCSq8G2uZwrbiOE6q6V0yDfxXZdFmcahL5fVtAkPtB8suJdstFZ1VQKmRcYjBhSfAh/dC6uOSo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrFyE3bvwiTFX9/DaAblRis0hfj0xfIEIYzEema1OIcPd+TTDu
	MfcWB6OlG7aUWRBksSbq4J/LGsJ80jRoPkHek144HkjsGgNwT1vqaH1wKgX4dugheYcgrVmZh6o
	N9e34ldYk41J8PDxah6URTQNKQpU=
X-Received: by 2002:a05:6512:3f11:b0:545:d70:1d1c with SMTP id
 2adb3069b0e04-54f9efb44d4mt195795e87.11.1746271730523; Sat, 03 May 2025
 04:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com> <20250503112137.1962910-6-ardb+git@google.com>
In-Reply-To: <20250503112137.1962910-6-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 May 2025 13:28:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFF_y9pJ+Nuy7-63LA79+x=pPOg5uHYB_RHP_4gRKhTeQ@mail.gmail.com>
X-Gm-Features: ATxdqUFQ7ucpjYLPLXveCPYSh-dH1vB1VaK13XEOetNi46u31OHmAGV-1WDuuMM
Message-ID: <CAMj1kXFF_y9pJ+Nuy7-63LA79+x=pPOg5uHYB_RHP_4gRKhTeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 13:22, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> init_pgdir[] is only referenced from the startup code, but lives after
> BSS in the linker map. Before tightening the rules about accessing BSS
> from startup code, move init_pgdir[] into the __pi_ namespace, so it
> does not need to be exported explicitly.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h | 2 --
>  arch/arm64/kernel/image-vars.h   | 2 --
>  arch/arm64/kernel/pi/pi.h        | 1 +
>  arch/arm64/kernel/vmlinux.lds.S  | 4 ++--
>  4 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..6a040f0bbfe1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
>                                  PUD_TYPE_TABLE)
>  #endif
>
> -extern pgd_t init_pg_dir[];
> -extern pgd_t init_pg_end[];
>  extern pgd_t swapper_pg_dir[];
>  extern pgd_t idmap_pg_dir[];
>  extern pgd_t tramp_pg_dir[];
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 5e3c4b58f279..a0977f7cd3ec 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -56,8 +56,6 @@ PROVIDE(__pi_memstart_offset_seed     = memstart_offset_seed);
>
>  PROVIDE(__pi_init_idmap_pg_dir         = init_idmap_pg_dir);
>  PROVIDE(__pi_init_idmap_pg_end         = init_idmap_pg_end);
> -PROVIDE(__pi_init_pg_dir               = init_pg_dir);
> -PROVIDE(__pi_init_pg_end               = init_pg_end);
>  PROVIDE(__pi_swapper_pg_dir            = swapper_pg_dir);
>
>  PROVIDE(__pi__text                     = _text);
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index c91e5e965cd3..38a908d048e8 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
>  extern bool dynamic_scs_is_enabled;
>
>  extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
> +extern pgd_t init_pg_dir[];
>

Apologies, I hit send too quickly - init_pg_end[] is missing here.
