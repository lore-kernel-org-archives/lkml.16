Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98C1C6FEC;
	Wed, 16 Apr 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790044; cv=none; b=f+3pTlc3fZD6vpyAihhLYTVlFgAs5nw62nz0sDXtjF2QFwo5atPsHB9Uo8Clukl2gHzrtp7x4oydfhgj1U7n5dJibQGutddCOlq29UXS1FNaYn0zV3x0191pxWxe2J73vaFAcWfLAUSb8vgPpiM5Ggc9dIwKnGnj1Co4w+FAuLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790044; c=relaxed/simple;
	bh=X/q+bSdJRCkfdg4Za99CLYjq0EmAcEoPH+vEoAhTJe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFWH1Ti3KT+XLSVk2OfQ9NvQUGue3HT8Jd8q+wP2R3/YvWdgTU7OYJ+G96kT87wZ/C49hbM7pCCkXHdYGAO8g/jHVCqSUe0FtdqKGKfqgm1mP0DW4w8IA1BBxhp0y89k8wwC39xVuF4Kj1fuIyMkjVJ3Ir+kaqzuPGF6PRhAwr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKhxlz6D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKhxlz6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2889C4AF09;
	Wed, 16 Apr 2025 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744790043;
	bh=X/q+bSdJRCkfdg4Za99CLYjq0EmAcEoPH+vEoAhTJe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKhxlz6D5W/ke2kWbAnifKlT0SVcKnV0ZaDBVOZX9jt5sTNAMMWROIL1A03GHQteJ
	 l3Kh4z4+KJBfh9tVQkKrjtZ6QgQyi72jfcP4VDrl0rV+7llm1Cyg6rPJgaveoAEpkp
	 H2byMqx/K44uGJuwdmAWnGkOT5g5ipbJTZDlM94ZiLZ71191cOJuEoWJlfkDOgD0gM
	 bKGSzonoqoB/1XrYud5t9V21TFer7nagjimu+HpDRvYquS591F7MD+7piwtvRjRZoo
	 /nd1dOY/ylegwn2+gFIfewibX1S3tOQn1KYv+TJgI8uhuF+ImjxxbNdJps5mzN0SUu
	 ZIhFkXbc2RUkQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so9924590a12.3;
        Wed, 16 Apr 2025 00:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXG54323PgiuoF4eRhnY/VrWKyz2vTEUcrtFN0Dgh6ceEwtddZ4oLF23WYCqRUXGqEVOtm/SYrzvEU=@vger.kernel.org, AJvYcCXpKqPvo5j1JlLBv9p6nuzkp2fKqSnfKiwxZGz3K4BC/2hG63335/yb4hdRER2ME5YcSPdMMXwphxinE1TH@vger.kernel.org
X-Gm-Message-State: AOJu0YxpEvFGgCsVZnlB6ic81hic6RmuCMcXDoC6/YEt2gkBEFei1Gcr
	zKt6Y4GSMQsNg/k++WeYRpOW7M7k0yfm35XULBHmEnuTWno1onUdEf/tBJmCirCHkOS3jjGJSqm
	ncnbVcKZgp97YwWPIMpP7/zFxi/c=
X-Google-Smtp-Source: AGHT+IFPbQ/+0Kt3PqldkPRGr8J/mjDNM6g1HMxMFxDQkkIGy9rM2wtaLVWjay/J2gKGexhcIfpJSzp+PpKK6gwypHo=
X-Received: by 2002:a17:907:988:b0:ac2:912d:5a80 with SMTP id
 a640c23a62f3a-acb428790e4mr70967966b.5.1744790042113; Wed, 16 Apr 2025
 00:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com> <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local>
