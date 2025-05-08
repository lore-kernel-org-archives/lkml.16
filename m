Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0872225415
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707007; cv=none; b=CUafOw8lkrlHFA2ErBBYCF8fi6EBTSXfbVZFBckFUytWR4l/YVUklKzUKmSN9espJLrJd2qKcdFP5Kx2pyj/lIEwjbePvOfCPfPL7IqWIDJxI2OJ/k56d9WaPjx689j1Ju46PAsvANqiUtqEfNCEnPAPM0zzkMbVITl3QGE4IkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707007; c=relaxed/simple;
	bh=n1DaNBSAbwSjqMNiKl3ZhnzGUtTOnVJb3kD0pUQSCf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCmWPKbJIivNsnYjeCh+cl1ZvrXFYJsQV4xn7IYngagCeweEj92Z1ujMg2RUbSn45ha3/hZYDWkLpZ1gO90uKpBSAJ/bHNMOcz/MMiFE9BOyKUFZxB6yUDiiGTuER3+8DtZq7AI4taNFCICoFo1t6fgUe/YQbHc8zxbMV6LtFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TI3lhddp; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TI3lhddp"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1fcb97d209so1841969a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746707004; x=1747311804; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHzGR2TH3f5PkiaDuIeNupqLtaLoSxh32TBcttsiE58=;
        b=TI3lhddpzOnan2Fj4PlAoxEtdyJhilTH0aEryFC51JWmDuTJqRXV9M9IpaZ+0Bi+Vj
         W4IclAy3ed3oqSMRsFsQ/7rDqJHPHn6hDmRpvatvoz76F3ImVAIbE/b/2fDJjw/x6QcL
         3O/1m4LuvMiwZncuB8KnqTiSYuh0wLDUyMZzOtiRaeUXJyb1BuhHSG0B9o050imPA/jx
         /oD8Sj9+JsdcdPoyuu4mBZ2icyKxv4pQutD0UucwckkYnO1t0lN1NezzwlhggBGxt8jN
         XyMZDkQwIe7C7pddABjhAdfBNSvfEtF4plZ2v0nLH43gPd7YW12ARPAGdV9pw9cUJSgE
         QDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707004; x=1747311804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHzGR2TH3f5PkiaDuIeNupqLtaLoSxh32TBcttsiE58=;
        b=TD3emsCGCABeEwO81UsHhjYqDe/JoLJWu5Xu2NtpgOH4vUs3x6MQzASWe8JXJ1PgV8
         +Iy2eOZIsVxGMcCUkq35wx/4s4aQ+fdgSH/KaH3TzLhfGpKp1IcNVEAxLmF4GnrYfPIL
         N5beHJY8b+qqjJsg4EFDwcyGutVQNTpHz43ANUov2pueuapOkKJg7ZvCwxJoO9lA0cdC
         uo/obM3j1/sTZmTGhxf0js3j42aQQ+eNO2lCipA5ISe6wHtAQQsLSmlPJKszcqL2+To9
         XSzpYGGfQGx+TCadR61mX97Wpxexmo26Ug+NrjyW7IqUbaKvWe9h8UHZH+zHeOn8uuNo
         iWDw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Pa9QSPkrVRYb7OY8uCIcVnA+SavxE5hv2nJJ5PlunSV90f4AyTEUCpTGMP6S4s+5S9PpM18UPREYGzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdO5NMvWw6At9Ch32XjX4vUmwkXEDJwyp8s6q19r9hotZPBuSq
	tmM3qGvXJH0bVHsmtrKx2wt8icFvE8WvdwFMjRohpmai1Yl7f7S1RklqfZHFyv2P6NkDNQ6D8wQ
	XVOg0cu4MiJKb629m73F/M6mSO838CZcaLstz
X-Gm-Gg: ASbGncv4y74+Q2rMPIVWaaJHGyKwOP79pHju51wlRtdFERTibA59vaXh+86LMIk8c73
	HchLTmtLppLyM1nUkmoDzq3+SxleNZl6+SLYjSOyMNdk4vGCCpjTJS2q6QrD+ydEghaGswr6P+R
	b1uJTUtI/BZlYZ9WwWBwpDq2Pyk9W7k/WjGkvjNI7bCbtLfJbXSNXiYd7+O9iqVv4=
X-Google-Smtp-Source: AGHT+IGuazhS9joimxHTMGiamVK9GxUm2CRwvQi3+Gq6fqxsbfAnr7up4McbBtUROkgn62zEFRcy/K/C2EzHqfHG+xw=
X-Received: by 2002:a17:90b:4b8c:b0:2fa:1d9f:c80 with SMTP id
 98e67ed59e1d1-30adbf6d05amr4939913a91.17.1746707003520; Thu, 08 May 2025
 05:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507180852.work.231-kees@kernel.org> <20250507181615.1947159-2-kees@kernel.org>
In-Reply-To: <20250507181615.1947159-2-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 8 May 2025 14:22:47 +0200
X-Gm-Features: ATxdqUHttH2gHvJKzLvMz7fkEuSC2xFFktBrniyRJYj71k93n_Rm8LTTobDJ7fU
Message-ID: <CANpmjNPcYPvnQzMT3p+Vc2=EiEbR1WnykUEjuYc0bH2HOFi6HQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] init.h: Disable sanitizer coverage for __init and __head
To: Kees Cook <kees@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Aleksandr Nogikh <nogikh@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	kasan-dev@googlegroups.com, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

+Cc KCOV maintainers

On Wed, 7 May 2025 at 20:16, Kees Cook <kees@kernel.org> wrote:
>
> While __noinstr already contained __no_sanitize_coverage, it needs to
> be added to __init and __head section markings to support the Clang
> implementation of CONFIG_STACKLEAK. This is to make sure the stack depth
> tracking callback is not executed in unsupported contexts.
>
> The other sanitizer coverage options (trace-pc and trace-cmp) aren't
> needed in __head nor __init either ("We are interested in code coverage
> as a function of a syscall inputs"[1]), so this appears safe to disable
> for them as well.

@ Dmitry, Aleksandr - Will this produce some unwanted side-effects for
syzbot? I also think it's safe, but just double checking.

> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/kcov.c?h=v6.14#n179 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Marco Elver <elver@google.com>

> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: <kasan-dev@googlegroups.com>
> ---
>  arch/x86/include/asm/init.h | 2 +-
>  include/linux/init.h        | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 8b1b1abcef15..6bfdaeddbae8 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -5,7 +5,7 @@
>  #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
>  #define __head __section(".head.text") __no_sanitize_undefined __no_stack_protector
>  #else
> -#define __head __section(".head.text") __no_sanitize_undefined
> +#define __head __section(".head.text") __no_sanitize_undefined __no_sanitize_coverage
>  #endif
>
>  struct x86_mapping_info {
> diff --git a/include/linux/init.h b/include/linux/init.h
> index ee1309473bc6..c65a050d52a7 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -49,7 +49,9 @@
>
>  /* These are for everybody (although not all archs will actually
>     discard it in modules) */
> -#define __init         __section(".init.text") __cold  __latent_entropy __noinitretpoline
> +#define __init         __section(".init.text") __cold __latent_entropy \
> +                                               __noinitretpoline       \
> +                                               __no_sanitize_coverage
>  #define __initdata     __section(".init.data")
>  #define __initconst    __section(".init.rodata")
>  #define __exitdata     __section(".exit.data")
> --
> 2.34.1
>
