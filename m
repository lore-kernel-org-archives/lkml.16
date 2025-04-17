Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C0442065
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908464; cv=none; b=Uu4pLzRUYO/qTHS574OO/feC5rHfvcljrdSujj/cZFFmxuLnrlWLoks7FCpe3yDrVuF+f4xakA8+bPF3diULNbPxj19BXjl7bMxwvvV0kCjMtP/4+5/0rFEgFPW1DitqJh9xKrW556ZiHAj63quOWul4FuBVYP3NuaPWMqhTt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908464; c=relaxed/simple;
	bh=o2YsJIf9i7zWQPuSJIftHf5+t4EaPXmnIFuymuRMWoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNYb/y00pVTBzotQvTLEjMJhCXnIroO0U/TNkaN95kEefbx6/S8k5+w+qih+dt8HN5676groJrAeS3aE6X3cRf3nBIVNYhHJJoUpLyRd51BfndNPbmClPDmujhWsdVQjuVPGwW9NOcmP159JPj5Q0okpJVFyE5RpYeZEETTPlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOPZ4S5j; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOPZ4S5j"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b07d607dc83so851948a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744908462; x=1745513262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZRP9XBy/IaMFQgXk543Y2umGGrzdPzuqMhR+6DtFWo=;
        b=aOPZ4S5jM1gp1oTS9db0pLcRvL+xmIqEZDHmRbNQaRqV7KfeslxBuYOyZA2KYeeGCQ
         0qtsgUixeZ7MlOHzPZHX4hvFbHztaTDGkHyGleKo75Hzb1EW2NQR+fl7jUmqVx1fAzna
         FNhksHc8oXZbNyTYSTV0A2M+ZuoYLTKn4kHDLXZHIYYgMvC0ksQDFmNEQko1UpHO/9MA
         pVPs8IF7UqPn4VWJG/qU10su4Y25/0gZC1P9UTp8J4iUZb81q261jCkJKDRBEd7/6dO5
         NmgqEDz6dmX/lq5fhTkBmHb/Hz5HDbvreVgOCL1rJz3Bc6TIRGDwRm/8SRmfaAoGpKSa
         bYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908462; x=1745513262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZRP9XBy/IaMFQgXk543Y2umGGrzdPzuqMhR+6DtFWo=;
        b=KFdEeKGlxzFOnfNTVcYhZZlwo9Ou/paHnGnD6BKApleTBqswXUy65/xx2B2nJPEML3
         pGFS3njuzfvWd8Kx3qVOfosH8bVTLDdXWRWf3UkqV1mpB4Dijmg+AGEVDd+NhILcKO7Z
         ErpyLjvCXx2FPNAf+WlPdZrxRhArAFG9FQBtdVYnHhYIqEByngkk492tzb7tlSJEKlAg
         JS3O1Ja2kXT3xxJgtRecTI+E9tpAd+3BpGVfnkqhiP9DhhgPcaLd2PeT77EwlNAqEvRR
         cir3GHQTu4Vp7nMMazDg16usudKOrYox7cC4Uw0lxSGpWGBsJB6B30V5+sqByfxWnl6d
         drNw==
X-Forwarded-Encrypted: i=1; AJvYcCXjM1c8Y4Nv1LtKBTzxIh+tZ0WrWyQdrxI1TeFw5+fyFpks8+yXSewiu4niPY4sOcYsXipGFPXWhXi0OdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5Nn9iVW77yl+EU8+XdKqiQKgkqI+uzzs/7JeO4TNFmrDv8Wa
	CD7G4VTx+u6qSjWRSbvQI2JtEd5aymM2cjS9lA7kk2iYsdSVTd/dCceWHwCnI7L5Y/7rZU8o4vD
	TcBJUAgkvixi9JBWylZsP3VfKiEsGCHY/zMLx
X-Gm-Gg: ASbGncvFc94x4GmG3EJzLpKle4Tm+INKAjrCm5OC7mePw+hbCZ5JEoZn2+4bdQpoQAV
	c/rAR9Y3XKaUByLOrcLaRoUTobvQboRK2qvPbiT2crpsiC/inARieSd/g/HN/SuFg7qkh2d5Gvp
	kAbNO0S0AFuBsL1j/p44863i3WfdIL2374sK8RZYsPIdYYF/cyF5mm9w==
