Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB71C1F29
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336573; cv=none; b=g9zLUdksPJMtbm/Tblsu/uKCaU8lpZQgOEwexJxwNeEH/XN6PHRmoMrjahO6lM7EdyguJ1gPUYhBh6sFL7tXYxwWeDaxrF/i8l1Zu5ZNleq220K73Y6xmMckB1vjYO/BuEcyIWe2QsDB04Y2ChutBXnvmMk8N6uUYH1Om4/CrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336573; c=relaxed/simple;
	bh=Ig107Ky/TMZJdiRV1W150SfNydtSmr8TmL8soenjx+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j57gtSAC1cMXjcJMPIEh8aVyRuiIyaq8S0p/rTxZeJJvooCyyZxSkUQFP3udjZ6KN7ZnF9plyKywC8i3BI3lESoLLb61Cgn6AyzxmuplUPmP+demWGRo1dklr87OPZVnhv6ZOF9c77/ogJ3tmmDgFe+RTqkQXkJ5+ct6sodH3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJJahlfr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJJahlfr"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307325f2436so21460941fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336570; x=1738941370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z8jud5I+88j8c5FBdjvwkGiXPpGClS+9lFq2AsRnkI=;
        b=KJJahlfr92Eo5j0Br0x1FVoYPsWQagAUJzjmXliDoolR1hKIuJJmkUHe/vgdAmc2DR
         yqe80Yy9CTzec3Ss+tF/EDAQRQhWjLtd+p3L7+JdpNkYCS61W5kUciKHK5eQ4VNdpFM2
         ciNMGWNJeMInSS4YDQgL5IsVIfVW4iOAy+ZwXzENpP1pwrxWwJ3DQqgaunaWXTUrcL9p
         73TSvhV95dERf2E2YoTjwnDfpMmWcR7gXEVwbEd8FFFtDxnA/vPzYrOAw+rNKM0jeQ+V
         20dYld6kppAG5D+jp4Qffeh3GjAFogepiXGsXSRMXzOQqlosixvANgX2Xr8KuvFfwArL
         N3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336570; x=1738941370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z8jud5I+88j8c5FBdjvwkGiXPpGClS+9lFq2AsRnkI=;
        b=Takn5ENezYe49+8g3+nRt9bsYm2RSY7S7rJL1eTgQP1nCOoNs1tfFlQrlperP1kETm
         onQGrgZxerMTXHRYAuo3F9kk/k8u1dUGFyaM4Woi5zIWjGEBuyEBlhoyKh9ucOoPIAgj
         EX9QD1YGEhJl15HZ++C5cXtolV0x8tGeemA5MDpgqqTw6kcazIilqZTkyluw8xODxkxb
         gRRqxVLJBTPk1QIW/3glmIR6tMos268Rd3OeVCa0MBZiSmgWa1AVhcxi2/w/dG6xR6RR
         sQqCn1974cfmFkpPGwJKAmMwQCfLJeuLbMaYaTlj6fgwhGzO1OHmLj7ng5sIgTs6pRaa
         9dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUQWeEisOEH6y7JE/+pnw4kSvqXpauQ5Du41xd87vSTCr3Rh8ibxG09M1qMytd2IXTIDqz8ffO07fj6fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBdIqVoZdDdWg/iT9RA6Lu2Nbnm2AoCLHzA0l+XvKVFixPK7m
	10L1YfVo0NChzRb2n4DeumprwxAeSBHY4eEAyEwUGrTP4LQRCAsW/lrKH8iyUWHaKnLSULFh2fR
	A1a3arD9q1USC7/ca/VeRjRFq74I=
X-Gm-Gg: ASbGnctq4RF0RyefD1QS5xmfKb9tdoRywUf3eNTm5+EiXn7e+GTKQxFirJD70sgW50v
	1Yod+t/elvsGzuY2p597MeM2S5bRsv6AsdBGpTaybzZUokNDQ9aO2w/2WR1y5LQXc0ivQS9eY
X-Google-Smtp-Source: AGHT+IF/9oeVXgyvyPWRBuHUk5ryjuppXBeuxgnBh8ZZE4dQhtSLnH96GX9gu120E8cEmZ45dNBBmuQkyE4IRUZd0aw=
X-Received: by 2002:a2e:a987:0:b0:302:17e7:e16d with SMTP id
 38308e7fff4ca-30796811ed5mr30919231fa.3.1738336569794; Fri, 31 Jan 2025
 07:16:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129154920.6773-1-ubizjak@gmail.com> <20250129154920.6773-2-ubizjak@gmail.com>
In-Reply-To: <20250129154920.6773-2-ubizjak@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 31 Jan 2025 16:15:58 +0100
X-Gm-Features: AWEUYZmiJKIrRvrb0PdIINkYWhcfXp4rLhPq2uHmp-c4ZoM9_9yPUwj1N9jd0FI
Message-ID: <CAFULd4YZeCZ4vuZyb-ViXYELS0FXDNX9jUNUbQEnqEf+N=uD8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/bootflag: Use __builtin_parity() when available
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:49=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> Compilers (GCC and clang) provide optimized __builtin_parity() function
> that returns the parity of X, i.e. the number of 1-bits in X modulo 2.
>
> Use __builtin_parity() built-in function to optimize parity(). This
> improves generated parity code to just:
>
>   57:   84 db                   test   %bl,%bl
>   59:   7a 5c                   jp     b7 <sbf_init+0xa7>
>
> where TEST instruction sets parity flag (PF) in EFLAGS, exercised by the
> follow-up jump instruction.

Unfortunately, this approach won't fly. As said by Pedro elsewhere:

__builtin functions aren't strictly required to be inlined and can
generate a library call if the compiler so chooses (how often this
happens depends on the optimization level and architecture). e.g:
https://godbolt.org/z/zKPb9hbaM

Patch is retracted.

Uros.

>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> ---
>  arch/x86/kernel/bootflag.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 4d89a2d80d0f..d63247d7abd4 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -22,6 +22,9 @@ int sbf_port __initdata =3D -1; /* set via acpi_boot_in=
it() */
>
>  static bool __init parity(u8 v)
>  {
> +#if __has_builtin(__builtin_parity)
> +       int x =3D __builtin_parity(v);
> +#else
>         int x =3D 0;
>         int i;
>
> @@ -29,7 +32,7 @@ static bool __init parity(u8 v)
>                 x ^=3D (v & 1);
>                 v >>=3D 1;
>         }
> -
> +#endif
>         return !!x;
>  }
>
> --
> 2.42.0
>
