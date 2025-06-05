Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6AD1DFF8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147222; cv=none; b=Pq+azACV20Rz1ka2gRaoRZk3xIFr+qYzI3wcEK7aMJkhr+mvAcNyvBFoisGG05GanbUQMTno4vQQRh6b3cx2X8pgo49D6la4ExgG3+HFd7ZZ2vFfwPNvyh8cOyeaeD3oKkj1F8BB43gCZ/ssInzh7jW90ktOwuVdaHQRXuN+cVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147222; c=relaxed/simple;
	bh=kbQiTpYzlKIugNzXVQvh3fWQU1VPeNW7M8mTVBMDme4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4x0JNQ6palbzS8ufnm4B8aBe4Wetqcqqn33QQ6LbP7rX9a3XNqve6bKxr8FAmPlCpdixcbIGewd6VElNiFFgC1wy7HnCMHUImXLgxT7c0fpzzBOjQc0fMjjL5mEnMPJH3GciEkGCFxP32izRnTNzeY1aj6pAxby3LcL0YXnESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/cbNod+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/cbNod+"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso777948f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749147219; x=1749752019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nw5qV7G48PTHV+dWXM7gCnL/G9MAbsJfcH23iBviEk=;
        b=A/cbNod+Z0UXKJWxcOTorr+aDc9u17wYdVN7Een+cDRrbMFxjQIPwYtF5mvb2KOtiS
         4PCgt2aEXF4Y8P0vTN2e8PRnVEoVzWZhwJHCiIbqQdUt8MZoe30N3F9BMDVpP1AuBGrC
         ldLU9qOSRYLmRyM4z0MwN9rPTVgiHBG6n9a+sc1IWTf0/2qGV8nYg1rb3vdHuanPtIIu
         BiSloLiGmimOP/FeBElZsyzzGJVLSGXaRcSzjE+vxlfbI8LTLszuWTMdDfRVV+4TWM4q
         7m3e6B3kiAtj0XhmfOXMFOjO07tO17hidNyyfeQbilO8DCHzDO+spT433UIB/xph8Cqf
         Dq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147219; x=1749752019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nw5qV7G48PTHV+dWXM7gCnL/G9MAbsJfcH23iBviEk=;
        b=I6hICDH4DRRTpu6fdAuNCR4aYB9YO0zTnM4Xe2yRy74zr9cqFOjJCUCi9HdXy+yuPB
         Ud0Ltgt2DiRepSr4lUJNMmHmuriJN93XXF4JIxGLMp1NdGWVxPNXnzPNeB3ltXEK+tUr
         mvFQ6p+O4ipbHX4Req9XB4SphPlbRR4eStNNSkbFoovtFF9UXMBqTkPli2GsTbrNyCjJ
         MrsRuMHf3qDL+y9xx23lCHZIB0RW/tggyikzC3nxsdD1zVcn/5HBo/V794zRW0lSGvJI
         sH95Qw8taor9yIyq6GjxwjGdaKPRrOl8dDiKget0O/63gt01bMiFzCrG7Tp7q1iC7taC
         XCVA==
X-Gm-Message-State: AOJu0Ywv08xYbATx+4Io1taNvEsQYgQTvG11V7uO5ekUAuDvxT37ZX5Y
	jozFElA20PBfr+8S03Fyff+/ostF1IRPTCIbyyGOkdxfTrskgQ/fU7NTCwYsWRnvM7D0PDAf66B
	GBN1MbLVO+C+xjxRd4XDsm4Rr6UmBrlBwcU41/mU=
X-Gm-Gg: ASbGnct4CpteSChuzmCLcXPO8Szm7YLop4px8vvk1y+ZsYHgO0GrWuYUQqQSpD9AWxT
	bQtejAgGraNIPekgFnnyW1lfb/U99jKGH3UPEaSWZc/HB5P/CVgeZoGKH1+HUCMWYJX+reLs5dX
	vY7DvWG6Iorziv/990hTDv2XXDHmMjVpvpBYPQZQMtpyT9nLJrFYpKRjv8OpohXVwxV/KjQPxjU
	F753A+K2tg=
X-Google-Smtp-Source: AGHT+IFSZPAeJmtLZbVTpln785kmlExxQ/JLqwWxxzHr87xcGzRZ+MLPi1EPQXAcqK1qR5q/b82mb08x14kQt5gneec=
X-Received: by 2002:a05:6000:40dc:b0:3a4:e5bc:9892 with SMTP id
 ffacd0b85a97d-3a531cac62bmr77972f8f.21.1749147219274; Thu, 05 Jun 2025
 11:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604232550.40491-1-yury.norov@gmail.com> <20250604232550.40491-2-yury.norov@gmail.com>
In-Reply-To: <20250604232550.40491-2-yury.norov@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Jun 2025 11:13:26 -0700
X-Gm-Features: AX0GCFs6jGm-EzIfYYnSqYUVnbThfJLfqhTAsX-xwphsOo_t_z2QHvweS4c8csM
Message-ID: <CANDhNCq5qLFe5mLQi8RQGU24ERdsvpLwBE3GRJ4HdU4caJZNDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource: fix opencoded cpumask_any_but() in clocksource_verify_choose_cpus()
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
> cpumask_any_but() is more verbose than cpumask_first() followed by
> cpumask_next(). Use it in clocksource_verify_choose_cpus().
>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 4b005b2f3ef5..2e24ce884272 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
>                 return;
>
>         /* Make sure to select at least one CPU other than the current CP=
U. */
> -       cpu =3D cpumask_first(cpu_online_mask);
> -       if (cpu =3D=3D smp_processor_id())
> -               cpu =3D cpumask_next(cpu, cpu_online_mask);
> +       cpu =3D cpumask_any_but(cpu_online_mask, smp_processor_id());
>         if (WARN_ON_ONCE(cpu >=3D nr_cpu_ids))
>                 return;
>         cpumask_set_cpu(cpu, &cpus_chosen);

Acked-by: John Stultz <jstultz@google.com>

Same nit comment from the other patch, just need to capitalize the
commit description in the subject.
  "clocksource: Fix opencoded..."

thanks
-john
