Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05179F5
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750597248; cv=none; b=n0QUosFCclvKDyUV3uXKwpyplifsK7lHhfGOxrPkxm7uDhGVqms7Eejzb45CpZRBXSKXSJ3SfMSgNfUrxfZZy9EqMJjRUZPzofMRTI/9kxbBxx5EiGH90uKTw1CiOk/GBnm8IeeRhdCZAdjKfIzTCBJPkt9oqxfDoSUWGKvRp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750597248; c=relaxed/simple;
	bh=b60IejSY9VzyzZuiVKUNn9qomKiBbwiGgQmUG1XE0hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKHiE2b0V5YLUuBlUW9TqIF0Chg56qiPeAcwb0NMl9W/BNkrqE0kxPjAcFaAuxOchJyB3of6wzkkJ6H6jaORzUup0z+fasyLj+rLhHhUC+IGwdEus0p1FqDwPynOCmFHdJAAV7iKQ4LHRLjvxsHYFJXSGZqs2w9xRlRjcVVcmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STILWeMx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STILWeMx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453647147c6so22407195e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750597245; x=1751202045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdJCP3IGjFjNpzPk6xWCR4zsn18tfTf8CrLc1ojCZko=;
        b=STILWeMxHw7PWJybBbPoa2qdvZkHeo/1O43OcZ8jePyM+k0Abfz9HN5mTZaSXfWOWk
         Ht2a43XoQfR0QpuYGA+5EU0Q9Dn7CkRpcaMEaK5muURBqC678xXeVJplcU7a1NSdTTUs
         LD6J5KVKdVssyl35z1gpesBkej3RJUzlfu4f8/J0ONdM/+hqRneYE4afqh6TMBhmLVJF
         TeCE8Yl6N11/lrt+hh/iykhP5m7rHWuwyqXxskCCl0PqRfjldWGlSQ1C+wXlVsnKWoxP
         D5gZ9EEpmm8kNGHtuFLedgCSgEJBFG8jr8k6x4IyoeP0Hr4JupIU4Hj4uWTT4wcaxEB0
         rRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750597245; x=1751202045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdJCP3IGjFjNpzPk6xWCR4zsn18tfTf8CrLc1ojCZko=;
        b=CYxHJZXEYRylwcjyyk1Ar82ktGRv1lRQdCm3u+QnDcrCFd7JEXI3lgmPbeDcG4TwBw
         Z3WeQ0P7ja8OYq8syGMjINSAtGi+JNpRXCNZqCrOXC2eUhYi9sYrHFiRjbk+I/q8bZJh
         Gdb889rhhwauhu5NP4+6xq/5mjhsA+yZn/dVlDQtYtZVP0FWfaQPUr9UyQwBv6T0ygTZ
         pEab6h47ueuWhVelQA8EL1f2izICsdlOcs07J3caIF0LZCjUA/62bXxThjWV9Dmu0tZ0
         1nb1zB+ICqD2gCsgIJu0kop9WsTMaJJ2MMbhfVPVCYGCC90YbdO6wRVCYi75SEWbQNtA
         OcUA==
X-Forwarded-Encrypted: i=1; AJvYcCWrUFw9FbUM7OQ8/PxeGanxpiF+lkvmTucuHV9lV+Aa3/hMEJItQ7mWe/GHDiHJpZQqunxzCHQBDOTgIPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx189u5UksXV5TwLz6u4hzpxRUktaIpO/iXazp8vrLjx+UkXuF1
	FZcuw/PlfnIfIl7Pnwmlfknq1m8j7oBsdzsQ+Tzs3MPU61HIpOj7XDg/wMv8HFhn7bWwJjNzZE+
	1af/IsioNaEY16RmuO8wPljpKCdPQk8I=
X-Gm-Gg: ASbGncv7pZ5qH4tCd3ehI9vI5+VYwq59gUsokiqNka4dr6g5zSxVbTWeHvMyipNTlrx
	TctBm/d1ZlcM3vqnUd1vzmfQjI7CvfqIYiTQk9GAiTUKqhLH3YHYokCObv75SAHgJpHXBZdHJ6k
	QK+ByIW4Vu4hewmg7BdSE9z+ksgkC9ldI4hASY50ctucHRNA==
X-Google-Smtp-Source: AGHT+IFzr9f6rWciNyiuAYrcxK+S2hQKO/PfnHre1skviLIkEB9KWSWr2OaKz+9b64I+WBPNt7mrTErmt4hd1Gnn+hY=
X-Received: by 2002:a05:600c:c4aa:b0:453:a95:f07d with SMTP id
 5b1f17b1804b1-453654cb7b3mr107100065e9.10.1750597244951; Sun, 22 Jun 2025
 06:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622051906.67374-1-snovitoll@gmail.com>
In-Reply-To: <20250622051906.67374-1-snovitoll@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 22 Jun 2025 15:00:33 +0200
X-Gm-Features: Ac12FXwDCMDtes9nEuHZSX21IEb-3roo_RAemSxrzaRE-NRx5fyXMcdS_EvWEQc
Message-ID: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
Subject: Re: [PATCH] mm: unexport globally copy_to_kernel_nofault
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, hch@infradead.org, elver@google.com, arnd@arndb.de, 
	glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	akpm@linux-foundation.org, david@redhat.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 7:19=E2=80=AFAM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> `copy_to_kernel_nofault()` is an internal helper which should not be
> visible to loadable modules =E2=80=93 exporting it would give exploit cod=
e a
> cheap oracle to probe kernel addresses.  Instead, keep the helper
> un-exported and compile the kunit case that exercises it only when
> `mm/kasan/kasan_test.o` is linked into vmlinux.
>
> Fixes: ca79a00bb9a8 ("kasan: migrate copy_user_test to kunit")
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
>  mm/kasan/kasan_test_c.c | 4 ++++
>  mm/maccess.c            | 1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index 5f922dd38ffa..094ecd27b707 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -1977,6 +1977,7 @@ static void rust_uaf(struct kunit *test)
>         KUNIT_EXPECT_KASAN_FAIL(test, kasan_test_rust_uaf());
>  }
>
> +#ifndef MODULE

Would be great to have a comment here explaining the ifndef.

>  static void copy_to_kernel_nofault_oob(struct kunit *test)
>  {
>         char *ptr;
> @@ -2011,6 +2012,7 @@ static void copy_to_kernel_nofault_oob(struct kunit=
 *test)
>
>         kfree(ptr);
>  }
> +#endif /* !MODULE */
>
>  static void copy_user_test_oob(struct kunit *test)
>  {
> @@ -2131,7 +2133,9 @@ static struct kunit_case kasan_kunit_test_cases[] =
=3D {
>         KUNIT_CASE(match_all_not_assigned),
>         KUNIT_CASE(match_all_ptr_tag),
>         KUNIT_CASE(match_all_mem_tag),
> +#ifndef MODULE
>         KUNIT_CASE(copy_to_kernel_nofault_oob),
> +#endif
>         KUNIT_CASE(rust_uaf),
>         KUNIT_CASE(copy_user_test_oob),
>         {}
> diff --git a/mm/maccess.c b/mm/maccess.c
> index 831b4dd7296c..486559d68858 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -82,7 +82,6 @@ long copy_to_kernel_nofault(void *dst, const void *src,=
 size_t size)
>         pagefault_enable();
>         return -EFAULT;
>  }
> -EXPORT_SYMBOL_GPL(copy_to_kernel_nofault);
>
>  long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, lon=
g count)
>  {
> --
> 2.34.1
>

Other than that:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thank you!
