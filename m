Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5525257426
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749992; cv=none; b=WbwQL8uOay4QrK3dvUsLuyFS/Ce0BpM4xTRKkj4eaMMEIxwHDzMAOYSUlJ4Hh11Z/R/zi+WneodTg9XaRWHnAdXNTdk0G7FsYKg3yuicWL6IBCz89l4qgRDV3cFNkmMWY9M0yD7qWLv4ZKME5b1PLDT/BmLIZ916qfGKhdACuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749992; c=relaxed/simple;
	bh=TygAyc8ZcamwcaK7R4ldaqjD/sb+gNyDwakhRjNo3Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulsFMkOKMW1gxxjmMLNtvxgviXktbuB0bD8lzmnWXzdUQ5ilAHDqLbendzypg+BO2p5mKlT7/74k9RKIxIsO9rryXbihSZi5in6b+kOKdWZGGHZ6nk+Mzr4QnDU6HjvYvLXXI1O7TN+1Uk0aD9OLW1riL/9MQrb/uj6fQ/sxiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jibk6yjx; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jibk6yjx"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72b938f6014so356176a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744749987; x=1745354787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=Jibk6yjxEJ5kBPWKSm8G5V8pxgYtwwfDtD8VaX2T41RZCkMdHsmhAkzCskyHxfywjp
         WRl6ml709hO38lFn+o1POmPSBQN5vjMzNLNJCLbnBx2ip/yCBeSMbSoPW8nHUrVV79rb
         Tik5rbPlKaSlqAivcqqeP6edbMWohqkFG4Zmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749987; x=1745354787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=FRwBNEADI+iAEYNR5NHxPDkbO4fWKuxg4n003F6nXfSj26ynFhmXH2YKknRsTXgbDY
         OBs8T9QiyNesMvb64pDQXM+M+sX91M2m6VZgafEs2A5mlNBR6ojNIj6TfaMG6tr8g7yp
         udiw6JNJj5Ti8m1Jp087qQx1WfaGkTJwI7u2V6wucMJScnWJqxyey6I8SfUewCHNrnVY
         L0026qnaJ0rNBoV+uAENQkatNrPFpeZlZ4M4tCvfo3t3CSHtRaGHlN2FLPW6ATDwG7O6
         4lJMrvR3TvDFkW8ou8VUknjleYNWCpTcXX/L7tMrLVBGYbG6JGnQd5AKGN+OCcBcwfQ/
         1Ynw==
X-Forwarded-Encrypted: i=1; AJvYcCU6T2IJF5n9IrGBlAtPplRdL2CY7IGoeYuDPZdMwlX4LZRbCgk+tZJPWQuRfOfy3a9AC6U3bIjkv2zit/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhtD9e9kf8V5nMr3O8vYIIut9e1OaE7BOM6A5b/j3CJ+5uAU/i
	W4KGOr636Ri3G2QFLe5XMUGykZg5vxbprkCQw4BkcSTWujsNa78rqJ/b3hSTkAFQyqL3xl7+KJ/
	jri2MoLyvCn61lD1O7UrHysNYSSBljMQbwVBN
X-Gm-Gg: ASbGncsJDOPVRacfAPIijK7Idb3pLJ/+S0OQEP7zCrvtUmZIJYnmfFxenpykt9xVR9+
	dN0jAiwZsA8OL/tV9pPfEJJNe6W2KA9Ujvw/Ei8oxDDqdMMzOtSYg82rn867GRRCsNEdc/9gffR
	J5DCb8jXifo1+OOnK/7OzWzYH7jbYq6nd85YNIwOWHK3BXJahtaQ==
X-Google-Smtp-Source: AGHT+IF1laZWfAr2YIqlDARR+3dKjqHrGIZm755fOrYIwd7mc6DGetjqrkzit1gFufVSqqgi3FL0ISL0YLiHKXN9uFo=
X-Received: by 2002:a05:6808:1582:b0:3f4:210e:c0f2 with SMTP id
 5614622812f47-400acc3f649mr216633b6e.0.1744749986835; Tue, 15 Apr 2025
 13:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
In-Reply-To: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Tue, 15 Apr 2025 13:46:14 -0700
X-Gm-Features: ATxdqUEmIxsEAScvJDNIReMH4unvMuy3JinsyoEKeBkvV32K_0n2IQ9VdZ-tyfo
Message-ID: <CABi2SkV2v-48Mhn9qLzx08KatToWMpgc63HAWn8RKe8Y8HXWPA@mail.gmail.com>
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de, 
	thomas.weissschuh@linutronix.de, Jason@zx2c4.com, zhanjun@uniontech.com, 
	niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuli

On Tue, Apr 15, 2025 at 8:40=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.
>
> Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lu=
cifer.local/
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
> Changelog:
>  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> ---
>  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
>  Documentation/userspace-api/mseal.rst                         | 2 +-
>  arch/loongarch/Kconfig                                        | 1 +
>  arch/loongarch/kernel/vdso.c                                  | 4 +++-
>  4 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.=
txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> index c6cab9760d57..a3c24233eb9b 100644
> --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: |  N/A |
>      |     hexagon: |  N/A |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: |  N/A |
>      |  microblaze: |  N/A |
>      |        mips: | TODO |
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/usersp=
ace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>
>    The following architectures currently support this feature: x86-64, ar=
m64,
> -  and s390.
> +  loongarch and s390.
>
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_LTO_CLANG
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
> +       select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>         select ARCH_SUPPORTS_NUMA_BALANCING
>         select ARCH_SUPPORTS_RT
>         select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *=
bprm, int uses_interp)
>
>         vdso_addr =3D data_addr + VVAR_SIZE;
>         vma =3D _install_special_mapping(mm, vdso_addr, info->size,
> -                                      VM_READ | VM_EXEC | VM_MAYREAD | V=
M_MAYWRITE | VM_MAYEXEC,
> +                                      VM_READ | VM_EXEC |
> +                                      VM_MAYREAD | VM_MAYWRITE | VM_MAYE=
XEC |
> +                                      VM_SEALED_SYSMAP,
>                                        &info->code_mapping);
>         if (IS_ERR(vma)) {
>                 ret =3D PTR_ERR(vma);
> --
> 2.49.0
>
LGTM, thank you for taking care of the documentation as well.

Reviewed-by: Jeff Xu <jeffxu@chromium.org>
