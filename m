Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A0285404
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248368; cv=none; b=X8+dQtUKS7UgC22TOJOSwJ2tQTsaFHfTIa3M0orMKMpmm/L5nRUDhHKHmo948Naywg439/LEl/izcxDMVXJiLfcw8PdlxRqlV+CB2QXjLWCtJXrXoZmHpH0DygYO/9QuhVkRJ5SuJU1X5YWaLLyvGYMtQqScgfoHH7vz4S5IGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248368; c=relaxed/simple;
	bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAzA5XG03MY2hj3s+Ku23+GB2ue2b+TQ+jTr4t9fao1aB53TWG733J+z79kL1QYYxbAk0ZPN66AE6l8msxTOCfphOTpC0LA/kGLigwa3KBL9aI6d+vZlEWk94RV5VqtwHqllaIiA1Ceszpm3E6ARr9TNNQvkWab1y3gGxn1yDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFYZfJnz; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFYZfJnz"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32addf54a00so56009761fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248365; x=1750853165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=dFYZfJnzz8WZOjQ/jVt0NBm7oCvXgNJpqC6Eca3/ascBl+JThXhTFViuYhiznoXNLE
         Xa8TqHpgO7noOG9A3zQOm+SRM+g3JkOKOkUQ56D2VRt0jYksEpwV/xK53bkqbRitt3Th
         3i0H+cVTIDz0xL6lhK4WyISjLVxCUAnySDaga/Xt+pdcYQixylz0XLReerhnWkLg7pRZ
         V4VY83xJcf92V517g2PZvHdRP+pcvjNWXWOm6aIDGnMXRsOYRdpy0JEbKTkEBdplGBu5
         t+5kVbsSFGQCA/TPHnGaUYoX1HWMyPQ9sWmkFkx1rOrJur7S4TrdCJ/3xRsbOms6qgCz
         Ph5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248365; x=1750853165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=rs/s00uqGXDKo93wTg4o6c9a3RaYPTyp7RelHoHuiFIrJ7usbDOqGHKE7KtGuc8t3Z
         NU2i9ryToZ2d26kmaJJT/T1lTobBpDSKDlHxU9RYudSWhkj0I+u1tvFeH5uKo6Gts8aI
         THfp+uoE75nPgCYp8tDdg1x7xpzjTSPkeN+rBqbUzuJ3r1CJqWu3DgJueyRe3s0hXl0h
         tzeIQ+1faAC7dH25WkC2GPGRItfGyaiSxEzYDzdpc26yCR3VW1fX+o3iQRktupM4DbYW
         JXAKD56w7i0SgA1T+USb2J72mLv9SKE0Vf06qx1pg5D6qsaQMrdhsMEjhwep6vrAkKUd
         6Xaw==
X-Forwarded-Encrypted: i=1; AJvYcCXP8Rf+NoHTWHMijdaEZlnAT09vTJFCjaeA6BrO0GcwYFzUIF1NJfD8dnZD6skaVYoZ5TRZZjxPpaxNaCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOU/IyMF74NHI7AvbZmwyEUITC01v/LZdjpMHHbpYEuuPIVXw
	bHjfu6JZ6721bk3J1EVnutCDktlPdFjYkvjWI4Iaaho9SkntXZMQ/3hdyeBRsl1Em0H23Iwmjx6
	FbH37btw8QSyJn23um57pwGGw55/KD4B1ibeGYjJrPQ==
X-Gm-Gg: ASbGnct0xNtRm3ak0N1RahHdj2odTCKdwK5ePGWeAr4t7Rb3uGHsJm1ii+4paVhd9o9
	t/2kCLJ1wacnf5Jk/VY6r7dRwjOAEFb6adHMKhqiWvLSf/MWQUlL74nmxOo0reb5+RLBpEkJgmm
	yVyadNlJM2EBQZ4yVwKzKAVeib2ifop4LcO7raALnskRy0w2dpp9bF8Q==
X-Google-Smtp-Source: AGHT+IHX45QNOrSIJj3G2Buvowk5UVZrkDeOZZtLRBUP3Ikuxx6tV96sZ9aCvKwmf2GYXljpSaZA+m97MagLrCE4y7U=
X-Received: by 2002:a05:651c:544:b0:32a:81a2:ebb with SMTP id
 38308e7fff4ca-32b4a2d8910mr59681261fa.1.1750248363616; Wed, 18 Jun 2025
 05:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:05:51 +0200
X-Gm-Features: AX0GCFuR6ywo5MMooqLH6lBxOOHtdfd0tMD2FLmLdxJO_FPZD6GVp0IlKcei7Uc
Message-ID: <CACRpkdakPywi9=wwMNREZWbT5=VrJP=vzZVuyE0S+FCDX0-mEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: cirrus: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in cirrus pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
