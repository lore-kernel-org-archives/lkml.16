Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6521348;
	Wed, 16 Apr 2025 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794692; cv=none; b=YhCFMyRxj6iXdItpMaRU27rV7B3U+6wSgVb7qsC9U3AqejoutFDH5eFtqZ12x55+kLamFqHIG8VYqk40+EReHu18ZbvWdPx2gVcWHemlAqjkTgKZ3OBXwxsTgkftEuv+wcAYHdXQamM+FZRv0pUj9vvAB+JJx1BeQ/Elq4K60b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794692; c=relaxed/simple;
	bh=wLGyV7a5Hi5V/ypISDeER+L01AquM3uY/6AU53q2l2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3S4CJIRVAxBUc8T1m9dCRnY/H/yKEGhyVR/Ne/tqUrFH8MVknkql8BHhUVRRpZI2tZB4Uma+5sF301Hk/BABFIPM5YwmIgThIuThZ7NQe0j2hR4fYQqpdqJMb0EfuaTKzuMoRNo3pj0/yBy68Kwng8/Hc68vVHUxlsHAEh0QZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfxuEtrV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfxuEtrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA887C4AF0B;
	Wed, 16 Apr 2025 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794691;
	bh=wLGyV7a5Hi5V/ypISDeER+L01AquM3uY/6AU53q2l2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MfxuEtrV4pQ4NrnOa3qbttAMo0ALwQNZ5svwI798DU1HrVSMYaiOLjgZ05z6yOZp3
	 5X1Bfzl7xdXgLAbkz0JswfhA/pjaSIn9t89s4ycEJOu87anF4pnM5vH2iY0RqhbsM1
	 AcUsWuRf4TTznKndf3DfvgFWOhJxxSEDZYsddq2iOgl59egkEh0PWckLODrxMOcT54
	 9lzsuUVhJamBnRQmIVdyQ1w+OEA4X0skAcA7K5c2MQs1UF6Ig3eCFibyT2/C0iadJA
	 s+icRZYNxVzPwJVaH7HcZmHlaDUQp7TGMy9ZguLaIhTCPcGLUpO0CqLpKHUkQad3rS
	 RbqJ/yrxj9vHw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so11153723a12.3;
        Wed, 16 Apr 2025 02:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIpvIHsTAd5wt32/X3zWFVT6EottJG0fy0zwDCgPvt1Yexqye/0a+5Og91AzKkB6OuBqH7vwRFEn8=@vger.kernel.org, AJvYcCVzQ9jqg13PjL9h9DILwSrYSD3+XZL0XtJVCpV0PjDkFt8EDbHWe0bhh4Sh65YMBsJ2WJ0hXYyPfAo/FijS@vger.kernel.org
X-Gm-Message-State: AOJu0YygdM2VUvlaSZ9eOqOefJyu76rOwWjlICnRj+5YHYNKHO3RP/2Q
	9M+fEwIusd9YTRzuOLZm18ldUcgJiKVcx7SrOj6h2zA+irjE7YDNuLotEMOBoBN28MBzGO81AY/
	F+nrZfQU/WVZI6gTsoFSy+29B26c=
X-Google-Smtp-Source: AGHT+IFllZ5Kx0iUUBPCKH3xoyv1uWsRhM8YwgKhk4S8jfxxet3Q82qVDmmKZGzLfml1RmyISqEzurefebCprAPLHQc=
X-Received: by 2002:a17:907:788:b0:aca:cb18:9ad0 with SMTP id
 a640c23a62f3a-acb42aeda26mr90165266b.45.1744794690057; Wed, 16 Apr 2025
 02:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
 <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local> <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
 <21558466-962c-4fb9-953b-911d2a586cbc@lucifer.local>
