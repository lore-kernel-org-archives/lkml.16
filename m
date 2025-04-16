Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07422F39B;
	Wed, 16 Apr 2025 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795048; cv=none; b=EjbVsovyqsy3yxi2zd0sx78C4AMh0pwwMkH0UUxpE+5Q/1YAfvv4rGuPDL3kNtN9NtnZ8k0zcKfmS4HBEonNSM+FiyaTvA0afIgIaRIshCRd1lRjdoUbT1RGJxkT4UTNeSh0rsd/tiJu/8uEQTBnoUSahqKa2Ccy7W/4bPGg8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795048; c=relaxed/simple;
	bh=StV2olwT7Dt4aQ3Bkz9Mx+HVIj71t7dm8/TEwIWprPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsWWYYLrKN8Zl1dti3P4sDRQtjW3+E5EB4LIJN1KSTdz27uIs0BzooONpeOQJZ9SuOa34d+R1fK5+ZTctfLApq1iO/cgMuH/hoefAM65kJ1eAJdHtcD0x5wy8uxcl754Q6Xla3bFWe8bMpvUkmDlwhoSFrE8As6H2dnHKJMHWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7WJDBAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7WJDBAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A100CC4CEEF;
	Wed, 16 Apr 2025 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744795047;
	bh=StV2olwT7Dt4aQ3Bkz9Mx+HVIj71t7dm8/TEwIWprPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M7WJDBAC/qDhzHCbewyyYv9pfmJi6frUSh2EfbdOaRQNyfwfZ6QeSvlP7m5D2F5Be
	 oDXr1FqnzjFHXYqbc613Gfl8nRwypLD7GQy7OUvLoUWwQiZ238FJ6/+n26GQh7GzPO
	 lGrChA0/REvqBmhfu1exOtAZ3ETptRUMvl1Vdg7k94fFFse0bi4wR0/+tLGWE8AuD2
	 Y4ptz6o+s2SkTvfTVaRxHT0EKltQ1/QxV7OtHMvMKqInlSd1v1Fr3PiIheH92sdWOT
	 Tg51vAvgR43zy4f4yLrPjnBaVG82WsLUiqo++8RLAao7trF5adKb3nppLrt/8nMvuI
	 ePgGErEOh/hWg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1194341366b.2;
        Wed, 16 Apr 2025 02:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHGwsP3DS60iz/OzzUKQbpSZdeiA18+k3dW06Kd7jJQ8xKQjPRmucSH0QIt9XPbE2oy73PIHw5Lwc=@vger.kernel.org, AJvYcCVNsgje0HRH0O+yTQDx9/LBvPTD/gN59WhejFQjWxRpqByw8wzL1vleEW9M+PLFuLAi48ed4b1gUTjaCVV/@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+YLResEhwxFkrhL6UhcGAJRHqqIVeGSQ5q7KseeGUnubnT9D
	DDS/vBkmgZsj3dwbvaf4r4iDA7RgZUzQAZaOMD45c1LlT+6y31e/GA2oBWZF74TOxDyG4aeTte7
	2Xr6URaidlyvFG7m2rJIePvSB3Ts=
X-Google-Smtp-Source: AGHT+IFOtXZt7ZRiiD92gaOUHrSW2j1Wsa8lEIRO7HLNAwDFdRnXG/WzhAGh/t1+msGc7W0XdTAnFP2+Y/r3iMgXeFI=
X-Received: by 2002:a17:907:7213:b0:aca:a162:8707 with SMTP id
 a640c23a62f3a-acb428799afmr94314466b.7.1744795046092; Wed, 16 Apr 2025
 02:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
 <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local> <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
 <21558466-962c-4fb9-953b-911d2a586cbc@lucifer.local> <CAAhV-H5mMFVbhuLD9FmarZs9x_gxGrFViw92-wkUmoX2AzMGHA@mail.gmail.com>
 <d49c78ec-1192-479b-a008-29c202eafac1@lucifer.local>
In-Reply-To: <d49c78ec-1192-479b-a008-29c202eafac1@lucifer.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 16 Apr 2025 17:17:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Oc4vwwp-BACNim8EJspQb5fB0+LS7nJ_z39Rsc1uqyg@mail.gmail.com>
X-Gm-Features: ATxdqUFDJoUmVbW9WsBPSJ7gBLRJ5HN4VFYf2HnUPJM4tjvPfIXhDhYQ2P6BYCU
Message-ID: <CAAhV-H5Oc4vwwp-BACNim8EJspQb5fB0+LS7nJ_z39Rsc1uqyg@mail.gmail.com>
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, WangYuli <wangyuli@uniontech.com>, corbet@lwn.net, 
	kernel@xen0n.name, jeffxu@chromium.org, Liam.Howlett@oracle.com, 
	kees@kernel.org, hca@linux.ibm.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site, 
	tglx@linutronix.de, thomas.weissschuh@linutronix.de, Jason@zx2c4.com, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:14=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Hi Andrew - can we drop this from mm so it can go through the arch tree? =
