Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C814D2A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435269; cv=none; b=MXO+/z01ap5z7LTPsNef/6MoTOpCXxwIp9E3HL4Dd9ipeO/fi+AVdZevYGEg4jY0qBNl+laYcrUL6WrRZe5zl/Xx88zL+qY6b7dfoMkbIcB/V3tk5vAKFg76pvgeU4sGH2dCxC5DTY+xo8IOfe714Bb0GjVSxdaPK+Mzr1VT1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435269; c=relaxed/simple;
	bh=sB1mRtf1TvtQigUaIHObKdhhXViIdJ4CVt6cp7H0vkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmeJ0FWfsBSrGT/Og9bZ8CIXeAa2bgapkU8NyC/+QA/+nIWPEKnHiIZg9jV5H/gBLQ0Lm5Kb8JBhiMYE9KCG9s7cHEW9LDIHIR3PdxpD6ESCeGrC3a1YcgJgjDsmpaKwE48vdKFEfafVz4/aKkReXZSNKdV0X5o1M+mlZQwSnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fo7LLgQq; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fo7LLgQq"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fabe9446a0so58763926d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751435266; x=1752040066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EE7Av+XcGdxZ0RfLlqfnO/eWbJyYJ0K5JEX+7dCc568=;
        b=fo7LLgQqAvnBmtfSAzRCe23Dd/w2kWXKyjRKsWPkZnuePS6DguQrg/KFQp1khw6nN/
         t95p3sc+24mKNi85O6GXwm1Wr9X5E2TSVYtX4KO6MzYLJYtHxQaKitjyXCQNt3H5gD2i
         xVzggXFyTtwUYSlJPgXxgXgJPEPBggdm6QAvRWkpgKbAP3h9qsGgi1fg8SQjUsKnTAMo
         doXrQlU79mPo6sgWxoz+Xh2kbK02iQOEXtxIxPW3PfCxAUUTdWpPB9GHbIrTi0ftV7BP
         gBAVwEK0DOuVm4L2PnZrd7wZw7SFIdPQPdX6QiBs/zQC1fNSKKyK/bYM40LWEdiLBnul
         lllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751435266; x=1752040066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE7Av+XcGdxZ0RfLlqfnO/eWbJyYJ0K5JEX+7dCc568=;
        b=WXTFmrGHjfViI2YoIHdwMSNigt2uoHplQIhPC0nOMebMkkhWGa/vOMpXa219PXu7AA
         zRZ9Wb4FPXeEfrAIQkdXa/mYC8roCiIIX5EvdtgUh5lvi1YX8whY+QBUI/JMrvNnFWaa
         P+Ys4u2LHBx93gThg044NaBoNi5H9eAopEEgl92M2hxN9z/lcZwtYplsM2g1q/abkOqm
         NuZ9NA2wOn/7aONtUN8GwhEhzH036DD2k0VwGiAhfyiUPlC03XC93LaJB7k0PsGabmQH
         HQzQOojMhOXZJ7XBvJ1EhMiVQ9gXvFVJuAaY8pDQjVARo0Gh9hgafUQREbkPhBUcc/KT
         GkLQ==
X-Gm-Message-State: AOJu0Yy/nMto3EetVAFdtCCegYJFeMUysivOGlTyet/8uc0W9l9L2Ub2
	hj3AH5Tob6ly3zojXlUr8PViwE3B6ouk08r2bybNEt51+K1LwuyiSCRR7am1VvAbzEkFadcOpye
	4IGWeW2q8OYV21V9TKJBilNBhE0L1pbpwEJ3OIp/i
X-Gm-Gg: ASbGnctgH2vAyPDoQUWIdbm0Tx3QdRfB4trBKC7ih2qkxEKF9Y9A6hVrMH9kKdwkt8E
	AE2+Wg5jks16sf3O5norMhB8dEHEZgta0r24MYa4bG1XNj0L6pR/qp30/W4JHnrXL+kKBNvJQCs
	Is2FGTQ7NuRf604vTmcD6OwCfORfya8vWCa2uD9IbwgFTq
X-Google-Smtp-Source: AGHT+IGIUl43Yqnnu4nNTw+1ei1BeK4rfzlOmXX5TO2r8aO9xgHUMRMtD1IftHFbt+aAMv7wOxSQPhuK2PM8rNnQKD8=
X-Received: by 2002:a05:6214:dcd:b0:6f5:3cae:920f with SMTP id
 6a1803df08f44-702b1b376ffmr19866246d6.27.1751435266019; Tue, 01 Jul 2025
 22:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702010447.2994412-1-ynaffit@google.com> <20250702010447.2994412-4-ynaffit@google.com>