In-Reply-To: <21558466-962c-4fb9-953b-911d2a586cbc@lucifer.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 16 Apr 2025 17:11:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5mMFVbhuLD9FmarZs9x_gxGrFViw92-wkUmoX2AzMGHA@mail.gmail.com>
X-Gm-Features: ATxdqUHCx64vrBm-0pWo4Dh-VGlZFHhZaT6WIWJAFkJbRuWHB19TIvWTSVKZFdQ
Message-ID: <CAAhV-H5mMFVbhuLD9FmarZs9x_gxGrFViw92-wkUmoX2AzMGHA@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 4:03=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Apr 16, 2025 at 03:53:51PM +0800, Huacai Chen wrote:
> > Hi, Lorenzo,
> >
> > On Tue, Apr 15, 2025 at 11:53=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Tue, Apr 15, 2025 at 11:39:03PM +0800, WangYuli wrote:
> > > > Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> > > > covering the vdso.
> > >
> > > I've also checked and determined that, as far as I can tell, the loon=
garch
> > > arch-specific doe don't appear at any point to rely upon remapping th=
e VDSO
> > > or VVAR areas so sealing these should not be problematic.
> > What does "remapping the VDSO" mean here? There is a function
> > vdso_mremap() in arch/loongarch/kernel/vdso.c.
>
> It means remapping the VDSO (and VVAR) since VMA sealing prevents this. V=
MA
> sealing means that you map, and that's it until process tear down, more o=
r
> less...
>
> I mean this is the thing, in my view, anybody enabling a feature that
> prevents you from doing X with Y should understand that this is the case,
> and explicitly state that no - it appears that we don't need to do X with
> Y - in any legitimate operation.
>
> It seems that so far, I am yet to encounter anybody enabling this feature
> who does. Which is concerning. But by the by. I guess I will continue to
> have to say the same thing to everybody and then go check it myself each
> time :)
>
> Anyway, what you're referring to is a hook that is invoked when _userland=
_
> tries to remap the VDSO, which will now be prevented, if the user enables
> this feature.
>
> So those using this feature will break a bunch of userspace, namely anybo=
dy
> who wants/needs to remap the VDSO/VVAR etc. examples are CRIU, rr, etc.
>
> So this is fine.
>
> The problem would be if the _arch_ code itself needed to remap or move th=
e
> VDSO or VVAR around. This would be odd, and I think we know of only one
> case (and even then it's uncertain), but it's important that people
> explicitly check this.
>
> _As far as I can tell_, loongarch doesn't need to do this so it is safe t=
o
> enable this there, given the feature is opt-in.
>
> But this kind of concern is precisely why we need arch maintainers to che=
ck
> this.
>
> I did insist on these limitations and concerns being placed in the
> documentation and Kconfig entries so people are aware on review.
OK, I know.

In V1 you suggested this patch to go through the arch tree. But I saw
Andrew has already taken it, what should I do now?


Huacai

>
> Thanks, Lorenzo
>
> >
> > Huacai
> >
> > >
> > > >
> > > > Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96=
182@lucifer.local/
> > > > Tested-by: Yuli Wang <wangyuli@uniontech.com>
> > > > Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> > >
> > > LGTM,
> > >
> > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >
> > > But let's get some R-b's from the arch people please!
> > >
> > > > ---
> > > > Changelog:
> > > >  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> > > > ---
> > > >  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 =
+-
> > > >  Documentation/userspace-api/mseal.rst                         | 2 =
+-
> > > >  arch/loongarch/Kconfig                                        | 1 =
+
> > > >  arch/loongarch/kernel/vdso.c                                  | 4 =
+++-
> > > >  4 files changed, 6 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/features/core/mseal_sys_mappings/arch-su=
pport.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > > index c6cab9760d57..a3c24233eb9b 100644
> > > > --- a/Documentation/features/core/mseal_sys_mappings/arch-support.t=
xt
> > > > +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.t=
xt
> > > > @@ -12,7 +12,7 @@
> > > >      |       arm64: |  ok  |
> > > >      |        csky: |  N/A |
> > > >      |     hexagon: |  N/A |
> > > > -    |   loongarch: | TODO |
> > > > +    |   loongarch: |  ok  |
> > > >      |        m68k: |  N/A |
> > > >      |  microblaze: |  N/A |
> > > >      |        mips: | TODO |
> > > > diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/=
userspace-api/mseal.rst
> > > > index 1dabfc29be0d..ef733f69003d 100644
> > > > --- a/Documentation/userspace-api/mseal.rst
> > > > +++ b/Documentation/userspace-api/mseal.rst
> > > > @@ -144,7 +144,7 @@ Use cases
> > > >    architecture.
> > > >
> > > >    The following architectures currently support this feature: x86-=
64, arm64,
> > > > -  and s390.
> > > > +  loongarch and s390.
> > > >
> > > >    WARNING: This feature breaks programs which rely on relocating
> > > >    or unmapping system mappings. Known broken software at the time
> > > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > > index 067c0b994648..54ed5b59a690 100644
> > > > --- a/arch/loongarch/Kconfig
> > > > +++ b/arch/loongarch/Kconfig
> > > > @@ -69,6 +69,7 @@ config LOONGARCH
> > > >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > > >       select ARCH_SUPPORTS_LTO_CLANG
> > > >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > > > +     select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> > > >       select ARCH_SUPPORTS_NUMA_BALANCING
> > > >       select ARCH_SUPPORTS_RT
> > > >       select ARCH_USE_BUILTIN_BSWAP
> > > > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/v=
dso.c
> > > > index 10cf1608c7b3..7b888d9085a0 100644
> > > > --- a/arch/loongarch/kernel/vdso.c
> > > > +++ b/arch/loongarch/kernel/vdso.c
> > > > @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_bi=
nprm *bprm, int uses_interp)
> > > >
> > > >       vdso_addr =3D data_addr + VVAR_SIZE;
> > > >       vma =3D _install_special_mapping(mm, vdso_addr, info->size,
> > > > -                                    VM_READ | VM_EXEC | VM_MAYREAD=
 | VM_MAYWRITE | VM_MAYEXEC,
> > > > +                                    VM_READ | VM_EXEC |
> > > > +                                    VM_MAYREAD | VM_MAYWRITE | VM_=
MAYEXEC |
> > > > +                                    VM_SEALED_SYSMAP,
> > > >                                      &info->code_mapping);
> > > >       if (IS_ERR(vma)) {
> > > >               ret =3D PTR_ERR(vma);
> > > > --
> > > > 2.49.0
> > > >
