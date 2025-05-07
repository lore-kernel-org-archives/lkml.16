Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583517E4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634247; cv=none; b=M6rjFqkgQvTbeoi2FeDfuJBlT5xD588HGO5V+8B2VUkNUBuOLJVpzEGf4lKdfnmxFtONaof3+/5P5noLfpLDBnuN1gxC0vJuRqLhfXcpuy8pUF3xzedaUikzqvkStF6mOyCAo+TiFHAC7tzySCqU4L3lYckzNMERwCYQdSJlZjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634247; c=relaxed/simple;
	bh=brWwpEfWxnMAFY/kJwwmfCsXqOEn51SqI1I8mCSzlRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bp9EL8xWjx1+//DkDCB0encfrA/FAy+9/0rSQ/oRAYteUn2vs3Ft68ARHshDCXTI3jNCX4a0j8WzxHo+yKDFoc75e+xDBEaK5WAqkKqe/NZwq6nDpJ6hAX+gYALeDzm/20QCZ7fDP9tCRUZ2Rx6d6cRxzgJOqbgmUZxd9pwYjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ncCOxkQ1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ncCOxkQ1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b1396171fb1so4317082a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746634245; x=1747239045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tzZXY4+kZQl5HFpe8i6WC+loNaLSCDjR3rOfrJMJkeg=;
        b=ncCOxkQ1oDJfP9a9ACOlnNRqBYxcneRN6BxBvRQzIeW5Kd2Ef/GeooVe+C0u1WLcO0
         AbwizjwcxQPoYjDMKovvf3pZrNZcn9HsvPuOIv+RKgiQH8NH9a07fQB63Te+gBLVqWY3
         8KfG8maIScKjsBokk2GLtVBDaZnyoqdv8wX6Zq/Dw9nQ0aBE6BRaP4Pv4xfymxff4SVI
         0PAt8lmOQCrhvMGj8yK7gguoZm/gZDLedRfle9TH72zD0ivjLXOzZo7prQsg5ug9IkDb
         kBy1s2ViJ7T+4CbaWC/QbTFnHRlHDU+h6yjG0z7EOnT3yOtvNA3myrZu5qnvOl13iZTj
         8stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634245; x=1747239045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzZXY4+kZQl5HFpe8i6WC+loNaLSCDjR3rOfrJMJkeg=;
        b=k2yhsq3qqjj4wMKFljjwbZi2wxMpVTTEbu+z2hdjO83bOCUURp5XrahAMgjlgzOwLi
         Za8G8kcRobt5lKVjmKjgTIhaunwm6E3uMvwllY318g0O5VnuFwcE5LKZWArQQArXsMPN
         361SrNDSbBF5kD54KhuFJYjFyJQ7UVifEzw7SmncKlKMe45P1v+YxW8OWdXO4kmKSMGM
         bvfE1tC9EfkRC8cmfDop5chwwrfdJvH2dUt7ACHzs3EoTdHTHCCuppBZZFfBBgjatA/m
         CtsECl5Tdzcjnd0ZZbNt9T/X8S4v6FmPWLGTA0v1PM1MCBSdsj/lAuFWZKPi61mfWPx3
         8whw==
X-Forwarded-Encrypted: i=1; AJvYcCUyh/nnZhjo9PI0IlNfPU049OGHdtRZ3mc84T6gnZLVAaZIq9ixIWPc4ghHbjId4hoiLeK2oMl/zgMIlcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcflfL7rxCsysZgo+UqzCjeOosvlGh7cUXlukgwvGRQKmoVU0d
	92fBbrIr68gG3BltlH7JDZ9Szd9i806NCQVyWE/PO5GeupCAHOBJubLT8hE+8CEDVBEMb1fa/8M
	5sjfv/QHeCSpCN/CVpRtmOpfM9kMHEctaV7vl
X-Gm-Gg: ASbGncvo45Rq6lbAIagKXadeD8TcpwKd2rV5nbUCzvvPzzfT2RZcbT/q3Gc1BxT7tuF
	/U8Ss8CETwsHW4FAevm8sQ7pKHyL+tIzvMRr2zu3baNgpklYBXZa7Utg+967Ng6/UKzvx/S5bG+
	+dZA9F+J7kcX8c/zlMRuIXkbWiKkVR5iy8BW1CegxE7PPXMijofS+8l7rVXkHcaIpX
X-Google-Smtp-Source: AGHT+IE+5gWUfoikXS/RQHbpiS97QZDplEzuGYXrnMyZ0hYIXlvLR4QUzWKmh8bZ+bpKQVRE+DDhJW8Vceh+z7m8ZIE=
X-Received: by 2002:a17:90a:8a0e:b0:2fe:b937:2a51 with SMTP id
 98e67ed59e1d1-30aac28b737mr5683271a91.33.1746634245268; Wed, 07 May 2025
 09:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-5-glider@google.com>
