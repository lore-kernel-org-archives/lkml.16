Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A8BA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249460; cv=none; b=ierrFBSs4nCwtM7jIM5i3keY5fuOmS/3l/bqwQt/SVH+NFBqtjuaOPLA6TnHAqW1SLDUjsd6DhvwL3OoetIAxlpSppLvWoKPcvBMVUUKgvFqzmQDZLGmf+I7UsvojQDATjT8KTFb6ocN5pH9+hX5dLCHWh2euCpjzegUmwgSwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249460; c=relaxed/simple;
	bh=fu2iOhC+qbyZ/jgDFGRRUBpkouZEbDrHc7PS1K+eMSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUbOmu9kybAdUteanBb7iirmDdZjPpuX5HF5GMLWxzVw11NF/8MmiMMumqbBPjLSFv5rNYcp6piu8Qqtbhtrg9Ug4VMqBUoKavxaQrC06qh3hOGNZoroSqydG2FZMe663alI++urc39n2s7bZgmpntlS53xOGmE90CMSoQ9mSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ijhi+imM; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ijhi+imM"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feaedb4d2cso168434b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744249457; x=1744854257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+1nWiIvalqOLc+OzrZ4hQkFF2O+RDbE0Xdy0fdgijw=;
        b=ijhi+imMsM+V3hDV5c9DpcO+qyyAbOMYXsQgnC7zuD+oYDdxqasOaNvAZmrPIhePLz
         mLI2+jfZUB9BNhjQyYzccORuM/olnYwIo7SBbwg2FjMNrtYYcKdthS8CjcRkVnNCBhoa
         0Iy0fpOe9PgRhDAs2vEpXBed93ZZk7pS8NKzflWbUbTM2cVh9BylLLGjP+Ut8WEIPHJw
         xD1cv68bSoHWJp+6lVYLhz7TDbk/HeBGyOgJw6nmykYui5d5tRAvM2v/yTLgGrfSpW+w
         gTaf1TTXzU4foL6kxUb81Vvsb98Ai2Lq+JtkHK3xID0w+ynMvFAJ8fI1YEcWoIEceDb0
         uB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744249457; x=1744854257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+1nWiIvalqOLc+OzrZ4hQkFF2O+RDbE0Xdy0fdgijw=;
        b=dAFy7jFV0aTPXhUuVGo9m53XfOHEEDAupvA49jzjukNxhr07aowXvE5+uE/4OkCtiI
         s8wayISHdIgR893NQYy+6IsZ2PezR/vinrS7rqpatElmJhWsDrZgEKKvnrFvR/bNGv5r
         /8LjSeLOeoILpgn3BJfCQFqYd6VMMr6/H66NPHZOfqbjNU13Fq6k0GxSwzpJvhiNArqm
         F0OykJHbhbhnZJgjNgR7mqMGTGa0YaLnrx7M1Jpx45HyZuFx3H1bvPjtcJGzzuYTP0cS
         7RJaZV7h53SpQHSm4FL5nbfivb8pKCOmcNnF5esTwD0EABDwtZdE4AFqr/RRyDjl9P/j
         HaYA==
X-Forwarded-Encrypted: i=1; AJvYcCW3EUWGAykVBvRNwVrtGBQBElAy7U3On04tcqgZmmyXkgObVsVrPl00uEQvWWpibvUEaHTbwtVxEa10eyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTrGYfAMz88RWWPoCE/54zJGOwsx2ZBBXCiz1Pt6LOLGj/zcH
	6StOcl9iJ2rJoSx7616n/jjtKdTQ7wDieuqcmbI1yeamtJzaiyBG4LE1dN+27nsDQjNw+v3rWgL
	5IN4DJ0E6FAXgAth0w5KJF8EfDW8QZ9Btw7jRrw==
X-Gm-Gg: ASbGncvGFU4iFxJS3pus5VEKwvxeb58b+hbozJlkrWEAzgAUB8JvXP4GRJ8C2wvpDXZ
	yLZ92Reo7xeZ5CjD+O4CYMe1DBDP61+VYedv9qMRAo32dAaK4Z01WefUcGriULVFaQF6OnJB5ts
	M+3XILyOiVPAb6fZsXTPFV61n7
X-Google-Smtp-Source: AGHT+IGNzT6YERRpl5RF3Rqka/0w0Bo7Th787trVcXRWJQZv5hSFMWN4GRbzZu0V4wR3Az2O5tH9+vEnJF2O7a2AKOs=
X-Received: by 2002:a05:6808:2293:b0:3f7:e8de:bb10 with SMTP id
 5614622812f47-4007bce8aa1mr782025b6e.23.1744249457587; Wed, 09 Apr 2025
 18:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409193004.643839-1-bjorn@kernel.org> <20250409193004.643839-3-bjorn@kernel.org>
In-Reply-To: <20250409193004.643839-3-bjorn@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 10 Apr 2025 09:44:05 +0800
X-Gm-Features: ATxdqUH3Rff00v72uayFtK7Jr6GPLI3JNkxmWrl2SZR5256FCPXjTz6GEQV-Tik
Message-ID: <CAEEQ3wmb37Y6gOn0cC53DMJgQopcD4pf38c83AexFv+Pj7Er3w@mail.gmail.com>
Subject: Re: [External] [PATCH v3 2/2] riscv: kexec_file: Support loading
 Image binary file
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Song Shuai <songshuaishuai@tinylab.org>, 
	linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bj=C3=B6rn,

