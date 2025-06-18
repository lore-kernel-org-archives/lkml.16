Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD1537E9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254354; cv=none; b=gVF01ZznaXel0Y6b8F9jz28vhZ8x4sU3Y7MELTyu2kIQAKEXQBi4Yc8QXJ0hb8+GN1y7cHr/+VLo0EfQRT7lEYRjup6w2X7SJGZyGlPuiTsU6QuvLxx7/grbO+r5r+LQlelFO8zbGaHmrL6FBqUBcIdPCq/okd1vYj3uacYLsb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254354; c=relaxed/simple;
	bh=19E5xzem+HM4mzJ9G9HwPWEjZc+eWYv4kOOjLaWu+OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/wkbdFsATH7zccvIYtJnJXCMYVXrq8UbxVXxr8Ousf2NBS6at019u95WJUPr2sGk62yEpsps1xH5+UNoMpy1qFSTm/rD4+9gW35JbdLmaRG7ZK4l2vuT4s7DPdUsPFdAGAmZk4xro1EvCStgYRE6cbYJM5FTkEElSMmtoaXP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t74qUHsw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t74qUHsw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4201012e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254351; x=1750859151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=t74qUHswVgk4QQi/Chb/sCj05d5tCoRzQfMtrKHm0JOvhU71i/fceWJ7UatIzV1TjQ
         LZoW5Ec6a1jr7Bg2S0bqQlbwEDvPEd75IbqIgS/DJSVEptdC9BjTjaeXuMdsVUT363Lq
         EWVeNWKgKcZtE6Rmk866hrf2PHDTPzx7eyj1T5dKq3Nsq1mfAdyZW2xCzySyIUspen4W
         2ddQICNPyEueT8rDWqSbBuv0ecfz82Q4X8gq3coM8PJ9lKpSVdO5+3EZGe1ac1t7Jxtt
         H2tRJrCMjFFEoonVK/TgTQ/9fnoa1ZQpyP1agDRkL5d4qq2WZCLLVWxacZKA15sgV0s5
         MU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254351; x=1750859151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=mYd7csxPwLBOCMa1aE7oa84JmJUo7vGND/g15h4lKsHR5xaOvSai7EmsWx85J88yED
         FE14LacF9iumEk5FBYgLPzmYPyUQpEimxqe/JizK/TcGiVZmUhyegXAYOUVj1ZZS3WMI
         U07Hy6z5iagF7B8RSMknXiZ2/zyUJwr48bqKJCG5DEeXB2KLJ+5+ognKgF7fAg9Q4n3O
         lwVipLzUnr65F5r5dUVmj8cwnF/edFlYvbNTmjKyqGJ7cXkO5mxk2R+CApqGIK8qxupr
         3kgKtQWrXidpM7/qWQzRInZmv4WbglUaZi4fiuCP26GtP7VF5wj1kKeEZPbf8FRwtcJb
         tu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwJGacp3LVsZfnezwd0TUYF8X4NtKZhBtWuTHdAqx+2/Fg3l9oQyMpxQVwSjA2jk51hhOeJh2Q11o2mKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XGt9RPjLerpk+J/nDqkiS0JJkmQ/3I5IYOxXJ76MCZzXRTQb
	vcp18mC9fPGZVntWg7S3u4zoHibBdLn/HRHea0VEA/pM+xsSlwZozhB/3SvsrNtxSZfb5iQZw+s
	rAUiuszD378pTngiujkeyx06+md7gfQKILAieClt69w==
X-Gm-Gg: ASbGnctauqsrsJLebSviSMpe7MDBcQ/lnYx2Xin7mizeEfU4hPm7YtiTX7Da7DH63xV
	5k2kR3BJx3eILu3Kk2wbbkwDAtjxkxjrmZHGeAp1k9y83i3eT41b2SOwAGL+7Rbo4bXqDa3WYtU
	jVGngGbtSTLvWHAMx1PmP1EO2o3dIdrP1AvN6Vpsbvd9Y=
X-Google-Smtp-Source: AGHT+IHUziRG/lS1am2zFPjRrmYzIzsrLZlEENKDKAFZ3rfCXoeUyGuA1Pal15qAwexM+uRj2zqwrZ6IAzL5/+4dp/E=
X-Received: by 2002:a05:6512:3c9c:b0:553:2f61:58eb with SMTP id
 2adb3069b0e04-553b6f3f11fmr3977179e87.49.1750254350731; Wed, 18 Jun 2025
 06:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com> <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
In-Reply-To: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 15:45:39 +0200
X-Gm-Features: AX0GCFswiuSIv0ost8RQF2yKzjiS_gJyepvrD4dGuyTD_K-1OJ1mJ0Mc6pZHztk
Message-ID: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I have a rework of gpio-mmio in progress that removes the bgpio
> specific fields from struct gpio_chip. This includes moving the flags
> into a separate gpio/generic.h header. I really need to either apply
> it myself or get an immutable tag from you with this change.

OK try this, if you pull in this to your tree and work with refactorings
on top, everything should work out fine in the end:

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/ib-gpio-mmio-no-input-tag

for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:

  gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
15:40:29 +0200)

----------------------------------------------------------------
Simple change for no-input MMIO GPIO

----------------------------------------------------------------
Cl=C3=A9ment Le Goffic (1):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)


Yours,
Linus Walleij
