Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC2278771
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525643; cv=none; b=fLJ2t+uj8crw8l4agpNF5gmuJ1gSz16CglgfQI82R0yJbfAi5OILmv/Hy7Hsf8OZVlOdhpPdxFCr94bCdevYKXLiagfSsBfrp//1k9smFtB7J5DmqJVpKpR/eK8MdCkW+oZSmYmRqKLy55z46VXIRn++SxVVHTrKf7EODriDBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525643; c=relaxed/simple;
	bh=Am0FhtgRvNS+ApiRAvTZvfpAd3o4zu618YZ5hkEZwlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRFgR+xf3jZ9G2D6ijNShRky1Ho2NSQ08fskF4ziDtqbpJNnOPSlJ91/r0J79XYOe9d8hZQ3e+tX73I0mTduABeNNQEVPl1CRQrbNSzkIuYQ7PEjVSkvhxIkOerSm0EesDWH51T/CWy1GzAiv2TfWkUY1w2Ppcr6PuOyrKe8UDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kLzeMBIU; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kLzeMBIU"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601a99977faso384639eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525640; x=1747130440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgnwHbz1AjhGioq038lpvG95tXZpXvS33HP9z+P5ExU=;
        b=kLzeMBIUehcm6MCoBYnGaqn08Bu57IGPvpJ1z+WCrxcWoG84d9Yml/TLsNc4bTfjb/
         aX15rvfCEpZXuUmwlkL2ggsOiH269C5PHGuRRXzA7xNuS5YESBEUcI5IPwveTUDx2f5P
         FPakH+zzIUGLtjh0dFl878CMj3lUFsmD/DODY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525640; x=1747130440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgnwHbz1AjhGioq038lpvG95tXZpXvS33HP9z+P5ExU=;
        b=vD9+iWEeQI99ZZfLGMvYzEpoWJjISbnJJSzS7jhDDnd+55NACMScgU4yOudPPNQHV3
         sbwRjDMQZvGUbFMQoYseD0D72o2g+0aBFaacROMUO9YfDPCcXpCBtDOYEDrIfQiZabPO
         D+l3dlY+DYGd3NEgm8MBn7tS9tVBe8vue7OtE7vVCx/GzHBdmfVbRb4v0sApyIblfGfY
         PTDRTRz3bO7373GQphL7EJj9IVnVjbOJNXvk8595p/mb7+xVDxefRGAVhd8qkU0Xpnu2
         aNi5840NzjrZMfR0SMo8t7DJxJExgT/uPa31dmgV9A2tbqqK6tDEJs2+EB4F8tWz5MOp
         FmqA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Eh9Z949BTqDUaN5BqsE2wnysVs36IDeE91lkKvoolpxe8N4QyhUB5Zc8z/GiyCYbmW6Wce3IP2dAtco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFn9Lqkxj6gPniGO8l62pW4nTqgL2JXNefAosqm4OlrHkpNlfe
	X4v97febAGpSKecagTRcaK7QuzWcuL0ZmPXDqtoFiBa5iZxbnq6wt0tie4QWJMY0RLc9Zu6NkP2
	usTrYM/AypUGX25ze7NV6zcD5VDxKBM9T2rBZ
X-Gm-Gg: ASbGncv8wyrQgX/3Wqj1jm8plPvXbRpd78KoQFjPNEe2dPTdgpO7i5y39znYgdFZZR+
	3VvQtlnP3CC7TBPzJO2ft5k1DFHBIQkolN0AVFho2ybI4FFDv8ykvlymucb1BWJQfpFBsvtdaPk
	+awIdwFaNRK0StQ4Gd2dwnnOVbCi30wu92LtSs7HJT7VQUFSXyWw==
X-Google-Smtp-Source: AGHT+IHhiyIn/3nXmyB0TYKrtQeZw6wh97jFrO+F43EodTx1tAmH3sRUHkuhHaTX6F/Xwh2Vb3HsEaBkMH8rLIg5VLU=
X-Received: by 2002:a4a:e0d9:0:b0:606:3a5d:c7ad with SMTP id
 006d021491bc7-607ee513583mr2347984eaf.0.1746525640269; Tue, 06 May 2025
 03:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506095224.176085-1-revest@chromium.org> <20250506095224.176085-5-revest@chromium.org>
In-Reply-To: <20250506095224.176085-5-revest@chromium.org>
From: Florent Revest <revest@chromium.org>
Date: Tue, 6 May 2025 12:00:29 +0200
X-Gm-Features: ATxdqUEWe64mgnWNWtDc2kPZf5XuKvFECDO9Vew2NFN-uLRlx3rHuyFczgLc0LE
Message-ID: <CABRcYm+vgD+BNYQ6H7=n6Bdhvq8QXriKx5Ksjhsx+DpYq6064g@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, akpm@linux-foundation.org, broonie@kernel.org, 
	thiago.bauermann@linaro.org, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:53=E2=80=AFAM Florent Revest <revest@chromium.org=
