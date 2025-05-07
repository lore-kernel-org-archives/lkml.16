Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5F28D830
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634727; cv=none; b=SIK8nMMIhcFKS2NMooTP0/OiqIZM3hz8GEDLVjc7olCPXkQu56H50UBd1w7TY3dvJNqMiMSHjXY1/QnaLyNk7Fvf/3v1WADNEBXTFa5TKaGL9yao1UzmyXfYTFg99mTh03xOw9O9SNnCS+68FVF25/LAyjvQL2WTTw/Pgg0co0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634727; c=relaxed/simple;
	bh=GAluGqfyPVe5W1Jb76fUKRLKd/fw8v+iz9cq2F95mDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw8Xbs3TX7j0oJc9HNMH8p5MUfdmCTEktEWx0Kp3CuYI2ySZGAOoB9EFLTdxeU4mOB192S5JJtCycYfc4U9ND+6uG+UFTGwMmcJXXGzaYpOMAhGeWYWHqCvO1MTC3td7TfkbN5QMQ59hMBa8c+exoAMOwEGjgfGHE2f9nVD/nIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=js9Sc0e7; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="js9Sc0e7"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2cc9045bae9so10069fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746634723; x=1747239523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upjViEFaEDV8pwi3bE89UDVAqHk4uCfII2dkKtqh7XQ=;
        b=js9Sc0e7Hf01XcLLk4uuEPT1dbyOKDXVmRwbgYV+XDauuuCgMMMGWwwtM3GyLd2Cxx
         uTGGn7SL88ATBe0poCyGefLuA17+1En+a/yIhFzo8d0TtX15EcrW64mqXEtIOFa4VroH
         2kwS0nEn3qyzj+WSoTW7CAYCi03VK/vzyrQto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634723; x=1747239523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upjViEFaEDV8pwi3bE89UDVAqHk4uCfII2dkKtqh7XQ=;
        b=mV+vLuXRf6H1bMeKjsn9kRaHfifPnRzwqCEO8Prmcc72sbG1+rodQp6S/xdW8hZt4D
         yalC9Bp1JGohEeutOjfhoh5KhI7+iZnGSx/badhNzAkDfA9su8zQq/F0Yu3xyWwBVVrI
         lIYPFr//MLFI474ZfKOlheAwSYLr1O3Aw33GekO+kMXUr1p0rHSlSO21nXGqUtA+XEkt
         jnBekzwysHvEGkul5/vjeKrI5eqTZ/biEDatrKN5GeDCn2aVwXS7jTspFFiSaD9lvFj1
         cAgMU68stXZAv7yB4ln1vvdeEvKVGsgFkB/3OFrMqaJWN/9ksVDYyFpgBCXIT6fNd7rW
         DP1w==
X-Forwarded-Encrypted: i=1; AJvYcCWUDRd1j6awgYpnFgO8251iqm1Fmmvzo+Tv6u4/8qfeW86X/MJ+py9RwvvUl4doifiNCsKBwi7waDdOLZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gJctxDa7+Nh2t5KgYSpLiBNfr/fzfOC7Z4lb6jTH/Ik5xs/K
	SaFAPwojHx2R2l15h+KVffPxKXBQQB1o1RxesLd9bCCM26RBZtDQdl//BuRUbpgxTOkY5yH9ZMk
	Kyk9gyp/OJ/kqjekCK1tBvBPLFBB8gX85aFDF
X-Gm-Gg: ASbGncvIhsW3bQTUXjjM9QTo+z+SvpEJw0LskHYLBbLX7z3/3206fvDoLIm0CtY9Wln
	Nr83mKwmxYN2EefmudjQR2Luf1q3j2p950DQLM9I5kjX4e+ii1rxch74ansLafnZMMqdTB7Zhnn
	SjhuEmOskYoNJULaGMtwbI+zathUUWtVeDVnO/PWXmLQ4Q/6/Y5qY=
X-Google-Smtp-Source: AGHT+IG06GO6NGnzHXdYuy9FYMZzPpX9XA6RRfNjedz05neS+lqG6xqVuI1NQA+Rq9jjZ9XV1xQ99xAxsvZLr21m4So=
X-Received: by 2002:a05:6870:891b:b0:2d5:d5f:3b0f with SMTP id
 586e51a60fabf-2db5c110bc3mr836147fac.12.1746634723111; Wed, 07 May 2025
 09:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426135954.5614-1-jszhang@kernel.org>
In-Reply-To: <20250426135954.5614-1-jszhang@kernel.org>
From: Jeff Xu <jeffxu@chromium.org>
Date: Wed, 7 May 2025 09:18:31 -0700
X-Gm-Features: ATxdqUEg19PZX8xAL4phcTTjEkVkJGWGNXEx6VSuIyaRIyEHgGAoYnTs8-k6z_o
Message-ID: <CABi2SkXJgeLLYQEp1c7EepYzpGU+d0TsOZ5ix6PUUmJLuHyvwQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Kees Cook <kees@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng

It seems mm maintainers might prefer arch change reviewed by arch
maintainer and goes to arch tree, according to discussion in [1], I
don't have an opinion on this,  adding mm maintainers as FYI.

On Sat, Apr 26, 2025 at 7:16=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
> vdso, vvar.
>
> Passed sysmap_is_sealed and mseal_test self tests.
> Passed booting a buildroot rootfs image and a cli debian rootfs image.
>
mm maintainers like to get confirmation that the arch doesn't rely on
remapping the VDSO, VVAR, or any other special mappings, see
discussion in [2]

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Cc: Jeff Xu <jeffxu@chromium.org>
> ---
>  arch/riscv/Kconfig       | 1 +
>  arch/riscv/kernel/vdso.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Please consider updating document as part of your patch:
features/core/mseal_sys_mappings/arch-support.txt
Documentation/userspace-api/mseal.rst

Sample change in [3]

>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bbec87b79309..3cb0b05eef62 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>         # LLD >=3D 14: https://github.com/llvm/llvm-project/issues/50505
>         select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >=3D 140000
>         select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >=3D 140000
> +       select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
The "if 64BIT && MMU" are not needed here.

MMU is not checked by MSEAL_SYSTEM_MAPPINGS, which we should,  this
can go to security/Kconfig separately. If you'd like, please submit a
fix to mm tree directly.

[1] https://lore.kernel.org/all/7EB087B72C4FBDD3+20250417132410.404043-1-wa=
ngyuli@uniontech.com/,
[2] https://lore.kernel.org/all/3de559d6-be19-44bc-ba8f-4c52d4bca684@lucife=
r.local/
[3] https://lore.kernel.org/all/648AB3031B5618C0+20250415153903.570662-1-wa=
ngyuli@uniontech.com/

Thanks
-Jeff

>         select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
>         select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
>         select ARCH_SUPPORTS_RT
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index cc2895d1fbc2..3a8e038b10a2 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -136,7 +136,7 @@ static int __setup_additional_pages(struct mm_struct =
*mm,
>
>         ret =3D
>            _install_special_mapping(mm, vdso_base, vdso_text_len,
> -               (VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXE=
C),
> +               (VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXE=
C | VM_SEALED_SYSMAP),
>                 vdso_info->cm);
>
>         if (IS_ERR(ret))
> --
> 2.47.2
>
