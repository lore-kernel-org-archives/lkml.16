Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB82253F8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555385; cv=none; b=lgnKz545UzabSKQMBKoqZipaFlNP0L7wME3U4Utv4slTV6V4xnD+BAwcK0IPAQtzqhvkGWQvs7U/ARcr1nsVDCiC6MKQMs27Xfuu26eBDwSOCSC1mb5xeu439TAr2VE6mQ33P5MxBMyeEJ9mHGW+iojBDK5a7qDVTzIu9fNsKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555385; c=relaxed/simple;
	bh=zBlm+ov1YdPOK+eo/xgzpL/Az+rYHrupYQlhswUJOtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DymwMCHIMejLEu7kO6aYIYjx45vwIxPkVYpsm+HEPkVn8tBQcD7eXRrs8KVsVd5HL3FsQ6aUOJYZBhRFc3IEBblkC80oFum5Ugn41fcx73uare4KC9zLQ9UNiN37Fi1lUC8tf9OL9+5/+aJ6TdZ5L9EY+KLWaDkzdX9aE/hxHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gckAeiQE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gckAeiQE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1729149a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749555383; x=1750160183; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/X080miYLYNnIb/KqgwO3FJea0593LzGodrcP0cmSBk=;
        b=gckAeiQEK6p7EdMZ9DW5Nfb6bEbfW/hh2JMNqVp1dLp2xaaZDBGx5ev6TWUHOS94v6
         yvT6pxFLgusMDgwj2CPzSov0JsKH238cVyScElB+XtXfjoMY7CAztjQb+v1y/QxdIpk6
         CvR6KSlQTSvR4gycQOtz/fPdM7ZLh2fB6O55FUWkJGXR6xVyDfWkH9COEJRk0l4eEGvV
         0EYf8VKiAaZsoWI7YfVnYTJBZaRoW5WPkjH0mIfx3fqws5Skmq/dUDAMMPn50z7cdu5v
         HrYyGo8vHqIhZXekVw5vmr23+HWrtH6S2HdQjHU4EO2ZfMTf8j5Ui3quEDZv/lfY+dP6
         G0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555383; x=1750160183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X080miYLYNnIb/KqgwO3FJea0593LzGodrcP0cmSBk=;
        b=qONM3iZHLwUnvGeh1UXk13TjkivG1ppzuq3ksIEsleKcX/DdnJRLCKysxOphQIBZpx
         T29WVc3d2AEWEMJTSqQbdN/0V7hYa7uniAo1+bP6lvkC2rqLYt/Zt0PhNSY2Z6ppYali
         aIo8j7Eu804fHazGbHHJW2AyCW9JtuXhfObAaVq3q96mpyWKQ/hh7CkjTH6qFQzEmT4S
         sQV//+VM+I+TQgvSgLy2UYPm2+MqW0xFQloiEd+FvtTnBzb5BFlLhfmhkK53SHz66+zF
         9jzomv7528CPzvYqMzVivn14utzAMoar8c/JC9HdLpJA3RcEvkHj2a2zNidLjSL3rHcQ
         OcIA==
X-Forwarded-Encrypted: i=1; AJvYcCWRgI4BexWtWQCMV/KpNIhPD84sj6DJIYI7SwdRHbL6sNH6xTgOPX267o+EasundHrEUfHp0B3th4pYv/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmm5tleTdM7mLF38gS07GEkwfexSLZlv2g23zAA7r6XEYtsGeu
	tT71yXwXc9Vb0FIefRlb98sWIRko5P51O2C2iW7k6+ISB5Wg/JI/yfxaS3QYd/Wz2FIbnpyetYZ
	6Bwblfd3VAGhlmGSMYQc8gNSTQkeNnCpvwqWnnngV
X-Gm-Gg: ASbGnctvY7K4WNSzQogYAZGM1nDMeLqHNUKofIlOxyn0NxK6PKHzpflYSYcXhiw867O
	82t5oy+UABT5JBjRu0k6UjBsl4EQBfnrEsMmeVt14j9bQvGZ/yUO3yfRUoA5pcV9p219y3M7o+n
	Ak4juJ7IUi3ea+83MD/fAt2H3BMDwqVEizd6InCNL3gsiNd2vUsd9LbaaOl41tlX6vsXDJfO7B
