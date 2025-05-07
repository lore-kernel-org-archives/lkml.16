Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04069823DE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613215; cv=none; b=RCHLsurIxHAeI37kFn5aSsNAdkajEn8WL5tCIXwMSqRIcDUXboQdO9S/5UEaWmm4lyDyuTkv4NuQBXtTy5OpYxG985j3JvKRtmM65hKcOzSoaFiHkbUGkTUmAvot/RzmdKkPJHUhHJB85ckVJyGH56oOS0K55mH8yniK1RpcrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613215; c=relaxed/simple;
	bh=49gHkHgORh/qqOg+Dw3boqOH5VMEFZ8DNLpTYX4mIxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cs2VCa0Pc8onDglVoxhTpAkQkeL7V2Xa7yEeOtRZMf0hNJDDOnC5Pd9CKWzLjDSTH8zGXpO0lgGVJVWYrXB1LrtSci7TrrrUVC9cMCUnrWsIzAhQSnPQYRRFARsuUYYagRhjKX3NcuALJsI9KysQUdwlptHP6nLVAckU6rIFxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqlJzoDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqlJzoDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C08EC4CEF1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746613214;
	bh=49gHkHgORh/qqOg+Dw3boqOH5VMEFZ8DNLpTYX4mIxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rqlJzoDZl/W20kKJQ2E3TEITdZdVM9HtKm0ZnHu02YxdQ6xp6j3+3GFmu7Jdj+t/h
	 gfBuZTX5yG3qx8rAAzlo6o5qdYWbWO1XZOZEABOpFE6YtB53eOv9kW1tRbp0DqOMAl
	 ph4sc6B4M4KSzMHsIygCI40ZtUF9nzahJ8fwzv0hgUUnx1VCLNk5/+4ONas6jbMhHI
	 a6quYGtiC4Wh+KZE5MWDVy5eYUqrP97EbVhVYuQoBFew3IlMSvwKBW+7zqKzGs1UgF
	 BoBCwGuDhFk4yKJM+I2rJYB8pnWA3x5XreCbQKlxFxHCCPlbahjqBkAIKhLKEiE0Br
	 pnMAQcNIFehAQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so7537343a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDaOnO8mXT374DkxgfMh6mSrCxGIjmDudxmyuBqv2gusj0Aa2RtCetVoO8LadoEP7jQANHobphKuQUBBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HS5C5d416EmilOu7WigGggUw+6/kpuAWdZImtzQ+USNpGN+S
	kBLcnMIcSPuE0K2u+707NcJ542mAaOzYIlojCfM0QcVbDni856kuLIr2Tuc+18sWGHpFSEuYXei
	CX7k2AaC6zOtCFm06cJXo93WVOT0=
X-Google-Smtp-Source: AGHT+IEl1IhNVOxMwicfaz/b3D3yCziBkLc6KxhZQ9uzsncPuNmVvRjgzqUfds/UTXZTT4UUHbLkhzBRatBkIA3n5+I=
X-Received: by 2002:a05:6402:35cf:b0:5fb:1bd8:73b4 with SMTP id
 4fb4d7f45d1cf-5fbe9dec3ddmr2295658a12.8.1746613213030; Wed, 07 May 2025
 03:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507073428.216090-1-chenhuacai@loongson.cn> <728f6bff-d029-4ce5-a760-520fadee26ac@linux.dev>
In-Reply-To: <728f6bff-d029-4ce5-a760-520fadee26ac@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 May 2025 18:20:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7mHVntjCYkq3fdJG5f0JLvSWAS16cwvEAAbT8u0FzNCg@mail.gmail.com>
X-Gm-Features: ATxdqUEJYmLIcPmZuad63MLu8or5iFRZ3AADftoKYs2F7FJ0JbTL482k0L_F_7c
Message-ID: <CAAhV-H7mHVntjCYkq3fdJG5f0JLvSWAS16cwvEAAbT8u0FzNCg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase max supported CPUs up to 2048
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:07=E2=80=AFPM Yanteng Si <si.yanteng@linux.dev> wr=
ote:
>
> =E5=9C=A8 5/7/25 3:34 PM, Huacai Chen =E5=86=99=E9=81=93:
> > Increase max supported CPUs up to 2048, including:
> > 1. Increase CSR.CPUID register's effective width;
> > 2. Define MAX_CORE_PIC (a.k.a. max physical ID) to 2048;
> > 3. Allow NR_CPUS (a.k.a. max logical ID) to be as large as 2048;
> > 4. Introduce acpi_numa_x2apic_affinity_init() to handle ACPI SRAT
> >     for CPUID >=3D 256.
> >
> > Note: The reason of increasing to 2048 rather than 4096/8192 is because
> >        the IPI hardware can only support 2048 as a maximum.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/Kconfig                 |  6 ++--
> >   arch/loongarch/include/asm/acpi.h      |  2 +-
> >   arch/loongarch/include/asm/loongarch.h |  4 +--
> >   arch/loongarch/kernel/acpi.c           | 41 ++++++++++++++++++++++---=
-
> >   4 files changed, 41 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 38706186cf13..0c356de91bc4 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -496,10 +496,10 @@ config HOTPLUG_CPU
> >         Say N if you want to disable CPU hotplug.
> >
>
> >   config NR_CPUS
> > -     int "Maximum number of CPUs (2-256)"
> > -     range 2 256
> > +     int "Maximum number of CPUs (2-2048)"
> > +     range 2 2048
> > +     default "2048"
> I'm curious. As a new architecture, why did you write
> such a small value at the beginning?
Good question. Just because there are many limits at the beginning,
hardware register, irqchips, acpi tables, and so on.

Huacai
>
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>
> Thanks,
> Yanteng
>
