Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7CA2E62C0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743745261; cv=none; b=Gv9kw0YeovN5orxjliPWNiETNbIz0TbJYWmBH3CDDB5aBYgHeRJIPL065gqgXH4h8GjmolgqQK4zOhHlRYlepikncUhSQV2Xy7R1IIy0do6AJ1kZxFOYvwDKnesRvPXJHfcm5uhmSwMVT1ypnEsmfAErKdUPmVbhoe4dCGkvpm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743745261; c=relaxed/simple;
	bh=XanvtstbKlEG37UuDXs8CGxGPf8CqERmDPZfP9R/gP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA2GpLEgkczw1GrlwOtML03r+4Dx7i27CtxOUG429YOnXLr7wzRyQMlIRRo4UW07pb4P92Oi2GcF6y4C7TBZ25sGoORaxlyx10FfS2JXmO9Y20Ms5tNTuHN06Gfoa/NIlj39iCpXzn1zzSPmFPTp2HDYEoQjnXC5cQ1JGbVDE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4MaJmyK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4MaJmyK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so2573865a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 22:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743745258; x=1744350058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/czh7r+bC5Gyqm9Mau5oolLwrgYzEZL6WeZ30aZm3o=;
        b=T4MaJmyKD2F5yR269qKWW0NRpIGV6zIuwAEWDAyaLhwJxQEdaYQDwUTClvKxK/hb8P
         9Bu/UISWGDh5KujKyqfWfyz2lJa/VeBffKQhP74uA9yfihS+pEsRwjTPZZ3PBRnnASyK
         /0MqVVE/JkHB0py8Vdqhw/Nwd3wrq7RVz15oWc8W7o1cqqJubCgdP8F1Ym0nqbwVEjhP
         EZuD5tVZhnLmkol099yJrgrejq3KWwOA8gdnvKMwwrY8UQFmFdGGaL3LU4xM4s38qHpD
         qAxnRhB5JBthdc3UVcHE4dr8hGOd7z+5ZdG4XPNwZgBHaBpH9N9zYZcCVyhpGZsuG3s/
         Bn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743745258; x=1744350058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/czh7r+bC5Gyqm9Mau5oolLwrgYzEZL6WeZ30aZm3o=;
        b=b8dWdzdEKruUAgw6Byc0f/tlpQu96tfgKXNdJFmrrfwtPWqFZlgTfIv56iLSnshP8f
         vEQLz8zBnibiOySDdOOPw+A0SL+Ya6RN6h6zrK0dro3cX90zZoHE7omQ9ZPMcMASly6O
         HycnlgAkfbZGnLrgCIAzR/akYvlrQpBGuIw6SbXW0K55lzDfJS7Z/EGY7vMDYo4+8lvY
         uAQqvicdltnlzyQ+WMr4G93CzrbFzv2u9gI/JlOrjXEuR+fUByiruGZqlMDVul/UM/8j
         bkYCzZDrKIvwE92S8if6c8+ZRC5SUH9cFK35ptLj1z6bal+NbLkqc/UPC8cxR7P7MNep
         iISg==
X-Forwarded-Encrypted: i=1; AJvYcCX1PavOz+SIZa0S+wMYzm9r2023ONDLevN3B+uWUBy/be5yO20P79/j9xwb4Bq7hN+uYSPUS/hYRZl9vHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpY3abBtj32TUHt2O3uLvR87Kx+R2RPX1EDy0W92hlN7QL2vrZ
	B194032nv8ltCFfULbn8Q6PyfluxZ5pUwONVSsYawb+RXA9vqlBjgcrVb4AR3wO6aSxZdR24vyg
	bsuX9lOuE8YTL5b1j/h4WuCS1nfs=
X-Gm-Gg: ASbGncvwrtTtr94ZgZMPob9u9RHLBbDzRT1slyTT7AR1bItsNwK+0iDtNuQEmH6Dr/z
	vcT4rUzZIJ/jVG2KCN4/PK0+fl700dqadA5z7/FTGV+HZvEP5pt6K35sb6Sr+4TPHjY8Dgp8p/k
	Bp1dvS6gyEZSZ8ksPc+IVrnTHp
X-Google-Smtp-Source: AGHT+IHrtcvhVYzEBT61HMznqxXwSb2skAKyVoxKzXeZfl4CNz6X0bCEYkftcbRZmnTNQQTuyHrE25Sqi5oP5i1hoVI=
X-Received: by 2002:a05:6402:1ecc:b0:5e4:99af:b7c with SMTP id
 4fb4d7f45d1cf-5f0b5eba1c5mr1069295a12.9.1743745258250; Thu, 03 Apr 2025
 22:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
In-Reply-To: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 4 Apr 2025 07:40:45 +0200
X-Gm-Features: ATxdqUFQ2Woz68LI7ruE3dyUPl3U--gRuwmgnyRcuqe20h2-8Z97efInk9NMCZo
Message-ID: <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
To: Breno Leitao <leitao@debian.org>
Cc: akpm@linux-foundation.org, brauner@kernel.org, 
	linux-kernel@vger.kernel.org, joel.granados@kernel.org, kernel-team@meta.com, 
	oleg@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 8:01=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> When the system is shutting down due to pid 1 exiting, which is common
> on virtual machines, a warning message is printed.
>
>         WARNING: CPU: 0 PID: 1 at kernel/exit.c:897 do_exit+0x7e3/0xab0
>
> This occurs because do_exit() is called after kernel_power_off(), which
> disables interrupts. native_machine_shutdown() expliclty disable
> interrupt to avoid receiving the timer interrupt, forcing scheduler load
> balance during the power off phase.
>
> This is the simplified code path:
>
>         kernel_power_off()
>           - native_machine_shutdown()
>                 - local_irq_disable()
>         do_exit()
>
> Modify the warning condition in do_exit() to only trigger the warning if
> the system is not powering off, since it is expected to have the irq
> disabled in that case.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  kernel/exit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 3485e5fc499e4..97ec4f8bfd98f 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -878,7 +878,7 @@ void __noreturn do_exit(long code)
>         struct task_struct *tsk =3D current;
>         int group_dead;
>
> -       WARN_ON(irqs_disabled());
> +       WARN_ON(irqs_disabled() && system_state !=3D SYSTEM_POWER_OFF);
>
>         synchronize_group_exit(tsk, code);
>
>

Can you share the backtrace?

Note first thing synchronize_group_exit() is going to do is cycle
through an irq-protected lock, so by the time it unlocks irqs are
enabled again.

Preferably whatever the code path which ends up here would sort it out.

If that's not feasible, I think this warrants a comment above the warn.

--=20
Mateusz Guzik <mjguzik gmail.com>
