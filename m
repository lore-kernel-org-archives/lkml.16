Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC5149DE8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665561; cv=none; b=sWO7+J1ltG90/drGd0hZqoj/b2EhHR6ZG6Bdx4L3Gkf9WIL4m/IqG6sJMXAoaLzUbM2zRTSC/PxydxO0m/UuopzcZybYzBxerj2yRCqK2HzOyWSjgVwIeLLSpeQU2mURiRuZfBc53T4oEHo+RL6AWDaUEcnI+qLC0N38EUOu9r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665561; c=relaxed/simple;
	bh=pjCYEu+T8+MSu+Y4AtQlwN2m/aFPkSagdtGGVLNEyiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6HBzAeJmxLZBG9E1v03R2IMpL/IRSUsQ8aGr8WD6E5kHKrBKA4Qdbby9p+0LVAcI3nd6kvnEnvpoXttj9sCmlYK0sVipxezts3Wiu5/aH2ON9HLD9kLGJufDAAERwGnMsLOPwRnBO4E7ZSJZ0moA1UkaKdhMZfvA06g2CkPaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WS4BNiJG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WS4BNiJG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b165c80cso3660284e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665558; x=1751270358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=WS4BNiJGbaMckDcZ+88ElGm2nnREtxUBndMHfSjZxhoGecjKP44OJZQPiOsw+8ob4m
         p96j5AIGl83hj6q2u3Z6du1ilBLJy1QAw20X0je3mRaOyWXDTRQtgwtazU8LLSdMdS2+
         pn4kIaFhxXroseFGRuGhYVdfbLTNRsxz2umEmc113Ebmydn0IOCJ3E575EA7jK1lIDdJ
         /1hLkykLQu5AmFqlqyybG3ZGCzA5ff7/+Zq7vzdtTf3dp6vY1f5csXjBqGndv1gyDUlO
         YZ7ZCMZNMiUyBMEgmrRASrduhnM1JaHXLkwzYJ54gBEZvl/PDx19/p6u7y6CwggKUWbg
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665558; x=1751270358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=HnmmavDpBr5+rIcI7vK5yAXK5tcIPAa0nWaZvtw62d1GioKO6rYhKEE8fIMpHq8M97
         zEJjPPmtVrBe1kpyG6SEMx4mCmTS2itQRaLiHTldope3rGwD9zMrgeJ5jLwySZylSIQh
         SQvnEDnsE9aedWiTx09c8ffytKFWGGnqu+3ET+1jXl/TCOp4RWwe/2WglcqgHWyx/BKE
         6uIs2yVtNHWdrdYX16xW12DUfAWThDIm0kOc8BOb7nzbB67VwaUwNDlgPFf/ASuh8Uhi
         gzLd6Ae9aok9GkWD3Wlmw1Y3TwxnMTvrtOCf/mSq73zyboqa2jU9+e8RRSPFNWBasRiq
         xv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpOX68o0mQ3YOXJihlYqWAfWp2sGVP2aAqeK7sS9FT4NI7RPrcXzoHmoG/hO5WjrA9YWWWXqVfcCY8CDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3s6GxAjd5KiwfZET7l+UJXr6w8f+Wzm6c+WiPMwd/KKGLeAD
	3zT69yNtLSwWaLkr0oF7XiTK1N2mWJJK1D/aWKu3hiL/Q8tjA1sSkyQl6U/kwZl8jGvzsu5vX3L
	n7+gfysaWBGk7bMy1VmO6xEgJC+RL3aAhB6nVt7JbAQ==
X-Gm-Gg: ASbGnctTc/C1Up6uS2DWh7sfiXM4zQ/K4DLN1uNFuEYtwQeFWhuIgPckrOopWbpkiLd
	Ojz69fS4InFPOOfWtxciVEv8erLBd/rOt8G92DMgXveqkLtaIDmz+Livk5/b/4vT1LOrnsnq3de
	tDXLDrCPlAxKlJaL1RLwjkF1DbWJBTbdaQA1x8y6d+dWHf6i2GrDijS9J5DEUWtldOq5CZcbFF2
	w==
X-Google-Smtp-Source: AGHT+IH+6LTwSV3jwUqV3aPvfnzYjXE5iOgYqlBgzZnEHwJGAvMDmVnjyWJSTqk2dHdZCzhIYeV1I8Q3DyqdMFZFHSI=
X-Received: by 2002:a05:6512:1056:b0:553:b052:aa8a with SMTP id
 2adb3069b0e04-553e3d259afmr3639343e87.55.1750665557990; Mon, 23 Jun 2025
 00:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:59:07 +0200
X-Gm-Features: AX0GCFvWIu5ZKsG_6ucxVHVp5MEFaQgRXOfRuK6Ma_rPpGs558LExeSTdVQ0gY0
Message-ID: <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value setters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Never got any further feedback on this series last cycle. Resending for
> v6.17.
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       Input: ad7879 - use new GPIO line value setter callbacks
>       Input: adp5588 - use new GPIO line value setter callbacks
>       Input: adp5589 - use new GPIO line value setter callbacks
>
>  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
>  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
>  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
>  3 files changed, 18 insertions(+), 13 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Dmitry,

Could you please pick these patches up for v6.17? They already missed
the last cycle and we're on track to complete the conversion in the
next one so I'd really appreciate these going upstream in the next
merge window.

Bart
