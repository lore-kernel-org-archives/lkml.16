Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1550194A65
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522724; cv=none; b=UA4RXoz8KgM9HN4MoJHSZR4paJxBGaBB4xBhiIiqr7AkdWWavQIAg7+kOl9m1an5t3vID3x7NoPUBfmhlJh51TZjSxFhxN0ApRFnoQAIm9h0JTBp/2BMxL/O5/0inHAAh7XX8Pvz8Mblt8mvf43xS9R+FhK9riyOXU6VT3Y60qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522724; c=relaxed/simple;
	bh=WZ7Q687/ktCOviXEnNSc0wlJ68ix0HY5FF1lUZ0mgbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU+wGG6e2hPco92dnkgPJJpwDo0yWjWFD2Sa8UUUh7st7L7gB495LSHptVgtRpzK+lCf11n35F3N51yw2sRWDbmvEbFSnl42RZmfi5nfqeSHE+VhpNpoMeoODRUmzM0Td49vgyv7388rA1DjUaocNHdJ6GSllFhHMhHPgZyqwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzGWuJEN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzGWuJEN"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32a6a1a5f6dso7426481fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748522720; x=1749127520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tK9eAe9wOi6uVmJjSv0l+rKVLk/g59YKs3Jr4gqnD4g=;
        b=BzGWuJENIExwZKfPyUObosAqr/fQ/su/m3IH2LGoKkmCfnyVszjFY28gm1qsth2h0S
         sK/5k6xPtDkC2vywI0UadJyqg0lPj3Qwt9H+GQZxDRIWDTILgaEpkr8/gjielxZZ5D5o
         oHMM9jvlEuAquWC19oTQ9lqE33NWGvJK67EzLuTgKv3YRTdWhPctiXiFXosKS+INTqyX
         17u8NI4rM3elq/neH+PT9N4UM9a/UnqncKgR+K9f/Q7EuQtBM9Aw0K8GVPcxMlgytijd
         7YnrA9LoSdA9OtddEOvj0rZ97kRuApVn35Yt2sSfEfUBVBIRDF5Hil9KgHjBnJN2FzyA
         VQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522720; x=1749127520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK9eAe9wOi6uVmJjSv0l+rKVLk/g59YKs3Jr4gqnD4g=;
        b=W3c6VG/YmAvesifK2FCJYgjrOhoGMLfXY/SGQ/JBxQMXIf/dhLQleKd9LuFILa03Gc
         Pkvpz82kMUnaTQzGzTwSUg7g1R3ynvfEIkKvHZeX0zLU9s9T59FlDobvefGYbU1HQM5n
         teW1Z7b0Bv2op1sHrbNQjAxfNiyBZN9QV8oMbmiQtF9Pdktwv4x6Duq403l4V97deIpa
         f5xdeBpHGMG8E+452MTSW2xM/PBct+vWwafMk55TxQmDbnimF4vfkzuzFqnzXJmY4d2e
         oUE2Iu3nN4Ni86f3KVp2fYg6E3Jyhlg9+7IWtl6ikv5adcfGw/jyBbLEVT0SjL49DtR+
         cFKg==
X-Gm-Message-State: AOJu0YwUwORaih1PuOOpvE/uL2cp1zaRu6439VhJd3/Ifi1pF14punup
	HfO+6fi/zyml4B6zugPkf12hmMJSKmuQUxh+Xy64kFbplQXfHjcpDDNz3BurlX0e/w4iiyMIRGW
	iUytdvX4woQ84vaFyaZtV08NF56QZisE0xV/T
X-Gm-Gg: ASbGncuFb3lQNAGOR2mMcjP+TRnsoQhxOkoiHZOCQEcceeyjhx6wh6iBW8ujLj+3463
	22WdUoSWUw9uTT4ENpLb8AM1PTx/6+ct53D7xwcLMH7nYcc4eDJMJvQkRs93ciLRSo+RjzC5qpS
	ymd/4K8Jr3OEW0+6Y/q7kJMC8Z8q83im8U
