Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D222F74F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813689; cv=none; b=mCPeI9s0AnqDEQas1r2hcyoif/2LdmE3uVCTDYWh4zXv5NIU9/msQZNdREhaNOB2n3udcdx1E/f7fQzZ11IIrXky/sWCFJzdKdtEznzdTLrFi2IqzhJOv0W/BAV9C4Z/PKGJ5o9jwFtb41iEyxeWrR0G+tMGafy/Dmx08ykNmns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813689; c=relaxed/simple;
	bh=OOgFaqmnjujRLAPZ/pfIRSb8POo9pbC1MktAwT4Ty8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgeqO63rz2G2kYzVSMINQzl2wGE99PcU0+/BnXAnDiJj+i6ZV5tz6Sw5QqF7cQ/DDDcFQ6fZPRFQ4HDZLKtvQRfOX6aQo/Ctewf3qoK5fgBun2jo06TDoVl12KBc3jfRsh4cfEpM2V5j5wymTR5f+qQMSRRD6hlk9cZtry1dTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dPnpPnzm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dPnpPnzm"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551ed563740so4582003e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747813685; x=1748418485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quqMfHb/r0GEfRAytiJ8y5i6vS+/NlcJRf4bURtaGOQ=;
        b=dPnpPnzmIjntGTxlREjhojPZFY9EK7P7vz4OBJgh/618PRweJqrXxoacHpZZlEBvFA
         nc78xR09b0iHKLLefiiC65lrFyn3B3zvpLwYFQ01LJnhRlngITxy4qZxifIuUYcCenZR
         OetxHw40vdSiIdLMIc7gEKcRQscLs08D2+agOIH6rNWB3grun3ky1xRRIbLLTBSI0j2V
         F9pNDHtw2zZY9g+rynpLuzc19njiywGMx4Iiuul9geiCILSVxWO4dIqoad4jInd84ujv
         jINE3M2zdMqq8AOx3FFLD7JgXx0Ejk4EI8rouyrVsuTRDnkpdUQaLew5yNv6jxcHyoHC
         vjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813685; x=1748418485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quqMfHb/r0GEfRAytiJ8y5i6vS+/NlcJRf4bURtaGOQ=;
        b=mSclOBwEUCgbxssOAzHGOhoOlACyG4xEqgL5Q7SEZD340Ck07vuCI0K7E4+EVQlrzc
         Q0e628Mg2zma2qxhBgjGXDPIelCUstc0Y6dy9hXWGnJp6n91PoPjTwVnYbjAlgpvpXVK
         jVe35Rt+VM1wpxcD/HoW8J/Sk60w+39lWH7tFTUUNXZqRdOUUV5icvCijXDjc2EjPeAA
         qXyNUucsHkRw0I5lC/rdfJhxieUtyIV8B4Q1xQUUu8yf5QLX8GlhFnb50x92KSzoU/F6
         8B9x8ICalGDEuLvCHlPtaoJUbBsIYuPxZ/bBJ1C2k3I16z0QtXDqgJtwlXmLYJmcjbfr
         OCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjpoN+VPNR6eiZZSjQUb8edqSqnh57OnKqKUkZ5RO5bLPCIvc7iv+B+HnZBfVH/QhfUB0ecebrh8ZGGB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSjRYFhdEZsz+mxtRdsl5Pn4FnPE+q3OKB2AXUQy2X1oXURRr
	8r+1eku98Qt3/smQYw+aR6drN/3YRXwkqusVbvuVsJ9SpTxp8KytQ2uTEQJS0Xlxpx7Fz0jsTff
	d57GEg3WycoRnuGv3YlPU+I8irAr0dwxvRMKWC+C2hA==
X-Gm-Gg: ASbGncspPoWqA7a8JzhZy1pE5TqRWTvJIFkve03eB7x5jtCOU2BXdH3Y2RxTgsqEKcp
	75mykWgo7RUjjX5qPzMSMPWAyVMjGXECaAdxiw81KfWIC/ZsE6bRybrBSnaCyZCBr7crcpljCIm
	WE9KkvYF8Wd9l7xm1UiBy7CwTZaU27oqmDPl35KY/Kmha/880=
