Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A0284675
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744647482; cv=none; b=TZVNdiitepDT0XJmNoXAbyRQrfnz82uSd6GzTebaSSVbAV5Ti55O4VoPCRo5hbP0YMGylv8QEJzURxrJ7Rh+4Gih5SZXL00Yr8Lh3mdWfNYQ3UED5voKNr80KTQJvc9oEoS5IwBU7BM5IaaKQYoykS/Xn+FCHRq0aaWnDgYlseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744647482; c=relaxed/simple;
	bh=6wis8Wgyzp4IZe/WwXpzV98FizK/UCCFtwSLNaJ3uoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnxz5DbQVs7eS8d+Sd9e39W1eHQMM5cnwvBe5HrEFcnUEZ5DjPDhMefjF2Ab8bTqHXyOdM2319tMw94OW8BIErtm/gvCRuXr6t+KA1hDIQwb9zfcU6xVlf1c5awjTgPrrLqnxwywfg19iubvZ7jpMjYrHad2TTS+Z8fCkexzYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xh2wKKOI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xh2wKKOI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b166fa41bso5422967e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744647479; x=1745252279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTf2mrFUD2jik0yS8vwFp9uJKMZhjGFsSRmmDNqFWZw=;
        b=xh2wKKOIG2BK34QRpmG6xPQ7koU+L/+kdF+dV5W5mPe4PBpBQ9vTvU786j528EC3CA
         YP/HuTQehWDfd9o8w0zjHby6rdlKT7WN6cJML9U3uQU63jWdytg61pK/CHdpl58aGvrS
         lF9m6sR2KbOLe+/4G3PfpwKPHHfAJBKfxdKslInVbTMu7s9GUyxORloM0tXoKjA8zoro
         BCkJ07NdsMzVc/8xzq6ZRPg4kM+VSANsICByVvQ/3zgK6Tkk6hqCvBpAlY/VFOiWOep3
         uw0XqPcT21X6gPaLSLtM2IgbZxI7v1/w3e/nY6Jr3CSn7uRXYRq8FjuKpAmxQJtY2y9h
         +Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744647479; x=1745252279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTf2mrFUD2jik0yS8vwFp9uJKMZhjGFsSRmmDNqFWZw=;
        b=uF/nMLXFJH9YKb/rV7lxmkb2JORXaSYx2DRDHsrf7R8+W4RpGjbGb3SBcztcTrspQU
         0UQAXTOxkhQLcN9UW2fyJuLWxQbgGE6Uwka0FM6JbbKexds1AX6D8uwUp6Ut8BicX5mO
         ShtKCI7m9cCm8QCwIcAGHzl2jF4jHr4gawOTgi1nU0th1KOp4anAQcuSDx9BF7Txc4iW
         jRko9tuCg62UOKLxIAOzh1ebdLZOkgQwWfhuteBOGhjxXmi0AjebI2tL20nqzWl9x5qE
         9/Yg9XId2nWZxBIiLrs3W5Rw/zoOmgXKuL7pJjmr79TTHtOktXao+01Nltx9A5VpZmsY
         6+vA==
X-Forwarded-Encrypted: i=1; AJvYcCWaNN5mkvfb+A+hOnlsMISzKEV4hvkcYpQyvbHnqeDugNhqLE/MZJy13Wfrb0M2FBsz+SzGE9plkWkMbtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVqKK+PmyYAS5xmW3ktIhDWHCOnzVItQUnJ2g6RwMEphcGYdG
	YZmXKokPVWflDo/o8nO7nDVX3jc3OoPfApIXEN87ZSMu8Ka7yh1/LPRB/v3sJhDcx7oyCaTRk2Q
	czLxb7+mVOSpG2PsllnWyWHXbN31PZo1HqqGwIUoS1DksRGtq
X-Gm-Gg: ASbGnctUjlLpCsKVc5ET9GiYZd3ksXT2xl7c7Wbie0aa1875hcb2Kyziczxghb+evxz
	dv6/4wCZ4SVR+rMiRPgaDhPLBsPoBhkb0un93D4bbRpT24//ikYjZcfOyeC1Vpn42NUN4BUqn1y
	ij0BG3bcHIvD9ossbCg20nRutRo4aivgZcpySzEdaxk4SoKcKoMgoaxhkSnEa45g==
X-Google-Smtp-Source: AGHT+IEEJxH5Gw/VYXYZjvTUymJBjR3SCI7KnWmqVgjCywuTuPnFXsALmpLzpiyXHKdY3sWQZCk2jMydzsd9wD+VzK4=
X-Received: by 2002:a05:6512:2341:b0:549:43f8:824 with SMTP id
 2adb3069b0e04-54d4529e92amr2615930e87.26.1744647478694; Mon, 14 Apr 2025
 09:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406013445.124688-1-fujita.tomonori@gmail.com> <20250406013445.124688-6-fujita.tomonori@gmail.com>
In-Reply-To: <20250406013445.124688-6-fujita.tomonori@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 14 Apr 2025 09:17:45 -0700
X-Gm-Features: ATxdqUHa_B4vLGWeqAXElK4MBxPg7kybL6ZAOzLmRudCKwhJmX-6Ncn6LtVt6Gw
Message-ID: <CANDhNCoLfQUZ8akUT1PW=GJ=O67b=_M6TT-c7KzGH1qbdJxaGA@mail.gmail.com>
Subject: Re: [PATCH v12 5/5] MAINTAINERS: rust: Add a new section for all of
 the time stuff
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, frederic@kernel.org, 
	tglx@linutronix.de, arnd@arndb.de, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, tgunders@redhat.com, me@kloenk.dev, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 6:35=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add a new section for all of the time stuff to MAINTAINERS file, with
> the existing hrtimer entry fold.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  MAINTAINERS | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d32ce85c5c66..fafb79c42ac3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10581,20 +10581,23 @@ F:    kernel/time/timer_list.c
>  F:     kernel/time/timer_migration.*
>  F:     tools/testing/selftests/timers/
>
> -HIGH-RESOLUTION TIMERS [RUST]
> +DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
>  M:     Andreas Hindborg <a.hindborg@kernel.org>
>  R:     Boqun Feng <boqun.feng@gmail.com>
> +R:     FUJITA Tomonori <fujita.tomonori@gmail.com>
>  R:     Frederic Weisbecker <frederic@kernel.org>
>  R:     Lyude Paul <lyude@redhat.com>
>  R:     Thomas Gleixner <tglx@linutronix.de>
>  R:     Anna-Maria Behnsen <anna-maria@linutronix.de>
> +R:     John Stultz <jstultz@google.com>

I've got some learning to do, so I may not chime in much, but I'm
happy to be helpful, if I can...
Acked-by: John Stultz <jstultz@google.com>
