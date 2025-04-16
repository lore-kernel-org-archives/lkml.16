Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E491B4235
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837725; cv=none; b=f1T/CpWGV0Nb3m8aFoCoOK3Ods8u5mHlQic2rilSe16nkHnxrGyuALfc86sYGFMadlHfcfXtYZuKudJvz2wVKF9sPpyGwICc79/aYHWrXfZD+D9ANeA0/tIkCoZawhq9qmd3iXdLAxd43lwG6rCn3Zz2WkTimYIb98/b42HxBjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837725; c=relaxed/simple;
	bh=bUALcBWBYMd+HOC6iN7UA13vbtH9o/ln61q0emh9AbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C70qViWUANvXTxUJ1/jvKJAKhLtRlBlQ/1FJjEGO0ubDhbeKhZYkdTgf/uFx/9XmetgsCea2fDwFpCV02/GUcRucUoW6Wen1Af/buq++7MSuiPzQ8qHn0kgoNb0JiYzVAcPNwAx6/MkO0NTumhHLrOseQ//W816df4xfMjBaplk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmaHFUxy; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmaHFUxy"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4774611d40bso85161cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744837723; x=1745442523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf5rroFrk8960zthe1sFA5RRqaLe5+GYDXOkL0qP4DE=;
        b=EmaHFUxyo5GFYMB8ezPHp9+NFtJmLR9+3NIiwDpTPKoUI8sl9JJ9lutKVWQQZTJp7M
         ebmMxje+3+85bBEU5j0SowDZRAgJHAgv6QVRPRpoLFUYFhlziF1MvHKBRaNTNtG8bMsI
         F80HGD4GKo1obOBwu+aOSkML4QiITmk7zAeJ0ducpQxiZW7/dcnCOpyeCQYN8pTwZz/g
         CROKDZOOgkBELteS3tsNP3D6ypxxsOb1GSIRCN+Fk0/dFH+BMz7UhflBMNxnCGYFF4gY
         NZRlXTnU7DrwlQs2gUiBnEdX/Te0qHFLc57d6nnaLDWazxEfLFQ4D/iIhAVM/8N+P5mw
         9ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744837723; x=1745442523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uf5rroFrk8960zthe1sFA5RRqaLe5+GYDXOkL0qP4DE=;
        b=UOtl5oyizXWB4fFE2wiOS5kx8xXcFwsr3TK9OMfM8G756FrXtxBUP0d6ybgPDjGrNq
         bZ/BLxtZC8r/NqfE4OZ+rvlWoDyP7D/7yc2KoQyH+WaacxhkYGwrdXgEksiL1A0FnFtr
         0dF3BdPyQqaweEpbtwNBwOQTWmhtdXo/bfUSokgAdumdatxux5CFe8BwmRfWdMpfWVUz
         Myli6L4rnTej/TzOt9fHs8y3QmFwYD49cTMJRTU/iQc6eDUFO+7JojvBtNe5hySGeKQS
         MJx5//ciJIR77pW+axeyMbIPRQN3XQvKU4U0s5yvn5iQWlyBd/kxYeM33nDdAbM9e+No
         T8vA==
X-Forwarded-Encrypted: i=1; AJvYcCWDUeSPATnJYno1N/WHyezRCH7D4zjmu2hgyVzuC13ido6pmoj9HgjoZRLcSjFa9RNsFqiYnTQabinJmU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUPEBat7WIxgOTnRAn5MkGzqHQBuGzWXuSC6ofh+JF7qj2uB/
	j0713hjbPlHOYeAbJF1tHS9lSamwkVOy7B4w/qNaqRzeZfEhKCH89iBCNG/5ei0jXVUDDl6TvEN
	BprbrzcWtcbWeKi6ZkqdUKU7K28okesjK9a6VU88zwa57XrlZy+dw
X-Gm-Gg: ASbGncvv3rPjx108wAtGqYk/t1+FkjSzFb8C4rwHjLPRuOXFnhk0Be9jRCiG6QXf1jK
	HkVPH4ZlvVaxQqt5Y5NtpLoPUyYTnxHWJi7iDYWuOX1ZShWLWkZqlwNSjCQYHJXBNgna1v89T5Q
	E90mKQCdQolFyn87gW2pLteygbWyXRpVz22cOZbBSr1iL6ibvThtYq
