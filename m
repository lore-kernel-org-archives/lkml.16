Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA4D214A7F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602802; cv=none; b=AaMq00GQUtZ2PD4UdgV5R1sbR9YY9PiqFAsJbh5lV/4wjKCajlGjRFWl0bM8IOuKV9QBD9NF9WHGTjurQVo5hx6P4IB1xAqQxXQ1HPbZtOdQM1beejDRsjv+KamWhYgV82+t72k2AxxsIkju47v2fDvqEn8RAvDCiz80AviOCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602802; c=relaxed/simple;
	bh=08DgS7JA4Cqv6Y7T/TZ8pwmK5t/7jlMA1R95ZvOXeAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdwaDujz6q2vqpB2CmS5NtHxxrZHjlVyt2g5CuJSoZ4G9r8YYdDJhnHi67JR5HGO5FjG2JWtQiAQsuMMxhXWM0nCG+9uQ6/mDmwiPRTEeX2IRMrdzskKmfXVHFCIcGq3c5R9f52aHZGnBDlxzv7eyLhxILqscvxQWuLB3N6ZxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBbf3DN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBbf3DN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828E0C4CEF0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746602801;
	bh=08DgS7JA4Cqv6Y7T/TZ8pwmK5t/7jlMA1R95ZvOXeAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bBbf3DN4z1IwoxDh0Tm+QojrIxRtTE4kvRzEyy6kB/hiE4Js+fz6F9jaMmMeEZol9
	 QnCj9H9AvVUeah+2A8/8zAtmHq9d7b37RZhXZ7FZwYtRpWd4ibceM3+l/yDoLYprPG
	 dN4p9y1ECpfYHtZD7peiIxaQXodwxBH9g20Bc73/Shiig6MqbPntDMx4uxeriYXTvS
	 oC2EiDB62iP8Pzt9wB2DUFjNC+FdW40H7mc1I8hFM0f2OHFr0yYcW8Y9abvxgggCsa
	 4yIakLdX06v9cy8Aeyx4vNx87xUOIXLgLnZ2xNT6/rXgaBjACYmlb3LOKfURRjfxs0
	 cG9ZevON2IQtw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so11584100a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo5ndzzW/NcgJeerhBEVSbemh0oXS8VSQCfALRTALPRWmtj6Ea1dtljefiHR6leJNVcNSBwxOCj8hWxuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdIripy9mQYy06gB7J6Kh3S1BzT2SaSkB+pdJsePLP/Nmqu/K
	sOYTNyW2DxWuMjDqC3q/Su8gvHNR9uoPH8Fc+6b9f4PtvZGMrPGjbQ5217S5l9fcEZMGnm87duK
	dVEki1wbgsEF6FpCwM0uTnH6mLio=
X-Google-Smtp-Source: AGHT+IHFQjCmCQr0LmxjWBlTOy2KYlulJcX/rzkfl5KPvMS8CVNRz0bXOLP8Hj35w5EvGhxc9Zr2/nTP+6lXOlBFC/s=
X-Received: by 2002:a05:6402:848:b0:5fb:f708:2a7f with SMTP id
 4fb4d7f45d1cf-5fbf7087e9amr498361a12.32.1746602800117; Wed, 07 May 2025
 00:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-loongarch_include_order-v1-1-e8aada6a3da8@rivosinc.com>
In-Reply-To: <20250507-loongarch_include_order-v1-1-e8aada6a3da8@rivosinc.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 May 2025 15:26:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7uvnqReegNM+L6Q=ScnXFmpgYnNNTmokBJe9RDSDDdWQ@mail.gmail.com>
X-Gm-Features: ATxdqUHvKcoRrZHuVz7XnoN3Sd9yQrReQ6jGcaThJKKnP7ijPdBSrDL6EipEJ3o
Message-ID: <CAAhV-H7uvnqReegNM+L6Q=ScnXFmpgYnNNTmokBJe9RDSDDdWQ@mail.gmail.com>
Subject: Re: [PATCH core/entry] LoongArch: Fix include order
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Charlie,

On Wed, May 7, 2025 at 3:11=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> Reorder some introduced include headers to keep alphabetical order.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")
> ---
> This is a very minor fix to a patch previously applied to the core/entry
> tip.
If possible, I prefer it to be squashed to the original patch.

Huacai

> ---
>  arch/loongarch/kernel/process.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/proc=
ess.c
> index 98bc60d7c550fcc0225e8452f81a7d6cd7888015..3582f591bab286c30127e715c=
47d485f74d5e2ca 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -13,8 +13,8 @@
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> -#include <linux/errno.h>
>  #include <linux/entry-common.h>
> +#include <linux/errno.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
> @@ -34,8 +34,8 @@
>  #include <linux/prctl.h>
>  #include <linux/nmi.h>
>
> -#include <asm/asm-prototypes.h>
>  #include <asm/asm.h>
> +#include <asm/asm-prototypes.h>
>  #include <asm/bootinfo.h>
>  #include <asm/cpu.h>
>  #include <asm/elf.h>
>
> ---
> base-commit: e43b8bb56e537bfc8d9076793091e7679020fc9c
> change-id: 20250506-loongarch_include_order-bbf509faca15
> --
> - Charlie
>