On Thu, Apr 10, 2025 at 3:31=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> From: Song Shuai <songshuaishuai@tinylab.org>
>
> This patch creates image_kexec_ops to load Image binary file
> for kexec_file_load() syscall.
>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> ---
>  arch/riscv/include/asm/image.h         |  2 +
>  arch/riscv/include/asm/kexec.h         |  1 +
>  arch/riscv/kernel/Makefile             |  2 +-
>  arch/riscv/kernel/kexec_image.c        | 96 ++++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec_file.c |  1 +
>  5 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/kexec_image.c
>
> diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/imag=
e.h
> index e0b319af3681..8927a6ea1127 100644
> --- a/arch/riscv/include/asm/image.h
> +++ b/arch/riscv/include/asm/image.h
> @@ -30,6 +30,8 @@
>                               RISCV_HEADER_VERSION_MINOR)
>
>  #ifndef __ASSEMBLY__
> +#define riscv_image_flag_field(flags, field)\
> +                              (((flags) >> field##_SHIFT) & field##_MASK=
)
>  /**
>   * struct riscv_image_header - riscv kernel image header
>   * @code0:             Executable code
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexe=
c.h
> index 518825fe4160..b9ee8346cc8c 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -56,6 +56,7 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops elf_kexec_ops;
> +extern const struct kexec_file_ops image_kexec_ops;
>
>  struct purgatory_info;
>  int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index d56305c8e631..0ead29826419 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -107,7 +107,7 @@ obj-$(CONFIG_HOTPLUG_CPU)   +=3D cpu-hotplug.o
>  obj-$(CONFIG_PARAVIRT)         +=3D paravirt.o
>  obj-$(CONFIG_KGDB)             +=3D kgdb.o
>  obj-$(CONFIG_KEXEC_CORE)       +=3D kexec_relocate.o crash_save_regs.o m=
achine_kexec.o
> -obj-$(CONFIG_KEXEC_FILE)       +=3D kexec_elf.o machine_kexec_file.o
> +obj-$(CONFIG_KEXEC_FILE)       +=3D kexec_elf.o kexec_image.o machine_ke=
xec_file.o
>  obj-$(CONFIG_CRASH_DUMP)       +=3D crash_dump.o
>  obj-$(CONFIG_VMCORE_INFO)      +=3D vmcore_info.o
>
> diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_im=
age.c
> new file mode 100644
> index 000000000000..26a81774a78a
> --- /dev/null
> +++ b/arch/riscv/kernel/kexec_image.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V Kexec image loader
> + *
> + */
> +
> +#define pr_fmt(fmt)    "kexec_file(Image): " fmt
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/kexec.h>
> +#include <linux/pe.h>
> +#include <linux/string.h>
> +#include <asm/byteorder.h>
> +#include <asm/image.h>
> +
> +static int image_probe(const char *kernel_buf, unsigned long kernel_len)
> +{
> +       const struct riscv_image_header *h =3D (const struct riscv_image_=
header *)kernel_buf;
> +
> +       if (!h || kernel_len < sizeof(*h))
> +               return -EINVAL;
> +
> +       /* According to Documentation/riscv/boot-image-header.rst,
> +        * use "magic2" field to check when version >=3D 0.2.
> +        */
> +
> +       if (h->version >=3D RISCV_HEADER_VERSION &&
> +           memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static void *image_load(struct kimage *image,
> +                       char *kernel, unsigned long kernel_len,
> +                       char *initrd, unsigned long initrd_len,
> +                       char *cmdline, unsigned long cmdline_len)
> +{
> +       struct riscv_image_header *h;
> +       u64 flags;
> +       bool be_image, be_kernel;
> +       struct kexec_buf kbuf;
> +       int ret;
> +
> +       /* Check Image header */
> +       h =3D (struct riscv_image_header *)kernel;
> +       if (!h->image_size) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       /* Check endianness */
> +       flags =3D le64_to_cpu(h->flags);
> +       be_image =3D riscv_image_flag_field(flags, RISCV_IMAGE_FLAG_BE);
> +       be_kernel =3D IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
> +       if (be_image !=3D be_kernel) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       /* Load the kernel image */
> +       kbuf.image =3D image;
> +       kbuf.buf_min =3D 0;
> +       kbuf.buf_max =3D ULONG_MAX;
> +       kbuf.top_down =3D false;
> +
> +       kbuf.buffer =3D kernel;
> +       kbuf.bufsz =3D kernel_len;
> +       kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
> +       kbuf.memsz =3D le64_to_cpu(h->image_size);
> +       kbuf.buf_align =3D le64_to_cpu(h->text_offset);

It is necessary to ensure that the kernel entry is aligned to
PMD_SIZE; otherwise, BUG_ON() in setup_vm() will be triggered.


> +
> +       ret =3D kexec_add_buffer(&kbuf);
> +       if (ret) {
> +               pr_err("Error add kernel image ret=3D%d\n", ret);
> +               goto out;
> +       }
> +
> +       image->start =3D kbuf.mem;
> +
> +       pr_info("Loaded kernel at 0x%lx bufsz=3D0x%lx memsz=3D0x%lx\n",
> +               kbuf.mem, kbuf.bufsz, kbuf.memsz);
> +
> +       ret =3D load_extra_segments(image, kbuf.mem, kbuf.memsz,
> +                                 initrd, initrd_len, cmdline, cmdline_le=
n);
> +
> +out:
> +       return ret ? ERR_PTR(ret) : NULL;
> +}
> +
> +const struct kexec_file_ops image_kexec_ops =3D {
> +       .probe =3D image_probe,
> +       .load =3D image_load,
> +};
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 99bd5a5f4234..e36104af2e24 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -18,6 +18,7 @@
>
>  const struct kexec_file_ops * const kexec_file_loaders[] =3D {
>         &elf_kexec_ops,
> +       &image_kexec_ops,
>         NULL
>  };
>
> --
> 2.45.2
>
>

Thanks,
Yunhui