X-Google-Smtp-Source: AGHT+IHxExE2cdLv+F26jySesYOCI3p8f/gNiwBgHKNCPp08MuoxsJMxTzSFP3KxW1rcQhiSTnxsBDgPjTiPtrYEQto=
X-Received: by 2002:ac2:4e07:0:b0:549:6451:7e76 with SMTP id
 2adb3069b0e04-550e71d62ccmr6794058e87.33.1747813684405; Wed, 21 May 2025
 00:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513180229.7494-1-graf@amazon.com>
In-Reply-To: <20250513180229.7494-1-graf@amazon.com>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Wed, 21 May 2025 15:47:28 +0800
X-Gm-Features: AX0GCFsMklwHXhUs4us3A-K1JDEKVbThrMAaKT42YthmaZQNAErq8P-7k4I5Nw4
Message-ID: <CACSyD1OU1zjvc2YdQpi-F_qZ0EWyb6jLNODJkRDPQa6m1eObJg@mail.gmail.com>
Subject: Re: [External] [PATCH v3] kexec: Enable CMA based contiguous allocation
To: Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 2:40=E2=80=AFAM Alexander Graf <graf@amazon.com> wr=
ote:
>
> When booting a new kernel with kexec_file, the kernel picks a target
> location that the kernel should live at, then allocates random pages,
> checks whether any of those patches magically happens to coincide with
> a target address range and if so, uses them for that range.
>
> For every page allocated this way, it then creates a page list that the
> relocation code - code that executes while all CPUs are off and we are
> just about to jump into the new kernel - copies to their final memory
> location. We can not put them there before, because chances are pretty
> good that at least some page in the target range is already in use by
> the currently running Linux environment. Copying is happening from a
> single CPU at RAM rate, which takes around 4-50 ms per 100 MiB.
>
> All of this is inefficient and error prone.
>
> To successfully kexec, we need to quiesce all devices of the outgoing
> kernel so they don't scribble over the new kernel's memory. We have seen
> cases where that does not happen properly (*cough* GIC *cough*) and hence
> the new kernel was corrupted. This started a month long journey to root
> cause failing kexecs to eventually see memory corruption, because the new
> kernel was corrupted severely enough that it could not emit output to
> tell us about the fact that it was corrupted. By allocating memory for th=
e
> next kernel from a memory range that is guaranteed scribbling free, we ca=
n
> boot the next kernel up to a point where it is at least able to detect
> corruption and maybe even stop it before it becomes severe. This increase=
s
> the chance for successful kexecs.
>
> Since kexec got introduced, Linux has gained the CMA framework which
> can perform physically contiguous memory mappings, while keeping that
> memory available for movable memory when it is not needed for contiguous
> allocations. The default CMA allocator is for DMA allocations.
>
> This patch adds logic to the kexec file loader to attempt to place the
> target payload at a location allocated from CMA. If successful, it uses
> that memory range directly instead of creating copy instructions during
> the hot phase. To ensure that there is a safety net in case anything goes
> wrong with the CMA allocation, it also adds a flag for user space to forc=
e
> disable CMA allocations.
>
> Using CMA allocations has two advantages:
>
>   1) Faster by 4-50 ms per 100 MiB. There is no more need to copy in the
>      hot phase.
>   2) More robust. Even if by accident some page is still in use for DMA,
>      the new kernel image will be safe from that access because it reside=
s
>      in a memory region that is considered allocated in the old kernel an=
d
>      has a chance to reinitialize that component.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
>
> ---
>
> v1 -> v2:
>
>   - Clarify patch description
>   - Move cma pointer out of kexec_segment. That is a sneaky UAPI struct w=
e
>     can not modify. Fixes non kexec_file path
>   - Coding style
>   - Move memset(0) to only clear remainder
>   - Move kexec_alloc_contig() into kexec_locate_mem_hole(). Makes the cod=
e
>     flow easier to read.
>   - Sanitize return values
>
> v2 -> v3:
>
>   - Fix refactoring bug which meant we never exercised the new code path
> ---
>  arch/riscv/kernel/elf_kexec.c |   1 +
>  include/linux/kexec.h         |  10 ++++
>  include/uapi/linux/kexec.h    |   1 +
>  kernel/kexec.c                |   2 +-
>  kernel/kexec_core.c           | 100 +++++++++++++++++++++++++++++++---
>  kernel/kexec_file.c           |  47 +++++++++++++++-
>  kernel/kexec_internal.h       |   2 +-
>  7 files changed, 152 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.=
c
> index e783a72d051f..d81647c98c92 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -109,6 +109,7 @@ static int elf_find_pbase(struct kimage *image, unsig=
ned long kernel_len,
>         kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
>         kbuf.memsz =3D ALIGN(kernel_len, PAGE_SIZE);
>         kbuf.top_down =3D false;
> +       kbuf.cma =3D NULL;
>         ret =3D arch_kexec_locate_mem_hole(&kbuf);
>         if (!ret) {
>                 *old_pbase =3D lowest_paddr;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index c8971861521a..7821b23bd1e9 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -75,6 +75,12 @@ extern note_buf_t __percpu *crash_notes;
>
>  typedef unsigned long kimage_entry_t;
>
> +/*
> + * This is a copy of the UAPI struct kexec_segment and must be identical
> + * to it because it gets copied straight from user space into kernel
> + * memory. Do not modify this structure unless you change the way segmen=
ts
> + * get ingested from user space.
> + */
>  struct kexec_segment {
>         /*
>          * This pointer can point to user memory if kexec_load() system
> @@ -169,6 +175,7 @@ int kexec_image_post_load_cleanup_default(struct kima=
ge *image);
>   * @buf_min:   The buffer can't be placed below this address.
>   * @buf_max:   The buffer can't be placed above this address.
>   * @top_down:  Allocate from top of memory.
> + * @cma:       CMA page if the buffer is backed by CMA.
>   */
>  struct kexec_buf {
>         struct kimage *image;
> @@ -180,6 +187,7 @@ struct kexec_buf {
>         unsigned long buf_min;
>         unsigned long buf_max;
>         bool top_down;
> +       struct page *cma;
>  };
>
>  int kexec_load_purgatory(struct kimage *image, struct kexec_buf *kbuf);
> @@ -310,6 +318,7 @@ struct kimage {
>
>         unsigned long nr_segments;
>         struct kexec_segment segment[KEXEC_SEGMENT_MAX];
> +       struct page *segment_cma[KEXEC_SEGMENT_MAX];
>
>         struct list_head control_pages;
>         struct list_head dest_pages;
> @@ -331,6 +340,7 @@ struct kimage {
>          */
>         unsigned int hotplug_support:1;
>  #endif
> +       unsigned int no_cma:1;
>
>  #ifdef ARCH_HAS_KIMAGE_ARCH
>         struct kimage_arch arch;
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 5ae1741ea8ea..8958ebfcff94 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -27,6 +27,7 @@
>  #define KEXEC_FILE_ON_CRASH    0x00000002
>  #define KEXEC_FILE_NO_INITRAMFS        0x00000004
>  #define KEXEC_FILE_DEBUG       0x00000008
> +#define KEXEC_FILE_NO_CMA      0x00000010
>
>  /* These values match the ELF architecture values.
>   * Unless there is a good reason that should continue to be the case.
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index a6b3f96bb50c..28008e3d462e 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -152,7 +152,7 @@ static int do_kexec_load(unsigned long entry, unsigne=
d long nr_segments,
>                 goto out;
>
>         for (i =3D 0; i < nr_segments; i++) {
> -               ret =3D kimage_load_segment(image, &image->segment[i]);
> +               ret =3D kimage_load_segment(image, i);
>                 if (ret)
>                         goto out;
>         }
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index 3e62b944c883..b5b680dd1796 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -40,6 +40,7 @@
>  #include <linux/hugetlb.h>
>  #include <linux/objtool.h>
>  #include <linux/kmsg_dump.h>
> +#include <linux/dma-map-ops.h>
>
>  #include <asm/page.h>
>  #include <asm/sections.h>
> @@ -553,6 +554,24 @@ static void kimage_free_entry(kimage_entry_t entry)
>         kimage_free_pages(page);
>  }
>
> +static void kimage_free_cma(struct kimage *image)
> +{
> +       unsigned long i;
> +
> +       for (i =3D 0; i < image->nr_segments; i++) {
> +               struct page *cma =3D image->segment_cma[i];
> +               u32 nr_pages =3D image->segment[i].memsz >> PAGE_SHIFT;
> +
> +               if (!cma)
> +                       continue;
> +
> +               arch_kexec_pre_free_pages(page_address(cma), nr_pages);
> +               dma_release_from_contiguous(NULL, cma, nr_pages);
> +               image->segment_cma[i] =3D NULL;
> +       }
> +
> +}
> +
>  void kimage_free(struct kimage *image)
>  {
>         kimage_entry_t *ptr, entry;
> @@ -591,6 +610,9 @@ void kimage_free(struct kimage *image)
>         /* Free the kexec control pages... */
>         kimage_free_page_list(&image->control_pages);
>
> +       /* Free CMA allocations */
> +       kimage_free_cma(image);
> +
>         /*
>          * Free up any temporary buffers allocated. This might hit if
>          * error occurred much later after buffer allocation.
> @@ -716,9 +738,69 @@ static struct page *kimage_alloc_page(struct kimage =
*image,
>         return page;
>  }
>
> -static int kimage_load_normal_segment(struct kimage *image,
> -                                        struct kexec_segment *segment)
> +static int kimage_load_cma_segment(struct kimage *image, int idx)
> +{
> +       struct kexec_segment *segment =3D &image->segment[idx];
> +       struct page *cma =3D image->segment_cma[idx];
> +       char *ptr =3D page_address(cma);
> +       unsigned long maddr;
> +       size_t ubytes, mbytes;
> +       int result =3D 0;
> +       unsigned char __user *buf =3D NULL;
> +       unsigned char *kbuf =3D NULL;
> +
> +       if (image->file_mode)
> +               kbuf =3D segment->kbuf;
> +       else
> +               buf =3D segment->buf;
> +       ubytes =3D segment->bufsz;
> +       mbytes =3D segment->memsz;
> +       maddr =3D segment->mem;
> +
> +       /* Then copy from source buffer to the CMA one */
> +       while (mbytes) {
> +               size_t uchunk, mchunk;
> +
> +               ptr +=3D maddr & ~PAGE_MASK;
> +               mchunk =3D min_t(size_t, mbytes,
> +                               PAGE_SIZE - (maddr & ~PAGE_MASK));
> +               uchunk =3D min(ubytes, mchunk);
> +
> +               if (uchunk) {
> +                       /* For file based kexec, source pages are in kern=
el memory */
> +                       if (image->file_mode)
> +                               memcpy(ptr, kbuf, uchunk);
> +                       else
> +                               result =3D copy_from_user(ptr, buf, uchun=
k);
> +                       ubytes -=3D uchunk;
> +                       if (image->file_mode)
> +                               kbuf +=3D uchunk;
> +                       else
> +                               buf +=3D uchunk;
> +               }
> +
> +               if (result) {
> +                       result =3D -EFAULT;
> +                       goto out;
> +               }
> +
> +               ptr    +=3D mchunk;
> +               maddr  +=3D mchunk;
> +               mbytes -=3D mchunk;
> +
> +               cond_resched();
> +       }
> +
> +       /* Clear any remainder */
> +       memset(ptr, 0, mbytes);
> +
> +out:
> +       return result;
> +}
> +
> +static int kimage_load_normal_segment(struct kimage *image, int idx)
>  {
> +       struct kexec_segment *segment =3D &image->segment[idx];
>         unsigned long maddr;
>         size_t ubytes, mbytes;
>         int result;
> @@ -733,6 +815,9 @@ static int kimage_load_normal_segment(struct kimage *=
image,
>         mbytes =3D segment->memsz;
>         maddr =3D segment->mem;
>
> +       if (image->segment_cma[idx])
> +               return kimage_load_cma_segment(image, idx);
> +
>         result =3D kimage_set_destination(image, maddr);
>         if (result < 0)
>                 goto out;
> @@ -787,13 +872,13 @@ static int kimage_load_normal_segment(struct kimage=
 *image,
>  }
>
>  #ifdef CONFIG_CRASH_DUMP
> -static int kimage_load_crash_segment(struct kimage *image,
> -                                       struct kexec_segment *segment)
> +static int kimage_load_crash_segment(struct kimage *image, int idx)
>  {
>         /* For crash dumps kernels we simply copy the data from
>          * user space to it's destination.
>          * We do things a page at a time for the sake of kmap.
>          */
> +       struct kexec_segment *segment =3D &image->segment[idx];
>         unsigned long maddr;
>         size_t ubytes, mbytes;
>         int result;
> @@ -858,18 +943,17 @@ static int kimage_load_crash_segment(struct kimage =
*image,
>  }
>  #endif
>
> -int kimage_load_segment(struct kimage *image,
> -                               struct kexec_segment *segment)
> +int kimage_load_segment(struct kimage *image, int idx)
>  {
>         int result =3D -ENOMEM;
>
>         switch (image->type) {
>         case KEXEC_TYPE_DEFAULT:
> -               result =3D kimage_load_normal_segment(image, segment);
> +               result =3D kimage_load_normal_segment(image, idx);
>                 break;
>  #ifdef CONFIG_CRASH_DUMP
>         case KEXEC_TYPE_CRASH:
> -               result =3D kimage_load_crash_segment(image, segment);
> +               result =3D kimage_load_crash_segment(image, idx);
>                 break;
>  #endif
>         }
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index fba686487e3b..916beae68fb6 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -27,6 +27,7 @@
>  #include <linux/kernel_read_file.h>
>  #include <linux/syscalls.h>
>  #include <linux/vmalloc.h>
> +#include <linux/dma-map-ops.h>
>  #include "kexec_internal.h"
>
>  #ifdef CONFIG_KEXEC_SIG
> @@ -230,6 +231,8 @@ kimage_file_prepare_segments(struct kimage *image, in=
t kernel_fd, int initrd_fd,
>                 ret =3D 0;
>         }
>
> +       image->no_cma =3D !!(flags & KEXEC_FILE_NO_CMA);
> +
>         if (cmdline_len) {
>                 image->cmdline_buf =3D memdup_user(cmdline_ptr, cmdline_l=
en);
>                 if (IS_ERR(image->cmdline_buf)) {
> @@ -406,7 +409,7 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int,=
 initrd_fd,
>                               i, ksegment->buf, ksegment->bufsz, ksegment=
->mem,
>                               ksegment->memsz);
>
> -               ret =3D kimage_load_segment(image, &image->segment[i]);
> +               ret =3D kimage_load_segment(image, i);
>                 if (ret)
>                         goto out;
>         }
> @@ -632,6 +635,39 @@ static int kexec_walk_resources(struct kexec_buf *kb=
uf,
>                 return walk_system_ram_res(0, ULONG_MAX, kbuf, func);
>  }
>
> +static int kexec_alloc_contig(struct kexec_buf *kbuf)
> +{
> +       size_t nr_pages =3D kbuf->memsz >> PAGE_SHIFT;
> +       unsigned long mem;
> +       struct page *p;
> +
> +       /* User space disabled CMA allocations, bail out. */
> +       if (kbuf->image->no_cma)
> +               return -EPERM;
> +
> +       p =3D dma_alloc_from_contiguous(NULL, nr_pages, get_order(kbuf->b=
uf_align), true);
> +       if (!p)
> +               return -ENOMEM;
> +
> +       pr_debug("allocated %zu DMA pages at 0x%lx", nr_pages, page_to_bo=
ot_pfn(p));
> +
> +       mem =3D page_to_boot_pfn(p) << PAGE_SHIFT;
> +
> +       if (kimage_is_destination_range(kbuf->image, mem, mem + kbuf->mem=
sz)) {
> +               /* Our region is already in use by a statically defined o=
ne. Bail out. */
> +               pr_debug("CMA overlaps existing mem: 0x%lx+0x%lx\n", mem,=
 kbuf->memsz);
> +               dma_release_from_contiguous(NULL, p, nr_pages);
> +               return -EBUSY;
> +       }
> +
> +       kbuf->mem =3D page_to_boot_pfn(p) << PAGE_SHIFT;
> +       kbuf->cma =3D p;
> +
> +       arch_kexec_post_alloc_pages(page_address(p), (int)nr_pages, 0);
> +
> +       return 0;
> +}
> +
>  /**
>   * kexec_locate_mem_hole - find free memory for the purgatory or the nex=
t kernel
>   * @kbuf:      Parameters for the memory search.
> @@ -648,6 +684,13 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>         if (kbuf->mem !=3D KEXEC_BUF_MEM_UNKNOWN)
>                 return 0;
>
> +       /*
> +        * Try to find a free physically contiguous block of memory first=
. With that, we
> +        * can avoid any copying at kexec time.
> +        */
> +       if (!kexec_alloc_contig(kbuf))
> +               return 0;

IIUC, The kexec_locate_mem_hole() function is also used in
the KEXEC_TYPE_CRASH kimage, but kexec_alloc_contig() does not skip it.
This can cause kdump to fail and lead to CMA memory leakage.

So I ran some tests, as listed below:
The CMA memory decreases with each execution of the kdump-config
reload operation.

/home/hezhongkun.hzk# kdump-config reload
unloaded kdump kernel.
Creating symlink /var/lib/kdump/vmlinuz.
Creating symlink /var/lib/kdump/initrd.img.
kexec_file_load failed: Cannot assign requested address
failed to load kdump kernel ... failed!

[ 1387.536346] kexec_file: allocated 1817 DMA pages at 0x11b16e
[ 1399.147677] kexec_file: allocated 113 DMA pages at 0x119087
[ 1399.148915] kexec_file: allocated 5 DMA pages at 0x1140f8
[ 1399.150266] kexec_file: allocated 2 DMA pages at 0x1118fd
[ 1399.151474] kexec_file: allocated 8302 DMA pages at 0x11b900

/home/hezhongkun.hzk# cat /proc/meminfo | grep Cma
CmaTotal:        1048576 kB
CmaFree:          679972 kB
/home/hezhongkun.hzk# cat /proc/meminfo | grep Cma
CmaTotal:        1048576 kB
CmaFree:          639016 kB
/home/hezhongkun.hzk# cat /proc/meminfo | grep Cma
CmaTotal:        1048576 kB
CmaFree:          557104 kB

cat /proc/meminfo | grep Cma
CmaTotal:        1048576 kB
CmaFree:          557104 kB

> +
>         if (!IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
>                 ret =3D kexec_walk_resources(kbuf, locate_mem_hole_callba=
ck);
>         else
> @@ -693,6 +736,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>         /* Ensure minimum alignment needed for segments. */
>         kbuf->memsz =3D ALIGN(kbuf->memsz, PAGE_SIZE);
>         kbuf->buf_align =3D max(kbuf->buf_align, PAGE_SIZE);
> +       kbuf->cma =3D NULL;
>
>         /* Walk the RAM ranges and allocate a suitable range for the buff=
er */
>         ret =3D arch_kexec_locate_mem_hole(kbuf);
> @@ -705,6 +749,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>         ksegment->bufsz =3D kbuf->bufsz;
>         ksegment->mem =3D kbuf->mem;
>         ksegment->memsz =3D kbuf->memsz;
> +       kbuf->image->segment_cma[kbuf->image->nr_segments] =3D kbuf->cma;
>         kbuf->image->nr_segments++;
>         return 0;
>  }
> diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
> index d35d9792402d..29e6cebe0c43 100644
> --- a/kernel/kexec_internal.h
> +++ b/kernel/kexec_internal.h
> @@ -10,7 +10,7 @@ struct kimage *do_kimage_alloc_init(void);
>  int sanity_check_segment_list(struct kimage *image);
>  void kimage_free_page_list(struct list_head *list);
>  void kimage_free(struct kimage *image);
> -int kimage_load_segment(struct kimage *image, struct kexec_segment *segm=
ent);
> +int kimage_load_segment(struct kimage *image, int idx);
>  void kimage_terminate(struct kimage *image);
>  int kimage_is_destination_range(struct kimage *image,
>                                 unsigned long start, unsigned long end);
> --
> 2.34.1
>
>
>
>
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597
>
>