> wrote:
>
> This reduces code duplication and chances of mistakes.
>
> Signed-off-by: Florent Revest <revest@chromium.org>
> ---
>  include/linux/mm.h | 50 ++++++++++++++--------------------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b12549f0a6dce..6750020d5ea37 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
>  #define VM_MERGEABLE   0x80000000      /* KSM may merge identical pages =
*/
>
>  #ifdef CONFIG_64BIT
> -#define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_1     33      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_2     34      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_3     35      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_4     36      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_5     37      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_6     38      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_7     39      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_8     40      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_9     41      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_BIT_10    42      /* bit only usable on 64-bit arch=
itectures */
> -#define VM_HIGH_ARCH_0 BIT(VM_HIGH_ARCH_BIT_0)
> -#define VM_HIGH_ARCH_1 BIT(VM_HIGH_ARCH_BIT_1)
> -#define VM_HIGH_ARCH_2 BIT(VM_HIGH_ARCH_BIT_2)
> -#define VM_HIGH_ARCH_3 BIT(VM_HIGH_ARCH_BIT_3)
> -#define VM_HIGH_ARCH_4 BIT(VM_HIGH_ARCH_BIT_4)
> -#define VM_HIGH_ARCH_5 BIT(VM_HIGH_ARCH_BIT_5)
> -#define VM_HIGH_ARCH_6 BIT(VM_HIGH_ARCH_BIT_6)
> -#define VM_HIGH_ARCH_7 BIT(VM_HIGH_ARCH_BIT_7)
> -#define VM_HIGH_ARCH_8 BIT(VM_HIGH_ARCH_BIT_8)
> -#define VM_HIGH_ARCH_9 BIT(VM_HIGH_ARCH_BIT_9)
> -#define VM_HIGH_ARCH_10        BIT(VM_HIGH_ARCH_BIT_10)
> +#define VM_HIGH_ARCH_BIT(i)    (32+i)  /* bit only usable on 64-bit arch=
itectures */
> +#define VM_HIGH_ARCH_(i)       BIT(VM_HIGH_ARCH_BIT(i))

Argh, and of course I forgot to squash two local fixes before sending
the series out...

This should have been VM_HIGH_ARCH() here (the _ at the end is a typo)

>  #endif /* CONFIG_64BIT */
>
>  #ifdef CONFIG_ARCH_HAS_PKEYS
>  # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0

And this should have been a VM_HIGH_ARCH_BIT(0)

... Anyway, I think it still gets the point across that it could make
some sense to change those VM_HIGH_ARCH macros.

> -# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
> -# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
> -# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
> +# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
> +# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
> +# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
>  #if CONFIG_ARCH_PKEY_BITS > 3
> -# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
> +# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
>  #else
>  # define VM_PKEY_BIT3  0
>  #endif
>  #if CONFIG_ARCH_PKEY_BITS > 4
> -# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
> +# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
>  #else
>  # define VM_PKEY_BIT4  0
>  #endif
> @@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
>   * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
>   * for more details on the guard size.
>   */
> -# define VM_SHADOW_STACK       VM_HIGH_ARCH_5
> +# define VM_SHADOW_STACK       VM_HIGH_ARCH(5)
>  #endif
>
>  #if defined(CONFIG_ARM64_GCS)
> @@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
>   * arm64's Guarded Control Stack implements similar functionality and
>   * has similar constraints to shadow stacks.
>   */
> -# define VM_SHADOW_STACK       VM_HIGH_ARCH_6
> +# define VM_SHADOW_STACK       VM_HIGH_ARCH(6)
>  #endif
>
>  #ifndef VM_SHADOW_STACK
> @@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>
>  #if defined(CONFIG_ARM64_MTE)
> -# define VM_MTE                VM_HIGH_ARCH_4  /* Use Tagged memory for =
access control */
> -# define VM_MTE_ALLOWED        VM_HIGH_ARCH_5  /* Tagged memory permitte=
d */
> +# define VM_MTE                VM_HIGH_ARCH(4) /* Use Tagged memory for =
access control */
> +# define VM_MTE_ALLOWED        VM_HIGH_ARCH(5) /* Tagged memory permitte=
d */
>  #else
>  # define VM_MTE                VM_NONE
>  # define VM_MTE_ALLOWED        VM_NONE
> @@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>
>  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
> -# define VM_UFFD_MINOR         VM_HIGH_ARCH_9  /* UFFD minor faults */
> +# define VM_UFFD_MINOR         VM_HIGH_ARCH(9) /* UFFD minor faults */
>  #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
>  # define VM_UFFD_MINOR         VM_NONE
>  #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
> @@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
>   * if KVM does not lock down the memory type.
>   */
>  #ifdef CONFIG_64BIT
> -#define VM_ALLOW_ANY_UNCACHED          VM_HIGH_ARCH_7
> +#define VM_ALLOW_ANY_UNCACHED          VM_HIGH_ARCH(7)
>  #else
>  #define VM_ALLOW_ANY_UNCACHED          VM_NONE
>  #endif
>
>  #ifdef CONFIG_64BIT
> -#define VM_DROPPABLE           VM_HIGH_ARCH_8
> +#define VM_DROPPABLE           VM_HIGH_ARCH(8)
>  #elif defined(CONFIG_PPC32)
>  #define VM_DROPPABLE           VM_ARCH_1
>  #else
> @@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
>
>  #ifdef CONFIG_64BIT
>  /* VM is sealed, in vm_flags */
> -#define VM_SEALED      VM_HIGH_ARCH_10
> +#define VM_SEALED      VM_HIGH_ARCH(10)
>  #endif
>
>  /* Bits set in the VMA until the stack is in its final location */
> --
> 2.49.0.967.g6a0df3ecc3-goog
>
