Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5B8635B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794796; cv=none; b=HssO668PGAmizpDlti6/D6Ptt5QR95WxBigOqh5CeARMiiu/qkPhQpELZhGSf7KBPHQuEwwm1fI3fGAT52U/DS8a90zzBK8Oq661URX329usLZhIto+AVMOr2LOYMriN7xIfem1K364lky1+MJESwqQn8jeOVtVFxdcH2aegS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794796; c=relaxed/simple;
	bh=mQVRJD/05Itehd9MtTEEq2cthgYKl7gTh+wqh7fS93c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9Z9qE04eTbjzVD7rLCbpVBREJaenkeTjC1mNtwWsm4dHzKKr9VMvioc4Rbf/L61IBPkWeXJ+qsZPRqymNytMTcoGTe4hEzmYXxsuW40BPDuZeRNnpk7WSairZcbLlxWR40nQ4rPnHZlfycXSAWzTflboqs/QVbOXkgFGVhyePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5314d78e74fso659730e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751794792; x=1752399592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjnVbnikM6LXvEzzZHZ60x+VCLdIvjuoXFVN9qPH50o=;
        b=EH/W/EUildqzfgjGDSBlR2HOWlfNgkUx8Jo7rwUWMpZx4snMvBTWMW0deR2hi+6GBr
         Y7hw+mZQeJ6FJqV/7S22sJfnuCp60Hlr7HA1DdIGLRSxyDAP6IDCtkLzxlCtu38wg9LP
         eHeZnFLiC6ClXk8fJ7PG0HQhttaYE+klpsAXax73r3AH4AYqM7p4hpDzUUBcIIlHNRtH
         VTD68yLOJgZIDn6XtMQw7a/RIgXukQ2MP1w216NLA3URV5Abf29IzTdkw/MSO72r5ZqZ
         dMhH0OUv4U0I00u/EP1CKgBiCeG4vd4I2n0VvbybDuCtkDaydVQIvIVu1aLxYIVPfdYl
         +ERg==
X-Forwarded-Encrypted: i=1; AJvYcCVmIiptxxydi7Gpx7Z68j/UXP3BzbhDLY6F7h8Lm2/ZTzZ5KG7MHnWTfLmcGmAftL07FrGsU0VD6y2DqEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxYoMuxMzNHz9eifHNm9FLRBiK8uJfcPVYj2XL4DzBPLytdCP
	3s3CdSI+OkVRZrbzuinPJxWobaEYF/xYTl3DCxJL8V84ppyhL2d6EVSlN9lvyoYW
X-Gm-Gg: ASbGncvgiR6lR/1qCEKjjscmjDTzkEJwSzxcITEpf3s8pxb7Q1/g2OTz84l7YaOGLhs
	a/vPhicevmYdbvhFL4RghPvXu8x1lJDLXE/LVvJQRU3CySEj5a2hZJuCm/5ByGmpzwER2fkjM3D
	GVFAoXGkqIonUeb05KcymisgOuTbOLrmW0luTRvsjT0MNkwPscrQwKnMAU1RhclKBGF66oaXIzd
	x9sWhVqmVM9WqzujqpOXDp7ntK1NlwfTKo7MvDw9uRhTKmG7HG3oCHZtn15lN2C6OBR9766/IT/
	Ld5zT2IshZCM5TdsWmqEf2U9DFZrRQCDikA91gVmd45ACeK+o+VntDnP0fL6zyR7aeE0GeeZK5e
	PK0BZYVawzFfCVcth8GXJuOQM
X-Google-Smtp-Source: AGHT+IEmHwdFSgyxOtkqBcxzpjBz5/eX675R/wJB8VjAbFCv+SLnsRjdPEILzkWqhxTSDjmsXoex1w==
X-Received: by 2002:a05:6122:3d44:b0:531:2afc:462a with SMTP id 71dfb90a1353d-5347e4a7c9fmr5397115e0c.3.1751794791738;
        Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-534790aad4esm870331e0c.39.2025.07.06.02.39.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87f2ba094dcso420406241.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHEkpdRQarixjnrWE0XFphO0Xp32tHxVOwR3Orjngr8TubRJ4/KpwSIeF3IRg4ZXjG8xpu5UPA2hChOOE=@vger.kernel.org
X-Received: by 2002:a05:6102:3f56:b0:4e9:b0d4:1133 with SMTP id
 ada2fe7eead31-4f2f23f8c1fmr4901561137.20.1751794790891; Sun, 06 Jul 2025
 02:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611114056.118309-1-thuth@redhat.com>
In-Reply-To: <20250611114056.118309-1-thuth@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:39:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGQfHJMFydTWE=adavrzeoSdzP_n2ht_Co96z_7M6GwQ@mail.gmail.com>
X-Gm-Features: Ac12FXzR66yOpKegCjVjpoxMzhZQsAXs5Ry7pu0ZIFAAJrtDwSqC4tfQbM2Zo3k
Message-ID: <CAMuHMdWGQfHJMFydTWE=adavrzeoSdzP_n2ht_Co96z_7M6GwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
To: Thomas Huth <thuth@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>, 
	Sam Creasey <sammy@sammy.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 13:41, Thomas Huth <thuth@redhat.com> wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
>
>  https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>  https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>  https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>  https://github.com/riscv-software-src/opensbi/issues/199
>
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
>
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
>
> The x86, parisc and sh patches already got merged via their specific
> architecture tree:
>
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
>
> So I assume the m68k patches should go via the m68k tree.
>
> v2:
> - Split the m68k patches from the global series
>   (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
> - Rebased the patches on linux-next and fixed the conflicts
>   and new occurances of __ASSEMBLY__
>
> Thomas Huth (2):
>   m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>   m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