X-Google-Smtp-Source: AGHT+IEwCAvIsXym5DldP9LOU03dANKhI7iiGAjGK8vDeAOOjBWjSCWQznQqPPXeNPhc91g4jQb2wx42ypb9h9ekuWo=
X-Received: by 2002:a17:90b:3d0a:b0:311:abba:53d2 with SMTP id
 98e67ed59e1d1-313a1695651mr3853031a91.17.1749555382592; Tue, 10 Jun 2025
 04:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610111559.1667156-1-matt@readmodwrite.com>
In-Reply-To: <20250610111559.1667156-1-matt@readmodwrite.com>
From: Marco Elver <elver@google.com>
Date: Tue, 10 Jun 2025 13:35:44 +0200
X-Gm-Features: AX0GCFvr9SRXT7rpoCzd8enf5Vhs7VR8MrQOwlNAo7Y3z6-SB7lEBEyUj25Qfmo
Message-ID: <CANpmjNMkVGVnmeKK5QmwDPZv9QrF0omNz-TmgY0Dqqg-=uAN4Q@mail.gmail.com>
Subject: Re: [PATCH] stackdepot: Make max number of pools build-time configurable
To: Matt Fleming <matt@readmodwrite.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 13:16, Matt Fleming <matt@readmodwrite.com> wrote:
>
> From: Matt Fleming <mfleming@cloudflare.com>
>
> We're hitting the WARN in depot_init_pool() about reaching the stack
> depot limit. My assumption is because we have long stacks that don't
> dedup very well.
>
> Introduce a new config to allow users to set the number of maximum stack
> depot pools at build time. Also, turn the silent capping into a
> build-time assert to provide more obvious feedback when users set this
> value too high.
>
> Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
> ---
>  lib/Kconfig      | 6 ++++++
>  lib/stackdepot.c | 9 ++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/lib/Kconfig b/lib/Kconfig
> index b38849af6f13..2c5af89daff9 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -720,6 +720,12 @@ config STACKDEPOT_MAX_FRAMES
>         default 64
>         depends on STACKDEPOT
>
> +config STACKDEPOT_MAX_POOLS
> +       int "Maximum number of stack depot pools to store stack traces"

I wouldn't want most kernel configs change this. Can we make it an
expert option? I.e.

  int "Maximum number of stack depot pools to store stack traces" if EXPERT

> +       range 1024 131071
> +       default 8192
> +       depends on STACKDEPOT
> +
>  config REF_TRACKER
>         bool
>         depends on STACKTRACE_SUPPORT
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 245d5b416699..1c24230b4a37 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -36,11 +36,7 @@
>  #include <linux/memblock.h>
>  #include <linux/kasan-enabled.h>
>
> -#define DEPOT_POOLS_CAP 8192
> -/* The pool_index is offset by 1 so the first record does not have a 0 handle. */
> -#define DEPOT_MAX_POOLS \
> -       (((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_POOLS_CAP) ? \
> -        (1LL << (DEPOT_POOL_INDEX_BITS)) - 1 : DEPOT_POOLS_CAP)
> +#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS
>
>  static bool stack_depot_disabled;
>  static bool __stack_depot_early_init_requested __initdata = IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT);
> @@ -245,6 +241,9 @@ static bool depot_init_pool(void **prealloc)
>  {
>         lockdep_assert_held(&pool_lock);
>
> +       /* The pool_index is offset by 1 so the first record does not have a 0 handle. */
> +       BUILD_BUG_ON((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_MAX_POOLS);

This is a constant expression, and could be a static_assert() (with
inverted condition) next to the '#define DEPOT_MAX_POOLS'.
BUILD_BUG_ON() is a bit less efficient (compile-time wise), and cannot
be substituted with static_assert() only if part of the expression is
a non-constant expression yet we rely on the compiler to optimize the
condition into a constant if there's a bug.

>         if (unlikely(pools_num >= DEPOT_MAX_POOLS)) {
>                 /* Bail out if we reached the pool limit. */
>                 WARN_ON_ONCE(pools_num > DEPOT_MAX_POOLS); /* should never happen */
> --
> 2.34.1
>
