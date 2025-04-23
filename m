Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275126C39F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405912; cv=none; b=E44w+fLc/04gONs6QXbu41to+m+pjdiKRYPobOl1duTVAat2PboiPh1qxKRnOKNg7KLMQ1uJvxtkbaOIDfjj+yQ7aAkc1rkNCPpNR51F4HwE6vxRuzaEe4h+r3fokUg+Wp8ZLpO8hJQY2XDiSqrbG6BrG4NVZ4KZ6E3i6Nzt9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405912; c=relaxed/simple;
	bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDrfmsclV49iv2wiGDaePainHGFtdPlTdDFyCaeaoTgxIQnNZf6W4Zv8wBrHei7u9ROrY4BWzdy/7QzCeDOjOsm0Q8QpzmADTNDvL8wA2aB51YeP9sC1bGvTSf1vg8G3JmP2YhzbngVm8eDG/hhCRQDYz7p6Zp3InUrhx4LAO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHdBjfPg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHdBjfPg"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c090fc7adso6737606e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405909; x=1746010709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=UHdBjfPg5P1zHNPre//FyPAD++IeWIJjK45MNc6nIm+WWgGVThu7O21Z75HIGiq2f1
         +2iY+SqUAOOmO8Fr5pTHIMZfyr2DbF5QbDELNDPh+JvVbFhvvf/qkFa+G2rm7JMYMsvn
         ySmxoJM79xSiJDgB2b1lzA5ATdBgPrZW4bPvbe0/5XaHiKW7USYm9TcW353agdy2ZPsc
         /lpf6rKlz5n/bsoSOkZsPRtjxTIXtSqTNWYzkOfUH6+DuweQZNASPG+fY5tUGvQdd/xm
         2qaWEcXq3f1zpGenk+g6zA/l4ZNQOm76u3zAGoCHwj+6I1G+J//dc1/cJeRxyAWHmxVF
         dQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405909; x=1746010709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=RuJ8d3cHZC48LF1eqgLwRqN0LNhazuhDb6D4iRBbqvmNBjPw6F1B3xYqevFtnQQLtO
         z+VgcwrXTtQSoG4yKSZcp2J8Fu7QQTgRSvcg7schGvgwZJPesTTxRgJt7BFn3nAw4S+t
         dacIUhUMm/yMH0Ls6mtK2u9RbyZOCX8BqasWcgJDz3lmK4BS0YnpzHezkoh4YEDcJuio
         Z10xzO2Wy/B24VXgrWK4vT9Dec4u2G1SDc20JUlJhJA7mvIq11D9PDFz/DLWixD64YxW
         I2PojcLIfyRE7U7uoivER7VToNUG3is0yArTxl6Nz3kWHnE1jobxIBgHLQ8vz2iNY4l9
         xXlw==
X-Forwarded-Encrypted: i=1; AJvYcCUeb9j11oRstijO7dvfUf/zIKCTN9on9j2HQWngRbRoOwqfkCeNwzdM6blP+07x8hdr+BcJ4Ls+nbfyv8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzebhkfj3ipALS6SPOWfFBlivzOSiNW7Ho/OrjTtDkaYeXmSHZI
	P6334cdicj6IWNLSBtCKa+w/3oPYFwn+jYfJyTCatkXt9NitllDer77Z56p+e7qyz7lDBErHWWR
	88ZZR0TfwpJxj9k/fjE0N8P3JKwUWoMOKS0WeDQ==
X-Gm-Gg: ASbGncu+u/NWsnMQRIETfysN31rt6NiCLeKUDRMjH1ytVbwW0YqKjg7URfZvC7XV57+
	Kne69loV94oVaVkMy1Jh655jbhLz0TgIYJ+h9g96nrYAHVmD5v49UfwmPv0UloVHT1c3crclpcS
	ZVctyuBGFm7E1qTRC8oxojZI9YjbigM0VZ
X-Google-Smtp-Source: AGHT+IEjS24jEIugO55xavRjGHILXYER6m4q0amlIjqOd7Xvxl7wCjNSGFGR0t0e9qberyDj3AV0pmDzW61zJwcHqaE=
X-Received: by 2002:a05:6512:ba8:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54d6e6629b6mr4831840e87.53.1745405909021; Wed, 23 Apr 2025
 03:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:58:18 +0200
X-Gm-Features: ATxdqUGeqKFeiJHfrdFM-E1Ot1VyXqrfMLSq32rxhf_gi-bzXxhhSJyFayC6FXQ
Message-ID: <CACRpkdYVf9C+QZjFZZ9J96FRtoS8mowzyrmCcYmvV2uGTgcmzw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your persistant effort in fixing this!!

Yours,
Linus Walleij