In-Reply-To: <20250507160012.3311104-5-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 7 May 2025 18:10:08 +0200
X-Gm-Features: ATxdqUHpnwYmhy45jfBUre0B7_p2RU_rQE72-Bu393Mv_C7ux1bSvhFcJF5Eo88
Message-ID: <CANpmjNPpbSxWdaw=N_-gnweok9XtaJ-Pqcg15Z=Kko9sUffwhQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] kmsan: rework kmsan_in_runtime() handling in kmsan_report()
To: Alexander Potapenko <glider@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wrote:
>
> kmsan_report() calls used to require entering/leaving the runtime around
> them. To simplify the things, drop this requirement and move calls to
> kmsan_enter_runtime()/kmsan_leave_runtime() into kmsan_report().
>
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Acked-by: Marco Elver <elver@google.com>

> ---
>  mm/kmsan/core.c            | 8 --------
>  mm/kmsan/instrumentation.c | 4 ----
>  mm/kmsan/report.c          | 6 +++---
>  3 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/mm/kmsan/core.c b/mm/kmsan/core.c
> index a97dc90fa6a93..1ea711786c522 100644
> --- a/mm/kmsan/core.c
> +++ b/mm/kmsan/core.c
> @@ -274,11 +274,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
>                          * bytes before, report them.
>                          */
>                         if (cur_origin) {
> -                               kmsan_enter_runtime();
>                                 kmsan_report(cur_origin, addr, size,
>                                              cur_off_start, pos - 1, user_addr,
>                                              reason);
> -                               kmsan_leave_runtime();
>                         }
>                         cur_origin = 0;
>                         cur_off_start = -1;
> @@ -292,11 +290,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
>                                  * poisoned bytes before, report them.
>                                  */
>                                 if (cur_origin) {
> -                                       kmsan_enter_runtime();
>                                         kmsan_report(cur_origin, addr, size,
>                                                      cur_off_start, pos + i - 1,
>                                                      user_addr, reason);
> -                                       kmsan_leave_runtime();
>                                 }
>                                 cur_origin = 0;
>                                 cur_off_start = -1;
> @@ -312,11 +308,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
>                          */
>                         if (cur_origin != new_origin) {
>                                 if (cur_origin) {
> -                                       kmsan_enter_runtime();
>                                         kmsan_report(cur_origin, addr, size,
>                                                      cur_off_start, pos + i - 1,
>                                                      user_addr, reason);
> -                                       kmsan_leave_runtime();
>                                 }
>                                 cur_origin = new_origin;
>                                 cur_off_start = pos + i;
> @@ -326,10 +320,8 @@ void kmsan_internal_check_memory(void *addr, size_t size,
>         }
>         KMSAN_WARN_ON(pos != size);
>         if (cur_origin) {
> -               kmsan_enter_runtime();
>                 kmsan_report(cur_origin, addr, size, cur_off_start, pos - 1,
>                              user_addr, reason);
> -               kmsan_leave_runtime();
>         }
>  }
>
> diff --git a/mm/kmsan/instrumentation.c b/mm/kmsan/instrumentation.c
> index 02a405e55d6ca..69f0a57a401c4 100644
> --- a/mm/kmsan/instrumentation.c
> +++ b/mm/kmsan/instrumentation.c
> @@ -312,13 +312,9 @@ EXPORT_SYMBOL(__msan_unpoison_alloca);
>  void __msan_warning(u32 origin);
>  void __msan_warning(u32 origin)
>  {
> -       if (!kmsan_enabled || kmsan_in_runtime())
> -               return;
> -       kmsan_enter_runtime();
>         kmsan_report(origin, /*address*/ NULL, /*size*/ 0,
>                      /*off_first*/ 0, /*off_last*/ 0, /*user_addr*/ NULL,
>                      REASON_ANY);
> -       kmsan_leave_runtime();
>  }
>  EXPORT_SYMBOL(__msan_warning);
>
> diff --git a/mm/kmsan/report.c b/mm/kmsan/report.c
> index 94a3303fb65e0..d6853ce089541 100644
> --- a/mm/kmsan/report.c
> +++ b/mm/kmsan/report.c
> @@ -157,14 +157,14 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
>         unsigned long ua_flags;
>         bool is_uaf;
>
> -       if (!kmsan_enabled)
> +       if (!kmsan_enabled || kmsan_in_runtime())
>                 return;
>         if (current->kmsan_ctx.depth)
>                 return;
>         if (!origin)
>                 return;
>
> -       kmsan_disable_current();
> +       kmsan_enter_runtime();
>         ua_flags = user_access_save();
>         raw_spin_lock(&kmsan_report_lock);
>         pr_err("=====================================================\n");
> @@ -217,5 +217,5 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
>         if (panic_on_kmsan)
>                 panic("kmsan.panic set ...\n");
>         user_access_restore(ua_flags);
> -       kmsan_enable_current();
> +       kmsan_leave_runtime();
>  }
> --
> 2.49.0.967.g6a0df3ecc3-goog
>
