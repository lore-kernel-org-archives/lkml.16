Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7255CDF1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745049448; cv=none; b=McWgimECTgbYD/jyAQlwkykSiE/jWqAoxdWJd/mO6db7FONWehWCG77rDFb61W09x+w+s2AAZn78qQh5w6kuR1el4G+thlu++zQ4IJKdYSyuU1lvs4LcFnhMF/8SL8n0zwh9Jzta59ufJGBb9oPVqWFyYQDkaECuGzHRjtVxFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745049448; c=relaxed/simple;
	bh=2He1zuUDbO4B67P/rTuPwUbz5lQW21kyiVSnyfe0MdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9c6KZFMQY/yb4CapmQ33thGNaveVTz71ubbysxZtf9VEBpXqU5bhg1HInT4Yd3KTt4smgyHbflDAtZhP6JCejWjAwHZkBGOGfFR6ytcJf6+l34YvuQUBNdi0h1wd9MgvWvhYU7bPeFCpomXRVPjs0lHyCJzIFrsH6fKQKboHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfXJsW2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfXJsW2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142ACC4CEE7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745049448;
	bh=2He1zuUDbO4B67P/rTuPwUbz5lQW21kyiVSnyfe0MdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GfXJsW2i9I4zWJFMj8RWZutnG9Ehh4Z/AKNu0F/0CmkrjhoTUVpEdDAKPCS33aDAK
	 6XqoMHH0ie9yDCC2s+2ZwJg9wRn+nqy8W8xc7KqLgGrPTn3IMz1vUORjtlNG+Q62uF
	 3AkXj6BAqiUSq1OUbTUm4qwkLqDQKbhbMaksPD4xlq2lUCw8GAXx+v2ZAuM1+QCr/3
	 bdMmTab7qUumBSc6bMTO3cS6gXm8A1rwRVZGMfbYi+zljvIbunh1MvDZd4nFlmJ8n1
	 HTBe6eqotGnRfq9dPrWdHmNRCCRXVKzA17CrTWmgVEzWq8G1ira5hrBI+kPF6uZVC1
	 MQ9nFXlDTbjzQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbb12bea54so379214266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 00:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU57j6RoroldQQHhrt3tt0PrqRZm80Fs/oKdr4aNmS0dC3hJqb7BOkqa+mPBEAzA37xkkSXKhVbmFfoIL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKDU97+xGY1X5uepQvfJKWW1Q6qp6Fwzrw9HD4IHwKdEo8TCe
	WhXXNTz8af/ZEABbKF5R7MDJEMpB61bzhPTq74l/WNNd/p0AMOumpdyjGBrIPyJadqy04iPAl5W
	GNjCXB66dUONZQUkqrvTWI8bzlgM=
X-Google-Smtp-Source: AGHT+IFBOqeUjjkSD9wb1GlhkO06JWAuI2wpsT1LO42Oj7bB21kjJElgl2H6DfIYII5GwzUBO4nCf8/dr9DE7t2PaC0=
X-Received: by 2002:a17:907:3da7:b0:ac3:c7bd:e436 with SMTP id
 a640c23a62f3a-acb74dd5869mr470058166b.51.1745049446685; Sat, 19 Apr 2025
 00:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415072118.3774454-1-chenhuacai@loongson.cn> <aANVMaepni3KeABI@kernel.org>
In-Reply-To: <aANVMaepni3KeABI@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 19 Apr 2025 15:57:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
X-Gm-Features: ATxdqUEswLyYsdm0DWCKHpfX2YeoU7V4Mr883tkxyRMQSGcVNfs2948KijY-SYM
Message-ID: <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
To: Mike Rapoport <rppt@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mike,

On Sat, Apr 19, 2025 at 3:48=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi Huacai,
>
> On Tue, Apr 15, 2025 at 03:21:18PM +0800, Huacai Chen wrote:
> > Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
> > numa_memblks from x86 to the generic code, but LoongArch was left out
> > of this conversion.
> >
> > This patch introduces the generic numa_memblks for LoongArch.
> >
> > In detail:
> > 1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
> > 2. Use generic definition for numa_memblk and numa_meminfo;
> > 3. Use generic implementation for numa_add_memblk() and its friends;
> > 4. Use generic implementation for numa_set_distance() and its friends;
> > 5. Use generic implementation for memory_add_physaddr_to_nid() and its
> >    friends.
> >
> > Note: Disable NUMA_EMU because it needs more efforts and no obvious
> > demand now.
> >
> > Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/Kconfig                 |   1 +
> >  arch/loongarch/include/asm/numa.h      |  14 ----
> >  arch/loongarch/include/asm/sparsemem.h |   5 --
> >  arch/loongarch/include/asm/topology.h  |   7 +-
> >  arch/loongarch/kernel/acpi.c           |  11 ---
> >  arch/loongarch/kernel/numa.c           | 108 +++----------------------
> >  arch/loongarch/mm/init.c               |   8 --
> >  mm/Kconfig                             |   1 +
> >  8 files changed, 16 insertions(+), 139 deletions(-)
>
> This is really cool simplification!
>
> I wonder if maybe we can take a step or two further and make loongarch to
> share more code with other architectures.
>
> Is there a strong reason not to call numa_memblks_init() from
> init_numa_memory()?
> And more broadly, maybe loongarch can be even switched to arch_numa?
This is a minimal change for Yuquan, I will make it in linux-next as
soon as possible so Yuquan can continue his work.

Switching to numa_memblks_init() or arch_numa will be done in future,
but need some time because some machines seem to need some hacks.

Huacai

>
> --
> Sincerely yours,
> Mike.