In-Reply-To: <20250702010447.2994412-4-ynaffit@google.com>
From: David Gow <davidgow@google.com>
Date: Wed, 2 Jul 2025 13:47:32 +0800
X-Gm-Features: Ac12FXyM4dJfdfmzM8nAn6L0b5e8E6wgRYb0QtWJxEyonSMsiAqAhl96KSlYr6Q
Message-ID: <CABVgOSkw5NQcaX-AWmRn8HFCijWLb=w+q3KUtnuSsgb0YwTmmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] binder: Scaffolding for binder_alloc KUnit tests
To: Tiffany Yang <ynaffit@google.com>
Cc: linux-kernel@vger.kernel.org, keescook@google.com, kernel-team@android.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ec72b80638ebccfb"

--000000000000ec72b80638ebccfb
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 09:05, Tiffany Yang <ynaffit@google.com> wrote:
>
> Add setup and teardown for testing binder allocator code with KUnit.
> Include minimal test cases to verify that tests are initialized
> correctly.
>
> Tested-by: Rae Moar <rmoar@google.com>
> Signed-off-by: Tiffany Yang <ynaffit@google.com>
> ---
> v2:
> * Added tested-by tag
> ---

This looks great, thanks.

One small request: could we split the change to expose
kunit_attach_mm() into a separate commit? That'd make it easier for
people to backport independently of binder changes if other tests want
to use this, too.

Cheers,
-- David

