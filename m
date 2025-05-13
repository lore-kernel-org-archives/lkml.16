Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997A1DF27E;
	Tue, 13 May 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152177; cv=none; b=GP8zy0NPZ5j4lAV7pfyj589dQd5RwgBeJikfBIXQtedQ6G1QTf+YUO59KiYYTWqDJs4xZ54F126DZK0VQkJ/yxKQhyOJNsnDFxWHOOfufJl7zeKN70M3r53VSc3sxC7V953Mzq8G7RuE7y8rym3cPAw/iGUHSJFRlT5Kvru7se0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152177; c=relaxed/simple;
	bh=nfcHJN9hQqqn/ozSJncMmWEv3YN9boG15TOlNeIMY8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8dxZXdx2fsr9Zr6RUwG65aoScQKHum40vRhQ/wAOEA3s9L1AS3CyhfCZ6aBlZiigkreQJRP4WJClT+76uZCJ9mPV6kuIichU5RB0Gn8cVn/Z9qpAFY9WeNAl6tNMXaeoytLHM03Mc/csSUPPXGoz8BB+wug7HKvLqHx6/O0tew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwEF/oUd; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwEF/oUd"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769aef457bso72055191cf.2;
        Tue, 13 May 2025 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152174; x=1747756974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFlarGIZbuQORh2qgUeE8MEhV3Iu+lLbawRraNX6pWU=;
        b=BwEF/oUdGJ9lfDcIzxhqVVzxzNsu/PB0BB9g6xUl+oeqLZ3aNk1GJ882IROXh9DKOB
         V7W3yBXgraEffTWkyBjJEcbln0nxL3/U1tpWWXMRNM+ALRCAJ67BUbrSkUEiaT5de8Et
         oANYZA40MRYkV9lhzK+sToX0ENJES61Gtz7bSNnXNdHDRFhaQ95vgDvmN6VTBMXXfLuz
         Pj1ZvvCE3G4yXGemxhOm55gIWfQGkONMBlPgyRfZft5a3OHKxxNBDGFnAqKPJn7gZ13n
         yOkpBrGT6ogCBLQiWcWXvg604wPgYVDlTzIj/6LyqH5O3wkgdCzVa3bR5oeSO//TWAS1
         5DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152174; x=1747756974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFlarGIZbuQORh2qgUeE8MEhV3Iu+lLbawRraNX6pWU=;
        b=kkY1qcZE0g54f20/F/fTgKYwquW18PTywFbKiwhdE36Kndwnn0qQtaqgTxbiFQqTov
         DYLrlNpUggjlgivTdwbO7Fmu+AfTW0Udpzp2a6mm867qHkyRihSHTGsqtc0SZy/k2QEb
         DPGw2e3RZMFJCe3FWl0QE6fT6dJ4iDz2WWPj14XSJiR89E+CFKpZZS1/Qip7cpDDLv13
         KgiImsa0ZA5yXBUYYXD0JBblEUfQLP66QcSBWULY0xqiHQwPMDAUKm/RhjJ02Ury5eFW
         YTL5UQKCPfDVlTKoSsLSkB8ilqn/Uk3SOj566W0eoERATcxzfCNCS6onP+CL01DjApaV
         zILA==
X-Forwarded-Encrypted: i=1; AJvYcCVNlxzZxjCAlQYhCgt1pbS4ku7igsz5+YMGZNvBsmYUUgt8wM3i929fKZzh4rKNX3mZ4f9ouYpZHqQ7ZzYO@vger.kernel.org, AJvYcCX06vnIat2bNDX/KuX+uvoCwU9dLzwMWqUhWmNUI0YgZ0+AiuwcX8PlMfUQXIPfuRa9p2MA+6RxT19h@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSLw8MlowGtD+WvSa0zhA66rWqYkHJ+LXJB85DfGCFbWmcJkg
	z4Q+zdDNojelV+Ti3H3EdDDyLxsLav1kFNvFGHA1juXJ8k5JYduq0mdCjbdQgqgMiFAHCB7TP1m
	RFW1Xk3WiwlypQUf6AJjuZuzz/1w=
X-Gm-Gg: ASbGncsRK7wCMlQ06reHF2l7XK2Zy3Onc75DJWTkMT8dA7sGtZsD7f4vn/OeINy/oJE
	t8tlv7c/oRWe0u+vY4bqf0Az/EPNKqCLpcct1sowJRY8VXShCn+SPofARzKiLusgRdJ5e+apxYf
	aR9MWsQvdk2oVPGKuFZtBFj6owHy4fIzM0YU33iv8bo8c8kTuL6gGwupGEe5UYuv7k
X-Google-Smtp-Source: AGHT+IG3PLifiu+mZA2jPN3ZVpz43f/9SA9dmuLsIxO7VNUcUv7jPw9b194uMEzse2n5i4aBdHYhAEzotRLN5auThVs=
X-Received: by 2002:ac8:7d51:0:b0:48b:77:800c with SMTP id d75a77b69052e-494527d4d3fmr320683691cf.32.1747152173923;
 Tue, 13 May 2025 09:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com> <aCNLyYtxmqqklBN8@mai.linaro.org>
In-Reply-To: <aCNLyYtxmqqklBN8@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 13 May 2025 20:02:42 +0400
X-Gm-Features: AX0GCFusUXlohpeDcpmxO9GVKlqTCKC41cu3fuI99zLLV2M8AmlIj0DSeXXVvbw
Message-ID: <CABjd4YyX1nrM1qREm-dtzQUCM=TH1L8w7KeZ4ZUxg7tNH84TJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 5:40=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 07, 2025 at 10:58:32AM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia system timer IP can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and match register 0 for watch=
dog
> > respectively.
>
> This code falls under the watchdog umbrella not in the clocksource. It
> is better to find a way to make the timer and the watchdog separated.
>
> The timer-gxp.c is dynamically allocating a watchdog platform device
> with the shared pointer to the timer counter. IMO, it is a good
> example to split this up.

Thanks for the pointer Daniel!

I guess in this case I'll need to pass the pointer to a full
clocksource read function as platform data for the watchdog, as it's a
bit more messy here than timer-gxp.c in that this hardware cannot do
an atomic MMIO read of the counter and needs a synchronization request
to be issued and cleared before reading the value.

The clocksource code will then only instantiate a platform device for
the watchdog when it can ensure that nothing uses the first match
register.

> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  drivers/clocksource/Kconfig        | 11 +++++++
> >  drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++=
++++----
> >  2 files changed, 67 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38=
603dae485db71cfc7 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -181,6 +181,17 @@ config VT8500_TIMER
> >       help
> >         Enables support for the VT8500 driver.
> >
> > +config VT8500_TIMER_WATCHDOG
> > +     bool "Enable VT8500 watchdog functionality"
> > +     depends on VT8500_TIMER
> > +     depends on WATCHDOG && WATCHDOG_CORE=3Dy
>
> if WATCHDOG_CORE=3Dy then WATCHDOG=3Dy because the first one can be
> enabled only if the second one is enabled.

Noted, thanks. Will replace it with just WATCHDOG_CORE=3Dy in the next
version. In fact, if the watchdog functionality becomes a separate
platform driver then it could also potentially be built as a module,
so "=3Dy" might also go.

Best regards,
Alexey
