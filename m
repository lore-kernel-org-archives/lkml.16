Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB027A102
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147114; cv=none; b=bsUbk2jq3ikBU40YpmgS2RRhdvpfzPQkVk0x/0ES0+VwIH0eA+wWT7gfpRpTUk1BqhNr6zNdJeUqz2nJCkJVCMbWZ7CLTaDhmWCDKNiREPgfglhr4+eoN2eLC0BHpKuu3WzNyAinJBqoQoS5vK/ZLMUBJmgHypsJT+fW3pSzI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147114; c=relaxed/simple;
	bh=rUmXwGQdDxjV+rRFIkStphHB+nxUW5E5U9j4a+aHMAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTpmYxVIDAIo7EwfTpHq1rEIytyC/tb2kMSjVHMPGwQPgZ10WMJYl5dPnzCR/+LFIL/pQeS79Jmuc9l/tSOikjNhlux6UDHPvcJ0Y71/NaKUnrnefK9LIN6Wbj6s8qUAtEQPpejBUQc1iEhX/HLlX7yRXQoAOEK51jej8kGwS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tVz3GuDa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tVz3GuDa"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso1462706e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749147111; x=1749751911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqsX8qqbM+TCchaFzPooUts8SMOS7Px5HGH4hYP3O60=;
        b=tVz3GuDatodyJhRXjdxGMvbHS/lpzZgPvSyyHIfq33wdetoqlDpmNxe/Echk9jXkwk
         q++nEAUfSUphsVHbL9IxcYLW62ZPzWRT4wzucbi6SH3zcFgMGwWLLvIMy4nUXvcAeUzY
         iHX9SHm+g68yZML/eA3slOhTmJKpQuueUXVLf8AoQkafO9bmMukbLbHeUpb7ydC6LtTx
         AaipKOuNgzDUnAG0c8G10dKg54iJq6XZe7yegWNOVKd08eRo8xS11POaaOpTAkeZbXiU
         wfoGYHy8AuQMNNUABfH7Jb0Qx5JHXlT5mkaES748N338qla63Iw5kBq288AQwBfM1Bto
         l3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147111; x=1749751911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqsX8qqbM+TCchaFzPooUts8SMOS7Px5HGH4hYP3O60=;
        b=vxNc86L1v16eP9QibabQg/TAMoq9X/F/rVxbOdsJzPmCX18ptXPXR5hYtPS2BIF4cD
         vkYGx4RoIHLZ88RaB9R0YP5FpiEC1sT36ZGh0zXb748ZakCaLIWkIADszpLZfgB1G671
         Lj5/cDaEmsxcNDI8tol0UHd3tgiGwyoud2JWq45k+DdppthV4133WmExyjLheRkZJyKL
         HKnMl5r4h8ZdtSsPMlXYmq3y5BlqU3Ri6CZ8pnOfOCzuek40+hG+HRDGiCpqPwsk7H+b
         N2CtZVtFthq0J2d7Drku0Epa6zzZWOyaN7ZqS0IYg1ZHcAoXuHCs9REJTSCjO+Sdb5Ql
         WCQg==
X-Gm-Message-State: AOJu0YwJ5oFz3gOcA88cnZyguKziHhaFazmUeKnUTrffiVPwmeGqFN43
	ZeCbTK+VtPpj+gKlxfbGiUVmdNzGF8F/4HHMcvpGreJH0JrogXCKxO43mLZ5A5LVz9NpcRrzO7F
	jKXHI4YU/1PdKyM1UqBC5Xmd2HX5wrx3hqGcTOYNv2yEP4q9fr7YVNz+Nsg==
X-Gm-Gg: ASbGncsv/Jo7Qq/2TMtec2+5ClYxTCHuW/OIZoYWbv3xrNJfvHvGpggUBFk+hc69+Qp
	682D/uFipyLMPf4iARM8AfOjSXxoaUsLmaHmG4y3zBzyyKjC7QD+IQT2WBTScyZ5OEjHA0F/sJp
	q9htrU08AO1vUUy6pkBig9S4GLWr/Ctuap46IlsGWRg4FUvsv/nrThLXTs5TCydnxoMCOEWJXA
X-Google-Smtp-Source: AGHT+IFzi4xrYNAH071GgMe065FQ2P3SE4t76MHGyx7VbRSDC8qVEB+1BKPEvbx0ydELHa31Zii4Zs/czWY+H7Bi1KY=
X-Received: by 2002:a05:6512:304b:b0:553:23f9:bb3b with SMTP id
 2adb3069b0e04-55366c40efamr31505e87.49.1749147110524; Thu, 05 Jun 2025
 11:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604232550.40491-1-yury.norov@gmail.com> <20250604232550.40491-3-yury.norov@gmail.com>
In-Reply-To: <20250604232550.40491-3-yury.norov@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Jun 2025 11:11:38 -0700
X-Gm-Features: AX0GCFsdjHpjYmvYs_jT3o7oe3wxiPx0OI8DSbCrTtkDaLaC4BErI1mG-0dqcFc
Message-ID: <CANDhNCqbJZejdVqDJ8BnBstq1FAk5AiAvAo7sRnrKC41mCZ5nQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource: fix opencoded cpumask_next_wrap()
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 4:25=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>
> cpumask_next_wrap() is more verbose and efficient comparing to
> cpumask_next() followed by cpumask_first().
>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 2e24ce884272..0aef0e349e49 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -584,9 +584,7 @@ static void clocksource_watchdog(struct timer_list *u=
nused)
>          * Cycle through CPUs to check if the CPUs stay synchronized
>          * to each other.
>          */
> -       next_cpu =3D cpumask_next(raw_smp_processor_id(), cpu_online_mask=
);
> -       if (next_cpu >=3D nr_cpu_ids)
> -               next_cpu =3D cpumask_first(cpu_online_mask);
> +       next_cpu =3D cpumask_next_wrap(raw_smp_processor_id(), cpu_online=
_mask);
>

This looks ok to me. The only nit is that often folks like to see the
$Subject line look like:
  $topic: Capitalized description.

So for this one:
  clocksource: Fix opencoded cpumask_next_wrap()

Acked-by: John Stultz <jstultz@google.com>
thanks
-john