>  drivers/android/Kconfig                    |  11 ++
>  drivers/android/Makefile                   |   1 +
>  drivers/android/binder.c                   |   5 +-
>  drivers/android/binder_alloc.c             |  15 +-
>  drivers/android/binder_alloc.h             |   6 +
>  drivers/android/binder_internal.h          |   4 +
>  drivers/android/tests/.kunitconfig         |   3 +
>  drivers/android/tests/Makefile             |   3 +
>  drivers/android/tests/binder_alloc_kunit.c | 166 +++++++++++++++++++++
>  include/kunit/test.h                       |  12 ++
>  lib/kunit/user_alloc.c                     |   4 +-
>  11 files changed, 222 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/android/tests/.kunitconfig
>  create mode 100644 drivers/android/tests/Makefile
>  create mode 100644 drivers/android/tests/binder_alloc_kunit.c
>
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 07aa8ae0a058..b1bc7183366c 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -47,4 +47,15 @@ config ANDROID_BINDER_IPC_SELFTEST
>           exhaustively with combinations of various buffer sizes and
>           alignments.
>
> +config ANDROID_BINDER_ALLOC_KUNIT_TEST
> +       tristate "KUnit Tests for Android Binder Alloc" if !KUNIT_ALL_TESTS
> +       depends on ANDROID_BINDER_IPC && KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This feature builds the binder alloc KUnit tests.
> +
> +         Each test case runs using a pared-down binder_alloc struct and
> +         test-specific freelist, which allows this KUnit module to be loaded
> +         for testing without interfering with a running system.
> +
>  endmenu
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index c9d3d0c99c25..74d02a335d4e 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -4,3 +4,4 @@ ccflags-y += -I$(src)                   # needed for trace events
>  obj-$(CONFIG_ANDROID_BINDERFS)         += binderfs.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC)       += binder.o binder_alloc.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
> +obj-$(CONFIG_ANDROID_BINDER_ALLOC_KUNIT_TEST)  += tests/
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index c463ca4a8fff..9dfe90c284fc 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -68,6 +68,8 @@
>  #include <linux/sizes.h>
>  #include <linux/ktime.h>
>
> +#include <kunit/visibility.h>
> +
>  #include <uapi/linux/android/binder.h>
>
>  #include <linux/cacheflush.h>
> @@ -5956,10 +5958,11 @@ static void binder_vma_close(struct vm_area_struct *vma)
>         binder_alloc_vma_close(&proc->alloc);
>  }
>
> -static vm_fault_t binder_vm_fault(struct vm_fault *vmf)
> +VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
>  {
>         return VM_FAULT_SIGBUS;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(binder_vm_fault);
>
>  static const struct vm_operations_struct binder_vm_ops = {
>         .open = binder_vma_open,
> diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
> index 2e89f9127883..c79e5c6721f0 100644
> --- a/drivers/android/binder_alloc.c
> +++ b/drivers/android/binder_alloc.c
> @@ -23,6 +23,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/highmem.h>
>  #include <linux/sizes.h>
> +#include <kunit/visibility.h>
>  #include "binder_alloc.h"
>  #include "binder_trace.h"
>
> @@ -57,13 +58,14 @@ static struct binder_buffer *binder_buffer_prev(struct binder_buffer *buffer)
>         return list_entry(buffer->entry.prev, struct binder_buffer, entry);
>  }
>
> -static size_t binder_alloc_buffer_size(struct binder_alloc *alloc,
> -                                      struct binder_buffer *buffer)
> +VISIBLE_IF_KUNIT size_t binder_alloc_buffer_size(struct binder_alloc *alloc,
> +                                                struct binder_buffer *buffer)
>  {
>         if (list_is_last(&buffer->entry, &alloc->buffers))
>                 return alloc->vm_start + alloc->buffer_size - buffer->user_data;
>         return binder_buffer_next(buffer)->user_data - buffer->user_data;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(binder_alloc_buffer_size);
>
>  static void binder_insert_free_buffer(struct binder_alloc *alloc,
>                                       struct binder_buffer *new_buffer)
> @@ -959,7 +961,7 @@ int binder_alloc_mmap_handler(struct binder_alloc *alloc,
>                            failure_string, ret);
>         return ret;
>  }
> -
> +EXPORT_SYMBOL_IF_KUNIT(binder_alloc_mmap_handler);
>
>  void binder_alloc_deferred_release(struct binder_alloc *alloc)
>  {
> @@ -1028,6 +1030,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
>                      "%s: %d buffers %d, pages %d\n",
>                      __func__, alloc->pid, buffers, page_count);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(binder_alloc_deferred_release);
>
>  /**
>   * binder_alloc_print_allocated() - print buffer info
> @@ -1122,6 +1125,7 @@ void binder_alloc_vma_close(struct binder_alloc *alloc)
>  {
>         binder_alloc_set_mapped(alloc, false);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(binder_alloc_vma_close);
>
>  /**
>   * binder_alloc_free_page() - shrinker callback to free pages
> @@ -1229,8 +1233,8 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>
>  static struct shrinker *binder_shrinker;
>
> -static void __binder_alloc_init(struct binder_alloc *alloc,
> -                               struct list_lru *freelist)
> +VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
> +                                         struct list_lru *freelist)
>  {
>         alloc->pid = current->group_leader->pid;
>         alloc->mm = current->mm;
> @@ -1239,6 +1243,7 @@ static void __binder_alloc_init(struct binder_alloc *alloc,
>         INIT_LIST_HEAD(&alloc->buffers);
>         alloc->freelist = freelist;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(__binder_alloc_init);
>
>  /**
>   * binder_alloc_init() - called by binder_open() for per-proc initialization
> diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
> index aa05a9df1360..dc8dce2469a7 100644
> --- a/drivers/android/binder_alloc.h
> +++ b/drivers/android/binder_alloc.h
> @@ -188,5 +188,11 @@ int binder_alloc_copy_from_buffer(struct binder_alloc *alloc,
>                                   binder_size_t buffer_offset,
>                                   size_t bytes);
>
> +#if IS_ENABLED(CONFIG_KUNIT)
> +void __binder_alloc_init(struct binder_alloc *alloc, struct list_lru *freelist);
> +size_t binder_alloc_buffer_size(struct binder_alloc *alloc,
> +                               struct binder_buffer *buffer);
> +#endif
> +
>  #endif /* _LINUX_BINDER_ALLOC_H */
>
> diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
> index 1ba5caf1d88d..b5d3014fb4dc 100644
> --- a/drivers/android/binder_internal.h
> +++ b/drivers/android/binder_internal.h
> @@ -592,4 +592,8 @@ void binder_add_device(struct binder_device *device);
>   */
>  void binder_remove_device(struct binder_device *device);
>
> +#if IS_ENABLED(CONFIG_KUNIT)
> +vm_fault_t binder_vm_fault(struct vm_fault *vmf);
> +#endif
> +
>  #endif /* _LINUX_BINDER_INTERNAL_H */
> diff --git a/drivers/android/tests/.kunitconfig b/drivers/android/tests/.kunitconfig
> new file mode 100644
> index 000000000000..a73601231049
> --- /dev/null
> +++ b/drivers/android/tests/.kunitconfig
> @@ -0,0 +1,3 @@
> +CONFIG_KUNIT=y
> +CONFIG_ANDROID_BINDER_IPC=y
> +CONFIG_ANDROID_BINDER_ALLOC_KUNIT_TEST=y
> diff --git a/drivers/android/tests/Makefile b/drivers/android/tests/Makefile
> new file mode 100644
> index 000000000000..6780967e573b
> --- /dev/null
> +++ b/drivers/android/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_ANDROID_BINDER_ALLOC_KUNIT_TEST)  += binder_alloc_kunit.o
> diff --git a/drivers/android/tests/binder_alloc_kunit.c b/drivers/android/tests/binder_alloc_kunit.c
> new file mode 100644
> index 000000000000..4b68b5687d33
> --- /dev/null
> +++ b/drivers/android/tests/binder_alloc_kunit.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Test cases for binder allocator code
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <kunit/test.h>
> +#include <linux/anon_inodes.h>
> +#include <linux/err.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/sizes.h>
> +
> +#include "../binder_alloc.h"
> +#include "../binder_internal.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +#define BINDER_MMAP_SIZE SZ_128K
> +
> +struct binder_alloc_test {
> +       struct binder_alloc alloc;
> +       struct list_lru binder_test_freelist;
> +       struct file *filp;
> +       unsigned long mmap_uaddr;
> +};
> +
> +static void binder_alloc_test_init_freelist(struct kunit *test)
> +{
> +       struct binder_alloc_test *priv = test->priv;
> +
> +       KUNIT_EXPECT_PTR_EQ(test, priv->alloc.freelist,
> +                           &priv->binder_test_freelist);
> +}
> +
> +static void binder_alloc_test_mmap(struct kunit *test)
> +{
> +       struct binder_alloc_test *priv = test->priv;
> +       struct binder_alloc *alloc = &priv->alloc;
> +       struct binder_buffer *buf;
> +       struct rb_node *n;
> +
> +       KUNIT_EXPECT_EQ(test, alloc->mapped, true);
> +       KUNIT_EXPECT_EQ(test, alloc->buffer_size, BINDER_MMAP_SIZE);
> +
> +       n = rb_first(&alloc->allocated_buffers);
> +       KUNIT_EXPECT_PTR_EQ(test, n, NULL);
> +
> +       n = rb_first(&alloc->free_buffers);
> +       buf = rb_entry(n, struct binder_buffer, rb_node);
> +       KUNIT_EXPECT_EQ(test, binder_alloc_buffer_size(alloc, buf),
> +                       BINDER_MMAP_SIZE);
> +       KUNIT_EXPECT_TRUE(test, list_is_last(&buf->entry, &alloc->buffers));
> +}
> +
> +/* ===== End test cases ===== */
> +
> +static void binder_alloc_test_vma_close(struct vm_area_struct *vma)
> +{
> +       struct binder_alloc *alloc = vma->vm_private_data;
> +
> +       binder_alloc_vma_close(alloc);
> +}
> +
> +static const struct vm_operations_struct binder_alloc_test_vm_ops = {
> +       .close = binder_alloc_test_vma_close,
> +       .fault = binder_vm_fault,
> +};
> +
> +static int binder_alloc_test_mmap_handler(struct file *filp,
> +                                         struct vm_area_struct *vma)
> +{
> +       struct binder_alloc *alloc = filp->private_data;
> +
> +       vm_flags_mod(vma, VM_DONTCOPY | VM_MIXEDMAP, VM_MAYWRITE);
> +
> +       vma->vm_ops = &binder_alloc_test_vm_ops;
> +       vma->vm_private_data = alloc;
> +
> +       return binder_alloc_mmap_handler(alloc, vma);
> +}
> +
> +static const struct file_operations binder_alloc_test_fops = {
> +       .mmap = binder_alloc_test_mmap_handler,
> +};
> +
> +static int binder_alloc_test_init(struct kunit *test)
> +{
> +       struct binder_alloc_test *priv;
> +       int ret;
> +
> +       priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       test->priv = priv;
> +
> +       ret = list_lru_init(&priv->binder_test_freelist);
> +       if (ret) {
> +               kunit_err(test, "Failed to initialize test freelist\n");
> +               return ret;
> +       }
> +
> +       /* __binder_alloc_init requires mm to be attached */
> +       ret = kunit_attach_mm();
> +       if (ret) {
> +               kunit_err(test, "Failed to attach mm\n");
> +               return ret;
> +       }
> +       __binder_alloc_init(&priv->alloc, &priv->binder_test_freelist);
> +
> +       priv->filp = anon_inode_getfile("binder_alloc_kunit",
> +                                       &binder_alloc_test_fops, &priv->alloc,
> +                                       O_RDWR | O_CLOEXEC);
> +       if (IS_ERR_OR_NULL(priv->filp)) {
> +               kunit_err(test, "Failed to open binder alloc test driver file\n");
> +               return priv->filp ? PTR_ERR(priv->filp) : -ENOMEM;
> +       }
> +
> +       priv->mmap_uaddr = kunit_vm_mmap(test, priv->filp, 0, BINDER_MMAP_SIZE,
> +                                        PROT_READ, MAP_PRIVATE | MAP_NORESERVE,
> +                                        0);
> +       if (!priv->mmap_uaddr) {
> +               kunit_err(test, "Could not map the test's transaction memory\n");
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static void binder_alloc_test_exit(struct kunit *test)
> +{
> +       struct binder_alloc_test *priv = test->priv;
> +
> +       /* Close the backing file to make sure binder_alloc_vma_close runs */
> +       if (!IS_ERR_OR_NULL(priv->filp))
> +               fput(priv->filp);
> +
> +       if (priv->alloc.mm)
> +               binder_alloc_deferred_release(&priv->alloc);
> +
> +       /* Make sure freelist is empty */
> +       KUNIT_EXPECT_EQ(test, list_lru_count(&priv->binder_test_freelist), 0);
> +       list_lru_destroy(&priv->binder_test_freelist);
> +}
> +
> +static struct kunit_case binder_alloc_test_cases[] = {
> +       KUNIT_CASE(binder_alloc_test_init_freelist),
> +       KUNIT_CASE(binder_alloc_test_mmap),
> +       {}
> +};
> +
> +static struct kunit_suite binder_alloc_test_suite = {
> +       .name = "binder_alloc",
> +       .test_cases = binder_alloc_test_cases,
> +       .init = binder_alloc_test_init,
> +       .exit = binder_alloc_test_exit,
> +};
> +
> +kunit_test_suite(binder_alloc_test_suite);
> +
> +MODULE_AUTHOR("Tiffany Yang <ynaffit@google.com>");
> +MODULE_DESCRIPTION("Binder Alloc KUnit tests");
> +MODULE_LICENSE("GPL");
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 39c768f87dc9..d958ee53050e 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -531,6 +531,18 @@ static inline char *kunit_kstrdup(struct kunit *test, const char *str, gfp_t gfp
>   */
>  const char *kunit_kstrdup_const(struct kunit *test, const char *str, gfp_t gfp);
>
> +/**
> + * kunit_attach_mm() - Create and attach a new mm if it doesn't already exist.
> + *
> + * Allocates a &struct mm_struct and attaches it to @current. In most cases, call
> + * kunit_vm_mmap() without calling kunit_attach_mm() directly. Only necessary when
> + * code under test accesses the mm before executing the mmap (e.g., to perform
> + * additional initialization beforehand).
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int kunit_attach_mm(void);
> +
>  /**
>   * kunit_vm_mmap() - Allocate KUnit-tracked vm_mmap() area
>   * @test: The test context object.
> diff --git a/lib/kunit/user_alloc.c b/lib/kunit/user_alloc.c
> index 46951be018be..b8cac765e620 100644
> --- a/lib/kunit/user_alloc.c
> +++ b/lib/kunit/user_alloc.c
> @@ -22,8 +22,7 @@ struct kunit_vm_mmap_params {
>         unsigned long offset;
>  };
>
> -/* Create and attach a new mm if it doesn't already exist. */
> -static int kunit_attach_mm(void)
> +int kunit_attach_mm(void)
>  {
>         struct mm_struct *mm;
>
> @@ -49,6 +48,7 @@ static int kunit_attach_mm(void)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(kunit_attach_mm);
>
>  static int kunit_vm_mmap_init(struct kunit_resource *res, void *context)
>  {
> --
> 2.50.0.727.gbf7dc18ff4-goog
>

--000000000000ec72b80638ebccfb
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgii25+Gg2MNUPRxq/5o5UwDbmF0x0
TFcAZdPGxB8GLmgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NzAyMDU0NzQ2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEADl3ZUoxR7771vbBo53L0eN3pC8BV/6HOtordBqCSjt4R8qh4dmhkK7I6BBP1XbFg
mupL43241CmkqfsmY+8lqr6TYdu3JPNfYaPzHqu1QighwvMjyIDLaIWU5BQLGXBgJessNR0z9M9l
egbL1Up0oARcn9lqmRbxSMtd624qgJr6kP5GTmtQ8nkp/RHSyAvGx1b01qd2sr21gIXt4UEh3Pf0
Ow+O6AMMd2g6n7QBUKwo92LHBzoAjZ3x3ldfmGCPoLJ+Z8s6vh7xVklFA1Q/iUnerjMMnv0mZXMU
R6xwtNafdoqNkan65p3dE0J5505GfnrANAYFDELbMldOcZn+6w==
--000000000000ec72b80638ebccfb--
