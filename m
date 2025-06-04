Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408581420DD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749011361; cv=none; b=iPAcGEJ/MOTBCgJLa8cifSn2STfGC9h81R2C6CBVTKbbhHSYvcJdhFN3k8S1/BxcOBexBtUZW5WYOMGibHx9WwQQdYV5iw9bUU7br8t5kyG0ErXUANuOj2z2Fkeo3pa0/sPx6A1WB05sgEVlvQNYWIE/J21sBfZGOIGaph9VP0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749011361; c=relaxed/simple;
	bh=9csZ3Gcth6WJNkB5b9Wr1HShSGj7odzvAtZL7/7yaZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n61/7IqVDizN1+1VvIsoygCLY6AHQ+6Z/ePnhLpv17ReGzF4/3xuf7FvSSc79KwGE7itrbOvSSTLjFWK0g4+8ABXeBhDACxAX93TlwDqY1OrR7pLp7LLWbOWLnXXZcNb/I/yP+PDR94M0auI6neraf20kJwtDOWGEYIypw8RiBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JHajTVmB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHajTVmB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ca5eba8cso125975ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749011359; x=1749616159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGNSBEf0AD284oSE13H/FFAffi0rYgrIINmsLvBpAlI=;
        b=JHajTVmBDIRWXZooXOtWBKdogAMylkEASxJL9i2Q1EAxY3G+Qg7vGlxjVDGZ3Vxpd5
         Qr6OCxCg/Sh/Kcme8mm1GLq8DoH8x7ByIEfB8U/WrotlcwXmLyltlq82TumrcItay/Wk
         v0rc71pvKg7dr4s71aGQerIvLrU4Vi56tp4oQvWIBh2d5k9IUjUjBdtUwnTNAhCLWZFk
         pV2NFvnNfQpSkQSsChQ0UiG3sCq9LeqLoc9Es2VP5a5MzqPkcamZOr+87Lh5NbeTIVKs
         oNl27mPk6Nqdm8PxnrTHSgJHVqCVy1vXTLchSyCMCYoIC4kEUyNP47aXrZWHgBE2IJoA
         jvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749011359; x=1749616159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGNSBEf0AD284oSE13H/FFAffi0rYgrIINmsLvBpAlI=;
        b=K7oVTP7NGEgvbaMj7Ok643Kes6s6EP2GAls0/ai3ujjNYz4maRWddXsJq6lIqTgMvp
         XOGRxTWX5gFUkNE8SN4PyZhnq+eOMFuwPx4tBdg7FeCwk3CK57rtaASBEVjCjgVHZSvy
         ZCGJmJ/Lsz4Q1giGp+hhIA1c6YkIhUOTYouBDb44RE2ZFwXejsG3BjNK80a1RMjC8lre
         ozbzfnpBY9648Knz5rDbSAIDIpsKhZhvGsIJ220sllfrT9YHs3gzc5G1FpvjufiNjcsQ
         J4Yy5Ju4gjOBfrA8Ivg6UD6aSUnv7kpjuAK5L7+u9HJE0WF/NZpktStRm33x+OB2I1RD
         5ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCViJqEVRyTzEgxlorG+i52fQQQMB8Tdj2k4dGTcWwFoAmvl622QlhZERy972bEbrlHNPxr67e+8y8ppMMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNJfQb9uxefFBLE0UnJFae3+ui2hbh37VqlnioejjzKVy1F+j
	os/mJddqYNjDLDoPBfuELyCd0SR4zATq4bLayJOAgC4J9/w4wU1ueaX9cqbdE5sL3O4ucaq5Jxg
	abQKQzxXF4ZEzxHi0KuDc/v8OXoCL6zpnjUlDz3oI
X-Gm-Gg: ASbGncvJWjgvEm8aSFtisVgGsC9nthNnh7OetvywErMaUmLcqupo5R+0tVWW6APX9Vn
	k3CKhAHf2wJNfiARRQoVamYUOW9rDG+5VzeGBgXdg8uwYvNHz+l6KuWuzL76GGR9tDP+qNRV1fB
	XxZaIH8DTUb+LgZDPDv7TpDkIKIgMxNl9lWwBqvI8p5xYZJDYjjeMFKL8dOxMwMM+PfY8y9uBbH
	2KT8w==
X-Google-Smtp-Source: AGHT+IHy/g9C8sI0sjL+N9l9hpzfx35P0wqLjEKU9oirnFb5JVmTK0JdB84muXaLwaPVMYaPK0IuUbGE5zc7poSJqyw=
X-Received: by 2002:a17:903:41c5:b0:234:c2e7:a0e7 with SMTP id
 d9443c01a7336-235df7bed95mr1828935ad.4.1749011359087; Tue, 03 Jun 2025
 21:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603154843.1565239-1-ziy@nvidia.com>
