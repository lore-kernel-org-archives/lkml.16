Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00627CCFA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353103; cv=none; b=KZUQYZ52Etj8nPcMTs3FEIqhDku7YNVMYV1E4MSiE3KsnPZOF3/z6QYnPsuGlYnmKb1g6BKS3tK+eCBcxFI9TWsxzIOQISOk9pggRnMhMeQt01sFHFgpJHZBYb8BwSO6D+p8ow1R86w2JX36YHaWVa5+H74ypo6JDimFwFVoNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353103; c=relaxed/simple;
	bh=9A7DwqByXRMCKVIdkYcVcQ2WDj1fbv8iIBH5EpQdQYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QsoDHZKCk/N7XjVM/9BlB5oR2d73AYrQLFArwS7t5z+OOJ8Fx8DMUlml+XiHuOywptAjUuhhNGv3dnWIwVafxT/2jdCBhZgF1SHaZFtmr5UhibTozUlJNIfUP46oWnbMrm39XrZToAeDn//LYHhDvsW4v1xZADgsmZ33UthdwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-527b70bd90dso777473e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353098; x=1744957898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEO0P/4McgPJ7BP0yxbjT3/h2+Tl9EqmI0luXhkXNF0=;
        b=a2DcRUts9cx7t/WmG4qGehMr5Of9TMvZbayBtCm+75jrSZO/JDtKzKTwRMFkfnq2hU
         QwzJb0Hjx5zXKjXOGTajboSHsfRfbRX8vmoWypJuPMTPCiI2eoqX5+fMs+UygqJEqIIF
         4MiEmy6lpq1IpU6uhkNvfNfo7fBWrjkfWCQsO+gAKs2Fo4kcxvtVV1nR97tZcINWkhra
         5zQlOxOOTyF1l1gRx3n7YLyYJEf4lo+aYpwY7BUdbXQmhbZPJ3BCryDjoCu2H20gfZBv
         8kBw+uliSN/KWi1QW18Wf6WkR7UqAT8YU7YI7hIt1mGyvjXQnrSKAjvynzWOIwa4K95T
         MWJw==
X-Forwarded-Encrypted: i=1; AJvYcCX1E4jRz5h3fGwef9IlAR8RmZpN3jE5Xcxv5GUyquYuQFTKlzuykbNaG1m+PpAoIyekwu2GOxnnjeStQoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/IPTxTjS8oos/HwbTnHkaA3a4LFMEz5lXAMjeHXl7h7PzFYk
	UzegGUDy8j+N1LDSlHGPs4bH4lAbeSUbGlwlbLxoGYZvTjKpHYhwh7I3bCUfkv0=
X-Gm-Gg: ASbGnctIIhfRNZfNJ+H8VrxBcuZeEbXWtaP72MSg5dbulf7g9vHW4JqLdHtUoXY2qci
	vU/evFUpLcc0XxUX2Gipr1P60KDcuXKHIAh9tkwUBawexEfkOjf7kjObiRpA9CrJFsWwlmNTKep
	l5ZyH9144agoGnMb9VQhAfoU3bfNU03mQmQQ5Rwao2yVUUqos6R0wTO95ZFlXS6LA1Mi2vnqcOm
	6D/YSjiE+oGIEKQvXT7kXRwQdOuCyRdnuelfsiXx+yHORXDqrBflTHB6nlUTN48myWqW/DTRnnH
	hIVYtZ1M5YPdYIqUhoE8ZgMBpQxIiQeWXFKP8J3PAe8ohDUnfVPiTVyGceIVFSKUy5RpE9vjkmg
	MV08=
X-Google-Smtp-Source: AGHT+IGBbXiRf9m/J1RjkG7SglTN72AYn0GHXdPWi51OWYq7GNSwgajZ2Mrif3J7sE8BJEEwi7y2ZA==
X-Received: by 2002:a05:6122:168e:b0:520:42d3:91aa with SMTP id 71dfb90a1353d-527c347f3c2mr904742e0c.2.1744353098489;
        Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87557136a61sm972505241.8.2025.04.10.23.31.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d3907524cso665494241.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURCr0Ccm6aoAur+14X00CBzwbvrTNm2wTQ1Edtezjf5JpyYmn5ZX69aAVLmHZfTWgdfy/a3iT4GiCU+T8=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c9e4ee720bmr793116137.7.1744353097831; Thu, 10 Apr 2025
 23:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410200606.20318-1-dylanbhatch@google.com> <20250410200606.20318-3-dylanbhatch@google.com>
In-Reply-To: <20250410200606.20318-3-dylanbhatch@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:31:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-1f3_ufKzHxg7KP-oQOTUR=P3e36W9X=+nkA4SH1F_Q@mail.gmail.com>
X-Gm-Features: ATxdqUG8wphQEVB9r3YF2jmxCQ7GDshhzzkv5uNWZN8ycvFadPAv3ateJjFVJyg
Message-ID: <CAMuHMdU-1f3_ufKzHxg7KP-oQOTUR=P3e36W9X=+nkA4SH1F_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dylan,

Thanks for your patch!

On Thu, 10 Apr 2025 at 22:06, Dylan Hatch <dylanbhatch@google.com> wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.

Wouldn't using the text-poking API involve calling text_poke()?

> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c

> @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>         return -ENOEXEC;
>  }
>
> +int apply_relocate_add(Elf64_Shdr *sechdrs,
> +                      const char *strtab,
> +                      unsigned int symindex,
> +                      unsigned int relsec,
> +                      struct module *me)
> +{
> +       int ret;
> +       bool early = me->state == MODULE_STATE_UNFORMED;
> +       void *(*write)(void *, const void *, size_t) = memcpy;
> +
> +       if (!early) {
> +               write = aarch64_insn_copy;

Perhaps aarch64_insn_copy() should be renamed to text_poke(),  as it
is a wrapper around __text_poke(), just like the x86 implementation?

> +               mutex_lock(&text_mutex);
> +       }
> +
> +       ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
> +                                  write);
> +
> +       if (!early)
> +               mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> +
>  static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
>  {
>         *plt = get_plt_entry(addr, plt);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
