Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9C1F1500
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314181; cv=none; b=XjVgzSphsNs2JaJLPNjC/VzPjrlKALET/uCPvTXUX0V35OodYB999KMMmeFL/rrJwxpLdm7w7qP56aUX6WDT6ikqWvJwA/8V78KatRnS9XORmjaMGyMNTXzRAZwgEv1fI3kOIB8xQfDV47U5GpYTRZ981OrBUInwU3hGj01ljiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314181; c=relaxed/simple;
	bh=ZhRKxWVZotA7rF404rmOp8nS2zG/8IhwI+xXb4MWRSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idc7DbAW4KbgkR55W3gMUfUapTB7BZYX8YV08q4zoUCaZRV9hB0w5QFSTNMMGtdITiTfzapFGjC0JxfHpAB4ZdywBqybLdoa9xaSk3sqrHjrh3BkR/Zyam/zYeeCnzkqhbdDHvIixrzmuZLJFCmCeEP4SQGz/9rsrKvIFlNI7to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZbz0M2z; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZbz0M2z"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so3416696a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745314178; x=1745918978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C2Xf4pmHwFxMcvAGykvpxOXuajpaq44nsmGp86t0OmA=;
        b=tZbz0M2z2SlHDORKpvNNOcv/8y/Xk05YVUGSnJB/N3oHnRGM2TENMA0+uMsMXT4aKW
         ThQYLkR90ru+J37RW0doBCFrCmx1vhCppqoVXUtsu5EMOAoVgajkto4RB55u6i1/MV9V
         NMFPCCrXFe4RW34s08uXZUPZGXaO7wwMGRMo0bIH7gEboyMdsXocLFqQqAxo7D7Lq8T/
         GOSau2mRc8IGTZpn9ocMMtgBMU9ZRmDb6nVo8EUblExbi62HAHkjUQK/DOlViOIUr8dx
         FTbJixTVF2pC5ZDue7Z3sfbI+8jksOAEW2GapDYYIeU0gSm0D/2V2NZYrL05c4uEOyP9
         WoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745314179; x=1745918979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2Xf4pmHwFxMcvAGykvpxOXuajpaq44nsmGp86t0OmA=;
        b=u8maXe8MsKghT1qqrMRpucx7C1nDdrF4vuUYx3F9Uvx+mMPcz2dt3CHTvcDHVkC3PJ
         f1Y3EQGnya1bL0j//WZOrPQXIDHVwtQK7KvbQjgGkLdlthtKK8mrG560YmU29WYy8Wm5
         ubBitdOO6B8acshfGfCOAX0AO6icX5NyH9mfCg6nbGJX8ILjvzcDVfjSjXlfEflq8YSZ
         3ZrCDFdfxCJolknZ9iiU9kmSL546TiuheGCJs5eSInWXHuf9HcJO/k8/C7UlR37Lg76t
         W1hf9G9rZeuDg+8ow/ThyX4BIDWbk+JzksBpg9H7dK6Lm79JP632d6hcm+yZa4nSzhY7
         d6rg==
X-Forwarded-Encrypted: i=1; AJvYcCXj/wDCSEhQNqGgDpXsKRX9uhRHGT8gDjV606X49fxvwuN8D1Zl37gS19wSHq/mCztyQ9JO64laTpp0lxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXDVqrzCGlU2s2YQ8EkWV4P4wGG62cGyQxPuRKvMaAJ3d59Ah
	7hgN5WjwG7ES7jUd4hNHv9Rwk3ePfC/GED3cTVuwNTJDlF48DuJJsfrHSD+Xmcdilsa5ROBHCT8
	m3Xltq1BXUqM5XOZBRFqxLNJJO/G1pHS2t+9w