X-Google-Smtp-Source: AGHT+IHbj/s7dct4/F4BwIrYngtG+ZqBqWnhcjyRtAy2Qz6NIn26Z8mzOhzCrbI0pOagWyXhORP6t8e4A1kmg9XMLeE=
X-Received: by 2002:a17:90b:544f:b0:2f9:c144:9d13 with SMTP id
 98e67ed59e1d1-3086415ce82mr10501876a91.24.1744908461443; Thu, 17 Apr 2025
 09:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-2-glider@google.com>
In-Reply-To: <20250416085446.480069-2-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Apr 2025 18:47:04 +0200
X-Gm-Features: ATxdqUGZDGtRxNj3H8LE4NWhNfntkrsSoxVZ57KseDO79LBBDvcbLH0XlWj5KFM
Message-ID: <CANpmjNPass_tPdjwguw5N+5HRn81FOJm0axLDMxwbZLrHHH8hg@mail.gmail.com>
Subject: Re: [PATCH 1/7] kcov: apply clang-format to kcov code
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 10:55, Alexander Potapenko <glider@google.com> wrote:
>
> kcov used to obey clang-format style, but somehow diverged over time.
> This patch applies clang-format to kernel/kcov.c and
> include/linux/kcov.h, no functional change.
>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  include/linux/kcov.h |  54 +++++++++++------
>  kernel/kcov.c        | 134 ++++++++++++++++++++++---------------------
>  2 files changed, 105 insertions(+), 83 deletions(-)
>
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 75a2fb8b16c32..932b4face1005 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -25,20 +25,20 @@ enum kcov_mode {
>         KCOV_MODE_REMOTE = 4,
>  };
>
> -#define KCOV_IN_CTXSW  (1 << 30)
> +#define KCOV_IN_CTXSW (1 << 30)
>
>  void kcov_task_init(struct task_struct *t);
>  void kcov_task_exit(struct task_struct *t);
>
> -#define kcov_prepare_switch(t)                 \
> -do {                                           \
> -       (t)->kcov_mode |= KCOV_IN_CTXSW;        \
> -} while (0)
> +#define kcov_prepare_switch(t)                   \
> +       do {                                     \
> +               (t)->kcov_mode |= KCOV_IN_CTXSW; \
> +       } while (0)
>
> -#define kcov_finish_switch(t)                  \
> -do {                                           \
> -       (t)->kcov_mode &= ~KCOV_IN_CTXSW;       \
> -} while (0)
> +#define kcov_finish_switch(t)                     \
> +       do {                                      \
> +               (t)->kcov_mode &= ~KCOV_IN_CTXSW; \
> +       } while (0)
>
>  /* See Documentation/dev-tools/kcov.rst for usage details. */
>  void kcov_remote_start(u64 handle);
> @@ -119,23 +119,41 @@ void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);
>
>  #else
>
> -static inline void kcov_task_init(struct task_struct *t) {}
> -static inline void kcov_task_exit(struct task_struct *t) {}
> -static inline void kcov_prepare_switch(struct task_struct *t) {}
> -static inline void kcov_finish_switch(struct task_struct *t) {}
> -static inline void kcov_remote_start(u64 handle) {}
> -static inline void kcov_remote_stop(void) {}
> +static inline void kcov_task_init(struct task_struct *t)
> +{
> +}
> +static inline void kcov_task_exit(struct task_struct *t)
> +{
> +}
> +static inline void kcov_prepare_switch(struct task_struct *t)
> +{
> +}
> +static inline void kcov_finish_switch(struct task_struct *t)
> +{
> +}
> +static inline void kcov_remote_start(u64 handle)
> +{
> +}
> +static inline void kcov_remote_stop(void)
> +{
> +}

This excessive-new-line style is not an improvement over previously.
But nothing we can do about I guess...

