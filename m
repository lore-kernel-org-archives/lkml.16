Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204219F41C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304457; cv=none; b=i9T0rMOMBXHpjuVNF6a2J3UtwWyxZeJ3kZ/Uevs7S4a4T6DkLs55Wqmg+AVU9tqSWX7wZLFCSGgnQg1ELNL6qF/8c7pNGn/VXsHp7eD9nE8yky7KkK2DQzvTIp0iO8pl1yS23h7oCUiPyZf3Htx7A87P/pf3R1/ywAOPPlHgVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304457; c=relaxed/simple;
	bh=Q3mDMCr7L6ihqEAT75pfIPd7Tu8bZeKaRg5UZnxARmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPsyjI5RhrOHTGS6ac3Nxa74zW8r1EXfyGb3ojsVuY6TF8AGac7AyyTPuc3ZzPQOoPRViXULD1VjJn56o2fuLNDeO6NEsJ/bNzwOFuMbYPUf7+Ajo0yuxq8Fj+eC6HemIunFcC6Ehf9jE1/8Xne7tqhVZLIZbuG8I8resEYOsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=onhX82Yo; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="onhX82Yo"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b09c090c97eso3109374a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745304455; x=1745909255; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKAS6wIFBYTNQk2AG4y+zlvav2QzKZsBSU++J/GtuPI=;
        b=onhX82Yoe+8MVDVf4X0OqkNKe+Z9aCNY4G7vyKhM5K/FBhYqiIyqJaw+BLMRjYSAMZ
         uutmsU60riAC6cF+M38ZUh6ojwa59U2j1GWXyid9dWY904ANnFLh/zuFikXUrftthjP5
         dz5lqObQHeCDs8yhNcwDDlW3PRAuZL/l6kxUbyCF3KB9j+0u0dh/Rt3lXHdA0d2Rzxhj
         6PRSppanlTQMfz1LNmOLWU4MeIW+SiLwsgwOk68e8CHi+zFrEp8y14f1Z3FQh3prVyfe
         qBXjVFwDc735sJ7q/7Ioj9P0piVHZyCdFsISkabc9aiSA9GCMWHY0c1W0EkDHwEo6VP6
         Y+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304455; x=1745909255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKAS6wIFBYTNQk2AG4y+zlvav2QzKZsBSU++J/GtuPI=;
        b=AuoU5/8B9fv2Dr93GWlqim/kJ8UQpCAwKdOH8FlqIGNIxfpnx5kGvdSS3SSUZQVAji
         Lmdv5anPt6jB+DQplHiB/OdOt9D/bw62yVzE+digj/FN+A2OBD2K2Sv03zvV+s5uwULT
         ABEp7nOdI+DQkVuLUPsO2s6TXeWQ2gg+I5jMa026HtOsTxUI16imxCzXS8THpKn26KZr
         c4Ush5X4Xw1sy3xG413RQA1jdlhMNvnnp4GALFNbXAIr1kLoxiPTkFE+dLz7ZwPN569N
         pM7k2zKsEWveASxf3SqAODCFIwWXRy95I83AkfVA/ZpdZil5lCZLZmWUS44Fyxg9AOdI
         hgag==
X-Forwarded-Encrypted: i=1; AJvYcCUVPafv7axbF4BDHfc41N16S7iXhoL5NpOyBzH4HkP+Jmza89DNtyZo0CG2Vs3bFpKJtqTtM8chmhfl03k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsa5zvQlFCvYY7LpqcojgmWqP55O19z7cdzZQc8RLKjbpj/Oqd
	WNbf6I9KfJqzvSeQ4Qi/AKZNFncvvafgklpK8HXtmEEmch05BUNUfdK4fEjtZOM1OBfARvWyYQ4
	u6HRcbz4Pe6K8BpUqord8oVgLqlbRlXQLqObp
X-Gm-Gg: ASbGncvbiO+lAOItE3gRGMvwE9k45b1+W3MxD2jtZmXbIzTCJv/mVr4HSFlaG7dGZ4j
	UYkkcv6xz10YriNeoDGQvhp47QHR5usp0zQO/kHmYVc+dwaDVNZ+gjcsT5GVa/5SY+Y8uDbspZD
	qNi9kqINoZYsAwgfJhcKIv401lqS66WwOvMhLfzWT+T4DzikOzma/x5FONbWJwDT4=
X-Google-Smtp-Source: AGHT+IGMqZRpiJO58eGAGeAfech6+aE6fScxS6rdcjnDp1Pw14dp9rG9UseK27B/RuRJPlceKWlVcgkQXsCp+QmaIiI=
X-Received: by 2002:a17:90b:3c90:b0:2ff:58e1:2bc9 with SMTP id
 98e67ed59e1d1-3087bbb08c0mr19968579a91.25.1745304455382; Mon, 21 Apr 2025
 23:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-8-glider@google.com>
In-Reply-To: <20250416085446.480069-8-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Apr 2025 08:46:59 +0200
X-Gm-Features: ATxdqUGqkiU8trjykBZPrhmswWXTH5ZyG4HAu5DV93iL9sw00B1XdAfKjEaLIO4
Message-ID: <CANpmjNOZyFeX2OfPsZkB3DfcFrdSWO9m+yGwB_rN3Mc+JySqnQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
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
> Calls to __asan_before_dynamic_init() and __asan_after_dynamic_init()
> are inserted by Clang when building with coverage guards.
> These functions can be used to detect initialization order fiasco bugs
> in the userspace, but it is fine for them to be no-ops in the kernel.
>
> Signed-off-by: Alexander Potapenko <glider@google.com>

This patch should be before the one adding coverage guard
instrumentation, otherwise KASAN builds will be broken intermittently,
which would break bisection.

> ---
>  mm/kasan/generic.c | 18 ++++++++++++++++++
>  mm/kasan/kasan.h   |  2 ++
>  2 files changed, 20 insertions(+)
>
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index d54e89f8c3e76..91067bb63666e 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -238,6 +238,24 @@ void __asan_unregister_globals(void *ptr, ssize_t size)
>  }
>  EXPORT_SYMBOL(__asan_unregister_globals);
>
> +#if defined(CONFIG_KCOV_ENABLE_GUARDS)
> +/*
> + * __asan_before_dynamic_init() and __asan_after_dynamic_init() are inserted
> + * when the user requests building with coverage guards. In the userspace, these
> + * two functions can be used to detect initialization order fiasco bugs, but in
> + * the kernel they can be no-ops.
> + */
> +void __asan_before_dynamic_init(const char *module_name)
> +{
> +}
> +EXPORT_SYMBOL(__asan_before_dynamic_init);
> +
> +void __asan_after_dynamic_init(void)
> +{
> +}
> +EXPORT_SYMBOL(__asan_after_dynamic_init);
> +#endif
> +
>  #define DEFINE_ASAN_LOAD_STORE(size)                                   \
>         void __asan_load##size(void *addr)                              \
>         {                                                               \
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 129178be5e649..c817c46b4fcd2 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -582,6 +582,8 @@ void kasan_restore_multi_shot(bool enabled);
>
>  void __asan_register_globals(void *globals, ssize_t size);
>  void __asan_unregister_globals(void *globals, ssize_t size);
> +void __asan_before_dynamic_init(const char *module_name);
> +void __asan_after_dynamic_init(void);
>  void __asan_handle_no_return(void);
>  void __asan_alloca_poison(void *, ssize_t size);
>  void __asan_allocas_unpoison(void *stack_top, ssize_t stack_bottom);
> --
> 2.49.0.604.gff1f9ca942-goog
>
