Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C323BCFD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571799; cv=none; b=iuqW1Ua52OulOEFSTwqz6BIS8g0pC6bq95gN7wtR8MQbANuXPY/y4XXSKntlKcPro1eTZAoMmR8TipZg8Wr95ulCiqoavYrleCsYWIP+gyXqSJCeqidSi7VavzlhWqCgImj1SkqXQLUDd3+7/peLjMUeLLEu66lqJ5sPnG37kV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571799; c=relaxed/simple;
	bh=0AbnPkGGR2YnWbYMVXmQH/1IitycG/586CgBD51fF04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlqJVmsBUtGSCpxZj0UZYf1C+xF80xNRag7ptov11+w9tZ7JHgPQSAUUEfHaTx+0gy9JTCyB/I/Bm5h6ZDk+Tv41cheqwd91NfYyiOWabRtP6lbsYCKbyod4rT85lYwhvUFYa9Ele94iiRnL4bGCLk8MieHZi1UZk7CfqRteFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsUiAr28; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsUiAr28"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so3269145f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571795; x=1750176595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/lkv9RH6MlsuVvstDKxmObrju7rsyAjQHI/g+B+6ik=;
        b=ZsUiAr28gAnUgWKgUyAQAnbxNoRxtbWVSIWrD2xW7m/g8QCxHB1fg1HNH6ErBo4TWy
         3ed5uEcyLZ2pEnph4KL9nXueNncSXOXaeXVHE7Ym5JTlv88/ri2pnrO+iFXxvgHsD2Rk
         ipO4QJJuIgw0RnKCCpOrvB4DJP15A7ThdDkHXoJkEWpWVIk59B1o6CaNotKu4p9Wq9cd
         q/JATSDwVxZIENlUORCgPNScbn1TfHi736Za3CAMJUCQ2A9EaPapjxzLlwcPTSAF8J7P
         oP/TUrYTVENdIeo3ap5IRygA8+oBJ8ULV2/tVaftBvHpE75prUU/jLhwmO6HUM44dSWX
         j+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571795; x=1750176595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/lkv9RH6MlsuVvstDKxmObrju7rsyAjQHI/g+B+6ik=;
        b=EV9Ci7WLltTOu47oTcMHN0f0abR9bPiuGuapEX62hb62SXRjl8vqVkxn84Fnh+J5eK
         JSxF1kqCa6wyltnZHzgadlsP23uVl7fhrKOxjHB3cetLiHtnNaRUpnU5mmthe4uM+cCL
         kQdmW+bONnCDkNoJ3wyyFpFGhJ9mN8/0exRRe4FbSoz/Izi/PBiIHShGMEvJnBQtrZjK
         QZYajLP+Z1MjtDd0H7dlJuDxUyhFX4+Mvu2zcfa/4EbmNwaTPlgexKrbukuAcpR8nrtb
         t/CPhM9cfWz8Hfx9u55KzsBKpLMLUyU8gnY9+WNFAXsrhG/wrU0PHw8Kdw2ODew3UlqS
         BxuA==
X-Forwarded-Encrypted: i=1; AJvYcCVuSaNHAK1L+9TLHEEvmc28tQ0K+RdKdZFkFcwICxqXfWfQzxwUsF7497CRAhpSB/Gi5QV6aB2xvsumcWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGGpqdhiPu8hKweLjDae5BNPqwrhgYbfcqJ7mGiTGtEaZ38a+q
	PNyFt5sEcsJJliwmIrTI/DT/dgzNK014veaAMrwYWdWwuDXrT5wGV9Ci40y+VMQY/q1A654Ur0D
	J6fYDVAxWghSfYLfRN1K2c8JcfQsI0DjgIHJ6
X-Gm-Gg: ASbGnctcXdcPooEMrHgwFo5VBvO/dHp+hvHUfxL5LWHmBT55jCJM0X0ErI/eweryY6g
	7pw7QDKgMZl9HJDGyAS8P501kV0RFTEiPSNYh5fytQS1VX7Dc5St5JSrmIxbvCCG13xiwSzs3NQ
	EzrWi1yM4k/wGsGQuqYARPODgh7i+UQ66vgaIqQJwbMV6Y
X-Google-Smtp-Source: AGHT+IExCH91F+uWkvO0zCNWlox2+QHGDnB0V7fGRtRxuuJaX4/C7nXpN1b1TtDv4W5ItkngDEdC7CDZm5r2s2rFyBc=
X-Received: by 2002:a05:6000:4387:b0:3a1:fcd9:f2ff with SMTP id
 ffacd0b85a97d-3a53188a6camr13792631f8f.12.1749571795352; Tue, 10 Jun 2025
 09:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610111559.1667156-1-matt@readmodwrite.com>
In-Reply-To: <20250610111559.1667156-1-matt@readmodwrite.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 10 Jun 2025 18:09:43 +0200
X-Gm-Features: AX0GCFso-E-9aKfRV2m5yfhkLBFDhOYutTuqLbdAIEoR0xYES7h848mXXJPzRAM
Message-ID: <CA+fCnZdR3qC-mDKSb9wWnA3-2qQxMvgArCPd3Cd_h=psjBx+vA@mail.gmail.com>
Subject: Re: [PATCH] stackdepot: Make max number of pools build-time configurable
To: Matt Fleming <matt@readmodwrite.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 1:16=E2=80=AFPM Matt Fleming <matt@readmodwrite.com=
> wrote:
>
> From: Matt Fleming <mfleming@cloudflare.com>
>
> We're hitting the WARN in depot_init_pool() about reaching the stack
> depot limit. My assumption is because we have long stacks that don't
> dedup very well.

Note that this might happen if filter_irq_stacks() somehow fails in your se=
tup.

See e.g. this:

https://lore.kernel.org/all/CA+fCnZdWgAD1pu4yyjON0ph9ae1B6iaWas0CbET+MXLNNX=
t5Hg@mail.gmail.com/
https://lore.kernel.org/all/44140c34-e2bd-4f6e-892c-51469edc8dfb@redhat.com=
/

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
> -/* The pool_index is offset by 1 so the first record does not have a 0 h=
andle. */
> -#define DEPOT_MAX_POOLS \
> -       (((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_POOLS_CAP) ? \
> -        (1LL << (DEPOT_POOL_INDEX_BITS)) - 1 : DEPOT_POOLS_CAP)
> +#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS
>
>  static bool stack_depot_disabled;
>  static bool __stack_depot_early_init_requested __initdata =3D IS_ENABLED=
(CONFIG_STACKDEPOT_ALWAYS_INIT);
> @@ -245,6 +241,9 @@ static bool depot_init_pool(void **prealloc)
>  {
>         lockdep_assert_held(&pool_lock);
>
> +       /* The pool_index is offset by 1 so the first record does not hav=
e a 0 handle. */
> +       BUILD_BUG_ON((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_MAX_POO=
LS);
> +
>         if (unlikely(pools_num >=3D DEPOT_MAX_POOLS)) {
>                 /* Bail out if we reached the pool limit. */
>                 WARN_ON_ONCE(pools_num > DEPOT_MAX_POOLS); /* should neve=
r happen */
> --
> 2.34.1
>