X-Gm-Gg: ASbGncve6frTSmqt0S0GFCaOYHQTYzQmNilqjLM8zdM53UUc2+49NggxfF0JwSC0Wtm
	VMlrUffIjaTGtgmudrEfSLGUdrJ9HQcivW23HXixEhnB5ydRSpl5aMfrWvgmfBh3Qw4XI4lHoYt
	RzdrZ72lOux9B4Ld55nxSfCUOGyWRZnBnL00gUgfxVAKB1NJKYpdOM2w==
X-Google-Smtp-Source: AGHT+IGNYwm6QY298LxZHJDmNr/Lyjf/vhfbEMNi4EDIrEmHT+uzsq+GnfVP/5P7dK+JG2d1G/A8AyUv0x30iLve4lg=
X-Received: by 2002:a17:90b:5646:b0:2ee:f80c:6889 with SMTP id
 98e67ed59e1d1-3087bcc8a9dmr24296447a91.33.1745314178289; Tue, 22 Apr 2025
 02:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-6-glider@google.com>
In-Reply-To: <20250416085446.480069-6-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Apr 2025 11:29:01 +0200
X-Gm-Features: ATxdqUHRzEwfGkMe4bHdQJyW3hQZgIGBenSuXDct-VznZp1AxsAqbX5joH81qQw
Message-ID: <CANpmjNM=AAtiXeDHgG+ec48=xwBTzphG3rpJZ3krpG2Hd1FixQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
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
> ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> in the presence of CONFIG_KCOV_ENABLE_GUARDS.
>
> The buffer shared with the userspace is divided in two parts, one holding
> a bitmap, and the other one being the trace. The single parameter of
> ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> bitmap.
>
> Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> pointer to a unique guard variable. Upon the first call of each hook,
> the guard variable is initialized with a unique integer, which is used to
> map those hooks to bits in the bitmap. In the new coverage collection mode,
> the kernel first checks whether the bit corresponding to a particular hook
> is set, and then, if it is not, the PC is written into the trace buffer,
> and the bit is set.
>
> Note: when CONFIG_KCOV_ENABLE_GUARDS is disabled, ioctl(KCOV_UNIQUE_ENABLE)
> returns -ENOTSUPP, which is consistent with the existing kcov code.
>
> Also update the documentation.

Do you have performance measurements (old vs. new mode) that can be
included in this commit description?

> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  Documentation/dev-tools/kcov.rst |  43 +++++++++++
>  include/linux/kcov-state.h       |   8 ++
>  include/linux/kcov.h             |   2 +
>  include/uapi/linux/kcov.h        |   1 +
>  kernel/kcov.c                    | 129 +++++++++++++++++++++++++++----
>  5 files changed, 170 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd24..271260642d1a6 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -137,6 +137,49 @@ mmaps coverage buffer, and then forks child processes in a loop. The child
>  processes only need to enable coverage (it gets disabled automatically when
>  a thread exits).
>
> +Unique coverage collection
> +---------------------------
> +
> +Instead of collecting raw PCs, KCOV can deduplicate them on the fly.
> +This mode is enabled by the ``KCOV_UNIQUE_ENABLE`` ioctl (only available if
> +``CONFIG_KCOV_ENABLE_GUARDS`` is on).
> +
> +.. code-block:: c
> +
> +       /* Same includes and defines as above. */
> +       #define KCOV_UNIQUE_ENABLE              _IOW('c', 103, unsigned long)

Here it's _IOW.

