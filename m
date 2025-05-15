Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7278F6B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291177; cv=none; b=cFoIwxgJJvxPeRlv5WoKeVo+kIiDChRlgzkGaedpDHV4sZyoVXDZFDOZz560QA/5kAnE12WTTkbz5wCwKKxz1+wE+NBgiJF0orT7jzaOOUUUoIkZurJ8laCDIPK3bgzsaVEEKLO0zB6QyMxcAsqta7KnDMCYOcOlG10RKIDgKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291177; c=relaxed/simple;
	bh=7m3HrFADU6K/ePFJiXseiJx+cfxOboEb2XiguWUsfzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhzoEAIl1ca+iJ7rn+L6bXiVZ8zWRop0wn6pJLt8rUZxe1W1mj5deGOIeIdDSxn+YYM7WqvkOUxq6dsxKM14+qz6eY7XJksXAnmXw6sNoy0pkyq7LHGtCVgjxKkjGIWPIY6+Ywg/SDR1oU98sZP0vRijdYPaU7IHxA37yzag3Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=l1bg6OKv; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="l1bg6OKv"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8613f456960so14976739f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747291175; x=1747895975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x2m3RSAmWZBZEj+PaQZiQeaOOx6B+ozKMgLfoFz30Q=;
        b=l1bg6OKvMk56i1LNscDQp/W8sxnc1QvRf5/mTb+gDLhSOWmPhXGy8Kr1/K6OKZPY1c
         tfVNy4BV2VleabbX2fjDZkPihxDLX1tqM3NI1s+So06P0H/mfO3ZAv0+vDjrneOqupQK
         4fI/piOhbizNvyxGtPkrEeM8wpdnhpptnugNhdHjDRebdqvBwgT3ys3PiufAD5Uy6XWC
         aqRAkRi4X1eFFwPukqju66b2Galc+Zdmmv5VjVUzOwrSeNRwHTNNfrnv4wb8U1ldUT++
         qg1jEM5lxFr0J1pE1OBWndphqIJL14mRMcQua1BAK5UfZ7+vhfQ1RhxEuKPcV83bbU/H
         79cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747291175; x=1747895975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7x2m3RSAmWZBZEj+PaQZiQeaOOx6B+ozKMgLfoFz30Q=;
        b=ZQ5yXhA4uFX4FmdhjK+r0JxSTSZqhGSKt8EnUmAyfO31ZMZrXBeRnEF1jhaWnGDnn5
         905Q2puYudHdedZ67d5HYj0oJWm0j+XyS1h8AYFLr2yVZtiptNcQprTv5r4YGVwfCQOs
         1JZnH5vS97yTGux9ZTtEebARDtJf6yqJUwVajjw7aZWYa029gmO5hiMQEhbGu7dz6bGz
         b+7OTrr7YSUz7p7T4F7iMn15riRXsaEsIgNNBz1ZiLTb5O0FWubnkfW3791/rsL9VXQp
         VEiurAgmua/NWOj8ylmkDJqvk7h8OMBf3cYXnu8c2Lkm5jmUn/xtXwh98/JG1x2fIKp8
         4udg==
X-Forwarded-Encrypted: i=1; AJvYcCWgh2JZi6QRXXXzbbwXCaonT7zm8ErgsUuUuuFWNFcjm+DVqHFmeHoMmRfq+yLAmvzpK2kLl1WcYdj7lns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCEUIz2vTgxHiqW/rCzmqvGVVFW+sdMoxDOLLfYncTa/v979r1
	XQ1zD5rB6FYkDhsOE+c+0GSii55g6xiEVfF0AKULy8eHu24Ck3NBBgcCr0q0ii6uzjVt9Blla1r
	Ck9qSAoZ5DOeJ0yMBR+PvmHZiWuLOtMYIb0fW0faW/RkE17xp
X-Gm-Gg: ASbGncvnKZ0QtwVHx6qc/OsKBARB+0jOka0mNukNVF/fmnGlN0kkoWcEWqxZsPtxH0F
	iR3ov9ZfHRAHsd2KWLWGfAOEKE764ftr9kPlL4lsYW9U9YgDGRV4KaWyCDGaC4eZ09iMlJzv3zR
	wHaiJR+fVjEZTPMpeyMI3Z5tUNillc0oW/D0B1/pj9zg==
X-Google-Smtp-Source: AGHT+IEeu0D8pHDHQW5TccqTotTBLOJ+RWC9pPxTNl5GwhC0PZ74BmZbAawuwwiBLjonxVe4alewTE5daIMupBgB4BE=
X-Received: by 2002:a05:6e02:168c:b0:3d3:fdb8:1792 with SMTP id
 e9e14a558f8ab-3db6f7f199bmr60062105ab.14.1747291174762; Wed, 14 May 2025
 23:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514171320.3494917-1-abrestic@rivosinc.com>
In-Reply-To: <20250514171320.3494917-1-abrestic@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 12:09:22 +0530
X-Gm-Features: AX0GCFvnkuONjW0g2to7KR73aQzmZtKG3JnmQAUt22P4CHLpD5Tq4AlRij675Uk
Message-ID: <CAAhSdy2nb0siV-oE8gDQLVdAnMzw2TQqYOSK6SXZqxzYBCqM0Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct CPU
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:43=E2=80=AFPM Andrew Bresticker
<abrestic@rivosinc.com> wrote:
>
> When starting the local sync timer to synchronize the state of a remote
> CPU it should be added on the CPU to be synchronized, not the initiating
> CPU. This results in interrupt delivery being delayed until the timer
> eventually runs (due to another mask/unmask/migrate operation) on the
> target CPU.
>
> Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous poi=
nters in IMSIC vector")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

My bad. Thanks for catching the issue.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index bdf5cd2037f2..62f76950a113 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -208,17 +208,17 @@ static bool __imsic_local_sync(struct imsic_local_p=
riv *lpriv)
>  }
>
>  #ifdef CONFIG_SMP
> -static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
> +static void __imsic_local_timer_start(struct imsic_local_priv *lpriv, un=
signed int cpu)
>  {
>         lockdep_assert_held(&lpriv->lock);
>
>         if (!timer_pending(&lpriv->timer)) {
>                 lpriv->timer.expires =3D jiffies + 1;
> -               add_timer_on(&lpriv->timer, smp_processor_id());
> +               add_timer_on(&lpriv->timer, cpu);
>         }
>  }
>  #else
> -static inline void __imsic_local_timer_start(struct imsic_local_priv *lp=
riv)
> +static inline void __imsic_local_timer_start(struct imsic_local_priv *lp=
riv, unsigned int cpu)
>  {
>  }
>  #endif
> @@ -233,7 +233,7 @@ void imsic_local_sync_all(bool force_all)
>         if (force_all)
>                 bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1=
);
>         if (!__imsic_local_sync(lpriv))
> -               __imsic_local_timer_start(lpriv);
> +               __imsic_local_timer_start(lpriv, smp_processor_id());
>
>         raw_spin_unlock_irqrestore(&lpriv->lock, flags);
>  }
> @@ -278,7 +278,7 @@ static void __imsic_remote_sync(struct imsic_local_pr=
iv *lpriv, unsigned int cpu
>                                 return;
>                 }
>
> -               __imsic_local_timer_start(lpriv);
> +               __imsic_local_timer_start(lpriv, cpu);
>         }
>  }
>  #else
> --
> 2.43.0
>