I think
> this is more appropriate, thanks!
>
> On Wed, Apr 16, 2025 at 05:11:20PM +0800, Huacai Chen wrote:
> [snip]
> > In V1 you suggested this patch to go through the arch tree. But I saw
> > Andrew has already taken it, what should I do now?
>
> Can you take in your tree please? Andrew should drop, I really feel the a=
rch
> tree is the appropriate place, as this is purely an arch change.
I will take it, but modify the title. Thanks.

Huacai

>
> Thanks!
>
> >
> >
> > Huacai
> >
> > >
> > > Thanks, Lorenzo
> > >
> > > >
> > > > Huacai
> > > >
> > > > >
> > > > > >
> > > > > > Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890=
be96182@lucifer.local/
> > > > > > Tested-by: Yuli Wang <wangyuli@uniontech.com>
> > > > > > Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> > > > >
> > > > > LGTM,
> > > > >
> > > > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > >
> > > > > But let's get some R-b's from the arch people please!
> > > > >
> > > > > > ---
> > > > > > Changelog:
> > > > > >  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> > > > > > ---
> > > > > >  .../features/core/mseal_sys_mappings/arch-support.txt         =
| 2 +-
> > > > > >  Documentation/userspace-api/mseal.rst                         =
| 2 +-
> > > > > >  arch/loongarch/Kconfig                                        =
| 1 +
> > > > > >  arch/loongarch/kernel/vdso.c                                  =
| 4 +++-
> > > > > >  4 files changed, 6 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/features/core/mseal_sys_mappings/arc=
h-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support=
.txt
> > > > > > index c6cab9760d57..a3c24233eb9b 100644
> > > > > > --- a/Documentation/features/core/mseal_sys_mappings/arch-suppo=
rt.txt
> > > > > > +++ b/Documentation/features/core/mseal_sys_mappings/arch-suppo=
rt.txt
> > > > > > @@ -12,7 +12,7 @@
> > > > > >      |       arm64: |  ok  |
> > > > > >      |        csky: |  N/A |
> > > > > >      |     hexagon: |  N/A |
> > > > > > -    |   loongarch: | TODO |
> > > > > > +    |   loongarch: |  ok  |
> > > > > >      |        m68k: |  N/A |
> > > > > >      |  microblaze: |  N/A |
> > > > > >      |        mips: | TODO |
> > > > > > diff --git a/Documentation/userspace-api/mseal.rst b/Documentat=
ion/userspace-api/mseal.rst
> > > > > > index 1dabfc29be0d..ef733f69003d 100644
> > > > > > --- a/Documentation/userspace-api/mseal.rst
> > > > > > +++ b/Documentation/userspace-api/mseal.rst
> > > > > > @@ -144,7 +144,7 @@ Use cases
> > > > > >    architecture.
> > > > > >
> > > > > >    The following architectures currently support this feature: =
x86-64, arm64,
> > > > > > -  and s390.
> > > > > > +  loongarch and s390.
> > > > > >
> > > > > >    WARNING: This feature breaks programs which rely on relocati=
ng
> > > > > >    or unmapping system mappings. Known broken software at the t=
ime
> > > > > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > > > > index 067c0b994648..54ed5b59a690 100644
> > > > > > --- a/arch/loongarch/Kconfig
> > > > > > +++ b/arch/loongarch/Kconfig
> > > > > > @@ -69,6 +69,7 @@ config LOONGARCH
> > > > > >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > > > > >       select ARCH_SUPPORTS_LTO_CLANG
> > > > > >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > > > > > +     select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> > > > > >       select ARCH_SUPPORTS_NUMA_BALANCING
> > > > > >       select ARCH_SUPPORTS_RT
> > > > > >       select ARCH_USE_BUILTIN_BSWAP
> > > > > > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kern=
el/vdso.c
> > > > > > index 10cf1608c7b3..7b888d9085a0 100644
> > > > > > --- a/arch/loongarch/kernel/vdso.c
> > > > > > +++ b/arch/loongarch/kernel/vdso.c
> > > > > > @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linu=
x_binprm *bprm, int uses_interp)
> > > > > >
> > > > > >       vdso_addr =3D data_addr + VVAR_SIZE;
> > > > > >       vma =3D _install_special_mapping(mm, vdso_addr, info->siz=
e,
> > > > > > -                                    VM_READ | VM_EXEC | VM_MAY=
READ | VM_MAYWRITE | VM_MAYEXEC,
> > > > > > +                                    VM_READ | VM_EXEC |
> > > > > > +                                    VM_MAYREAD | VM_MAYWRITE |=
 VM_MAYEXEC |
> > > > > > +                                    VM_SEALED_SYSMAP,
> > > > > >                                      &info->code_mapping);
> > > > > >       if (IS_ERR(vma)) {
> > > > > >               ret =3D PTR_ERR(vma);
> > > > > > --
> > > > > > 2.49.0
> > > > > >
