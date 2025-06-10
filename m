Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF720FAB9;
	Tue, 10 Jun 2025 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556460; cv=none; b=nQEzoZm2Jff/t6zAwz5qXOjUi58cqR8ulhymXvQpUYgGi9zS0MmnLjaavcdYMm/xob1sIPVkcV7E1HJGneZaA2j53KJWvnVk2eVvKhe3adSgiaEy2E0OFPpNrmchujxlPjNkEn10JNNLUVOHfpVCyMYxs8uHoE7ZdvcxokWDBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556460; c=relaxed/simple;
	bh=4Yait4aMo7R5A1axnUR1iRVdVYOZN6Z+sj3q9FLyCt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCBbv/EBb1vPux4Ah6hWf78EzElqTzo2oHYEHR2Y+W06rB3RZINYSwn2oC4o/fB3+4cOr18iQEy8wvlb7Q67XU0lGpgxIjnNfGr3kdbnHFO+H8V52NTrWJNSenPOVLGqNfVGt3m1Gj0U24uw5hSvNl6mzkOK0PwxZiqeig64XAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5eHmVMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5eHmVMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2698C4CEF2;
	Tue, 10 Jun 2025 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749556459;
	bh=4Yait4aMo7R5A1axnUR1iRVdVYOZN6Z+sj3q9FLyCt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D5eHmVMFFE2zO18GffiCQ1Pe/lrZzkERe9oNZwJBZjJ6uNK6strpjb1+SNO6ky8F8
	 myt4Uap5Us0IoHfgZLy358t5D5z2RSbwxKovOUVYnPc3elG4pkmKLSww/TLkATXMaQ
	 CG6s9WxDTOJsJwIvfqMVOrKnfAgtmn9nzDz9iTs5vBvMaMRB0Mol2z7hTerxZc2Im+
	 xfIernXtOgja4fXgqxLbLc4ivpsOuSf0IByi3Mc8slq2WuL+YGH8WoAdYWS8nR0WNN
	 djjp6H43vFasE5C3IKORXFUr4+RH00BI6Vb+3lDj/5ABsSMWeksIyqZrF1AY01R60P
	 iXxo6N5Gi7N+g==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso4936939a12.0;
        Tue, 10 Jun 2025 04:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTmylA3VVqnriFHn3QF1zMjBanTx73zkdnel8C1DmUnniCcIXZ0uqe1/MNYADKUO4wb+rwT6Kv3caefuSM@vger.kernel.org, AJvYcCX++Tjm3HHUpV0ZgtgizLqTTyG4N84S+XNtOIJI41JbA51Bw9D6XwvTTpaTEF3eLP9Kr386x27S+rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyWuYMCszE62U+plRzIE3laAfhtiyrdG9HVaxVfl5fVojI9L3
	RyyNIQUPihb3eGe10pSuwCkrlGhJNu7aUO2k39PhmO88ERMhqoLiYB2wk1CDiRab9ef1mcrwOWQ
	PgHcV3yge/DjHtCKQEtDggclrP77pfRU=
X-Google-Smtp-Source: AGHT+IGvNRJJuSwa/zI6M5nGCQWEkP5Tqaw7VyqLhE5OjxyGtDXZzw1MQNm89CejDAXXPf9AWT1/HB2voJ/fMmd83NU=
X-Received: by 2002:a05:6402:5109:b0:603:5a23:2997 with SMTP id
 4fb4d7f45d1cf-6082d9b36afmr2124005a12.17.1749556458441; Tue, 10 Jun 2025
 04:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
In-Reply-To: <20250610114252.21077-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Jun 2025 19:54:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
X-Gm-Features: AX0GCFuuWC59s_ij5SZgZ2sFeRpeQtZYtBIN7Y-98gkb49cCnnIryE5bln1ZHwg
Message-ID: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	tglx@linutronix.de, jiaxun.yang@flygoat.com, peterz@infradead.org, 
	wangliupu@loongson.cn, lvjianmin@loongson.cn, maobibo@loongson.cn, 
	siyanteng@cqsoftware.com.cn, gaosong@loongson.cn, yangtiezhu@loongson.cn, 
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Super User <root@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

Have you received my comments in V3?
https://lore.kernel.org/loongarch/20250523101833.17940-1-zhangtianyang@loon=
gson.cn/T/#m2883f379ce7eb663f3f3eb4736bf9b071c7fd8ab

Huacai

On Tue, Jun 10, 2025 at 7:43=E2=80=AFPM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> From: Super User <root@localhost.localdomain>
>
> This series of patches introduces support for interrupt-redirect
> controllers, and this hardware feature will be supported on 3C6000
> for the first time
>
> change log:
>         v0->v1:
>         1.Rename the model names in the document.
>         2.Adjust the code format.
>         3.Remove architecture - specific prefixes.
>         4.Refactor the initialization logic, and IR driver no longer set =
AVEC_ENABLE.
>         5.Enhance compatibility under certain configurations.
>
>         v1->v2:
>         1.Fixed an erroneous enabling issue.
>
>         v2->v3
>         1.Replace smp_call with address mapping to access registers
>         2.Fix some code style issues
>
>         v3->v4
>         1.Provide reasonable comments on the modifications made to IRQ_SE=
T_MASK_OK_DONE
>         2.Replace meaningless empty functions with parent_mask/unmask/ack
>         3.Added and indeed released resources
>         4.Added judgment for data structure initialization completion to =
avoid duplicate creation during cpuhotplug
>         5.Fixed the code style and some unnecessary troubles
>
> Tianyang Zhang (2):
>   Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
>   irq/irq-loongarch-ir:Add Redirect irqchip support
>
>  .../arch/loongarch/irq-chip-model.rst         |  38 ++
>  .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
>  arch/loongarch/include/asm/cpu-features.h     |   1 +
>  arch/loongarch/include/asm/cpu.h              |   2 +
>  arch/loongarch/include/asm/loongarch.h        |   6 +
>  arch/loongarch/kernel/cpu-probe.c             |   2 +
>  drivers/irqchip/Makefile                      |   2 +-
>  drivers/irqchip/irq-loongarch-avec.c          |  25 +-
>  drivers/irqchip/irq-loongarch-ir.c            | 562 ++++++++++++++++++
>  drivers/irqchip/irq-loongson.h                |  12 +
>  include/linux/cpuhotplug.h                    |   1 +
>  11 files changed, 674 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>
> --
> 2.41.0
>