>  static inline u64 kcov_common_handle(void)
>  {
>         return 0;
>  }
> -static inline void kcov_remote_start_common(u64 id) {}
> -static inline void kcov_remote_start_usb(u64 id) {}
> +static inline void kcov_remote_start_common(u64 id)
> +{
> +}
> +static inline void kcov_remote_start_usb(u64 id)
> +{
> +}
>  static inline unsigned long kcov_remote_start_usb_softirq(u64 id)
>  {
>         return 0;
>  }
> -static inline void kcov_remote_stop_softirq(unsigned long flags) {}
> +static inline void kcov_remote_stop_softirq(unsigned long flags)
> +{
> +}
>
>  #endif /* CONFIG_KCOV */
>  #endif /* _LINUX_KCOV_H */
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 187ba1b80bda1..7cc6123c2baa4 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -4,27 +4,28 @@
>  #define DISABLE_BRANCH_PROFILING
>  #include <linux/atomic.h>
>  #include <linux/compiler.h>
> +#include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
> -#include <linux/types.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/hashtable.h>
>  #include <linux/init.h>
>  #include <linux/jiffies.h>
> +#include <linux/kcov.h>
>  #include <linux/kmsan-checks.h>
> +#include <linux/log2.h>
>  #include <linux/mm.h>
>  #include <linux/preempt.h>
>  #include <linux/printk.h>
> +#include <linux/refcount.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> -#include <linux/vmalloc.h>
> -#include <linux/debugfs.h>
> +#include <linux/types.h>
>  #include <linux/uaccess.h>
> -#include <linux/kcov.h>
> -#include <linux/refcount.h>
> -#include <linux/log2.h>
> +#include <linux/vmalloc.h>
> +
>  #include <asm/setup.h>
>
>  #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
> @@ -52,36 +53,36 @@ struct kcov {
>          *  - task with enabled coverage (we can't unwire it from another task)
>          *  - each code section for remote coverage collection
>          */
> -       refcount_t              refcount;
> +       refcount_t refcount;
>         /* The lock protects mode, size, area and t. */
> -       spinlock_t              lock;
> -       enum kcov_mode          mode;
> +       spinlock_t lock;
> +       enum kcov_mode mode;
>         /* Size of arena (in long's). */
> -       unsigned int            size;
> +       unsigned int size;
>         /* Coverage buffer shared with user space. */
> -       void                    *area;
> +       void *area;
>         /* Task for which we collect coverage, or NULL. */
> -       struct task_struct      *t;
> +       struct task_struct *t;
>         /* Collecting coverage from remote (background) threads. */
> -       bool                    remote;
> +       bool remote;
>         /* Size of remote area (in long's). */
> -       unsigned int            remote_size;
> +       unsigned int remote_size;
>         /*
>          * Sequence is incremented each time kcov is reenabled, used by
>          * kcov_remote_stop(), see the comment there.
>          */
> -       int                     sequence;
> +       int sequence;
>  };
>
>  struct kcov_remote_area {
> -       struct list_head        list;
> -       unsigned int            size;
> +       struct list_head list;
> +       unsigned int size;
>  };
>
>  struct kcov_remote {
> -       u64                     handle;
> -       struct kcov             *kcov;
> -       struct hlist_node       hnode;
> +       u64 handle;
> +       struct kcov *kcov;
> +       struct hlist_node hnode;
>  };
>
>  static DEFINE_SPINLOCK(kcov_remote_lock);
> @@ -89,14 +90,14 @@ static DEFINE_HASHTABLE(kcov_remote_map, 4);
>  static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
>
>  struct kcov_percpu_data {
> -       void                    *irq_area;
> -       local_lock_t            lock;
> -
> -       unsigned int            saved_mode;
> -       unsigned int            saved_size;
> -       void                    *saved_area;
> -       struct kcov             *saved_kcov;
> -       int                     saved_sequence;
> +       void *irq_area;
> +       local_lock_t lock;
> +
> +       unsigned int saved_mode;
> +       unsigned int saved_size;
> +       void *saved_area;
> +       struct kcov *saved_kcov;
> +       int saved_sequence;
>  };
>
>  static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {
> @@ -149,7 +150,7 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
>
>  /* Must be called with kcov_remote_lock locked. */
>  static void kcov_remote_area_put(struct kcov_remote_area *area,
> -                                       unsigned int size)
> +                                unsigned int size)
>  {
>         INIT_LIST_HEAD(&area->list);
>         area->size = size;
> @@ -171,7 +172,8 @@ static __always_inline bool in_softirq_really(void)
>         return in_serving_softirq() && !in_hardirq() && !in_nmi();
>  }
>
> -static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
> +static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
> +                                   struct task_struct *t)
>  {
>         unsigned int mode;
>
> @@ -354,8 +356,8 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
>  static void kcov_start(struct task_struct *t, struct kcov *kcov,
> -                       unsigned int size, void *area, enum kcov_mode mode,
> -                       int sequence)
> +                      unsigned int size, void *area, enum kcov_mode mode,
> +                      int sequence)
>  {
>         kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
>         t->kcov = kcov;
> @@ -566,14 +568,14 @@ static void kcov_fault_in_area(struct kcov *kcov)
>  }
>
>  static inline bool kcov_check_handle(u64 handle, bool common_valid,
> -                               bool uncommon_valid, bool zero_valid)
> +                                    bool uncommon_valid, bool zero_valid)
>  {
>         if (handle & ~(KCOV_SUBSYSTEM_MASK | KCOV_INSTANCE_MASK))
>                 return false;
>         switch (handle & KCOV_SUBSYSTEM_MASK) {
>         case KCOV_SUBSYSTEM_COMMON:
> -               return (handle & KCOV_INSTANCE_MASK) ?
> -                       common_valid : zero_valid;
> +               return (handle & KCOV_INSTANCE_MASK) ? common_valid :
> +                                                      zero_valid;
>         case KCOV_SUBSYSTEM_USB:
>                 return uncommon_valid;
>         default:
> @@ -611,7 +613,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 kcov_fault_in_area(kcov);
>                 kcov->mode = mode;
>                 kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
> -                               kcov->sequence);
> +                          kcov->sequence);
>                 kcov->t = t;
>                 /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
>                 kcov_get(kcov);
> @@ -642,40 +644,40 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                         return -EINVAL;
>                 kcov->mode = mode;
>                 t->kcov = kcov;
> -               t->kcov_mode = KCOV_MODE_REMOTE;
> +               t->kcov_mode = KCOV_MODE_REMOTE;
>                 kcov->t = t;
>                 kcov->remote = true;
>                 kcov->remote_size = remote_arg->area_size;
>                 spin_lock_irqsave(&kcov_remote_lock, flags);
>                 for (i = 0; i < remote_arg->num_handles; i++) {
> -                       if (!kcov_check_handle(remote_arg->handles[i],
> -                                               false, true, false)) {
> +                       if (!kcov_check_handle(remote_arg->handles[i], false,
> +                                              true, false)) {
>                                 spin_unlock_irqrestore(&kcov_remote_lock,
> -                                                       flags);
> +                                                      flags);
>                                 kcov_disable(t, kcov);
>                                 return -EINVAL;
>                         }
>                         remote = kcov_remote_add(kcov, remote_arg->handles[i]);
>                         if (IS_ERR(remote)) {
>                                 spin_unlock_irqrestore(&kcov_remote_lock,
> -                                                       flags);
> +                                                      flags);
>                                 kcov_disable(t, kcov);
>                                 return PTR_ERR(remote);
>                         }
>                 }
>                 if (remote_arg->common_handle) {
> -                       if (!kcov_check_handle(remote_arg->common_handle,
> -                                               true, false, false)) {
> +                       if (!kcov_check_handle(remote_arg->common_handle, true,
> +                                              false, false)) {
>                                 spin_unlock_irqrestore(&kcov_remote_lock,
> -                                                       flags);
> +                                                      flags);
>                                 kcov_disable(t, kcov);
>                                 return -EINVAL;
>                         }
>                         remote = kcov_remote_add(kcov,
> -                                       remote_arg->common_handle);
> +                                                remote_arg->common_handle);
>                         if (IS_ERR(remote)) {
>                                 spin_unlock_irqrestore(&kcov_remote_lock,
> -                                                       flags);
> +                                                      flags);
>                                 kcov_disable(t, kcov);
>                                 return PTR_ERR(remote);
>                         }
> @@ -728,13 +730,15 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>                 spin_unlock_irqrestore(&kcov->lock, flags);
>                 return 0;
>         case KCOV_REMOTE_ENABLE:
> -               if (get_user(remote_num_handles, (unsigned __user *)(arg +
> -                               offsetof(struct kcov_remote_arg, num_handles))))
> +               if (get_user(remote_num_handles,
> +                            (unsigned __user *)(arg +
> +                                                offsetof(struct kcov_remote_arg,
> +                                                         num_handles))))

