Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA323370A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817982; cv=none; b=BHWlFU9Y5k1YXmWjqTIWt7i6uT/Dc9iL0IgjCPYM61r3e7sWu48cqnbl06q0igvIPVHe9gROtF5PJFqKocHuuDLNYEzZVFwUsVZrAkX04GcS98yCIJHePRO+pDu0u+zrLSWfNplVoSXkpiVHKdbZ1qGC1+z1Nqnu+TGdYaFhO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817982; c=relaxed/simple;
	bh=i4wZouwFlkojP3jWV+qlAhibaIlOcs9zqHWcwHgDZ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRtB1ystu98hrIjLzqMH3ruPEF9lmL466Gta80aQBmHbtj5AC8DqWNONz6YQmvtrJt4rxeNy9FPKeVR4E9eeq6l0t7bXNHeSvsurQLxCWKBzDDppbdBybWERTQd0gRjdco4nJK0t81XKFG5pT2pxiss+YOmjjscLsTQSixkRfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3frywYX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3frywYX"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32805275d68so35470321fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817979; x=1748422779; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lsmGTT3WJ7QBK0EqaweIw3NkYfBoONRBDLxbR8aeSoc=;
        b=Q3frywYXVGS/GqP/bXC0IyC6FGz4fam804mylDYcZ4P4KUiKmKnyZV47hBuVjRk72K
         je0iaisB65M49Dh8A8ZMm3ZbT3dKRkTsaPG59/nric2Ef4N37g33a3CcJH4s4uVySyN6
         +ly3AtSdFdK9ws5UCguL+1YQ1blqP/P16XutTdlIOyIDWLeAKQSnmuRVrORlNsGw6A6c
         6XpDG1A54teVIAPoyPrrMYiaR9JjOBBPX3IMOW7Zc+BwzYkHGwstuDqxbpPRKCT7UbM3
         sHMMi4RXURZUf7iroqt8oX4D6tz6c5pn7TLdFXDHs1HJow6QLmytc29KI2syRnA5truu
         YKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817979; x=1748422779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsmGTT3WJ7QBK0EqaweIw3NkYfBoONRBDLxbR8aeSoc=;
        b=OIcf/t3zkrLFr0UaoduJsD3IDZASR1KPhaMAQ6i46IImpqd3GLAE7xaE2j+mxoisJe
         U8ggjg0uyRfMWuIR+tTBgXmeV9VreQe3KKt5lluFQj3YNHgTD7FmhQafvx81J3fJx0LI
         jeI6ubjlPcyk2iO6cXBWaQqyw3VtVBpKlxMj7oxPYdZl4L0+HzictHAlPbywrtYLFoGi
         d9UtPPAPgTKY/fBMZgkgISPa/EMKYh9vIvf1zWHD7W7YlfJp4sNoE1PCPX1ITYi7+hXR
         g6bFYAI5OqNZKWdraPPH0Si+08En3ou5sNcWXYLmdMh2dwk5cCaYnVTRew8KvReUu9CL
         eo3g==
X-Forwarded-Encrypted: i=1; AJvYcCUn5jvH4RUhSoA8BMM5Qe3do+S8b4809RCNG2ql6As1shZFE+eHv1qneh99AAhrmkxwkkIzX7u04fqGhjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1E9cV2qqQByuhSPDM1zntM3aCgtdZRuiOMpCaAkxERwtN41x
	BrOhR6pJYVhIKjsFrKikc3KRiJVzJTdJ0xQ2Tkv9YjDrBXl9EyvTDaY7ER/oc0D1Z1nBYbgsfgL
	JLxqkVSBUzMDbFwnYCG12BKWN3F5RS6FV//8PGQ4K
X-Gm-Gg: ASbGncsYyzuTtiWvQCy4jFKdehjpqGbriuhZGIvkZQmrNbpZX+7iru79ohG7oPIUCO+
	EznRjwUqh99oh+FsUdXOK6xADNax6DA0heqWjWQ1bCquoaz+oCQJJlqv55R4FH3ljtbAHNDdMdu
	gZkBH+Q7QZnhHaRk+Ng1J5ni0lsenEEQt5KkTu6MHBmrIUVHOxNQziuYYjJAX4dyE3KZvmffAGp
	Mc=