X-Google-Smtp-Source: AGHT+IHkHX1HgImJQlMeDJLz+OcaPF8zmL2EKvSyqVRDBfULkvD2iIIKwVZMLQCOOvUdL19z0C2Jp5zZNyrt2PrmpCw=
X-Received: by 2002:a05:651c:41db:b0:32a:6e67:c5c5 with SMTP id
 38308e7fff4ca-32a79b5b47dmr16163291fa.36.1748522720335; Thu, 29 May 2025
 05:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515085708.2510123-1-mingo@kernel.org> <20250515085708.2510123-16-mingo@kernel.org>
In-Reply-To: <20250515085708.2510123-16-mingo@kernel.org>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 29 May 2025 14:45:08 +0200
X-Gm-Features: AX0GCFtEDaEhM_lw-KRl3NHlf4As88rYK7ljG_8fOW28Bc-atxv_aDyaishC74U
Message-ID: <CAFULd4YEYOXY+kud-arKGb_1aSV0y_skL==vUh6W8S8PYL_OXA@mail.gmail.com>
Subject: Re: [PATCH 15/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:58=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wro=
te:
>
> From: Uros Bizjak <ubizjak@gmail.com>
>
> Adjust the constraints to the non-alternatives asm() statement.
>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: "Ahmed S . Darwish" <darwi@linutronix.de>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H . Peter Anvin" <hpa@zytor.com>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/r/15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmai=
l.com
> ---
>  arch/x86/include/asm/percpu.h | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.=
h
> index b0d03b6c279b..64c2e715af63 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -335,13 +335,10 @@ do {                                               =
                       \
>         old__.var =3D _oval;                                             =
 \
>         new__.var =3D _nval;                                             =
 \
>                                                                         \
> -       asm_inline qual (                                               \
> -               ALTERNATIVE("call this_cpu_cmpxchg8b_emu",              \
> -                           "cmpxchg8b " __percpu_arg([var]), X86_FEATURE=
_CX8) \
> -               : ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),        \
> -                               "+a" (old__.low), "+d" (old__.high))    \
> -               : "b" (new__.low), "c" (new__.high),                    \
> -                 "S" (&(_var))                                         \
> +       asm qual ("cmpxchg8b " __percpu_arg([var])                      \
> +               : "+m" (__my_cpu_var(_var)),                            \

Just noticed that the above line is missing a symbolic name for the
operand. This line should read:

               : [var] "+m" (__my_cpu_var(_var)),                          =
  \

Uros.

> +                 "+a" (old__.low), "+d" (old__.high)                   \
> +               : "b" (new__.low), "c" (new__.high)                     \
>                 : "memory");                                            \
>                                                                         \
>         old__.var;                                                      \
> @@ -364,15 +361,12 @@ do {                                               =
                       \
>         old__.var =3D *_oval;                                            =
 \
>         new__.var =3D _nval;                                             =
 \
>                                                                         \
> -       asm_inline qual (                                               \
> -               ALTERNATIVE("call this_cpu_cmpxchg8b_emu",              \
> -                           "cmpxchg8b " __percpu_arg([var]), X86_FEATURE=
_CX8) \
> +       asm qual ("cmpxchg8b " __percpu_arg([var])                      \
>                 CC_SET(z)                                               \
> -               : ALT_OUTPUT_SP(CC_OUT(z) (success),                    \
> -                               [var] "+m" (__my_cpu_var(_var)),        \
> -                               "+a" (old__.low), "+d" (old__.high))    \
> -               : "b" (new__.low), "c" (new__.high),                    \
> -                 "S" (&(_var))                                         \
> +               : CC_OUT(z) (success),                                  \
> +                 [var] "+m" (__my_cpu_var(_var)),                      \
> +                 "+a" (old__.low), "+d" (old__.high)                   \
> +               : "b" (new__.low), "c" (new__.high)                     \
>                 : "memory");                                            \
>         if (unlikely(!success))                                         \
>                 *_oval =3D old__.var;                                    =
 \
> --
> 2.45.2
>
