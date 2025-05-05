Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84F26C39A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468397; cv=none; b=f/DRguhbvrJcBqi3eYWFehPZA5/kX97BwMXig0HnCdXxj6uWhwwjKS4pSbsadtD6kQj1qhsgSUGOWLAKR4AbZqIpfdGcgXe0jwsJ/CV0L7fzIchTum6AXFlJ7qk867AaPR0u6C25AR69XyDd4VS7yiARNxIkTnY0aDaP6ZxQT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468397; c=relaxed/simple;
	bh=C4jvpmmLZCD+4CDn8JAO32mwlp/Z9dinY9dtud1mftA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNS/mQGLrCFKSbg9rkfmvt1JmUFaSUw6I4v6c3dPa+XySmzGe0p8j/gDck8ck8ssbV+5BOlAipXhXaotTY7wuQfwN5B9+6JFbtyCizZFr3A7cOtahonRA7dtJpBVEYF1Lo5QX56/5C2084Q/+lMpWyBdrOJF083dUKHDKvQ8QRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGVEl4TG; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGVEl4TG"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476a304a8edso58399101cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746468394; x=1747073194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swj8xv+CvK8GwQKDrfM8nYLpl6Lcb5KgxzPXic4IwRk=;
        b=VGVEl4TGdHhoroggz3XAjpf/usRJoOOkTGcH+fe4gTsAgmkcE6sSkhFcz8sq5IT6Md
         PDl4MOV3OgNyh7mMgEdiSpfwMvbIPIc7a7NgpjKD8NWFrPQOiQ9hXpPLSku+JYTCwR2R
         tuA5oN96y193eED0ZjT6J8B3B/fWBCT1sa1/WTltqdbiBctwzMpNTZqq5QDR9Vr84ThF
         dv97gU0igR2mG5EkQmexwCbkYw1FM09OywV0LUZRNc+ewxcj06gPY7WNeGpWis+ox42b
         cxNidxV6EVe7KAiJHuML0v71765uS3E5hT6vweXzHMM+c93andTGNtgnGufpBCQitVw5
         ykWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468394; x=1747073194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swj8xv+CvK8GwQKDrfM8nYLpl6Lcb5KgxzPXic4IwRk=;
        b=S4tkeprX5KXAlp08+d7/rgJu8MkanA1hfOZw8gmU8Oh5YqfLZnKmFZqF4dII519YW9
         dCijw5bhNbQTjgWcGBaMIzuRLpQYvAoigGORS+o9NqL6A8PT8UpO1rcK264GJ+2w+G00
         VXKGWe641bFH91jebMAZiMgryd2GdDmMCQKoBjKKcvn1UaMdqk6pT63aiwUs8aKEK3dM
         /gK4FiXJnB4kJ3P8IRxctDw/yWplpKoAy+XjJNGC1inHIsfPssI04AQVO2N/2VDpGVV7
         M5sXeZ6batv5pvfeS1QPvo22q6tA45wDm1gs9o/c2NYGHCnZfPtlM1iwCv1O+QDErOnt
         M9pA==
X-Forwarded-Encrypted: i=1; AJvYcCUnx8/Cf+WFvrdIPpOrnirZ0pJNng+swtPLbZBZN+MikFrvJzcbhjM6QrsNlsV6g2j9QQkDxNgyfuWM6j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjCLNpM+ZguYsugd7eu5QiiM994C4Hkea3tMESxE4g6RbVMsK
	0zbqRnlZmIA7CSdwhEUnSEm0UBgZm49BNk7E9ncObVFDalhmQJB1YvwbWa7PIEkp80lJdHUEA9m
	WBOA2LcYGpqVKZzUotLe314rGOu+T+FkwV3+G
X-Gm-Gg: ASbGnct9eCVdEMLWteoBw9royMXyu07gAoIAIjNhvVLXjD0wCh+aLRbVOTrjMGwxPY6
	h4htPx6SBfPN0xt8PY49b2ex1mnewbagOOLoy4dtG+fmkO85sWOo9fcN4iNUPb3+qY/HgCU1GDs
	Z9/XRVFppEc7CcIR8l5YUJsoHnWrcO2A==
X-Google-Smtp-Source: AGHT+IE+0rMM7kY07DRyIRHMXvbXKs24lzYachx2Siix7kFU/j2UUwv6Q7ZzNjLJXrh91Ebui0d21FXvVkAD7BY9DuU=
X-Received: by 2002:a05:622a:307:b0:476:903a:b7f0 with SMTP id
 d75a77b69052e-48d5dd6c5ccmr151157591cf.49.1746468393837; Mon, 05 May 2025
 11:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505171948.24410-1-aha310510@gmail.com>
In-Reply-To: <20250505171948.24410-1-aha310510@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 5 May 2025 11:06:22 -0700
X-Gm-Features: ATxdqUHgfoh3-NxsvTQSivZbaep8sPJ1h-gcDPSGMbStAQQh7YxdOEg5Q_IolMQ
Message-ID: <CANn89i+XaOxe+AOma=H+JuDuFm9b2_1x3x6r6BdhkHFxXAn8Hw@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: fix data race in show_numa_info()
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 10:20=E2=80=AFAM Jeongjun Park <aha310510@gmail.com>=
 wrote:
>
> The following data-race was found in show_numa_info():
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
>
> r
> value changed: 0x0000008f -> 0x00000000
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 8287 Comm: syz.0.411 Not tainted 6.15.0-rc4-00256-g95d=
3481af6dc-dirty #1 PREEMPT(voluntary)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/0=
1/2014
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> There is a read/write data-race in counter[]. This seems to be happening
> because only read memory barriers are currently applied, so we need to
> modify the write operation to counters[] to be handled atomically.
>
> Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  mm/vmalloc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..d93fa535bc21 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4917,7 +4917,8 @@ bool vmalloc_dump_obj(void *object)
>  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
>  {
>         if (IS_ENABLED(CONFIG_NUMA)) {
> -               unsigned int nr, *counters =3D m->private;
> +               atomic_t *counters =3D m->private;
> +               unsigned int nr;
>                 unsigned int step =3D 1U << vm_area_page_order(v);
>
>                 if (!counters)
> @@ -4931,10 +4932,10 @@ static void show_numa_info(struct seq_file *m, st=
ruct vm_struct *v)
>                 memset(counters, 0, nr_node_ids * sizeof(unsigned int));
>
>                 for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> -                       counters[page_to_nid(v->pages[nr])] +=3D step;
> +                       atomic_add(step, &counters[page_to_nid(v->pages[n=
r])]);
>                 for_each_node_state(nr, N_HIGH_MEMORY)
> -                       if (counters[nr])
> -                               seq_printf(m, " N%u=3D%u", nr, counters[n=
r]);
> +                       if (atomic_read(&counters[nr]))
> +                               seq_printf(m, " N%u=3D%u", nr, atomic_rea=
d(&counters[nr]));
>         }
>  }
>
> --

This patch looks bogus to me.

The race is about using m->private for storage, while the same file
can be read from multiple threads.

Using atomic_t is going to silence syzbot, but the bug is still there.