> +       #define BITMAP_SIZE                     (4<<10)
> +
> +       /* Instead of KCOV_ENABLE, enable unique coverage collection. */
> +       if (ioctl(fd, KCOV_UNIQUE_ENABLE, BITMAP_SIZE))
> +               perror("ioctl"), exit(1);
> +       /* Reset the coverage from the tail of the ioctl() call. */
> +       __atomic_store_n(&cover[BITMAP_SIZE], 0, __ATOMIC_RELAXED);
> +       memset(cover, 0, BITMAP_SIZE * sizeof(unsigned long));
> +
> +       /* Call the target syscall call. */
> +       /* ... */
> +
> +       /* Read the number of collected PCs. */
> +       n = __atomic_load_n(&cover[BITMAP_SIZE], __ATOMIC_RELAXED);
> +       /* Disable the coverage collection. */
> +       if (ioctl(fd, KCOV_DISABLE, 0))
> +               perror("ioctl"), exit(1);
> +
> +Calling ``ioctl(fd, KCOV_UNIQUE_ENABLE, bitmap_size)`` carves out ``bitmap_size``
> +words from those allocated by ``KCOV_INIT_TRACE`` to keep an opaque bitmap that
> +prevents the kernel from storing the same PC twice. The remaining part of the
> +trace is used to collect PCs, like in other modes (this part must contain at
> +least two words, like when collecting non-unique PCs).
> +
> +The mapping between a PC and its position in the bitmap is persistent during the
> +kernel lifetime, so it is possible for the callers to directly use the bitmap
> +contents as a coverage signal (like when fuzzing userspace with AFL).
> +
> +In order to reset the coverage between the runs, the user needs to rewind the
> +trace (by writing 0 into the first word past ``bitmap_size``) and wipe the whole
> +bitmap.
> +
>  Comparison operands collection
>  ------------------------------
>
> diff --git a/include/linux/kcov-state.h b/include/linux/kcov-state.h
> index 6e576173fd442..26e275fe90684 100644
> --- a/include/linux/kcov-state.h
> +++ b/include/linux/kcov-state.h
> @@ -26,6 +26,14 @@ struct kcov_state {
>                 /* Buffer for coverage collection, shared with the userspace. */
>                 unsigned long *trace;
>
> +               /* Size of the bitmap (in bits). */
> +               unsigned int bitmap_size;
> +               /*
> +                * Bitmap for coverage deduplication, shared with the
> +                * userspace.
> +                */
> +               unsigned long *bitmap;
> +
>                 /*
>                  * KCOV sequence number: incremented each time kcov is
>                  * reenabled, used by kcov_remote_stop(), see the comment there.
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 7ec2669362fd1..41eebcd3ab335 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -10,6 +10,7 @@ struct task_struct;
>  #ifdef CONFIG_KCOV
>
>  enum kcov_mode {
> +       KCOV_MODE_INVALID = -1,
>         /* Coverage collection is not enabled yet. */
>         KCOV_MODE_DISABLED = 0,
>         /* KCOV was initialized, but tracing mode hasn't been chosen yet. */
> @@ -23,6 +24,7 @@ enum kcov_mode {
>         KCOV_MODE_TRACE_CMP = 3,
>         /* The process owns a KCOV remote reference. */
>         KCOV_MODE_REMOTE = 4,
> +       KCOV_MODE_TRACE_UNIQUE_PC = 5,
>  };
>
>  #define KCOV_IN_CTXSW (1 << 30)
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index ed95dba9fa37e..fe1695ddf8a06 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -22,6 +22,7 @@ struct kcov_remote_arg {
>  #define KCOV_ENABLE                    _IO('c', 100)
>  #define KCOV_DISABLE                   _IO('c', 101)
>  #define KCOV_REMOTE_ENABLE             _IOW('c', 102, struct kcov_remote_arg)
> +#define KCOV_UNIQUE_ENABLE             _IOR('c', 103, unsigned long)

_IOR? The unsigned long arg is copied to the kernel, so this should be
_IOW, right?

>  enum {
>         /*
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 7b726fd761c1b..dea25c8a53b52 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -29,6 +29,10 @@
>
>  #include <asm/setup.h>
>
> +#ifdef CONFIG_KCOV_ENABLE_GUARDS
> +atomic_t kcov_guard_max_index = ATOMIC_INIT(1);
> +#endif
> +
>  #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
>
>  /* Number of 64-bit words written per one comparison: */
> @@ -161,8 +165,7 @@ static __always_inline bool in_softirq_really(void)
>         return in_serving_softirq() && !in_hardirq() && !in_nmi();
>  }
>
> -static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
> -                                   struct task_struct *t)
> +static notrace enum kcov_mode get_kcov_mode(struct task_struct *t)
>  {
>         unsigned int mode;
>
> @@ -172,7 +175,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
>          * coverage collection section in a softirq.
>          */
>         if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
> -               return false;
> +               return KCOV_MODE_INVALID;
>         mode = READ_ONCE(t->kcov_state.mode);
>         /*
>          * There is some code that runs in interrupts but for which
> @@ -182,7 +185,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
>          * kcov_start().
>          */
>         barrier();
> -       return mode == needed_mode;
> +       return mode;
>  }
>
>  static notrace unsigned long canonicalize_ip(unsigned long ip)
> @@ -201,7 +204,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
>
>         if (likely(pos < size)) {
>                 /*
> -                * Some early interrupt code could bypass check_kcov_mode() check
> +                * Some early interrupt code could bypass get_kcov_mode() check
>                  * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
>                  * raised between writing pc and updating pos, the pc could be
>                  * overitten by the recursive __sanitizer_cov_trace_pc().
> @@ -220,7 +223,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
>  #ifndef CONFIG_KCOV_ENABLE_GUARDS
>  void notrace __sanitizer_cov_trace_pc(void)
>  {
> -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> +       if (get_kcov_mode(current) != KCOV_MODE_TRACE_PC)
>                 return;
>
>         sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> @@ -229,14 +232,73 @@ void notrace __sanitizer_cov_trace_pc(void)
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
>  #else
> +
> +DEFINE_PER_CPU(u32, saved_index);
> +/*
> + * Assign an index to a guard variable that does not have one yet.
> + * For an unlikely case of a race with another task executing the same basic
> + * block, we store the unused index in a per-cpu variable.
> + * In an even less likely case the current task may lose a race and get
> + * rescheduled onto a CPU that already has a saved index, discarding that index.
> + * This will result in an unused hole in the bitmap, but such events should have
> + * minor impact on the overall memory consumption.
> + */
> +static __always_inline u32 init_pc_guard(u32 *guard)
> +{
> +       /* If the current CPU has a saved free index, use it. */
> +       u32 index = this_cpu_xchg(saved_index, 0);
> +       u32 old_guard;
> +
> +       if (likely(!index))
> +               /*
> +                * Allocate a new index. No overflow is possible, because 2**32
> +                * unique basic blocks will take more space than the max size
> +                * of the kernel text segment.
> +                */
> +               index = atomic_inc_return(&kcov_guard_max_index) - 1;
> +
> +       /*
> +        * Make sure another task is not initializing the same guard
> +        * concurrently.
> +        */
> +       old_guard = cmpxchg(guard, 0, index);
> +       if (unlikely(old_guard)) {
> +               /* We lost the race, save the index for future use. */
> +               this_cpu_write(saved_index, index);
> +               return old_guard;
> +       }
> +       return index;
> +}
> +
>  void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
>  {
> -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> -               return;
> +       u32 pc_index;
> +       enum kcov_mode mode = get_kcov_mode(current);
>
> -       sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> -                                      current->kcov_state.s.trace_size,
> -                                      canonicalize_ip(_RET_IP_));
> +       switch (mode) {
> +       case KCOV_MODE_TRACE_UNIQUE_PC:
> +               pc_index = READ_ONCE(*guard);
> +               if (unlikely(!pc_index))
> +                       pc_index = init_pc_guard(guard);

This is an unlikely branch, yet init_pc_guard is __always_inline. Can
we somehow make it noinline? I know objtool will complain, but besides
the cosmetic issues, doing noinline and just giving it a better name
("kcov_init_pc_guard") and adding that to objtool whilelist will be
better for codegen.

> +
> +               /*
> +                * Use the bitmap for coverage deduplication. We assume both
> +                * s.bitmap and s.trace are non-NULL.
> +                */
> +               if (likely(pc_index < current->kcov_state.s.bitmap_size))
> +                       if (test_and_set_bit(pc_index,
> +                                            current->kcov_state.s.bitmap))
> +                               return;
> +               /* If the PC is new, write it to the trace. */
> +               fallthrough;
> +       case KCOV_MODE_TRACE_PC:
> +               sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> +                                              current->kcov_state.s.trace_size,
> +                                              canonicalize_ip(_RET_IP_));
> +               break;
> +       default:
> +               return;
> +       }
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
>
> @@ -255,7 +317,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
>         u64 *trace;
>
>         t = current;
> -       if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
> +       if (get_kcov_mode(t) != KCOV_MODE_TRACE_CMP)
>                 return;
>
>         ip = canonicalize_ip(ip);
> @@ -374,7 +436,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
>         /* Cache in task struct for performance. */
>         t->kcov_state.s = state->s;
>         barrier();
> -       /* See comment in check_kcov_mode(). */
> +       /* See comment in get_kcov_mode(). */
>         WRITE_ONCE(t->kcov_state.mode, state->mode);
>  }
>
> @@ -408,6 +470,10 @@ static void kcov_reset(struct kcov *kcov)
>         kcov->state.mode = KCOV_MODE_INIT;
>         kcov->remote = false;
>         kcov->remote_size = 0;
> +       kcov->state.s.trace = kcov->state.s.area;
> +       kcov->state.s.trace_size = kcov->state.s.size;
> +       kcov->state.s.bitmap = NULL;
> +       kcov->state.s.bitmap_size = 0;
>         kcov->state.s.sequence++;
>  }
>
> @@ -594,6 +660,41 @@ static inline bool kcov_check_handle(u64 handle, bool common_valid,
>         return false;
>  }
>
> +static long kcov_handle_unique_enable(struct kcov *kcov,
> +                                     unsigned long bitmap_words)
> +{
> +       struct task_struct *t = current;
> +
> +       if (!IS_ENABLED(CONFIG_KCOV_ENABLE_GUARDS))
> +               return -ENOTSUPP;
> +       if (kcov->state.mode != KCOV_MODE_INIT || !kcov->state.s.area)
> +               return -EINVAL;
> +       if (kcov->t != NULL || t->kcov != NULL)
> +               return -EBUSY;
> +
> +       /*
> +        * Cannot use zero-sized bitmap, also the bitmap must leave at least two
> +        * words for the trace.
> +        */
> +       if ((!bitmap_words) || (bitmap_words >= (kcov->state.s.size - 1)))
> +               return -EINVAL;
> +
> +       kcov->state.s.bitmap_size = bitmap_words * sizeof(unsigned long) * 8;
> +       kcov->state.s.bitmap = kcov->state.s.area;
> +       kcov->state.s.trace_size = kcov->state.s.size - bitmap_words;
> +       kcov->state.s.trace =
> +               ((unsigned long *)kcov->state.s.area + bitmap_words);
> +
> +       kcov_fault_in_area(kcov);
> +       kcov->state.mode = KCOV_MODE_TRACE_UNIQUE_PC;
> +       kcov_start(t, kcov, &kcov->state);
> +       kcov->t = t;
> +       /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
> +       kcov_get(kcov);
> +
> +       return 0;
> +}
> +
>  static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                              unsigned long arg)
>  {
> @@ -627,6 +728,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
>                 kcov_get(kcov);
>                 return 0;
> +       case KCOV_UNIQUE_ENABLE:
> +               return kcov_handle_unique_enable(kcov, arg);
>         case KCOV_DISABLE:
>                 /* Disable coverage for the current task. */
>                 unused = arg;
> --
> 2.49.0.604.gff1f9ca942-goog
>