X-Google-Smtp-Source: AGHT+IEUyqnFN/BfMkVdGPu+JwoBWcxfxJ4tRllplvtsrVwylzIEz++xeiOZkSqczqg4oMjQZrC8vZw9SpFHBrMWTII=
X-Received: by 2002:a05:651c:2229:b0:30b:efa5:69c3 with SMTP id
 38308e7fff4ca-3280778ac09mr79117911fa.22.1747817978687; Wed, 21 May 2025
 01:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com> <138c29bd5f5a0a22270c9384ecc721c40b7d8fbd.1747817128.git.dvyukov@google.com>
In-Reply-To: <138c29bd5f5a0a22270c9384ecc721c40b7d8fbd.1747817128.git.dvyukov@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 10:59:27 +0200
X-Gm-Features: AX0GCFtGAPb8-GG75JNkuSMgwg8Mwu_bG6XNoqFo6nwKLpneMMwMEV1UdKOAo7M
Message-ID: <CACT4Y+ZcQV3JWEaeh7BXNwXUsoH6RcVRyG2iNUA+_mrOBOHfNA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] rseq: Make rseq work with protection keys
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 10:52, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> If an application registers rseq, and ever switches to another pkey
> protection (such that the rseq becomes inaccessible), then any
> context switch will cause failure in __rseq_handle_notify_resume()
> attempting to read/write struct rseq and/or rseq_cs. Since context
> switches are asynchronous and are outside of the application control
> (not part of the restricted code scope), temporarily switch to
> pkey value that allows access to the 0 (default) PKEY.
>
> Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")

Dave, can you please ack this patch? Ingo said he was waiting for your
review before taking this to -tip.

> ---
> Changes in v7:
>  - Added Mathieu's Reviewed-by
>
> Changes in v6:
>  - Added a comment to struct rseq with MPK rules
>
> Changes in v4:
>  - Added Fixes tag
>
> Changes in v3:
>  - simplify control flow to always enable access to 0 pkey
>
> Changes in v2:
>  - fixed typos and reworded the comment
> ---
>  include/uapi/linux/rseq.h |  4 ++++
>  kernel/rseq.c             | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
> index c233aae5eac90..019fd248cf749 100644
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -58,6 +58,10 @@ struct rseq_cs {
>   * contained within a single cache-line.
>   *
>   * A single struct rseq per thread is allowed.
> + *
> + * If struct rseq or struct rseq_cs is used with Memory Protection Keys,
> + * then the assigned pkey should either be accessible whenever these structs
> + * are registered/installed, or they should be protected with pkey 0.
>   */
>  struct rseq {
>         /*
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index b7a1ec327e811..88fc8cb789b3b 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/sched.h>
>  #include <linux/uaccess.h>
> +#include <linux/pkeys.h>
>  #include <linux/syscalls.h>
>  #include <linux/rseq.h>
>  #include <linux/types.h>
> @@ -424,11 +425,19 @@ static int rseq_ip_fixup(struct pt_regs *regs)
>  void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
>  {
>         struct task_struct *t = current;
> +       pkey_reg_t saved_pkey;
>         int ret, sig;
>
>         if (unlikely(t->flags & PF_EXITING))
>                 return;
>
> +       /*
> +        * Enable access to the default (0) pkey in case the thread has
> +        * currently disabled access to it and struct rseq/rseq_cs has
> +        * 0 pkey assigned (the only supported value for now).
> +        */
> +       saved_pkey = enable_zero_pkey_val();
> +
>         /*
>          * regs is NULL if and only if the caller is in a syscall path.  Skip
>          * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
> @@ -441,9 +450,11 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
>         }
>         if (unlikely(rseq_update_cpu_node_id(t)))
>                 goto error;
> +       write_pkey_val(saved_pkey);
>         return;
>
>  error:
> +       write_pkey_val(saved_pkey);
>         sig = ksig ? ksig->sig : 0;
>         force_sigsegv(sig);
>  }
> --
> 2.49.0.1143.g0be31eac6b-goog
>