Ouch. Maybe move the address calculation before and assign to
temporary to avoid this mess?

>                         return -EFAULT;
>                 if (remote_num_handles > KCOV_REMOTE_MAX_HANDLES)
>                         return -EINVAL;
> -               remote_arg_size = struct_size(remote_arg, handles,
> -                                       remote_num_handles);
> +               remote_arg_size =
> +                       struct_size(remote_arg, handles, remote_num_handles);
>                 remote_arg = memdup_user((void __user *)arg, remote_arg_size);
>                 if (IS_ERR(remote_arg))
>                         return PTR_ERR(remote_arg);
> @@ -758,11 +762,11 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>  }
>
>  static const struct file_operations kcov_fops = {
> -       .open           = kcov_open,
> -       .unlocked_ioctl = kcov_ioctl,
> -       .compat_ioctl   = kcov_ioctl,
> -       .mmap           = kcov_mmap,
> -       .release        = kcov_close,
> +       .open = kcov_open,
> +       .unlocked_ioctl = kcov_ioctl,
> +       .compat_ioctl = kcov_ioctl,
> +       .mmap = kcov_mmap,
> +       .release = kcov_close,
>  };
>
>  /*
> @@ -836,8 +840,8 @@ static void kcov_remote_softirq_stop(struct task_struct *t)
>
>         if (data->saved_kcov) {
>                 kcov_start(t, data->saved_kcov, data->saved_size,
> -                               data->saved_area, data->saved_mode,
> -                               data->saved_sequence);
> +                          data->saved_area, data->saved_mode,
> +                          data->saved_sequence);
>                 data->saved_mode = 0;
>                 data->saved_size = 0;
>                 data->saved_area = NULL;
> @@ -891,7 +895,7 @@ void kcov_remote_start(u64 handle)
>                 return;
>         }
>         kcov_debug("handle = %llx, context: %s\n", handle,
> -                       in_task() ? "task" : "softirq");
> +                  in_task() ? "task" : "softirq");
>         kcov = remote->kcov;
>         /* Put in kcov_remote_stop(). */
>         kcov_get(kcov);
> @@ -931,12 +935,11 @@ void kcov_remote_start(u64 handle)
>         kcov_start(t, kcov, size, area, mode, sequence);
>
>         local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
> -
>  }
>  EXPORT_SYMBOL(kcov_remote_start);
>
>  static void kcov_move_area(enum kcov_mode mode, void *dst_area,
> -                               unsigned int dst_area_size, void *src_area)
> +                          unsigned int dst_area_size, void *src_area)
>  {
>         u64 word_size = sizeof(unsigned long);
>         u64 count_size, entry_size_log;
> @@ -944,8 +947,8 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
>         void *dst_entries, *src_entries;
>         u64 dst_occupied, dst_free, bytes_to_move, entries_moved;
>
> -       kcov_debug("%px %u <= %px %lu\n",
> -               dst_area, dst_area_size, src_area, *(unsigned long *)src_area);
> +       kcov_debug("%px %u <= %px %lu\n", dst_area, dst_area_size, src_area,
> +                  *(unsigned long *)src_area);
>
>         switch (mode) {
>         case KCOV_MODE_TRACE_PC:
> @@ -967,8 +970,8 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
>         }
>
>         /* As arm can't divide u64 integers use log of entry size. */
> -       if (dst_len > ((dst_area_size * word_size - count_size) >>
> -                               entry_size_log))
> +       if (dst_len >
> +           ((dst_area_size * word_size - count_size) >> entry_size_log))
>                 return;
>         dst_occupied = count_size + (dst_len << entry_size_log);
>         dst_free = dst_area_size * word_size - dst_occupied;
> @@ -1100,7 +1103,8 @@ static int __init kcov_init(void)
>
>         for_each_possible_cpu(cpu) {
>                 void *area = vmalloc_node(CONFIG_KCOV_IRQ_AREA_SIZE *
> -                               sizeof(unsigned long), cpu_to_node(cpu));
> +                                                 sizeof(unsigned long),
> +                                         cpu_to_node(cpu));

Ouch.