X-Google-Smtp-Source: AGHT+IF1vsoRMN9C84PrAHwA/9EeuNG7HJJdjAklvVmrMXYNAtpy22QSQPHYtUW9cCmdGQcvb1OFfU8J9ny6Wh5HLso=
X-Received: by 2002:a05:622a:d0:b0:477:637f:a63 with SMTP id
 d75a77b69052e-47ade60c5cbmr1064471cf.6.1744837722605; Wed, 16 Apr 2025
 14:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
In-Reply-To: <20250416180653.3438158-1-usamaarif642@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Apr 2025 14:08:31 -0700
X-Gm-Features: ATxdqUHXBSTxlONVuwsC8A5lCKQUbU8hrp0plSQ2Fa9jC37qJNdHXG-kv8M37lI
Message-ID: <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:06=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
> With this Kconfig option enabled, the kernel stores allocation tag refere=
nces
> in the page flags by default.
>
> There are 2 reasons to introduce this:
> - As mentioned in [1], compressed tags dont have system memory overhead
> and much lower performance overhead. It would be preferrable to have this=
 as
> the default option, and to be able to switch it at compile time. Another
> option is to just declare the static key as true by default?
> - As compressed option is the best one, it doesn't make sense to have to
> change both defconfig and command line options to enable memory
> allocation profiling. Changing commandline across a large number of servi=
ces
> can result in signifcant work, which shouldn't be needed if the kernel
> defconfig needs to be changed anyways.

The reason tag compression is not the default option is because it
works only if there are enough free bits in the page flags to store a
tag index. If you configure it to use page flags and your build does
not have enough free bits, the profiling will be disabled (see
alloc_tag_sec_init()). IOW there is no graceful fallback to use page
extensions. Therefore, the current default option is not the most
performant but the one which works on all builds. Instead of this just
set sysctl.vm.mem_profiling boot parameter in your config file.

Your change effectively changes the default value of
mem_profiling_compressed and I don't see why you need to introduce a
new config option for that. But that really does not matter because
changing default to compressed tags is not the right choice IMO.

>
> [1] https://lore.kernel.org/all/20241023170759.999909-7-surenb@google.com=
/T/#m0da08879435f7673eaa10871a6e9d1be4f605ac8
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/pgalloc_tag.h | 4 ++++
>  lib/Kconfig.debug           | 5 +++++
>  lib/alloc_tag.c             | 4 ++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
> index c74077977830..0226059bcf00 100644
> --- a/include/linux/pgalloc_tag.h
> +++ b/include/linux/pgalloc_tag.h
> @@ -16,7 +16,11 @@ extern unsigned long alloc_tag_ref_mask;
>  extern int alloc_tag_ref_offs;
>  extern struct alloc_tag_kernel_section kernel_tags;
>
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> +DECLARE_STATIC_KEY_TRUE(mem_profiling_compressed);
> +#else
>  DECLARE_STATIC_KEY_FALSE(mem_profiling_compressed);
> +#endif
>
>  typedef u16    pgalloc_tag_idx;
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9fe4d8dfe578..66d8995f3514 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1028,6 +1028,11 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
>         default y
>         depends on MEM_ALLOC_PROFILING
>
> +config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> +       bool "store page allocation tag references in the page flags by d=
efault"
> +       default y
> +       depends on MEM_ALLOC_PROFILING
> +
>  config MEM_ALLOC_PROFILING_DEBUG
>         bool "Memory allocation profiler debugging"
>         default n
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 25ecc1334b67..30adad5630dd 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -31,7 +31,11 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENA=
BLED_BY_DEFAULT,
>                         mem_alloc_profiling_key);
>  EXPORT_SYMBOL(mem_alloc_profiling_key);
>
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
> +DEFINE_STATIC_KEY_TRUE(mem_profiling_compressed);
> +#else
>  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> +#endif
>
>  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
>  unsigned long alloc_tag_ref_mask;
> --
> 2.47.1
>
