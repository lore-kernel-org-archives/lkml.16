Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0225314413
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746496936; cv=none; b=oESEgZEN90CyYOX3hw4R1EFqBMAnA4juf7AVgjmYeBGHs5Ud6W96LYoXqwovcJAZC0wQrc4t8Gi+YBvFV/TkCaacNF83s9xrULzq32tVzRM9RveQD4tUS6ca9KUc5THKiaBX6Jj56cNs0zzCj5n7vWrV6wRH4J+M/U3mVRCijo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746496936; c=relaxed/simple;
	bh=7ZicNrG4s8sFFE5fN56V0rVDMXcHO2l9sNZa2iMuxc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im/Kz7r3PVgad23YNTcbwcUNAMh3Eg87RwofnHq4mWsEA2nedMayy5Bb7onpjPWRs87m4+zBV2F3I+2rvmeLi7YeLgaJwetX//rExj7Or9FtLr2otrnRy/icTlJtl8ZekYbfUpmzMOKI9Ryg/PAFixm9IS2dISrEvc4XewqhRog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzhDQRPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzhDQRPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159F1C4CEEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746496936;
	bh=7ZicNrG4s8sFFE5fN56V0rVDMXcHO2l9sNZa2iMuxc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BzhDQRPwW9RYDsY8v9ygB/f9/BkOJnU9oc6yKqQ5qUoi9wtnSa44SmffHz2J1gu4T
	 et0PHIzzQa2jXYhD9/cA+DC7ogLXlX63oRBEXyNGNHd8N946HfiosQjd7OZ8Fxp754
	 wDNSx4ifJXFLFNkDId5IXztg1x8IfYGi5q0pXmGlQ6E3UcBdT97YAWvlE0uTcFgsef
	 wPrUIM+ASnGKYumsO9UlW3yJsk2PDEmvgprRoLJ7zvoANK6MESIx5+B21L4Nzshc9T
	 ON8nOEegKXPseWU117h31z1D105OJIRBiHC6hbNs7U3ubMK9V8h3IjSTc3PbAHewww
	 Ez1vIvD9b4koQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so862155766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:02:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMi20tT1fFiukXPyKi/F6BJrTCMvr4PSTdu538uyX5b/L+t1cx+SG2obDUAnxrt/xDe70juQWO1tpwCMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkLv7aVorf/qiJJkJnmJeYopH/CUGjTHoLuYD8B5y0IFJyfUR
	v7e1wPibgP2paPrU8hKsGwWMqPbN9M1JpyDQoP+1Epi3FKQbP/LxCpwt3iIf8Vbp5GvuKtruCxY
	YS+nhSeQgIN9mtjoVwjdDMbcvYPE=
X-Google-Smtp-Source: AGHT+IFYrIL7o0g2hkXOe1xhptWuO0GnCE6KxzUvPh9GUGU+31n0Nf/kMhQ2i9Scyp23jO1m5iZPB1wl00fsg3qaoq0=
X-Received: by 2002:a17:907:2d93:b0:ac8:1efc:bf66 with SMTP id
 a640c23a62f3a-ad1a4acf6eemr797420966b.50.1746496934644; Mon, 05 May 2025
 19:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415072118.3774454-1-chenhuacai@loongson.cn>
 <aANVMaepni3KeABI@kernel.org> <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
 <aBlkOBwIjvUDE0hY@phytium.com.cn>
In-Reply-To: <aBlkOBwIjvUDE0hY@phytium.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 May 2025 10:02:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7+Wf+tUBNs4-NASaJX0jzHjLN8r6Yq0yesTRqhsvUrww@mail.gmail.com>
X-Gm-Features: ATxdqUHQrdIue0S_3w101gUpGxWE3cr5V08DT0jRIiVXe8KyP5zdxOhYAczB6R8
Message-ID: <CAAhV-H7+Wf+tUBNs4-NASaJX0jzHjLN8r6Yq0yesTRqhsvUrww@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: Mike Rapoport <rppt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yuquan,

On Tue, May 6, 2025 at 9:29=E2=80=AFAM Yuquan Wang
<wangyuquan1236@phytium.com.cn> wrote:
>
> On Sat, Apr 19, 2025 at 03:57:16PM +0800, Huacai Chen wrote:
> > Hi, Mike,
> >
> > On Sat, Apr 19, 2025 at 3:48=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi Huacai,
> > >
> > > On Tue, Apr 15, 2025 at 03:21:18PM +0800, Huacai Chen wrote:
> > > > Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
> > > > numa_memblks from x86 to the generic code, but LoongArch was left o=
ut
> > > > of this conversion.
> > > >
> > > > This patch introduces the generic numa_memblks for LoongArch.
> > > >
> > > > In detail:
> > > > 1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
> > > > 2. Use generic definition for numa_memblk and numa_meminfo;
> > > > 3. Use generic implementation for numa_add_memblk() and its friends=
;
> > > > 4. Use generic implementation for numa_set_distance() and its frien=
ds;
> > > > 5. Use generic implementation for memory_add_physaddr_to_nid() and =
its
> > > >    friends.
> > > >
> > > > Note: Disable NUMA_EMU because it needs more efforts and no obvious
> > > > demand now.
> > > >
> > > > Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  arch/loongarch/Kconfig                 |   1 +
> > > >  arch/loongarch/include/asm/numa.h      |  14 ----
> > > >  arch/loongarch/include/asm/sparsemem.h |   5 --
> > > >  arch/loongarch/include/asm/topology.h  |   7 +-
> > > >  arch/loongarch/kernel/acpi.c           |  11 ---
> > > >  arch/loongarch/kernel/numa.c           | 108 +++------------------=
----
> > > >  arch/loongarch/mm/init.c               |   8 --
> > > >  mm/Kconfig                             |   1 +
> > > >  8 files changed, 16 insertions(+), 139 deletions(-)
> > >
> > > This is really cool simplification!
> > >
> > > I wonder if maybe we can take a step or two further and make loongarc=
h to
> > > share more code with other architectures.
> > >
> > > Is there a strong reason not to call numa_memblks_init() from
> > > init_numa_memory()?
> > > And more broadly, maybe loongarch can be even switched to arch_numa?
> > This is a minimal change for Yuquan, I will make it in linux-next as
> > soon as possible so Yuquan can continue his work.
> >
> Hi, Huacai & Mike
>
> Where could I know this has been merged in linux-next? After that, should=
 I
> re-push my commit "introduce numa_add_reserved_memblk"?
Now this patch is in linux-next.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20250505&id=3Dcb49fa125c0115824233ee3ef167af6c5c8b23db

Huacai

>
> Sorry for my unfamiliarity with the community rules.
>
> Yuquan
> > Switching to numa_memblks_init() or arch_numa will be done in future,
> > but need some time because some machines seem to need some hacks.
> >
> > Huacai
> >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