In-Reply-To: <20250603154843.1565239-1-ziy@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 3 Jun 2025 21:29:03 -0700
X-Gm-Features: AX0GCFsUhw_kYI1BgM3xj3T5QLJPcCPGMcq_7qHbZq4EEuyDApPMnZU8AKcfntI
Message-ID: <CAJDx_riftoahYGWdvHukiZpndvFDHViO1tmVjJnnGa=VA6LnNg@mail.gmail.com>
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_ORDER_CEIL.
To: Zi Yan <ziy@nvidia.com>
Cc: david@redhat.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	isaacmanjarres@google.com, kaleshsingh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	masahiroy@kernel.org, mhocko@suse.com, minchan@kernel.org, rppt@kernel.org, 
	surenb@google.com, tjmercier@google.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:49=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> The config is in fact an additional upper limit of pageblock_order, so
> rename it to avoid confusion.
>
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page bloc=
k order")
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h          | 14 +++++++-------
>  include/linux/pageblock-flags.h |  8 ++++----
>  mm/Kconfig                      | 15 ++++++++-------
>  3 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..523b407e63e8 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -38,19 +38,19 @@
>  #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>
>  /* Defines the order for the number of pages that have a migrate type. *=
/
> -#ifndef CONFIG_PAGE_BLOCK_ORDER
> -#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#ifndef CONFIG_PAGE_BLOCK_ORDER_CEIL
> +#define PAGE_BLOCK_ORDER_CEIL MAX_PAGE_ORDER
>  #else
> -#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> -#endif /* CONFIG_PAGE_BLOCK_ORDER */
> +#define PAGE_BLOCK_ORDER_CEIL CONFIG_PAGE_BLOCK_ORDER_CEIL
> +#endif /* CONFIG_PAGE_BLOCK_ORDER_CEIL */
>
>  /*
>   * The MAX_PAGE_ORDER, which defines the max order of pages to be alloca=
ted
> - * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_O=
RDER,
> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_O=
RDER_CEIL,
>   * which defines the order for the number of pages that can have a migra=
te type
>   */
> -#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> -#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
> +#if (PAGE_BLOCK_ORDER_CEIL > MAX_PAGE_ORDER)
> +#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER_CEIL
>  #endif
>
>  /*
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-fl=
ags.h
> index e73a4292ef02..e7a86cd238c2 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>   * Huge pages are a constant size, but don't exceed the maximum allocati=
on
>   * granularity.
>   */
> -#define pageblock_order                MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, PAGE_BLOCK_ORDER)
> +#define pageblock_order                MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, PAGE_BLOCK_ORDER_CEIL)
>
>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>
>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>
> -#define pageblock_order                MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, PAGE_BLOCK_ORDER)
> +#define pageblock_order                MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, PAGE_BLOCK_ORDER_CEIL)
>
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>
> -/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> -#define pageblock_order                PAGE_BLOCK_ORDER
> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER_CEIL */
> +#define pageblock_order                PAGE_BLOCK_ORDER_CEIL
>
>  #endif /* CONFIG_HUGETLB_PAGE */
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index eccb2e46ffcb..3b27e644bd1f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
>  # the default page block order is MAX_PAGE_ORDER (10) as per
>  # include/linux/mmzone.h.
>  #
> -config PAGE_BLOCK_ORDER
> -       int "Page Block Order"
> +config PAGE_BLOCK_ORDER_CEIL
> +       int "Page Block Order Upper Limit"
>         range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
>         default 10 if ARCH_FORCE_MAX_ORDER =3D 0
>         range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
> @@ -1026,12 +1026,13 @@ config PAGE_BLOCK_ORDER
>         help
>           The page block order refers to the power of two number of pages=
 that
>           are physically contiguous and can have a migrate type associate=
d to
> -         them. The maximum size of the page block order is limited by
> -         ARCH_FORCE_MAX_ORDER.
> +         them. The maximum size of the page block order is at least limi=
ted by
> +         ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER.
>
> -         This config allows overriding the default page block order when=
 the
> -         page block order is required to be smaller than ARCH_FORCE_MAX_=
ORDER
> -         or MAX_PAGE_ORDER.
> +         This config adds a new upper limit of default page block
> +         order when the page block order is required to be smaller than
> +         ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER or other limits
> +         (see include/linux/pageblock-flags.h for details).
>
>           Reducing pageblock order can negatively impact THP generation
>           success rate. If your workloads uses THP heavily, please use th=
is
> --
> 2.47.2

Acked-by: Juan Yescas <jyescas@google.com>

Thanks
Juan
>