In-Reply-To: <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 16 Apr 2025 15:53:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
X-Gm-Features: ATxdqUEwJBQMW8ntRK1edUoWfQzA_dk_OHCsHaWC8kBUBAzVe0GJFA-poB1LYx8
Message-ID: <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: WangYuli <wangyuli@uniontech.com>, corbet@lwn.net, kernel@xen0n.name, 
	akpm@linux-foundation.org, jeffxu@chromium.org, Liam.Howlett@oracle.com, 
	kees@kernel.org, hca@linux.ibm.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, xry111@xry111.site, 
	tglx@linutronix.de, thomas.weissschuh@linutronix.de, Jason@zx2c4.com, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Lorenzo,

On Tue, Apr 15, 2025 at 11:53=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Apr 15, 2025 at 11:39:03PM +0800, WangYuli wrote:
> > Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> > covering the vdso.
>
> I've also checked and determined that, as far as I can tell, the loongarc=
h
> arch-specific doe don't appear at any point to rely upon remapping the VD=
SO
> or VVAR areas so sealing these should not be problematic.
What does "remapping the VDSO" mean here? There is a function
vdso_mremap() in arch/loongarch/kernel/vdso.c.

Huacai

>
> >
> > Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@=
lucifer.local/
> > Tested-by: Yuli Wang <wangyuli@uniontech.com>
> > Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
>
> LGTM,
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> But let's get some R-b's from the arch people please!
>
> > ---
> > Changelog:
> >  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> > ---
> >  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
> >  Documentation/userspace-api/mseal.rst                         | 2 +-
> >  arch/loongarch/Kconfig                                        | 1 +
> >  arch/loongarch/kernel/vdso.c                                  | 4 +++-
> >  4 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/features/core/mseal_sys_mappings/arch-suppor=
t.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > index c6cab9760d57..a3c24233eb9b 100644
> > --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > @@ -12,7 +12,7 @@
> >      |       arm64: |  ok  |
> >      |        csky: |  N/A |
> >      |     hexagon: |  N/A |
> > -    |   loongarch: | TODO |
> > +    |   loongarch: |  ok  |
> >      |        m68k: |  N/A |
> >      |  microblaze: |  N/A |
> >      |        mips: | TODO |
> > diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/user=
space-api/mseal.rst
> > index 1dabfc29be0d..ef733f69003d 100644
> > --- a/Documentation/userspace-api/mseal.rst
> > +++ b/Documentation/userspace-api/mseal.rst
> > @@ -144,7 +144,7 @@ Use cases
> >    architecture.
> >
> >    The following architectures currently support this feature: x86-64, =
arm64,
> > -  and s390.
> > +  loongarch and s390.
> >
> >    WARNING: This feature breaks programs which rely on relocating
> >    or unmapping system mappings. Known broken software at the time
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 067c0b994648..54ed5b59a690 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -69,6 +69,7 @@ config LOONGARCH
> >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> >       select ARCH_SUPPORTS_LTO_CLANG
> >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > +     select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> >       select ARCH_SUPPORTS_NUMA_BALANCING
> >       select ARCH_SUPPORTS_RT
> >       select ARCH_USE_BUILTIN_BSWAP
> > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.=
c
> > index 10cf1608c7b3..7b888d9085a0 100644
> > --- a/arch/loongarch/kernel/vdso.c
> > +++ b/arch/loongarch/kernel/vdso.c
> > @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm=
 *bprm, int uses_interp)
> >
> >       vdso_addr =3D data_addr + VVAR_SIZE;
> >       vma =3D _install_special_mapping(mm, vdso_addr, info->size,
> > -                                    VM_READ | VM_EXEC | VM_MAYREAD | V=
M_MAYWRITE | VM_MAYEXEC,
> > +                                    VM_READ | VM_EXEC |
> > +                                    VM_MAYREAD | VM_MAYWRITE | VM_MAYE=
XEC |
> > +                                    VM_SEALED_SYSMAP,
> >                                      &info->code_mapping);
> >       if (IS_ERR(vma)) {
> >               ret =3D PTR_ERR(vma);
> > --
> > 2.49.0
> >
