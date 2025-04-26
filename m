Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6B1C36
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662186; cv=none; b=BpMt6iDIGOs+Vcu8ux0AjLK5gsSuK9JJ+9xYVsfKuA3qQRRW86hQZdho83W/EA7uJW9OPaawOOT4/oVMUIv+8UhxkKCouVRlCunaPPFOg/vpSZrULANg4EnK/It5bSCFpI19Vm/6f3Jf9nZzu64gOEjHhoH4MwX7s+H/5Ycfgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662186; c=relaxed/simple;
	bh=+dSeHCDPkLi4s13f7givFRWz0QNyRYjrVGiCHP5glzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feDYTD/J0vNm6lGWohmNf+a/fAUYzpG1EKZZK9JDlVjMSeuXmqH5taQwxFMefWdNtXaRbOMyibM1tCWMyPlm9jotCO8Ptr+nbmQpRatR+o1tKsw9PG0MNHxucK6PC1tlgNCfwtQ3AC7xxhxoGDqhKmrGGAoInoNaisG/M9CFc6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiCwMDig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiCwMDig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E123EC4CEEB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662185;
	bh=+dSeHCDPkLi4s13f7givFRWz0QNyRYjrVGiCHP5glzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XiCwMDigvoBeSkH+tG4v4+R7hq4qu7y63WHd4Cqg4TUWCk51IMYegmabySKN1UDAt
	 hh/+gp09FgMLHVIOkZR3i6w15HvMyTeJxNIjsKpLDiczL+1FFNeYjLXjr18WuZc10U
	 EAj4bAHFLsiaK1Nsfl1mHnE7gt7MtR2p49xtkpbo+tzZYNTvBiQdt4umpNBlj7FmXb
	 1PiwU+1Ivcldt494BCGsdfk3IsEStJQNpQAUJryw02CoMCncGwHLEUt01UCL99Ry5j
	 A1dzcFz2TUYZIQwV/IERO3+SoExXTKxdUIttv8Os4lE0O3I7hu3nDS+fXVSG9+KVP+
	 3SIKjQ89nKoyA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3b12e8518so540452266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpC1n+NlWcv5xoKSJZaWJ/paTBw11kkbBGJiabEjb4RxSry4nheLHrfDE47GLAgueRaCZjmZbcpQJe2zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzArp2JGjuElFxYbqsMxYb5NyFJVkYMZjf4pBouuF8cQv2g5Mtk
	4u9F1qnUWXJUTBugy7ejWme4eGKqXyFCedBm0z+If5HmDUkGdbf8M6AMMUfFS2okiV4HCi34hdK
	Qn5iDFlWeiX4LPB0Wt0jF1XJS09k=
X-Google-Smtp-Source: AGHT+IGiCA2J42eJM1hxcTb7t1MjZL2vpEWpK37pKd4NlNOTF8InkxUxvzV7PS9ia/U3F9kdJIwWYyVKrTqiptmT2lI=
X-Received: by 2002:a17:907:2dab:b0:ace:4fde:c28f with SMTP id
 a640c23a62f3a-ace84ad7a54mr196891266b.41.1745662184520; Sat, 26 Apr 2025
 03:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CC80F694AAFA2099+20250417080746.352276-1-wangyuli@uniontech.com>
In-Reply-To: <CC80F694AAFA2099+20250417080746.352276-1-wangyuli@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:09:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7d5CQW2nPeUQNG4Y3RJRAF-AePWKLyOrEAa105muUOAw@mail.gmail.com>
X-Gm-Features: ATxdqUEsWNQ2lM6EcfQj5ldyBfzquoyTXLjtve2BiEeTdjeGznJHVA_uO5kjWzo
Message-ID: <CAAhV-H7d5CQW2nPeUQNG4Y3RJRAF-AePWKLyOrEAa105muUOAw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Select ARCH_USE_MEMTEST
To: WangYuli <wangyuli@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jiaxun.yang@flygoat.com, liuyun@loongson.cn, chenhuacai@loongson.cn, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com, 
	Erpeng Xu <xuerpeng@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 17, 2025 at 4:08=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> As of commit dce44566192e ("mm/memtest: add ARCH_USE_MEMTEST"),
> architectures must select ARCH_USE_MEMTESET to enable CONFIG_MEMTEST.
>
> Commit 628c3bb40e9a ("LoongArch: Add boot and setup routines") added
> support for early_memtest but did not select ARCH_USE_MEMTESET.
>
> Fixes: 628c3bb40e9a ("LoongArch: Add boot and setup routines")
> Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
>  arch/loongarch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 54ed5b59a690..1ce9b8f5fd03 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -74,6 +74,7 @@ config LOONGARCH
>         select ARCH_SUPPORTS_RT
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
> +       select ARCH_USE_MEMTEST
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_USE_QUEUED_SPINLOCKS
>         select ARCH_WANT_DEFAULT_BPF_JIT
> --
> 2.49.0
>
