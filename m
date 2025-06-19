Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55623AE60
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317709; cv=none; b=Ogxj6pwiYZ3mwgvbHUN5U8zKlowN0vOZ8D2ebQ8FPNYsfsDsqG0nXhlkGzImWyzn5L6U6lUE73+NOInZNpvQZJMTr4EY6wOeQqxUaIlrL1DPD5eGrFNCLtyWfgY3uqTkje7Uarj9jEptH5oQLv3749j8yTPOy0j9Tjdctv1EgrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317709; c=relaxed/simple;
	bh=JzJWHis4wkaAT5LGBZYcjeOsPjRm/vt6Rf3X3gEadcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqqLB/HYUiAj0oxLyQMMOsMKWbepzGmKnyxDbYGoZmzaxIUmVAzCknMEIK/raeUvpA9z36k9Rv4eoCS/HuajCCZONfhILe3y/XyQdntY4YhZlokmUXFgilUgmjoJNOt1fGXTsgba4zEGVr8hrBLJGeGwVmEkJDKcyd/fcVh1azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nsJI4aCh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nsJI4aCh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so442745e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317705; x=1750922505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=nsJI4aChNE4VXcwvzIE/aT5hcJ83Lg9kyktw4LSt4+hft1N3+8C/SL5VFi6K0g5rAy
         QS7En0sgBoiShCA4udYlkLfBzFNokpUEA7zZIet8Z3JLgwN1rADwJyu/ZzRSgKLZaCU3
         Prw2mDl8cJriy8vKWaXuv1tR1jrDeTg8n3xIj/uxupbWIrIRrOB0aZgmbJo92jlkCjfF
         FbVRqdt5ctij+RmpjOXVM0JFSi4PfuxYa+/QSAQ7aj1PmEFkcKTG/0YPrvR/DMTERZ3i
         BNKQxMbUK93wc/cCbu3SBokXyOsB/lVbR3EEKtV6s5y89ka4qgrYYh805ylSlXnuvAs/
         wURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317705; x=1750922505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=ihB2Hd8lis1G18QJEnQZc+Tt6nau74PN+J+BeEmFlC3C7if1nviTqXvgcucDbIhhd4
         UTObbYh03FiOM0+wCbdc3ZuNAnyQ7jSF2qVDCf9rbYshq/IqiboRNAk2kqDVSpJnvE0j
         AKZbWYJ8EV044WMM/c1R6SdmTK++/rK01e8dlUAbD5zl+yVvEI64rUNSjdJ+WuiiNM5V
         YmY+S0Xztft/9avT9InlAKooG9vuyzno3//Xp6r+1KUnZdGXkWw1TlGpCK5wzfsvbq4U
         Csy5TGnP2zL8A4d0IiL4NpjYGz/g58oM3iWB/0UgpHFUCjY4ClXu9JfN1kNRyjHo8ti1
         F+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW5fV3FcZXqJOQ533e2cJKBG3gQzeEQhMvX8xv08OoLrnxXI7gl8nz6hSKQgR+xBR4qVaICyh3ux+ipz/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6c4uPH2Jn+QLmZR5Q9P5/FEcZzGaLaw7eo/eeYhBY6DOXZ1n8
	LPwOIQD8ur1glzAAPK6SIwePSo0LIR0KBOCUt5XImP8rJaIqWC7ulLyZ1r1dhR2T0V6IFMFi+v4
	mW6kqLWVQm6pNGUmA0hAsvtIglNDBEfaV9FZp35IkHA==
X-Gm-Gg: ASbGncv4UoaXEkcmkSHILEQQXJ3tbObekiGyNdNehd553+6Qk3nc2NKe3Krcyb+qSdb
	S1b3NffFCPS8rhmk4bc7IyLOws5T54fV/2tg4ZrPP7MPr/qNU0dOLxKYIPd04B96iuR5HAyGv8Y
	FeL//ew7/uF37/SumTFceGC7lsdLQDFBSnQRHnVJBexSb+oJipytDS1G8+Yl6iQIjqMi34YJhq9
	XM=
X-Google-Smtp-Source: AGHT+IEh54Pu16jXn4P+irLbn846Wet4MTiIBtxZ5XCuFceE2ajC9TqO8oRVjTcWCkeViL2vbItUiC+8YwBhD/ZWW4o=
X-Received: by 2002:a05:6512:15a4:b0:553:50c6:b86c with SMTP id
 2adb3069b0e04-553b6f6b5ebmr5729673e87.57.1750317704976; Thu, 19 Jun 2025
 00:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com> <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
In-Reply-To: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 09:21:34 +0200
X-Gm-Features: AX0GCFvQx5dYUJVAAbuivosq23yF4paNEi7sLTcojRfNtcaypuIpqfvXVp5M46I
Message-ID: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:45=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > I have a rework of gpio-mmio in progress that removes the bgpio
> > specific fields from struct gpio_chip. This includes moving the flags
> > into a separate gpio/generic.h header. I really need to either apply
> > it myself or get an immutable tag from you with this change.
>
> OK try this, if you pull in this to your tree and work with refactorings
> on top, everything should work out fine in the end:
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> tags/ib-gpio-mmio-no-input-tag
>
> for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:
>
>   gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
> 15:40:29 +0200)
>
> ----------------------------------------------------------------
> Simple change for no-input MMIO GPIO
>
> ----------------------------------------------------------------
> Cl=C3=A9ment Le Goffic (1):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>
>  drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
>  include/linux/gpio/driver.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
>
> Yours,
> Linus Walleij

Hi Linus,

Sorry I didn't notice this one. But I see you already responded that
you pulled my PR from today. Should I ignore it?

Bartosz
