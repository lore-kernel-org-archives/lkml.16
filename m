Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7AE3B19A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147477; cv=none; b=aTqbeMa4bWvnnz29iIJzXrQ/n1ca7tZCjav5ErVAuFGoLZJW++6d6qpkggPH5xw1sJcfZxI3wwrn2hXROTRef10q4HlG6n7nCyTbqcPo8OVHIYHQIAwuJlw7JKqNfk3ZhXR1PePGUyRgsvYNo7xruJaYRbTLC6GWxdcX4xWf7Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147477; c=relaxed/simple;
	bh=VpbY71Bl65hiC8LzMCBSfsP0J9rgGMK0RtCDE4f34b4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrX1B5RnGMvsk36MdOQrXRSd6pxSX2DIAMFdlFoD27fx+8DUZr8PV1zBMMrpnq5bEE/cg0qJcMdekVefLYXqYx88GLtAoiPjC6LBC4Rs0V7oQp99i3HEn6GN6nEga5LFhzhcmks+S4KSg8hAo6WSXCgeyOMqh07Kr65AJAaGiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YtPk/NOE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YtPk/NOE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1104046f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749147474; x=1749752274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvu8sloBNTgv6e6OufuyCWUoelFhsOzVQ6+oeOQaWEs=;
        b=YtPk/NOEujaUhNzZB/5D2WmMVAborJtZ4eaL2IbesSA4UDDEQ6DthdEeDdG1DsFjuK
         1C/Zgvls9dx4OokYlIdMQWUzZEXQozZyOSLcJcTsTN/6ct/qq0dG9/GurfAsTEEEG+lZ
         45gl+trk7FMym4AfPz3+OZoKselmLeTBIxkJaoFIUxaZLpbe01TcnVFbCePs+PoxkKTJ
         WaDf8koBhMbecFl3YfhWtSq31YYqV4o8Scde4eUFvcrfQTxohtyNhxtTtCziA0+5Gjed
         A6kZVVaDvNtuHp29xlixIEpRdCe2xdEpkGCu7kvvPhoDWFfR/j3hjAt9SfcW0sds/oCD
         mqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147474; x=1749752274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvu8sloBNTgv6e6OufuyCWUoelFhsOzVQ6+oeOQaWEs=;
        b=fv0o9v4epGDENAh0PMQ1rUtfGZbCDOtlAJlIzzDPWx/HoAYPVijhVSLhX/v1L7twYX
         lLvzT6t4kY09Mp+C4yE2IgdMOJ5r7XJTUG5Dd8Jx9xFjNEwXTGIRSSW1t01t4ZOeLHeH
         uFBbl3reYm0aismWY8NYQ1ryXGhftl2bQK7m4lrXZJRU4pcgAQK/bN1IJz1SgXChhp2s
         BHABM5NdmZx1s9iPi6N7gqit9hbWwTSC1wkPoBhuSK4NDQFvdUBi9yP30x24zKBaX+BR
         WYlkHInvN57CASgMrTe59nuVK6In5CKoKjgwGJDqjZaJQV/at4rEIZ45Oc+kgaqStUnK
         wmuQ==
X-Gm-Message-State: AOJu0Yzj4pGFlz+FvYb79UPOAVCj7OpuSsqLLoxXY95OHL9L+jRaDS+a
	dxHN9ZiorDJ+GereWyzYlqHhWtAvwK0vE1L/77iioGb6FKgwoFn6iOiFudUDvjDcTn6uiXvjPgN
	BV5+nHEKVQnMEgOtkhUknf9fo1muAkzObDh3wa5Q=
X-Gm-Gg: ASbGncvDkp5b+XgMWUgUSP06dr1ssDPlHc6UeHh7iQmeqrMqYSWNLESLu3Vdyvtn0oz
	Z0BrynzjkGpX6+0hz8bnUle0h+92Xvjjof7W0ieMz2cwRoMCGRaSCIy5DhEz6C89duc63JpbOTh
	xMGfWe+6sPD8fLIyjdFJEdfFKaHBLVEjnxelFfIcC145z0wbEyZMDn8zLGyWKr3f0NYvOUAW7d
X-Google-Smtp-Source: AGHT+IGmAHifXr+9NT2LI45QhyXYPEt/bwpDY11autyc0qV6TwFplIUnYKPz354OWkB38DGhRMhQ/kb3T5MipuRJgWc=
X-Received: by 2002:a05:6000:2511:b0:3a4:ee51:8144 with SMTP id
 ffacd0b85a97d-3a53189eb82mr149762f8f.13.1749147474167; Thu, 05 Jun 2025
 11:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604212125.25656-1-yury.norov@gmail.com> <20250604212125.25656-4-yury.norov@gmail.com>
In-Reply-To: <20250604212125.25656-4-yury.norov@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Jun 2025 11:17:42 -0700
X-Gm-Features: AX0GCFs0McbnJtpdg_zQ8wVMJ839GQJLKEBCrJmPFN7tXIejYgdFs-3br_7Lh78
Message-ID: <CANDhNCrq=H1A8-8L6-FuiFSst=kXEgUR+YFNev6dGjfu5garww@mail.gmail.com>
Subject: Re: [PATCH 3/3] clocksource: improve randomness in clocksource_verify_choose_cpus()
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 2:21=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>
> The current algorithm of picking a random CPU works OK for dence online

spelling nit: dence -> dense

> cpumask, but if cpumask is non-dence, the distribution of picked CPUs

same: non-dence -> non-dense


> is skewed.
>
> For example, on 8-CPU board with CPUs 4-7 offlined, the probability of
> selecting CPU 0 is 5/8. Accordingly, cpus 1, 2 and 3 are chosen with
> probability 1/8 each. The proper algorithm should pick each CPU with
> probability 1/4.
>
> Switch it to cpumask_random(), which has better statistical
> characteristics.
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  kernel/time/clocksource.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index e400fe150f9d..0aef0e349e49 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -340,10 +340,7 @@ static void clocksource_verify_choose_cpus(void)
>          * CPUs that are currently online.
>          */
>         for (i =3D 1; i < n; i++) {
> -               cpu =3D get_random_u32_below(nr_cpu_ids);
> -               cpu =3D cpumask_next(cpu - 1, cpu_online_mask);
> -               if (cpu >=3D nr_cpu_ids)
> -                       cpu =3D cpumask_first(cpu_online_mask);
> +               cpu =3D cpumask_random(cpu_online_mask);
>                 if (!WARN_ON_ONCE(cpu >=3D nr_cpu_ids))
>                         cpumask_set_cpu(cpu, &cpus_chosen);
>         }

This looks ok to me.   Again, just the smallest nit about the subject
line capitalization.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
